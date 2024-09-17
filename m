Return-Path: <linux-usb+bounces-15199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6E97B594
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 00:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E68F2830D7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 22:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E353D178CD9;
	Tue, 17 Sep 2024 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArKr4aIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C473415B0F2
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611029; cv=none; b=G7fnmcJwwU55pRxw+4OJy2G8Dgp/TDOsFDqTFkvNqr25q1eGfqt7ZzmzEL/eFaDgSveMp/VfvWAxNPo/WKMc961lT+AeFxhug/gSVyiagppTc2XnsFyPVKqdIfVqmXOCaL+guIME9TQVgqZSTR2vxBoa3hRiJUxvgTYpbpMyXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611029; c=relaxed/simple;
	bh=cyQ+J/rxi+BkozIW0MwUt9eFlCjrfVUP100sry1rkDU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wpm0hIEBo6NuzEjr0rbhMpZxdczUiHJvwPA/O/eo0mMXj8DKKu6BgOyN3OdyfJdWNFxd0pGUo+JjADELd+NtANgOXEOxmzZms0EI+c4LMpdSbbTDca0a/vRFYCw4Aw+fdD05vBBRT46/BQmnz+5zp8kqfAyahgH5nwrosv3behY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArKr4aIY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cafda818aso59777885e9.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726611026; x=1727215826; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VOqeZpBUfsFzXqWxSpZSBqTqHba6MGOPhOsOyyCShQM=;
        b=ArKr4aIYAllf1enRU8AGn4/UoYDxjARbDLzFuUcmhwcYhWnmSUM4BGTrKo3+KdNrky
         Mh5jlUBB88YQ5bqq6w5c4FIfeigByHNQdXj2MlsyMjmQbmP5mDabyCj5Dqz6sKws914B
         vZqHVA/7QVjax3o7d3LKdwrNCBH1QbhWQOywg0hfIk2BX07+lb412H71rwM2nfeRlprw
         Nyc93kj1cxblKa/0Sk0nB3nlYB8XkLZPoOlNCMxSLMO4tWb4pyajiWTNXqVJ7QyGGBfL
         LSRRL5XtwJ4QDuPVVD1vxnOLsaokAzpdpKLyjSWPwiH+xo8uwkEC9xYlCRtbFDTwb5cA
         KGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726611026; x=1727215826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOqeZpBUfsFzXqWxSpZSBqTqHba6MGOPhOsOyyCShQM=;
        b=OPsbUrEW4W9o078MVopSAJQyBRUQLN8xQxDzU37fWS3lGvn7sSFfymM33YTUCGAGjN
         /nLa3aNJKgryALhe/emEfVaI0nG1q0SQEicf8TecHWJ575swPHBPi8rRy5MxGoWS+m3x
         e987EdgTCsCAdxS8is+wcF3F26aAwBwNT76HWZQZFe0oBIMFpVEE5Rx34iCd4/W2kGkU
         k5zgYcRlmrMLrnpGrJEZETY9W83mdKSCwK/V5vqwBdUsuU20YcLToQozhth7/jwL3EpG
         5O45460++pisNRDUhrwWP0HDyGuKOLB2bcqV/TQjNnXEYiVvh+icrB3+edZ5znVqMaXM
         fAbg==
X-Gm-Message-State: AOJu0Yx17H2mlqGOCDe7lw49inJmgsfnw2lbh/AJVn7yI8MMLVdKEltW
	AugPsTb1yLpxEII/fY3kX7u6ZmWAKwuCBdWavOVRrvgLtAP703h3
X-Google-Smtp-Source: AGHT+IE65nqIUE9miq8Sh2lSZ/W8TSskyZmCYkWUfFvcbpy0LYp8VCEYlQgUgeOKFmqdL4Q8sE/gVQ==
X-Received: by 2002:a7b:c453:0:b0:42c:de34:34be with SMTP id 5b1f17b1804b1-42cde3436e0mr159890845e9.3.1726611025659;
        Tue, 17 Sep 2024 15:10:25 -0700 (PDT)
Received: from [192.168.1.97] (71.red-81-33-253.dynamicip.rima-tde.net. [81.33.253.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b055075sm150980425e9.8.2024.09.17.15.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 15:10:25 -0700 (PDT)
Message-ID: <018846f9a846e70d22f31203e4e8e93a1ee58de1.camel@gmail.com>
Subject: Re: PATCH: Fix problem with xhci resume from suspend
From: jose.alberto.reguero@gmail.com
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Date: Wed, 18 Sep 2024 00:10:24 +0200
In-Reply-To: <2024091756-gathering-ocean-ba9c@gregkh>
References: 
	<CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
	 <2024091756-gathering-ocean-ba9c@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

El mar, 17-09-2024 a las 22:45 +0200, Greg KH escribi=C3=B3:
> On Tue, Sep 17, 2024 at 08:47:43PM +0200, Jose Alberto Reguero wrote:
> > I have a ASUS PN51 S mini pc that has two xhci devices. One from
> > AMD,
> > and other from ASMEDIA. The one from ASMEDIA have problems when
> > resume
> > from suspend, and keep broken until unplug the=C2=A0 power cord. I use
> > this
> > kernel parameter: xhci-hcd.quirks=3D128 and then it works ok. I make
> > a
> > path to reset only the ASMEDIA xhci.
> >=20
> >=20
> > Signed-off-by: Jose Alberto Reguero
> > <jose.alberto.reguero@gmail.com>
> >=20
> > diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
> > linux-6.10.8.new/drivers/usb/host/xhci-pci.c
> > --- linux-6.10.8/drivers/usb/host/xhci-pci.c 2024-09-04
> > 13:30:16.000000000 +0200
> > +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c 2024-09-12
> > 19:37:14.378870385 +0200
> > @@ -76,6 +76,7 @@
> > =C2=A0#define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
> > =C2=A0#define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
> > =C2=A0#define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
> > +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI 0x3042
> > =C2=A0#define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
> >=20
> > =C2=A0static const char hcd_name[] =3D "xhci_hcd";
> > @@ -447,6 +448,10 @@
> > =C2=A0 pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> > =C2=A0 xhci->quirks |=3D XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> >=20
> > + if (pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
> > + pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> > + xhci->quirks |=3D XHCI_RESET_ON_RESUME;
>=20
> Something went wrong with the whitespace here, can you try sending it
> again?=C2=A0 You can't use cut/paste from a web client for patches, the
> email
> documentation should explain how to do this properly from gmail if
> you
> have problems.
>=20
> thanks,
>=20
> greg k-h

Sorry, submit it again. Hope this time is alright.

Jose Alberto Reguero

diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c linux-
6.10.8.new/drivers/usb/host/xhci-pci.c
--- linux-6.10.8/drivers/usb/host/xhci-pci.c	2024-09-04
13:30:16.000000000 +0200
+++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c	2024-09-12
19:37:14.378870385 +0200
@@ -76,6 +76,7 @@
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
 #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
 #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
+#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
=20
 static const char hcd_name[] =3D "xhci_hcd";
@@ -447,6 +448,10 @@
 		pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
 		xhci->quirks |=3D XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
=20
+	if (pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
+		pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
+		xhci->quirks |=3D XHCI_RESET_ON_RESUME;
+
 	if (pdev->vendor =3D=3D PCI_VENDOR_ID_TI && pdev->device =3D=3D
0x8241)
 		xhci->quirks |=3D XHCI_LIMIT_ENDPOINT_INTERVAL_7;
=20



