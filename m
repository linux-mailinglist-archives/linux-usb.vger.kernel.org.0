Return-Path: <linux-usb+bounces-22596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA3A7C4F0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 22:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F03189F7B7
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 20:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6207B21E0B2;
	Fri,  4 Apr 2025 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpegDKBt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E2219A95
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798690; cv=none; b=QZzg0AwIm786RjZJ+tA0wXEv7h0Gsy4SCYa2PTfP9/dGg8b3MGH+PzNXwK2SGTbFTfcIBYKywKKFeOclJDXcdbYwZtB6OkHumoyoYUyzGZZB5ohjZysa9ZUckbIyhXh5DYznLREemqtq4DGrlg7MTbv3RNVC5rV8I7tw2ynYTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798690; c=relaxed/simple;
	bh=K+GdwcY2qpId+FVrrOCPmblpwWNGwzjXOxhMwE/cWk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS3+9DW654ipMxupg+9j1lEzIsunWPkcBy/cjexm3K3y6X0mLnQeYEDK64PcIRbK7a3DOf4Y3mJTPsHAQoy0bQjFA7n3e9rXow0jMdObC734eUih+4fpk/r+jyneqHURiOQYImpBeLZ06uBFGcw9F0hVwsZW14h7jaQJc1nr4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpegDKBt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5497590ffbbso2537142e87.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Apr 2025 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743798687; x=1744403487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=BpegDKBtUvmMIDHI2V9LL1TsQ1ZgZBVYVrml0LwKEOeWFgCkvfneHAFe72JRNkpl5f
         jrOWwx2rCD3uP6675+OWJf5n2nKaafD6LBXVCRYNAjuz9Q7goakdJg7NSVGBg/nzcJZC
         0O3ogYgO+nXUwKzHGw8bIfxUEj5/BlEv337hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798687; x=1744403487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=uzzxt2D8oMoVK88NqPR3ix5S/fEsigccRjxE7z59QF+FCpfwI3yQ964xgq6kbPAkeb
         hCnIWItHNOt+OsD9Rd2zcKDZZNIqh+1BVwtiVnVP6fxgP7stcrHWXxOcGPJ69kUl/DTv
         +iPZ6Bk7WF5HCDAdNFOeOlFQEdb/H+MWXVGOzXktjm/Njg+VxN+bW1Mpv5OpKHgBztm4
         o//PoEellY/RIr1wAgQ8lQCnjfOzVGFeNnr1rRe3UUjNciXs2l4MigkCrsUZcED9q12x
         08p5UeUpKKfk1dGZlN09Pxw9xmbXq199HTUHJoQMAZYtOIbMacLSVcERjD9EO82OxNDq
         91iw==
X-Forwarded-Encrypted: i=1; AJvYcCX9dWBZvqGiWzca2niFmdDOKW7zB6WzhZT00oNvLbTP21PhdL2iyhkBuCzrQnSjjdEbrxgzH5UIGn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaTbG+62Ahl1f9yuC7eaA9sQEzNASAS5Xfv9VReNwQuwsigxa
	UZt32N8Chq5QBvFdlQ9WRDz3nyJYuxX9opblyeuFZj/4vswtHMGa+Ba7TpRct9mz+Kq3bhw/k6I
	=
X-Gm-Gg: ASbGncvhWS2FAGXdv3TjkE05Ftzm73k2Z7KOK8EItBPkcvfCrhXIKlP03vb1E3ibV4V
	zjPEElqrG/oeUOT2AM8R/tqySnwh1pwN9R9w4XSYpWhBehdE7BngfeccsnGs9B2g/mSuqtRal1D
	foyzr2reL5YVFbhsfNnWWHkm9DpYCVCAJ1CqK7efJTQwsHLEUVjNdtlJKWcoEJKtPcGLSh49ypq
	ygT1sgmfX72l8B3YE7cEJmMGEz2F0Qqe1155qfvSSN4LE3gm5a7ejtKuVEY74cnyPd09mz4lO2F
	oFkllrHxYEKcbtST2HLN0S6ab16NWczRoEcjEyG3kxG90mbVxsTo4kQ4u8HJ7ti3dx5z3McnCFt
	6ie4rripgLx0=
X-Google-Smtp-Source: AGHT+IFPTrS4sbgxZuqejlqixlj2hjtz5BtezZiT2ApHX8n6NBYZiFVwo2CCDXVqEZdyKUQ+vkhDpA==
X-Received: by 2002:a05:6512:108e:b0:549:b0f3:439b with SMTP id 2adb3069b0e04-54c232dfbffmr1477363e87.16.1743798687083;
        Fri, 04 Apr 2025 13:31:27 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6723c6sm522789e87.236.2025.04.04.13.31.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307325f2436so24763011fa.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Apr 2025 13:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpJjlAPhLne4cvKsoTKhyhhbEyOh8/7bcx4vacwqg4UjJWaRBkp7BAtLVlsb6/8omRXJu656Tw/Vk=@vger.kernel.org
X-Received: by 2002:a05:651c:1581:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-30f0c064658mr16422321fa.33.1743798685456; Fri, 04 Apr 2025
 13:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org> <20250404193655.GA158858-robh@kernel.org>
In-Reply-To: <20250404193655.GA158858-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Apr 2025 22:31:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
X-Gm-Features: ATxdqUGWjyuS5jbxrI5_afZO8VPXlqKA2MK8tNbiaf5xCWtDa_Llt0RuBZ7yskM
Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Fri, 4 Apr 2025 at 21:36, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 07:16:16PM +0000, Ricardo Ribalda wrote:
> > For some devices, such as cameras, the OS needs to know where they are
> > mounted.
>
> Do you have a usecase that's not a camera?

I personally do not have other use cases, but I suspect that it could
be useful for more people.

The original proposal was more generic and "inspired" in _PLD:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

You suggested using the camera's orientation.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property orientation for usb-devices that matches the already
> > existing orientation property of video-interface-devices.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
>
> This is a binding for *all* USB devices. This property should only be
> added for devices where it makes sense.

Can you provide some examples of how I can do this?


>
> > @@ -42,6 +42,10 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb device.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
>
> Reference the schema from the top level and drop
> '/properties/orientation'.
>
> What about 'rotation'? Seems like you'd want that too.

At this moment I do not have a usecase for that. But sure, once I need
it I will add it the same way.

In the last thread I proposed Sakari to use:

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+

But he preferred to add orientation instead. Either ways work for me.


>
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> > @@ -101,6 +105,7 @@ examples:
> >          device@2 {
> >              compatible = "usb123,4567";
> >              reg = <2>;
> > +            orientation = <0>;
> >          };
> >
> >          device@3 {
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >



-- 
Ricardo Ribalda

