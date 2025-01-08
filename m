Return-Path: <linux-usb+bounces-19128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4228FA0574B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC151629CF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 09:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB531F63C1;
	Wed,  8 Jan 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V46drb39"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4781F191D
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329733; cv=none; b=O0wXVidHNrRC51/vdbyje4j+zHUPiIaWlN7Mul7AMILWsgZ9L3SHqi9U5Fna53O18Y7aMzHY7A9P6Ndft53Gq1DlJUTbGaDQpUnjHDki1fk7yIll2ZBoxPKCvfx03NIdTV8/6gvYmyeIIeFjd/EZr/gM6mpaTOF6ulvXGClHd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329733; c=relaxed/simple;
	bh=dQncI0ktjel5xSqHF4JOm7H0UK94916iCb8DNc4ymJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+6RxG3sLdiu3RP9fCiMUWO30iOGACgzfKa/IIMGYRdylztntWJdqV8wT73qNbKAT8YMpMDsNh/IJy0TQPWL+rz6+ZhVsasrm2tylJLmsmushH7WqkPFDsP4H+Xx3XdX7LtI6STQxKIrYnkgtdC4TMZCg1yoKNa+1fodiOY0JfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V46drb39; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e399e3310so19210474e87.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 01:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736329730; x=1736934530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Flo+9iY1gDry166LdLpjdtxxxCGnY5ixUXhDKm+YgbI=;
        b=V46drb39iogmuKZKelXKPNeb6JG3DP/2RTTwNfZS5gYivq+l4U7mtEEMzAfn+JTtQ2
         X77J00F1VuL0TmWbjAKj/g/HWDcGQJns1aEclZhG0uMVwuYzezHywAMwTkup0a3W2BlW
         97l8kuOWnLOAwUiQvFdOyQdK+jkPcI9TutU5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329730; x=1736934530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Flo+9iY1gDry166LdLpjdtxxxCGnY5ixUXhDKm+YgbI=;
        b=c5dK4eSByBw5wHc8VBqwoH4O2yA0sMBBK5zkxXulWLDCG8GjWlCp/sQYwdCNPv1FdN
         /QULW/ROIWZyZTshCTEw09PBr3sH9AGun/Dq5m8CLiTGCWQYjkatniy7iyNlafIySMot
         Q2WyjghpI+Y2phgqeEZCOWu3vcBNsSw5E0w/pltKaYsK7o+LkONDA6IHNbx4mRVbNPD5
         tgP5z/jwzVA+1DRR5Nb96VPRHYilffPrWYFR90cEGAAHF45GApWp152+yTK2m2b3Cg/b
         Nsau+2SZlITePQnI/TPgyvkai0z2sSwBKu86aVl55hBPU/Nb4dl05cKVoJZ2mn9D+9h0
         mnbA==
X-Forwarded-Encrypted: i=1; AJvYcCUWyXy9QPu+B6Ipb5EdTh2UOIu6buje9c/AIQhy/Q6+shaGTPOSaWdrvAxqn7JKYWhNWaBVNC/rYLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJ9pV6nWNdCdRG7pQnQlOtLElNUi84DNrhGJjOP5AsajoiSIn
	PXJE5iIJsbsuRRqlAsRmRVE8BSmPGzMFfSvPBDoFBOoKwn2zBU2zbEah6g+tPFooRibp2JJ8Q0h
	K1w==
X-Gm-Gg: ASbGncvlRyI65Tw26/ocZ4tSq7raVwORONlZfNWfNqJM5Mx49Vzjj0NLE0uc0uanpdl
	MpkISRzUvS/FToAz2gMcD5HcB0Th3ffBSAMdMxBtEN8UVQZVwOFVRGUtfMm3GlDW9R9k+V/B+TU
	KyeiV0bHMot8/lFi/7Q2hR57iYltlTIbDv2d5t/KQ9WgHXEkA1QBd2oAw9q0T3sbdss7rK6LqaN
	PMfNxcTVKpo6Nk+aQ/cVnSFZFnT5D60eJaq0/KwNr1tiJZIDXrEpvA2BTRyo9mizzguNpZ4EEVC
	Tiu7YgtPWB1+zmZKB+I=
X-Google-Smtp-Source: AGHT+IG8tGqoT7eyKUKWlgkjIrQeloeWDm7fYsun7WUb1nd4Edv0U2zXZEyIRue4V9QBwVfwsb1CVQ==
X-Received: by 2002:a05:6512:6c6:b0:540:1fae:b355 with SMTP id 2adb3069b0e04-5428482466emr544685e87.52.1736329729792;
        Wed, 08 Jan 2025 01:48:49 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d29sm60543121fa.36.2025.01.08.01.48.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:48:47 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000dso18136138e87.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 01:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg0mob8WREtJCT3SIkc+swo/d3SixmoyXf3UgR3aWf+FniuBVTJzrBEJwczAdVQLPlWwBgOLnnFY0=@vger.kernel.org
X-Received: by 2002:a05:6512:b98:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-542848162f1mr595357e87.35.1736329726841; Wed, 08 Jan 2025
 01:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org> <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
 <Z347NA00DMiyl1VN@kekkonen.localdomain> <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
 <Z35BnplCOVyboSBs@kekkonen.localdomain>
In-Reply-To: <Z35BnplCOVyboSBs@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jan 2025 10:48:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>
X-Gm-Features: AbW1kvbkaO87sj3WnOUVmKsmBXbh4rZ7j_XWg9A-agvWreDOsdce04sffPDW3Wg
Message-ID: <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 8 Jan 2025 at 10:13, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jan 08, 2025 at 09:51:34AM +0100, Ricardo Ribalda wrote:
> > > > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > index da890ee60ce6..5322772a4470 100644
> > > > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > @@ -37,6 +37,10 @@ properties:
> > > >        but a device adhering to this binding may leave out all except
> > > >        for "usbVID,PID".
> > > >
> > > > +  orientation:
> > > > +    description: If present, specifies the orientation of the usb device.
> > > > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
> > >
> > > Do you need this for a camera or for other kinds of USB devices, too?
> > >
> > > What about e.g. the rotation property?
> >
> > I need it for cameras. I do not have a usecase for rotation now, but I
> > might have in the future.
>
> If it's specific for cameras (UVC kind I presume?), wouldn't it be
> reasonable to add specific bindings for it?
Yes, they are uvc cameras

Do you mean something like this:

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..bc80c1e7360f 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -75,6 +75,12 @@ patternProperties:
           configuration value.
         maxItems: 1

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+
 required:
   - reg

@@ -113,6 +119,9 @@ examples:
             interface@0 {
                 compatible = "usbif123,abcd.config1.0";
                 reg = <0 1>;
+                image-sensor {
+                  orientation: 0;
+                };
             };

             interface@0,2 {
>
> --
> Sakari Ailus



--
Ricardo Ribalda

