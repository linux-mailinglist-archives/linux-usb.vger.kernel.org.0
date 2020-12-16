Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F062DB97F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Dec 2020 03:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgLPC5L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 21:57:11 -0500
Received: from mail-eopbgr40078.outbound.protection.outlook.com ([40.107.4.78]:27109
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725710AbgLPC5K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Dec 2020 21:57:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJz/1yrbQxuS4Bv4FeQPEG9TladjfxRQTzvh60KnHVk1KS+Oq1uUOcMOv6eUzec9t8RDXtvG8UlZOnlRC7EYFIOvKnAfQyL+D9ovSxsYdLXEdtroRIYS85GWt1o09HGq2triouV6G25yhl/DmQ/kqLDdlPxS4tSaUMvw4nTJAWP7lXCx2trcAuAvZbiZf3tTUFRAnw5NVYRSrkFjsLL/w2T3L8wt1IOQ4vgKb6Mj9G6r2d1/7+GUHPtopm8RbiqzXHB/j3e9sBA9Y6NSGbQz6VtKS/wAW9dpU7z0nG1k7LfHqfkHQ3GSmTiSAs3R7epX82v8AE9BfvUmNDYZEsMKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axre+pqG8ue0G/wHUDPsNNTizfaGYVlJHSjMxDgE4no=;
 b=PKL7rZrbOI/R5NdqAqNMnyaC1xRJ65iSgMkQaWpiK3SQzEFIZSb4kcNbHvensYcRDT6b3W+eVaYN05+IRaPLucmYN9HGGZnr7NS31K5zIWWVLnQlBsEAlbHMeE0xVWzAFUDTPrXn7gCWU1vBTfRGI/d8FBYbLNF3hpubpIH97NtaxVcmSWCT1/ZceMxRcAWmVWLquoQ7g98ZgEfNRpJXv/o9LgTH8nQ2Xz948atIW16UeapdGu+aYkziRp5BX+zVtJva7uxmVupI3eY1mtxrg+hbijLcMy62+F1XFWxX2k94Qjta7T0NYTf/oFgUyvJYr6ThIJI4Dymop32HFZn26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axre+pqG8ue0G/wHUDPsNNTizfaGYVlJHSjMxDgE4no=;
 b=IWtF52fleT1Ve2pnmSjIGBXf7J2CY1ByiavydJrhSpafranr0ap4IMkKY2CzCaKl+FWWyM/pM/KUUbYrdyrNDHS2rqdZRc8JUQ0Q3dBQmOQwLH8x3lP9bqEQfWm2D0yk9SqFRKAtXySOZ72D7KumI6slAbQy8jd6kXmSip+PjDM=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7050.eurprd04.prod.outlook.com (2603:10a6:10:129::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 16 Dec
 2020 02:56:20 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Wed, 16 Dec 2020
 02:56:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Jun Li <lijun.kernel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/gADLuWAAABrJAAACaqS0AAMvjqAABcODYA=
Date:   Wed, 16 Dec 2020 02:56:20 +0000
Message-ID: <20201216025549.GA5595@b29397-desktop>
References: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <CAKgpwJXMFSHxi7vE5cOxkYPTnY74oB-SKf3FikerCzFDLYqcbw@mail.gmail.com>
 <20201215051402.GC2142@b29397-desktop>
 <DBBPR04MB79790C8D243173467AE94D4E8BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <20201215155541.GA195633@rowland.harvard.edu>
In-Reply-To: <20201215155541.GA195633@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: a3ba0042-9076-42b7-68bb-08d8a16e2a98
x-ms-traffictypediagnostic: DB8PR04MB7050:
x-microsoft-antispam-prvs: <DB8PR04MB70509559F0840DE1EA2C1AB48BC50@DB8PR04MB7050.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bNvT8SjKkmLED3fHhGdbGyf/wyfFJAbeekHfSJhKgRqS2GfpxQLFb9qnNpRwJdH7T15xyxSdMauat4V7gZfxWLwJwt+e8AYDlOBo/TsP1csLZxL82ghTTbgiCIaSKn5bcpxfjkfsQLlcz84Si+zgde39eairfct9862izepanByVAJoIuyp3tgO1fxXwwPTCz4TRFCYPcBPwkj0lNI41Z8Y752TuA+uhq1+1eqe5jg239mprqc3JEdS6VyTNQA1UjKWjLTBsNsfFGh1YCA6ZGIzltw/PS3pXqNTN99UI1GNm6Vk7XVk2wIEUg0ShyTvbYnQWpGuZmOcYSJx2jNM0JIwBkTkD229VysDixe4H7lW+eBmnNU3M4VtI2YOpV6T+4+v/ZLETfHHOdW6yzQ5i3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(54906003)(33716001)(5660300002)(8936002)(33656002)(478600001)(6486002)(76116006)(71200400001)(83380400001)(45080400002)(91956017)(53546011)(9686003)(66556008)(86362001)(8676002)(2906002)(66446008)(26005)(6506007)(44832011)(6512007)(316002)(66946007)(64756008)(66476007)(6916009)(4326008)(1076003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ksUYSIMePlbJ3e07uBS1DHxroL+3i5DbbIgOjME4Sqq581KzUlYDSL5xNNUs?=
 =?us-ascii?Q?AWd91sxeL2RwHVF/vk5dnBG1B6AND2YzfgwTZQ1Gyz/7lVsef6SsnSJc+PAY?=
 =?us-ascii?Q?rHm6aZj6kyC3bX/hXoMHrqriWXgVnx6w3oC3AnvuKmpXT2RVDQp0qSTulbvx?=
 =?us-ascii?Q?fyPBceGmlv1yUeN/1bOAQd1J+vaXp1OGx7CaYDxJtbaXYmbmUiKOYyDBgbr3?=
 =?us-ascii?Q?StMpIOKsOqemalvBEUQ9T5cdjQvvQNdwKyL6+lb5OdHCV0nTm8y3sXUZd3E8?=
 =?us-ascii?Q?i+HmFeCR3fWWYVN3GdHU3KR3PYAWfRM9OaPxxwuOfmBD/S5pYeYDz7Sgyv7d?=
 =?us-ascii?Q?vfIlGdSy/JZBAezfyhNBH7q+1fmugkAVZ00WIe4Vza9GlB83pGCyWDSUTff9?=
 =?us-ascii?Q?BQpjBmNHdIhRlOfrqtzo9DAvaT+T7NfBbIqgs6x7LC5Q21cCSdeUSCYOfRYd?=
 =?us-ascii?Q?kEGVR3jJ3nRI/aXeKZtS3j3s7lpVM/uYLuW4hdVppIcW/t9+MMA2/jpK9tIn?=
 =?us-ascii?Q?l6CD3pLm13Bo5e6U904Lsn+ZRFsP8hgWD3pqC+EjL3wJ2Ucff/Zp7diXkLl0?=
 =?us-ascii?Q?qZbEVxzhcBA3LZGeKTOn6aPg7vtROFAIGy4QwAfmq85APRNMjSYL3jf1gCAG?=
 =?us-ascii?Q?QZhiGD4xSXhLSii6YL8irKU3ihBG/mVBJvvt3Nn13isF4myZr3qiA0G5qER9?=
 =?us-ascii?Q?I2jcW3Rqb0XdTuIYYfGxaB7/RGXnShZJr4u5rAA61RrTgfGvj26eXyrMOR8L?=
 =?us-ascii?Q?8inb8YH4F7AqEvnFMKS4fXOzyM2lfKKuFh0AVhqqI5Gsm+hjWy4vpvnYmfG9?=
 =?us-ascii?Q?VvWtxRDY1dKbmGtsBA2YIIms55rqZ6n8NYA5rIQ7tfnpfs+DI7m7Pq8+MDri?=
 =?us-ascii?Q?J/S02OYRohQUJWX5oAvk8lKBSZqZZvFwzKJ0iwLaPr0YRV9b+H6uxKB9rOmq?=
 =?us-ascii?Q?3hWffW8TUbLPEKFlBtMTQbJA5iSYMMvApOWfo5nliWxp4wZIFoMSCuHbt9id?=
 =?us-ascii?Q?y674?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B375B1BD3058A54FBDFCDD5C02124C17@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ba0042-9076-42b7-68bb-08d8a16e2a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 02:56:20.4716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7ZFdzb8fi2jyZYndh4SwwqmTz+cDCWP5aSXME6EKTM6PeWHRLEz9asLdIBe2MhtlRmYCM9enARk2Zq2xOS/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7050
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-15 10:55:41, Alan Stern wrote:
> On Tue, Dec 15, 2020 at 09:57:53AM +0000, Peter Chen wrote:
> > =20
> > > > > Hi Alan,
> > > > >
> > > > > I use one HUB power control application
> > > > >
> > > (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.
> > > com%2Fmvp%2Fuhubctl&amp;data=3D04%7C01%7Cpeter.chen%40nxp.com%7C
> > > 736ece19bc7a430c98b808d8a0b6975c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > > 35%7C0%7C0%7C637436053362151022%7CUnknown%7CTWFpbGZsb3d8eyJ
> > > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > > C1000&amp;sdata=3Dlptf1XO5yeb6lQbAFlKUrZ%2BEX5ATXQRftGwm26WowFA%
> > > 3D&amp;reserved=3D0) to investigate power switchable HUB, and find th=
e kernel
> > > turns port power on again at drivers/usb/core/hub.c, after port power=
 is turned
> > > off by user space.
> > > > >
> > > > > 5122                 if (hub_is_port_power_switchable(hub)
> > > > > 5123                                 && !port_is_power_on(hub,
> > > portstatus)
> > > > > 5124                                 && !port_dev->port_owner)
> > > > > 5125                         set_port_feature(hdev, port1,
> > > USB_PORT_FEAT_POWER);
> > > > >
> > > > > The main sequence for testing turn port power off like below:
> > > > >
> > > > > - uhubctl sends command to turn specifc port (eg, 2-1.4) power of=
f.
> > > > > - devio at kernel gets that command, and send to hub.
> > > > > - port power is off, the hub_event is triggered due to port statu=
s is changed.
> > > > > - usb_disconnect is called, but port power is on again by kernel =
at function
> > > hub_port_connect.
> > > > >
> > > > > I can't find the code history why the port power needs to turn on=
 after
> > > device is disconnected, do you know why?
> > > > > Any sugguestions to fix it? Thanks.
> > > >
> > > > Seems in this case the port need claimed by user app, I am seeing t=
his
> > > > commit
> > > >
> > > > commit fbaecff06a7db4defa899a664fe2758e5161b39d
> > > > Author: Deepak Das <deepakdas.linux@gmail.com>
> > > > Date:   Wed Jan 21 23:39:58 2015 +0530
> > > >
> > > >     usb: core: hub: modify hub reset logic in hub driver
> > > >
> > > >     Currently if port power is turned off by user on hub port
> > > >     using USBDEVFS then port power is turned back ON
> > > >     by hub driver.
> > > >     This commit modifies hub reset logic in hub_port_connect() to p=
revent
> > > >     hub driver from turning back the port power ON if port is not o=
wned
> > > >     by kernel.
> > > >
> > > >     Signed-off-by: Deepak Das <deepakdas.linux@gmail.com>
> > > >     Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > > >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >
> > > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index
> > > > b4bfa3a..3e9c4d4 100644
> > > > --- a/drivers/usb/core/hub.c
> > > > +++ b/drivers/usb/core/hub.c
> > > > @@ -4655,9 +4655,13 @@ static void hub_port_connect(struct usb_hub
> > > > *hub, int port1, u16 portstatus,
> > > >         if (!(portstatus & USB_PORT_STAT_CONNECTION) ||
> > > >                         test_bit(port1, hub->removed_bits)) {
> > > >
> > > > -               /* maybe switch power back on (e.g. root hub was re=
set)
> > > */
> > > > +               /*
> > > > +                * maybe switch power back on (e.g. root hub was re=
set)
> > > > +                * but only if the port isn't owned by someone else=
.
> > > > +                */
> > > >                 if (hub_is_port_power_switchable(hub)
> > > > -                               && !port_is_power_on(hub,
> > > portstatus))
> > > > +                               && !port_is_power_on(hub,
> > > portstatus)
> > > > +                               && !port_dev->port_owner)
> > > >                         set_port_feature(hdev, port1,
> > > > USB_PORT_FEAT_POWER);
> > > >
> > > >                 if (portstatus & USB_PORT_STAT_ENABLE)
> > > >
> > >=20
> > > Yes, I saw this commit. But the port is owned by kernel, the device o=
n the port
> > > could be enumerated by kernel, just the power on the port could be ch=
anged by
> > > user space.
>=20
> You've got the general idea.
>=20
> Normally ports are owned by the hub driver.  If one of them loses power=20
> for some reason (for example, the user turns it off), the hub driver=20
> will turn the power back on.  This is because the hub driver wants=20
> ports to be powered at all times unless they are in runtime suspend.
>=20
> The way to prevent the hub driver from managing the port power is to=20
> claim the port for the user, by issuing the USBDEVFS_CLAIM_PORT ioctl. =20
> Also, when that is done, the kernel wno't try to manage a device=20
> attached to the port -- that is, the kernel won't automatically install=20
> a configuration for a new device and it won't try to probe drivers for=20
> the device's interfaces if the user installs a config.
>=20

Alan, we have several use cases for power switchable HUB, one of the use
cases is USB port is managed by kernel (eg, needs mass storage
class), but needs to toggle port power, is it reasonable we add a sysfs
entry to support it?

--=20

Thanks,
Peter Chen=
