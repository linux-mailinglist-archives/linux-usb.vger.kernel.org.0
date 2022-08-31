Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3940D5A8828
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 23:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbiHaVfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 17:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiHaVfl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 17:35:41 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18865A88A
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 14:35:39 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 72so15675392pfx.9
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=k+a5ywY0A19s4ewXtlKzkVso1icQ7ila5o+nOXUa5t0=;
        b=c5JgVe1Byofhc6O6ncpug3jMP9vrBQ8mg1iV4x6OffluDyNwdc5yQC0i91mRpeqi+R
         e60mwo7NYHqTwKLefxzxP98T5zdFGDwLlfZQhYzJomTXQ3P9D2BppXIkeoRHIChSYNap
         k39or0uq0Q9ofWiwRcSOxl+34jVOM9ez6ZVUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=k+a5ywY0A19s4ewXtlKzkVso1icQ7ila5o+nOXUa5t0=;
        b=2v9sjCNeuA1F3BHSQCpU1sf4SLiOdtyy+PdbAqod/qah3+E5SUoQm9tE8KHzOTYLRM
         En4MuLGwpSSw7tGNBaWAVTQPn9mM7Uvo/Ycg6UFTHA1Ieg0kLoFjMHy3T0wqseNtB9e1
         Z7JUStqd38U7EaZ82aiScRb46U6MFrzO9Q97XVL7glUiTKg9veD17+v4x8u7GAc1OTJB
         ufysdLOr8DTFEVolXdbZRks3MjY2DhrlAWP2kCKRcArVpxZ9CYPIl8wGyM/yvnnZkMgh
         utK+4hi3YfQ3Jf4i11M63579vHc8pFz+llHNPouMEsUfEoQffzyDxSk4wCcXugLvLbWn
         FF9A==
X-Gm-Message-State: ACgBeo2yHpoHEo7RF5BDL67rAxRQ0Pd25eOzTWS6XGGKbgTIdGDyK20Z
        iX3LTzMMwCXh1rIeWDf6vKK43g==
X-Google-Smtp-Source: AA6agR7bFSZUedthvJeKRtZPEbMNHJYiT50MWzKxjKEkFCt2A0WVVF41IJxipQKQFVlWm7oAFPkp1Q==
X-Received: by 2002:a63:d16:0:b0:41d:fe52:1d2f with SMTP id c22-20020a630d16000000b0041dfe521d2fmr23976158pgl.416.1661981739540;
        Wed, 31 Aug 2022 14:35:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:732f:b56c:f5e0:57d])
        by smtp.gmail.com with UTF8SMTPSA id t10-20020a170902e84a00b00174f4316c24sm6051640plg.245.2022.08.31.14.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 14:35:39 -0700 (PDT)
Date:   Wed, 31 Aug 2022 14:35:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Hu Xiaoying <huxiaoying@kylinos.cn>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: Improves USB2.0 write performance.
Message-ID: <Yw/UKNu0++5MtvbK@google.com>
References: <20220831015624.1119578-1-huxiaoying@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220831015624.1119578-1-huxiaoying@kylinos.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 09:56:24AM +0800, Hu Xiaoying wrote:

> Subject: [PATCH v4] usb: Improves USB2.0 write performance.

Virtually everyone who sees this will think that this patch improves
USB 2.0 write performance in general, which isn't the case.

Instead the subject could be something like:

USB: storage: Add ASUS <model> to IGNORE_UAS

> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write  < 30MB/s.
> if does not to load module of uas for this device, can increase the
> write speed from 20MB/s to >40MB/s.
> 
> Signed-off-by: Hu Xiaoying <huxiaoying@kylinos.cn>
> ---
> change for v4
>  - Update two email addresses to be the same.
> change for v3
>  - Does not send html mail to the mailing lists.
>  - Update patch, which sorted by vendor ID and product ID.
>  - Modify discription, correct some english words.
> change for v2
>  - Update discription for patch.
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 4051c8cd0cd8..23ab3b048d9b 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -62,6 +62,13 @@ UNUSUAL_DEV(0x0984, 0x0301, 0x0128, 0x0128,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_IGNORE_UAS),
>  
> +/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
> +UNUSUAL_DEV(0x0b05, 0x1932, 0x0000, 0x9999,
> +		"ASUS",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: David Webb <djw@noc.ac.uk> */
>  UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		"Seagate",
> -- 
> 2.25.1
> 
