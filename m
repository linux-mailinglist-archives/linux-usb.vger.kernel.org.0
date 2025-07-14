Return-Path: <linux-usb+bounces-25764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40847B04128
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 16:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F209A3AF4F6
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 14:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2B72459D2;
	Mon, 14 Jul 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="axw5HpY2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6D255F2D
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502474; cv=none; b=XTKUNyrWpnZKjRLRxH7ynLdQSN5p2PGMqYmSAw/gcOWlzEZL+LCVO2mx1ZJXBSfsaQPbj7C6DPGirLxcEKErtUww2/M/6V6PONxLugUPjDqXjXCsSYLU1OUKFO+McAwW+hlTy0LOoMFys0dDXHHLsdqXNXSEs+O2fhlRWAtDtTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502474; c=relaxed/simple;
	bh=83AgYV4x+hwPaNGzWopzeXSbiWGOVcEuU5XbcQfD8es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkUgCgZDgpANP7AgzpvHp2X9/Ri+MgPCQhrsl77uknJey+68u8gdfTpFDxQIhO8Au0hO62+UBDeePeNwifNbRkg1J8mSctRA4E0gezvJv6tYms/8ZvFxtDEz3i0fPgk3dlWdyqPbEUlyp2wz4uqy6u9jKs3AOnyG6vAMdvoWDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=axw5HpY2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553d52cb80dso3969201e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752502470; x=1753107270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aPBTalpHMZbUCps9VnvQc6q/AJch4FZWjrxFyUqpLTw=;
        b=axw5HpY2VCYIBxJkGlPuakiFyhLCqvr6WCxn5jAQk3jUGHmKmFGaOw9f4PJ366Fpki
         vQ2yvAkXF16tDOdcTp9btxHVbBy/MkmA/P6bdPZ+PSG/iwCVulfxsx11lt9lMKyQZ/H+
         e01wCWyrZgOG/ytezdp+jRnaxrt6KDuPuR5Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502470; x=1753107270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPBTalpHMZbUCps9VnvQc6q/AJch4FZWjrxFyUqpLTw=;
        b=nYbl3ln/9FmZ4ZDGgsq4GkmY+Rl+Shv3f3P95N5U+ioMcd5vNPA1fCTXln8Q4FVB+b
         cf/2jg1QCPl96sHIvkVnNvoH609kXFv4HRd7AUBdbZCmLmprv2dAac4nQ+ZdyTlyul5C
         zGGwpIbnGb0lOsOlt6OOLe5z5rQDVgIoE14SpFK2YtNG5x+B1ue8Uiqmx5HurH3neGa2
         vXhDivQ9GjQlUCh3ci8gnHeBXFj9KFsO4TpDTuU643kZSRWEwKLXUEJmtSfhrrunDjQu
         YHxGpuUqYrA3uZPqEa3n0J8RwZIZvUXeTn36e385/AknxBfglIChG7ZazjXoduNqwPkl
         u69A==
X-Forwarded-Encrypted: i=1; AJvYcCV8ckVVjChVBKjYI/Jr64HRMoit73KYuJUa2QMeK6yWsdx0FVO/7gH/JlJ6aO/c8poIJpYUBqarTF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmCdrAxanuHO3oF5X0RFCpWHZPH8kaRFXtLoQq/9CC/Un/FGP
	I8gZKLj7hNFaavoW9umsMT127I/k7frBByentzaa5qxNDEiLrqb957KnyPoi/wpGll7dSE4//8z
	qksU=
X-Gm-Gg: ASbGnct9aeyGMixoSy8W+3QE3W43x5MMMP6bQ4wrxFJlPogLtVsHSGAlWwUa1cxTtsM
	3lm0VDGWl4HfMft3bDCEXgHqOXdQhB4AXAeXPI3XU4EXguYFEsRTLOT4Cc8Pa8vwXFLlivEshtA
	3nj3Ig3cbiTvyg3z9HZk7tTxvbu/RG0df6GmDfKzlE3FyLcvshWCebgv7sL2pWGI4Enos8xfq3Z
	O1pf5otRTNBWWI6EmMJwCMWBBn3UVkiaFqk4D3TBYtA36ViO+/2d4QXtTzfLE9PR6dR9Mkh2DaA
	sES5Usi6aU9ZbVRepC2y/6gZvKNuUtdsQ1HS19sadQt+B9p8DD7qzCwpGEVJ1Q+z9HQHujLbPdo
	6dy3uqqrgD00IWe/EHDO/jcv99GHielyI9IV0OFr1WLW9FW+/hTSrJfyuHff5+CLE
X-Google-Smtp-Source: AGHT+IERzgIoaJQsPA3rn2mjSM7tCq6x26J+FIqG1oMXkhIz/KSmHEZmrRcUPGHNckYro8yiJaxeBQ==
X-Received: by 2002:a05:6512:128d:b0:556:fb24:6f85 with SMTP id 2adb3069b0e04-5590072d473mr5486539e87.22.1752502469667;
        Mon, 14 Jul 2025 07:14:29 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a02d5bf22sm1565517e87.68.2025.07.14.07.14.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:14:28 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b4876dfecso54069331fa.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMtV+bG10hxyAe+VJf2rlHgdV7rf4yHk3bo2I0cWwWYLovZYeM8zoWqTetkLHzC79M1mCtWkw5FdQ=@vger.kernel.org
X-Received: by 2002:a05:651c:2002:b0:32b:59d1:7ef2 with SMTP id
 38308e7fff4ca-32f50c780f8mr41327731fa.9.1752502467634; Mon, 14 Jul 2025
 07:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org> <a02801c8-4be0-4a53-a037-e38bf0f05db1@redhat.com>
In-Reply-To: <a02801c8-4be0-4a53-a037-e38bf0f05db1@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 16:14:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsq4_R5R6+W3qxN6tpDJxqSkZ8E20Hza=Ye-HpqfCza1w@mail.gmail.com>
X-Gm-Features: Ac12FXyYIipkCH4Sx5CVKejVWW7_NLIKMhi6EeKATJWIjzTAUBbADXkCmkZ4IHg
Message-ID: <CANiDSCsq4_R5R6+W3qxN6tpDJxqSkZ8E20Hza=Ye-HpqfCza1w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 15:03, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5-Jun-25 19:52, Ricardo Ribalda wrote:
> > Currently v4l2_fwnode_device_parse() obtains the orientation and
> > rotation via fwnode properties.
> >
> > Extend the function to support as well ACPI devices with _PLD info.
> >
> > We give a higher priority to fwnode, because it might contain quirks
> > injected via swnodes.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 79 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >   */
> >  #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> > @@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!is_acpi_device_node(dev_fwnode(dev)))
> > +             return 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
> > +             return 0;
> > +     }
> > +
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
>
> "!=" should be "==" here. So that we set it when not set already,
> rather then leaving it unset when not set already.
>
> > +             switch (pld->panel) {
> > +             case ACPI_PLD_PANEL_FRONT:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +                     break;
> > +             case ACPI_PLD_PANEL_BACK:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +                     break;
> > +             case ACPI_PLD_PANEL_TOP:
> > +             case ACPI_PLD_PANEL_LEFT:
> > +             case ACPI_PLD_PANEL_RIGHT:
> > +             case ACPI_PLD_PANEL_UNKNOWN:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +     if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
>
> Same here.
>
>
> > +             switch (pld->rotation) {
> > +             case 0 ... 7:
> > +                     props->rotation = pld->rotation * 45;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +done:
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
> > +                                    struct v4l2_fwnode_device_properties *props)
> >  {
> >       struct fwnode_handle *fwnode = dev_fwnode(dev);
> >       u32 val;
> >       int ret;
> >
> > -     memset(props, 0, sizeof(*props));
> > -
> > -     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "orientation", &val);
> >       if (!ret) {
> >               switch (val) {
> > @@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     int ret;
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     /* Start by looking into swnodes and dt. */
> > +     ret =  v4l2_fwnode_device_parse_dt(dev, props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Orientation and rotation found!, we are ready. */
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
> > +         props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             return 0;
>
> As Sakari set, this can be dropped, with the 2 checks above
> fixed to be == v4l2_fwnode_device_parse_acpi() will become
> a no-op in this case.

I wanted to avoid calling he _PLD method if it was not necessary.

But if both Sakari and you dislike the optimization then let's get rid of it :)

Thanks


>
> With these things fixed:
>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
>
> Regards,
>
> Hans
>
>
> > +
> > +     /* Let's check the acpi table. */
> > +     return v4l2_fwnode_device_parse_acpi(dev, props);
> > +}
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >  /*
> >
>


--
Ricardo Ribalda

