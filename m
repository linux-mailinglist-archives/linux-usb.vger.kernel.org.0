Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D242C3C70
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 10:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgKYJkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 04:40:24 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42065 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgKYJkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 04:40:24 -0500
Received: by mail-lf1-f66.google.com with SMTP id u18so2191970lfd.9
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 01:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nCit6xd+O70kjek/u0RUbkcgjxkoOHaO4tjhquE+s7Y=;
        b=Qsbp9a6B3Yt/NnuaAlmztA+uvtuvlrVBq3v6haM2wZ+mzYOaa3f01FAw35W7tQXtNU
         usXmCllmtKLDfBKoX2T1bc7++O8+g+mZ8paj0RubhS61ryaWe5Rv5PZuZO4BHB7UBPH0
         TutbeCMm9ATNEzltdFoQ4zY6+5LZDnljGFlPQL1JbacaG9pTfqlup+s0x9o/UxwHHLAT
         MWvHZJfZ9jmeqvUuWUEyc3wZetTlvs+TEa4RzCMlfm2dBsjaWHXlwK3780CXCokN+Jr3
         71/Rf2M2klgJvVPnVvtZJZRwpxd0UksYPB6zQJVOeZZSLqyB/OFiBUoKlLkk0cHLp0HP
         dl6Q==
X-Gm-Message-State: AOAM533CZ9Qzzid+Ezj2HXgPTy9cJelA/v4n1C8wmzW+2+QNhOXxMy18
        s4EfZYWFX9h6BVTNSEKrmKM=
X-Google-Smtp-Source: ABdhPJyVlal1LBu3aRZGckcBQTZVUrJtbAbnYnkmN6WSFFd3w08UFFjCSm8FAhZiKLomVNWPYEThCQ==
X-Received: by 2002:a05:6512:3128:: with SMTP id p8mr947123lfd.13.1606297221720;
        Wed, 25 Nov 2020 01:40:21 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p16sm189700lfe.255.2020.11.25.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 01:40:20 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1khrHv-00035w-4w; Wed, 25 Nov 2020 10:40:35 +0100
Date:   Wed, 25 Nov 2020 10:40:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Giacinto Cifelli <gciofono@gmail.com>
Cc:     linux-usb@vger.kernel.org, Lars Melin <larsm17@gmail.com>
Subject: Re: [PATCH] option: added support for Thales Cinterion EXS82 option
 port.
Message-ID: <X74mk/lw2NYJ78jq@localhost>
References: <20201124094155.10510-1-gciofono@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124094155.10510-1-gciofono@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 24, 2020 at 10:41:55AM +0100, Giacinto Cifelli wrote:
> There is a single option port in this modem, and it is used as debug port
> 
> Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>

Thanks for the update (and thanks for the review, Lars).

Using the option driver for just a debug port seems like overkill, but
ok.

Some form issues:

 - When updating a patch always include a patch revision number in the
   Subject prefix (e.g. "[PATCH v2] USB: serial: option: add ...").

 - Include a short changelog below the "---" line so we know what
   changed since the previous version.

 - Try to follow the convention used by the subsystem for the Subject
   prefix (i.e. "USB: serial: option: add ...").

> ---

And please keep the lsusb -v info here below the cut-off line when
resending.

>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 54ca85cc920d..fda291e68e4b 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -424,6 +424,7 @@ static void option_instat_callback(struct urb *urb);
>  #define CINTERION_PRODUCT_AHXX_2RMNET		0x0084
>  #define CINTERION_PRODUCT_AHXX_AUDIO		0x0085
>  #define CINTERION_PRODUCT_CLS8			0x00b0
> +#define CINTERION_PRODUCT_EXS82			0x006c

Please keep the entries sorted by PID.

>  
>  /* Olivetti products */
>  #define OLIVETTI_VENDOR_ID			0x0b3c
> @@ -1908,6 +1909,7 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
>  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, /* HC28 enumerates with Siemens or Cinterion VID depending on FW revision */
>  	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
> +	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EXS82, 0xff) },

And keep these sorted alphabetically if possible (at least keep the
CINTERION_VENDOR_ID entries together).

>  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
>  	  .driver_info = RSVD(4) },
>  	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),

Care to fix that up in a v3?

Johan
