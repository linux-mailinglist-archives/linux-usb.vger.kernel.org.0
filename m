Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA48B199CE
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 10:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfEJIlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 04:41:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39196 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfEJIlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 04:41:52 -0400
Received: by mail-lf1-f68.google.com with SMTP id f1so3554518lfl.6
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2019 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XWVQYZW0e0mAZnrT6kZIleP94afetnob6Kz71W2tW1s=;
        b=nAlW73IIqiP2tVVMjnR5Ain4JH0DB31r8x+k6xd/94bonSpo+4/3BhVoBxIlFNW7ZF
         WJb1ow7gVrkOhX4mNb/hmU/ZaNis5dQK9hDK+3GmUfqAdkGJzIKjSp1OlWON/U0unlne
         W9Zu+k0kJD9BEqq+xj+BqgZ5PmP2cZVVMeC1BUqmqKKh6J5dGeoNMBIYi+S/2n+HzgCK
         ZV8nJ6KZ6O0PByYQOCgnPl5O/+8PgGGi3aykf3E4OJv41c6/dkBwoVOOwfyHUBH1KgKR
         KnOHE2K4yMLgcODMBA8Cf2qkiky9/QXw1f2/+TuIozhO8DXP8ja7spNt5yKlXx9JLYER
         G89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XWVQYZW0e0mAZnrT6kZIleP94afetnob6Kz71W2tW1s=;
        b=YkFFTNth/Cazn4S3By3AktgE2eIw3QAxAUfqZK+eljgt6oBR/mdRRJLvZBldheopep
         Uox/xPSwloBUgBEntdXThZDfOL2RCUgdFZ6QskYubMnxrx2BHyy8zQK5fIN/jO30CpOS
         ZGM82RXnIrkM+S21yK3GtCfRW4xtSAEt62cSSpObsQ4CUn1vHeSl17pTRgUAKXeCkpHA
         zjuIl5q8cO3h9rUuqOL9xZwiw00NkCUdxD1UttSh3+7ewsKwd540BqvMptCp75kTLPAU
         1jjyAQHLW07+jbu7yZ16jgmU9/VDEZmE+gQb4VEJDploBPuf5YSWcYxhI9wpjwC6iUE+
         S3fQ==
X-Gm-Message-State: APjAAAWLR1D9KR2SHN75q+yUbJ0w5W92ZsAVNr3f1R8pSMqcd5Ym4/JT
        fa17kKdTZHFzgjLJzUWEIBAHzw==
X-Google-Smtp-Source: APXvYqxa0gDwKVIvoIVLSvqZG4CvLR8GrbDD2gAgj5EAbg/qfY7uDNcZIbxKt344h2ssuiI4uD2CvA==
X-Received: by 2002:a19:5045:: with SMTP id z5mr5484946lfj.108.1557477710033;
        Fri, 10 May 2019 01:41:50 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.83.158])
        by smtp.gmail.com with ESMTPSA id o7sm1113095ljh.57.2019.05.10.01.41.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:41:49 -0700 (PDT)
Subject: Re: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-9-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c57f8a55-ef94-5b28-9345-88805de52ed1@cogentembedded.com>
Date:   Fri, 10 May 2019 11:41:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509201142.10543-9-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09.05.2019 23:11, Chris Brandt wrote:

> Move flags macros to header file so they can be used by other files.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   drivers/usb/renesas_usbhs/common.c |  7 -------
>   drivers/usb/renesas_usbhs/common.h | 10 ++++++++++
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 249fbee97f3f..efb26ffd9809 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>    */
>   
>   
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>   

    Why leave 3 empty lines?

>   /*
>    * platform call back
[...]

MBR, Sergei
