Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A512E0436
	for <lists+linux-usb@lfdr.de>; Tue, 22 Dec 2020 03:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgLVCDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 21:03:34 -0500
Received: from mail-eopbgr80050.outbound.protection.outlook.com ([40.107.8.50]:62347
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726039AbgLVCDd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Dec 2020 21:03:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdsAOJpOLcUh9zN7I2LesbWNJRKcy517yBEIEqxtbb3TJUEN3TMaFp6JrvivLlRtKwnu1tS64U8HG7N+9wbMLz9eEgkGtAeS9TmDHgVflJAuAhANSWnZNTmvarxABeF7BNAAT3h3c+LufdMzXE7nbZH0TYzpyJWki+8mQM+YysJbgZ6kyPqaaVjib90litiApTNL0s5KeP58A9cj+uvjf5TiWOCSTG/5TRQIUTXdQr5xXI+Uvcs7ibNk+fkh4EnQyoy1Aiox7+MGIbnlYrTPtvotBYK79PuutuI/bBKyS8GhsP3ECvcgPDB91+MT1+mHKM11tE90m86dySHfGviXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuZTjZ9PR1fj2kmAYT2RHAn4vCEOX2x7cbE8UOE199Q=;
 b=lxuE6KyPLpt4lLUiHvzLKsaZ/czIlrrR6WMFsEHTvcU4CQAyLz34OOnnYEMxE5vlM2CDn16xRe3uhGC8K5N1SRMMnWQkJ4iu/Z+cZfoNtJ8x/fUeElW5VUWrCn970iQUXogsNHu2lFbgmP1ys7gKcbUgNmtBrrOiqNQPSte60owJct4HpFeZxGwYIKohet5eQswxRc16fPZd+do0d56CFNG7iHPSwJRRFOCGo+4Zj/vp8tORBuCfMmWAzqzioYc1f4dSFeUcuGYV+LR5VEIij16hf13TpgH13YcrwyYE8X0IM756ttJOfxo9QItw6LCMvSAWWgtNovmNRWWeHgWCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuZTjZ9PR1fj2kmAYT2RHAn4vCEOX2x7cbE8UOE199Q=;
 b=sNjoUwWlV1owyWBghY/p9LUdQRpAbkPUWqcyFh6EAtmaBlXawfE36sz+rU+McldiNomcBqQMtAU4NbG7CvjWP8o+gcAb6qQ4ZvaZhWL01a9zWGnMq86hSAKC4kuGE1ul/OY2PUrn30umftAlzl3Jx5TXPUbAUhI1zRoIomfY8cU=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Tue, 22 Dec
 2020 02:02:44 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 02:02:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Frank Li <frank.li@nxp.com>
Subject: Re: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/gADLuWAAABrJAAACaqS0AAMvjqAABcODYAAGxk9AADl/N8AABapLIAAFCFrgA==
Date:   Tue, 22 Dec 2020 02:02:44 +0000
Message-ID: <20201222020215.GA4706@b29397-desktop>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
 <20201216025549.GA5595@b29397-desktop>
 <20201216155144.GA238371@rowland.harvard.edu>
 <20201221053659.GA26433@b29397-desktop>
 <20201221162551.GB436749@rowland.harvard.edu>
In-Reply-To: <20201221162551.GB436749@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 97f6a063-3cce-4ad8-3137-08d8a61dac48
x-ms-traffictypediagnostic: DB8PR04MB6858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB685808F962C69C2213CA36608BDF0@DB8PR04MB6858.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1wyFvFm2WcVl+kD+v21dbMn99qSGeEAXVDIlnEHgMPkmYriIjVosKnnj4rPmnqRph/33SdwgO0u07y+1E/WPNvOvQmDqHA5AOrt4Q8IH8inx3BPAO5V11PatSmvvrFMtPp13DMFYfo3n91L6pV1FujuZ48G4Wv1LaSYzsw8/p+Ky0A1J1sgN5JrxqAmW88QHtAIs/DR/1lAzps/f1j/+vJYmhyESuUVdUxGAY89iBzkIKbtetqKCAhGIfnOehz3Z00DCO3vNULeOIRV8ArErJZF5CQhqemBQMDqpwZxLC3yScyWnfzJA39BFY9atzj62FmuGNmkstUHz4/+uzG6MalF5sZ/pwRvrLL/9MPeTbclmnqDQbgFtxF/WOUHOYgPXUxlL4fI8s6xQC8Uo688ecg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(83380400001)(8936002)(53546011)(71200400001)(33716001)(44832011)(4326008)(86362001)(2906002)(6916009)(6512007)(66446008)(66946007)(64756008)(6506007)(66556008)(316002)(33656002)(66476007)(76116006)(26005)(54906003)(9686003)(91956017)(6486002)(186003)(1076003)(478600001)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IDsnvB7uxx6PBpKYiqDjCIWjHfxXnHhPKmYVx/4Ca6FlLrXHQCLMFdYyU8O+?=
 =?us-ascii?Q?X/UJL8MOClh9ufTpx593FB4zq5okpLe3UVZmAyWab4BQsgxG6tDWqkCAYnOE?=
 =?us-ascii?Q?a/MXv3o48dYsl/1hL7wnX8FrqdsqqyzkA/km1HbfAhEFdT+/2hI7wLU+yhZN?=
 =?us-ascii?Q?epEgPfqxoI5DVb+XfhGqhwWEoWWXoq0N1ROXK41wR2PH577aUYWNqHVFNF0N?=
 =?us-ascii?Q?spF0rznEClK8OY8uWIzgMW1KRzBQLgWZcmw3WZcdLMuqa7MjEmc/TNNjI11O?=
 =?us-ascii?Q?oAdAVwYAbYO/Mq2v9054L/f0JhkjeGMVUzLe2ZYWxfW8Riwrc7whRKxiHTlk?=
 =?us-ascii?Q?GNsiXPKz8A99ym+BvLqjV39B+QDt9F+B3SpEB0RBkSUsCIhU0iN7Z17SjOmf?=
 =?us-ascii?Q?IngZMmCpdsuWrF0Kvck/RUA0nvySRu8mKtaUsHwMcO4Lg66WpvhQ0DXeOIum?=
 =?us-ascii?Q?3/h3S30K3DRQh0/jwWZRJK6ZgBbCeoH3IElZCkYIxmhxdz51EORf8pKv3S+F?=
 =?us-ascii?Q?xWnMhy6JcSc0lg35HvFTxvX4ZoQUefEuhIvhT6YEkXFC8Ib8CPQBHoHn+Bbn?=
 =?us-ascii?Q?uSEWVufWUKz6n05+CeuIf0frC2UYQw0GXxEL508UhGEHowc+/8iyQFLgRkYF?=
 =?us-ascii?Q?xfsGzzldpGy/cIfeZM8LznBujhFW9PowQDv2bF0aYe5EI3wZ2r9MIWTBZ/ui?=
 =?us-ascii?Q?MDFABzlF/2MMdA68A1mGKmfGXak+YkXtxW/rY9xK3WQopIc+UUuxVsa0ItUl?=
 =?us-ascii?Q?LWXKl7ZmPZad3rJMsyMmvrIihm9eoGca/yQC6nWsy50yvxEsPKGji9hjfKMj?=
 =?us-ascii?Q?u2cndrWrSSITHxV2xgAMOO5Y28JXGJtTxqILrnNrWsWILle+Olv2wsqdXlWE?=
 =?us-ascii?Q?htUwpjRP+hJRpo4vD5ABBqX2MhnMs4jYi951svNu7nDPDzDBdAzcp3ukm54K?=
 =?us-ascii?Q?b986m16iuI5b/IJ3q5x15hxo1DibttoP//A0BN7QI1yA13j1neZamXmjYWPu?=
 =?us-ascii?Q?bNWh?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37275F103AB45749A5EC620CE3F20928@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f6a063-3cce-4ad8-3137-08d8a61dac48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 02:02:44.6474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjgR6P2fjJ/zsPX6LCY04sqE+H5ZLTU/a5WtsDdeysuJnMr11VxkgufzItEsYfu/IFU7AcqvGgfEacE8Y6ENdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-21 11:25:51, Alan Stern wrote:
> On Mon, Dec 21, 2020 at 05:37:29AM +0000, Peter Chen wrote:
> > On 20-12-16 10:51:44, Alan Stern wrote:
> > > On Wed, Dec 16, 2020 at 02:56:20AM +0000, Peter Chen wrote:
> > > > On 20-12-15 10:55:41, Alan Stern wrote:
> > > > > You've got the general idea.
> > > > >=20
> > > > > Normally ports are owned by the hub driver.  If one of them loses=
 power=20
> > > > > for some reason (for example, the user turns it off), the hub dri=
ver=20
> > > > > will turn the power back on.  This is because the hub driver want=
s=20
> > > > > ports to be powered at all times unless they are in runtime suspe=
nd.
> > > > >=20
> > > > > The way to prevent the hub driver from managing the port power is=
 to=20
> > > > > claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT i=
octl. =20
> > > > > Also, when that is done, the kernel wno't try to manage a device=
=20
> > > > > attached to the port -- that is, the kernel won't automatically i=
nstall=20
> > > > > a configuration for a new device and it won't try to probe driver=
s for=20
> > > > > the device's interfaces if the user installs a config.
> > > > >=20
> > > >=20
> > > > Alan, we have several use cases for power switchable HUB, one of th=
e use
> > > > cases is USB port is managed by kernel (eg, needs mass storage
> > > > class), but needs to toggle port power, is it reasonable we add a s=
ysfs
> > > > entry to support it?
> > >=20
> > > Can you give more information about your use cases?  After all, if th=
e=20
> > > port power is turned off then the port can't possibly handle=20
> > > mass-storage devices -- or anything else.
> >=20
> > Sorry, Alan. Due to holiday season, the U.S team doesn't reply me the
> > use case. I think the basic use cases are emulate the hot-plug test for
> > USB devices, the USB devices could be Flash Drive on market or DUT (Dev=
ice
> > Under test) for the same controller works at device mode. Assume one
> > typical test case:
> >=20
> > Plug in Flash Drive at port 1-1.1 during the boots up:
> >=20
> > while (1) {
> > - Check Flash Drive is there (eg, cat /proc/partitions)
> > - Turn port 1 at 1-1 off
> > - Check Flash Drive is gone
> > - Turn port 1 at 1-1 on
> > }
>=20
> Okay.  This can be done as follows:
>=20
> while (1) {
> - Check Flash Drive is there (eg, cat /proc/partitions)
> - Claim port 1 on 1-1
> - Turn port 1 at 1-1 off
> - Check Flash Drive is gone
> - Release port 1 on 1-1
> - Turn port 1 at 1-1 on
> - Delay for 10 seconds (time for device probing)
> }
>=20
>=20
> > > On the other hand, if the port is managed by the kernel then the kern=
el=20
> > > (not the user) should be responsible for deciding whether or not to=20
> > > turn off the port's power.
> > >=20
> > > If there's some real reason for turning the port power off for an=20
> > > extended period of time, the user can claim the port and turn off the=
=20
> > > power.  Then later on, the user can release the port and turn the pow=
er=20
> > > back on.
> > >=20
> >=20
> > Yes, I think this is one of the use cases. We want power power control
> > at one application (A), but different with our test application(B), it =
means
> > if the user claims the port, and power off using A, then the A will end=
.
> > After the B finished running, A runs again for power on, but at this ti=
me,
> > the port owner has changed.
>=20
> Yes, that won't work.  If you want to keep the port power turned off=20
> then you have to keep the usbfs device file open -- which means your=20
> program A must not end and then restart.
>=20
> (Acutally, I'm not certain about that.  If you claim a port, turn off=20
> its power, and then release the port, I don't remember whether the hub=20
> driver will then turn the power back on right away.  It might not. =20
> But in any case, it isn't good programming to release a port without=20
> turning its power back on.)
>=20
> Can A be rewritten so that it doesn't end when B is running?
>=20

Of course. I think the similar use case like below:

Program A (Port power control program)

while (1) {
	- Wait "turn off" command;
	- Claim requested port;
	- Turn off requested port;
	- Wait "turn on" command;
	- Turn on requested port
	- Release requested port;
};

Program B actually is a script:

{
while [ "$i" -lt 10000 ];
do
- Check Flash Drive is there (eg, cat /proc/partitions);
- Send "turn off" command;
- Wait 5 seconds, and check if Flash Drive has gone;
- Send "turn on" command;
- i=3D`expr $i + 1`;
done
terminate program A;
};

I need to find communication solution between program A and script B.
Or would you have any suggestions to design such kinds of test case?

--=20

Thanks,
Peter Chen=
