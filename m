Return-Path: <linux-usb+bounces-23675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94EAA8365
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 02:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1BE7189B9EA
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 00:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E108F6E;
	Sun,  4 May 2025 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDklXHCb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76F748F
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 00:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746318453; cv=none; b=gUNOoCqXBZnT0K6ITDsfXtIXpZQGRGThY3YmUZ8xll23nB0ETjj1VyTIJdDl03uBegjzs9HrbP97CYmvfrXXSiE/va6MLopfxWC916uj+X3aGkSG6/5WUYqX/bKZR9pdOSFl2sNIp/MJhw4OrrngORswMeB6pjlB/2S4psB1IsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746318453; c=relaxed/simple;
	bh=Zn2sbymlgse0n8c7sDJQJmNFzQx7D7YjRdYI0BFyyHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AEi5KhEkTXfaN1Sw5La2lo156WBwAmqy6sMf/+2JTKJfC/AwhRrPSb+jvvT7WpGxep4qnTmrE/PjoH5GrReGLKn+Iu8BzHbNgZ3u8KyXtwOS9w+0uazHzptSPTqRiwkex77Hy7nsy6s6nSkEyIsfPu198KBPVtXeFAUnof2044w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDklXHCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0727C4CEEB
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746318452;
	bh=Zn2sbymlgse0n8c7sDJQJmNFzQx7D7YjRdYI0BFyyHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pDklXHCbuV248af4RKU4SJbjyngE6TADvg4gM8w1OhkppQ8vsGTbZY7t5z23UPr5V
	 FoRuU8oHOt8L9sz7hRGtXyMVYI6M2KmXlk+aVYtaRVz3Lm/rmLzHAoUxzyxrkYo/+n
	 RqW+BUrESQ7CDMLtkdorST7rVX6js/idlOsApRuQUCt97yHt3jOJIDeWCv/hbHbaU8
	 POpnd7ckcMAiGf034/AKFTusnx59xEHiAqEf5Qo7KNjsT15Z98mzUud+Ws0l8P5/2H
	 iqY9i778Y5CFTFgxfqDkbp+2KL1b9CLCZt2ot05O9RU1rJXCV7iM07E7ziHefOnluc
	 yMn9q2JBjXyLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91902C3279F; Sun,  4 May 2025 00:27:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sun, 04 May 2025 00:27:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-7Q1o3i3xt3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #12 from Niko (nrkowalski@gmail.com) ---
Apologies, I did not run that as root. Here is the output from root.

Bus 008 Device 002: ID 0fd9:009b Elgato Systems GmbH Elgato 4K X
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x0fd9 Elgato Systems GmbH
  idProduct          0x009b Elgato 4K X
  bcdDevice            0.02
  iManufacturer           6 Elgato
  iProduct                7 Elgato 4K X
  iSerial                 3 A7SNB504228NRE
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x08bd
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 Elgato 4K X
    bmAttributes         0xc0
      Self Powered
    MaxPower              896mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0=20
      iFunction               5 Elgato 4K X
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0=20
      iInterface              5 Elgato 4K X
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0050
        dwClockFrequency       27.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0=20
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00000000
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            3
        bmControls     0x0000000f
          Brightness
          Contrast
          Hue
          Saturation
        iProcessing             0=20
        bmVideoStandards     0x09
          None
          SECAM - 625/50
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {961073c7-49f7-44f2-ab42-e940405940c2}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0x0f
        bmControls( 1)       0xfe
        bmControls( 2)       0x01
        iExtension              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              6 Elgato
      VideoStreaming Interface Descriptor:
        bLength                            19
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         6
        wTotalLength                   0x07b5
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     4
        bmaControls( 2)                     0
        bmaControls( 3)                     0
        bmaControls( 4)                     0
        bmaControls( 5)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                9
        guidFormat=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  5
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                294912000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                165888000
        dwMaxBitRate                331776000
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                331776000
        dwMaxBitRate                331776000
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  1
        dwFrameInterval( 0)            200000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                737280000
        dwMaxBitRate                1769472000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                994332671
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  7
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                2651553791
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1767702527
        dwMaxBitRate                3538944000
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3440
        wHeight                          1440
        dwMinBitRate                4294967295
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize     9907200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                3977330687
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  3
        dwFrameInterval( 0)            200000
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 1 (BT.709)
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors                6
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  6
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                737280000
        dwMaxBitRate                1769472000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                994332671
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval          41666
        bFrameIntervalType                  8
        dwFrameInterval( 0)             41666
        dwFrameInterval( 1)             69444
        dwFrameInterval( 2)             83333
        dwFrameInterval( 3)            166666
        dwFrameInterval( 4)            166833
        dwFrameInterval( 5)            200000
        dwFrameInterval( 6)            333333
        dwFrameInterval( 7)            333667
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                2651553791
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1767702527
        dwMaxBitRate                3538944000
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  7
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3440
        wHeight                          1440
        dwMinBitRate                4294967295
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize     9907200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                3977330687
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  7
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     4 (SMPTE 170M)
        bTransferCharacteristics            4 (SMPTE 170M)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        3
        bNumFrameDescriptors                9
        guidFormat=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
{3231564e-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
        bDefaultFrameIndex                  9
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                110592000
        dwMaxBitRate                221184000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                124416000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize      518400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                248832000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize      622080
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  1
        dwFrameInterval( 0)            200000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                552960000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                745749503
        dwMaxBitRate                3583180800
        dwMaxVideoFrameBufferSize     3110400
        dwDefaultFrameInterval          41666
        bFrameIntervalType                  8
        dwFrameInterval( 0)             41666
        dwFrameInterval( 1)             69444
        dwFrameInterval( 2)             83333
        dwFrameInterval( 3)            166666
        dwFrameInterval( 4)            166833
        dwFrameInterval( 5)            200000
        dwFrameInterval( 6)            333333
        dwFrameInterval( 7)            333667
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                1988665343
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1325776895
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  7
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3440
        wHeight                          1440
        dwMinBitRate                3563025407
        dwMaxBitRate                3566592000
        dwMaxVideoFrameBufferSize     7430400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                2982998015
        dwMaxBitRate                2985984000
        dwMaxVideoFrameBufferSize    12441600
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 1 (BT.709)
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        4
        bNumFrameDescriptors                9
        guidFormat=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
{30323449-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
        bDefaultFrameIndex                  9
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                110592000
        dwMaxBitRate                221184000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                124416000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize      518400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                248832000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize      622080
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  1
        dwFrameInterval( 0)            200000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                552960000
        dwMaxBitRate                1327104000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                745749503
        dwMaxBitRate                3583180800
        dwMaxVideoFrameBufferSize     3110400
        dwDefaultFrameInterval          41666
        bFrameIntervalType                  8
        dwFrameInterval( 0)             41666
        dwFrameInterval( 1)             69444
        dwFrameInterval( 2)             83333
        dwFrameInterval( 3)            166666
        dwFrameInterval( 4)            166833
        dwFrameInterval( 5)            200000
        dwFrameInterval( 6)            333333
        dwFrameInterval( 7)            333667
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                1988665343
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1325776895
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  7
        dwFrameInterval( 0)             69444
        dwFrameInterval( 1)             83333
        dwFrameInterval( 2)            166666
        dwFrameInterval( 3)            166833
        dwFrameInterval( 4)            200000
        dwFrameInterval( 5)            333333
        dwFrameInterval( 6)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3440
        wHeight                          1440
        dwMinBitRate                3563025407
        dwMaxBitRate                3566592000
        dwMaxVideoFrameBufferSize     7430400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                2982998015
        dwMaxBitRate                2985984000
        dwMaxVideoFrameBufferSize    12441600
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 1 (BT.709)
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        5
        bNumFrameDescriptors                4
        guidFormat=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
{e436eb7d-524f-11ce-9f53-0020af0ba770}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  2
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                1105920000
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     2764800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                1491499007
        dwMaxBitRate                2985984000
        dwMaxVideoFrameBufferSize     6220800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  6
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
        dwFrameInterval( 4)            333333
        dwFrameInterval( 5)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                3977330687
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     8294400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                2651553791
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize    11059200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 1 (BT.709)
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        7
        bNumFrameDescriptors                5
        guidFormat=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
{30313050-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  2
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                1105920000
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize     2764800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  4
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                1491499007
        dwMaxBitRate                2985984000
        dwMaxVideoFrameBufferSize     6220800
        dwDefaultFrameInterval          83333
        bFrameIntervalType                  6
        dwFrameInterval( 0)             83333
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            166833
        dwFrameInterval( 3)            200000
        dwFrameInterval( 4)            333333
        dwFrameInterval( 5)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1080
        dwMinBitRate                3977330687
        dwMaxBitRate                3981312000
        dwMaxVideoFrameBufferSize     8294400
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  2
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                2651553791
        dwMaxBitRate                2654208000
        dwMaxVideoFrameBufferSize    11059200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  5
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                4294967295
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    24883200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            333667
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 1 (BT.709)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               7
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0=20
      iFunction               8 Elgato 4K X
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface              8 Elgato 4K X
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002d
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0602 Digital Audio Interface
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal              10 Elgato 4K X
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 3
        bSourceID               4
        bControlSize            1
        bmaControls(0)       0x01
          Mute Control
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                 4
        bNrInPins               1
        baSourceID(0)           1
        iSelector               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             10 Elgato 4K X
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             10 Elgato 4K X
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00d0  1x 208 bytes
        bInterval               4
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us=20
    Deep BESL value    61440 us=20
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 2
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1100
      Min functional Speed Attribute ID: 0
      Min functional RX lanes: 1
      Min functional TX lanes: 1
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
  Self Powered
nkowalski@Eva-Mi

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

