Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5D930BB5B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBBJtA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:49:00 -0500
Received: from mail-mw2nam12on2074.outbound.protection.outlook.com ([40.107.244.74]:49606
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229606AbhBBJss (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 04:48:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiLdMngHNKNL3mZ5YmwvuqqhNsAn+fHqx/aMtAiFA6eoisfwLtqRNRNp6iupiznTgvgwwBP+abX47fTlratpFMDamOFU4Z3VoX04Ir9PWIfo9jUFWOWNzdRpEuEAuOTefL6ixDNfUUYnBuMbYSjWLSKucNr8N4vZ5IffmDAQJXvo36BFJFX5tGXL2+BCdRzMu/nHhzyxaI3RDKkeTWxcougLCEFAK1J2abXPHmKqAe1YCw11opQAni2lYX0F1JXZKs8kI2w9/OSLVYkDEASwlI4DCamAI5UP1zT+3FvHtc3dUvnPsoY6NdMeqynPxMsv498LL/LLTxHm5jIkgyJnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6c8GLHe51pc0qLuy0Wz1VTvPqgKsLCvL9wB/F2ARe4=;
 b=RiSVf3TKehzFW+EwY9M6E4zfRd8duh3HfK2xVcDbSXxhZwGCQKGTNikXFulQI+CZSO9gda4OHnge5XUcFojMOK90bW0AXgcQlW4hCCdALxYzH2h6yibK8yH+6BFd1mPgT3jedZWoBcZiMKo6Jh8wRJlXMdp0hTxOi3yQ2ZnTJXVVkpKUUGgPmhHXtE0yeAUopQSVzSPdw0Cl/vZWMkMuEcDEB7rHyFs7HZ18YMks3O9bkoBQHxzIU3xpdoMCbeG7uovikK4xyuaIaKcPU5zf0l7Uy44rIM+cYGoQgrIWrvDEHhETs0oPWsY3K8JqHdK/mn817AKin2KxaA2AOuu+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6c8GLHe51pc0qLuy0Wz1VTvPqgKsLCvL9wB/F2ARe4=;
 b=K09NkIpDK5lzsLBgA304kHmlJbgANRv/Ed8eQAbgbD/Hh5Wn9WVEp2KISlB+wLyfJtrUwL4g1Lb8XM1w71/aaoa/FGaNvADx6xnOEKsSTsx0M4wK6v0eL52tuEUvcPY43YINQSA6nHAjLglIAHUduV+ep26kFtmOLwrWKANDVCI=
Received: from CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 2 Feb
 2021 09:48:01 +0000
Received: from CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::8577:b56c:df22:b00f]) by CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::8577:b56c:df22:b00f%7]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 09:48:01 +0000
From:   Tung Pham <Tung.Pham@silabs.com>
To:     Johan Hovold <johan@kernel.org>
CC:     Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>
Subject: RE: Bugs: usb serial crash when close second comport
Thread-Topic: Bugs: usb serial crash when close second comport
Thread-Index: Adb4crZThI4kYMAnS3uhwz9Hcje1rwADnCSQAACjTQAAIvLfEAALmnsAAAILncA=
Date:   Tue, 2 Feb 2021 09:48:01 +0000
Message-ID: <CO1PR11MB4882F6F4F085A81470A34EE481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
 <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
 <CO1PR11MB48821E7544DCB4E06665849481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBkOEHM8/VfK5Gc+@hovoldconsulting.com>
In-Reply-To: <YBkOEHM8/VfK5Gc+@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=silabs.com;
x-originating-ip: [113.190.252.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c93ce9e-0938-4c70-8f56-08d8c75fa13d
x-ms-traffictypediagnostic: CO1PR11MB4834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB483435F9D6CFB09F3652BC1981B59@CO1PR11MB4834.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: elbXKJJm37FRtcwfC+c+Pjbhl61r15otFZFP570B8buP3vn6+CZnTk4LeeMlTqB43l5CXVj3iciiugI1qqpFQO1O96hocVnY2MQg1ICYtNGgXhjU2HEwlfGqJIdNbBheicpY3A40M1DO5n5Rt4Q0E95rZOyxm9cu9/V+hpVtU5AHqJJcKnO3BVXKsoXmJnfzC7nKUxA44MgkWinpkfmbOS1ATc6ftamLP33R3N8YCA4YShXk3gw3PY3SA23V2HTQB6wV9qnN26YuO9eqp2GgIzZdyaxus6CE1uSZkm3jlvegzvHEjrVX/eVmyqjevgsDMotsESKodU3Q6VzVuX8JWKE7kI7VKei83+Zn+gKVNYGBZo9xUn8X3uM4o28eZx/jcDOKkApjDbI3+zasjj/TSsTi0haWNDJdkL1ZD9aDOgzZWaS8ORznrtlGO5wILBNWOKz3rf1n7vNAk11a4h4Sh9uaUNThmv5mv+GhFtWNJ7Ar5IpJ8Z+2sl3mzJCwceH+yf7v9gqXTxO/ZWZRolREow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4882.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(7696005)(186003)(9686003)(4326008)(53546011)(26005)(316002)(6506007)(55016002)(6916009)(71200400001)(54906003)(33656002)(8936002)(478600001)(52536014)(66476007)(86362001)(107886003)(66446008)(83380400001)(66946007)(2906002)(5660300002)(66556008)(76116006)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9kYT8ynZw4ikDxwT5VOLWQRKvIsJGbn1A2nGxN6KS3GfIXp2yNX1SAFEkr5Q?=
 =?us-ascii?Q?TtAdbt8eLiKHuOI6r24S8dpmL4qG7R7j4XeQtOpgq8Uth/32DsokewVfTj96?=
 =?us-ascii?Q?C8jYULi+SSWoXfhgJEb7U+iJ2frBAYepsJYEMUAZrLxn93XJ3pXtcIoqyowP?=
 =?us-ascii?Q?P796pwb61Xk04K3TeU0y97gp7QHAM2B21DIz4qRwr/gy//aubDcUITw3x2x2?=
 =?us-ascii?Q?oqWJuu1teHxXRhXaacUksBwiqeivzE1aHpzUEjt8kKsA2Cozn/SSNV22g4lv?=
 =?us-ascii?Q?KbceCwjDYIL5Ev/U9/AYuPSS8msPycEOPxfN34jdO8lVkVqMswqaTYnCNGgv?=
 =?us-ascii?Q?Z7FRs5iOFst94SwbcyjFjitroLdrZ3FT94qqx6rRwyB7FhJWb31mx/e+9ss8?=
 =?us-ascii?Q?ewrRsYvpYs1dx9n2xIdl3XW04iUqWYj3GoCCp0Cvg3xS3V0LoZu3Rrg85Dtf?=
 =?us-ascii?Q?yiUywQnO91hG8+pC+O+/aqA97YOFwHZ4yPz4XFTfPlslPSfcUAGcCQ2mCThJ?=
 =?us-ascii?Q?VkolvpTDIueT/a7BtNvN8l7hGSmVOSUz8IlFoJmMdya5intLaeZ5wHpofs0s?=
 =?us-ascii?Q?/vun9IwoefLxy//LFgQUpxSmYw0VAX8ojy6x74fKM9y/G4MJ/CY13XRSMRk7?=
 =?us-ascii?Q?Onik6CgXELnfFvpJgzwraDntU8aJxi/9JGgZaxc+lgs7re7wE+0UBTSKUMZc?=
 =?us-ascii?Q?5fxuLsLC15fJewS3BlqmrrgvaILDF3uW9k2lWEFKCxIiYMuTCtIOpMxEca53?=
 =?us-ascii?Q?p0ERGXlcWbWJ5pZmaGy7NdUsjw0X6LEFT2sbIvt4xBMYUl0VT3jt2Z8JXou9?=
 =?us-ascii?Q?lFZZ0vsvV5ou8/172UGgLxA4Us1UYYFgXhNEsnHb/vEFN1UTxsr93oIzhrdC?=
 =?us-ascii?Q?uXtB+yOuGzsibwXS3tmciGPYpkTbMm/uMqAlYqDYWgkpf4wKdYbUtzWGfkpA?=
 =?us-ascii?Q?qMSc8w2u12c6kR2VCwd01/Z/fc9SqplDO/VLH4wuvs2LkMmcFHC57SXX1JAr?=
 =?us-ascii?Q?pkYq6hDa1QgGavYaz4qYGH1Luu6CtS3fS8uu6YDvjHh7Ajmu85kRN+X1fih+?=
 =?us-ascii?Q?N63KkzKL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4882.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c93ce9e-0938-4c70-8f56-08d8c75fa13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 09:48:01.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHoW+MTXE9c6F6iCpVwwaBMwL1JLEMLaM1QtF7euDuSwVMBFaZuHAM8xIz05e31wUOTztMJmowVWyDOcBM+cXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear mr Johan Hovold <johan@kernel.org>
After the bug occur, when open or close device it show on log of system:

failed set request 0x12 status: -110
failed set request 0x00 status: -110
failed set request 0x00 status: -110

0x00 =3D enable or disable serial device USB request.
0x12 =3D flush serial device USB request.
-110 =3D time out.

it means driver is not crashes but it can't open or close device any more.
We may find mainline kernel of raspberry if have, and find the driver of US=
B they use in next days.
Thanks.

-----Original Message-----
From: Johan Hovold <johan@kernel.org>=20
Sent: Tuesday, February 2, 2021 3:32 PM
To: Tung Pham <Tung.Pham@silabs.com>
Cc: Hung Nguyen <Hung.Nguyen@silabs.com>; linux-usb@vger.kernel.org; Pho Tr=
an <Pho.Tran@silabs.com>
Subject: Re: Bugs: usb serial crash when close second comport

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On Tue, Feb 02, 2021 at 03:50:50AM +0000, Tung Pham wrote:

> > Can you reproduce this with a mainline kernel?
> >
> > Otherwise, you may need to bring this up with Ubuntu.
>
> this bug doesn't occur on Ubuntu running on pc, it only occur on=20
> raspberry.

I understand, but if you can only reproduce this using a Ubuntu kernel on t=
he RPi it could be to something that they've put in their kernel's (e.g. so=
me out-of-tree driver) which doesn't exist in mainline. That's why you need=
 to be able to reproduce it on a mainline kernel.

> One additional thing: the bug doesn't occur with HUB: Orico, model=20
> W6ph4-u3-v1, Manufacture: VIA Labs, inc.
> It only occur with hub: HB-UM43 hub, Genesys Logic, Inc.

Ok, so depending on if the kernel crashes or not, it could still be a bug i=
n the hub firmware.

> > This sounds like you could have a problem with the host-controller=20
> > driver. What controller is the RPi4 using?
>
> For the Pi 4, a fully-featured host controller drives the downstream=20
> USB ports. Downstream USB is provided by a Via Labs VL805 chip - that=20
> supports two USB 2.0 ports and two USB 3.0 ports

Which driver does it use? I believe some of the earlier RPi used an out-of-=
tree host-controller driver, but perhaps that's no longer the case.

> > As you write above, the usb_serial_generic_close() is needed to=20
> > cancel the outstanding URBs during close so you can't remove that.
> >
> > But my guess is that something breaks in the HCD when unlinking=20
> > those URBs when connected through the hub. Do you have a stack trace=20
> > from an oops? Or do things just lock up?
>
> I don't know how to capture stack trace?

If the kernel oopses/crashes (e.g. due to a bug in the driver) you should f=
ind a stack trace in the kernel log (e.g. run dmesg).

But if the USB bus just locks up (until you disconnect the hub or device, o=
r reload the USB serial driver), then this could also be a firmware bug in =
the host-controller or hub.

Johan
