Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB23D56A8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 11:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhGZIu4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 04:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbhGZIuz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 04:50:55 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A5BC061757
        for <linux-usb@vger.kernel.org>; Mon, 26 Jul 2021 02:31:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p5so5132817wro.7
        for <linux-usb@vger.kernel.org>; Mon, 26 Jul 2021 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=GtHKKi8HYmJ+iJNdAoq1P40IYtnBYeqGXfG2f9iaTII=;
        b=ncMMtc/AWDb/tkI4OHfSne60CbO3udbDGAl27GD0TE9oUdrlCLR2ps2N4pKmbWZdjt
         whqlwGkidKbiaYijYtJY69Twqf0bg5A+sBCp8x9hRKOp+zzZGrel+bKUIJl5draxdABq
         RfQP8RB3zaKdzLwzQzTKIg/IZCMGcj1ldu/2nN47x4XnJFxE6IgLI5npQ1S+0Untxl0O
         vkOsgWX8tJyzlf3dvk8tHPAT8uv+VTOz+IgPcgwO3ImtQ4sJuyKTIGYwp+ciflgTphu3
         uOkm0ueKUGpLDseVb759hmmNgMp4CoR74yrH+wRqustIlT9RkVanz+MqtnBO86aI6yj1
         vZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=GtHKKi8HYmJ+iJNdAoq1P40IYtnBYeqGXfG2f9iaTII=;
        b=LEYcD8OdLvkEj1G3RfuAMdnVuY1PUGdy8WTH5cdU0BeYj9VnDSvhdSHSoF5PYwI9ot
         GcGyJjbDzPxG0MF7JKhgmpXoArUw0M7x4UYt0i/+D1nL8qr3q1ukueC05FlhD7T2xPAn
         hs1gDq8l0cAoD6I6ZzTQ49KTD2jveAJJpgBnsJlQInIwnN8tIYhXkNRFdip5AhwvRJ6c
         L0wnRupOBBK7JUwsI06g+k5WpWM4Om1gWvnLlAoU2a6XYgN6xuITRPVcUdcWfHOybuRA
         tDyJdsV8fPR/p8NdG4tepWOco5Z7zwCIa3lb+i/cOBrydZxm1v+DQWIeWY62FqDy1L75
         Q8GQ==
X-Gm-Message-State: AOAM533Tqe7/6p9+HuPL2CfpYGjYUU2A81YnEngfS0y0a+Rpc6W56EZa
        tbKD8e6tcFyjw6rtEfhgwDTtNg==
X-Google-Smtp-Source: ABdhPJyT3tBCOc8eh1LYgNPHTXoXoeHjFdd9fIrmicEkuVzaXqfdZcALdNDGAvar4DHx4YVKl0MZKQ==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr18769829wrx.268.1627291882143;
        Mon, 26 Jul 2021 02:31:22 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id p11sm40935839wro.78.2021.07.26.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:31:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 26 Jul 2021 10:31:20 +0100
Message-Id: <CD2YTTPX49YH.2PKPUS4L09ZEK@arch-thunder>
Cc:     <linux-usb@vger.kernel.org>
Subject: Re: [bug report] usb: isp1760: move to regmap for register access
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Dan Carpenter" <dan.carpenter@oracle.com>
References: <20210726071747.GA8604@kili>
In-Reply-To: <20210726071747.GA8604@kili>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,
On Mon Jul 26, 2021 at 8:17 AM WEST, Dan Carpenter wrote:

> Hello Rui Miguel Silva,
>
> The patch 1da9e1c06873: "usb: isp1760: move to regmap for register
> access" from May 13, 2021, leads to the following static checker
> warning:
>
> 	drivers/usb/isp1760/isp1760-hcd.c:264 isp1760_hcd_set_and_wait_swap()
> 	warn: sleeping in atomic context
>
> drivers/usb/isp1760/isp1760-hcd.c
>     256 static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32=
 field,
>     257 					 u32 timeout_us)
>     258 {
>     259 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
>     260 	u32 val;
>     261=20
>     262 	isp1760_hcd_set(hcd, field);
>     263=20
> --> 264 	return regmap_field_read_poll_timeout(priv->fields[field], val,
>     265 					      !val, 10, timeout_us);
>                                                             ^^
> This used to call something else but it was still a sleep function.
>
> The call tree is:
>   --> isp1760_stop() <-- takes a spinlock
>       --> ehci_reset()
>           --> isp1760_hcd_set_and_wait_swap()

Thanks for both reports, I will send fix for this soon.

------
Cheers,
     Rui
