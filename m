Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCBF2945D2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 02:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439532AbgJUAQQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 20:16:16 -0400
Received: from mail-eopbgr10054.outbound.protection.outlook.com ([40.107.1.54]:40159
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2439515AbgJUAQQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 20:16:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm3UYSCHAqWWYagmwCJygKHqFl1Io1vozFxjCAvTtQZZyBN6Is41GXqw7tlmOTJ3xy3XMTeDGsvYbSqoS2WmmcigoX7UFNFCepvl400V3JaQfWa62UHSYrPmk9V8+zsdQtKqdn8AkY1g5p7DN5VmdT5ihvghpHf9rQfxgG6pr/zzW9QU1C8+rGuwACUq51CYr5XWO1EYWablh81m4M8tBbFZgnUGsQ5uOWXEFo+NxsNwJ8IPVVUAx+XU9oQBGjfdxxrkc8ghL3P8q5Gyaq9MtaIWMigjxl/2+SqljDqvLRkmJT7bs485K5iu+Kmk4yVF5T2/hlzLkIbUTS4mLDnGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j7IxDzrSTuHT6AjSpya2JA0YXMW2BfRQmtE674QTIc=;
 b=ZurizO8/g8EIatQvO/1GXCJWLzcC5586/xGMIa8FDuJfls4yiZi3JgFPVLwgm4HXUN6cHxoPBUZPRHgni5SFTrv9Szw8uiEfZho9nJArYDSUQT33iG5ieLHDDmoGSu4n8yXkouv/y6uXq5qWR8LIHqm3smlHm0vr9nt0je32RHWCWSs+rK49W91pl5Uxyeh5L9bnoBMtUwsjDEEspRQulg6GLzy2ponzXWslE41FoXSwhhXI7unR/WHSstoIE3TGq1wMTo9e1RrzeCxg1tCFhDLxVYNivC1XeL1K0FoiJYhnUFlBMbUI2ag+MBKYu/SJVm2huqQKngGOAPVVpknzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j7IxDzrSTuHT6AjSpya2JA0YXMW2BfRQmtE674QTIc=;
 b=JSbzlXQZyDmH1heOR4UUmhnsGv7WoeKPoCO8HLNgFAh5zLsFus41DnwTqJWd8iZmk4vREh/c+36h/SH8n4anNISarvxdB5tIKHiuwy/JlAtwINR2qNZGTaJ3ul1DCa2UUaJoRFJ3Xp9C2RiGr1mP4f6V/CIwj3hwEtBeszxOPYA=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4803.eurprd04.prod.outlook.com (2603:10a6:208:c7::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 00:16:05 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 00:16:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Topic: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Index: AQHWpfeqzYLPux/yckakQge4yJtm56mgAeUAgAB0tACAALwSAA==
Date:   Wed, 21 Oct 2020 00:16:05 +0000
Message-ID: <20201021001538.GA26381@b29397-desktop>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-3-git-send-email-jun.li@nxp.com>
 <20201020060448.GA29717@b29397-desktop>
 <VE1PR04MB65285BE4972D3C7EB36E27D4891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB65285BE4972D3C7EB36E27D4891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db2881a4-b010-4043-65bb-08d87556807c
x-ms-traffictypediagnostic: AM0PR04MB4803:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB48032A0DC81C08FF0AF6C3088B1C0@AM0PR04MB4803.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g0zBE+wd+Noj/qKwRltdtzriKihj4GJKgGyA084/ZNCp9tan95dGgRVpuB/HB5qZILZUMRS1+KRgiTrUx4ZFFurBL8E4/eDUeALej2cgvTVEpBW74SvFzN9ujcb1NXGqU1G0PP7KLqcbUjk35hTNgybvvB5bgPVtpZL3Ih84tPaQV9VpjPcqBt4hCqiMY92tKbEj7DUOoZ++4SPT5wrWui4yl3dVAvxYXtkEMzb5zWXXHgwfhqu6SWT4Fp7fOkrnntTV1FlxSBQLCYnk+sM3tAF4UpQp/AbT41Czdf+fskCMVvVI78GaXFgcz1O5YMCLhBzcOYlEWV7ay+tTOjxc9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(26005)(64756008)(66476007)(186003)(2906002)(53546011)(66556008)(33656002)(7416002)(6486002)(83380400001)(8676002)(4326008)(44832011)(66946007)(6862004)(33716001)(71200400001)(316002)(478600001)(76116006)(66446008)(91956017)(6512007)(54906003)(9686003)(1076003)(5660300002)(86362001)(6506007)(8936002)(6636002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xe/NU1jppNPOknNrA73vCqeSRif5jUVdWBK61EeDMSmM/UcwcjU9yj7kBizgswUG3zzd+JagGKuepyBzkx/YVjhuE+MqwdfHd6wE14liMPgc7+6lmttcb7WgHKFd8GJprXNObd5dHKNzq8M10gT6V8Z7fG2gGz0YkgpDMEJkpD/wKFzjp3Z1r7kHeM/H9C7INQOXkrqgYNVbODFUjD9pDcnp7NKLZXI5HMFbnYheaBDAACC2zqpDAb+7qdCoEa9cIr+9U/L7w6ikrU2RmruU+jAMvVuun3Dt/w4GVYdhZ2P0fDP7kgbq13Sfr4RXbRrJozxqtVmACnjvoY/FcdzxJZ6Z51sKTvsQfythg8buFEwnO913VAHLjgbPayEY0l3/8kPFHy2HSoatoJCt0vBmWHAjYWAuQoWTSoMDQIydWInq2hrTnBLUdKr67F6TYPhSUF68Em4cSQaYjZfq3zTTSLundYdh6AE2DXAbp16khRFIJQKDrEAgnmAhBxCqaGPSIsYoPtuWl+h29lpBoQ6srKfehbU2ffvUsJitqOfbN76UhPJiLMW0dxhdkRxjfsD84X82HDqZq+MLMtOj6jdWolPjm8Ho4iY/TKRJEI0Dx/zbr7jQxL9Q3JXjmR/rLcqSvFMhlx07sd5J/2/JLoc+CA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7C6658DB6FDB84AA5E579DF1A8E5503@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2881a4-b010-4043-65bb-08d87556807c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 00:16:05.5501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cP7wim3GGCJ1P861w670R0fJ0NkPAJrVMs/qj1yRUu2rn/39W4rUEKhah82BZkdfdbvfuA8e4WHSk2aO1QZu2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4803
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-20 13:02:30, Jun Li wrote:
>=20
>=20
> > -----Original Message-----
> > From: Peter Chen <peter.chen@nxp.com>
> > Sent: Tuesday, October 20, 2020 2:05 PM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> > rafael@kernel.org; gregkh@linuxfoundation.org;
> > andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> > lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> > dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> > laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible" property =
for
> > switch match
> >=20
> > On 20-10-19 17:03:14, Li Jun wrote:
> > > For those need a dedicated typec switch simple solution driver, use
> > > compatible property for matching.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > > New patch for v4.
> > >
> > >  drivers/usb/typec/mux.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c index
> > > 52ad277..3da17d1 100644
> > > --- a/drivers/usb/typec/mux.c
> > > +++ b/drivers/usb/typec/mux.c
> > > @@ -39,7 +39,8 @@ static void *typec_switch_match(struct
> > > device_connection *con, int ep,  {
> > >  	struct device *dev;
> > >
> > > -	if (con->id && !fwnode_property_present(con->fwnode, con->id))
> > > +	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> > > +		       !fwnode_property_present(con->fwnode, con->id))
> > >  		return NULL;
> >=20
> > If property is not present, should not fwnode_is_compatible return NULL=
?
>=20
> Do you want to say:
>=20
> If property is not present, should not *typec_switch_match* return NULL?

If fwnode_is_compatible returns true, it should mean the fwnode_property_pr=
esent is
true too. But if fwnode_is_compatible is false, the fwnode_property_present=
 may return
true, the code does not return NULL. Then, with this new patch, what change=
s compared
to original logic?

Peter

> >=20
> > >
> > >  	dev =3D class_find_device(&typec_mux_class, NULL, con->fwnode, @@
> > > -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct
> > > fwnode_handle *fwnode)  {
> > >  	struct typec_switch *sw;
> > >
> > > -	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch", N=
ULL,
> > > -					  typec_switch_match);
> > > +	sw =3D fwnode_connection_find_match(fwnode, "typec-orientation-swit=
ch",
> > > +					  NULL, typec_switch_match);
> > >  	if (!IS_ERR_OR_NULL(sw))
> > >  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> > >
> > > --
> > > 2.7.4
> > >
> >=20
> > --
> >=20
> > Thanks,
> > Peter Chen

--=20

Thanks,
Peter Chen=
