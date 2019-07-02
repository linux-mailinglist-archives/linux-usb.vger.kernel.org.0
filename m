Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7333D5DA15
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 03:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfGCBAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 21:00:55 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43423 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfGCBAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 21:00:55 -0400
Received: by mail-pl1-f193.google.com with SMTP id cl9so213245plb.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 18:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eB6S4cIG2ic7xIJ0b0BVpA8z0egoMH0hNtHA1F0tef4=;
        b=Mc9Zgzxi7WpN1Y0XEo1iD+dNo1ILtatcJksAae4nWOPbWm7s2Ed/HD0mGWbza1EhPs
         f9+5ef3wLIriMDbYvAeVswhba6w815dbKYeDrem+W/TdNTlX9rJYEzgxE+XVttyzoTgt
         a+QZZCoV7jcLA1bE9U/R0g1i0+VJUSz6AH6hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eB6S4cIG2ic7xIJ0b0BVpA8z0egoMH0hNtHA1F0tef4=;
        b=uSOIvZfHJALprvN1niYHjClUv/qM/gVIJDqjlG16jhFjBfWMSKwq+QbVCyyZE44NZx
         20f80nv3cyJeGgvXkrkCsLxDhugz0ke3feLJg0xIwdysbv+eREiO/ooCWNiV3d8YaFRY
         wiXXwcSccaOplBDU2r54OW9ZA34hIZy60Oxi2heQDQ+24gAa1CysWVm1AVpqZ6v14+vj
         m+RV8w28qAR8mML6j4YzTBALT5Dtko3P/0mDrQKwKYuU4sbqlhl6t5+26iV1W+pvAdNO
         /qp48dZLFChHad4un2U6Hf8i+uvAXYfJy4e0AcdjvczK2+8RtxZXg1Td1y0zTIoy/Ddk
         LwOw==
X-Gm-Message-State: APjAAAUbIp8iGnoceK6mbQVEShax79jx8o0PTJYedZhGm3Jbu7cj6adI
        JzG26/Un03O950FzXnCaMmaM2g==
X-Google-Smtp-Source: APXvYqwmPOBAaXQUnvIdrwl5iMJ1KFOaDS7/wjSob7es+yD/2C7SqHepeXjWMhCH7KaKi48XGbBdkA==
X-Received: by 2002:a17:902:8d97:: with SMTP id v23mr10594527plo.157.1562102157592;
        Tue, 02 Jul 2019 14:15:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s193sm62332pgc.32.2019.07.02.14.15.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 14:15:56 -0700 (PDT)
Date:   Tue, 2 Jul 2019 09:03:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com,
        andreyknvl@google.com, hans.verkuil@cisco.com, mchehab@kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] media: usb: technisat-usb2: fix buffer overflow
Message-ID: <201907020858.66B63B24@keescook>
References: <000000000000089d7f058683115e@google.com>
 <20190702140211.28399-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702140211.28399-1-tranmanphong@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 09:02:11PM +0700, Phong Tran wrote:
> The buffer will be overflow in case of the while loop can not break.
> Add the checking buffer condition in while loop for avoiding
> overlooping index.
> 
> This issue was reported by syzbot
> 
> Reported-by: syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com
> 
> Tested by:
> https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ
> 
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..4e0b6185666a 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -655,7 +655,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  #endif
>  
>  	ev.pulse = 0;
> -	while (1) {
> +	while (b != (buf + 63)) {

This matches the "62" from the earlier read -- instead of these literal
numbers, could you replace the "62"s with a named define for whatever
would make sense for this driver (maybe "IR_MAX_EVENTS"?), and then you
can make the above be something like:

	while (b <= buf + IR_MAX_EVENTS) {


>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
> -- 
> 2.11.0
> 

-- 
Kees Cook
