Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5CE3F4C8C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 16:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhHWOpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 10:45:32 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:41844 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhHWOpa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 10:45:30 -0400
X-Greylist: delayed 898 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Aug 2021 10:45:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=z4wJslesVQkDZBuLKb2BAuZLkMkMaxmY4J4xD0T8UF0=;
 b=eJsO2QcJZc4oN5cXUW6EylHoFdtsLxMmqnm8Z8O00BVtZ5LE875X2+76OVsnScMYzMwkoehiByYq8LoU9eIFzkCLhBK4LIRpyDjo0FGiB/QUV5ZDrW4Z5gSkDL1/H92180n5Cp2WSeH1wY5Ja9zuLq5zq0RIexY+ZhmwHitPZXAP/aL6aZvBMSsK7PBMYwUfpfSigwnPgRsORR65uN4ajtsyqpeeHPykDZMuFFErVTre4ZgiYSvbPSWgq/mQWTff5cByIGgFk210wDQB0n4gxwRpQdrOmJWJIt7TC6nAubK/JDoQvO5gvCeicRwGsgFz00jA6p+Rg2bGHOVaGnXu1Q==;
DomainKey-Signature: a=rsa-sha1;
 b=bvWqv5KdFgqjh+DfuJyXK6Q6UO9Fxj7G+WutgFtBsUVbarIaPc96XDmr4AcWNy+p/rhb8HZsiGd0m4+12CcQdPo2WDtph4XESfiKxFmgukiNOqFwFxoxdC5I4ZGvt2v0IJOlheJHheDPr1cfc02rSXAZG0Fst0+uuByYqNmg2nCMytNYwa4j+pTjLKmB3BYwVi9Hi5VqNlhSFB8ar7S8JNbPa3tSjQ7ihI1XkHno9N3DuiAwg4qYzGF46e3nJAk07pj+/DlMHGbB5JvIx0REHudhLYwYtEu8RCW8nB27YSEZk85QMHaEDBzg13nv+56uAy8g7iePYkjCbsZssSHrsw==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=to:from:subject:message-id:date:cc;
Received: from [IPv6:2001:16b8:2d47:4f00:c6a2:19f5:5aec:f110]
 (2001:16b8:2d47:4f00:c6a2:19f5:5aec:f110) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 1026C2;
 Mon, 23 Aug 2021 14:29:42 +0000
To:     linux-usb@vger.kernel.org
From:   Ulrich Huber <ulrich@huberulrich.de>
Subject: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
Date:   Mon, 23 Aug 2021 16:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------EC9A8650C79B64B58255AB2E"
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 6
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------EC9A8650C79B64B58255AB2E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using quite a new device (Lenovo Yoga 9 (14ITL5)) on ArchLinux with 
mainline kernel version 5.14.0-rc7 and run into the following error:

ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS 
failed (-5)

The device is charged using a USB-C cable and this error is related to 
attaching or detaching the power cable. Sometimes I can at-/detach the 
cable without this error showing, in other cases it appears once, and 
then I have cases where it floods my kernel log with one such message 
per second.

Sometimes the above error is accompanied by this additional error:

ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)

I attached the kernel log and the information from `lsusb`. Feel free to 
request further logs, though I will most likely require some pointers on 
how to get them.


Thanks in advance

Ulrich



--------------EC9A8650C79B64B58255AB2E
Content-Type: text/x-log; charset=UTF-8;
 name="lsusb_-v.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="lsusb_-v.log"


Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.0-rc7-1-mainline xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
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
      bInterfaceSubClass      0 
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
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             4
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 lowspeed L1
   Port 2: 0000.02a0 lowspeed L1
   Port 3: 0000.02a0 lowspeed L1
   Port 4: 0000.02a0 lowspeed L1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x005b
  bNumDeviceCaps          2
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         160 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                76
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x000000ef
      Sublink Speed Attribute count 15
      Sublink Speed ID count 7
    wFunctionalitySupport   0x1106
    bmSublinkSpeedAttr[0]   0x00050034
      Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[1]   0x000500b4
      Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[2]   0x000a4035
      Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[3]   0x000a40b5
      Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
    bmSublinkSpeedAttr[4]   0x00e00026
      Speed Attribute ID: 6 224Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[5]   0x00e000a6
      Speed Attribute ID: 6 224Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[6]   0x00c00027
      Speed Attribute ID: 7 192Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[7]   0x00c000a7
      Speed Attribute ID: 7 192Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[8]   0x00800028
      Speed Attribute ID: 8 128Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[9]   0x008000a8
      Speed Attribute ID: 8 128Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[10]   0x00b10029
      Speed Attribute ID: 9 177Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[11]   0x00b100a9
      Speed Attribute ID: 9 177Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[12]   0x0063002a
      Speed Attribute ID: 10 99Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[13]   0x006300aa
      Speed Attribute ID: 10 99Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[14]   0x00c6002b
      Speed Attribute ID: 11 198Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[15]   0x00c600ab
      Speed Attribute ID: 11 198Mb/s Symmetric TX SuperSpeed
Device Status:     0x0001
  Self Powered

Bus 003 Device 003: ID 04f2:b61e Chicony Electronics Co., Ltd Integrated Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04f2 Chicony Electronics Co., Ltd
  idProduct          0xb61e 
  bcdDevice            4.25
  iManufacturer           3 Chicony Electronics Co.,Ltd.
  iProduct                1 Integrated Camera
  iSerial                 2 0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x03bb
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          4 USB Camera
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Integrated Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Integrated Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x006b
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000157f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
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
        bSourceID               6
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x06
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 6
        guidExtensionCode         {26b8105a-0713-4870-979d-da79444bb68e}
        bNumControls            8
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            4
        bmControls( 0)       0x3c
        bmControls( 1)       0x18
        bmControls( 2)       0x0c
        bmControls( 3)       0x00
        iExtension              6 Realtek Extended Controls Unit
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x02b1
        bEndPointAddress                  129
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                9
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                442368000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 27648000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 36864000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                 48660480
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 48844800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                195379200
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                248832000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                    0
        bNumImageSizePatterns               9
        wWidth( 0)                       1280
        wHeight( 0)                       720
        wWidth( 1)                        320
        wHeight( 1)                       180
        wWidth( 2)                        320
        wHeight( 2)                       240
        wWidth( 3)                        352
        wHeight( 3)                       288
        wWidth( 4)                        424
        wHeight( 4)                       240
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       480
        wWidth( 7)                        848
        wHeight( 7)                       480
        wWidth( 8)                        960
        wHeight( 8)                       540
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                9
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 27648000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 36864000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                 48660480
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 48844800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                130252800
        dwMaxBitRate                130252800
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         500000
        bFrameIntervalType                  1
        dwFrameInterval( 0)            500000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                124416000
        dwMaxBitRate                124416000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  1
        dwFrameInterval( 0)            666666
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                    0
        bNumImageSizePatterns               9
        wWidth( 0)                       1280
        wHeight( 0)                       720
        wWidth( 1)                        320
        wHeight( 1)                       180
        wWidth( 2)                        320
        wHeight( 2)                       240
        wWidth( 3)                        352
        wHeight( 3)                       288
        wWidth( 4)                        424
        wHeight( 4)                       240
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       480
        wWidth( 7)                        848
        wHeight( 7)                       480
        wWidth( 8)                        960
        wHeight( 8)                       540
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b00  2x 768 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0035
  bNumDeviceCaps          2
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {20b69f2c-34b3-4690-a228-67bd251277e9}
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x00
    CapabilityData[3]    0x0a
    CapabilityData[4]    0xe8
    CapabilityData[5]    0x00
    CapabilityData[6]    0x5f
    CapabilityData[7]    0x00
Device Status:     0x0000
  (Bus Powered)

Bus 003 Device 002: ID 0bda:5812 Realtek Semiconductor Corp. Realtek USB2.0 Finger Print Bridge
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x5812 
  bcdDevice            5.02
  iManufacturer           3 Generic
  iProduct                1 Realtek USB2.0 Finger Print Bridge
  iSerial                 2 201801010001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002e
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          4 Realtek USB2.0 Finger Print Bridge
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           4
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol      0 
      iInterface              5 Realtek USB2.0 Finger Print Bridge
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
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

Bus 003 Device 004: ID 8087:0026 Intel Corp. AX201 Bluetooth
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          224 Wireless
  bDeviceSubClass         1 Radio Frequency
  bDeviceProtocol         1 Bluetooth
  bMaxPacketSize0        64
  idVendor           0x8087 Intel Corp.
  idProduct          0x0026 AX201 Bluetooth
  bcdDevice            0.02
  iManufacturer           0 
  iProduct                0 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00c8
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x003f  1x 63 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x003f  1x 63 bytes
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000c
  bNumDeviceCaps          1
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000040e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us 
Device Status:     0x0001
  Self Powered

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.0-rc7-1-mainline xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
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
      bInterfaceSubClass      0 
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
  bLength              11
  bDescriptorType      41
  nNbrPorts            12
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00 0x00
  PortPwrCtrlMask    0xff 0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0100 power
   Port 3: 0000.0100 power
   Port 4: 0000.0100 power
   Port 5: 0000.0103 power enable connect
   Port 6: 0000.0503 highspeed power enable connect
   Port 7: 0000.0100 power
   Port 8: 0000.0100 power
   Port 9: 0000.0100 power
   Port 10: 0000.0103 power enable connect
   Port 11: 0000.0100 power
   Port 12: 0000.0100 power
Device Status:     0x0001
  Self Powered

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.0-rc7-1-mainline xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:0d.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
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
      bInterfaceSubClass      0 
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
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             4
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 lowspeed L1
   Port 2: 0000.02a0 lowspeed L1
   Port 3: 0000.02a0 lowspeed L1
   Port 4: 0000.02a0 lowspeed L1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x005b
  bNumDeviceCaps          2
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat         400 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                76
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x000000ef
      Sublink Speed Attribute count 15
      Sublink Speed ID count 7
    wFunctionalitySupport   0x1106
    bmSublinkSpeedAttr[0]   0x00050034
      Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[1]   0x000500b4
      Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[2]   0x000a4035
      Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[3]   0x000a40b5
      Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
    bmSublinkSpeedAttr[4]   0x00e00026
      Speed Attribute ID: 6 224Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[5]   0x00e000a6
      Speed Attribute ID: 6 224Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[6]   0x00c00027
      Speed Attribute ID: 7 192Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[7]   0x00c000a7
      Speed Attribute ID: 7 192Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[8]   0x00800028
      Speed Attribute ID: 8 128Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[9]   0x008000a8
      Speed Attribute ID: 8 128Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[10]   0x00b10029
      Speed Attribute ID: 9 177Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[11]   0x00b100a9
      Speed Attribute ID: 9 177Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[12]   0x0063002a
      Speed Attribute ID: 10 99Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[13]   0x006300aa
      Speed Attribute ID: 10 99Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[14]   0x00c6002b
      Speed Attribute ID: 11 198Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[15]   0x00c600ab
      Speed Attribute ID: 11 198Mb/s Symmetric TX SuperSpeed
Device Status:     0x0001
  Self Powered

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.0-rc7-1-mainline xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:0d.0
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
      bInterfaceSubClass      0 
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
   Port 1: 0000.0100 power
Device Status:     0x0001
  Self Powered

--------------EC9A8650C79B64B58255AB2E
Content-Type: text/x-log; charset=UTF-8;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

[    0.028131] PM: hibernation: Registered nosave memory: [mem 0x32646000-0x32739fff]
[    0.028132] PM: hibernation: Registered nosave memory: [mem 0x3303f000-0x3303ffff]
[    0.028133] PM: hibernation: Registered nosave memory: [mem 0x36001000-0x360c4fff]
[    0.028133] PM: hibernation: Registered nosave memory: [mem 0x360c5000-0x44e41fff]
[    0.028134] PM: hibernation: Registered nosave memory: [mem 0x44e42000-0x45b32fff]
[    0.028134] PM: hibernation: Registered nosave memory: [mem 0x45b33000-0x45bfefff]
[    0.028135] PM: hibernation: Registered nosave memory: [mem 0x45c00000-0x49ffffff]
[    0.028135] PM: hibernation: Registered nosave memory: [mem 0x4a000000-0x4a1fffff]
[    0.028136] PM: hibernation: Registered nosave memory: [mem 0x4a200000-0x4a3fffff]
[    0.028136] PM: hibernation: Registered nosave memory: [mem 0x4a400000-0x4affffff]
[    0.028136] PM: hibernation: Registered nosave memory: [mem 0x4b000000-0x503fffff]
[    0.028137] PM: hibernation: Registered nosave memory: [mem 0x50400000-0xfed1ffff]
[    0.028137] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed7ffff]
[    0.028137] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xffffffff]
[    0.028138] [mem 0x50400000-0xfed1ffff] available for PCI devices
[    0.028139] Booting paravirtualized kernel on bare hardware
[    0.028141] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.031327] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:8 nr_node_ids:1
[    0.031433] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[    0.031436] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=1*2097152
[    0.031437] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.031450] Built 1 zonelists, mobility grouping on.  Total pages: 4022609
[    0.031451] Policy zone: Normal
[    0.031451] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-linux-mainline root=UUID=277b7825-1fdc-4d13-831b-600e092f1743 rw loglevel=3 resume=UUID=a0902e16-0911-4c70-9ac1-5e14decd4489 quiet
[    0.031483] Unknown command line parameters: BOOT_IMAGE=/boot/vmlinuz-linux-mainline
[    0.031867] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.032060] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.032108] mem auto-init: stack:byref_all(zero), heap alloc:on, heap free:off
[    0.053410] Memory: 15847900K/16346752K available (14344K kernel code, 2055K rwdata, 9048K rodata, 1800K init, 4100K bss, 498592K reserved, 0K cma-reserved)
[    0.053414] random: get_random_u64 called from __kmem_cache_create+0x2a/0x5a0 with crng_init=0
[    0.053494] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.053502] ftrace: allocating 42487 entries in 166 pages
[    0.061872] ftrace: allocated 166 pages with 4 groups
[    0.061943] rcu: Preemptible hierarchical RCU implementation.
[    0.061944] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.061944] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=8.
[    0.061945] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.061946] 	Trampoline variant of Tasks RCU enabled.
[    0.061946] 	Rude variant of Tasks RCU enabled.
[    0.061946] 	Tracing variant of Tasks RCU enabled.
[    0.061947] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.061947] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.064002] NR_IRQS: 20736, nr_irqs: 2048, preallocated irqs: 16
[    0.064834] Console: colour dummy device 80x25
[    0.064841] printk: console [tty0] enabled
[    0.064853] ACPI: Core revision 20210604
[    0.065369] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 99544814920 ns
[    0.065662] APIC: Switch to symmetric I/O mode setup
[    0.065664] DMAR: Host address width 39
[    0.065664] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.065667] DMAR: dmar0: reg_base_addr fed90000 ver 4:0 cap 1c0000c40660462 ecap 69e2ff0505e
[    0.065668] DMAR: DRHD base: 0x000000fed84000 flags: 0x0
[    0.065671] DMAR: dmar1: reg_base_addr fed84000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.065673] DMAR: DRHD base: 0x000000fed85000 flags: 0x0
[    0.065675] DMAR: dmar2: reg_base_addr fed85000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.065676] DMAR: DRHD base: 0x000000fed86000 flags: 0x0
[    0.065680] DMAR: dmar3: reg_base_addr fed86000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.065681] DMAR: DRHD base: 0x000000fed87000 flags: 0x0
[    0.065684] DMAR: dmar4: reg_base_addr fed87000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.065685] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.065688] DMAR: dmar5: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.065690] DMAR: RMRR base: 0x0000004c000000 end: 0x000000503fffff
[    0.065692] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 5
[    0.065693] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.065694] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.071655] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.071657] x2apic enabled
[    0.071746] Switched APIC routing to cluster x2apic.
[    0.086450] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.102201] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.102208] Calibrating delay loop (skipped), value calculated using timer frequency.. 5992.00 BogoMIPS (lpj=9984000)
[    0.102210] pid_max: default: 32768 minimum: 301
[    0.103886] LSM: Security Framework initializing
[    0.103891] landlock: Up and running.
[    0.103892] Yama: becoming mindful.
[    0.103939] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.103967] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.104136] x86/tme: not enabled by BIOS
[    0.104142] CPU0: Thermal monitoring enabled (TM1)
[    0.104144] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.104233] process: using mwait in idle threads
[    0.104234] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.104235] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.104238] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.104239] Spectre V2 : Mitigation: Enhanced IBRS
[    0.104239] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.104240] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.104241] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.107187] Freeing SMP alternatives memory: 36K
[    0.108965] smpboot: Estimated ratio of average max frequency by base frequency (times 1024): 1467
[    0.109016] smpboot: CPU0: 11th Gen Intel(R) Core(TM) i7-1185G7 @ 3.00GHz (family: 0x6, model: 0x8c, stepping: 0x1)
[    0.109088] Performance Events: PEBS fmt4+-baseline,  AnyThread deprecated, Icelake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.109099] ... version:                5
[    0.109100] ... bit width:              48
[    0.109100] ... generic registers:      8
[    0.109100] ... value mask:             0000ffffffffffff
[    0.109101] ... max period:             00007fffffffffff
[    0.109101] ... fixed-purpose events:   4
[    0.109101] ... event mask:             0001000f000000ff
[    0.109157] rcu: Hierarchical SRCU implementation.
[    0.109677] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.109733] smp: Bringing up secondary CPUs ...
[    0.109797] x86: Booting SMP configuration:
[    0.109797] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.119751] smp: Brought up 1 node, 8 CPUs
[    0.119751] smpboot: Max logical packages: 1
[    0.119751] smpboot: Total of 8 processors activated (47942.00 BogoMIPS)
[    0.122897] devtmpfs: initialized
[    0.122897] x86/mm: Memory block size: 128MB
[    0.122897] ACPI: PM: Registering ACPI NVS region [mem 0x44e42000-0x45b32fff] (13570048 bytes)
[    0.122897] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.122897] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.122897] pinctrl core: initialized pinctrl subsystem
[    0.122964] PM: RTC time: 13:18:42, date: 2021-08-23
[    0.123048] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.123208] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
[    0.123320] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.123424] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.123429] audit: initializing netlink subsys (disabled)
[    0.123432] audit: type=2000 audit(1629724722.043:1): state=initialized audit_enabled=0 res=1
[    0.123432] thermal_sys: Registered thermal governor 'fair_share'
[    0.123432] thermal_sys: Registered thermal governor 'bang_bang'
[    0.123432] thermal_sys: Registered thermal governor 'step_wise'
[    0.123432] thermal_sys: Registered thermal governor 'user_space'
[    0.123432] thermal_sys: Registered thermal governor 'power_allocator'
[    0.123432] cpuidle: using governor ladder
[    0.123432] cpuidle: using governor menu
[    0.123432] ACPI: bus type PCI registered
[    0.123432] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.123432] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xc0000000-0xcfffffff] (base 0xc0000000)
[    0.123432] PCI: not using MMCONFIG
[    0.123432] PCI: Using configuration type 1 for base access
[    0.125580] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.126060] Kprobes globally optimized
[    0.126063] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.126063] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.126063] ACPI: PRMT not present
[    0.126063] ACPI: Added _OSI(Module Device)
[    0.126063] ACPI: Added _OSI(Processor Device)
[    0.126063] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.126063] ACPI: Added _OSI(Processor Aggregator Device)
[    0.126063] ACPI: Added _OSI(Linux-Dell-Video)
[    0.126063] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.126063] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.169998] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C0.TPD0], AE_NOT_FOUND (20210604/dswload2-162)
[    0.170002] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20210604/psobject-220)
[    0.170003] ACPI: Skipping parse of AML opcode: Scope (0x0010)
[    0.170043] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C1.TPL1], AE_NOT_FOUND (20210604/dswload2-162)
[    0.170045] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20210604/psobject-220)
[    0.170046] ACPI: Skipping parse of AML opcode: Scope (0x0010)
[    0.170065] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C2.TPL1], AE_NOT_FOUND (20210604/dswload2-162)
[    0.170066] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20210604/psobject-220)
[    0.170067] ACPI: Skipping parse of AML opcode: Scope (0x0010)
[    0.177149] ACPI BIOS Error (bug): Failure creating named object [\B2PT], AE_ALREADY_EXISTS (20210604/dsfield-637)
[    0.177282] ACPI: 14 ACPI AML tables successfully acquired and loaded
[    0.186858] ACPI: Dynamic OEM Table Load:
[    0.186864] ACPI: SSDT 0xFFFF9126402A1000 0001CB (v02 PmRef  Cpu0Psd  00003000 INTL 20191018)
[    0.187455] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.188163] ACPI: Dynamic OEM Table Load:
[    0.188168] ACPI: SSDT 0xFFFF912641B1D800 000394 (v02 PmRef  Cpu0Cst  00003001 INTL 20191018)
[    0.188890] ACPI: Dynamic OEM Table Load:
[    0.188894] ACPI: SSDT 0xFFFF912641B4E800 000689 (v02 PmRef  Cpu0Ist  00003000 INTL 20191018)
[    0.189688] ACPI: Dynamic OEM Table Load:
[    0.189692] ACPI: SSDT 0xFFFF912641B1EC00 000266 (v02 PmRef  Cpu0Hwp  00003000 INTL 20191018)
[    0.190536] ACPI: Dynamic OEM Table Load:
[    0.190541] ACPI: SSDT 0xFFFF912640078000 0008E7 (v02 PmRef  ApIst    00003000 INTL 20191018)
[    0.191373] ACPI: Dynamic OEM Table Load:
[    0.191377] ACPI: SSDT 0xFFFF912641B4B800 00048A (v02 PmRef  ApHwp    00003000 INTL 20191018)
[    0.192124] ACPI: Dynamic OEM Table Load:
[    0.192128] ACPI: SSDT 0xFFFF912641B4A800 0004D2 (v02 PmRef  ApPsd    00003000 INTL 20191018)
[    0.192873] ACPI: Dynamic OEM Table Load:
[    0.192876] ACPI: SSDT 0xFFFF912641B4D800 00048A (v02 PmRef  ApCst    00003000 INTL 20191018)
[    0.195679] ACPI: EC: EC started
[    0.195679] ACPI: EC: interrupt blocked
[    0.209490] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.209491] ACPI: \_SB_.PC00.LPCB.H_EC: Boot DSDT EC used to handle transactions
[    0.209492] ACPI: Interpreter enabled
[    0.209535] ACPI: PM: (supports S0 S3 S4 S5)
[    0.209535] ACPI: Using IOAPIC for interrupt routing
[    0.209569] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xc0000000-0xcfffffff] (base 0xc0000000)
[    0.210271] PCI: MMCONFIG at [mem 0xc0000000-0xcfffffff] reserved in ACPI motherboard resources
[    0.210278] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.210758] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.213546] ACPI: PM: Power Resource [BTPR]
[    0.214890] ACPI: PM: Power Resource [PAUD]
[    0.217652] ACPI: PM: Power Resource [PXP]
[    0.218117] ACPI: PM: Power Resource [PXP]
[    0.219050] ACPI: PM: Power Resource [PXP]
[    0.223104] ACPI: PM: Power Resource [V0PR]
[    0.223194] ACPI: PM: Power Resource [V1PR]
[    0.223285] ACPI: PM: Power Resource [V2PR]
[    0.225096] ACPI: PM: Power Resource [PTPL]
[    0.328905] ACPI: PM: Power Resource [PXTC]
[    0.329047] ACPI: PM: Power Resource [PXTC]
[    0.329084] ACPI: PM: Power Resource [PXTC]
[    0.330841] ACPI: PM: Power Resource [WRST]
[    0.331033] ACPI: PM: Power Resource [TBT0]
[    0.331046] ACPI: PM: Power Resource [TBT1]
[    0.331057] ACPI: PM: Power Resource [D3C]
[    0.775910] ACPI: PM: Power Resource [FN00]
[    0.775972] ACPI: PM: Power Resource [FN01]
[    0.776032] ACPI: PM: Power Resource [FN02]
[    0.776092] ACPI: PM: Power Resource [FN03]
[    0.776150] ACPI: PM: Power Resource [FN04]
[    0.776835] ACPI: PM: Power Resource [PIN]
[    0.777176] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.777181] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.780632] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.786858] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME PCIeCapability LTR DPC]
[    0.790393] PCI host bridge to bus 0000:00
[    0.790394] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.790395] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.790396] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.790397] pci_bus 0000:00: root bus resource [mem 0x50400000-0xbfffffff window]
[    0.790398] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x7fffffffff window]
[    0.790398] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.790462] pci 0000:00:00.0: [8086:9a14] type 00 class 0x060000
[    0.791480] pci 0000:00:02.0: [8086:9a49] type 00 class 0x030000
[    0.791487] pci 0000:00:02.0: reg 0x10: [mem 0x607c000000-0x607cffffff 64bit]
[    0.791491] pci 0000:00:02.0: reg 0x18: [mem 0x4000000000-0x400fffffff 64bit pref]
[    0.791495] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
[    0.791508] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.791509] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.791531] pci 0000:00:02.0: reg 0x344: [mem 0x00000000-0x00ffffff 64bit]
[    0.791532] pci 0000:00:02.0: VF(n) BAR0 space: [mem 0x00000000-0x06ffffff 64bit] (contains BAR0 for 7 VFs)
[    0.791535] pci 0000:00:02.0: reg 0x34c: [mem 0x00000000-0x1fffffff 64bit pref]
[    0.791536] pci 0000:00:02.0: VF(n) BAR2 space: [mem 0x00000000-0xdfffffff 64bit pref] (contains BAR2 for 7 VFs)
[    0.792396] pci 0000:00:04.0: [8086:9a03] type 00 class 0x118000
[    0.792411] pci 0000:00:04.0: reg 0x10: [mem 0x607d180000-0x607d19ffff 64bit]
[    0.793399] pci 0000:00:06.0: [8086:9a09] type 01 class 0x060400
[    0.793474] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.793504] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.794742] pci 0000:00:07.0: [8086:9a23] type 01 class 0x060400
[    0.795537] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.795559] pci 0000:00:07.0: DPC: RP PIO log size 0 is invalid
[    0.796079] pci 0000:00:07.1: [8086:9a25] type 01 class 0x060400
[    0.796873] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.796895] pci 0000:00:07.1: DPC: RP PIO log size 0 is invalid
[    0.797410] pci 0000:00:07.2: [8086:9a27] type 01 class 0x060400
[    0.798201] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.798222] pci 0000:00:07.2: DPC: RP PIO log size 0 is invalid
[    0.798736] pci 0000:00:07.3: [8086:9a29] type 01 class 0x060400
[    0.799531] pci 0000:00:07.3: PME# supported from D0 D3hot D3cold
[    0.799553] pci 0000:00:07.3: DPC: RP PIO log size 0 is invalid
[    0.800175] pci 0000:00:0a.0: [8086:9a0d] type 00 class 0x118000
[    0.800182] pci 0000:00:0a.0: reg 0x10: [mem 0x607d1d0000-0x607d1d7fff 64bit]
[    0.800201] pci 0000:00:0a.0: enabling Extended Tags
[    0.801039] pci 0000:00:0d.0: [8086:9a13] type 00 class 0x0c0330
[    0.801050] pci 0000:00:0d.0: reg 0x10: [mem 0x607d1c0000-0x607d1cffff 64bit]
[    0.801101] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.802072] pci 0000:00:0d.2: [8086:9a1b] type 00 class 0x0c0340
[    0.802082] pci 0000:00:0d.2: reg 0x10: [mem 0x607d140000-0x607d17ffff 64bit]
[    0.802089] pci 0000:00:0d.2: reg 0x18: [mem 0x607d1ec000-0x607d1ecfff 64bit]
[    0.802120] pci 0000:00:0d.2: supports D1 D2
[    0.802121] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.802945] pci 0000:00:0d.3: [8086:9a1d] type 00 class 0x0c0340
[    0.802955] pci 0000:00:0d.3: reg 0x10: [mem 0x607d100000-0x607d13ffff 64bit]
[    0.802962] pci 0000:00:0d.3: reg 0x18: [mem 0x607d1eb000-0x607d1ebfff 64bit]
[    0.802993] pci 0000:00:0d.3: supports D1 D2
[    0.802993] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.803969] pci 0000:00:12.0: [8086:a0fc] type 00 class 0x070000
[    0.803989] pci 0000:00:12.0: reg 0x10: [mem 0x607d1b0000-0x607d1bffff 64bit]
[    0.804077] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.805203] pci 0000:00:14.0: [8086:a0ed] type 00 class 0x0c0330
[    0.805223] pci 0000:00:14.0: reg 0x10: [mem 0x607d1a0000-0x607d1affff 64bit]
[    0.805324] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.806307] pci 0000:00:14.2: [8086:a0ef] type 00 class 0x050000
[    0.806327] pci 0000:00:14.2: reg 0x10: [mem 0x607d1e0000-0x607d1e3fff 64bit]
[    0.806339] pci 0000:00:14.2: reg 0x18: [mem 0x607d1ea000-0x607d1eafff 64bit]
[    0.807571] pci 0000:00:14.3: [8086:a0f0] type 00 class 0x028000
[    0.807916] pci 0000:00:14.3: reg 0x10: [mem 0x607d1dc000-0x607d1dffff 64bit]
[    0.809706] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.811172] pci 0000:00:15.0: [8086:a0e8] type 00 class 0x0c8000
[    0.811229] pci 0000:00:15.0: reg 0x10: [mem 0x607d1e9000-0x607d1e9fff 64bit]
[    0.812474] pci 0000:00:15.1: [8086:a0e9] type 00 class 0x0c8000
[    0.812546] pci 0000:00:15.1: reg 0x10: [mem 0x607d1e8000-0x607d1e8fff 64bit]
[    0.813849] pci 0000:00:15.2: [8086:a0ea] type 00 class 0x0c8000
[    0.813911] pci 0000:00:15.2: reg 0x10: [mem 0x607d1e7000-0x607d1e7fff 64bit]
[    0.815182] pci 0000:00:15.3: [8086:a0eb] type 00 class 0x0c8000
[    0.815251] pci 0000:00:15.3: reg 0x10: [mem 0x607d1e6000-0x607d1e6fff 64bit]
[    0.816493] pci 0000:00:16.0: [8086:a0e0] type 00 class 0x078000
[    0.816516] pci 0000:00:16.0: reg 0x10: [mem 0x607d1e5000-0x607d1e5fff 64bit]
[    0.816609] pci 0000:00:16.0: PME# supported from D3hot
[    0.817887] pci 0000:00:1f.0: [8086:a082] type 00 class 0x060100
[    0.818933] pci 0000:00:1f.3: [8086:a0c8] type 00 class 0x040100
[    0.818991] pci 0000:00:1f.3: reg 0x10: [mem 0x607d1d8000-0x607d1dbfff 64bit]
[    0.819066] pci 0000:00:1f.3: reg 0x20: [mem 0x607d000000-0x607d0fffff 64bit]
[    0.819223] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.820302] pci 0000:00:1f.4: [8086:a0a3] type 00 class 0x0c0500
[    0.820328] pci 0000:00:1f.4: reg 0x10: [mem 0x607d1e4000-0x607d1e40ff 64bit]
[    0.820354] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.821323] pci 0000:00:1f.5: [8086:a0a4] type 00 class 0x0c8000
[    0.821341] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.822272] pci 0000:01:00.0: [15b7:5006] type 00 class 0x010802
[    0.822287] pci 0000:01:00.0: reg 0x10: [mem 0x88200000-0x88203fff 64bit]
[    0.822309] pci 0000:01:00.0: reg 0x20: [mem 0x88204000-0x882040ff 64bit]
[    0.822452] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.822455] pci 0000:00:06.0:   bridge window [mem 0x88200000-0x882fffff]
[    0.822484] pci 0000:00:07.0: PCI bridge to [bus 02-38]
[    0.822487] pci 0000:00:07.0:   bridge window [mem 0x7c000000-0x881fffff]
[    0.822490] pci 0000:00:07.0:   bridge window [mem 0x6000000000-0x601bffffff 64bit pref]
[    0.822517] pci 0000:00:07.1: PCI bridge to [bus 39-6f]
[    0.822520] pci 0000:00:07.1:   bridge window [mem 0x6e000000-0x7a1fffff]
[    0.822523] pci 0000:00:07.1:   bridge window [mem 0x6020000000-0x603bffffff 64bit pref]
[    0.822550] pci 0000:00:07.2: PCI bridge to [bus 70-a6]
[    0.822553] pci 0000:00:07.2:   bridge window [mem 0x60000000-0x6c1fffff]
[    0.822557] pci 0000:00:07.2:   bridge window [mem 0x6040000000-0x605bffffff 64bit pref]
[    0.822583] pci 0000:00:07.3: PCI bridge to [bus a7-dd]
[    0.822586] pci 0000:00:07.3:   bridge window [mem 0x52000000-0x5e1fffff]
[    0.822589] pci 0000:00:07.3:   bridge window [mem 0x6060000000-0x607bffffff 64bit pref]
[    0.836859] ACPI: EC: interrupt unblocked
[    0.836860] ACPI: EC: event unblocked
[    0.836894] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.836895] ACPI: EC: GPE=0x6e
[    0.836896] ACPI: \_SB_.PC00.LPCB.H_EC: Boot DSDT EC initialization complete
[    0.836897] ACPI: \_SB_.PC00.LPCB.H_EC: EC: Used to handle transactions and events
[    0.836940] iommu: Default domain type: Translated 
[    0.836977] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.836977] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.836977] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.836977] vgaarb: loaded
[    0.836977] SCSI subsystem initialized
[    0.836977] libata version 3.00 loaded.
[    0.836977] ACPI: bus type USB registered
[    0.836977] usbcore: registered new interface driver usbfs
[    0.836977] usbcore: registered new interface driver hub
[    0.836977] usbcore: registered new device driver usb
[    0.836977] pps_core: LinuxPPS API ver. 1 registered
[    0.836977] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.836977] PTP clock support registered
[    0.836977] EDAC MC: Ver: 3.0.0
[    0.836977] Registered efivars operations
[    0.836977] NetLabel: Initializing
[    0.836977] NetLabel:  domain hash size = 128
[    0.836977] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.836977] NetLabel:  unlabeled traffic allowed by default
[    0.836977] PCI: Using ACPI for IRQ routing
[    0.860831] PCI: pci_cache_line_size set to 64 bytes
[    0.860952] pci 0000:00:1f.5: can't claim BAR 0 [mem 0xfe010000-0xfe010fff]: no compatible bridge window
[    0.861038] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.861040] e820: reserve RAM buffer [mem 0x32646000-0x33ffffff]
[    0.861040] e820: reserve RAM buffer [mem 0x3303f000-0x33ffffff]
[    0.861041] e820: reserve RAM buffer [mem 0x36001000-0x37ffffff]
[    0.861041] e820: reserve RAM buffer [mem 0x45c00000-0x47ffffff]
[    0.861042] e820: reserve RAM buffer [mem 0x4afc00000-0x4afffffff]
[    0.861047] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.861047] hpet0: 8 comparators, 64-bit 19.200000 MHz counter
[    0.863281] clocksource: Switched to clocksource tsc-early
[    0.866742] VFS: Disk quotas dquot_6.6.0
[    0.866750] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.866788] ACPI FPDT: [Firmware Bug]: Invalid record 4113 found.
[    0.866794] pnp: PnP ACPI init
[    0.866911] system 00:00: [io  0x06a4] has been reserved
[    0.866912] system 00:00: [io  0x06a0] has been reserved
[    0.867044] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.867045] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.867046] system 00:01: [io  0x0270-0x036e] has been reserved
[    0.867047] system 00:01: [io  0x0271-0x036f] could not be reserved
[    0.867131] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.867466] pnp 00:04: disabling [mem 0xc0000000-0xcfffffff] because it overlaps 0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
[    0.867480] system 00:04: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.867481] system 00:04: [mem 0xfeda0000-0xfeda0fff] has been reserved
[    0.867482] system 00:04: [mem 0xfeda1000-0xfeda1fff] has been reserved
[    0.867483] system 00:04: [mem 0xfed20000-0xfed7ffff] could not be reserved
[    0.867483] system 00:04: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.867484] system 00:04: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.867485] system 00:04: [mem 0xfee00000-0xfeefffff] has been reserved
[    0.867798] system 00:05: [io  0x1800-0x18fe] could not be reserved
[    0.867798] system 00:05: [mem 0xfe000000-0xfe01ffff] has been reserved
[    0.867798] system 00:05: [mem 0xfe04c000-0xfe04ffff] has been reserved
[    0.867798] system 00:05: [mem 0xfe050000-0xfe0affff] has been reserved
[    0.867798] system 00:05: [mem 0xfe0d0000-0xfe0fffff] has been reserved
[    0.867798] system 00:05: [mem 0xfe200000-0xfe7fffff] has been reserved
[    0.867798] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.867798] system 00:05: [mem 0xfd000000-0xfd68ffff] has been reserved
[    0.867798] system 00:05: [mem 0xfd6b0000-0xfd6cffff] has been reserved
[    0.867798] system 00:05: [mem 0xfd6f0000-0xfdffffff] has been reserved
[    0.867798] system 00:06: [io  0x2000-0x20fe] has been reserved
[    0.867798] pnp: PnP ACPI: found 8 devices
[    0.873563] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.873594] NET: Registered PF_INET protocol family
[    0.873761] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.874701] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.874790] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.874938] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.874979] TCP: Hash tables configured (established 131072 bind 65536)
[    0.875054] MPTCP token hash table entries: 16384 (order: 6, 393216 bytes, linear)
[    0.875100] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.875132] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.875169] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.875173] NET: Registered PF_XDP protocol family
[    0.875176] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus 02-38] add_size 1000
[    0.875178] pci 0000:00:07.1: bridge window [io  0x1000-0x0fff] to [bus 39-6f] add_size 1000
[    0.875179] pci 0000:00:07.2: bridge window [io  0x1000-0x0fff] to [bus 70-a6] add_size 1000
[    0.875180] pci 0000:00:07.3: bridge window [io  0x1000-0x0fff] to [bus a7-dd] add_size 1000
[    0.875187] pci 0000:00:02.0: BAR 9: assigned [mem 0x4020000000-0x40ffffffff 64bit pref]
[    0.875189] pci 0000:00:02.0: BAR 7: assigned [mem 0x4010000000-0x4016ffffff 64bit]
[    0.875191] pci 0000:00:07.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.875192] pci 0000:00:07.1: BAR 13: assigned [io  0x5000-0x5fff]
[    0.875193] pci 0000:00:07.2: BAR 13: assigned [io  0x6000-0x6fff]
[    0.875194] pci 0000:00:07.3: BAR 13: assigned [io  0x7000-0x7fff]
[    0.875195] pci 0000:00:1f.5: BAR 0: assigned [mem 0x50400000-0x50400fff]
[    0.875232] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.875239] pci 0000:00:06.0:   bridge window [mem 0x88200000-0x882fffff]
[    0.875247] pci 0000:00:07.0: PCI bridge to [bus 02-38]
[    0.875248] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.875251] pci 0000:00:07.0:   bridge window [mem 0x7c000000-0x881fffff]
[    0.875253] pci 0000:00:07.0:   bridge window [mem 0x6000000000-0x601bffffff 64bit pref]
[    0.875256] pci 0000:00:07.1: PCI bridge to [bus 39-6f]
[    0.875257] pci 0000:00:07.1:   bridge window [io  0x5000-0x5fff]
[    0.875260] pci 0000:00:07.1:   bridge window [mem 0x6e000000-0x7a1fffff]
[    0.875262] pci 0000:00:07.1:   bridge window [mem 0x6020000000-0x603bffffff 64bit pref]
[    0.875265] pci 0000:00:07.2: PCI bridge to [bus 70-a6]
[    0.875266] pci 0000:00:07.2:   bridge window [io  0x6000-0x6fff]
[    0.875269] pci 0000:00:07.2:   bridge window [mem 0x60000000-0x6c1fffff]
[    0.875271] pci 0000:00:07.2:   bridge window [mem 0x6040000000-0x605bffffff 64bit pref]
[    0.875274] pci 0000:00:07.3: PCI bridge to [bus a7-dd]
[    0.875275] pci 0000:00:07.3:   bridge window [io  0x7000-0x7fff]
[    0.875278] pci 0000:00:07.3:   bridge window [mem 0x52000000-0x5e1fffff]
[    0.875280] pci 0000:00:07.3:   bridge window [mem 0x6060000000-0x607bffffff 64bit pref]
[    0.875283] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.875284] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.875285] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.875286] pci_bus 0000:00: resource 7 [mem 0x50400000-0xbfffffff window]
[    0.875286] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x7fffffffff window]
[    0.875287] pci_bus 0000:01: resource 1 [mem 0x88200000-0x882fffff]
[    0.875288] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.875289] pci_bus 0000:02: resource 1 [mem 0x7c000000-0x881fffff]
[    0.875289] pci_bus 0000:02: resource 2 [mem 0x6000000000-0x601bffffff 64bit pref]
[    0.875290] pci_bus 0000:39: resource 0 [io  0x5000-0x5fff]
[    0.875290] pci_bus 0000:39: resource 1 [mem 0x6e000000-0x7a1fffff]
[    0.875291] pci_bus 0000:39: resource 2 [mem 0x6020000000-0x603bffffff 64bit pref]
[    0.875292] pci_bus 0000:70: resource 0 [io  0x6000-0x6fff]
[    0.875292] pci_bus 0000:70: resource 1 [mem 0x60000000-0x6c1fffff]
[    0.875293] pci_bus 0000:70: resource 2 [mem 0x6040000000-0x605bffffff 64bit pref]
[    0.875294] pci_bus 0000:a7: resource 0 [io  0x7000-0x7fff]
[    0.875294] pci_bus 0000:a7: resource 1 [mem 0x52000000-0x5e1fffff]
[    0.875295] pci_bus 0000:a7: resource 2 [mem 0x6060000000-0x607bffffff 64bit pref]
[    0.875394] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.875806] PCI: CLS 0 bytes, default 64
[    0.875812] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.875821] DMAR: No ATSR found
[    0.875822] DMAR: No SATC found
[    0.875823] DMAR: IOMMU feature fl1gp_support inconsistent
[    0.875824] DMAR: IOMMU feature pgsel_inv inconsistent
[    0.875824] DMAR: IOMMU feature nwfs inconsistent
[    0.875825] DMAR: IOMMU feature pds inconsistent
[    0.875825] DMAR: IOMMU feature dit inconsistent
[    0.875826] DMAR: IOMMU feature eafs inconsistent
[    0.875826] DMAR: IOMMU feature prs inconsistent
[    0.875826] DMAR: IOMMU feature nest inconsistent
[    0.875826] DMAR: IOMMU feature mts inconsistent
[    0.875827] DMAR: IOMMU feature sc_support inconsistent
[    0.875827] DMAR: IOMMU feature dev_iotlb_support inconsistent
[    0.875828] DMAR: dmar4: Using Queued invalidation
[    0.875830] DMAR: dmar3: Using Queued invalidation
[    0.875832] DMAR: dmar2: Using Queued invalidation
[    0.875833] DMAR: dmar1: Using Queued invalidation
[    0.875835] DMAR: dmar0: Using Queued invalidation
[    0.875837] DMAR: dmar5: Using Queued invalidation
[    0.875855] Trying to unpack rootfs image as initramfs...
[    0.875999] pci 0000:00:00.0: Adding to iommu group 0
[    0.876004] pci 0000:00:02.0: Adding to iommu group 1
[    0.876008] pci 0000:00:04.0: Adding to iommu group 2
[    0.876014] pci 0000:00:06.0: Adding to iommu group 3
[    0.876020] pci 0000:00:07.0: Adding to iommu group 4
[    0.876026] pci 0000:00:07.1: Adding to iommu group 5
[    0.876032] pci 0000:00:07.2: Adding to iommu group 6
[    0.876038] pci 0000:00:07.3: Adding to iommu group 7
[    0.876042] pci 0000:00:0a.0: Adding to iommu group 8
[    0.876051] pci 0000:00:0d.0: Adding to iommu group 9
[    0.876055] pci 0000:00:0d.2: Adding to iommu group 9
[    0.876060] pci 0000:00:0d.3: Adding to iommu group 9
[    0.876065] pci 0000:00:12.0: Adding to iommu group 10
[    0.876073] pci 0000:00:14.0: Adding to iommu group 11
[    0.876078] pci 0000:00:14.2: Adding to iommu group 11
[    0.876083] pci 0000:00:14.3: Adding to iommu group 12
[    0.876094] pci 0000:00:15.0: Adding to iommu group 13
[    0.876099] pci 0000:00:15.1: Adding to iommu group 13
[    0.876104] pci 0000:00:15.2: Adding to iommu group 13
[    0.876108] pci 0000:00:15.3: Adding to iommu group 13
[    0.876115] pci 0000:00:16.0: Adding to iommu group 14
[    0.876125] pci 0000:00:1f.0: Adding to iommu group 15
[    0.876129] pci 0000:00:1f.3: Adding to iommu group 15
[    0.876134] pci 0000:00:1f.4: Adding to iommu group 15
[    0.876139] pci 0000:00:1f.5: Adding to iommu group 15
[    0.876145] pci 0000:01:00.0: Adding to iommu group 16
[    0.876245] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.876246] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.876246] software IO TLB: mapped [mem 0x000000002a45b000-0x000000002e45b000] (64MB)
[    0.876264] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.876283] clocksource: Switched to clocksource tsc
[    0.876295] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.882981] Initialise system trusted keyrings
[    0.882991] Key type blacklist registered
[    0.883028] workingset: timestamp_bits=41 max_order=22 bucket_order=0
[    0.883558] zbud: loaded
[    0.890145] Key type asymmetric registered
[    0.890151] Asymmetric key parser 'x509' registered
[    0.890155] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    0.890198] io scheduler mq-deadline registered
[    0.890199] io scheduler kyber registered
[    0.890214] io scheduler bfq registered
[    0.897869] pcieport 0000:00:06.0: PME: Signaling with IRQ 126
[    0.898030] pcieport 0000:00:07.0: PME: Signaling with IRQ 127
[    0.898043] pcieport 0000:00:07.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.898226] pcieport 0000:00:07.1: PME: Signaling with IRQ 128
[    0.898237] pcieport 0000:00:07.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.898403] pcieport 0000:00:07.2: PME: Signaling with IRQ 129
[    0.898414] pcieport 0000:00:07.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.898580] pcieport 0000:00:07.3: PME: Signaling with IRQ 130
[    0.898590] pcieport 0000:00:07.3: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.898669] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.898685] efifb: probing for efifb
[    0.898694] efifb: showing boot graphics
[    0.900186] efifb: framebuffer at 0x4000000000, using 8128k, total 8128k
[    0.900187] efifb: mode is 1920x1080x32, linelength=7680, pages=1
[    0.900187] efifb: scrolling: redraw
[    0.900188] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.900217] fbcon: Deferring console take-over
[    0.900218] fb0: EFI VGA frame buffer device
[    0.900377] Monitor-Mwait will be used to enter C-1 state
[    0.900380] Monitor-Mwait will be used to enter C-2 state
[    0.900381] Monitor-Mwait will be used to enter C-3 state
[    0.900382] ACPI: \_SB_.PR00: Found 3 idle states
[    0.900706] Freeing initrd memory: 12736K
[    0.909965] ACPI: AC: AC Adapter [ADP1] (on-line)
[    0.910026] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1a/PNP0C09:00/PNP0C0D:00/input/input0
[    0.910042] ACPI: button: Lid Switch [LID0]
[    0.910092] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.912273] ACPI: button: Power Button [PWRF]
[    0.912496] smpboot: Estimated ratio of average max frequency by base frequency (times 1024): 1467
[    0.914731] thermal LNXTHERM:00: registered as thermal_zone0
[    0.914732] ACPI: thermal: Thermal Zone [TZ00] (28 C)
[    0.914893] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.918072] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.925003] Non-volatile memory driver v1.3
[    0.925004] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    0.925005] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[    0.927748] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    0.927856] nvme nvme0: pci function 0000:01:00.0
[    0.927906] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.927909] ehci-pci: EHCI PCI platform driver
[    0.927914] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.927915] ohci-pci: OHCI PCI platform driver
[    0.927919] uhci_hcd: USB Universal Host Controller Interface driver
[    0.927941] usbcore: registered new interface driver usbserial_generic
[    0.927943] usbserial: USB Serial support registered for generic
[    0.928159] rtc_cmos rtc_cmos: RTC can wake from S4
[    0.930387] rtc_cmos rtc_cmos: registered as rtc0
[    0.930982] rtc_cmos rtc_cmos: setting system clock to 2021-08-23T13:18:43 UTC (1629724723)
[    0.930990] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram
[    0.931161] intel_pstate: Intel P-state driver initializing
[    0.933554] intel_pstate: HWP enabled
[    0.933830] ledtrig-cpu: registered to indicate activity on CPUs
[    0.933983] hid: raw HID events driver (C) Jiri Kosina
[    0.935329] intel_pmc_core INT33A1:00:  initialized
[    0.935392] drop_monitor: Initializing network drop monitor service
[    0.935433] Initializing XFRM netlink socket
[    0.935491] NET: Registered PF_INET6 protocol family
[    0.938056] nvme nvme0: 8/0/0 default/read/poll queues
[    0.938456] Segment Routing with IPv6
[    0.938456] RPL Segment Routing with IPv6
[    0.938468] NET: Registered PF_PACKET protocol family
[    0.939000] microcode: sig=0x806c1, pf=0x80, revision=0x88
[    0.939048] microcode: Microcode Update Driver: v2.2.
[    0.939195] resctrl: L2 allocation detected
[    0.939196] resctrl: L2DATA allocation detected
[    0.939196] resctrl: L2CODE allocation detected
[    0.939198] IPI shorthand broadcast: enabled
[    0.939210] sched_clock: Marking stable (925049158, 14131389)->(946002059, -6821512)
[    0.939358] registered taskstats version 1
[    0.939444] Loading compiled-in X.509 certificates
[    0.940950] Loaded X.509 cert 'Build time autogenerated kernel key: 53770167d81978ed134fb2fca95522edeea12a84'
[    0.941286] zswap: loaded using pool lz4/z3fold
[    0.941640] Key type ._fscrypt registered
[    0.941641] Key type .fscrypt registered
[    0.941642] Key type fscrypt-provisioning registered
[    0.941855] PM:   Magic number: 1:391:332
[    0.941875] tty tty53: hash matches
[    0.942004] RAS: Correctable Errors collector initialized.
[    0.942693]  nvme0n1: p1 p2 p3
[    0.977322] ACPI: battery: Slot [BAT0] (battery present)
[    0.979775] Freeing unused decrypted memory: 2036K
[    0.980016] Freeing unused kernel image (initmem) memory: 1800K
[    1.025720] Write protecting the kernel read-only data: 26624k
[    1.026388] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    1.026690] Freeing unused kernel image (rodata/data gap) memory: 1192K
[    1.033539] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.033543] rodata_test: all tests were successful
[    1.033548] Run /init as init process
[    1.033549]   with arguments:
[    1.033550]     /init
[    1.033550]   with environment:
[    1.033551]     HOME=/
[    1.033551]     TERM=linux
[    1.033551]     BOOT_IMAGE=/boot/vmlinuz-linux-mainline
[    1.068240] fbcon: Taking over console
[    1.068281] Console: switching to colour frame buffer device 240x67
[    1.120633] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.120639] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    1.121033] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.121035] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.121702] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.121843] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.14
[    1.121845] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.121846] usb usb1: Product: xHCI Host Controller
[    1.121847] usb usb1: Manufacturer: Linux 5.14.0-rc7-1-mainline xhci-hcd
[    1.121848] usb usb1: SerialNumber: 0000:00:0d.0
[    1.121919] hub 1-0:1.0: USB hub found
[    1.121926] hub 1-0:1.0: 1 port detected
[    1.122189] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.122307] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.122309] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    1.122310] xhci_hcd 0000:00:0d.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.122339] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.14
[    1.122341] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.122342] usb usb2: Product: xHCI Host Controller
[    1.122343] usb usb2: Manufacturer: Linux 5.14.0-rc7-1-mainline xhci-hcd
[    1.122344] usb usb2: SerialNumber: 0000:00:0d.0
[    1.122408] hub 2-0:1.0: USB hub found
[    1.122417] hub 2-0:1.0: 4 ports detected
[    1.122997] usb: port power management may be unreliable
[    1.123215] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.123217] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.124365] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000000009810
[    1.124549] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.14
[    1.124550] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.124551] usb usb3: Product: xHCI Host Controller
[    1.124551] usb usb3: Manufacturer: Linux 5.14.0-rc7-1-mainline xhci-hcd
[    1.124552] usb usb3: SerialNumber: 0000:00:14.0
[    1.124601] hub 3-0:1.0: USB hub found
[    1.124637] hub 3-0:1.0: 12 ports detected
[    1.125241] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.125243] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    1.125245] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.125309] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.14
[    1.125310] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.125312] usb usb4: Product: xHCI Host Controller
[    1.125313] usb usb4: Manufacturer: Linux 5.14.0-rc7-1-mainline xhci-hcd
[    1.125314] usb usb4: SerialNumber: 0000:00:14.0
[    1.125366] hub 4-0:1.0: USB hub found
[    1.125395] hub 4-0:1.0: 4 ports detected
[    1.134517] raid6: skip pq benchmark and using algorithm avx512x4
[    1.134519] raid6: using avx512x2 recovery algorithm
[    1.135141] xor: automatically using best checksumming function   avx       
[    1.143026] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[    1.162899] Btrfs loaded, crc32c=crc32c-intel, zoned=yes
[    1.163557] BTRFS: device fsid 277b7825-1fdc-4d13-831b-600e092f1743 devid 1 transid 7794 /dev/nvme0n1p3 scanned by systemd-udevd (179)
[    1.180700] PM: Image not found (code -22)
[    1.188982] BTRFS info (device nvme0n1p3): disk space caching is enabled
[    1.188985] BTRFS info (device nvme0n1p3): has skinny extents
[    1.200958] random: fast init done
[    1.207540] BTRFS info (device nvme0n1p3): enabling ssd optimizations
[    1.279640] systemd[1]: systemd 249.3-1-arch running in system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
[    1.295763] systemd[1]: Detected architecture x86-64.
[    1.296149] systemd[1]: Hostname set to <lenovo-ulrich>.
[    1.340260] random: lvmconfig: uninitialized urandom read (4 bytes read)
[    1.375608] usb 3-5: new full-speed USB device number 2 using xhci_hcd
[    1.380841] systemd[1]: Queued start job for default target Graphical Interface.
[    1.381615] systemd[1]: Created slice Slice /system/getty.
[    1.381752] systemd[1]: Created slice Slice /system/modprobe.
[    1.381870] systemd[1]: Created slice Slice /system/systemd-fsck.
[    1.381939] systemd[1]: Created slice User and Session Slice.
[    1.381968] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    1.381985] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    1.382059] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    1.382075] systemd[1]: Reached target Local Encrypted Volumes.
[    1.382082] systemd[1]: Reached target Login Prompts.
[    1.382096] systemd[1]: Reached target Remote File Systems.
[    1.382101] systemd[1]: Reached target Slice Units.
[    1.382113] systemd[1]: Reached target Local Verity Integrity Protected Volumes.
[    1.382144] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    1.382627] systemd[1]: Listening on LVM2 poll daemon socket.
[    1.383094] systemd[1]: Listening on Process Core Dump Socket.
[    1.383313] systemd[1]: Listening on Journal Audit Socket.
[    1.383352] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.383386] systemd[1]: Listening on Journal Socket.
[    1.384191] systemd[1]: Listening on udev Control Socket.
[    1.384223] systemd[1]: Listening on udev Kernel Socket.
[    1.384555] systemd[1]: Mounting Huge Pages File System...
[    1.384915] systemd[1]: Mounting POSIX Message Queue File System...
[    1.385223] systemd[1]: Mounting Kernel Debug File System...
[    1.385526] systemd[1]: Mounting Kernel Trace File System...
[    1.386103] systemd[1]: Starting Create List of Static Device Nodes...
[    1.386502] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    1.386857] systemd[1]: Starting Load Kernel Module configfs...
[    1.387249] systemd[1]: Starting Load Kernel Module drm...
[    1.387684] systemd[1]: Starting Load Kernel Module fuse...
[    1.387823] random: lvm: uninitialized urandom read (4 bytes read)
[    1.387944] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    1.388643] systemd[1]: Starting Journal Service...
[    1.389202] systemd[1]: Starting Load Kernel Modules...
[    1.389654] systemd[1]: Starting Remount Root and Kernel File Systems...
[    1.389696] systemd[1]: Condition check resulted in Repartition Root Disk being skipped.
[    1.390136] systemd[1]: Starting Coldplug All udev Devices...
[    1.391044] systemd[1]: Mounted Huge Pages File System.
[    1.391100] systemd[1]: Mounted POSIX Message Queue File System.
[    1.391140] systemd[1]: Mounted Kernel Debug File System.
[    1.391183] systemd[1]: Mounted Kernel Trace File System.
[    1.391354] systemd[1]: Finished Create List of Static Device Nodes.
[    1.391505] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    1.391618] systemd[1]: Finished Load Kernel Module configfs.
[    1.392109] systemd[1]: Mounting Kernel Configuration File System...
[    1.392962] fuse: init (API version 7.34)
[    1.393510] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    1.393648] systemd[1]: Finished Load Kernel Module fuse.
[    1.393678] audit: type=1130 audit(1629724723.959:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.393695] audit: type=1131 audit(1629724723.959:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.393752] systemd[1]: Mounted Kernel Configuration File System.
[    1.394231] systemd[1]: Mounting FUSE Control File System...
[    1.395185] systemd[1]: Mounted FUSE Control File System.
[    1.395192] Asymmetric key parser 'pkcs8' registered
[    1.395647] systemd[1]: Finished Load Kernel Modules.
[    1.395678] audit: type=1130 audit(1629724723.963:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.396200] systemd[1]: Starting Apply Kernel Variables...
[    1.398473] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    1.398610] systemd[1]: Finished Load Kernel Module drm.
[    1.398643] audit: type=1130 audit(1629724723.963:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.398646] audit: type=1131 audit(1629724723.963:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.402495] systemd[1]: Finished Apply Kernel Variables.
[    1.402522] audit: type=1130 audit(1629724723.969:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.403748] systemd[1]: Starting CLI Netfilter Manager...
[    1.406504] BTRFS info (device nvme0n1p3): disk space caching is enabled
[    1.407069] systemd[1]: Finished Remount Root and Kernel File Systems.
[    1.407108] audit: type=1130 audit(1629724723.973:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.407166] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[    1.407481] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[    1.408000] systemd[1]: Starting Load/Save Random Seed...
[    1.408503] systemd[1]: Starting Create System Users...
[    1.410701] systemd[1]: Started Journal Service.
[    1.410743] audit: type=1130 audit(1629724723.976:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.412284] audit: type=1325 audit(1629724723.976:10): table=filter family=2 entries=0 op=xt_register pid=269 comm="modprobe"
[    1.413453] systemd-journald[251]: Received client request to flush runtime journal.
[    1.523031] usb 3-5: not running at top speed; connect to a high speed hub
[    1.526312] usb 3-5: New USB device found, idVendor=0bda, idProduct=5812, bcdDevice= 5.02
[    1.526314] usb 3-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.526315] usb 3-5: Product: Realtek USB2.0 Finger Print Bridge
[    1.526316] usb 3-5: Manufacturer: Generic
[    1.526317] usb 3-5: SerialNumber: 201801010001
[    1.586689] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586720] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586747] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586771] acpi PNP0C14:04: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586800] acpi PNP0C14:05: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586853] acpi PNP0C14:06: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586886] acpi PNP0C14:07: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.586924] acpi PNP0C14:08: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    1.652216] usb 3-6: new high-speed USB device number 3 using xhci_hcd
[    1.684643] input: Ideapad extra buttons as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input3
[    1.684672] ideapad_acpi VPC2004:00: Keyboard backlight control not available
[    1.838940] usb 3-6: New USB device found, idVendor=04f2, idProduct=b61e, bcdDevice= 4.25
[    1.838944] usb 3-6: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.838945] usb 3-6: Product: Integrated Camera
[    1.838947] usb 3-6: Manufacturer: Chicony Electronics Co.,Ltd.
[    1.838948] usb 3-6: SerialNumber: 0001
[    1.839389] EDAC igen6: v2.5
[    1.843725] Linux agpgart interface v0.103
[    1.846843] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    1.847512] intel_rapl_common: Found RAPL domain package
[    1.869792] Adding 20971516k swap on /dev/nvme0n1p2.  Priority:-2 extents:1 across:20971516k SSFS
[    1.919793] random: mktemp: uninitialized urandom read (6 bytes read)
[    1.933788] intel-pmt 0000:00:0a.0: Watcher not supported
[    1.933793] intel-pmt 0000:00:0a.0: Crashlog not supported
[    1.969083] usb 3-10: new full-speed USB device number 4 using xhci_hcd
[    1.975639] ACPI: bus type thunderbolt registered
[    1.976290] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.976293] checking generic (4000000000 7f0000) vs hw (607c000000 1000000)
[    1.976294] checking generic (4000000000 7f0000) vs hw (4000000000 10000000)
[    1.976295] fb0: switching to inteldrmfb from EFI VGA
[    1.976360] Console: switching to colour dummy device 80x25
[    1.976379] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.978401] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.979882] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_08.bin (v2.8)
[    2.112071] NET: Registered PF_ALG protocol family
[    2.112567] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    2.112665] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    2.114317] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.117228] usb 3-10: New USB device found, idVendor=8087, idProduct=0026, bcdDevice= 0.02
[    2.117231] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.118276] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 0
[    2.123346] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    2.123351] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.123949] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
[    2.126649] fbcon: i915 (fb0) is primary device
[    2.126986] intel-lpss 0000:00:15.2: enabling device (0000 -> 0002)
[    2.127285] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    2.133491] Console: switching to colour frame buffer device 240x67
[    2.137702] intel-lpss 0000:00:15.3: enabling device (0000 -> 0002)
[    2.137997] idma64 idma64.3: Found Intel integrated DMA 64-bit
[    2.154093] i915 0000:00:02.0: [drm] fb0: i915 frame buffer device
[    2.183020] Intel(R) Wireless WiFi driver for Linux
[    2.183112] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    2.185850] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.185982] iwlwifi 0000:00:14.3: Direct firmware load for iwlwifi-QuZ-a0-hr-b0-64.ucode failed with error -2
[    2.187787] iwlwifi 0000:00:14.3: api flags index 2 larger than supported by driver
[    2.187799] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 89.3.35.37
[    2.188009] iwlwifi 0000:00:14.3: loaded firmware version 63.c04f3485.0 QuZ-a0-hr-b0-63.ucode op_mode iwlmvm
[    2.285899] input: MSFT0001:01 06CB:CE37 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-15/i2c-MSFT0001:01/0018:06CB:CE37.0001/input/input5
[    2.285952] input: MSFT0001:01 06CB:CE37 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-15/i2c-MSFT0001:01/0018:06CB:CE37.0001/input/input6
[    2.286016] hid-generic 0018:06CB:CE37.0001: input,hidraw0: I2C HID v1.00 Mouse [MSFT0001:01 06CB:CE37] on i2c-MSFT0001:01
[    2.290412] input: WACF2200:00 056A:523C Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input8
[    2.290446] input: WACF2200:00 056A:523C as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input9
[    2.290470] input: WACF2200:00 056A:523C as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input10
[    2.290487] input: WACF2200:00 056A:523C as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input11
[    2.290504] input: WACF2200:00 056A:523C Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input12
[    2.290523] hid-generic 0018:056A:523C.0002: input,hidraw1: I2C HID v1.00 Mouse [WACF2200:00 056A:523C] on i2c-WACF2200:00
[    2.299724] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[    2.299924] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.300038] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.300772] i2c i2c-18: 8/8 memory slots populated (from DMI)
[    2.300773] i2c i2c-18: Systems with more than 4 memory slots not supported yet, not instantiating SPD
[    2.304480] input: PC Speaker as /devices/platform/pcspkr/input/input13
[    2.306296] intel-spi 0000:00:1f.5: mx25l25635e (32768 Kbytes)
[    2.307507] Creating 1 MTD partitions on "0000:00:1f.5":
[    2.307509] 0x000000000000-0x000002000000 : "BIOS"
[    2.307980] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
[    2.308001] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    2.313628] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6 AX201 160MHz, REV=0x354
[    2.326168] thermal thermal_zone7: failed to read out thermal zone (-61)
[    2.382724] cryptd: max_cpu_qlen set to 1000
[    2.383369] resource sanity check: requesting [mem 0xfedc0000-0xfedcdfff], which spans more than pnp 00:04 [mem 0xfedc0000-0xfedc7fff]
[    2.383373] caller tgl_uncore_imc_freerunning_init_box+0xbf/0x100 [intel_uncore] mapping multiple BARs
[    2.391524] AVX2 version of gcm_enc/dec engaged.
[    2.391552] AES CTR mode by8 optimization enabled
[    2.435846] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=0x10a100
[    2.468889] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
[    2.469146] sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    2.469173] sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002)
[    2.469539] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[    2.469612] sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    2.476533] sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode
[    2.501379] iwlwifi 0000:00:14.3: base HW address: 18:cc:18:fd:cb:4a
[    2.516183] ------------[ cut here ]------------
[    2.516186] WARNING: CPU: 0 PID: 440 at net/wireless/nl80211.c:7771 nl80211_get_reg_do+0x23c/0x2b0 [cfg80211]
[    2.516226] Modules linked in: snd_sof_pci_intel_tgl snd_sof_intel_hda_common kvm_intel soundwire_intel soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp kvm snd_sof irqbypass snd_soc_hdac_hda crct10dif_pclmul snd_hda_ext_core crc32_pclmul snd_soc_acpi_intel_match snd_soc_acpi aesni_intel soundwire_bus crypto_simd ledtrig_audio ghash_generic gf128mul intel_cstate ghash_clmulni_intel intel_uncore snd_soc_core cryptd gcm snd_compress iwlmvm ac97_bus snd_pcm_dmaengine ccm snd_hda_intel algif_aead intel_spi_pci snd_intel_dspcfg intel_spi snd_intel_sdw_acpi spi_nor pcspkr des_generic i2c_i801 mac80211 mtd i2c_smbus libdes snd_hda_codec cbc snd_hda_core snd_hwdep ecb snd_pcm libarc4 algif_skcipher snd_timer mei_me snd mei soundcore iwlwifi cmac md4 algif_hash coretemp intel_lpss_pci af_alg intel_lpss idma64 cfg80211 intel_ish_ipc(+) intel_ishtp thunderbolt(+) vfat intel_pmt fat i915 i2c_algo_bit ttm drm_kms_helper
[    2.516281]  processor_thermal_device_pci_legacy cec processor_thermal_device processor_thermal_rfim intel_gtt processor_thermal_mbox processor_thermal_rapl agpgart ucsi_acpi intel_rapl_common typec_ucsi syscopyarea intel_soc_dts_iosf sysfillrect typec sysimgblt igen6_edac fb_sys_fops roles i2c_hid_acpi ideapad_laptop i2c_hid platform_profile sparse_keymap rfkill wmi int3403_thermal tpm_crb int340x_thermal_zone video tpm_tis tpm_tis_core tpm int3400_thermal acpi_thermal_rel rng_core mac_hid acpi_tad acpi_pad xt_hl ip6t_rt xt_LOG nf_log_syslog xt_limit xt_addrtype xt_tcpudp xt_conntrack ip6table_filter ip6_tables nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat nf_conntrack_ftp nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter drm pkcs8_key_parser crypto_user fuse bpf_preload ip_tables x_tables btrfs blake2b_generic libcrc32c crc32c_generic xor raid6_pq serio_raw atkbd libps2 crc32c_intel i8042 xhci_pci xhci_pci_renesas serio
[    2.516322] CPU: 0 PID: 440 Comm: iwd Not tainted 5.14.0-rc7-1-mainline #1
[    2.516324] Hardware name: LENOVO 82BG/LNVNB161216, BIOS EHCN40WW 01/28/2021
[    2.516325] RIP: 0010:nl80211_get_reg_do+0x23c/0x2b0 [cfg80211]
[    2.516347] Code: 0c 01 00 00 00 e8 b4 1d 89 f6 85 c0 74 cc e9 f5 fe ff ff 48 89 ef 48 89 04 24 e8 0f e3 bc f6 e8 1a 9c bf f6 48 8b 04 24 eb 84 <0f> 0b 48 89 ef e8 fa e2 bc f6 e8 05 9c bf f6 b8 ea ff ff ff e9 6b
[    2.516349] RSP: 0018:ffffbb2000dc3b48 EFLAGS: 00010202
[    2.516351] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[    2.516352] RDX: ffff912657950008 RSI: 0000000000000000 RDI: ffff9126579502e0
[    2.516353] RBP: ffff912645b56c00 R08: 0000000000000004 R09: ffff912654934014
[    2.516354] R10: 0000000000000021 R11: ffff91264e730000 R12: ffffbb2000dc3ba8
[    2.516355] R13: ffff912654934014 R14: 0000000000000000 R15: ffff9126579502e0
[    2.516356] FS:  00007f62be117740(0000) GS:ffff9129dfc00000(0000) knlGS:0000000000000000
[    2.516357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.516358] CR2: 00007f62be094a20 CR3: 000000010721a001 CR4: 0000000000770ef0
[    2.516359] PKRU: 55555554
[    2.516360] Call Trace:
[    2.516364]  genl_family_rcv_msg_doit+0xfa/0x160
[    2.516370]  genl_rcv_msg+0xeb/0x1e0
[    2.516372]  ? __cfg80211_rdev_from_attrs+0x1d0/0x1d0 [cfg80211]
[    2.516393]  ? nl80211_send_regdom.constprop.0+0x1b0/0x1b0 [cfg80211]
[    2.516414]  ? genl_get_cmd+0xd0/0xd0
[    2.516416]  netlink_rcv_skb+0x59/0x100
[    2.516419]  genl_rcv+0x24/0x40
[    2.516421]  netlink_unicast+0x23b/0x350
[    2.516423]  netlink_sendmsg+0x23b/0x480
[    2.516425]  sock_sendmsg+0x5b/0x60
[    2.516428]  __sys_sendto+0x124/0x190
[    2.516431]  __x64_sys_sendto+0x20/0x30
[    2.516433]  do_syscall_64+0x38/0x90
[    2.516435]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    2.516438] RIP: 0033:0x7f62be219c10
[    2.516440] Code: c0 ff ff ff ff eb b8 0f 1f 00 f3 0f 1e fa 41 89 ca 64 8b 04 25 18 00 00 00 85 c0 75 1d 45 31 c9 45 31 c0 b8 2c 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 68 c3 0f 1f 80 00 00 00 00 55 48 83 ec 20 48
[    2.516441] RSP: 002b:00007ffedd3d5128 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
[    2.516443] RAX: ffffffffffffffda RBX: 000055b7762c3870 RCX: 00007f62be219c10
[    2.516444] RDX: 000000000000001c RSI: 000055b7762da320 RDI: 0000000000000004
[    2.516444] RBP: 000055b7762d5c10 R08: 0000000000000000 R09: 0000000000000000
[    2.516445] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffedd3d5190
[    2.516446] R13: 00007ffedd3d518c R14: 000055b7762cd500 R15: 000055b774a11401
[    2.516448] ---[ end trace e2859b3bb57348cb ]---
[    2.528233] intel_tcc_cooling: Programmable TCC Offset detected
[    2.531994] 8021q: 802.1Q VLAN Support v1.8
[    2.536413] sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 5
[    2.536416] sof-audio-pci-intel-tgl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[    2.536421] sof-audio-pci-intel-tgl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[    2.538136] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 1:8:0-9e7a8
[    2.538138] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:18:1 Kernel ABI 3:18:0
[    2.538142] sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30
[    2.585841] intel_rapl_msr: PL4 support detected.
[    2.585871] intel_rapl_common: Found RAPL domain package
[    2.585873] intel_rapl_common: Found RAPL domain core
[    2.585874] intel_rapl_common: Found RAPL domain uncore
[    2.585875] intel_rapl_common: Found RAPL domain psys
[    2.625902] iTCO_vendor_support: vendor-support=0
[    2.626258] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[    2.626897] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 1:8:0-9e7a8
[    2.626899] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:18:1 Kernel ABI 3:18:0
[    2.653240] usbcore: registered new interface driver usbhid
[    2.653244] usbhid: USB HID core driver
[    2.705074] input: MSFT0001:01 06CB:CE37 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-15/i2c-MSFT0001:01/0018:06CB:CE37.0001/input/input14
[    2.705131] input: MSFT0001:01 06CB:CE37 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-15/i2c-MSFT0001:01/0018:06CB:CE37.0001/input/input15
[    2.705184] hid-multitouch 0018:06CB:CE37.0001: input,hidraw0: I2C HID v1.00 Mouse [MSFT0001:01 06CB:CE37] on i2c-MSFT0001:01
[    2.719252] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[    2.719427] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    2.752573] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[    2.762772] sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:18:1 Kernel ABI 3:18:0
[    2.762902] hid-generic 001F:8087:0AC2.0003: hidraw2: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.766397] mousedev: PS/2 mouse device common for all mice
[    2.769142] hid-generic 001F:8087:0AC2.0004: hidraw3: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.787648] sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: Parent card not yet available, widget card binding deferred
[    2.819944] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC287: line_outs=2 (0x17/0x14/0x0/0x0/0x0) type:speaker
[    2.819950] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    2.819952] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    2.819953] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
[    2.819954] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    2.819954] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
[    2.911273] hid-sensor-hub 001F:8087:0AC2.0003: hid_field_extract() called with n (192) > 32! (kworker/6:3)
[    2.913437] input: Wacom HID 523C Pen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input17
[    2.913602] input: Wacom HID 523C Finger as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-14/i2c-WACF2200:00/0018:056A:523C.0002/input/input18
[    2.913679] wacom 0018:056A:523C.0002: hidraw1: I2C HID v1.00 Mouse [WACF2200:00 056A:523C] on i2c-WACF2200:00
[    2.915828] snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
[    2.915836] snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
[    2.916006] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
[    2.916012] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
[    2.916018] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
[    2.916023] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
[    2.916027] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
[    2.916034] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
[    2.916041] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
[    2.916048] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
[    2.916057] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
[    2.916063] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
[    2.916070] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten
[    2.916083] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3

[    2.916085] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 4

[    2.916088] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 5

[    2.916090] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 6

[    2.916092] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 7

[    2.916095] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 8

[    2.937234] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input20
[    2.937289] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input21
[    2.937340] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input22
[    2.937380] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input23
[    2.937414] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input24
[    2.982222] random: crng init done
[    2.982226] random: 7 urandom warning(s) missed due to ratelimiting
[    3.082387] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[    3.085834] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[    3.100364] mc: Linux media interface: v0.10
[    3.108731] videodev: Linux video capture interface: v2.00
[    3.112184] wlan0: authenticated
[    3.115547] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[    3.135190] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[    3.140262] wlan0: associated
[    3.155913] usb 3-6: Found UVC 1.00 device Integrated Camera (04f2:b61e)
[    3.165078] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb3/3-6/3-6:1.0/input/input25
[    3.165141] usbcore: registered new interface driver uvcvideo
[    3.174453] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[    3.188055] Bluetooth: Core ver 2.22
[    3.188087] NET: Registered PF_BLUETOOTH protocol family
[    3.188089] Bluetooth: HCI device and connection manager initialized
[    3.188093] Bluetooth: HCI socket layer initialized
[    3.188095] Bluetooth: L2CAP socket layer initialized
[    3.188100] Bluetooth: SCO socket layer initialized
[    3.197618] usbcore: registered new interface driver btusb
[    3.198751] Bluetooth: hci0: Bootloader revision 0.4 build 0 week 30 2018
[    3.199777] Bluetooth: hci0: Device revision is 2
[    3.199780] Bluetooth: hci0: Secure boot is enabled
[    3.199782] Bluetooth: hci0: OTP lock is enabled
[    3.199783] Bluetooth: hci0: API lock is enabled
[    3.199784] Bluetooth: hci0: Debug lock is disabled
[    3.199785] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    3.201211] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[    3.702038] nf_conntrack: default automatic helper assignment has been turned off for security reasons and CT-based firewall rule not found. Use the iptables CT target to attach helpers instead.
[    5.093842] Bluetooth: hci0: Waiting for firmware download to complete
[    5.094713] Bluetooth: hci0: Firmware loaded in 1849132 usecs
[    5.094829] Bluetooth: hci0: Waiting for device to boot
[    5.109751] Bluetooth: hci0: Device booted in 14667 usecs
[    5.109812] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
[    5.111770] Bluetooth: hci0: Applying Intel DDC parameters completed
[    5.114774] Bluetooth: hci0: Firmware revision 0.0 build 191 week 21 2021
[    5.174745] Bluetooth: hci0: MSFT filter_enable is already on
[    8.208121] kauditd_printk_skb: 131 callbacks suppressed
[    8.208127] audit: type=1131 audit(1629724730.772:94): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.403221] audit: type=1100 audit(1629724734.054:95): pid=1260 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:authentication grantors=pam_shells,pam_faillock,pam_permit,pam_faillock acct="ulrich" exe="/usr/lib/sddm/sddm-helper" hostname=? addr=? terminal=? res=success'
[   11.404370] audit: type=1101 audit(1629724734.057:96): pid=1260 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/lib/sddm/sddm-helper" hostname=? addr=? terminal=? res=success'
[   11.404665] audit: type=1103 audit(1629724734.057:97): pid=1260 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=pam_shells,pam_faillock,pam_permit,pam_faillock acct="ulrich" exe="/usr/lib/sddm/sddm-helper" hostname=? addr=? terminal=? res=success'
[   11.404751] audit: type=1006 audit(1629724734.057:98): pid=1260 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[   11.404755] audit: type=1300 audit(1629724734.057:98): arch=c000003e syscall=1 success=yes exit=4 a0=8 a1=7ffdffd027b0 a2=4 a3=3e8 items=0 ppid=900 pid=1260 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=2 comm="sddm-helper" exe="/usr/lib/sddm/sddm-helper" key=(null)
[   11.404757] audit: type=1327 audit(1629724734.057:98): proctitle=2F7573722F6C69622F7364646D2F7364646D2D68656C706572002D2D736F636B6574002F746D702F7364646D2D6175746861383435373463312D363963332D343232332D626366352D346364393439303538303039002D2D69640031002D2D7374617274002F7573722F6C69622F706C61736D612D646275732D72756E2D7365
[   11.413525] audit: type=1130 audit(1629724734.064:99): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.417602] audit: type=1101 audit(1629724734.068:100): pid=1262 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.417624] audit: type=1103 audit(1629724734.068:101): pid=1262 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=? acct="ulrich" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
[   13.294391] kauditd_printk_skb: 16 callbacks suppressed
[   13.294394] audit: type=1130 audit(1629724736.026:114): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=packagekit comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   13.733959] audit: type=1130 audit(1629724736.466:115): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=rtkit-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   15.856954] audit: type=1131 audit(1629724738.589:116): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   21.627389] audit: type=1131 audit(1629724744.359:117): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   21.633870] audit: type=1131 audit(1629724744.366:118): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   32.336935] audit: type=1131 audit(1629724755.070:119): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   32.481288] audit: type=1334 audit(1629724755.216:120): prog-id=24 op=UNLOAD
[   32.481298] audit: type=1334 audit(1629724755.216:121): prog-id=23 op=UNLOAD
[   32.481301] audit: type=1334 audit(1629724755.216:122): prog-id=22 op=UNLOAD
[   33.445023] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=838 DF PROTO=2 
[   34.897280] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[   42.115312] audit: type=1131 audit(1629724764.850:123): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-localed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   42.271117] audit: type=1334 audit(1629724765.006:124): prog-id=31 op=UNLOAD
[   42.271128] audit: type=1334 audit(1629724765.006:125): prog-id=30 op=UNLOAD
[   42.271134] audit: type=1334 audit(1629724765.006:126): prog-id=29 op=UNLOAD
[   54.548770] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[   54.601070] audit: type=1130 audit(1629724777.336:127): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   54.913419] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[   54.917099] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[   54.919705] wlan0: authenticated
[   54.924172] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[   54.928430] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[   54.931998] wlan0: associated
[   54.939769] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   66.017573] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[   66.381973] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[   66.385923] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[   66.400890] wlan0: authenticated
[   66.407391] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[   66.411632] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[   66.417807] wlan0: associated
[   66.426481] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   67.285027] iwlwifi 0000:00:14.3: No beacon heard and the session protection is over already...
[   67.285116] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[   67.541085] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[   67.544686] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[   67.547360] wlan0: authenticated
[   67.550678] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[   67.554953] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[   67.558169] wlan0: associated
[   67.567748] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   69.601190] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[   69.942259] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[   69.946027] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[   69.948668] wlan0: authenticated
[   69.950695] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[   69.957218] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[   69.960680] wlan0: associated
[   69.969263] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   70.845083] iwlwifi 0000:00:14.3: No beacon heard and the session protection is over already...
[   70.845100] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[   71.063454] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[   71.067018] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[   71.069602] wlan0: authenticated
[   71.070621] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[   71.074884] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[   71.079908] wlan0: associated
[   71.088533] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[   83.852207] audit: type=1131 audit(1629724806.587:128): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  160.247523] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=3359 DF PROTO=2 
[  283.444054] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=9987 DF PROTO=2 
[  371.963131] audit: type=1130 audit(1629725094.699:129): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  371.964089] wlan0: deauthenticating from 1c:5f:2b:ad:70:e9 by local choice (Reason: 3=DEAUTH_LEAVING)
[  372.313834] PM: hibernation: hibernation entry
[  372.325827] Filesystems sync: 0.011 seconds
[  372.325831] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  372.327371] OOM killer disabled.
[  372.327482] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  372.327485] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  372.327487] PM: hibernation: Marking nosave pages: [mem 0x32646000-0x32739fff]
[  372.327491] PM: hibernation: Marking nosave pages: [mem 0x3303f000-0x3303ffff]
[  372.327492] PM: hibernation: Marking nosave pages: [mem 0x36001000-0x45bfefff]
[  372.327933] PM: hibernation: Marking nosave pages: [mem 0x45c00000-0xffffffff]
[  372.329934] PM: hibernation: Basic memory bitmaps created
[  372.331244] PM: hibernation: Preallocating image memory
[  372.978319] PM: hibernation: Allocated 1012949 pages for snapshot
[  372.978324] PM: hibernation: Allocated 4051796 kbytes in 0.64 seconds (6330.93 MB/s)
[  372.978326] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  372.979785] printk: Suspending console(s) (use no_console_suspend to debug)
[  373.506850] ACPI: EC: interrupt blocked
[  373.511857] ACPI: PM: Preparing to enter system sleep state S4
[  373.525275] ACPI: EC: event blocked
[  373.525275] ACPI: EC: EC stopped
[  373.525276] ACPI: PM: Saving platform NVS memory
[  373.532513] Disabling non-boot CPUs ...
[  373.533113] IRQ 163: no longer affine to CPU1
[  373.534132] smpboot: CPU 1 is now offline
[  373.535254] IRQ 164: no longer affine to CPU2
[  373.536283] smpboot: CPU 2 is now offline
[  373.537387] IRQ 165: no longer affine to CPU3
[  373.538416] smpboot: CPU 3 is now offline
[  373.539770] IRQ 166: no longer affine to CPU4
[  373.540795] smpboot: CPU 4 is now offline
[  373.542700] IRQ 167: no longer affine to CPU5
[  373.543725] smpboot: CPU 5 is now offline
[  373.544610] IRQ 168: no longer affine to CPU6
[  373.545652] smpboot: CPU 6 is now offline
[  373.546522] IRQ 169: no longer affine to CPU7
[  373.547558] smpboot: CPU 7 is now offline
[  373.553592] PM: hibernation: Creating image:
[  373.789835] PM: hibernation: Need to copy 996415 pages
[  373.789838] PM: hibernation: Normal pages needed: 996415 + 1024, available pages: 3089709
[  373.553934] ACPI: PM: Restoring platform NVS memory
[  373.555430] ACPI: EC: EC started
[  373.557196] Enabling non-boot CPUs ...
[  373.557240] x86: Booting SMP configuration:
[  373.557240] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  373.558310] CPU1 is up
[  373.558353] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  373.559584] CPU2 is up
[  373.559628] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  373.560947] CPU3 is up
[  373.560981] smpboot: Booting Node 0 Processor 4 APIC 0x1
[  373.562266] CPU4 is up
[  373.562311] smpboot: Booting Node 0 Processor 5 APIC 0x3
[  373.563489] CPU5 is up
[  373.563544] smpboot: Booting Node 0 Processor 6 APIC 0x5
[  373.564886] CPU6 is up
[  373.564932] smpboot: Booting Node 0 Processor 7 APIC 0x7
[  373.566345] CPU7 is up
[  373.572439] ACPI: PM: Waking up from system sleep state S4
[  373.582286] ACPI: EC: interrupt unblocked
[  373.723136] ACPI: EC: event unblocked
[  373.723430] usb usb1: root hub lost power or was reset
[  373.723433] usb usb2: root hub lost power or was reset
[  373.723507] usb usb3: root hub lost power or was reset
[  373.723509] usb usb4: root hub lost power or was reset
[  373.732156] nvme nvme0: 8/0/0 default/read/poll queues
[  374.126963] usb 3-6: reset high-speed USB device number 3 using xhci_hcd
[  374.294858] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[  374.390437] usb 3-5: reset full-speed USB device number 2 using xhci_hcd
[  374.653747] usb 3-10: reset full-speed USB device number 4 using xhci_hcd
[  374.805788] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[  374.806863] PM: hibernation: Basic memory bitmaps freed
[  374.806871] OOM killer enabled.
[  374.806872] Restarting tasks ... 
[  374.807242] Bluetooth: hci0: Bootloader revision 0.4 build 0 week 30 2018
[  374.808099] Bluetooth: hci0: Device revision is 2
[  374.808104] Bluetooth: hci0: Secure boot is enabled
[  374.808106] Bluetooth: hci0: OTP lock is enabled
[  374.808108] Bluetooth: hci0: API lock is enabled
[  374.808109] Bluetooth: hci0: Debug lock is disabled
[  374.808111] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[  374.808119] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[  374.809048] done.
[  374.822489] thermal thermal_zone7: failed to read out thermal zone (-61)
[  374.830795] audit: type=1130 audit(1629725192.270:130): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  374.866481] PM: hibernation: hibernation exit
[  375.040177] audit: type=1130 audit(1629725192.480:131): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  375.040183] audit: type=1131 audit(1629725192.480:132): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  375.563204] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[  375.565277] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[  375.591402] wlan0: authenticated
[  375.593405] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[  375.599385] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[  375.603933] wlan0: associated
[  375.666378] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[  376.757752] Bluetooth: hci0: Waiting for firmware download to complete
[  376.758072] Bluetooth: hci0: Firmware loaded in 1904265 usecs
[  376.758205] Bluetooth: hci0: Waiting for device to boot
[  376.773273] Bluetooth: hci0: Device booted in 14838 usecs
[  376.773283] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
[  376.775153] Bluetooth: hci0: Applying Intel DDC parameters completed
[  376.778176] Bluetooth: hci0: Firmware revision 0.0 build 191 week 21 2021
[  376.838091] Bluetooth: hci0: MSFT filter_enable is already on
[  377.143512] hid-sensor-hub 001F:8087:0AC2.0003: timeout waiting for response from ISHTP device
[  379.829787] audit: type=1131 audit(1629725197.277:133): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  380.357302] audit: type=1100 audit(1629725197.835:134): pid=2496 uid=1000 auid=1000 ses=2 msg='op=PAM:unix_chkpwd acct="ulrich" exe="/usr/bin/unix_chkpwd" hostname=? addr=? terminal=? res=success'
[  387.321240] audit: type=1131 audit(1629725205.379:135): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  398.040514] audit: type=1130 audit(1629725216.142:136): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  398.041620] wlan0: deauthenticating from 1c:5f:2b:ad:70:e9 by local choice (Reason: 3=DEAUTH_LEAVING)
[  399.890336] PM: hibernation: hibernation entry
[  399.911272] Filesystems sync: 0.020 seconds
[  399.911277] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  399.913020] OOM killer disabled.
[  399.913166] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  399.913170] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  399.913173] PM: hibernation: Marking nosave pages: [mem 0x32646000-0x32739fff]
[  399.913179] PM: hibernation: Marking nosave pages: [mem 0x3303f000-0x3303ffff]
[  399.913180] PM: hibernation: Marking nosave pages: [mem 0x36001000-0x45bfefff]
[  399.913880] PM: hibernation: Marking nosave pages: [mem 0x45c00000-0xffffffff]
[  399.917019] PM: hibernation: Basic memory bitmaps created
[  399.918324] PM: hibernation: Preallocating image memory
[  400.571933] PM: hibernation: Allocated 1031557 pages for snapshot
[  400.571936] PM: hibernation: Allocated 4126228 kbytes in 0.65 seconds (6348.04 MB/s)
[  400.571939] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  400.573396] printk: Suspending console(s) (use no_console_suspend to debug)
[  401.090717] ACPI: EC: interrupt blocked
[  401.095496] ACPI: PM: Preparing to enter system sleep state S4
[  401.107730] ACPI: EC: event blocked
[  401.107731] ACPI: EC: EC stopped
[  401.107731] ACPI: PM: Saving platform NVS memory
[  401.115017] Disabling non-boot CPUs ...
[  401.116650] smpboot: CPU 1 is now offline
[  401.119246] smpboot: CPU 2 is now offline
[  401.121222] smpboot: CPU 3 is now offline
[  401.123307] smpboot: CPU 4 is now offline
[  401.126087] smpboot: CPU 5 is now offline
[  401.127890] smpboot: CPU 6 is now offline
[  401.129729] smpboot: CPU 7 is now offline
[  401.135649] PM: hibernation: Creating image:
[  401.331066] PM: hibernation: Need to copy 1017921 pages
[  401.331070] PM: hibernation: Normal pages needed: 1017921 + 1024, available pages: 3068211
[  401.135999] ACPI: PM: Restoring platform NVS memory
[  401.137471] ACPI: EC: EC started
[  401.139014] Enabling non-boot CPUs ...
[  401.139075] x86: Booting SMP configuration:
[  401.139076] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  401.140247] CPU1 is up
[  401.140292] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  401.141525] CPU2 is up
[  401.141561] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  401.142921] CPU3 is up
[  401.142974] smpboot: Booting Node 0 Processor 4 APIC 0x1
[  401.144266] CPU4 is up
[  401.144307] smpboot: Booting Node 0 Processor 5 APIC 0x3
[  401.145480] CPU5 is up
[  401.145526] smpboot: Booting Node 0 Processor 6 APIC 0x5
[  401.146899] CPU6 is up
[  401.146945] smpboot: Booting Node 0 Processor 7 APIC 0x7
[  401.148382] CPU7 is up
[  401.154379] ACPI: PM: Waking up from system sleep state S4
[  401.164147] ACPI: EC: interrupt unblocked
[  401.258633] ACPI: EC: event unblocked
[  401.258742] usb usb1: root hub lost power or was reset
[  401.258744] usb usb2: root hub lost power or was reset
[  401.258924] usb usb3: root hub lost power or was reset
[  401.258926] usb usb4: root hub lost power or was reset
[  401.267253] nvme nvme0: 8/0/0 default/read/poll queues
[  401.659571] usb 3-10: reset full-speed USB device number 4 using xhci_hcd
[  401.827185] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[  401.922801] usb 3-6: reset high-speed USB device number 3 using xhci_hcd
[  402.186233] usb 3-5: reset full-speed USB device number 2 using xhci_hcd
[  402.339370] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[  402.340182] PM: hibernation: Basic memory bitmaps freed
[  402.340190] OOM killer enabled.
[  402.340191] Restarting tasks ... 
[  402.340728] Bluetooth: hci0: Bootloader revision 0.4 build 0 week 30 2018
[  402.341248] done.
[  402.341648] Bluetooth: hci0: Device revision is 2
[  402.341654] Bluetooth: hci0: Secure boot is enabled
[  402.341657] Bluetooth: hci0: OTP lock is enabled
[  402.341659] Bluetooth: hci0: API lock is enabled
[  402.341660] Bluetooth: hci0: Debug lock is disabled
[  402.341662] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[  402.342077] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[  402.351990] thermal thermal_zone7: failed to read out thermal zone (-61)
[  402.361442] audit: type=1130 audit(1629725248.220:137): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  402.388850] PM: hibernation: hibernation exit
[  402.595706] audit: type=1130 audit(1629725248.453:138): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  402.595713] audit: type=1131 audit(1629725248.453:139): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  403.119221] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[  403.121415] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[  403.147699] wlan0: authenticated
[  403.152530] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[  403.160997] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[  403.167650] wlan0: associated
[  403.226615] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[  404.319095] Bluetooth: hci0: Waiting for firmware download to complete
[  404.319660] Bluetooth: hci0: Firmware loaded in 1931233 usecs
[  404.319837] Bluetooth: hci0: Waiting for device to boot
[  404.334746] Bluetooth: hci0: Device booted in 14676 usecs
[  404.334810] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
[  404.336734] Bluetooth: hci0: Applying Intel DDC parameters completed
[  404.339731] Bluetooth: hci0: Firmware revision 0.0 build 191 week 21 2021
[  404.399761] Bluetooth: hci0: MSFT filter_enable is already on
[  404.649332] hid-sensor-hub 001F:8087:0AC2.0003: timeout waiting for response from ISHTP device
[  407.244980] audit: type=1131 audit(1629725253.226:140): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  410.467417] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=27749 DF PROTO=2 
[  415.766997] audit: type=1131 audit(1629725262.068:141): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  441.984550] audit: type=1100 audit(1629725288.288:142): pid=3074 uid=1000 auid=1000 ses=2 msg='op=PAM:unix_chkpwd acct="ulrich" exe="/usr/bin/unix_chkpwd" hostname=? addr=? terminal=? res=success'
[  450.007535] audit: type=1130 audit(1629725296.312:143): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  450.008598] wlan0: deauthenticating from 1c:5f:2b:ad:70:e9 by local choice (Reason: 3=DEAUTH_LEAVING)
[  451.449672] PM: hibernation: hibernation entry
[  451.468795] Filesystems sync: 0.018 seconds
[  451.468798] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  451.470364] OOM killer disabled.
[  451.470486] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  451.470490] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  451.470492] PM: hibernation: Marking nosave pages: [mem 0x32646000-0x32739fff]
[  451.470497] PM: hibernation: Marking nosave pages: [mem 0x3303f000-0x3303ffff]
[  451.470498] PM: hibernation: Marking nosave pages: [mem 0x36001000-0x45bfefff]
[  451.471564] PM: hibernation: Marking nosave pages: [mem 0x45c00000-0xffffffff]
[  451.474390] PM: hibernation: Basic memory bitmaps created
[  451.475925] PM: hibernation: Preallocating image memory
[  452.167571] PM: hibernation: Allocated 1037638 pages for snapshot
[  452.167576] PM: hibernation: Allocated 4150552 kbytes in 0.69 seconds (6015.29 MB/s)
[  452.167578] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  452.169028] printk: Suspending console(s) (use no_console_suspend to debug)
[  452.711186] ACPI: EC: interrupt blocked
[  452.715971] ACPI: PM: Preparing to enter system sleep state S4
[  452.730428] ACPI: EC: event blocked
[  452.730428] ACPI: EC: EC stopped
[  452.730429] ACPI: PM: Saving platform NVS memory
[  452.737860] Disabling non-boot CPUs ...
[  452.739486] smpboot: CPU 1 is now offline
[  452.742948] smpboot: CPU 2 is now offline
[  452.745099] smpboot: CPU 3 is now offline
[  452.747409] smpboot: CPU 4 is now offline
[  452.749605] smpboot: CPU 5 is now offline
[  452.751448] smpboot: CPU 6 is now offline
[  452.753425] smpboot: CPU 7 is now offline
[  452.759346] PM: hibernation: Creating image:
[  452.955581] PM: hibernation: Need to copy 1019331 pages
[  452.955585] PM: hibernation: Normal pages needed: 1019331 + 1024, available pages: 3066791
[  452.759681] ACPI: PM: Restoring platform NVS memory
[  452.761170] ACPI: EC: EC started
[  452.762723] Enabling non-boot CPUs ...
[  452.762788] x86: Booting SMP configuration:
[  452.762788] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  452.763891] CPU1 is up
[  452.763935] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  452.765206] CPU2 is up
[  452.765255] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  452.766511] CPU3 is up
[  452.766559] smpboot: Booting Node 0 Processor 4 APIC 0x1
[  452.767885] CPU4 is up
[  452.767925] smpboot: Booting Node 0 Processor 5 APIC 0x3
[  452.769111] CPU5 is up
[  452.769147] smpboot: Booting Node 0 Processor 6 APIC 0x5
[  452.770518] CPU6 is up
[  452.770571] smpboot: Booting Node 0 Processor 7 APIC 0x7
[  452.772028] CPU7 is up
[  452.778327] ACPI: PM: Waking up from system sleep state S4
[  452.788278] ACPI: EC: interrupt unblocked
[  452.929911] ACPI: EC: event unblocked
[  452.929988] usb usb1: root hub lost power or was reset
[  452.929992] usb usb2: root hub lost power or was reset
[  452.930097] usb usb3: root hub lost power or was reset
[  452.930099] usb usb4: root hub lost power or was reset
[  452.938145] nvme nvme0: 8/0/0 default/read/poll queues
[  453.328827] usb 3-6: reset high-speed USB device number 3 using xhci_hcd
[  453.496206] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[  453.592269] usb 3-10: reset full-speed USB device number 4 using xhci_hcd
[  453.855546] usb 3-5: reset full-speed USB device number 2 using xhci_hcd
[  454.008617] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[  454.009473] PM: hibernation: Basic memory bitmaps freed
[  454.009482] OOM killer enabled.
[  454.009483] Restarting tasks ... 
[  454.009901] Bluetooth: hci0: Bootloader revision 0.4 build 0 week 30 2018
[  454.010836] Bluetooth: hci0: Device revision is 2
[  454.010842] Bluetooth: hci0: Secure boot is enabled
[  454.010844] Bluetooth: hci0: OTP lock is enabled
[  454.010846] Bluetooth: hci0: API lock is enabled
[  454.010848] Bluetooth: hci0: Debug lock is disabled
[  454.010850] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[  454.010858] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[  454.011250] done.
[  454.030265] thermal thermal_zone7: failed to read out thermal zone (-61)
[  454.049860] audit: type=1130 audit(1629725330.283:144): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  454.057322] PM: hibernation: hibernation exit
[  454.228034] audit: type=1130 audit(1629725330.460:145): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  454.228040] audit: type=1131 audit(1629725330.460:146): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  454.750973] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[  454.753455] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[  454.779754] wlan0: authenticated
[  454.781842] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[  454.793003] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[  454.806314] wlan0: associated
[  454.858211] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[  455.915038] Bluetooth: hci0: Waiting for firmware download to complete
[  455.915869] Bluetooth: hci0: Firmware loaded in 1860373 usecs
[  455.915926] Bluetooth: hci0: Waiting for device to boot
[  455.930940] Bluetooth: hci0: Device booted in 14711 usecs
[  455.930952] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
[  455.932995] Bluetooth: hci0: Applying Intel DDC parameters completed
[  455.936113] Bluetooth: hci0: Firmware revision 0.0 build 191 week 21 2021
[  455.995904] Bluetooth: hci0: MSFT filter_enable is already on
[  456.265249] hid-sensor-hub 001F:8087:0AC2.0003: timeout waiting for response from ISHTP device
[  458.903821] audit: type=1131 audit(1629725335.283:147): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  466.955950] audit: type=1131 audit(1629725344.008:148): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  493.630538] audit: type=1100 audit(1629725370.835:149): pid=5064 uid=1000 auid=1000 ses=2 msg='op=PAM:unix_chkpwd acct="ulrich" exe="/usr/bin/unix_chkpwd" hostname=? addr=? terminal=? res=success'
[  543.799707] Uhhuh. NMI received for unknown reason 30 on CPU 0.
[  543.799711] Do you have a strange power saving mode enabled?
[  543.799711] Dazed and confused, but trying to continue
[  597.451094] ACPI: button: The lid device is not compliant to SW_LID.
[  625.833780] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[  636.836054] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[  755.939988] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=55333 DF PROTO=2 
[  879.067043] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=63997 DF PROTO=2 
[  900.362085] audit: type=1130 audit(1629725777.541:150): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  900.362090] audit: type=1131 audit(1629725777.541:151): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  978.485128] audit: type=1130 audit(1629725855.665:152): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  978.486226] wlan0: deauthenticating from 1c:5f:2b:ad:70:e9 by local choice (Reason: 3=DEAUTH_LEAVING)
[  978.799481] PM: hibernation: hibernation entry
[  978.818449] Filesystems sync: 0.018 seconds
[  978.818452] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  978.820025] OOM killer disabled.
[  978.820245] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  978.820248] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  978.820252] PM: hibernation: Marking nosave pages: [mem 0x32646000-0x32739fff]
[  978.820257] PM: hibernation: Marking nosave pages: [mem 0x3303f000-0x3303ffff]
[  978.820259] PM: hibernation: Marking nosave pages: [mem 0x36001000-0x45bfefff]
[  978.821440] PM: hibernation: Marking nosave pages: [mem 0x45c00000-0xffffffff]
[  978.824690] PM: hibernation: Basic memory bitmaps created
[  978.826138] PM: hibernation: Preallocating image memory
[  979.575140] PM: hibernation: Allocated 1040790 pages for snapshot
[  979.575144] PM: hibernation: Allocated 4163160 kbytes in 0.74 seconds (5625.89 MB/s)
[  979.575147] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  979.576609] printk: Suspending console(s) (use no_console_suspend to debug)
[  980.107301] ACPI: EC: interrupt blocked
[  980.112082] ACPI: PM: Preparing to enter system sleep state S4
[  980.126774] ACPI: EC: event blocked
[  980.126775] ACPI: EC: EC stopped
[  980.126776] ACPI: PM: Saving platform NVS memory
[  980.135053] Disabling non-boot CPUs ...
[  980.136668] smpboot: CPU 1 is now offline
[  980.139734] smpboot: CPU 2 is now offline
[  980.141704] smpboot: CPU 3 is now offline
[  980.143966] smpboot: CPU 4 is now offline
[  980.146224] smpboot: CPU 5 is now offline
[  980.148023] smpboot: CPU 6 is now offline
[  980.149994] smpboot: CPU 7 is now offline
[  980.155932] PM: hibernation: Creating image:
[  980.350720] PM: hibernation: Need to copy 1027756 pages
[  980.350724] PM: hibernation: Normal pages needed: 1027756 + 1024, available pages: 3058366
[  980.156245] ACPI: PM: Restoring platform NVS memory
[  980.157622] ACPI: EC: EC started
[  980.159172] Enabling non-boot CPUs ...
[  980.159234] x86: Booting SMP configuration:
[  980.159234] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  980.160313] CPU1 is up
[  980.160357] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  980.161588] CPU2 is up
[  980.161635] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  980.162889] CPU3 is up
[  980.162937] smpboot: Booting Node 0 Processor 4 APIC 0x1
[  980.164229] CPU4 is up
[  980.164269] smpboot: Booting Node 0 Processor 5 APIC 0x3
[  980.165414] CPU5 is up
[  980.165442] smpboot: Booting Node 0 Processor 6 APIC 0x5
[  980.166780] CPU6 is up
[  980.166826] smpboot: Booting Node 0 Processor 7 APIC 0x7
[  980.168249] CPU7 is up
[  980.174437] ACPI: PM: Waking up from system sleep state S4
[  980.184522] ACPI: EC: interrupt unblocked
[  980.324691] ACPI: EC: event unblocked
[  980.324816] usb usb1: root hub lost power or was reset
[  980.324819] usb usb2: root hub lost power or was reset
[  980.324928] usb usb3: root hub lost power or was reset
[  980.324931] usb usb4: root hub lost power or was reset
[  980.333581] nvme nvme0: 8/0/0 default/read/poll queues
[  980.725027] usb 3-10: reset full-speed USB device number 4 using xhci_hcd
[  980.878733] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[  980.988439] usb 3-5: reset full-speed USB device number 2 using xhci_hcd
[  981.251731] usb 3-6: reset high-speed USB device number 3 using xhci_hcd
[  981.448128] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[  981.448848] PM: hibernation: Basic memory bitmaps freed
[  981.448856] OOM killer enabled.
[  981.448857] Restarting tasks ... 
[  981.449112] Bluetooth: hci0: Bootloader revision 0.4 build 0 week 30 2018
[  981.450156] Bluetooth: hci0: Device revision is 2
[  981.450161] Bluetooth: hci0: Secure boot is enabled
[  981.450164] Bluetooth: hci0: OTP lock is enabled
[  981.450166] Bluetooth: hci0: API lock is enabled
[  981.450167] Bluetooth: hci0: Debug lock is disabled
[  981.450170] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[  981.450436] done.
[  981.450504] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[  981.460533] thermal thermal_zone7: failed to read out thermal zone (-61)
[  981.475875] audit: type=1130 audit(1629725891.313:153): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  981.509353] PM: hibernation: hibernation exit
[  981.693394] audit: type=1130 audit(1629725891.530:154): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  981.693400] audit: type=1131 audit(1629725891.530:155): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hibernate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  982.216659] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[  982.218813] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[  982.250531] wlan0: authenticated
[  982.251395] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[  982.255993] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[  982.276269] wlan0: associated
[  982.306357] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[  983.384784] Bluetooth: hci0: Waiting for firmware download to complete
[  983.385067] Bluetooth: hci0: Firmware loaded in 1889229 usecs
[  983.385144] Bluetooth: hci0: Waiting for device to boot
[  983.400271] Bluetooth: hci0: Device booted in 14820 usecs
[  983.400338] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-19-0-4.ddc
[  983.402177] Bluetooth: hci0: Applying Intel DDC parameters completed
[  983.405191] Bluetooth: hci0: Firmware revision 0.0 build 191 week 21 2021
[  983.465106] Bluetooth: hci0: MSFT filter_enable is already on
[  983.754740] hid-sensor-hub 001F:8087:0AC2.0003: timeout waiting for response from ISHTP device
[  986.468954] audit: type=1131 audit(1629725896.318:156): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  988.066657] audit: type=1100 audit(1629725898.021:157): pid=12856 uid=1000 auid=1000 ses=2 msg='op=PAM:unix_chkpwd acct="ulrich" exe="/usr/bin/unix_chkpwd" hostname=? addr=? terminal=? res=success'
[  994.215904] audit: type=1131 audit(1629725904.678:158): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 1100.561671] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=14181 DF PROTO=2 
[ 1220.775216] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=14864 DF PROTO=2 
[ 1346.565182] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=15657 DF PROTO=2 
[ 1476.580466] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=26599 DF PROTO=2 
[ 1604.565318] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=33514 DF PROTO=2 
[ 1647.024181] audit: type=1100 audit(1629726557.492:159): pid=12918 uid=1000 auid=1000 ses=2 msg='op=PAM:unix_chkpwd acct="ulrich" exe="/usr/bin/unix_chkpwd" hostname=? addr=? terminal=? res=success'
[ 1724.593409] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=36104 DF PROTO=2 
[ 1845.704897] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=48182 DF PROTO=2 
[ 1975.604309] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=50642 DF PROTO=2 
[ 2087.875116] audit: type=1334 audit(1629726998.348:160): prog-id=32 op=LOAD
[ 2087.875199] audit: type=1334 audit(1629726998.348:161): prog-id=33 op=LOAD
[ 2087.875231] audit: type=1334 audit(1629726998.348:162): prog-id=34 op=LOAD
[ 2087.914716] audit: type=1130 audit(1629726998.388:163): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2117.969200] audit: type=1131 audit(1629727028.441:164): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2118.089986] audit: type=1334 audit(1629727028.564:165): prog-id=34 op=UNLOAD
[ 2118.089995] audit: type=1334 audit(1629727028.564:166): prog-id=33 op=UNLOAD
[ 2118.089998] audit: type=1334 audit(1629727028.564:167): prog-id=32 op=UNLOAD
[ 2226.549354] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=60230 DF PROTO=2 
[ 2345.764236] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=1556 DF PROTO=2 
[ 2597.580592] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=5946 DF PROTO=2 
[ 2720.722287] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=10776 DF PROTO=2 
[ 2744.372678] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[ 2750.352731] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)
[ 2757.452684] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[ 2849.530321] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=23009 DF PROTO=2 
[ 2863.072060] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[ 3070.388049] audit: type=1100 audit(1629727980.866:168): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:authentication grantors=pam_faillock,pam_permit,pam_faillock acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3070.389164] audit: type=1101 audit(1629727980.866:169): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3070.389719] audit: type=1110 audit(1629727980.866:170): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3070.389753] audit: type=1105 audit(1629727980.866:171): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3070.428638] audit: type=1106 audit(1629727980.906:172): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3070.428755] audit: type=1104 audit(1629727980.906:173): pid=15605 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3087.133691] audit: type=1101 audit(1629727997.609:174): pid=15616 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3087.134471] audit: type=1110 audit(1629727997.609:175): pid=15616 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3087.134641] audit: type=1105 audit(1629727997.612:176): pid=15616 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3087.139380] audit: type=1106 audit(1629727997.616:177): pid=15616 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3087.139443] audit: type=1104 audit(1629727997.616:178): pid=15616 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3098.585588] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=23401 DF PROTO=2 
[ 3106.400081] audit: type=1101 audit(1629728016.876:179): pid=15619 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3106.401021] audit: type=1110 audit(1629728016.876:180): pid=15619 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3106.401196] audit: type=1105 audit(1629728016.879:181): pid=15619 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3106.442068] audit: type=1106 audit(1629728016.919:182): pid=15619 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3106.442077] audit: type=1104 audit(1629728016.919:183): pid=15619 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3114.020306] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[ 3114.082732] audit: type=1130 audit(1629728024.559:184): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3114.397557] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[ 3114.400625] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3114.404022] wlan0: authenticated
[ 3114.404401] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3114.408655] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[ 3114.418397] wlan0: associated
[ 3114.427036] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 3125.796060] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[ 3126.163092] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[ 3126.166363] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3126.168971] wlan0: authenticated
[ 3126.171007] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3126.175266] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[ 3126.178652] wlan0: associated
[ 3126.186243] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 3130.096884] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[ 3130.527459] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[ 3130.532127] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3130.534706] wlan0: authenticated
[ 3130.537673] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3130.541939] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[ 3130.545297] wlan0: associated
[ 3130.553619] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 3131.431158] iwlwifi 0000:00:14.3: No beacon heard and the session protection is over already...
[ 3131.431219] wlan0: Connection to AP 1c:5f:2b:ad:70:e9 lost
[ 3131.678343] wlan0: authenticate with 1c:5f:2b:ad:70:e9
[ 3131.680820] wlan0: send auth to 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3131.686425] wlan0: authenticated
[ 3131.687654] wlan0: associate with 1c:5f:2b:ad:70:e9 (try 1/3)
[ 3131.691907] wlan0: RX AssocResp from 1c:5f:2b:ad:70:e9 (capab=0x411 status=0 aid=6)
[ 3131.695247] wlan0: associated
[ 3131.703476] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[ 3144.188161] audit: type=1131 audit(1629728054.666:185): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3220.719798] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=28332 DF PROTO=2 
[ 3249.344775] audit: type=1101 audit(1629728159.823:186): pid=15815 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3249.345728] audit: type=1110 audit(1629728159.823:187): pid=15815 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3249.345864] audit: type=1105 audit(1629728159.823:188): pid=15815 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3249.348683] audit: type=1106 audit(1629728159.826:189): pid=15815 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3249.348748] audit: type=1104 audit(1629728159.826:190): pid=15815 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3249.393796] audit: type=1334 audit(1629728159.870:191): prog-id=8 op=UNLOAD
[ 3249.393810] audit: type=1334 audit(1629728159.870:192): prog-id=6 op=UNLOAD
[ 3253.312082] audit: type=1101 audit(1629728163.790:193): pid=15818 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3253.312938] audit: type=1110 audit(1629728163.790:194): pid=15818 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3253.313012] audit: type=1105 audit(1629728163.790:195): pid=15818 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3273.666535] kauditd_printk_skb: 2 callbacks suppressed
[ 3273.666539] audit: type=1101 audit(1629728184.143:198): pid=15822 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3273.667457] audit: type=1110 audit(1629728184.147:199): pid=15822 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3273.667559] audit: type=1105 audit(1629728184.147:200): pid=15822 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3273.671154] audit: type=1106 audit(1629728184.150:201): pid=15822 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3273.671232] audit: type=1104 audit(1629728184.150:202): pid=15822 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3301.087632] audit: type=1101 audit(1629728211.567:203): pid=15824 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3301.088637] audit: type=1110 audit(1629728211.567:204): pid=15824 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3301.088791] audit: type=1105 audit(1629728211.567:205): pid=15824 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3301.470835] audit: type=1106 audit(1629728211.950:206): pid=15824 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3301.470919] audit: type=1104 audit(1629728211.950:207): pid=15824 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3337.277512] audit: type=1101 audit(1629728247.757:208): pid=15837 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3337.278187] audit: type=1110 audit(1629728247.757:209): pid=15837 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3337.278319] audit: type=1105 audit(1629728247.757:210): pid=15837 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3337.642280] audit: type=1106 audit(1629728248.120:211): pid=15837 uid=1000 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3337.642377] audit: type=1104 audit(1629728248.120:212): pid=15837 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3345.738488] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=31462 DF PROTO=2 
[ 3389.453177] audit: type=1101 audit(1629728299.934:213): pid=15854 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3389.453753] audit: type=1110 audit(1629728299.934:214): pid=15854 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3389.453825] audit: type=1105 audit(1629728299.934:215): pid=15854 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3474.468915] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=39935 DF PROTO=2 
[ 3507.869462] audit: type=1101 audit(1629728418.351:216): pid=15880 uid=0 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3507.870326] audit: type=1110 audit(1629728418.351:217): pid=15880 uid=0 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3507.870459] audit: type=1105 audit(1629728418.351:218): pid=15880 uid=0 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3515.044699] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
[ 3521.276901] audit: type=1106 audit(1629728431.758:219): pid=15880 uid=0 auid=1000 ses=2 msg='op=PAM:session_close grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3521.276979] audit: type=1104 audit(1629728431.758:220): pid=15880 uid=0 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 3583.167368] audit: type=1334 audit(1629728493.648:221): prog-id=35 op=LOAD
[ 3583.167440] audit: type=1334 audit(1629728493.648:222): prog-id=36 op=LOAD
[ 3583.167468] audit: type=1334 audit(1629728493.648:223): prog-id=37 op=LOAD
[ 3583.204742] audit: type=1130 audit(1629728493.685:224): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3595.727072] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=46495 DF PROTO=2 
[ 3613.257807] audit: type=1131 audit(1629728523.735:225): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3613.365407] audit: type=1334 audit(1629728523.845:226): prog-id=37 op=UNLOAD
[ 3613.365418] audit: type=1334 audit(1629728523.845:227): prog-id=36 op=UNLOAD
[ 3613.365423] audit: type=1334 audit(1629728523.845:228): prog-id=35 op=UNLOAD
[ 3720.730393] [UFW BLOCK] IN=wlan0 OUT= MAC=01:00:5e:00:00:01:9c:c7:a6:55:83:8f:08:00 SRC=192.168.10.1 DST=224.0.0.1 LEN=36 TOS=0x00 PREC=0xC0 TTL=1 ID=52700 DF PROTO=2 
[ 3894.001799] audit: type=1100 audit(1629728804.483:229): pid=16045 uid=1000 auid=1000 ses=2 msg='op=PAM:authentication grantors=pam_faillock,pam_permit,pam_faillock acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/1 res=success'
[ 3894.002857] audit: type=1101 audit(1629728804.483:230): pid=16045 uid=1000 auid=1000 ses=2 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="ulrich" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/1 res=success'
[ 3894.003485] audit: type=1110 audit(1629728804.483:231): pid=16045 uid=1000 auid=1000 ses=2 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/1 res=success'
[ 3894.003606] audit: type=1105 audit(1629728804.483:232): pid=16045 uid=1000 auid=1000 ses=2 msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/1 res=success'

--------------EC9A8650C79B64B58255AB2E--
