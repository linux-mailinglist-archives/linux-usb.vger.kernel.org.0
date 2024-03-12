Return-Path: <linux-usb+bounces-7894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9887987D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 17:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD921C219C0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 16:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9857D09F;
	Tue, 12 Mar 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="IghOsxKE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6B7BB08
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710259253; cv=none; b=ZIqam5OETtg2zJ4MoO88x3NfJqdMKd2J5j2g4omTXOKWQ6QMDBTj8HjH6FqSbMJRJf67dx+mQOPqImczhEX6SME5a7Ml4J/+cn1kUMTD5HgrOgS0DF6rhoPbRPmmDr0OyeonOpIwGQsvHnF27WLZh3Viowdgj+xSjHO/G4qUuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710259253; c=relaxed/simple;
	bh=PhbZ3i89xfALi1zA75D1U2wGuB8BGEKXEy+3/2yZLU0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=uXFkvI+PR+s/ndT+E/EkJfmsbj93pDIXnzvJ/+ajaJQE/1tZIAwFGFYpZnMTMiScSJ54nG92Z8rCik3WazjPHjAtiEUznUQrOElSAdaR6zlp6D+nPfDpYGWpmln3Z416AE9d1+2MOgy56DNOTvPG8J1w00lh6Fi3Ga4Tjo8MPF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=IghOsxKE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e5b1c6daa3so3743324b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1710259250; x=1710864050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZ0F3iuRmi5xotY1HQSYfGVN8bBxCsKP8Kz1KinuRwQ=;
        b=IghOsxKE6vNB/FvJo8aZps5ZlX9Zon5dou+MEfnaNIOAu7n0eD5TEur/1ig2ybvRsf
         ZpA8ieoVYhkNUCsV27nz9zt1KN5Vw8BdT7ymWdSfyshm7SSGEZUgk0O0FsRPXofoltpd
         hcy1BFUSExU/AhenqnHReR1/SKvRgl0mcDap3lIuywOYfuqhvJnZj1SbZRa1mSEBOswp
         gNH4hwP0mzKqXtFf+z8t3s/qEvvBndrUMAli+nhdzHUJX2W0A5jn/ivSlYAW0YcMupVY
         9X+BHG0QtenUx/+x3hEdpuTM7tUeT25KbkhRRc8+3reOTPmZpcr5PjNj8EVscu2h/RLa
         /Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710259250; x=1710864050;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ0F3iuRmi5xotY1HQSYfGVN8bBxCsKP8Kz1KinuRwQ=;
        b=b//qv43rMcyxm68J5ig48OvsjQcF4K4yX+DYW3K0AJIeO0WAGvIk8cJKt6aw2oUuvR
         RvfIo6gBTTuyC+vQHuALs1JAp3GlHC4/1BKlCQSCXFWeQxOML/2N9W0NI3WZqz472DnK
         Bkevo1U9nFIjRxkPL3M+4P7TUSkrWKLF5+fboeIl5FRC2BZd4qUVBoMbyyOFkx+PJ+M0
         Pfwk39MXeiWi+YeAk54VCSGWTmpC4sOUHAbULtbnd7sqXFCF8cSN0SWk53qKg386MbM0
         1nLnjMQhSXCguA4Ebfj4vSfA6j92soFjlZTK5YjR/j3AamijW6iX9h3qDJhClJ8i8HMy
         CdyA==
X-Forwarded-Encrypted: i=1; AJvYcCWebujtbpYwd7dcdx/Klnkb37YKgcT0ZOMy54EpkrD68QYSYcuyGUZV9/tX9EjS6OsmTpAwKUJy2ARwYug0+OTWOrQwjqQDlaLS
X-Gm-Message-State: AOJu0YyjpCvuo+cY+LdeRdpkCc/Tp/M8yT7cxsx+t0Xsz2ZZ/tr/+LDh
	XadPpSmVh2qTjN5a9l++21lZpZzD1d97GobUuXvx9ikH2jRMHTx69xtdNg+1TQ==
X-Google-Smtp-Source: AGHT+IHaRmBhwROThT0gODRZznAziJGMI3dcLLwZt7z/QWl+kJhCqEk7z+ZOjPglodP6EYWs+Ef/2Q==
X-Received: by 2002:a05:6a20:e116:b0:1a1:86d2:c1ac with SMTP id kr22-20020a056a20e11600b001a186d2c1acmr782632pzb.16.1710259250216;
        Tue, 12 Mar 2024 09:00:50 -0700 (PDT)
Received: from ?IPv6:2001:5a8:4289:6500:7076:c575:494e:a634? ([2001:5a8:4289:6500:7076:c575:494e:a634])
        by smtp.gmail.com with ESMTPSA id b1-20020a056a00114100b006e60c07f551sm6232211pfm.200.2024.03.12.09.00.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 09:00:49 -0700 (PDT)
Message-ID: <1710259248.14565.14.camel@chimera>
Subject: Re: [PATCH 5/7] usb: misc: uss720: document the names of the
 compatible devices
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	sudipm.mukherjee@gmail.com, johan@kernel.org, hkzlabnet@gmail.com, 
	reboots@g-cipher.net, mike@trausch.us
Date: Tue, 12 Mar 2024 09:00:48 -0700
In-Reply-To: <20240312055350.205878-5-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
	 <20240312055350.205878-5-alexhenrie24@gmail.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2024-03-11 at 23:50 -0600, Alex Henrie wrote:
> Information about 04b8:0002 and 05ab:0002 is from commit e3cb7bde9a6a
> ("USB: misc: uss720: more vendor/product ID's", 2018-03-20). The rest
> are from <http://reboots.g-cipher.net/lcd/>.

FYI:
Device: ID 04b8:0002 Seiko Epson Corp. ISD Smart Cable for Mac
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x04b8 Seiko Epson Corp.
  idProduct          0x0002 ISD Smart Cable for Mac
  bcdDevice            2.00
  iManufacturer           9 EPSON
  iProduct               12 USB-Parallel Adapter
  iSerial                23 066200241zic9htt
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           71
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               96mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         7 Printer
      bInterfaceSubClass      1 Printer
      bInterfaceProtocol      1 Unidirectional
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         7 Printer
      bInterfaceSubClass      1 Printer
      bInterfaceProtocol      2 Bidirectional
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)
Device: ID 05ab:0002 In-System Design Parallel Port
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x05ab In-System Design
  idProduct          0x0002 Parallel Port
  bcdDevice            1.04
  iManufacturer           0 
  iProduct                0 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           78
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               98mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         7 Printer
      bInterfaceSubClass      1 Printer
      bInterfaceProtocol      1 Unidirectional
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         7 Printer
      bInterfaceSubClass      1 Printer
      bInterfaceProtocol      2 Bidirectional
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)



