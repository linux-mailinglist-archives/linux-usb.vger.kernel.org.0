Return-Path: <linux-usb+bounces-26289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87953B16F38
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 12:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77171AA1099
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C153529DB80;
	Thu, 31 Jul 2025 10:11:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D129827E
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956704; cv=none; b=hIuYEdfjp+6KyDcjPEM4BCdpb307p1rDfL72dyeri61pfEpAHWVHjTuSLCN8JOW+ToUjrVLk/RTkxu07ZzSpYkgihAFmzWwP8RTlat7264ZCysKc3GVZMLcEHbi4OMU1NoTco1ASCPNC1qEPiPlIzHGTPT6DO5ZMlr/V1W45hcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956704; c=relaxed/simple;
	bh=cBGo6ZJBaJVq1Vc87niac7TETjEoHPeYNncdMlaI5Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoI16aiNst+teHsdUPCs3QnT/8hmqVNW6Mpwk9hzeRL1gIL+yu6nqg1dRs+3nbiUX4UT/DXPTKfXMkHfl+tzF1x7cj3TJYTr8mM55ZHj20Ew1K9xkIILjg0ossBXG9EcCJ0lQfq6W9OPBUTzAeGeklYvCvkvv/6YbtMv4G4AbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net; spf=pass smtp.mailfrom=settrans.net; arc=none smtp.client-ip=93.93.131.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=settrans.net
Received: from [193.187.128.66] (helo=[172.24.1.6])
	by verain.settrans.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rah@settrans.net>)
	id 1uhQGB-0005e1-Hk; Thu, 31 Jul 2025 11:11:39 +0100
Message-ID: <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
Date: Thu, 31 Jul 2025 11:11:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook> <20250731102728.503cd612@foxbook>
Content-Language: en-GB
From: Robert Ham <rah@settrans.net>
In-Reply-To: <20250731102728.503cd612@foxbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wWwfTSW7CDgpfN6pR0lEYPWP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wWwfTSW7CDgpfN6pR0lEYPWP
Content-Type: multipart/mixed; boundary="------------ikVCtekKyBNqyoNuScXc93dX";
 protected-headers="v1"
From: Robert Ham <rah@settrans.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Message-ID: <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook> <20250731102728.503cd612@foxbook>
In-Reply-To: <20250731102728.503cd612@foxbook>

--------------ikVCtekKyBNqyoNuScXc93dX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I managed to sort out the tracing and debug output. Updated kernel log
and trace:

https://settrans.net/~rah/misc/xhci-kernel-log-2.txt

https://settrans.net/~rah/misc/xhci-kernel-trace-2.txt


On 31/07/2025 09:27, Micha=C5=82 Pecio wrote:

> Can you post "lsusb -v" for this device?

Bus 003 Device 004: ID 1c75:af20 Arturia AF16Rig Audio
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1c75 Arturia
  idProduct          0xaf20
  bcdDevice            2.01
  iManufacturer           1 ARTURIA
  iProduct                3 AF16Rig Audio
  iSerial                 2 8850400254010429
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x02e2
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       0
      bFunctionProtocol      32
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol     32
      iInterface              3
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory               8
        wTotalLength       0x0190
        bmControls           0x00
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               41
        bmAttributes            3 Internal programmable clock
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource            9
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               43
        bmAttributes            0 External clock
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource           10
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               44
        bmAttributes            0 External clock
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource           11
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype     11 (CLOCK_SELECTOR)
        bClockID               40
        bNrInPins               3
        baCSourceID(0)         41
        baCSourceID(1)         43
        baCSourceID(2)         44
        bmControls           0x03
          Clock Selector Control (read/write)
        iClockSelector          8
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels            34
        bmChannelConfig    0x00000000
        iChannelNames          13
        bmControls         0x0000
        iTerminal               6
      AudioControl Interface Descriptor:
        bLength               146
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                12
        bSourceID               2
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            20
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              12
        bCSourceID             40
        bmControls         0x0000
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels            34
        bmChannelConfig    0x00000000
        iChannelNames          47
        bmControls         0x0000
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength               146
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                11
        bSourceID               1
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            22
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              11
        bCSourceID             40
        bmControls         0x0000
        iTerminal               7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0006  1x 6 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              4
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            34
        bmChannelConfig    0x00000000
        iChannelNames          13
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03b8  1x 952 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              4
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            18
        bmChannelConfig    0x00000000
        iChannelNames          13
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03a8  1x 936 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              4
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            10
        bmChannelConfig    0x00000000
        iChannelNames          13
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03e8  1x 1000 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              5
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            34
        bmChannelConfig    0x00000000
        iChannelNames          47
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x03b8  1x 952 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              5
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            18
        bmChannelConfig    0x00000000
        iChannelNames          47
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x03a8  1x 936 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              5
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x05
          Active Alternate Setting Control (read-only)
          Valid Alternate Setting Control (read-only)
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            10
        bmChannelConfig    0x00000000
        iChannelNames          47
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x03e8  1x 1000 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0200
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       254 Application Specific Interface
      bInterfaceSubClass      1 Device Firmware Update
      bInterfaceProtocol      1
      iInterface             12
      Device Firmware Upgrade Interface Descriptor:
        bLength                             9
        bDescriptorType                    33
        bmAttributes                        7
          Will Not Detach
          Manifestation Tolerant
          Upload Supported
          Download Supported
        wDetachTimeout                    250 milliseconds
        wTransferSize                      64 bytes
        bcdDFUVersion                   1.10


Cheers,

Bob


--------------ikVCtekKyBNqyoNuScXc93dX--

--------------wWwfTSW7CDgpfN6pR0lEYPWP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

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
=BiDr
-----END PGP SIGNATURE-----

--------------wWwfTSW7CDgpfN6pR0lEYPWP--

