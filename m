Return-Path: <linux-usb+bounces-32775-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MjbeNmRgeGmbpgEAu9opvQ
	(envelope-from <linux-usb+bounces-32775-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 07:51:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF69082C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 07:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 723303008096
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 06:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBB232BF25;
	Tue, 27 Jan 2026 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwMoLssI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1BA70814
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769496671; cv=pass; b=bao3jEhMVDoRB45cceqYI0TMkj0whrSTYHQw+EWgLXmn6bT6dAzN4RIk2Z4n/MNoCCelqea6uwIOBYGa3u0xD0LV+nL+7rGA5NzHou3oY1fqHoTFJvHsWDvWESWTda2Uz69npBrT00M428FAAeGE7GHQdLahPKAq9BP07D25jxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769496671; c=relaxed/simple;
	bh=yIxMpRyUj2XNHwk2YqO6X0Y25t4o7PLmVTdpnfkex5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTTYZ4IR7vVbwXLxSnnC5GK5yyVtX/6jHINkcdYSd6/ccJsYvTObEroCwZrz8U8KJ3246IGu2uxsWH6wVrwgzlOBtuR08731y5+bBbra1gYDianKlh2xwYyi6AzBobtM1+fpB2+lWS033o5R2Yg0lA+Hh8aJ5IXrKihmh5bAWlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwMoLssI; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3777631f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769496668; cv=none;
        d=google.com; s=arc-20240605;
        b=S8bAa50hEvOgFME86oShb0B8W20hyfaPFwDIBIuq+SOU65uBBi5iBYkjiX/UapcLLd
         GaYUAk/vfzqzgg2htLA3UAUV7cxBxdlincHgO5/8Q9Y9IT1ZvIiBRUQJw1/u3XJnIGkW
         c25YvB3EiAt+xfa3EhnxoAcgW/vV+9nLZd610CFkDZZTGwdCH2d6mYLgPKgBfHe99Bu+
         7oy/fgleEmwuc29EY+8waJKpAX9yx8h4IdELVcUZgoh8tHI6YLuhGwnUr/bVweLT36Gq
         mg95Md4S2MFCbILHZB1bcykZXZqlNJyNUn3PzAQ1MvHuqV0OCQuMC2CjUzyIqev+5PuP
         rgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFJeEFZe5lPyo7nDdATW7baHNizf6P6JkcxkzQgtCf8=;
        fh=evacweDw+eZxXvD8mpxWxI/kGbImeQZkNYqmW7csMBM=;
        b=S9vVZ0dmu4/oT3HE0/nfQcqUmOVaAonXG6uioeQgYaSAWflUsBBYCCOAXBICsOiYm+
         UOKBFsPd7Ax91N5FGO6j9lnbF8C8YVZeUZg9eXGztZ1C3KaxtKW/6MoHPKR2BfOL3EWr
         HK5GnVHGV8/AcHFgtm+CYkN22TfDNgH2RTUez0Tv3UNYEkb4sjWv3GkWbdFvNBGCNBdO
         b7yR9ns3xx0/1NFMRlEogtnzIoKMfSYW9icyzwgil2tLIu7v9lkWbRpOjSkxnykLPdW2
         RW/LM0qTmxfPEJ69AX4Jg0WlA5NrkVsa4aj2ToRbZ5CtFp3PqgUziNqtU7M6WEkfIyVT
         g4wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496668; x=1770101468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFJeEFZe5lPyo7nDdATW7baHNizf6P6JkcxkzQgtCf8=;
        b=dwMoLssIXoldGY/3W30obwwG+9tz/883EkeYFThvkTjHiD/ZEEabZwZHJ5uKgImM7c
         uaN2bZ5idXsYLVYcJVUUuL8CCJHsaK6rJMpwBZmI3aGUgWHWfK5NlPkGnbM86VCD5zFH
         6cMgFIng444BouQOmFyP9IFRX+gQ/O6Yp1J7vKHY6o02/NA9siFpkhKOUvKJoup1N8E+
         zqCCGNlwYqS0KlEdRPLZ97ifBApzYiITXV06eu1dLLgmOc0zoA3eJJDv+yFdocQd6O+H
         68+sn658vEsF8cMDSW5gjNOe++9dw+HmWI3/Paeii9Bz8U2x14JQWoxGl4tKNq8Jvx3C
         XAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496668; x=1770101468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFJeEFZe5lPyo7nDdATW7baHNizf6P6JkcxkzQgtCf8=;
        b=qow8/gQvS9Q6wzyE8l1XLRmYOLAOj7af2cm4cqY+tL///ssjGiQe/Y7kmH/83pIiWs
         rhu/u0xccnrVlqymRNE8IiBsGwt4S+Pm7ab5CfqnY4q9nx58DFXkAmxkDuV5KkrsMVvB
         oSKl2GbisaMdKSg/SwVVR0uLPTFeAshCNWQTKnzmApnAjiUFDyW4Tm3iVLI+UbAQ8agV
         RSWuflkf4zx2Iw6F1S7TUQwHpeMZq1Eyvbvq5EDhmRyttJBiPmpuZUkjPDCj1ivPdXdb
         ipkeERHcrxRZ+g1QCrkrnBcMp2rRYEhfxOgMO0Z+gFePh8xcKPx6kARJdZy328hEJVR9
         M/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWhf76sOR+GbAGs9+SkMR3WEYc/UH+YOlsOCJPBm/2BSGGL+1sPTV3Q842US0fgHu7rsP3cX2W5Pxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOYmG1IH8EBaSqSuLU1zYZdMNTNivZj5j5FiYQz1EbILa6VYt
	nNKvO7WpoDZCD6rVhah/2rgbEmVZVRFKHP5MVR4wH5/46S0vgIEq1YjxyMzsk9jj410lWjNRhe0
	D/6LoAnAdtV/F/u/+RXJ3Q6NzxPHyrMw=
X-Gm-Gg: AZuq6aIIy/2D/8g+K7yAkjTznA3rgdHL0SZkKgDYAcvLig7OMsCRHYF3qiY3KhPk8QU
	ZMJ7BrEi95wzNdEog8j6v+JZ1nU6HhB0sk9nMta3BYCHcg7lbHcLI9dBSs4tLYZtLdfdxqhQfhz
	DmJB9vrfQEyN77xzY6D5OIhnle6rB113J44eKvBv8u1M0gSakhpWv95mFg+aXjfNB+MVL1ChqdG
	+OUEMv4DQjxN85HgsNt2WmJUt215HJ8/LrdK8LH+bSCi428RR/5e63AXHRW1ON1ICAxNa8H/QWl
	X+rBSDM=
X-Received: by 2002:a5d:5f56:0:b0:42b:2dfd:5350 with SMTP id
 ffacd0b85a97d-435dd1d92a1mr717056f8f.56.1769496667971; Mon, 26 Jan 2026
 22:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122151746.7745-1-clamor95@gmail.com> <20260122151746.7745-2-clamor95@gmail.com>
 <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com> <CAPVz0n2xcnvus_u4dYDGL0VcgkWfVOJF7=hKuMPrjsE4UZTNLQ@mail.gmail.com>
 <8a7ed9d1-c667-418a-a72a-d8d24ed0f9f8@gmail.com> <CAPVz0n1x9gWC0XzC0VQ=syT3LAm_5xof-_T5=8TzKapBQheVjw@mail.gmail.com>
 <8794178c-0522-4532-b21e-3904f90619f6@gmail.com>
In-Reply-To: <8794178c-0522-4532-b21e-3904f90619f6@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Jan 2026 08:50:55 +0200
X-Gm-Features: AZwV_Qia16yz4cjkLonUzhM3MgvtrsH8-cOz2C1nAmiC6yRrD_z264UytVpdxeE
Message-ID: <CAPVz0n3b6Oe8B2oyy3U6keFnH2X0GSvNrwJCjVUk5RAf+iwOug@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] usb: csc-acm: add Infineon/Comneon modem support (1519:0020)
To: Lars Melin <larsm17@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32775-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F2FF69082C
X-Rspamd-Action: no action

=D0=B2=D1=82, 27 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 03:12 Lars=
 Melin <larsm17@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-01-26 21:55, Svyatoslav Ryhel wrote:
> /snip
> >
> > Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> > Couldn't open device, some information will be missing
> > Negotiated speed: High Speed (480Mbps)
> > Device Descriptor:
> >    bLength                18
> >    bDescriptorType         1
> >    bcdUSB               2.00
> >    bDeviceClass            2 [unknown]
> >    bDeviceSubClass         0 [unknown]
> >    bDeviceProtocol         0
> >    bMaxPacketSize0        64
> >    idVendor           0x1519 Comneon
> >    idProduct          0x0020 HSIC Device
> >    bcdDevice           12.74
> >    iManufacturer           1 Comneon
> >    iProduct                2 HSIC Device
> >    iSerial                 3 0123456789
> >    bNumConfigurations      1
> >    Configuration Descriptor:
> >      bLength                 9
> >      bDescriptorType         2
> >      wTotalLength       0x0111
> >      bNumInterfaces          8
> >      bConfigurationValue     1
> >      iConfiguration          0
> >      bmAttributes         0xc0
> >        Self Powered
> >      MaxPower              100mA
> >      Interface Association:
> >        bLength                 8
> >        bDescriptorType        11
> >        bFirstInterface         0
> >        bInterfaceCount         2
> >        bFunctionClass          2 [unknown]
> >        bFunctionSubClass       2 [unknown]
> >        bFunctionProtocol       1
> >        iFunction               0
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        0
> >        bAlternateSetting       0
> >        bNumEndpoints           1
> >        bInterfaceClass         2 [unknown]
> >        bInterfaceSubClass      2 [unknown]
> >        bInterfaceProtocol      1
> >        iInterface              4
> >        CDC Header:
> >          bcdCDC               1.10
> >        CDC Union:
> >          bMasterInterface        0
> >          bSlaveInterface         1
> >        CDC Call Management:
> >          bmCapabilities       0x00
> >          bDataInterface          1
> >        CDC ACM:
> >          bmCapabilities       0x07
> >            sends break
> >            line coding and serial state
> >            get/set/clear comm features
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x85  EP 5 IN
> >          bmAttributes            3
> >            Transfer Type            Interrupt
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0040  1x 64 bytes
> >          bInterval               4
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        1
> >        bAlternateSetting       0
> >        bNumEndpoints           2
> >        bInterfaceClass        10 [unknown]
> >        bInterfaceSubClass      0 [unknown]
> >        bInterfaceProtocol      0
> >        iInterface              5
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x81  EP 1 IN
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x01  EP 1 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >      Interface Association:
> >        bLength                 8
> >        bDescriptorType        11
> >        bFirstInterface         2
> >        bInterfaceCount         2
> >        bFunctionClass          2 [unknown]
> >        bFunctionSubClass       2 [unknown]
> >        bFunctionProtocol       1
> >        iFunction               0
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        2
> >        bAlternateSetting       0
> >        bNumEndpoints           1
> >        bInterfaceClass         2 [unknown]
> >        bInterfaceSubClass      2 [unknown]
> >        bInterfaceProtocol      1
> >        iInterface              6
> >        CDC Header:
> >          bcdCDC               1.10
> >        CDC Union:
> >          bMasterInterface        2
> >          bSlaveInterface         3
> >        CDC Call Management:
> >          bmCapabilities       0x00
> >          bDataInterface          3
> >        CDC ACM:
> >          bmCapabilities       0x07
> >            sends break
> >            line coding and serial state
> >            get/set/clear comm features
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x86  EP 6 IN
> >          bmAttributes            3
> >            Transfer Type            Interrupt
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0040  1x 64 bytes
> >          bInterval               4
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        3
> >        bAlternateSetting       0
> >        bNumEndpoints           2
> >        bInterfaceClass        10 [unknown]
> >        bInterfaceSubClass      0 [unknown]
> >        bInterfaceProtocol      0
> >        iInterface              7
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x82  EP 2 IN
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x02  EP 2 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >      Interface Association:
> >        bLength                 8
> >        bDescriptorType        11
> >        bFirstInterface         4
> >        bInterfaceCount         2
> >        bFunctionClass          2 [unknown]
> >        bFunctionSubClass       2 [unknown]
> >        bFunctionProtocol       1
> >        iFunction               0
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        4
> >        bAlternateSetting       0
> >        bNumEndpoints           1
> >        bInterfaceClass         2 [unknown]
> >        bInterfaceSubClass      2 [unknown]
> >        bInterfaceProtocol      1
> >        iInterface              8
> >        CDC Header:
> >          bcdCDC               1.10
> >        CDC Union:
> >          bMasterInterface        4
> >          bSlaveInterface         5
> >        CDC Call Management:
> >          bmCapabilities       0x00
> >          bDataInterface          5
> >        CDC ACM:
> >          bmCapabilities       0x07
> >            sends break
> >            line coding and serial state
> >            get/set/clear comm features
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x87  EP 7 IN
> >          bmAttributes            3
> >            Transfer Type            Interrupt
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0040  1x 64 bytes
> >          bInterval               4
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        5
> >        bAlternateSetting       0
> >        bNumEndpoints           2
> >        bInterfaceClass        10 [unknown]
> >        bInterfaceSubClass      0 [unknown]
> >        bInterfaceProtocol      0
> >        iInterface              9
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x83  EP 3 IN
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x03  EP 3 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >      Interface Association:
> >        bLength                 8
> >        bDescriptorType        11
> >        bFirstInterface         6
> >        bInterfaceCount         2
> >        bFunctionClass          2 [unknown]
> >        bFunctionSubClass       2 [unknown]
> >        bFunctionProtocol       1
> >        iFunction               0
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        6
> >        bAlternateSetting       0
> >        bNumEndpoints           1
> >        bInterfaceClass         2 [unknown]
> >        bInterfaceSubClass      2 [unknown]
> >        bInterfaceProtocol      1
> >        iInterface             10
> >        CDC Header:
> >          bcdCDC               1.10
> >        CDC Union:
> >          bMasterInterface        6
> >          bSlaveInterface         7
> >        CDC Call Management:
> >          bmCapabilities       0x00
> >          bDataInterface          7
> >        CDC ACM:
> >          bmCapabilities       0x07
> >            sends break
> >            line coding and serial state
> >            get/set/clear comm features
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x88  EP 8 IN
> >          bmAttributes            3
> >            Transfer Type            Interrupt
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0040  1x 64 bytes
> >          bInterval               4
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        7
> >        bAlternateSetting       0
> >        bNumEndpoints           2
> >        bInterfaceClass        10 [unknown]
> >        bInterfaceSubClass      0 [unknown]
> >        bInterfaceProtocol      0
> >        iInterface             11
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x84  EP 4 IN
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x04  EP 4 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >
> Hi,
>
> I can't see anything wrong with the union descriptor in your listing.
> What is your reason for adding this device to cdc-acm?
>

Oh, that is good to hear. I have LG Optimus Vu (P895) Tegra30 based
smartphone, it uses this modem which is placed on HSIC usb line and I
have recently made it appear.

Original LG downstream sources[1] add this device to acm_ids with
NO_UNION_NORMAL so I transferred this change to mainline.

[1] https://github.com/clamor-s/android_kernel_lge_p895/blob/master/drivers=
/usb/class/cdc-acm.c#L1837-L1839

> thanks
> Lars

