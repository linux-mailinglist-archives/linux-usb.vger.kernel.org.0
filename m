Return-Path: <linux-usb+bounces-18592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4469F4F5B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 16:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D881881567
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 15:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9901B1F707F;
	Tue, 17 Dec 2024 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OneTmK/y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5A148850
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734449084; cv=none; b=mknuYv+pVpiIVztKeARXt0boFbm3A/8p1UylcEAUWq+y0De+4v9mnO4IPbjdFX3qdMLgV6YHj/41PSSEoQU5N6WUsqNsbswiZXbD0sipcXr6Tu1HLeJz24WQ/DbxZw/hwFBNzA/1QB6qlIdc4uSKtWDRoOhC3Usd92oML9wFJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734449084; c=relaxed/simple;
	bh=tJcj122iz7Jx3wrPNt7YdMvOP8Z5lwK8MmU44L9IfCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGfZrczDjQinQzf00/NCWKFJfea+7eC34z7h5oenAR9r2GYU2oz27ZZoKn8OAfv7bjw4Y+A4zY0o7ftbjm/Wt+d/wOGBOK0Y++udqJ47stJ5yYemnMbEgRgw1CHHziwWbAQFerLBqQeN4vTO5/+duONiWpWlX9GQVAWI4KeL4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OneTmK/y; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so4768671b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 07:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734449082; x=1735053882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0H8dpphBiU338zp26XHA6XldVzXKyZfnCcMSHEK5Qec=;
        b=OneTmK/y2K6ddMDDlHySUYcAaGRDEAP0SRXLvOZttKrlIqYX7pC7iJyEetdm6x0UjK
         WZcrn0LsbG/h0dbqTJVUC3Dk9DFhg2ZP1hy3IHM+zFwXyxRBIFM7f4RPJoKqLGLKcbdI
         0OaTgl+4ivxjKr4AfvGo8PRpDgoiHt8NmGlWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734449082; x=1735053882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0H8dpphBiU338zp26XHA6XldVzXKyZfnCcMSHEK5Qec=;
        b=C4Z3ycJb8YWeGGzPQo6JanTefHXnGVJhms5Sd4+n/bjC6ChKDaVVhLLLsznn8yP6qX
         d++97kYIoMoBOwyv7X4nN49gF47ZArJ2l4wzeihDYi973HMjQVVuEg4zwZDbV9XNUPCl
         oPf8ehHLwB8ETJXUZxIkmuUhshQicyi1LOhuh5NZufGE+TaY8d0nibPtu7U0z5Kn/WAY
         aqeW6k0Iv6ASUxPfF2Ms1kdTZttxZqrnvawsNDocfCGRfDO2SJzGFJkjL0p53YrvWr7g
         3QFU5JQ3RhgEz3+KOJi+TrNUBRXyZ8gfIJuw1jvqkZbTaGMu0qsZ1M84+5a69WV4XsuF
         F5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVdbsUbWXvtgL6GfsFLJtDkbrtlHC2gchD5n6X4onnEcmT9yhNPrbH9PVnKYfJspxsRd+TjlWaJ23Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGnUCo3tup0XQgh19zycNgZx6FBaL8Jvy2DEjZJ/PAT1JNw7s
	z8idq7yNEwrJo/DSjo59OcRofLuPrQEnaX6nilct/I113aL7n7DdIsu7acVdzDzQLQPeP2emQsA
	=
X-Gm-Gg: ASbGncuJbHmNIOQ7KdFoS8UfdQuhNJYbP1Aa/kIn12tIk6PBj5/5TuesOuchq03kwi1
	mUO48NixJ/FjyOtAuPuyiOIfIs2Ib+MooZRAlWjt9gugugQZeHB8aqxtn1HBx9yZaJxrI76n0Ya
	5LVUY5+HRtxfHoj6/zKOkr41tJNJH/GDRhd3SLgMTYlZZaHMvoguhb0ZfytesJkJGGzBWHe1Zir
	O/ORZw9RIAI0mEuPGmk8jjC3XI83J3Dfoh+UP+dsBmCOcTAr1MEH2qsBp7lKtP6ylyh3EusgsLd
	w08E/yfdj8ZcBAfkswVmDdo=
X-Google-Smtp-Source: AGHT+IEZOwvePpLOtKdmg+Z5Wzv84/O7aZ1rZWBJJd8/nX9ESZmTXK8XFvddBVB8auKApw5lEMDzyA==
X-Received: by 2002:a05:6a21:c92:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1e3e6f36413mr7847093637.27.1734449081671;
        Tue, 17 Dec 2024 07:24:41 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bce8d9sm6797368b3a.200.2024.12.17.07.24.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:24:40 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd51285746so3199310a12.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 07:24:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBC6R+Vb0URkToe+nhgG5MQekGAL9skOy1wMIaJiTDAazpJNNugw6jaBgL8ZEf+GGqXHkxkvQ1EsM=@vger.kernel.org
X-Received: by 2002:a17:90b:3d4e:b0:2ef:67c2:4030 with SMTP id
 98e67ed59e1d1-2f28ffa7efamr22923781a91.27.1734449079297; Tue, 17 Dec 2024
 07:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org> <20241217145612.GA1652259-robh@kernel.org>
In-Reply-To: <20241217145612.GA1652259-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 16:24:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
X-Gm-Features: AbW1kvbl1RIFIvxrMQUN76wEj-BZmkCHKRl0SbByJH78c9Yqx7sfn6vg0uVQdIU
Message-ID: <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > For some devices like cameras the system needs to know where they are
> > mounted.
>
> Why do you need this and why only this property and not the dozens
> others ACPI has?

Userspace needs that information to correctly show it in the UI. Eg;

- User facing camera needs to be mirrored during preview.
- The user facing camera is selected by default during videoconferences
- The world facing camera is selected by default when taking a photo
- User facing camera have different parameter defaults than world facing.

Right now, the only camera driver that expose the ACPI location
information is the IPU from intel
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258

And they are only using the panel.

If we need more information we can consider adding more parameters in
the future.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation, but it is limited to the requirements of video devices:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property for usb-devices that matches the behavior of
> > ACPI's _PLD.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6..1ce79c1c3b31 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -42,6 +42,20 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  panel-location:
> > +    description: Describes which panel surface of the system's housing the USB
> > +      device resides on. It has the same meaning as the `ACPI`'s `_PLD` Panel
> > +      object.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 0 # Top.
> > +      - 1 # Bottom.
> > +      - 2 # Left.
> > +      - 3 # Right.
> > +      - 4 # Front (aka as User Facing).
> > +      - 5 # Back (aka as World Facing).
> > +      - 6 # Unknown.
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> >
> > ---
> > base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
> > change-id: 20241212-usb-orientation-8e3717ebb02a
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda

