Return-Path: <linux-usb+bounces-22270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F71A744A9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 08:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0FF1B605E9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 07:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FB0212F82;
	Fri, 28 Mar 2025 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ybGgDK6e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08A2116F4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147918; cv=none; b=e2AoYGA64kNeXNVAqaedU9UGotvLxKtkrtfm5ZEP4FKudgHMxeAklRY35Nw54oIZ75yq9ep6HBSRtfV1vWHbTLljWwIve84qtg6M5MLd8DAsTcMp6TIEhS2hxM2bVbWSKQXqrdIv7pduJ42AEOlKxowmU8guHBeMJKKddizr5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147918; c=relaxed/simple;
	bh=rHhW4EJhfJ7yNY7e2PyX5y0Z5SfuR3jfuW9uefIR6VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caYbvAHutK5ytJATXCAi0I2Ztq6Oeh91IlmpI5p6JfGVCy5RSCrmQzhSQAi1wD7BxMdw9HR1B9Ju+tZEnfQgaDaV14yjt0D2klix0S0zL++OwsIQ35whenWgxR/S0PgukERFKxdaiTvKH/A4X/0J2DsEmPvCa2o2bAyqapsXp2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ybGgDK6e; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2388762a91.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147914; x=1743752714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IESU1cLx8J9+1ppDJfS8syyG1sO20GZa5dzaM+JLDsk=;
        b=ybGgDK6eUeQRG50hCxFAhTi9uqJguXaP6qOR8k3CD5oeu+BqHDhdpDo5+q7u3wS/mV
         tWYviy9gGYrz75S8jQHiRcxlOn2F8e2GI4cWzyRSeyjVqBHE8emFCnPS9wDFyhp3QV91
         OoPjWDb4k9Twr45c8WmPhjRPCvQqnPWxRi5f7hNl3bNFvO61qzoGy0l1gt/MImj6QhUw
         XY7AhryvGYUCFi+7C3ZWWj1UHj8YQfWp+3bldiV+bnfyweKJ6aB8PgAOTpnRTjaITqSk
         eO3+OXpq6qFXynENO0tVGhYarrYUbqe7OijQQ7ukhef29t9QcMY3ICYoyBVnQooQforq
         uhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147914; x=1743752714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IESU1cLx8J9+1ppDJfS8syyG1sO20GZa5dzaM+JLDsk=;
        b=k76VL2MZuZuKRt/2L7nBA62UaqVNErJMINbg+AZBKj24OvzfW5hNoZvwWICcV/sRyd
         oUnGp06BQWVlmB+yVTAJJ3LKJpU9pORDJmv6Gj8jjiLC31pGUw+/aPaSnoFkRSlqWehv
         Rztt1YG1Gv6d2BL5+WgHFOGo4XeL2uUUPpQUO39MrCU9/5M50Rv8KaUrClcYt/zG7g74
         +HJGa94irVu7lnUK7jTwlkDDss0C9RSqisOxA9No40wM7WVoEZaNlASxOMzhqWA/9SPj
         hcdi6WKRFoU/kIlo0kzrzYNtkIzORucHIXKtfOsdihnbaP8YjO4QMEvh8mD8AqJwtMvP
         tWsw==
X-Forwarded-Encrypted: i=1; AJvYcCX5153dsPcYHQyUevs3AdtG0aDqaXsln9mb/Ba8DKSByRYDUc3RLoU3tYf1QWIp9tyFFCj8kiTTAu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BARzCA89SOKck2OZKeBDkMUkMo8e2xGPKaOgKCMks6PUJLpK
	8Gfrvp12q+QsbyYyLSDvsJnOirLr5g2d28JE/ZOBkMox1w//SqoDNPRgOd8V8AhypHUA2kvtfNH
	Ig/nfC5YVYEBd2xg7u3BOvBl3eGH7Wp88b8vf
X-Gm-Gg: ASbGnctRRHdJT0LwvUBfYKu7K5jqo1XyPuI3FpcbQcLOQlH6ybMjCEn7nDYMBQh8Vu0
	OcvXaAq/kPxdVhyE9sZqiXpluD0kbz53VROxMtqZ0BKMqvW+I1OYCzRLTFu29Kj/FnxvNhuugmK
	e5hX1+qlbDOheW05EPWYE9jJmvGO290nGmMOr3qKJISKPS4sFV2V7mjTOk
X-Google-Smtp-Source: AGHT+IH6UrNf8k0iIk0UW8yjv9n/nScAByODrny3BYGZJEV9LB+thNungicKZ0bfZ+d7qsqmH1ybo9gXm2eAAWDsTZw=
X-Received: by 2002:a17:90b:4a4f:b0:2fe:a77b:d97e with SMTP id
 98e67ed59e1d1-303a7d66285mr10270841a91.11.1743147913645; Fri, 28 Mar 2025
 00:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-6-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-6-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:45:00 +0800
X-Gm-Features: AQ5f1JonoFS3uWyzINSVXYoD9NyFnlP1GUczGkKTm-KX97WAnMBIsmA-S-vI3bg
Message-ID: <CAGCq0LZJmt3BdEXTvyOBUvsCCzVD1eQE2LQ6Eh_WRs7jYmR6oA@mail.gmail.com>
Subject: Re: [PATCH v36 05/31] usb: host: xhci: Notify xHCI sideband on
 transfer ring free
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:52=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> In the case of handling a USB bus reset, the xhci_discover_or_reset_devic=
e
> can run without first notifying the xHCI sideband client driver to stop o=
r
> prevent the use of the transfer ring.  It was seen that when a bus reset
> situation happened, the USB offload driver was attempting to fetch the xH=
CI
> transfer ring information, which was already freed.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-sideband.c  | 29 ++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci.c           |  3 +++
>  include/linux/usb/xhci-sideband.h | 30 +++++++++++++++++++++++++++++-
>  3 files changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index 742bbc6c2d9b..d49f9886dd84 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -88,6 +88,30 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *=
sb, struct xhci_virt_ep *e
>
>  /* sideband api functions */
>
> +/**
> + * xhci_sideband_notify_ep_ring_free - notify client of xfer ring free
> + * @sb: sideband instance for this usb device
> + * @ep_index: usb endpoint index
> + *
> + * Notifies the xHCI sideband client driver of a xHCI transfer ring free
> + * routine.  This will allow for the client to ensure that all transfers
> + * are completed.
> + *
> + * The callback should be synchronous, as the ring free happens after.
> + */
> +void xhci_sideband_notify_ep_ring_free(struct xhci_sideband *sb,
> +                                      unsigned int ep_index)
> +{
> +       struct xhci_sideband_event evt;
> +
> +       evt.type =3D XHCI_SIDEBAND_XFER_RING_FREE;
> +       evt.evt_data =3D &ep_index;
> +
> +       if (sb->notify_client)
> +               sb->notify_client(sb->intf, &evt);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
> +
>  /**
>   * xhci_sideband_add_endpoint - add endpoint to sideband access list
>   * @sb: sideband instance for this usb device
> @@ -342,7 +366,9 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
>   * Return: pointer to a new xhci_sideband instance if successful. NULL o=
therwise.
>   */
>  struct xhci_sideband *
> -xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type)
> +xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type,
> +                      int (*notify_client)(struct usb_interface *intf,
> +                                   struct xhci_sideband_event *evt))
>  {
>         struct usb_device *udev =3D interface_to_usbdev(intf);
>         struct usb_hcd *hcd =3D bus_to_hcd(udev->bus);
> @@ -381,6 +407,7 @@ xhci_sideband_register(struct usb_interface *intf, en=
um xhci_sideband_type type)
>         sb->vdev =3D vdev;
>         sb->intf =3D intf;
>         sb->type =3D type;
> +       sb->notify_client =3D notify_client;
>         vdev->sideband =3D sb;
>
>         spin_unlock_irq(&xhci->lock);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 61950a350432..91e2d6eac8b7 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -20,6 +20,7 @@
>  #include <linux/string_choices.h>
>  #include <linux/dmi.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/usb/xhci-sideband.h>
>
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -3919,6 +3920,8 @@ static int xhci_discover_or_reset_device(struct usb=
_hcd *hcd,
>                 }
>
>                 if (ep->ring) {
> +                       if (ep->sideband)
> +                               xhci_sideband_notify_ep_ring_free(ep->sid=
eband, i);
>                         xhci_debugfs_remove_endpoint(xhci, virt_dev, i);
>                         xhci_free_endpoint_ring(xhci, virt_dev, i);
>                 }
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-s=
ideband.h
> index f8722afb8a2d..45288c392f6e 100644
> --- a/include/linux/usb/xhci-sideband.h
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -21,6 +21,20 @@ enum xhci_sideband_type {
>         XHCI_SIDEBAND_VENDOR,
>  };
>
> +enum xhci_sideband_notify_type {
> +       XHCI_SIDEBAND_XFER_RING_FREE,
> +};
> +
> +/**
> + * struct xhci_sideband_event - sideband event
> + * @type: notifier type
> + * @evt_data: event data
> + */
> +struct xhci_sideband_event {
> +       enum xhci_sideband_notify_type type;
> +       void *evt_data;
> +};
> +
>  /**
>   * struct xhci_sideband - representation of a sideband accessed usb devi=
ce.
>   * @xhci: The xhci host controller the usb device is connected to
> @@ -30,6 +44,7 @@ enum xhci_sideband_type {
>   * @type: xHCI sideband type
>   * @mutex: mutex for sideband operations
>   * @intf: USB sideband client interface
> + * @notify_client: callback for xHCI sideband sequences
>   *
>   * FIXME usb device accessed via sideband Keeping track of sideband acce=
ssed usb devices.
>   */
> @@ -44,10 +59,14 @@ struct xhci_sideband {
>         struct mutex                    mutex;
>
>         struct usb_interface            *intf;
> +       int (*notify_client)(struct usb_interface *intf,
> +                            struct xhci_sideband_event *evt);
>  };
>
>  struct xhci_sideband *
> -xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type);
> +xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type,
> +                      int (*notify_client)(struct usb_interface *intf,
> +                                   struct xhci_sideband_event *evt));
>  void
>  xhci_sideband_unregister(struct xhci_sideband *sb);
>  int
> @@ -71,4 +90,13 @@ void
>  xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
>  int
>  xhci_sideband_interrupter_id(struct xhci_sideband *sb);
> +
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND)
> +void xhci_sideband_notify_ep_ring_free(struct xhci_sideband *sb,
> +                                      unsigned int ep_index);
> +#else
> +static inline void xhci_sideband_notify_ep_ring_free(struct xhci_sideban=
d *sb,
> +                                                    unsigned int ep_inde=
x)
> +{ }
> +#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND) */
>  #endif /* __LINUX_XHCI_SIDEBAND_H */
>

