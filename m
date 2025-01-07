Return-Path: <linux-usb+bounces-19063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C3A03C98
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EAF5164861
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 10:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5E11E47C8;
	Tue,  7 Jan 2025 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="csUP9/Xh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4E1E3DCF
	for <linux-usb@vger.kernel.org>; Tue,  7 Jan 2025 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246259; cv=none; b=Uw+M/2jrane6xOXVDPS3NX4MJBIPgpU7DSQoCQzsNY4OloErDzy1gomdPNbHEY7iVMR4c0aMsAk51bg92aq5mu8DuSwEgeGc4LYImOWmGVcWaDKAg4Rr7l2u3pTP5qOr+lifatZeAA8WBB7Jx83fYtx8PJx/8e4RnX9elf+ArWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246259; c=relaxed/simple;
	bh=Lh+/n9HnEBEdAUCCTHJ4xwiF31BrECarqzPMxOH/DsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irf27hEe3LnXmnYWiY9erWiPPsgdhQIVP9CYGhkl2licfooO5ZuNw37c4H0XpFWzbSJRG/dg09mvj/FvLRl2Ru51jmNWZFufWO5KNBMYRm0S2AfG1qmQx8u0Hlb67Z5QBipSHloU27eNFRyXTlQ0XyOOcfQJBBjVzgZEhWEuXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=csUP9/Xh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54252789365so8871905e87.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2025 02:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736246254; x=1736851054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1O4mtrUA8xb3bKiTsY1DsUybpMpm9vxH06xb7zcVj8=;
        b=csUP9/XhLBAYQ91UobDEREUUZS6K1NPyZb05wPAG4AMP1RbeMf74jElECDMPOk3imX
         bVFgYXwzUq3XW06hRJ8J1AIxThyf4xm+xOLneEa4CeSlKnh3I/RMN6vnDddxUgDDppcn
         pF7szmKTwzBH7RkLwveitm0wRRqiY87xdbmyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246254; x=1736851054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1O4mtrUA8xb3bKiTsY1DsUybpMpm9vxH06xb7zcVj8=;
        b=ZIdPiHtNqjd5SZVjKlvBA+RRtGBy38UGIdpmQNa+oX2Fbv50qpj2VofK8HObvR83zh
         rmY+GqJAzTWA1hd6iyelMyOvk5ShESVGzgsFN8ESw4a4fdTlgTe1t2ovYkokUiqXEu7F
         hTVBrFJjxofigU42PVQ4EvUDdEp/kV6n0Uhk58LaaOoIeJ73xpPf6YcJWxGx+305tJsG
         2nhXxfegMN6uDl/oQNPhI3fAsxEOG2/OjrmAZA5D+BV9CV2lsK0nOuwUh9OCIdf5CRqb
         e7PZRTICtpRmewUgPs+WBoJyEcPQGp3prAfd7D/8eraTTzVLXM6TT2maQkXJEln0Bfwl
         dLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3SmQVPFApjeiBHlyBr/kIZqjHxENX13bmbgI2YJeW7YrGiEzcE4YXI28/D0G80PXHR/nZkYufOiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8RrNRcDhxFeA/GAy1KGHI3YI4voVX7vemd6MyDx+34K77Iql
	vK9zkKSWHAzicEv4+j9YpI+7eJyaY2CEXp7z/bqueXZQywRFuP2BU0zxfdQcoadtFMC3H5dRNXq
	NhQ==
X-Gm-Gg: ASbGncuvkljndNxjQN+hkijHAWVov15Fvfhez4e1ni9eGMwuiWfkqv2hbfC1wHvcP3d
	XqgD9vj7BvRNN/rjxrk3V6FkXZ4e+Caw5y4UpvyUe3TItDVu4GAkybk9pgMf+B/gAP0Ftw4lUU7
	FNuPBL2W+s7WR+1PzqDr4BiYeQWowyRHtZqDE174Zw9ZRE/lrAURkW+Fsc0W4mxB+GJ/ZbVNBCY
	PKfuGwURGKejLSvNCwN8pOPUq7siu9kDgj8RTlodit/RnAOygGe/vVjI2cIhn7w21pVwG5MUMlC
	X2IGCfSwhRVDIFUOi2Q=
X-Google-Smtp-Source: AGHT+IHdf/MC3VmZzFb05vP2d77EZPfr9hOWe4YJALYVbQAX+/oWcI/wrmuwyH9um3hraVtdT+pU8A==
X-Received: by 2002:a05:6512:334e:b0:542:2972:4e1e with SMTP id 2adb3069b0e04-54229724e74mr12916797e87.12.1736246254073;
        Tue, 07 Jan 2025 02:37:34 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135a0sm5225014e87.151.2025.01.07.02.37.31
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:37:32 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54252789365so8871836e87.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2025 02:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4qyERw4/nBFE8eVBby+D0Hg05YLNWzGBnl/AfoirK6zTFxsc9sK1seTVO0x/pc7KJhopQtIdAHOg=@vger.kernel.org
X-Received: by 2002:ac2:4c47:0:b0:542:22a0:9b35 with SMTP id
 2adb3069b0e04-5422959cf96mr17743735e87.53.1736246250788; Tue, 07 Jan 2025
 02:37:30 -0800 (PST)
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
In-Reply-To: <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 Jan 2025 11:37:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
X-Gm-Features: AbW1kvaLMLtXTjaById0Tmpn7DhVioJNoXfnhWB6MVdCLMx7bGwuyZWBT_mX3CM
Message-ID: <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Dec 2024 at 23:00, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 19, 2024 at 6:42=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > > Hi Rob
> > > >
> > > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > > > For some devices like cameras the system needs to know where th=
ey are
> > > > > > mounted.
> > > > >
> > > > > Why do you need this and why only this property and not the dozen=
s
> > > > > others ACPI has?
> > > >
> > > > Userspace needs that information to correctly show it in the UI. Eg=
;
> > > >
> > > > - User facing camera needs to be mirrored during preview.
> > > > - The user facing camera is selected by default during videoconfere=
nces
> > > > - The world facing camera is selected by default when taking a phot=
o
> > > > - User facing camera have different parameter defaults than world f=
acing.
> > >
> > > We already have "orientation" defined for this purpose.
> >
> > Do you mean orientation from
> > bindings/media/video-interface-devices.yaml ?
> >
> > I see a couple of issues:
> > - Orientation has a very specific meaning for USB typeC. I'd prefer if
> > we could avoid using that word.
>
> Yes, but this is tied to the class of the device, not the bus. I find
> defining the position for USB devices confusing.
>
> > - For other applications different than cameras it might be useful to
> > know the positions top, bottom, left, right, which are not available
> > in video-interface-devices
>
> Other devices may need some of the 20 other properties in the ACPI
> table as well.
>
> > - The value "external" does not makes too much sense for listed usb dev=
ices
>
> Then don't use it.
>
> > - It makes our lives easier if dt and acpi have the same meaning (less
> > conversion)
>
> We have little to no input into what ACPI does. If we're just going to
> copy ACPI, then just use ACPI instead.
>
> > All that said, for my specific usecase, reusing orientation from
> > bindings/media/video-interface-devices.yaml works... So if that is
> > what you all prefer I can send a v2 with that.
> > Let me know what you think
>
> We already have something for cameras. Use it.

So you are proposing a change like this?

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..5322772a4470 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -37,6 +37,10 @@ properties:
       but a device adhering to this binding may leave out all except
       for "usbVID,PID".

+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientat=
ion
+


   reg:
     description: the number of the USB hub port or the USB host-controller
       port to which this device is attached. The range is 1-255.



>
> Rob



--=20
Ricardo Ribalda

