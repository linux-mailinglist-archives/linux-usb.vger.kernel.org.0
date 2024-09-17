Return-Path: <linux-usb+bounces-15198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2A97B549
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 23:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 638E31C21B50
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 21:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D80189F30;
	Tue, 17 Sep 2024 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu1DPQn1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CC1531C5
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 21:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726608967; cv=none; b=QGQxOoD9O/+7C23W3JC6jZCyOmSRlYytu/3ccESYm3B75ZrpnHhfsa4FKx7kjpYI9Ki7IV8KJh0dDu0faoSMDXQt2jrFnLwAQtuBd8BiXnfXoAzDtH/Os+EXS2vjKvsyWMGH11IMB0IY4/P5ljefY18zhDSLODKMe1j7kou39u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726608967; c=relaxed/simple;
	bh=tFq/HKMi74oH8+3M5IxRhlPNdmQrtT7LYJ1rvNUfZWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZYPzjoNDfayg95YLs/13KKNASLjtJdyzxmmBq6GEuXS6JsqeqMV192P89kJh7m6W1aDLn9xkaTB8GeUr7pVUwN+Ys81C8tw6oJ8bSc0xT8OxPKTlkgXeLRgo41xNUZ2GXq3KtIdj37vx99d5eU6YW9OPjA7ez/s+vi3jnjAoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu1DPQn1; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49bd250b0f2so102324137.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 14:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726608965; x=1727213765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNwpcMVzg14GxZheYVMj33zwCB6lC8398cCoBk2eB6Q=;
        b=iu1DPQn10WyKCZOwVHzBKKMYRU2xzCJ8hbY7PpnZzuykS1tWH7LjRmgsIuIyY8ipnF
         uAAAsa7Ja3J+1jV2eMJiJ9EnragEWTsiopEFq4MXXTtmDHmrexKRMAWG4PwZp5wXt7ji
         lAR75Nwsxrhkr77J3Krp4/S6dbxJ/hIkcMGF5Ngczw0DNoc8bTfCZTgXC32Vw8S1tJfH
         6p9uTXyvw1VmVQKRrUhoHl941gisWmDyGfm+KACPlTX/PColBvGQvngBs8VO5D8i40rD
         +tfz+bPd1UN9VzI/OpvySRFFLd4Vc+ANDSVET4JObmksn3QChZk0F+ew/AmEptSKsc91
         v2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726608965; x=1727213765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNwpcMVzg14GxZheYVMj33zwCB6lC8398cCoBk2eB6Q=;
        b=aYybIUFXJDFFR+sDjgS+Z2dPlL60R/kcWbBP20U9vvunNLPAJpWDdwOk/rHH39BVxE
         16GLvh01Qw57kYKIID4JFmwTp7mvSEZXotf/gUXmRRKblh1+HX1gj4z47Ea7Pmyt1Evy
         Y4HQUus2TyPcACVY4kIzdAvm+5QPAvM5469MSwuf1bhKQjoVWcIFM70BZsZ+CF7L/D97
         k84kVckRMZC3iYSHRXH36vqdQMFYClAD5vv4Xf8Z1QoR2VhCQLq6vjS376rAPv4w7Pp6
         nzvmWhX63GBkVkCAiL54s4lUK5RqmwB+03nOwnx54bDm3A/rdblEENdqrfLD78caSLTU
         Bn1w==
X-Gm-Message-State: AOJu0YzzV1zmcu/Br0PppFySnK2qQSgkYB7I4LVlhEuk7t8auqhyw3An
	OULralVqvmJx/3vGxoxE/LaJEWSVIw5FX7ocWjFgDNflaOA0JFQGqFbd4G2AQ22f2VUn4vRKH6Z
	TshoxVmXTz2ic8lm8GBXHs7BaLqE=
X-Google-Smtp-Source: AGHT+IFX7H7ao7H0Evq1D1F4FpwddDPcHZrvNiiEuaaUUbKMtHb7fZiKLn5AdXDOd806k2ycWRn7ClDg/b6nuwk0fUo=
X-Received: by 2002:a05:6102:54a5:b0:492:98bf:75ef with SMTP id
 ada2fe7eead31-49d421897e7mr15482236137.8.1726608964795; Tue, 17 Sep 2024
 14:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
 <2024091756-gathering-ocean-ba9c@gregkh>
In-Reply-To: <2024091756-gathering-ocean-ba9c@gregkh>
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Date: Tue, 17 Sep 2024 23:35:53 +0200
Message-ID: <CAKHHu8paEWRs6qA9Y6v35z_JzcXGKdJwfCjQwOn90kJScAJoGw@mail.gmail.com>
Subject: Re: PATCH: Fix problem with xhci resume from suspend
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Than you.  I resubmit the patch.

Jose Alberto Reguero

diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
linux-6.10.8.new/drivers/usb/host/xhci-pci.c
--- linux-6.10.8/drivers/usb/host/xhci-pci.c    2024-09-04
13:30:16.000000000 +0200
+++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c        2024-09-12
19:37:14.378870385 +0200
@@ -76,6 +76,7 @@
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI               0x1142
 #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI                        0x1242
 #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI                        0x2142
+#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI                        0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI                        0x3242

 static const char hcd_name[] =3D "xhci_hcd";
@@ -447,6 +448,10 @@
                pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
                xhci->quirks |=3D XHCI_ASMEDIA_MODIFY_FLOWCONTROL;

+       if (pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
+               pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
+               xhci->quirks |=3D XHCI_RESET_ON_RESUME;
+
        if (pdev->vendor =3D=3D PCI_VENDOR_ID_TI && pdev->device =3D=3D 0x8=
241)
                xhci->quirks |=3D XHCI_LIMIT_ENDPOINT_INTERVAL_7;

El mar, 17 sept 2024 a las 22:45, Greg KH
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Tue, Sep 17, 2024 at 08:47:43PM +0200, Jose Alberto Reguero wrote:
> > I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD,
> > and other from ASMEDIA. The one from ASMEDIA have problems when resume
> > from suspend, and keep broken until unplug the  power cord. I use this
> > kernel parameter: xhci-hcd.quirks=3D128 and then it works ok. I make a
> > path to reset only the ASMEDIA xhci.
> >
> >
> > Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
> >
> > diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
> > linux-6.10.8.new/drivers/usb/host/xhci-pci.c
> > --- linux-6.10.8/drivers/usb/host/xhci-pci.c 2024-09-04 13:30:16.000000=
000 +0200
> > +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c 2024-09-12
> > 19:37:14.378870385 +0200
> > @@ -76,6 +76,7 @@
> >  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
> >  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
> >  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
> > +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI 0x3042
> >  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
> >
> >  static const char hcd_name[] =3D "xhci_hcd";
> > @@ -447,6 +448,10 @@
> >   pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> >   xhci->quirks |=3D XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> >
> > + if (pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
> > + pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> > + xhci->quirks |=3D XHCI_RESET_ON_RESUME;
>
> Something went wrong with the whitespace here, can you try sending it
> again?  You can't use cut/paste from a web client for patches, the email
> documentation should explain how to do this properly from gmail if you
> have problems.
>
> thanks,
>
> greg k-h

