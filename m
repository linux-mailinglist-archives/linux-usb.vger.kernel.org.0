Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09D12EB88
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 22:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgABVwg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 2 Jan 2020 16:52:36 -0500
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:34904 "EHLO
        m4a0073g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbgABVwg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 16:52:36 -0500
X-Greylist: delayed 17434 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Jan 2020 16:52:35 EST
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY m4a0073g.houston.softwaregrp.com WITH ESMTP;
 Thu,  2 Jan 2020 21:50:21 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 2 Jan 2020 21:52:00 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 2 Jan 2020 21:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZFPiBO57mgRIbxN9OvFSo+SroPbo07vY6vsnmSry6r/9EikiIvWVvSR8+JRogH4g5fMzBcfxiiBciO4eM+ktTRWbb+o3vNs3BV/TmGFXBz1PDCIxcRO5DM0ZE7IZ92KVpU5gdE+vS8DVRrk4jqIP4wjwRN3/C3Ek+TG6VUU7RcTA6MmzrFC5V2/96a7jzNcq427UzPxuH2OVi4/T4QLEj/SavexloAjU6yRJxjkUkdQQcIHmyBtxCAiEWP+Mc7x4yWlYvqQXFAFFD0b4JWQZmsI81nsDY4pSYrglyuo7qXLkeJD1IM8tFpk2UFQuX3cFabu+z3UlAviThgMcDJZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqcwAO5xuq4HUXHVokJVcuzjd1OPHPNnfUYiDNLS7QM=;
 b=lIVrzgAcoOQT72oZ4VOrQ/EqgUvYjyegmY7aSWWNTRwQMG1jDB02Ksc4NVHaY9YOviQXPYT8RuZR4zywTvk4RjjmM4zOfkSD4QZ3KRCbho2r/yF/2ymRs+lDzFClGtiRZv7w+1aUHha8YSstApDJNDJQ/bB1DiEyr2ORRuGZLyM3KVrS8Z/Wp7poE+J3HtXxE/IxlUnbwoXAn6duJrxJEmFkUM2UCxSvr3xF2tJgrl7NEk+Om4tTDOz2OupLF9p0K36WKznlSBFLUieHb4auUk++VlzCd1BovcjTfj1WYh2hwRFJ3JQv3bO7bg9f5dnw9OSaw0M8XyX/IJFBqB4LgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com (10.164.148.11) by
 DM5PR1801MB1945.namprd18.prod.outlook.com (10.164.155.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Thu, 2 Jan 2020 21:51:59 +0000
Received: from DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::ed5f:ebdc:7af2:4826]) by DM5PR1801MB1817.namprd18.prod.outlook.com
 ([fe80::ed5f:ebdc:7af2:4826%7]) with mapi id 15.20.2581.014; Thu, 2 Jan 2020
 21:51:58 +0000
Received: from gryphon.disruptive.org.uk (81.98.19.123) by LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Thu, 2 Jan 2020 21:51:55 +0000
Received: from roger by tweedledum with local (Exim 4.93)       (envelope-from <roger@tweedledum>)      id 1in8Ni-00053w-I6; Thu, 02 Jan 2020 21:51:50 +0000
From:   Roger Whittaker <Roger.Whittaker@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Thread-Topic: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Thread-Index: AQHVwLJayGZp6RBuVEegHhmo/iY1p6fWD1iAgAAHtICAAAwugIAAAxQAgAAXE4CAAP6UgIAAHvEAgAAgJYCAABmWgIAABXeAgAABiACAAAzPAIAAQ9gA
Date:   Thu, 2 Jan 2020 21:51:55 +0000
Message-ID: <20200102215150.GA19206@suse.com>
References: <20200102170310.GF4843@pendragon.ideasonboard.com>
 <Pine.LNX.4.44L0.2001021246480.1309-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001021246480.1309-100000@iolanthe.rowland.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To DM5PR1801MB1817.namprd18.prod.outlook.com
 (2603:10b6:4:65::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Roger.Whittaker@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.98.19.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9c71868-251e-4955-a5af-08d78fcdfbe0
x-ms-traffictypediagnostic: DM5PR1801MB1945:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1801MB194592F4025DD5384B0AEC748D200@DM5PR1801MB1945.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0270ED2845
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(136003)(366004)(39850400004)(346002)(396003)(189003)(199004)(9746002)(81166006)(2906002)(9786002)(81156014)(33656002)(44832011)(1076003)(6916009)(71200400001)(316002)(5660300002)(66946007)(54906003)(8936002)(36756003)(426003)(4326008)(66446008)(64756008)(66476007)(66556008)(70036008)(52116002)(86362001)(26005)(2616005)(8676002)(478600001)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR1801MB1945;H:DM5PR1801MB1817.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GFW18FoJPyF9bK2AolzT52bcJFfJwQMd1vW2ml7Jf//vNjhOVYNo8RdEhkmIDKI4FDpq0swvlYqzrOFJWR4QO/JnjsoVvvr2aViiV409QxIZO7dj88ZBKjynm+3fDRSMizNBMfjLEPckpqYjrDoJdNPnT9WRZ3s5AcHYMR2a+UPG0yeKeN4P5EhNEyNUvNyuv22JVir/KK9zCnylZf2AlyvsFJYMjY6SUM83+kjDuFwdFYNVdXthbBgWVMmUYgRrprU61o0L3owzELDD30CVrdGAjEYNdadsDRiFCqhioW+RB5pBH3SR6ul4NWdb+9HzFKEZQeQrbGeQ12bNP2BJe2LrbpGa3KiWl2/eQNcqqtopAurZIL6fkkQkMGKzGEA6djQ9fmbZc1D4iwisNoUc+4RqAwyjgkG14ua6PRmgfJMYtalXf6eZz5D/DigA7Eeg
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5E45907DAE886049B30918D3F1314E9F@namprd18.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c71868-251e-4955-a5af-08d78fcdfbe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2020 21:51:56.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QE8H/2FUcy0hfcyO6yPd4NhnRYDACUiGE9suY/4K2iXVSloV4gK0bJj1ZzmC4RSuPqlg+ordkwZqYjczgUdMkQfBRzCYjG3lhIPPOVg5WQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1945
X-OriginatorOrg: suse.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 02, 2020 at 12:49:00PM -0500, Alan Stern wrote:

> Roger, you can get more information by plugging in the device and
> then posting the contents of /sys/kernel/debug/usb/devices (or just
> the portion that refers to the camera).  It would be interesting to
> compare the values from the kernel with the commit present and the
> kernel with the commit reverted.

5.3.12-2-default (commit present)

T:  Bus=01 Lev=04 Prnt=08 Port=00 Cnt=01 Dev#= 10 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1778 ProdID=0214 Rev= 7.07
S:  Manufacturer=IPEVO Inc.
S:  Product=IPEVO Point 2 View
C:* #Ifs= 3 Cfg#= 1 Atr=80 MxPwr=500mA
A:  FirstIf#= 1 IfCount= 2 Cls=0e(video) Sub=03 Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=85(I) Atr=03(Int.) MxPS=   8 Ivl=64ms
I:* If#= 1 Alt= 0 #EPs= 1 Cls=0e(video) Sub=01 Prot=00 Driver=uvcvideo
E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 2 Alt= 0 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=(none)
E:  Ad=82(I) Atr=05(Isoc) MxPS=   0 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=(none)
E:  Ad=82(I) Atr=05(Isoc) MxPS=3060 Ivl=125us

----------------

5.4.7-1.g43720a7-default (commit reverted)

T:  Bus=01 Lev=04 Prnt=08 Port=00 Cnt=01 Dev#= 13 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1778 ProdID=0214 Rev= 7.07
S:  Manufacturer=IPEVO Inc.
S:  Product=IPEVO Point 2 View
C:* #Ifs= 3 Cfg#= 1 Atr=80 MxPwr=500mA
A:  FirstIf#= 1 IfCount= 2 Cls=0e(video) Sub=03 Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=85(I) Atr=03(Int.) MxPS=   8 Ivl=64ms
I:* If#= 1 Alt= 0 #EPs= 1 Cls=0e(video) Sub=01 Prot=00 Driver=uvcvideo
E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 2 Alt= 0 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
E:  Ad=82(I) Atr=05(Isoc) MxPS=   0 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
E:  Ad=82(I) Atr=05(Isoc) MxPS=3060 Ivl=125us




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
