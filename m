Return-Path: <linux-usb+bounces-38159-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBKJMvaAGWrVxAgAu9opvQ
	(envelope-from <linux-usb+bounces-38159-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 14:05:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C15601F87
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 14:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACE963018F42
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29783DDDD4;
	Fri, 29 May 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qq1OZt/8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4653C8731
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056303; cv=pass; b=rfX2M1CRf7KWjuymxvM0ZseTM+8BC44NnlDlUxtVVL+ZoEP5v1iiXfuwfYfbHbhSSMIJ/lzryfH+X4Vc6b23c2TVjHWp2pq8SDukMDmlXhusgaZiPjoTDWiVlHPRwOhpo3h6+6iAC4r+d671cEMUnpuRfpdAya49h8BeQF293Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056303; c=relaxed/simple;
	bh=EW2KbcNB61b1FPNwxyqQFbZTLVnlK6Q86px0nSnhZMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhHoA7Qzb/Wgx1uT4mLsOa03hTfQUzRJpeXiRnGO89jYBcuqWppWWCpkMaqi9+J47dpMXeie2ZagsT3/WG+1IJo+uct4LNcFzvmycd874ameYEQgM+IyMBL4pxvzwhHcmHQqSpih/kZikczMi0lerypv66jLf30d5eMiBB79mKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qq1OZt/8; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-516cbde40f2so86101871cf.3
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 05:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780056301; cv=none;
        d=google.com; s=arc-20240605;
        b=NR3CDLkmeq8BZ9h5KdkMx7BHlG+UAQuRQn2+bEuOMIpMhg5M1pcE2sdW7vQctrbQPb
         Qj4s+pDWoxUOczhbtocYLMXZWZvqPTV6R6uQeDPJUNkBwS1wOCa4HPkJfD/WS9jAuFI+
         LPNiodE8qhAlyLIXkNfz1OKAXe9yeJWO9vp62B+INPgevdYpKx7md0CGUF/RfNYhaJn+
         SFCTiRBqi2LR7cipTa6lfD/3LfRYd62C4PrEdC2GR1cJIBENv1thLdobl5zzdJYy3ZZf
         mR118vRODAN5jreSl9k4/10TS04pwR/DlsqLB9L7K0dXSfA+nDJX0NNsWXU9SmyucEBk
         iLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARyI96JA++UGENTiTuz65rrDq4Iq6wo1Eg2hxx7qZ4c=;
        fh=w3RhexWoC4ZD6eRWj199ABasl3NNKKoIo5dvsnomQ48=;
        b=d+Jt4xKrzg+uzyEmFyIOA12bR/AdTIvNxdvWSulVNSgR0cfrobAi5sebXP9qEwkmWL
         wqqx58YdMdqOUvEwCL92JeZjf4jc34vU9VixgBXsVYNypsnN0lsAEKYPpboC5nVkFOxu
         0xEvkBxfFju3yJi8SBtnYULby88TzH9vXiNkBT3OOGxx+RsCzGUJFvPQg+zurokXuXXC
         aBqZi++cAeVM9fZeN1hOWH2dz6LTUrSPAIWygzLuJuoAPp1wDt6e9Jy5SncN8XB0iomP
         AgQ7Omx6n8LkfLLUfMbdGyCZpMgKYg9N2wOBMPKL8HZTR2auCWI72c6CXX4Lu7AuZPrA
         xC0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056301; x=1780661101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARyI96JA++UGENTiTuz65rrDq4Iq6wo1Eg2hxx7qZ4c=;
        b=qq1OZt/8D+W9O1eU75lQ55k3M4O38zZIjVnFmmbiHv4x3Ws+xlHxboQ9edlAfWn4JZ
         4jayfsmTtooLjTrLtGnVzarhJlzLFAyt0kGvOoe3w0rfG/5krI8XtHro9MuSOicca2n9
         6EKm7u7rknyPzaU5sug1SpSIfoj0+hT9uXCCFZJNkZBQT+H01EnvRcwKoXzp1vZ6snej
         eAgDV1+9c1Te7/Tok+uw9iRSoXfiRcd0n5garzI8DM967liEQ0Ve0hAMKcTWq6e9Kc5c
         dm+41lj2ajlHMME3jAPuYoANGT9brEpE4I9Z9zvuxvPztEx25ZtFFQpbU7IS9z1N+PbF
         Yhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056301; x=1780661101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ARyI96JA++UGENTiTuz65rrDq4Iq6wo1Eg2hxx7qZ4c=;
        b=Z04mM6Br8yhBKYlk63FYIoxml7gt0wmVr8EiUwAFzwGiUCPWzdWgmMMtw0M0+01xmy
         gkKvE1jq1kbwOW7voKvnHFaFe0psnzbMOjcSygwyQvC1sEvY12sOHBZe6+AX7Or4k0P8
         DlTU5ljEimOHcoIhFd//rxi6Jiq8jdFuIUDZ500X1PAU0RaGAl2X7ZbM+V8HmOaSncYJ
         f3nVOJkyJ9qy6oUDTGxmuR0WOn8IULKEcSWkJPLLP71K3yIrFm4v1Ix/xG/JxLSAEGdv
         0BhckgMb6Zv1NdSgtLvjD5aaszSqZNfaCv7FOclPzl06f2MCcLcTQwLGZ3LLdXVhExPE
         1r4g==
X-Forwarded-Encrypted: i=1; AFNElJ83a+4F3xQpCt7LAKyFB9f8xS1uV9KYLb5eYpw+xTYDIQOxhV/fHJlPQuVr5c1RyTlb0d99+xUVMzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0vsTOERnnXOwWBeLcxslN/ppIHIqYCBgmcYBmOTx27pRZvXG
	z0TLQhgDcU3oqb0/bPWXQXN+bNtvrMnAOWTeQdODYkHaGi9PEH9eiDfxTWr7Evb3h3s0m9Eym87
	Q64vioR2LE2OvHw9dZXZw7bWGb8nkCcwKEXZJdLQ=
X-Gm-Gg: Acq92OGNB0CqybUCo3putz72uEcknR6o9wkMVtTIWSwCtqfElAmADKyEsvfuNL3TLVB
	U1MHo30aERNdaJlnbETUiw/CGudhYkhW6rDcJ+mnYjlZGZyJqBq2s/vUH3Rg7dcAlKoHzDoREQb
	JwArr+uggBhg/svTRy4kFxsjt/F3h7e58swqSapJmR74H4sbjQkpDI9GePQamJSMroskYoGIdLk
	rpsaqdDxAXXtFFgjxPeXFraBTtTCTdzxexX37F8WGI/QmPJBq5IkR077HecTnqs/Gc5K6FBLEDu
	raAlA0URwJSHZTkKL9Xig3klTe+nCZZ6qMhjAdPYASA1eFDa
X-Received: by 2002:a05:622a:4c05:b0:516:e047:2f2f with SMTP id
 d75a77b69052e-5172dd22ac2mr30437201cf.37.1780056300877; Fri, 29 May 2026
 05:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com>
In-Reply-To: <20260529122210.6d2c5543.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Fri, 29 May 2026 13:04:49 +0100
X-Gm-Features: AVHnY4Kok2cfSSZGb-8sIfibuYsApfZbiMaRnG89FqUJyW3hyzV7G_vv-QvkZzE
Message-ID: <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38159-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B5C15601F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi see below:

  iSerial                 1 0000:0f:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             1
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0103 power enable connect
Device Status:     0x0001
  Self Powered

Bus 007 Device 002: ID 046d:c52b Logitech, Inc. Unifying Receiver
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x046d Logitech, Inc.
  idProduct          0xc52b Unifying Receiver
  bcdDevice           12.11
  iManufacturer           1 Logitech
  iProduct                2 USB Receiver
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0054
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          4 RQR12.11_B0032
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               98mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      59
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     148
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      93
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               2
Device Status:     0x0000
  (Bus Powered)

On Fri, May 29, 2026 at 11:22=E2=80=AFAM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Fri, 29 May 2026 00:06:33 +0100, Martin Alderson wrote:
> > Hi, please see this attachment. Thanks for all your help!
>
> Let's go through it.
>
> grep xhci_suspend 20260528T100954Z/dmesg.txt
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0e:00.4: xhci_suspend: stopping =
usb5 port polling.
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0c:00.0: xhci_suspend: stopping =
usb1 port polling.
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0e:00.3: xhci_suspend: stopping =
usb3 port polling.
>
> Several HCs are suspending, but not 0000:0f:00.0. It seems that the
> kernel is aware that "something" is still going on with its child USB
> devices and it defers suspend until "something" finishes.
>
> grep 0000:0f:00.0 20260528T100954Z/dmesg.txt
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Cancel URB 00000000f24b=
bb02, dev 1, ep 0x83, starting at offset 0xfffe5c70
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on Transfer TRB=
 for slot 1 ep 6
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Removing canceled TD st=
arting at 0xfffe5c70 (dma) in stream 0 URB 00000000f24bbb02
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Set TR Deq ptr 0xfffe5c=
80, cycle 0
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_giveback_invalidat=
ed_tds: Keep cancelled URB 00000000f24bbb02 TD as cancel_status is 2
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Successful Set TR Deq P=
tr cmd, deq =3D @fffe5c80
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_handle_cmd_set_deq=
: Giveback cancelled URB 00000000f24bbb02 TD
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Giveback URB 00000000f2=
4bbb02, len =3D 0, expected =3D 32, status =3D -115
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_handle_cmd_set_deq=
: All TDs cleared, ring doorbell
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Lin=
k TRB for slot 1 ep 4
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Lin=
k TRB for slot 1 ep 2
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Lin=
k TRB for slot 1 ep 0
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Set port 7-1 link state=
, portsc: 0x603, write 0x10661
>
> Some device under 0000:0f:00.0 is suspended after having a 32 byte URB
> unlinked from EP 3 IN and a few other (idle?) endpoints stopped.
>
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Cancel URB 00000000e74c=
9e14, dev 1, ep 0x0, starting at offset 0xffff4060
> [Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
> [Thu May 28 11:09:50 2026] xhci_hcd 0000:0f:00.0: Command timeout, USBSTS=
: 0x00000000
> [Thu May 28 11:09:50 2026] xhci_hcd 0000:0f:00.0: xHCI host not respondin=
g to stop endpoint command
>
> Then some URB is unlinked from the same device's control endpoint with
> no indication that the port has been resumed. Not 100% sure whether the
> URB was submitted before or after device suspend. Either way, software
> shouldn't do such things and your HW doesn't handle it gracefully.
>
> It seems we will need to figure out how the offending URB gets there.
> Can we identify the problematic device? Please post the output of:
>
> lsusb -v |sed '/0000:0f:00.0/,/root hub/ !d'
>
> Regards,
> Michal

