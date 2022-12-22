Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C810C653EF4
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 12:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbiLVLUc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Dec 2022 06:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbiLVLUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 06:20:13 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940FE2A261
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 03:19:44 -0800 (PST)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MsZBb-1otwNv1ERH-00u50t; Thu, 22 Dec 2022 12:19:12 +0100
Message-ID: <054ed59b-f59d-4354-8468-25f6c0dd6343@i2se.com>
Date:   Thu, 22 Dec 2022 12:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, regressions@lists.linux.dev,
        Florian Fainelli <f.fainelli@gmail.com>
References: <Y6Ci7wWvbBRRQkR6@google.com>
 <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com> <Y6ECMZeh7G9bH8Fi@google.com>
 <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com> <Y6I8L45rDhqBMfUZ@google.com>
 <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com> <Y6M5SPBpp/xMzUz7@google.com>
 <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com> <Y6NYK4/jp/QmusOX@google.com>
 <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com> <Y6OrGbqaMy2iVDWB@google.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6OrGbqaMy2iVDWB@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EM9C8clx6msbv66oRNFlP0QuPNGJjq8s56Nz8FCIhvFliCTPaGK
 NzxBacSg6fqLZqeCjJLY69tzV/hvDk0bk3bEtHSBnd3J3TLb3nk7XObwSTt8JG3LF9A79sX
 pvIfQUxF7rEZHyssq5idNM/7ucaB9Q0TxZ59MhGOcEd/C1uRuA//G+K5GzVkQrQoXWMewum
 40XEnk6RYkpZZCQGUsMMg==
UI-OutboundReport: notjunk:1;M01:P0:H4B0rsmSfiA=;lTlTGgV8wKycrNTAoJwlEuEXX2t
 bSXN39s1/bD3ZFNCagHrQEm8aetwb8DhjOMmtDXOZmgEI7GkrmriC3cdiqYMwjicJamiwm34F
 r9hhXHhkwjRoG3Tu9pnF/h0tSm1EV1wx9DdzLPcdDOJ8OoWcmOMm9CoSh7cIpw3ztzN7fCZms
 yEBHzhX53p5SBTGT+izL0HGiR8913/sFVNM1u0neg34EgZ4Mx5OqViNJpIuYcDdIMdWVY2fYK
 K6wH+atiixFMYhg03zzTWKPXQiPHkaECHtBbuDegDtAGRBfsziIlyI+tFWypKF1/5hZHOf6YK
 HOY818a6n1s+lTRas0Saf2xyTri3W31cxhG6cebSN6LoEdAMxvC1mGudgrrr2yU/US4zvJAuQ
 IZm/T56TYGoM/1kvdSAklnrgtOZQiQBF9J0YnhtcYlVgbx39G8fABZ3EHDUeOGL8q9miPQYic
 5Hj2+Qj2ZpoEgYxcyJEhndBc2ZyRW0sFBZTVVEkORBL9O8bwRN/bhpV5vMLGpm2PktMAjnUBD
 Frhbv1RTfW3qBx0iJXJ60IzLVZ0CWkPPEAqOMgtgPox+fiHTdz7l4kc25dooHbAf7Va2xQoGB
 3MT3y3cPz/NkNovRkQG1uUhJ5dckkEIsYEsswOQHy5UuHHKG7Ivf3v1clwMzMpch5cxZXEbQW
 yaj4Q6T9Svys7HeogUC+Jf9a1Skig08BWdW4wYqPPQ==
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthias,

Am 22.12.22 um 01:55 schrieb Matthias Kaehlcke:
> The above race condition could also impact boards which actually should
> use the onboard_hub driver, so not creating the pdevs for some boards
> won't be enough.
>
> Out of my head I can't think of a clean solution. The onboard hub driver
> doesn't control the locks involved. Detaching the driver is necessary
> to make sure the onboard_hub USB devices don't hold stale pointers to
> their platform device. Re-attaching is needed because of the detach.
>
> One option could be to change the 'attach' work from being a member of
> struct onboard_hub to a static variable owned by the driver. With that
> onboard_hub_remove() wouldn't have to wait for the work to finish. An
> inconvenient is that only one instance of the work can run at any time,
> which could result in a race condition when multiple onboard hubs are
> probed closely together. It could happen that the USB device of the 2nd
> (or 3rd, ...) hub isn't re-attached if it wasn't on the system wide USB
> 'bus' yet when the 'attach' work of the 1st hub runs. Probably a rare
> condition within the (as of now) rare scenario of multiple onboard hubs,
> but it could happen. A mitigation could be to enter a sleepy loop if
> schedule_work() returns false (work is already running) and schedule it
> again until it is actually scheduled on behalf of the platform device
> in question. I might go for that if I don't get a better idea.
i don't have any idea.
> Happy holidays!
Thank you. Happy holidays to you, too!
>
> m.
