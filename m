Return-Path: <linux-usb+bounces-6850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93785D3B3
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 10:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B59B1C22088
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFA83EA6F;
	Wed, 21 Feb 2024 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1szKGibc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4423EA6C
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507942; cv=none; b=gMNrxVxWf7AAU7g6WTBSicA/tctRgKKzqV8CbHNzx2eYL6xMmhT+kekUsJKpv4J2En2dQ3D9MagS101bjt90RkkEBK6EdXROEjOAXrajQxR2jNrTXJ1ffK2T8sjKsw0KQ3El494Ti+iwpESR2DRpg+DWUBA+YsZnyAyKNzLcNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507942; c=relaxed/simple;
	bh=HTwvLB7T1L1Poz7x884Uo7kro/UImc//DNqb9lBB9sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFjY55DEveJxD1gdAnfe6hEPqLI+nq5mnI0ZRCv43K6cfbSB1LcuH/EwXmoEUcPWDGLSLFVmePEbWEgfjAxbqVXtHXbNE5lvfR8q/hwKY2LZIC/ZOUJ0oIS2oZiz2/yoGGKCKqmQu9hqJBRCbUA7gWz1021qHji6blWLzS4ycqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1szKGibc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-564f176a4d5so9096a12.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507939; x=1709112739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2V0aAXJ91ptnQzwqCZMFWJuW/dvrtJyVEM8rU1z1/k=;
        b=1szKGibci0wNy/xfV2rHHEc4J6z6YrGCy52C2CAYY+5FoVfAPGaszsb9L3HTTC2Qv6
         XorxQS3K7Brxzj2+IS2pzmmiJI++qw02MKLjul5POJ7SmmVS4skCIcx6WwZ/+2DpiQVR
         ceKqBSSbozNVhPrfIWB+QqR7zKx2D5MU09kB1YNnAbzIfjUOjTC1OBN30MEIQS5attS6
         bKur/Qr8oHfkrUqIyuuw79aF8b3+H5QW69h2cATh5EDi5P+y8ucOjOiHbiqjvhPcmAYn
         066sc1/TCIrDpa0PCLgw+D60mDFXSgSZxQWDxDMjCkJaps0sWihkuVjrRxa5LdmJ6K8u
         PRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507939; x=1709112739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2V0aAXJ91ptnQzwqCZMFWJuW/dvrtJyVEM8rU1z1/k=;
        b=DlfMNQTs74Hf/wfUFmOt35kIY2bwzXmyvSgJpiJye8q89xc0RcwmidgytWnRcU6L30
         W6aM2nlXJC4OiqjvDf3lkXlqpx3T1Mpz3DxvBQ+vCPPCuv7QxjJr6B6RHUAYkZq1no4t
         ZxrCVePPK6Vrr7Zk4XI/iMgf204x31tqdnwxIjmNk5x7zxTOI6A/7CTNAPazpRJoh7wP
         DEc6bUpqaGKiXddkSu1SwD6XX1JrviEOZTBcHdWrpuHhXc9oMZMY0uHm3F9NJIv50niz
         63YGYRKCXRXhQqilr7j6IpQ+GGGNAQ3oeoK+cueYzPq6czBf5pLyb8MMNDEQUHf8O4E+
         aUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXumlgd5eWYQDqS5F00NaqDwDFTMwXwjhFiXqit7qoRnV25atdc73eqrNHNcitSKDBFm2ufeMQWKqXWYyIWO1zQ7WQSey5YojrA
X-Gm-Message-State: AOJu0YxCaQCWyneuD4oUxl3Xf3Mos3G8NBGsRTBfvqvoRTBz2TdmeJkM
	DviFg4E/4VnxILjTsU27g8kxyzUDYqVdFXt5Fsg5Cqy+aSbQPcRJU2Rg9FzCkfv2aLBzxNYjK3f
	CPTXh9s5kAU9n1CGdBqalNW4+W662ax1BY2d/
X-Google-Smtp-Source: AGHT+IGzBBHcDeoPTJxTms4PVKWY+MIMwcSrlqPMK/4oD4TISUVArXvzc8XHLEyJ6MltPh/oC0OnZdOC4UiS6df6WMc=
X-Received: by 2002:a50:d710:0:b0:561:a93:49af with SMTP id
 t16-20020a50d710000000b005610a9349afmr76210edi.7.1708507939044; Wed, 21 Feb
 2024 01:32:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219061008.1761102-1-pumahsu@google.com> <20240219061008.1761102-3-pumahsu@google.com>
 <0b4464eb-631e-4c9f-a7c8-3451be15d8b4@kernel.org>
In-Reply-To: <0b4464eb-631e-4c9f-a7c8-3451be15d8b4@kernel.org>
From: Puma Hsu <pumahsu@google.com>
Date: Wed, 21 Feb 2024 17:31:42 +0800
Message-ID: <CAGCq0LYFMrFmxeKZE9g-O61+N03rJoGL0XvXJVya0Yx-ZasvBA@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci: Add support for Google XHCI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	Thinh.Nguyen@synopsys.com, badhri@google.com, royluo@google.com, 
	howardyen@google.com, albertccwang@google.com, raychi@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 8:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/02/2024 07:10, Puma Hsu wrote:
> > In our SoC platform, we support allocating dedicated memory spaces
> > other than system memory for XHCI, which also requires IOMMU mapping.
> > The rest of driver probing and executing will use the generic
> > xhci-plat driver.
> >
> > We support USB dual roles and switch roles by generic dwc3 driver,
> > the dwc3 driver always probes xhci-plat driver now, so we introduce
> > a device tree property to probe a XHCI glue driver.
> >
> > Sample:
> >   xhci_dma: xhci_dma@99C0000 {
> >     compatible =3D "shared-dma-pool";
> >     reg =3D <0x00000000 0x99C0000 0x00000000 0x40000>;
> >     no-map;
> >   };
> >
> >   dwc3: dwc3@c400000 {
> >     compatible =3D "snps,dwc3";
> >     reg =3D <0 0x0c400000  0 0x10000>;
> >     xhci-glue =3D "xhci-hcd-goog";
>
> NAK, that's not DWC3 hardware in such case.

By introducing this property, users can specify the name of their
dedicated driver in the device tree. The generic dwc3 driver will
read this property to initiate the probing of the dedicated driver.
The motivation behind this is that we have dedicated things
(described in commit message) to do for the XHCI driver in our
device. BTW, I put this property here because currently there is
no xhci node, xhci related properties are put under dwc3 node.
It will be appreciated if there are alternative or more appropriate
approaches, we welcome discussion to explore the best possible
solution. Thanks.

>
> ...
>
> >               return -ENOMEM;
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 4448d0ab06f0..1c1613c548d9 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -61,6 +61,12 @@ config USB_XHCI_PLATFORM
> >
> >         If unsure, say N.
> >
> > +config USB_XHCI_GOOG
> > +     tristate "xHCI support for Google Tensor SoCs"
> > +     help
>
> Please always Cc Google Tensor SoC maintainers and Samsung SoC
> maintainers on your contributions around Google Tensor SoC.
>
> Anyway you just tried to push vendor code to upstream without aligning
> it to usptream code style and to proper driver model. That's not good.
> Please work with your colleagues in Google to explain how to upstream
> vendor code. There were many, many trainings and presentations. One
> coming from Dmitry will be in EOSS24 in two months.

Thank you for advising. I will find the training and study it first, and wi=
ll cc
the related maintainers in future code uploading.

>
> Best regards,
> Krzysztof
>

