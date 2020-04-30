Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C161BF2DC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 10:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgD3IcY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 04:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726684AbgD3IcX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 04:32:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74508C035494
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 01:32:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v8so6866129wma.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=K+vWPrptIKkKITr7qASmWRPYsOz+1iNkbfft/VKjXmE=;
        b=EZ/UoognWxfkpZBPdsHbAlI2p9tnzlAGH7GmFNmJTh5AsVVrZD7cCh9eEmkbqNh75J
         /EeQbJ43MZpAZENeKqZhWpcYHPltg60TbKNTDPAqPjn2HY+YwuYyFIyasTlWA5KDtG2g
         3mJpjbNYCixXU4VrfrRm8SEsuliLkuQ6T3LYl73ZaiyN28cLKlpI9kJ4hOzB2s3tqglH
         axm4K3wI6ftl4Aaq7y66LWyFEd0jbiQmFi8AH1sU4fR2DIlFy1Zhs01DiwbQwR2ebG0s
         6TmXzde6CcnTxhcwVaTkPJ50uWEggKqcbsRd9ej8TmUoY68oBwJXaNHd1aVCskvaaS4w
         hXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=K+vWPrptIKkKITr7qASmWRPYsOz+1iNkbfft/VKjXmE=;
        b=st0ggW1xrrWXMBp3FAEEfWQHZU+olrZXyIc7/GH60m6WC20afMssninbEjPRevwcXa
         /TahtqQVGH2EIaZz4BDZsk/CDBnNtndal5FF75Dsvzz9qLs0ab51lBxdHGhxFaz6NUCn
         2tjX/XQJQu0WZbmMDDd+bELtjeOKvYw5pH//cEOVI/drXOYK9ooximB1yWbRHFCDJxQq
         LLsfu3QFrGLDvsKlc7rCTliXyQlYgsvInOelMSBb3iO8SbBVwmHCuJYOEiGxqmCoPf0p
         dB8rthSUss57lq37RJuHYKo2ZsNYcT0MVLJhy7WIFIZGeSh8/U+5nQFz2GI7hEVnzDKw
         uyXg==
X-Gm-Message-State: AGi0PuYU5glLDYgKl7MnzY5ORMxp0oVpPB7+xQpx2cChjTJd/cnrukM2
        OBtYQVMt3smjLLrBcO5H9sXx5A==
X-Google-Smtp-Source: APiQypLUpRZshEEcu1i2D211JBCtZvOfsCfE03zoLPm/UNh+5L2j4DCkoFUToTY0doJ7L5YnRmYMUQ==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr1678873wma.162.1588235542117;
        Thu, 30 Apr 2020 01:32:22 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id n131sm12061037wmf.35.2020.04.30.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 01:32:21 -0700 (PDT)
Date:   Thu, 30 Apr 2020 09:32:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430083219.GC3118@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429124830.27475-2-noralf@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 29 Apr 2020, Noralf Trønnes wrote:

> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>  include/linux/backlight.h           |  1 +
>  2 files changed, 22 insertions(+)

Once reviewed, can this patch be applied on its own?

My guess is that it can't, as the other patches in this set depend on
it, right?  If this assumption is true, you need to send me the rest
of the set.

FYI: It's normally better to send the whole set to everyone, as it
provides visibility on current review (or lack there of) status of the
other patches and allows each of the maintainers to discuss possible
merge strategies.

> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index cac3e35d7630..92d80aa0c0ef 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
>  
> +/**
> + * backlight_device_get_by_name - Get backlight device by name
> + * @name: Device name
> + *
> + * This function looks up a backlight device by its name. It obtains a reference
> + * on the backlight device and it is the caller's responsibility to drop the
> + * reference by calling backlight_put().
> + *
> + * Returns:
> + * A pointer to the backlight device if found, otherwise NULL.
> + */
> +struct backlight_device *backlight_device_get_by_name(const char *name)
> +{
> +	struct device *dev;
> +
> +	dev = class_find_device_by_name(backlight_class, name);
> +
> +	return dev ? to_backlight_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(backlight_device_get_by_name);
> +
>  /**
>   * backlight_device_unregister - unregisters a backlight device object.
>   * @bd: the backlight device object to be unregistered and freed.
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..56e4580d4f55 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_device *bd,
>  extern int backlight_register_notifier(struct notifier_block *nb);
>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>  extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> +struct backlight_device *backlight_device_get_by_name(const char *name);
>  extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
