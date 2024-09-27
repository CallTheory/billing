<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Call Theory Billing &mdash; The advanced billing bridge for Amtelco systems</title>

        @vite('resources/css/app.css')
    </head>
    <body class="font-sans antialiased dark:bg-black dark:text-white/50">
        <div class="bg-gray-50 text-black/50 dark:bg-black dark:text-white/50">
            <div class="relative min-h-screen flex flex-col items-center justify-center selection:bg-[#FF2D20] selection:text-white">
                <div class="relative w-full max-w-2xl px-6 lg:max-w-7xl">
                    <header class="grid grid-cols-2 items-center gap-2 py-8 lg:grid-cols-3">
                        @if (Route::has('login'))
                            <nav class="-mx-3 flex flex-1 justify-end">
                                @auth
                                    <a href="{{ url('/admin') }}"
                                        class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                                    >
                                        Control Panel
                                    </a>
                                @else
                                    <a href="{{ route('login') }}"
                                        class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                                    >
                                        Log in
                                    </a>

                                    @if (Route::has('register'))
                                        <a href="{{ route('register') }}"
                                            class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                                        >
                                            Register
                                        </a>
                                    @endif
                                @endauth
                            </nav>
                        @endif
                    </header>

                    <main>
                        <div class="flex mb-4">
                            <h1 class="text-center text-2xl text-black dark:text-white">
                                Call Theory Billing
                            </h1>
                            <h2 class="py-1 px-2 inline text-lg dark:text-white/70">
                                The advanced billing bridge for Amtelco systems
                            </h2>
                        </div>
                        <div class="grid gap-6 lg:grid-cols-2 lg:gap-8">

                            <a href="https://github.com/calltheory/billing"
                               class="flex items-start gap-4 rounded-lg bg-white p-6 shadow-[0px_14px_34px_0px_rgba(0,0,0,0.08)] ring-1 ring-white/[0.05] transition duration-300 hover:text-black/70 hover:ring-black/20 focus:outline-none focus-visible:ring-[#FF2D20] lg:pb-10 dark:bg-zinc-900 dark:ring-zinc-800 dark:hover:text-white/70 dark:hover:ring-zinc-700 dark:focus-visible:ring-[#FF2D20]"
                            >
                                <div class="pt-3 sm:pt-5">
                                    <h2 class="text-xl font-semibold text-black dark:text-white">
                                        Github Project Page
                                    </h2>

                                    <p class="mt-4 text-sm/relaxed">
                                        View the <span class="font-semibold">Call Theory Billing</span> source code on Github.
                                        <br>
                                        Report issues, contribute code, view docs, and more.
                                    </p>
                                </div>
                            </a>

                            <a href="https://calltheory.com"
                               class="flex items-start gap-4 rounded-lg bg-white p-6 shadow-[0px_14px_34px_0px_rgba(0,0,0,0.08)] ring-1 ring-white/[0.05] transition duration-300 hover:text-black/70 hover:ring-black/20 focus:outline-none focus-visible:ring-[#FF2D20] lg:pb-10 dark:bg-zinc-900 dark:ring-zinc-800 dark:hover:text-white/70 dark:hover:ring-zinc-700 dark:focus-visible:ring-[#FF2D20]"
                            >
                                <div class="pt-3 sm:pt-5">
                                    <h2 class="text-xl font-semibold text-black dark:text-white">
                                        Call Theory Website
                                    </h2>

                                    <p class="mt-4 text-sm/relaxed">
                                        Visit the official Call Theory website.
                                        <br>Learn more about our products and services.

                                    </p>
                                </div>
                            </a>

                            <div class="flex items-start gap-4 rounded-lg bg-white p-6 shadow-[0px_14px_34px_0px_rgba(0,0,0,0.08)] ring-1 ring-white/[0.05]  text-black/70 ring-black/20 focus:outline-none focus-visible:ring-[#FF2D20] lg:pb-10 dark:bg-zinc-900 dark:ring-zinc-800 dark:text-white/70 dark:hover:ring-zinc-700 dark:focus-visible:ring-[#FF2D20]">
                                <div class="pt-3 sm:pt-5">
                                    <h2 class="text-xl font-semibold text-black dark:text-white">
                                        Quick Start Guide
                                    </h2>

                                    <p class="mt-4 text-sm/relaxed">

                                        A comprehensive prerequisites and deployment guide is available at <a class="font-semibold underline" href="https://laravel.com/docs/11.x/deployment">laravel.com/docs/11.x/deployment</a>

                                        <ol class="my-2 py-2 list-decimal text-sm/relaxed ml-6">
                                            <li>Clone the repository: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">git clone https://github.com/calltheory/billing</code></li>
                                            <li>Change into the repository directory: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">cd billing</code></li>
                                            <li>Install the composer dependencies: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">composer install</code></li>
                                            <li>Initialize the configuration file: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">cp .env.example .env</code></li>
                                            <li>Generate the application encryption key: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">php artisan key:generate</code></li>
                                            <li>Install the npm requirements: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">npm install</code></li>
                                            <li>Run the database migrations: <code class="bg-gray-200 dark:bg-black/70 rounded px-1 py-0.5">php artisan migrate</code></li>
                                            <li><a class="underline font-semibold" href="https://laravel.com/docs/11.x/horizon">Setup Laravel Horizon</a> to process the background job queue.</li>
                                            <li><a class="underline font-semibold" href="https://laravel.com/docs/11.x/scheduling">Setup the Task Scheduler</a> in your system's cron for scheduled jobs.</li>
                                        </ol>

                                    For more information, please visit <a class="underline font-semibold" href="https://github.com/calltheory/billing">github.com/calltheory/billing</a>
                                    </p>
                                </div>
                            </div>

                            <div class="flex items-start gap-4 rounded-lg bg-white p-6 shadow-[0px_14px_34px_0px_rgba(0,0,0,0.08)] ring-1 ring-white/[0.05]  text-black/70 ring-black/20 focus:outline-none focus-visible:ring-[#FF2D20] lg:pb-10 dark:bg-zinc-900 dark:ring-zinc-800 dark:text-white/70 dark:hover:ring-zinc-700 dark:focus-visible:ring-[#FF2D20]">
                                <div class="pt-3 sm:pt-5">
                                    <h2 class="text-xl font-semibold text-black dark:text-white">
                                        Licensing Information
                                    </h2>

                                    <p class="mt-4 text-sm/relaxed">
                                        Please review the entire <a class="font-semibold dark:text-white underline" href="https://github.com/CallTheory/billing/blob/main/License.md">Functional Source License (FSL)</a> on Github
                                        <br><br>
                                        A <span class="font-semibold">Permitted Purpose</span> is any purpose other than a <span class="font-semibold">Competing Use</span>.
                                        <br><br>

                                        A <span class="font-semibold">Competing Use</span> means making the Software available to others in a commercial product or service that:

                                        <ol class="my-2 py-2 list-decimal text-sm/relaxed ml-6">
                                            <li>substitutes for the Software;</li>

                                            <li>substitutes for any other product or service we offer using the Software that exists as of the date we make the Software available; or</li>

                                            <li>offers the same or substantially similar functionality as the Software.</li>
                                        </ol>

                                        Permitted Purposes specifically include using the Software:

                                        <ol class="my-2 py-2 list-decimal text-sm/relaxed ml-6">
                                            <li>or your internal use and access;</li>

                                            <li>for non-commercial education;</li>

                                            <li>for non-commercial research; and</li>

                                            <li>in connection with professional services that you provide to a licensee using the Software in accordance with these Terms and Conditions.</li>
                                        </ol>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </main>

                    <footer class="py-16 text-center text-sm text-black dark:text-white/70">
                        Call Theory Billing v{{ App\Models\Version::getVersion() }} &ndash; Laravel v{{ Illuminate\Foundation\Application::VERSION }} (PHP v{{ PHP_VERSION }})
                    </footer>
                </div>
            </div>
        </div>
    </body>
</html>
