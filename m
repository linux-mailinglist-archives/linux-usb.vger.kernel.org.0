Return-Path: <linux-usb+bounces-28767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D0BA8667
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 10:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D0A3B5B32
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 08:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ED8257824;
	Mon, 29 Sep 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mjDyHHh3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD534BA2D
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134654; cv=none; b=noscezCjiVVSUv0KJf2w3YQdPHW9LdxqxNiCsVkp29OoHVoVhUIx2bonZ873lDhRmt1hIY1+2/IIkWKtYr2xbH5+LCfzbC1RlNklWTSYB5a0zJGMqTpxv240DtwxwRPM3Oean/Rsm1JC0fahS7+fdnEiUWiWv4CxdG6OBH0pRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134654; c=relaxed/simple;
	bh=1yWrEi955nPPvBu1m9KwQaY5HyLcEXUxbZckZNeDmWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbFuxyrOk+e7JrmFmFAqjkkrSEFUeVMhs9CYhpkXR8ZCtdjlLSVyyYeGnZgGOiCiZgqFqazh+8P3Bkv+9dXZ3m3hsgGYcPIFCXlNiMLPi7YOi3Cw8jxChka0tWY4XunrkueaETr9NlLJCsa7yI05ZSBWOCAbz9Mfh+JbUq9TVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mjDyHHh3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57b35e176dbso5484692e87.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759134650; x=1759739450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJONDUXJa/G+AY4kgKaGSYPSvsqZ+MAfDWA2lmXRRpc=;
        b=mjDyHHh3ZjL4lSx9j24O1CtVr8O7VrJ6GjzBSEoqocKxiLulZc/wSAzuwVTV74Ry9g
         vxfuz0XGDcerzFquNQSBJcS47g2ZE7wT+IfYS54hkpyzR5P88TbrT65WHnoMcm+b/cVD
         HM+oUq/iYypI7s7RzSpi/Oi9SB8dN4YLvaKXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759134650; x=1759739450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJONDUXJa/G+AY4kgKaGSYPSvsqZ+MAfDWA2lmXRRpc=;
        b=fNVA6G/Pi3TqlcZloyNZ5J+0kSZEdBlP5uzWDKPLl0Uutyo1dy5yJg7++2Q4yQSm/0
         YS7bIZE3klJnNSvgxvBhksySg2+DvbvEVuExRpbF9r7yUsG05aYCkPIwKYmU0PmzoKwR
         cMTDWuRjsZrdakT5a+pw5nL0SdqlrZS6DUlzs9RDAyVUfDR37ZFUyfViFLYl81kzv8fw
         pjrsun07IZixkG+fg9XwAPp2yuKn0Sbwo7l1zOOaJ/OuekW8LFuHhYKsQpD4pNylDX+I
         x6xV+6O1XjYVmqTjyWckF0NmVGIX4M382UCNY/LCZeilJVv2vhFNiGRgZnk6oDqIUwW9
         TZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCXye/vPSV7rzFjXpR40F2Td9RHGshhibYZVgKRCUtrDASoYCORGaPpqHWSkv9ibJ+js8k2XUvCRay8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM93gx8IbesLIW8TNlK6uOi7emIg6OVkFu1ROg+WL4F59cD7l/
	lu+4CAOlOD+FQ+BxW2+JAYKS69kGI+jtEg1GKTGqkboIGvfhQOLIborn8pjMG4KN2u2N+2ecB9n
	cD0w=
X-Gm-Gg: ASbGncuaQeH63Y2fXN/nOzjBM13kc6bM09MOq5+9AcczGMLZsK1xhJwR6plgy8Z/Ff0
	3Vet0XG7FFDy76DfFjPd3Ucqd6D0Xkuq+ARLv+f1oQMBYM7XnVJTtiJChfRvQm+TQUhENkQKtbb
	t0KeaOqUNy+EKCu4oB9090wx+laiwxTLZxBQ14kF6KZrKd1kawYGYbvo1oJ7rUoC0qxJYWUx1i0
	DtlKd8QvpSHTZdHOl2cPdkk/bDQbo3xmiBqWWZwg36b1UG2po5E5q4tb+m7YjwnM0BM2B2yltMY
	CeUJUwYlhUNT0Zaxq77O79ka0P0ix4QYxcVBPX6F/Wb4ptNzYH3C0TMy2kgDVuZFlyliJSjwrDS
	1krRSefcQ/j4VyI8JFztQy1LrkfmxiNugoXlam5ynqxJYQLpTC3xogMafupFo59VTn2X9aQ0=
X-Google-Smtp-Source: AGHT+IFm4RxCjUjFVSLCa8D/7fLAO/C0cdRrHOgqaFixjYn6iD++8Lm0CV9nM0T5t26LPxulc66jgQ==
X-Received: by 2002:a05:6512:3d94:b0:576:d5df:fe1b with SMTP id 2adb3069b0e04-582d18cd8a7mr4712844e87.10.1759134650153;
        Mon, 29 Sep 2025 01:30:50 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656353sm4002550e87.88.2025.09.29.01.30.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:30:48 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so4973374e87.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 01:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWevIlRbtD01LYUEQfDi1Mf9m6tKXAXaUU6P08SFVTDUul/wPbitdf1ICEDrDbjz0OXhwrQI3VivjE=@vger.kernel.org
X-Received: by 2002:a05:6512:1102:b0:57c:2474:3740 with SMTP id
 2adb3069b0e04-582d3f76e30mr4820322e87.46.1759134647732; Mon, 29 Sep 2025
 01:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
 <20250926-uvc-orientation-v3-7-6dc2fa5b4220@chromium.org> <20250926-mute-boil-e75839753526@spud>
In-Reply-To: <20250926-mute-boil-e75839753526@spud>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Sep 2025 10:30:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCuddqjeDr80xKsZZP7CXu9qB5qqYPoZujNYLcVjK0kKkg@mail.gmail.com>
X-Gm-Features: AS18NWDuABHOrlsFlY-rDCN1sMikoapkz5ecsd4Y1lKthbQuEsgF6GxQRq0htYQ
Message-ID: <CANiDSCuddqjeDr80xKsZZP7CXu9qB5qqYPoZujNYLcVjK0kKkg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] dt-bindings: media: Add usb-camera-module
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Conor

On Fri, 26 Sept 2025 at 18:55, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Sep 26, 2025 at 01:11:31PM +0000, Ricardo Ribalda wrote:
> > For fixed cameras modules the OS needs to know where they are mounted.
> > This information is used to determine if images need to be rotated or
> > not.
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar properties for video-interface-devices called
> > orientation and rotation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new schema that combines usb/usb-device.yaml and
> > media/video-interface-devices.yaml
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../bindings/media/usb-camera-module.yaml          | 46 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/usb-camera-module.yaml b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e4ad6f557b9151751522e49b72ae6584deb0c7ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/usb-camera-module.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Camera Module
> > +
> > +maintainers:
> > +  - Ricardo Ribalda <ribalda@chromium.org>
> > +
> > +description: |
> > +  This schema allows for annotating auxiliary information for fixed camera
> > +  modules. This information enables the system to determine if incoming frames
> > +  require rotation, mirroring, or other transformations. It also describes the
> > +  module's relationship with other hardware elements, such as flash LEDs or
> > +  Voice Coil Motors (VCMs).
> > +
> > +allOf:
> > +  - $ref: /schemas/usb/usb-device.yaml#
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  reg:
> > +    maxItems: 1
> > +
>
> What actually causes this schema to be applied? Did I miss it getting
> included somewhere?

I guess your question is why I have not defined the compatible field?

I tried this change[1] with no luck:
/usr/local/google/home/ribalda/work/linux/Documentation/devicetree/bindings/media/uvc-camera.example.dtb:
device@1 (uvc-camera): compatible: ['uvc-camera'] does not contain
items matching the given schema

I think it failed, because If we add these allOfs as Rob proposed
https://lore.kernel.org/all/20250625185608.GA2010256-robh@kernel.org/:
```
allOf:
  - $ref: /schemas/usb/usb-device.yaml#
  - $ref: /schemas/media/video-interface-devices.yaml#
```
We cannot (or I do not know how to) have a different compatible than
the one from usb-device.yaml


Any suggestion on how to do this properly will be highly appreciated :)

Thanks!



[1]

@@ -21,10 +21,14 @@ allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#

 properties:
+  compatible:
+    const: uvc-camera
+
   reg:
     maxItems: 1

 required:
+  - compatible
   - reg

 additionalProperties: true
@@ -38,8 +42,8 @@ examples:
         #size-cells = <0>;

         device@1 {
-            compatible = "usb123,4567";
+           compatible = "uvc-camera";
             reg = <2>;
             orientation = <0>;
             rotation = <90>;
         };

>
> > +required:
> > +  - reg
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    usb@11270000 {
> > +        reg = <0x11270000 0x1000>;
> > +        interrupts = <0x0 0x4e 0x0>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        device@1 {
> > +            compatible = "usb123,4567";
> > +            reg = <2>;
> > +            orientation = <0>;
> > +            rotation = <90>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..1503502a3aed2625e8ff488456ccd7305cc74ba7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26258,6 +26258,7 @@ L:    linux-media@vger.kernel.org
> >  S:   Maintained
> >  W:   http://www.ideasonboard.org/uvc/
> >  T:   git git://linuxtv.org/media.git
> > +F:   Documentation/devicetree/bindings/media/usb-camera-module.yaml
> >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >
> > --
> > 2.51.0.536.g15c5d4f767-goog
> >



--
Ricardo Ribalda

