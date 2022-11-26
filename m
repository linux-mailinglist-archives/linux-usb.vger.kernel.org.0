Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7B9639560
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 11:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKZKfM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Nov 2022 05:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiKZKfL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Nov 2022 05:35:11 -0500
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4400E26AE8
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 02:35:07 -0800 (PST)
Received: from [192.168.1.103] (31.173.86.88) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 26 Nov
 2022 13:34:57 +0300
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
To:     Alex Henrie <alexh@vpitech.com>, <linux-usb@vger.kernel.org>,
        <johan@kernel.org>, <johanna.abrahamsson@afconsult.com>,
        <alexhenrie24@gmail.com>
References: <20221126035825.6991-1-alexh@vpitech.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <1c6a413e-dbeb-277c-ad7b-991e2d1970ff@omp.ru>
Date:   Sat, 26 Nov 2022 13:34:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20221126035825.6991-1-alexh@vpitech.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.86.88]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 11/26/2022 10:14:31
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 173778 [Nov 25 2022]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.88 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 31.173.86.88:7.1.2;127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.86.88
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/26/2022 10:17:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/26/2022 9:02:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 11/26/22 6:58 AM, Alex Henrie wrote:

> When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> driver reset the baud rate to the default of 9600 (see the comment above
> the uart_get_baud_rate function). Some old versions of the NXP blhost
> utility depend on this behavior. However, the CP210x driver resets the
> baud rate to the minimum supported rate of 300. Special-case B0 so that
> it returns the baud rate to the more sensible default of 9600.
> 
> Signed-off-by: Alex Henrie <alexh@vpitech.com>
> ---
>  drivers/usb/serial/cp210x.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 3bcec419f463..2c910550dca8 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1051,9 +1051,14 @@ static void cp210x_change_speed(struct tty_struct *tty,
>  	 * This maps the requested rate to the actual rate, a valid rate on
>  	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
>  	 *
> -	 * NOTE: B0 is not implemented.
> +	 * NOTE: B0 is not implemented, apart from returning the baud rate to
> +	 * the default of B9600.
>  	 */
> -	baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
> +	if (tty->termios.c_ospeed) {
> +		baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
> +	} else {
> +		baud = 9600;
> +	}

   {} not needed at all...

[...]

MBR, Sergey
