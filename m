Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F00A1FAEE3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 13:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgFPLGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 07:06:07 -0400
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:58094
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725901AbgFPLGG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 07:06:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnmTrDPk/dazZo0FmVIa+1sb4tVt68Yq8Cbab3R4KB/Q0MnCv5Zs/YZX+gpNwtZPAnMuStBSO99BK7Pfv3qAiOOHMBZOpwQqWExGi6zfibDxO6lZuaSS0N9JCOB840r0cwIoeaBFLf9X7Klgo7UiKG+xlIfYnjbNJrfkFLiW7Fw3GJuxs2kg5hu+J1pSh5MunFAFn7OSWsLtQVUu2QMrf4yVov2vhPn9rHi9M6IB14NelHRNob5U+zzW69eENPMU+p0Ka8nH0XaPbRM0VqnRvOXCJMldhDQZdu/BSjGjGBdtMEfm44hyMlvznBOGzuhV81eOOpbxnGuqBq5xp2nPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YefPquUuTerPzTVFq5cHiZkgFAW2/I3NZTdNol42vo=;
 b=TNCQA7sKcpoDvj0Gw2ySdulFKHm5pPXY+caiUF2N9MuoHddZM+/BcDGFwrmumK/dQPbkUV/qkdVwBPkfUsAZjM1+b2EAXWcJZ7FCCixSvKpvQRHGomKHTyEK620nkWmO2cw1oBI7gcEXWLYNtVUlVzdLynu9IGeiMF2c2Gf4dkid3KIeFD/j1VcKbKyY/y4GOQFNWoTONeGvUdgRfmA20B+a57fhwg/yaLINfiBlYkNYBj1Rjx21rDGlzE30l/0Vpa8XmNa8IWR3jMIAt63LmewlUGuMWtJYvJ2H+E3WCgQO9Y7wfldjyC9xZOZG9n01EErAqE5LyLRBITzI+J+TuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YefPquUuTerPzTVFq5cHiZkgFAW2/I3NZTdNol42vo=;
 b=jtpF7AbyOniF+jPcjMUFnGnC9OdFNpjaw97xFxfkYmhCtWogJYWq9HobThxkrYQWhCW9x/m35nUYi9U6UZz/v80NaO4SaWrwU9F197krdR4T4LiDgBgGAN7FCplXQ3GrgWotWz9qc713BF6W3tI30FsS4oqkrm3cBf11c6VXbaQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Tue, 16 Jun
 2020 11:06:03 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 11:06:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Arpad Kun <kun@arpad.me>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Running multiple gadgets in mass storage mode?
Thread-Topic: Running multiple gadgets in mass storage mode?
Thread-Index: AQHWQ2mUKy0QHbjt0kavQMZ0+floeKjbFYmA
Date:   Tue, 16 Jun 2020 11:06:03 +0000
Message-ID: <20200616110626.GA20515@b29397-desktop>
References: <8A08E690-674B-413C-BBC2-0B6A6B170871@arpad.me>
In-Reply-To: <8A08E690-674B-413C-BBC2-0B6A6B170871@arpad.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arpad.me; dkim=none (message not signed)
 header.d=none;arpad.me; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d72fad0f-9adc-41d7-925b-08d811e54254
x-ms-traffictypediagnostic: AM7PR04MB7013:
x-microsoft-antispam-prvs: <AM7PR04MB7013B0F5FAED94FDDC6A11F28B9D0@AM7PR04MB7013.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oQ4cj0emlCJf7C0hAMQLyKpi1jyM0+lNSFOps/VBzY8dKujzr4QEjDJM3Z9uxO/GgzSwSb0d2H+2Y7UliQpG4l/fGHuNpxqu1eq7vt9YHfWi1as0rDzl/0buccXvvqLovIWXFX7XPXZtfcd3jW2pxQ0Awxex1LJWrDoJPaTgBioCL5bQyFC0iU+hpc2E4rrM5aWbpxs47DBjrXPCCBEytYhoZyQhF4CIVBCDWeBRMhUX54fVOLf2ItPTbfMVkkZA8Hau7VD26UWvG+mJiHKzRPF/Tnw03K84XdmJxRPvkSLp03UzbJ6oDhCntdK1w6kOmG5rm+1lnkjTw2Y5xCVQrwDEw3Lgl3UOLV1WUc9XYsDg5bhAgqRCaVrZyhlXFa3YZ96W34e0/+ja3qsYRNfQpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(376002)(366004)(136003)(346002)(39860400002)(396003)(8676002)(2906002)(1076003)(66446008)(6512007)(64756008)(9686003)(316002)(6506007)(45080400002)(478600001)(86362001)(33656002)(8936002)(76116006)(91956017)(66556008)(66946007)(33716001)(6486002)(44832011)(83380400001)(4326008)(71200400001)(66476007)(186003)(26005)(5660300002)(53546011)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EpC+Uxu77uF+kxIlfpN9cWzB8+UpV1C3Z1jXE22tFCplXpH5y3LUjZFjPqQAiQByPVP0GECFhz9K4ANz/oOsiPgQRYwgMmyk5kaAOjFPW1QjGerwx2fqYdau7iZR00DeHzSK7dzNMPYOeGmHyiRTdeIul0YLz1K+zbYN58CCOIqkdfTxZi5WQR3OXBVycR8capfhKZzySUdFdjnpZl0e3vXjGWA9X6RwdV2vKCQlBC2xO2leQXXWWXW5J5xD2ecV8hoGHUaUCeL/SeIz4V8fdV32tTl9JbxGxKiTeHNgsU3pNj07g4abxGzh4+8YKDMjGnj5Z0vldaxSO6wZ417ADdKsQdIrEW2Px1I8cnUJKpp+88i2Ly1J+XtBfWOBi+cack6DM0nvxGVtObmyKa6lQ20p/uwMdkDq+8yKrK6K8aZrLeHh4ok/Xqt+q3lHFC9HdC8vjpNRn1MmuY6atMp8TNCdkpYOgHb1OpVsYd4CNX8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB40C7C361BB7146B36173E7119A0409@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72fad0f-9adc-41d7-925b-08d811e54254
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 11:06:03.0638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdBXUpsOAkp219q+nE3a8q5v9sFX6sjaPV9yjlBS5Ip46mCTCBPF2Wf2TSQdaynPeb83utmT8BFgIPuZnAuNMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-06-15 16:06:12, Arpad Kun wrote:
> Hi Everyone,
>=20
> Seeking advice please on:   if it was possible to run multiple USB device=
s within the same Linux system in device mode and use g_mass_storage to emu=
late different "volumes" through each.
>=20
> This is how far I got:
> 	- Have two  USB3380-EVB  boards hooked up in a Linux machine (x86)
> 	- I see both of them via `lspci`, net2280 module runs them.
>=20
> 		# lspci -nn |grep 3380
> 		04:00.0 USB controller [0c03]: PLX Technology, Inc. Device [10b5:3380] =
(rev ab)
> 		65:00.0 USB controller [0c03]: PLX Technology, Inc. Device [10b5:3380] =
(rev ab)
>=20
>=20
> 	- Loading the `g_mass_storage` to allow me to "insert" an image to to em=
ulate:
>=20
> 		# modprobe g_mass_storage removable=3Dy stall=3D0 nofua=3D1
> 		# find /sys/ -name "*gadget*"=20
> 		[...]
> 		/sys/devices/pci0000:64/0000:64:00.0/0000:65:00.0/gadget
> 		/sys/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/gadget
>=20
>=20
> 	- But when I look at sysfs, only one of them has `lun0/file` that I can =
echo into:
>=20
> 		# ls -1 /sys/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/gadget
> 		lun0   <--- lun0 is here, looks good
> 		power
> 		suspended
> 		uevent
>=20
> 		# ls -1 /sys/devices/pci0000:64/0000:64:00.0/0000:65:00.0/gadget
> 		power
> 		uevent
> 		<-- lun0 is missing :(
>=20
> 	- The following works for one image, but I am trying to insert an anothe=
r image to through the other controller:
>=20
> 		echo "/home/test.img" > /sys/devices/pci0000:00/0000:00:1c.5/0000:04:00=
.0/gadget/lun0/file
>=20
>=20
> In the kernel documentation I found the following in the USB Controller D=
river section:  "The controller driver can support any number of different =
gadget drivers, but only one of them can be used at a time."
> It was not clear whether it means one driver at a time or one controller =
at a time.  (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Fdriver-api%2Fusb%2Fgadget.html=
&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Ca4bb128d95ee4dd9a99708d81180b5=
e3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637278591787761356&amp;sdat=
a=3Duief9JhZbeV693ROZL2Oa4NbX4o5mFV8cqYucj9PcpU%3D&amp;reserved=3D0)
>=20
> Questions please:
> - Is there something I missed or oversee?

modprobe gadget module is legacy way, please use configfs:
Documentation/usb/gadget_configfs.rst

> - Would you have any suggestions how to make it work? Is it possible?

It should be possible. You could bind any UDCs to any gadget drivers,
For your case, you need to create
/sys/kernel/config/usb_gadget/g1
/sys/kernel/config/usb_gadget/g2

For your two UDCs.

--=20

Thanks,
Peter Chen=
