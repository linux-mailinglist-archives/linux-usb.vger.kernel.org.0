Return-Path: <linux-usb+bounces-32737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJB3FPSAd2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:57:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1289D50
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15E92305C288
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536533066B;
	Mon, 26 Jan 2026 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkW3qkxN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D71123EAB3
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439357; cv=pass; b=NaKEDphpbR+RG++p1ELUCnIbW6tQoGRoanhk3OnMfA1a2ALLE7J5r7H9HHLJAPxGDLwV2n2XeSfoTYhjb+1403SRP/t/0VR3/l1IdaHhz+5S+p1mnmKU8R7OVYcYfFKgzr/iW23K7vB2i7LTwAA2PgnhaIFPCfRuVJ9zBw+Z+pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439357; c=relaxed/simple;
	bh=M9I1p+rBce42Yv+YjED5qGsG6rMz6Ur5cwnHKE5cYIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6E1oC3gevNKD53XOduK+QcsfLRSCaKhEbYp3hPrcAkvovBy9aE3vhmB+Zz/cYc+75zq/00vFt8q0eq6btIVqmQKLei5DRr9HQprYb5U5v18USVWIl2SZToTDUtSZfVbD/w4F3kkgZX36vUutcx5GdyI1SP6iUNaZRqQ0vbxYZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkW3qkxN; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43591b55727so4448573f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 06:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439355; cv=none;
        d=google.com; s=arc-20240605;
        b=L+am0Dc++n3FQusVaJqaB8bGNOToDWgCGYZ3lTFlxjuCPAx7YPV6PZhGBD6hdSJYI2
         65LB9AabVy33GwiznnBnYlxEHiVxDMv5QoUtYD2eB+LQgVLPDUHrRcqi1R1hCuSiIe5w
         6IkSmoAYzPqdowDT70HzWHsOFEHaEWNHBn2yW0nn68Wj/HAsLGS1VioAXv4dvaG9A/Ux
         f72GWQhrdcEZZTJaC1JVTCKyvwk909etzx1/HfHDrzJZusSuNM57jJGkg8FcBFBE8PXI
         hLolecGZlDM9fmtAfDoPXN0sj7lYzE/4ppnDEVj2cq22MA1kzm0DSgQn5z3gB9Q9UhA5
         /gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLpDa3RKoQqqcNKVCb5qj7ioqvXy5yNuyOoHA/fI8RU=;
        fh=LAQN3G46ME4NuLBv03AhE58TqRX8j7BQ10sSsA4SNbk=;
        b=lQ4Z6zLzKsWc+QSc17qtYMBHUy+fkaYtKiWCavYDpAn2vEb2QYiI9mDw/6e/tsw0SG
         rMKIoHYzdUorqCy5YoLAZs2+VsTFdeN1kiRmFaO7HDBM8FyWLvBKq1W6q8fETaHnuJiq
         jF/vCJajLSCA9xfnF2N8TIJ8q0BBX+JkvOCz6Tto+hPpimPYJvVncA0+ZVyx4MRrTVVQ
         PSaiOe+FtMKwcqbX0knFRTRFfwiCLngTVwhp8F1BLFx0wtTdCu1Y0de4lkY5k/KlTOB3
         0CdB53gXUv65rBdRxKV/pOzEJHOI33vAXFQ5CvBqwf2xyLYle3mCN6IoDAA9P0s9YlPb
         XOTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439355; x=1770044155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLpDa3RKoQqqcNKVCb5qj7ioqvXy5yNuyOoHA/fI8RU=;
        b=FkW3qkxNIA7YQgNvbWl4Y/ar3QB5ihVmFQI6zwFSI0DKhUAh+WNjASHEv0/EFqMlB0
         kyh4tniAl5fgLj+w1f/nD6KEzdr2QLkRUrzZtv8LHf030Pqv8Y3UfBS08lAD9bp6JJeG
         yl7QbJuapqSDXw/l+e7XQ3ZkfbltPkZpkklRrljc0/A2HuXcs/235jlMYWS9hbqhv5nJ
         n9l/nUJngtpeaeKytI61geYMJks/2nv2mfxagodHDj1arjoHyAPj58NfTIwO/QOXspka
         enZXId866G7BywZduBU72Ljs3kW7+sKHoor11OAbGItebO5IXBjIBJGbQ3fjxDelReor
         lr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439355; x=1770044155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLpDa3RKoQqqcNKVCb5qj7ioqvXy5yNuyOoHA/fI8RU=;
        b=ckf7rBzsCZ2JAmRVoEXkGJc6epOyALRJen17KknwtFQDF08b4U+YlDZMqvzDVyI3wl
         UZQeBbk4sxh5//B0RIVOvGhLOmBkK64Pt6yXQou2Vnbe0zhukpSn+9kFsQYFuQXk+Hlt
         fvDZQ8rqGx4EnMDJ8Oz4gvPkWTg1Qoo0yG3oXI3tOdOuAofM0o75rK1Z8WSM4QdeEQ8N
         jAAiwNSc6PD+P8NzKZK3uTlWg8p0sG8LiDiTHpBKc4wHiGoBX3AeckHITHqInkTabg/f
         FGRtLtJMIsDciNpSWnV9165i9DqSMGyiYKvFRnAG6G7m1ZO3FrTL9dVBQ8JRH2PitIkG
         vB2g==
X-Forwarded-Encrypted: i=1; AJvYcCVW3iYy0wt/23jwhWb7SkGf9FmOnG/lTLDYJrV6oFGq0SmCPFxSxYgxeRBbMYk7WbwY/+WpHCLqmaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqg74tchQY/ZHZp20gczvTa9BnLSZly7JkJ63KFkr2psNCHKp
	GKJoO7Fqr7MnyXO2SkjnGCZKJ8VusgukSeiuza0fu6zi3E30Rl8FocHN+YYHCMvx5X6pnOJaRRX
	MV5mYvN48EAzZXlVog2Kv9iqVVqQ7DEw=
X-Gm-Gg: AZuq6aLSZkiG9KrEN65d+IcOvJ2Ms8hAOd24MGulRBFZ8Xf5kf9ZS3bs9noBK8+GSoq
	K/O130ituwha0MRJYVGTvhisjwLpDAAxhriRIkrOq7NF+5jWQ9s6MzcrghMF61zIBW/8+NdNWWM
	jdYV3dkLLDD1XrFVEmc0DxN7wsrguMUrgAmHWE3DNZDfRMd+EumgFZBmX0vSkRT8PUUUsAXEMGC
	Nvxpygto0QvD4UirdOaMJnZ5ASLjF6YXDMEO9gQmakf7XzyLYwXntFIWQbNPJB1GWK0axWv
X-Received: by 2002:a5d:5848:0:b0:435:953e:589c with SMTP id
 ffacd0b85a97d-435ca1ad8bemr6786606f8f.34.1769439354419; Mon, 26 Jan 2026
 06:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122151746.7745-1-clamor95@gmail.com> <20260122151746.7745-2-clamor95@gmail.com>
 <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com> <CAPVz0n2xcnvus_u4dYDGL0VcgkWfVOJF7=hKuMPrjsE4UZTNLQ@mail.gmail.com>
 <8a7ed9d1-c667-418a-a72a-d8d24ed0f9f8@gmail.com>
In-Reply-To: <8a7ed9d1-c667-418a-a72a-d8d24ed0f9f8@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Jan 2026 16:55:41 +0200
X-Gm-Features: AZwV_Qjt7ytLlqLoyqh4VoRQZQ7fXryv9fPBADVTJaT61ueFsliSWYA5PzaV3As
Message-ID: <CAPVz0n1x9gWC0XzC0VQ=syT3LAm_5xof-_T5=8TzKapBQheVjw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32737-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9CB1289D50
X-Rspamd-Action: no action

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:51 Lars=
 Melin <larsm17@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-01-22 23:17, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 22 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 17:58 =
Lars Melin <larsm17@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 2026-01-22 22:17, Svyatoslav Ryhel wrote:
> >>> Add support for Infineon/Comneon XMM626X modem that used in many Tegr=
a30
> >>> devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).
> >>>
> >>> The Vendor Id is 0x1519
> >>> The Product ID is 0x0020
> >>>
> >>> Output of lsusb:
> >>> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>
> >> Hi,
> >> please include a full lsusb output, ie lsusb -vd 1519:0020 so we can
> >> verify that union descriptors are missing.
> >> (I have seen a full lsusb output where they are included.)
> >>
> > Hello there! Sure, here is what I get if I use lsusb -vd 1519:0020
> >
> > lg-p895:~$ lsusb
> > Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Contr=
oller
> > Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> > lg-p895:~$ lsusb -vd 1519:0020
> > Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Contr=
oller
> > Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> > lg-p895:~$ lsusb -vd 1519:0020
> > Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Contr=
oller
> > Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> >
> > regular lsusb is added for reference.
>
>
> You are using a stripped down version of lsusb which doesn't give a
> verbose output, please install the full version and try again.
> If you don't have the full lsusb, how do you then know that your
> device has a faulty union descriptor?
> The full lsusb listing that I have for 1519:0020 has a correct
> union descriptor so doesn't need a quirk.
>

Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
Couldn't open device, some information will be missing
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x1519 Comneon
  idProduct          0x0020 HSIC Device
  bcdDevice           12.74
  iManufacturer           1 Comneon
  iProduct                2 HSIC Device
  iSerial                 3 0123456789
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0111
    bNumInterfaces          8
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          2 [unknown]
      bFunctionSubClass       2 [unknown]
      bFunctionProtocol       1
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 [unknown]
      bInterfaceSubClass      2 [unknown]
      bInterfaceProtocol      1
      iInterface              4
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      CDC ACM:
        bmCapabilities       0x07
          sends break
          line coding and serial state
          get/set/clear comm features
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 [unknown]
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              5
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          2 [unknown]
      bFunctionSubClass       2 [unknown]
      bFunctionProtocol       1
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 [unknown]
      bInterfaceSubClass      2 [unknown]
      bInterfaceProtocol      1
      iInterface              6
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        2
        bSlaveInterface         3
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          3
      CDC ACM:
        bmCapabilities       0x07
          sends break
          line coding and serial state
          get/set/clear comm features
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 [unknown]
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         4
      bInterfaceCount         2
      bFunctionClass          2 [unknown]
      bFunctionSubClass       2 [unknown]
      bFunctionProtocol       1
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 [unknown]
      bInterfaceSubClass      2 [unknown]
      bInterfaceProtocol      1
      iInterface              8
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        4
        bSlaveInterface         5
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          5
      CDC ACM:
        bmCapabilities       0x07
          sends break
          line coding and serial state
          get/set/clear comm features
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 [unknown]
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         6
      bInterfaceCount         2
      bFunctionClass          2 [unknown]
      bFunctionSubClass       2 [unknown]
      bFunctionProtocol       1
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 [unknown]
      bInterfaceSubClass      2 [unknown]
      bInterfaceProtocol      1
      iInterface             10
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        6
        bSlaveInterface         7
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          7
      CDC ACM:
        bmCapabilities       0x07
          sends break
          line coding and serial state
          get/set/clear comm features
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 [unknown]
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface             11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0

> thanks
> Lars

