Return-Path: <linux-usb+bounces-28832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C609BAF9E8
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 10:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDE919208DE
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 08:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329C28002B;
	Wed,  1 Oct 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oU76AIJL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E4279782
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307349; cv=none; b=OWH5XO5SeAcdtpmnUgWeN5ifCoV2pMtGX6T45radGtFmY8WKvKeNZF+3OjLXTx0z9iDwFCSEFpfe6hnj0XTRFkSR9kxbc8yqLuoXgwSUrUgCwjbUfrbDKHd0s2NEFMX4mbtuKAdMBNnHnLxFz2NBn7Y7UAAz2pXVtxmn41OxSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307349; c=relaxed/simple;
	bh=hG4jVSS9ILGofIp4mZ/cZW684p+U1PVIccOVZxPrkBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS9D6aS46dserYDTlZb40PtslMzs/GHRso8zMDErnD2v4viSGeNQNezsXN6Z+/KyDglP8Q4o7NVALQwg7BNVCbacoch0LRzU1hzWDuN3R6/OHxu7bF+nTElQrQO1w8S32mZiS/XDXb9UXoKIST20d3MZdN98ARyAL8I9olt0Wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oU76AIJL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-579d7104c37so9304704e87.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759307344; x=1759912144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wYh4jlz12Yg6BFy9DvX16quSObPthEsZ3uJXU60VpI=;
        b=oU76AIJLyhiy8Al6aXiwdPCIJkjZ3dckXI0wPiqH8l+SF18MnBYLUQKQ3LM68hmG7k
         ZS1qyth4j5xw3cq1Ntza5Sy8sy29Fm3pcKWSssOFwSAy1WWXZpEULXY6L8LMLLmCsLxp
         5kt3LmXtWZDLbqBj+59bOm/VNtV6orE5pplE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307344; x=1759912144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wYh4jlz12Yg6BFy9DvX16quSObPthEsZ3uJXU60VpI=;
        b=AkplXNhKqtQhkl8Z2VX9Xyc6dKO5A7JuNd07sV/VREVrZZVBp++J6Xg/LFMtaek5CX
         DSbWBoAiIIl95QEF1y/FProkgm2Lv2QCPk42nLchsizPczdq0De44s+SQFHL0Zil+ZfG
         LZFE9IpnlS3wlAYpuFR3O8+AaCdbgMWZ3cjM6K1p6WpesFwTCpDraI35PLfdFNol7H47
         IJdjzJNk2HmklKC3/FS7lbS7BqnFRC8ly2qeP8U6duV2Z2MRTayNfcUMju56aGxF7Mo/
         h7TkDjI3msRuJYo5wyq0p5nsnhV5rKisFroQYrFgDP1y059Vq8e/S4vx3gPyZFWsBBAc
         WeOA==
X-Forwarded-Encrypted: i=1; AJvYcCUeDyfoEfYx6+mkcEs0ew8hKaEXE3rUtcsv6iP98nUQsPBBYiloz+WCBpTSn7T7/MYMD9NSc125UhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1BuGCGylSnHoOoSjqRHRQ2d3JLUEmB2SdieSO7H181kVdnoS
	ZnmgOsZUkzVs6v8QSITatiGnd41EVCvklze0yYRy/RTJ2EyXIYQIMlmXQo9fUioRrqn709TjSwo
	8KQvhqttNa6UiM5z6RBhrAa7gUgmD7Ge783OeEwSeBw1AASbtVQ==
X-Gm-Gg: ASbGncvmzTRXvUbb0iHXlu2l/cO16R4lxkWOvv15PVkDhziciQ9Qn9aUfrGcuPNwZ6W
	g/vsOSxMPLkuPDkJDwHgaUtu+Sq2nLpKaf7dBZKwz+DiSnZpSTbK4EjWSbXBqnX6ZeqN/bBUso+
	B8CKLwr2upPduGZoRngAHQg2dG92+HjGG4LE9Jv/rXNfWOSBSSBn4KbT8MATQppiR7myqJa4G0f
	h3q6mP9bhO4meWhQrzQznai1u3v
X-Google-Smtp-Source: AGHT+IEu4J6EZWpNTIi+VcPDLlD1ABSRYKH1jDfLPLTGglMkIDxyOOwrBTDpVUD6QrgvvS4OduvqW+aNiA5hG/LmnDE=
X-Received: by 2002:a05:6512:ea6:b0:577:f5cf:ce5e with SMTP id
 2adb3069b0e04-58af9f6cb67mr673325e87.45.1759307344147; Wed, 01 Oct 2025
 01:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929090206.423937-1-ukaszb@google.com> <20250929090206.423937-3-ukaszb@google.com>
 <2025092924-nebulizer-overexert-4cfb@gregkh>
In-Reply-To: <2025092924-nebulizer-overexert-4cfb@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 1 Oct 2025 10:28:53 +0200
X-Gm-Features: AS18NWB4wXf-gsfm6VRJiYbpdXqVbsctmf4lCuAIXjDiRZZoWOHSgi9SrXju4jE
Message-ID: <CALwA+NZ1iKeyTh0j+A9cQWbVUO4jLvjOx4YnkdtE6e9mpxP0zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] xhci: dbc: allow to set serial number through sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Mon, Sep 29, 2025 at 09:02:04AM +0000, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > Add code which allows to set serial number of a DbC
> > device through sysfs.
>
> But why?  Who needs this and what tools will do anything with this
> information?
>

By default DbC serial number is set to "0001". ADB client on host side need=
s
to be able to differentiate devices using DbC and it uses serial number for
that purpose. Based on that this is the reason why we want to be able to as=
sign
devices with unique serial numbers.

> And where is the Documentation/ABI/ entries for all of these new ones?  :=
)
>

I will update the documentation ;).

> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/host/xhci-dbgcap.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index c2fecaffd6f3..5cc201afe8f4 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -1200,6 +1200,36 @@ static ssize_t dbc_bcdDevice_store(struct device=
 *dev,
> >       return size;
> >  }
> >
> > +static ssize_t dbc_iSerial_show(struct device *dev,
> > +                         struct device_attribute *attr,
> > +                         char *buf)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +
> > +     return sysfs_emit(buf, "%s\n", dbc->str.serial);
> > +}
> > +
> > +static ssize_t dbc_iSerial_store(struct device *dev,
> > +                          struct device_attribute *attr,
> > +                          const char *buf, size_t size)
> > +{
> > +     struct xhci_hcd *xhci =3D hcd_to_xhci(dev_get_drvdata(dev));
> > +     struct xhci_dbc *dbc =3D xhci->dbc;
> > +
> > +     if (dbc->state !=3D DS_DISABLED)
> > +             return -EBUSY;
> > +
> > +     if (size > USB_MAX_STRING_LEN/2+1)
> > +             return -E2BIG;
> > +
> > +     memcpy(dbc->str.serial, buf, size);
> > +     /* remove newline and terminate the string */
> > +     dbc->str.serial[size-1] =3D '\0';
>
> What if there is not a newline?

Thanks for pointing it out. I will fix it.

Thanks,
=C5=81ukasz

