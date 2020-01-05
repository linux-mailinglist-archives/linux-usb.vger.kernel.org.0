Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFCE1307FA
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2020 13:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgAEM3Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 5 Jan 2020 07:29:24 -0500
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:40129 "EHLO
        m4a0073g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgAEM3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jan 2020 07:29:23 -0500
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY m4a0073g.houston.softwaregrp.com WITH ESMTP;
 Sun,  5 Jan 2020 12:27:05 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Sun, 5 Jan 2020 12:28:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Sun, 5 Jan 2020 12:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnRA3rTsHA06rJ2iQTs1BE0pfVX+IImg5VtAdNVkFLf2i8L6LFeAZjMLvq8lCSRbtY1sp6ouwoiTCzHugXtxNbUKmTuDZAGqAZfXZFACaw5MneIW0BdTkkr6uziHZ6wfBFMiw837AnaT5FqqwNB8dzAGfZzGiHdm1qbSKEjatK0gMIwImFXVMhoW7Btdp0XhXB5M/bPsuRUorHMTgTnhWUn3Pz7rhIK7QX9j4lqlkiCwtJG0oNw8qWweXpHRfuLE93Dc6VRT5B/TRdirC3Uid8yWqW2v8lf7yBXauL5mLgSLxANsczCthhrVZDct7yuBUEvM8pVf/X3wWBy1W70R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWVeWTS+ZTUe+ued5OSFVLlwzsoq8T+jbuakGDrzIq8=;
 b=E9CzzF+eCiNn39nCJqSWy4uV26WopHBTs+46bMvT0gU/iaUEgMN82rE2dOfj5ghqbXvC7+51YqqhXsbi0cfxRm+Y/5eGld4NOvoRTAB+Sd8B7NZX+Rfr1YkV4JjbBU6dEzfFdctB8qlqum4TCkUjRMBagf0me9nBO/3T7Wl3wa/IK+J/wIW9Sw19SiWBPsx9g7WcKd+Fjs/zIZkKdnALNtkhuEjz7nPCkb5+w0bs8BgJUhjqeDlDHZFvO+YmOFqweFndUAiHWbU4wsIUksorDI+yTPvq2xYwQUexL7hlv9yMC6kcPFTe/I+rOAG1BtohFDg1hyQaLbUXS6bs8RyTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com (10.164.148.11) by
 DM5PR1801MB2010.namprd18.prod.outlook.com (10.164.154.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Sun, 5 Jan 2020 12:28:51 +0000
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::a866:6d3f:6eff:7c20]) by DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::a866:6d3f:6eff:7c20%3]) with mapi id 15.20.2602.012; Sun, 5 Jan 2020
 12:28:51 +0000
Received: from gryphon.disruptive.org.uk (81.109.79.34) by LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11 via Frontend Transport; Sun, 5 Jan 2020 12:28:51 +0000
Received: from roger by tweedledum with local (Exim 4.93)       (envelope-from <roger@tweedledum>)      id 1io51S-0001mD-3w; Sun, 05 Jan 2020 12:28:46 +0000
From:   Roger Whittaker <Roger.Whittaker@suse.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Thread-Topic: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Thread-Index: AQHVwLJayGZp6RBuVEegHhmo/iY1p6fWD1iAgAAHtICAAAwugIAAAxQAgAAXE4CAAP6UgIAAHvEAgAAgJYCAABmWgIAABXeAgAABiACAAAzPAIAAWhMAgAEMzoCAAccGgIABL54A
Date:   Sun, 5 Jan 2020 12:28:51 +0000
Message-ID: <20200105122846.GA6776@suse.com>
References: <20200102231124.GH4843@pendragon.ideasonboard.com>
 <Pine.LNX.4.44L0.2001031011250.1560-100000@iolanthe.rowland.org>
 <20200104182205.GB4906@pendragon.ideasonboard.com>
In-Reply-To: <20200104182205.GB4906@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::28) To DM5PR1801MB1817.namprd18.prod.outlook.com
 (2603:10b6:4:65::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Roger.Whittaker@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.109.79.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1804eda4-e11c-44a8-69fd-08d791dad238
x-ms-traffictypediagnostic: DM5PR1801MB2010:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1801MB201063972F0D372C99E586FF8D3D0@DM5PR1801MB2010.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(199004)(189003)(316002)(81166006)(81156014)(1076003)(8676002)(426003)(9786002)(9746002)(33656002)(54906003)(44832011)(6666004)(70036008)(186003)(26005)(66446008)(66946007)(4326008)(30864003)(66476007)(66556008)(2906002)(5660300002)(64756008)(55236004)(6916009)(71200400001)(8936002)(36756003)(52116002)(86362001)(478600001)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR1801MB2010;H:DM5PR1801MB1817.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: td6n174CbPeTW8vcRNee7cvaQCESSu90i4Cez0SI+LYPbiyvehpeqxXxb1Epkys1U0psC0VX50GfwJ/ar9w9qVEapTmJrlaKeo1sIBbq5siJLxjzcweS2Ibak2IYlRX0xcR1gM686uz/KV8EE0lMYQlqvh05/L2XTvmiH0D82iOp0GayRMueJZ2ANV/TLIi2sAgQ/OnaSMaodZzT5/4LSOI2ARxJ0HrxEANB4BToFP+5y7+uGpSRQuzVBZ34vqC7w2o4E3v2OTL8umC+TPLBHtladvTl/WmwsIEe0Uk+vlkWPSRMpkI+eVgFdB6iXaI0F+eYYUCZyiRQVUUIqpC4YvWT8dOlV1Xef09YcIWl+9PTD12wgDqMr2OJZl0KeqFFg5pBCB/ywOEUmJjgfTeQTCTQcRRBkb2Mq3R1Bdr7QJ5BtK5Sb+DUEYBsG7AJZ+409UAY0avdSKGz6kemdZPZfCxrsTLYyzZdQZBCAADIpoI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C3FBDA7654C8A54AAFB2FDCB8EED6F9A@namprd18.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1804eda4-e11c-44a8-69fd-08d791dad238
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2020 12:28:51.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHOt7akKEwUPdFsGMCL8vFjEnmUCzlkubQuPLtrU2bzVLRCYzjBzosgU54RN8n9sdJtjF/OK7rvkRUhL3O3Q0giDSkxUWOm/GmsmRhnXurs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2010
X-OriginatorOrg: suse.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 04, 2020 at 08:22:05PM +0200, Laurent Pinchart wrote:

> [...]

> > With the patch I posted yesterday, everything should go back to working 
> > the way it used to.  Have you had a chance to test it?
> 
> I don't have any camera affected by this issue, so I can't test it I'm
> afraid. Roger, would you be able to give it a try ?

With 5.4.7-1.g8211231-default that Takashi built with the patch
mentioned
(http://download.opensuse.org/repositories/home:/tiwai:/bsc1159811-fix2/standard/x86_64/)

output of lsusb -v -d 1778:0214

Bus 001 Device 013: ID 1778:0214  
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1778 
  idProduct          0x0214 
  bcdDevice            7.07
  iManufacturer           1 IPEVO Inc.
  iProduct                2 IPEVO Point 2 View
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0299
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         1
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               2 IPEVO Point 2 View
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              2 IPEVO Point 2 View
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0050
        dwClockFrequency        6.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       2
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
        bmControls           0x000200a2
          Auto-Exposure Mode
          Focus (Absolute)
          Iris (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000147f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x1d
          None
          PAL - 625/50
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {5a215226-3289-4156-894a-5c557cdf9664}
        bNumControl             4
        bNrPins                 1
        baSourceID( 0)          3
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0xff
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
        INTERFACE CLASS:  0f 24 01 02 ea 01 82 00 02 02 01 00 01 00 00
        INTERFACE CLASS:  1b 24 04 01 07 59 55 59 32 00 00 10 00 80 00 00 aa 00 38 9b 71 10 01 00 00 00 00
        INTERFACE CLASS:  1e 24 05 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 02 00 40 01 f0 00 c0 00 03 4b c0 00 03 4b 00 58 02 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 03 00 20 03 58 02 70 00 14 99 70 00 14 99 00 a6 0e 00 9a 5b 06 00 01 9a 5b 06 00
        INTERFACE CLASS:  1e 24 05 04 00 00 04 00 03 00 00 16 80 00 00 16 80 00 00 18 00 2a 2c 0a 00 01 2a 2c 0a 00
        INTERFACE CLASS:  1e 24 05 05 00 00 05 00 04 00 00 12 c0 00 00 12 c0 00 00 28 00 d0 12 13 00 01 d0 12 13 00
        INTERFACE CLASS:  1e 24 05 06 00 40 06 b0 04 00 00 0e a6 00 00 0e a6 00 98 3a 00 a0 25 26 00 01 a0 25 26 00
        INTERFACE CLASS:  1e 24 05 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  0b 24 03 00 01 80 02 e0 01 01 00
        INTERFACE CLASS:  0b 24 06 02 07 00 01 00 00 00 00
        INTERFACE CLASS:  1e 24 07 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 02 00 40 01 f0 00 c0 00 03 4b c0 00 03 4b 00 58 02 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 03 00 20 03 58 02 70 00 14 99 70 00 14 99 00 a6 0e 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  1e 24 07 04 00 00 04 00 03 00 00 16 80 00 00 16 80 00 00 18 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 05 00 00 05 00 04 00 00 12 c0 00 00 12 c0 00 00 28 00 2a 2c 0a 00 01 2a 2c 0a 00
        INTERFACE CLASS:  1e 24 07 06 00 40 06 b0 04 00 00 0e a6 00 00 0e a6 00 98 3a 00 d0 12 13 00 01 d0 12 13 00
        INTERFACE CLASS:  1e 24 07 01 00 80 02 e0 01 00 00 0d 2f 00 00 0d 2f 00 60 09 00 0e 64 03 00 01 0e 64 03 00
        INTERFACE CLASS:  06 24 0d 00 00 00
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)


dmesg lines on plugging:

[   95.016139] usb 1-1.4.3.3: new high-speed USB device number 13 using xhci_hcd
[   95.130236] usb 1-1.4.3.3: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
[   95.130241] usb 1-1.4.3.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   95.130244] usb 1-1.4.3.3: Product: IPEVO Point 2 View
[   95.130246] usb 1-1.4.3.3: Manufacturer: IPEVO Inc.
[   95.133103] hid-generic 0003:1778:0214.000A: hiddev97,hidraw6: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.3/input0
[   95.133500] uvcvideo: Probing generic UVC device 1.4.3.3
[   95.133618] uvcvideo: trying extra data from endpoint 0.
[   95.133623] uvcvideo: Found format YUV 4:2:2 (YUYV).
[   95.133626] uvcvideo: - 640x480 (30.0 fps)
[   95.133629] uvcvideo: - 320x240 (30.0 fps)
[   95.133631] uvcvideo: - 800x600 (24.0 fps)
[   95.133633] uvcvideo: - 1024x768 (15.0 fps)
[   95.133635] uvcvideo: - 1280x1024 (8.0 fps)
[   95.133636] uvcvideo: - 1600x1200 (4.0 fps)
[   95.133638] uvcvideo: - 640x480 (30.0 fps)
[   95.133639] uvcvideo: Found format MJPEG.
[   95.133641] uvcvideo: - 640x480 (45.0 fps)
[   95.133642] uvcvideo: - 320x240 (45.0 fps)
[   95.133644] uvcvideo: - 800x600 (45.0 fps)
[   95.133645] uvcvideo: - 1024x768 (30.0 fps)
[   95.133647] uvcvideo: - 1280x1024 (15.0 fps)
[   95.133648] uvcvideo: - 1600x1200 (8.0 fps)
[   95.133649] uvcvideo: - 640x480 (45.0 fps)
[   95.133656] uvcvideo: Found a Status endpoint (addr 81).
[   95.133658] uvcvideo: Found UVC 1.00 device IPEVO Point 2 View (1778:0214)
[   95.133698] uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 1: -32 (exp. 1).
[   95.133763] uvcvideo: Control error 6
[   95.133766] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.4.3.3 entity 1
[   95.133769] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[   95.133815] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/6 to device 1.4.3.3 entity 1
[   95.133818] uvcvideo: Adding mapping 'Focus (absolute)' to control 00000000-0000-0000-0000-000000000001/6.
[   95.133860] uvcvideo: Failed to query (GET_INFO) UVC control 9 on unit 1: -32 (exp. 1).
[   95.133934] uvcvideo: Control error 6
[   95.133936] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/9 to device 1.4.3.3 entity 1
[   95.133939] uvcvideo: Adding mapping 'Iris, Absolute' to control 00000000-0000-0000-0000-000000000001/9.
[   95.133984] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/8 to device 1.4.3.3 entity 1
[   95.133986] uvcvideo: Adding mapping 'Focus, Auto' to control 00000000-0000-0000-0000-000000000001/8.
[   95.134031] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.4.3.3 entity 3
[   95.134033] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[   95.134078] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.4.3.3 entity 3
[   95.134080] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[   95.134130] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.4.3.3 entity 3
[   95.134132] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
[   95.134178] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.4.3.3 entity 3
[   95.134180] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[   95.134225] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.4.3.3 entity 3
[   95.134227] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[   95.134266] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.4.3.3 entity 3
[   95.134269] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
[   95.134313] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.4.3.3 entity 3
[   95.134316] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[   95.134361] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.4.3.3 entity 3
[   95.134364] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[   95.134409] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.4.3.3 entity 3
[   95.134411] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[   95.134415] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1
[   95.134422] uvcvideo: Found a valid video chain (1 -> 2).
[   95.135278] uvcvideo 1-1.4.3.3:1.1: Entity type for entity Extension 4 was not initialized!
[   95.135284] uvcvideo 1-1.4.3.3:1.1: Entity type for entity Processing 3 was not initialized!
[   95.135289] uvcvideo 1-1.4.3.3:1.1: Entity type for entity Camera 1 was not initialized!
[   95.135468] input: IPEVO Point 2 View: IPEVO Point as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.4/1-1.4.3/1-1.4.3.3/1-1.4.3.3:1.1/input/input22
[   95.135632] uvcvideo: UVC device initialized.
[   95.173185] uvcvideo: uvc_v4l2_open
[   95.173224] uvcvideo: uvc_v4l2_release
[   97.532205] uvcvideo: Suspending interface 2
[   97.532210] uvcvideo: Suspending interface 1


# ls -l /dev/video*
crw-rw----+ 1 root video 81, 0 Jan  5 12:20 /dev/video0
crw-rw----+ 1 root video 81, 1 Jan  5 12:20 /dev/video1

Camera works.


-- 
============================================
Roger Whittaker
SUSE Linux Premium Support Engineer
 
roger.whittaker@suse.com
+44 7802 357081
 
SUSE Linux
One Station Square
Bracknell
RG12 1QB
United Kingdom
============================================
