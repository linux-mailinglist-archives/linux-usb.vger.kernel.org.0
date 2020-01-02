Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C3812E935
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 18:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgABRSS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 2 Jan 2020 12:18:18 -0500
Received: from m4a0072g.houston.softwaregrp.com ([15.124.2.130]:47987 "EHLO
        m4a0072g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726125AbgABRSR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 12:18:17 -0500
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY m4a0072g.houston.softwaregrp.com WITH ESMTP;
 Thu,  2 Jan 2020 17:17:10 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 2 Jan 2020 16:57:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 2 Jan 2020 16:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Khn81wf87XgOB4Pkxec3mzwwzAj4FC65bLTlOFU1NEpYz/tt5kA+YMnekd71G2RBXan1eZuJMbhKk2zxYeogKu6R6iYjPC63KaRAN5Aa3anaUHSxd5C6c6jfMt+cAcdJczChJEUN8rb9r8QK1bS0xetGvuG0NyVaBtduemsedpfBnNzW8WvIuEzf8Seh7m2dBBAZccQAgpE3p6h0+MddsSz7Vnpjd7SWnfRBBa4I//3IiORszG9dx21L/cRfybqEbmzpwA65RJUhZY/vp1hs3B7UuIizbL8MkLnVQtQX0dZpTnDr5FgKeg7LjBc35vHCaVRDouc0d8a0YWKppeLGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0POLKqCOdmwF10JSdoadio4FvENGgAFq7ap1f95RhWI=;
 b=SQfJNGC26xfpgPz21B0InJxoieKEJUn1UqdsAaTtPjilmyiGnNHJiyeT8qWHprWsRSpGEV4jLg6zc+1CvJQYYM54Uu6p6QHbgyHaWGWgBapWjoT6vyuMFyrsl5Pe86q8VxpmdCAX6Gwv13uU7FJ6H/G9F0+x+We/qYT7tTjMIMIukDHMIjniDs3f+zkNASIYtJ6gHYm1vjS6xgKusXROfNFTQddvFvbpdva0sTA3nG6Damf7YwssHRT91/2tzqHzrNXxyltr2kzhhW3T7wxQ+F+z4aKiMySrv+Eh8aaVxTyZ+U51VtKhk7Z7y4u1Bm7KcbYMp648KbdUnOIApQ2UJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com (10.164.148.11) by
 DM5PR1801MB1979.namprd18.prod.outlook.com (10.164.154.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Thu, 2 Jan 2020 16:57:44 +0000
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::ed5f:ebdc:7af2:4826]) by DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::ed5f:ebdc:7af2:4826%7]) with mapi id 15.20.2581.014; Thu, 2 Jan 2020
 16:57:43 +0000
Received: from gryphon.disruptive.org.uk (81.98.19.123) by LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via Frontend Transport; Thu, 2 Jan 2020 16:57:42 +0000
Received: from roger by tweedledum with local (Exim 4.93)       (envelope-from <roger@tweedledum>)      id 1in3n0-0006sj-Fe; Thu, 02 Jan 2020 16:57:38 +0000
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
Thread-Index: AQHVwLJayGZp6RBuVEegHhmo/iY1p6fWD1iAgAAHtICAAAwugIAAAxQAgAAXE4CAAP6UgIAAHvEAgAAgJYCAABmWgIAABXMA
Date:   Thu, 2 Jan 2020 16:57:42 +0000
Message-ID: <20200102165738.GA26369@suse.com>
References: <s5hr20ingu5.wl-tiwai@suse.de>
 <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
 <20200102163807.GE4843@pendragon.ideasonboard.com>
In-Reply-To: <20200102163807.GE4843@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To DM5PR1801MB1817.namprd18.prod.outlook.com
 (2603:10b6:4:65::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Roger.Whittaker@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.98.19.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43c05389-2baa-4c0e-77c3-08d78fa4e1cc
x-ms-traffictypediagnostic: DM5PR1801MB1979:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1801MB19795210217278BDC314D29A8D200@DM5PR1801MB1979.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0270ED2845
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(199004)(189003)(66446008)(5660300002)(8936002)(1076003)(9786002)(9746002)(8676002)(81156014)(81166006)(71200400001)(66556008)(64756008)(6666004)(4326008)(30864003)(66476007)(2906002)(54906003)(426003)(6916009)(86362001)(33656002)(186003)(26005)(66946007)(478600001)(70036008)(2616005)(36756003)(44832011)(316002)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR1801MB1979;H:DM5PR1801MB1817.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pBigtfXp1c9UAm1vWNO6+x8zlhv/c4M2GhGPEBRV8n1SzP0gajRaWP3nZaDP0ctaflLWIQYYWbm0SKIBe/9dwidWlRNMfZt6GHiL1psPQMRIUin/up2K7ROKqZ/rPM4KtQYR+w4hHQ/ZwBwYqBCXAEBsmBNwOkGCgLguj889CDTdrBZxA1Pyj3I9RwQMFz8azHnGKwBZtFbfdHAvDbLjsTqFS0wjDJdWU1YS1GSzeGF6RBswd86vTf8gTkEMTH8UcCcs94O6WutQzKyyVUY2uJxrbXppOa84DuCYscWP25WyZkeiZlxzF6dbavsFpKGcu7iiHcjQTvoCqfEFFV/M/A/Iln3E9+J1/CJbhfuZiPaAAApcZxS6RrW0kx+q4Zc5M7d8AIiY86uJn5GUrEY1Vtxd2G/nNQ/WpO4AGLvV9eUKgUgQeab3a4u8dCn0v6FQ
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7DFCFC26D001A444B60E2AC6EA0380DB@namprd18.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c05389-2baa-4c0e-77c3-08d78fa4e1cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2020 16:57:43.5668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztK864uG/Mc2KUGRE2fe4/qjbHtCgZPUE3Op7DFkGrWGj3iqB1PWojRvrDyTbMUIO1j+wfOA2PpOB+VkOxp2J4PXNeTKev0V0GbCXglXMYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1979
X-OriginatorOrg: suse.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 02, 2020 at 06:38:07PM +0200, Laurent Pinchart wrote:

> Roger, would you be able to set the uvcvideo trace module parameter to
> 0xffff before plugging the device, and provide the messages printed by
> the driver to the kernel log both with and without the above commit ?

With 5.3.12-2-default, loading uvcvideo with

options uvcvideo trace=0xffff

On plugging:

[   73.571566] usb 1-1.4.3.1: new high-speed USB device number 12 using xhci_hcd
[   73.729180] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
[   73.729552] usb 1-1.4.3.1: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
[   73.729558] usb 1-1.4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   73.729561] usb 1-1.4.3.1: Product: IPEVO Point 2 View
[   73.729564] usb 1-1.4.3.1: Manufacturer: IPEVO Inc.
[   73.732670] hid-generic 0003:1778:0214.0009: hiddev98,hidraw8: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.1/input0
[   73.781765] videodev: Linux video capture interface: v2.00
[   73.807553] uvcvideo: Probing generic UVC device 1.4.3.1
[   73.807693] uvcvideo: no class-specific streaming interface descriptors found.
[   73.807728] uvcvideo: Found a Status endpoint (addr 81).
[   73.807730] uvcvideo: Found UVC 1.00 device IPEVO Point 2 View (1778:0214)
[   73.807759] uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 1: -32 (exp. 1).
[   73.807832] uvcvideo: Control error 6
[   73.807834] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.4.3.1 entity 1
[   73.807835] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[   73.807876] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/6 to device 1.4.3.1 entity 1
[   73.807877] uvcvideo: Adding mapping 'Focus (absolute)' to control 00000000-0000-0000-0000-000000000001/6.
[   73.807918] uvcvideo: Failed to query (GET_INFO) UVC control 9 on unit 1: -32 (exp. 1).
[   73.807996] uvcvideo: Control error 6
[   73.807997] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/9 to device 1.4.3.1 entity 1
[   73.807998] uvcvideo: Adding mapping 'Iris, Absolute' to control 00000000-0000-0000-0000-000000000001/9.
[   73.808037] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/8 to device 1.4.3.1 entity 1
[   73.808038] uvcvideo: Adding mapping 'Focus, Auto' to control 00000000-0000-0000-0000-000000000001/8.
[   73.808079] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.4.3.1 entity 3
[   73.808080] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[   73.808119] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.4.3.1 entity 3
[   73.808120] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[   73.808159] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.4.3.1 entity 3
[   73.808160] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
[   73.808205] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.4.3.1 entity 3
[   73.808206] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[   73.808255] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.4.3.1 entity 3
[   73.808257] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[   73.808308] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.4.3.1 entity 3
[   73.808309] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
[   73.808349] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.4.3.1 entity 3
[   73.808350] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[   73.808389] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.4.3.1 entity 3
[   73.808390] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[   73.808431] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.4.3.1 entity 3
[   73.808432] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[   73.808434] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1
[   73.808437] uvcvideo: Found a valid video chain (1 -> 2).
[   73.808438] uvcvideo: No streaming interface found for terminal 2.
[   73.808442] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Extension 4 was not initialized!
[   73.808444] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Processing 3 was not initialized!
[   73.808446] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Camera 1 was not initialized!
[   73.808542] input: IPEVO Point 2 View: IPEVO Point as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.4/1-1.4.3/1-1.4.3.1/1-1.4.3.1:1.1/input/input21
[   73.808590] uvcvideo: UVC device initialized.
[   73.808636] usbcore: registered new interface driver uvcvideo
[   73.808637] USB Video Class driver (1.1.1)
[   75.899721] uvcvideo: Suspending interface 1


------------------------------------------------------------------------

With 5.4.7-1.g43720a7-default (the kernel Takashi built with commit
d482c7bb0541 reverted), loading uvcvideo with

options uvcvideo trace=0xffff

On plugging:

[  267.765563] usb 1-1.4.3.1: new high-speed USB device number 13 using xhci_hcd
[  267.879567] usb 1-1.4.3.1: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
[  267.879573] usb 1-1.4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  267.879577] usb 1-1.4.3.1: Product: IPEVO Point 2 View
[  267.879580] usb 1-1.4.3.1: Manufacturer: IPEVO Inc.
[  267.882718] hid-generic 0003:1778:0214.000A: hiddev98,hidraw7: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.1/input0
[  267.883135] uvcvideo: Probing generic UVC device 1.4.3.1
[  267.883260] uvcvideo: trying extra data from endpoint 0.
[  267.883265] uvcvideo: Found format YUV 4:2:2 (YUYV).
[  267.883268] uvcvideo: - 640x480 (30.0 fps)
[  267.883277] uvcvideo: - 320x240 (30.0 fps)
[  267.883278] uvcvideo: - 800x600 (24.0 fps)
[  267.883280] uvcvideo: - 1024x768 (15.0 fps)
[  267.883282] uvcvideo: - 1280x1024 (8.0 fps)
[  267.883284] uvcvideo: - 1600x1200 (4.0 fps)
[  267.883286] uvcvideo: - 640x480 (30.0 fps)
[  267.883288] uvcvideo: Found format MJPEG.
[  267.883290] uvcvideo: - 640x480 (45.0 fps)
[  267.883292] uvcvideo: - 320x240 (45.0 fps)
[  267.883293] uvcvideo: - 800x600 (45.0 fps)
[  267.883295] uvcvideo: - 1024x768 (30.0 fps)
[  267.883297] uvcvideo: - 1280x1024 (15.0 fps)
[  267.883299] uvcvideo: - 1600x1200 (8.0 fps)
[  267.883301] uvcvideo: - 640x480 (45.0 fps)
[  267.883310] uvcvideo: Found a Status endpoint (addr 81).
[  267.883314] uvcvideo: Found UVC 1.00 device IPEVO Point 2 View (1778:0214)
[  267.883380] uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 1: -32 (exp. 1).
[  267.883411] uvcvideo: Control error 6
[  267.883416] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.4.3.1 entity 1
[  267.883419] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[  267.883468] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/6 to device 1.4.3.1 entity 1
[  267.883471] uvcvideo: Adding mapping 'Focus (absolute)' to control 00000000-0000-0000-0000-000000000001/6.
[  267.883512] uvcvideo: Failed to query (GET_INFO) UVC control 9 on unit 1: -32 (exp. 1).
[  267.883588] uvcvideo: Control error 6
[  267.883590] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/9 to device 1.4.3.1 entity 1
[  267.883593] uvcvideo: Adding mapping 'Iris, Absolute' to control 00000000-0000-0000-0000-000000000001/9.
[  267.883642] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/8 to device 1.4.3.1 entity 1
[  267.883645] uvcvideo: Adding mapping 'Focus, Auto' to control 00000000-0000-0000-0000-000000000001/8.
[  267.883694] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.4.3.1 entity 3
[  267.883696] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[  267.883745] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.4.3.1 entity 3
[  267.883747] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[  267.883795] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.4.3.1 entity 3
[  267.883797] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
[  267.883846] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.4.3.1 entity 3
[  267.883848] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[  267.883895] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.4.3.1 entity 3
[  267.883898] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[  267.883947] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.4.3.1 entity 3
[  267.883949] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
[  267.883999] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.4.3.1 entity 3
[  267.884002] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[  267.884050] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.4.3.1 entity 3
[  267.884053] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[  267.884101] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.4.3.1 entity 3
[  267.884104] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[  267.884108] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1
[  267.884117] uvcvideo: Found a valid video chain (1 -> 2).
[  267.885020] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Extension 4 was not initialized!
[  267.885025] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Processing 3 was not initialized!
[  267.885028] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Camera 1 was not initialized!
[  267.885188] input: IPEVO Point 2 View: IPEVO Point as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.4/1-1.4.3/1-1.4.3.1/1-1.4.3.1:1.1/input/input22
[  267.885266] uvcvideo: UVC device initialized.
[  267.919845] uvcvideo: uvc_v4l2_open
[  267.919884] uvcvideo: uvc_v4l2_release
[  270.387236] uvcvideo: Suspending interface 2
[  270.387241] uvcvideo: Suspending interface 1




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
