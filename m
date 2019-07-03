Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C980E5DC81
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 04:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbfGCC0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 22:26:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43514 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfGCC0e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 22:26:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so396879pfg.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 19:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9LSa6wcOyCAEFmmrefvYQyX7fTvyeHlG+veSDCcI4eE=;
        b=ZGzQGMEI0xBc+6ht3TyJxLoqzKZvxKS3cyCqFs5aNkK82JwWf02bh1UI6nY7VvlV1d
         uxCEdDgsuN+DEyiHLBmniA2W8TDStSwHNgznxmpeHL6R2gayEYEOJNRFT2roT+TZEonK
         aegVewSeCatWM1lQmM9X0xcytloRWyF8MrjaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9LSa6wcOyCAEFmmrefvYQyX7fTvyeHlG+veSDCcI4eE=;
        b=JB93i5EcFoymeTSZgsYGDVZIF3pKo9AVA1dUpovuW6BaV5bq2jVvhOzTP8m41r1ArO
         BeoFqNN2W4dJkhgi/AKsmLw440ii/7f5luso/CKG5ajml7vEEBH0pVmLc06wQHy30TiZ
         a5jM7BLfU474u8h7yzojpD+tfOOUw/aZ/kUsaCoCvVIYopt1Bh2RNv/6qk0I/5gHu9CA
         1LDZgkWTackAnulZEzjnil850p8y99YPHZ+L0HJ2VGOlwMRX+8yYC71TgigPK74ZIiZw
         wOYl+9p/Jry3xFrSxGoubmjqgwU/iwnC5bJfM/EuFbNGbBpM5D+6INuNW00OY1qEwOYP
         TxHQ==
X-Gm-Message-State: APjAAAXd7J5oepWlBPg9GGmJHIOwSG3MB/cLq8f9TuNaelCrvBshKXzc
        PpS5/rp4xZEDukRhue7HPqT5KQ==
X-Google-Smtp-Source: APXvYqzUnWHYQYw1cWjaDgpFIjT2QkKOSvq0HCjk5aFq7gXYzZR0rDEacBdmW9A7MSnrcYSG4GBVCQ==
X-Received: by 2002:a63:d756:: with SMTP id w22mr33125752pgi.156.1562120794171;
        Tue, 02 Jul 2019 19:26:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y133sm404949pfb.28.2019.07.02.19.26.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 19:26:33 -0700 (PDT)
Date:   Tue, 2 Jul 2019 19:26:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        hans.verkuil@cisco.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com, glider@google.com
Subject: Re: [PATCH V2] media: usb: technisat-usb2: fix buffer overflow
Message-ID: <201907021925.1F24D6ADA3@keescook>
References: <20190702140211.28399-1-tranmanphong@gmail.com>
 <20190703021444.19954-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703021444.19954-1-tranmanphong@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 03, 2019 at 09:14:44AM +0700, Phong Tran wrote:
> The buffer will be overflow in case of the while loop can not break.
> Add the checking buffer condition in while loop for avoiding
> overlooping index.
> 
> This issue was reported by syzbot
> 
> Reported-by: syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com
> 
> Tested-by:
> https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/t3PvVheSAAAJ
> 

Avoid these blank lines please. (More below...)

> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
> Change Log:
>  * V2: add IR_MAX_BUFFER_INDEX and adjust the while loop condition as comments
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..cdabff97c1ea 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -49,6 +49,7 @@ MODULE_PARM_DESC(disable_led_control,
>  		"disable LED control of the device (default: 0 - LED control is active).");
>  
>  /* device private data */
> +#define IR_MAX_BUFFER_INDEX	63

How does this map to the literal "62" used before the loop you're
fixing?

Otherwise, it's looking good; thanks!

-Kees

>  struct technisat_usb2_state {
>  	struct dvb_usb_device *dev;
>  	struct delayed_work green_led_work;
> @@ -56,7 +57,7 @@ struct technisat_usb2_state {
>  
>  	u16 last_scan_code;
>  
> -	u8 buf[64];
> +	u8 buf[IR_MAX_BUFFER_INDEX + 1];
>  };
>  
>  /* debug print helpers */
> @@ -655,7 +656,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  #endif
>  
>  	ev.pulse = 0;
> -	while (1) {
> +	while (b <= (buf + IR_MAX_BUFFER_INDEX)) {
>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
> -- 
> 2.11.0
> 

-- 
Kees Cook
