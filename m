Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9242DF8D9
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 06:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgLUFiT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 00:38:19 -0500
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:47877
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725984AbgLUFiT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Dec 2020 00:38:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogqr5JiczfCs05Y1DbzE0lunSooPCXtAVxZIGu2wD2ODMQyujvAYUkeyGeRNQgDwrmzaacA2Yc0/Lry0MeRAKBWqus2Z8fDNcGkG/20WJMQqQP7MjY5+nqMqwcQ0DXmnqATtMvkSHobyqEhoB/ASEg2iYjQsY53Pq6F6bgEiStO48rwEoMgt7n/NMIXIU9Fg+NmCnfyasrFkWdgHPrMHOyP/cPN/L+ar6wtO/QxNMxs5EtFJFcLGr68i37dUFtPIHvTtzXXdWoJ2oUr0DEP45TWHHYv+k8A7/RKg3jEWEAKPLLMZyg5RFjO9lnmJYIHUollXuCnmDNB0FDsry6HyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5uwVLihYlS/Yg3qElQYzlYHy375WIs/SD3AaklSAlY=;
 b=aLIMkIhE4/tIboGuUko71PKdLS4CokqOdDJtHXioLyuFLE2ys1Kx7IPqMM6rLBx37RX/cEDqP/KpBvX/yPUsp7w22fibxFjUq3yi26mrsR8Hc6wTmJR0dY79HkHAbBTmKeodzbKmZK0PFk8AaCTL7TQEUqi6kuP9rPIefB+rM1gui5piJaRMENBB0JnRpPzy1u+wprz1/psDlw7iShdJ1/4qaKJ04u8MTF9PxwRINj2q5x5GzC4yk4TI/SKl2LvNK1RfUuFEoV4Nyu5QEmijOGlPYH6YxTBf9MzA2LyjLKvuKTH6Daa7Tp7TEqPYRiNl9NQ+xriEBexkcWpM/elfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5uwVLihYlS/Yg3qElQYzlYHy375WIs/SD3AaklSAlY=;
 b=goUWde8d5S9+5bGQ42ElYA5T1oeL6FTJEAjc08QMj32dPKZ3dPTiH3jLhIFTT3LId3jNOECk47eYCDQweUgZlcnelr52r9xo07B0Kr/Sw3KCiVv8kthIeHsF1MrKAZ/UIiOrKOJUxO7lELTfa8H7INTK1D0gGFXK/p0D4ERDul8=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Mon, 21 Dec
 2020 05:37:30 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 05:37:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/gADLuWAAABrJAAACaqS0AAMvjqAABcODYAAGxk9AADl/N8A
Date:   Mon, 21 Dec 2020 05:37:29 +0000
Message-ID: <20201221053659.GA26433@b29397-desktop>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
 <20201216025549.GA5595@b29397-desktop>
 <20201216155144.GA238371@rowland.harvard.edu>
In-Reply-To: <20201216155144.GA238371@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bed249ac-6d71-4aeb-2d86-08d8a572822d
x-ms-traffictypediagnostic: DBBPR04MB7563:
x-microsoft-antispam-prvs: <DBBPR04MB75633731730C9F57B04868178BC00@DBBPR04MB7563.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2I4H2Zb3JIbFDaSVLVWG48g2zUgujNoS2C/rBkZx6tw0sYan6Vb4UTwST2gYzRl+MRwSbM2qPRscJ9NeK3UgyMSu85zoKk8NGEw+Ih08kttztBWXvtexECrLHCPPl1tnVR/ectabgo5Iy9VQ+k2Dst6FLQby8NLajeFEo1kHIqhmkEeZrSyZ07fZJiapkHn25Tv2QlRhgcYVDEnaautmevsepzzvAHzUNAc7oVQR5wT1Uwph8TFu+MSu3r4qwGR7lgRZGMytcmWekmzgO8vR07KRbyHfAjaltx+CuHvyAOpSvbsbmWCOlj3axVKLvVq/29f459iVO82ljcizk/l/OKiO6iU+A10ftdyl6QOYhs31ZXjloDtSfRUozosruoB/aqAolq0d1hG9vjbwLxQUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(376002)(346002)(136003)(396003)(66556008)(86362001)(8936002)(6916009)(71200400001)(53546011)(33716001)(54906003)(316002)(4326008)(44832011)(6512007)(9686003)(6506007)(66476007)(83380400001)(76116006)(2906002)(66446008)(6486002)(478600001)(186003)(1076003)(8676002)(91956017)(5660300002)(33656002)(66946007)(26005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ijBNk3EiSMLJdsDx1GNh1Kgv/92cG54AAvtrrk8mif6bFwY728FuG3R+f853?=
 =?us-ascii?Q?ohd4ChlsHjHx/4gaz4UElW5kw5m+8usZNTQ/n0haF9g56FKcXPHWKcRoT9o3?=
 =?us-ascii?Q?knnX5fWlZVI7+ek4DuEQ+pJ0G9C4qbHFdErHNtKLcXNHNd+l/xkDx7iXkyVW?=
 =?us-ascii?Q?NWJuD9Qd2w7EnyxiVmMhUN5h3smPBibi7TxmEc3OkGNEh9bKJNhBgMGcC9H4?=
 =?us-ascii?Q?2HXokScmBR0LUkIx18Pyvh6Xu3RSa1ZzjRkLhqjyJlO9JcgcOUdbIAO1PuUD?=
 =?us-ascii?Q?xuLkVt8G+iNglQTBwSyiJw82wN1rMIfKLOOO70ignKGvNgKYBzLR8+VPR6+X?=
 =?us-ascii?Q?l3hpb263hqW4OnZrQJHYNn0weipttsoE4qRXrMuDWIOblawgJx06kIMLTZ7t?=
 =?us-ascii?Q?io+iiOokcpx2i2PR0Y9BxbJoNmeK0KvKhau6lZ1b9ynREeEsW+Mu85lFHdeO?=
 =?us-ascii?Q?rF3loSSaCZp7fG9Zb2qEl1C+SNYgPzq+fl6U/d9Xt8r8jj/YTTC4D0v6jAIK?=
 =?us-ascii?Q?seB5itcLeRaw6teU05T53LSTMXjb+sh4RXah4uHZ8jOxU4AV2QZ07migZl1k?=
 =?us-ascii?Q?XIPgWmEiWO/sgiK7QcwJAZIo7YS5nhMlwf0SVW/DGRnStwEQsL+gbx81w/sy?=
 =?us-ascii?Q?F9ocYervNsGhpFKDXeVPWlDSzIIEllfvZ65nX+/74/ARCfb2S2e9l1inQKCQ?=
 =?us-ascii?Q?Yhb/yH6M8PHSdmaJXqxe5iFKoKBe+CYETlO4obsZtQxQ3g8mGoaUZvtYaQJY?=
 =?us-ascii?Q?Tq52FenB8kDm/8FgxnDoDHgClUt0SZxSO1kftybVLlzVZjVe9YEhknWwNaDj?=
 =?us-ascii?Q?bvObeSHwZI4gjlySHQylrHEA7JgA8fw2KHyPK4yn/n1Qve4ggEbWb+MEM5kV?=
 =?us-ascii?Q?rIYTCImEZ1CEePogqMOIMePAgWlIGX+/awfnaYlhkqxNydGG0GWCfc7uwizd?=
 =?us-ascii?Q?KQWJ4vKRpNeoXD0N2phmC/ywaSYBtMqLt4PCNLwcHCqgiXXHNwueWLB1sv4M?=
 =?us-ascii?Q?usVK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <97B9CF9C715F844B81834DD8114F304B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed249ac-6d71-4aeb-2d86-08d8a572822d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2020 05:37:29.9230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLPNWNbBOWr//TcmcNnACvYib7hmc9q61VJJjf8IyAe+kp8yGacAwzRNS0/DnGSJ+xmnblfvh+EH9um/CYhSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-16 10:51:44, Alan Stern wrote:
> On Wed, Dec 16, 2020 at 02:56:20AM +0000, Peter Chen wrote:
> > On 20-12-15 10:55:41, Alan Stern wrote:
> > > You've got the general idea.
> > >=20
> > > Normally ports are owned by the hub driver.  If one of them loses pow=
er=20
> > > for some reason (for example, the user turns it off), the hub driver=
=20
> > > will turn the power back on.  This is because the hub driver wants=20
> > > ports to be powered at all times unless they are in runtime suspend.
> > >=20
> > > The way to prevent the hub driver from managing the port power is to=
=20
> > > claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT ioctl=
. =20
> > > Also, when that is done, the kernel wno't try to manage a device=20
> > > attached to the port -- that is, the kernel won't automatically insta=
ll=20
> > > a configuration for a new device and it won't try to probe drivers fo=
r=20
> > > the device's interfaces if the user installs a config.
> > >=20
> >=20
> > Alan, we have several use cases for power switchable HUB, one of the us=
e
> > cases is USB port is managed by kernel (eg, needs mass storage
> > class), but needs to toggle port power, is it reasonable we add a sysfs
> > entry to support it?
>=20
> Can you give more information about your use cases?  After all, if the=20
> port power is turned off then the port can't possibly handle=20
> mass-storage devices -- or anything else.

Sorry, Alan. Due to holiday season, the U.S team doesn't reply me the
use case. I think the basic use cases are emulate the hot-plug test for
USB devices, the USB devices could be Flash Drive on market or DUT (Device
Under test) for the same controller works at device mode. Assume one
typical test case:

Plug in Flash Drive at port 1-1.1 during the boots up:

while (1) {
- Check Flash Drive is there (eg, cat /proc/partitions)
- Turn port 1 at 1-1 off
- Check Flash Drive is gone
- Turn port 1 at 1-1 on
}

>=20
> On the other hand, if the port is managed by the kernel then the kernel=20
> (not the user) should be responsible for deciding whether or not to=20
> turn off the port's power.
>=20
> If there's some real reason for turning the port power off for an=20
> extended period of time, the user can claim the port and turn off the=20
> power.  Then later on, the user can release the port and turn the power=20
> back on.
>=20

Yes, I think this is one of the use cases. We want power power control
at one application (A), but different with our test application(B), it mean=
s
if the user claims the port, and power off using A, then the A will end.
After the B finished running, A runs again for power on, but at this time,
the port owner has changed.

--=20

Thanks,
Peter Chen=
