Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF4938C76C
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 15:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhEUNEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 09:04:38 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:25033
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233708AbhEUNDu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 09:03:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK2M13bZgkFnFdlIeBz+xV/ehs7c03mz/3wfDQU69YMQaBth5forIcLyC/t8OHHa4KsJpEqU7yPCcAkZYGczKmyUXVdmV5tC2iJJl+hw0lJ4ShFTde8DfvnsmyVTPWida55r34n+aR/e71Bq0svOd6pxv9crAl+N55yqLVfXxBgSaFHi2VZX/QYwYSx/go4dS3ssckBgkAN7Q7t0xPwA8Q8BNkjKtWxxQamRiS7WG+3WWNwXsxhudjf3MEGpBU+wwbqAot1cllG5cDCAaCaBP9haKRD29Utw5tWd8CXWjc7FJb3COWp45qWiE07rtMSp7BbqISPocGD6lNG1JBAUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crPwT9AfNgPxybWy1KBCHm7duApsb6N6dZH1S2mOknE=;
 b=LZR/cdaaGDCE4IOs+V08dkDgR5Oaf+7h/ejcUQ+lnP16iBJ9rWojqJrnDuRCSxlXI+a2TjwM1oxEmMJVP7+1ClmWtDum2QHN7fF/ZJ4RBLD9hCjjVqlkdKHxpLmhuGuHFwBZBpX9iy9mVG4D74BIeyAuw1bcd2MRroGsXJIIfk/6ApCxOVVdeh8t2B6QxBbS0A5MbMzKFSKrm9tAaWFIXCNgyuegLGGbL8dlznx5oj/nOsVvluFtAaOOZ1SfXNFHF2sHp2w91tZgsCJuIyiI7PRl7oGkI4gNA8a+WXXzXFKUmXrWJY22xzD5WS33zoeV4P8GObhdRH/CyAVCkF7v0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crPwT9AfNgPxybWy1KBCHm7duApsb6N6dZH1S2mOknE=;
 b=HadqiCuWBwjG5RDaYYV3BUIdeCRu6fP3lWvMiMfqHUr0/itT38nlPJx3JXRUK1rH6WiZfdRVxU+/zhnaIxkE+yfzOvnsjLNlRSOB8L+pq8KWx+ybPFGVnuqe7DVWCQdHoTjm//Jv8G+LZyfIKAj5F8oVgEvbkx6cpD2dmOEqAzg=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5790.eurprd04.prod.outlook.com (2603:10a6:803:e7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.30; Fri, 21 May
 2021 13:02:23 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 13:02:23 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Topic: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Thread-Index: AQHXTIEKNobfiQu7YEKZBxd9HIlDqqrsT64AgAGYWFA=
Date:   Fri, 21 May 2021 13:02:23 +0000
Message-ID: <VI1PR04MB5935E0011B57A2AD018A065489299@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
 <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
In-Reply-To: <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b7184a3-c468-4d98-1a17-08d91c58ad0e
x-ms-traffictypediagnostic: VI1PR04MB5790:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5790BCC56489828C04829F8389299@VI1PR04MB5790.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rjPrf1yQbLA1v4vZ1e4k1usme8xn9+o2XKG834+l83XyISJOOc/KAA+yYg8+nwkUiilps+1JpjWpUMWvljC0sx/xvib82+aJj0ZIxzY9LfZQZ3l202mR8lbDeeWE42xgZOTi4KfuCSNipmBgUrYF/8AknC21TOOjgATWkFVBCq/aILTgQ39HYnLhsTtqhbFvwCJxcxSsF+ceDDX/U0mA+xe8Cv7neFISuWdkD0o3exW6HeZGbqa0KK9GC4Vci/J+NLosV/Os1lonmLB92p4g3zxo83wAq5JX+lR6KnITHYclGPFLaYqYD8+YnV09aNtMUaacyy6AcVq76eYdURixHCq6xvOP2/H6jNe2zaQtfwGkjGm6R4vKpddnkk2JNn0cvhxCsf+CEcl3Cq6NjijiRkUtkS9L0F68wSX0SDuhsJYHCKNnzeVTtLO6N9ndcFqg/fndAYIqpMOdinmNZJ4MhDGf/Mbkc7K8OkzA918LZuOnfwrC2fvJen1osteSVVfduCFoL4avXKaDd2H3+51jWWe0Jbq8FSi/vlmskBPrrWZVTijF4ZPPuf/exs4ShoJd8qB4/RBROYnBP7oY4L+aam2TeKtuqVgECFqRGlGO2n8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(66476007)(83380400001)(54906003)(6916009)(76116006)(66946007)(2906002)(8676002)(316002)(8936002)(66556008)(64756008)(66446008)(5660300002)(26005)(55016002)(33656002)(6506007)(4326008)(86362001)(38100700002)(7696005)(122000001)(53546011)(52536014)(186003)(71200400001)(9686003)(478600001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dVBuwpV82vjpD1JpL5XJM+nnz3R2Lkt9gtCgsTyU2ji3npZK00iE5ksTkYdS?=
 =?us-ascii?Q?USP7BMJitCufhgRmQguJxnZ5O8tLIqrkdrE49QP/c9oTZlCZBh++UXmZvy37?=
 =?us-ascii?Q?vWtFKDwEgE9DotZwiycu032eO5xkr3g8zOJgUIQyvU6fpl4eaeQFVkWaES9J?=
 =?us-ascii?Q?g51MP1qTcvPEdc2Q77B+YweOTIdwZ07DcVVe9dQpyMg/VlzfbdCI0MWS1NMM?=
 =?us-ascii?Q?jkfCAyl/DILLN+5xjpTtPCP9uc8W5bmy1HYSMJNXXK7tSkDQuWUuuO72Uikn?=
 =?us-ascii?Q?BDTJcK5v7Lqu43ejZSTawivvBIiQiPhJdoilGpN5e2ATFPADZ55OGeOCvs9h?=
 =?us-ascii?Q?UyjoQ28i7iVIo5ZCDpjHOxbMypCihL/An0zqBTVy/2t9SFXlAnFaZXBTYDlj?=
 =?us-ascii?Q?5/7vJIA11jmCLTHLcpuk8bY+zLFwhASmn5j4wHbj4GitD+Bt08WNTr9VjhFq?=
 =?us-ascii?Q?jTzvapE5yZEdNpjkkgA+Rj6xy5JibE9KWjPllJrCmUwkzwrBU+MQwPNV1bu4?=
 =?us-ascii?Q?aUG6pzU9S91vmFzB7Uz3IGHRYD1t4Sa0WPcnAedSXAeCDeIBG5uAaxmDQ8Sy?=
 =?us-ascii?Q?WQ18rn5clcxuxeIocPRgUtRzUWZDx7qKB+A9R2HUlr45wqjkrQLaECDrSh+S?=
 =?us-ascii?Q?cljSm4UH73bkNi45ODyhTVrtNZvkuEUHGntfkMoi9T6Ed0sChpwikHZIYY0n?=
 =?us-ascii?Q?zxmJy+E7S0w5IxlhvnOuhZ53gQEkniIBkyl1OxZCWIQlCrBfG9E1sct1420g?=
 =?us-ascii?Q?BLNpcEZLcEho1Z8YEdiqXLH65y8IHoFR1wYutisAw0m+JU5S/nDQq5mkAGd+?=
 =?us-ascii?Q?CnyTDHssYvivpEY/wYdSVzdaAu7pVNBiq1Vv/U2Go+c/HxZVZQLX0JkpxhMC?=
 =?us-ascii?Q?9mcyG6v7w2PgPBwQYBX7pP4EVsA/2+9fYya+5aE8IZlsWp3LAeSN/zM2RWI0?=
 =?us-ascii?Q?hBJD27fAR0zZLzdEwqJThtvwbfLQvjtzZYTyLC+2SnlotcVtS43+vzmQi7x3?=
 =?us-ascii?Q?AOfYonEvSYbnUFWBzPgHgznBHYvqLNqJP4ewrdxB/cxyld4MxwnNedNC/wSH?=
 =?us-ascii?Q?FtA5964ub+1lhmL4T3paCZvApHN2FHx7tQRH5s0YHoZKPwY78HHcZRsgkxsg?=
 =?us-ascii?Q?Z5T9R6ZAv6bx2nisVhciSSfeWpWGxSwVAmyocU8j0AorVR4J4UlEmnQlxp+1?=
 =?us-ascii?Q?0Vrk1dVDvTcPcMPU+usf4ndgQXH1mTSXF0YS7YFh0gzEA5pU2SQf81D6PkGb?=
 =?us-ascii?Q?iQqExk1ZZJi+0m8kjMaJZSzSZ5ox/4tmnn//h300t/7f9tCMNnMQibdDVTFn?=
 =?us-ascii?Q?zNRMTAZYDRy5lHf4Lo/Wu8dq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7184a3-c468-4d98-1a17-08d91c58ad0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 13:02:23.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsh+F+tIZS7u/4sHBjP+FfrDNt/AupgV6Cu68sELK9Ve/J7l/zJ6TcTZL9m7loYQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5790
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, May 20, 2021 8:34 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: robh+dt@kernel.org; shawnguo@kernel.org; gregkh@linuxfoundation.org;
> linux@roeck-us.net; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support
> via mux controller
>=20
> On Wed, May 19, 2021 at 03:14:49PM +0800, Li Jun wrote:
> > Some dedicated mux block can use existing mux controller as a mux
> > provider, typec port as a consumer to select channel for orientation
> > switch, this can be an alternate way to current typec_switch
> > interface.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/usb/typec/class.c     | 26 +++++++++++++++++++++++++-
> >  drivers/usb/typec/class.h     |  2 ++
> >  drivers/usb/typec/mux.c       | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/usb/typec_mux.h |  4 ++++
> >  4 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index a29bf2c32233..1bb0275e6204 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -1601,6 +1601,7 @@ static void typec_release(struct device *dev)
> >  	ida_simple_remove(&typec_index_ida, port->id);
> >  	ida_destroy(&port->mode_ids);
> >  	typec_switch_put(port->sw);
> > +	typec_mux_control_switch_put(port->mux_control_switch);
> >  	typec_mux_put(port->mux);
> >  	kfree(port->cap);
> >  	kfree(port);
> > @@ -1816,6 +1817,13 @@ int typec_set_orientation(struct typec_port *por=
t,
> >  	if (ret)
> >  		return ret;
> >
> > +	if (!port->sw) {
> > +		ret =3D typec_mux_control_switch_set(port->mux_control_switch,
> > +				port->mux_control_switch_states[orientation]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	port->orientation =3D orientation;
> >  	sysfs_notify(&port->dev.kobj, NULL, "orientation");
> >  	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE); @@ -1991,7 +1999,7 @@
> > struct typec_port *typec_register_port(struct device *parent,
> >  				       const struct typec_capability *cap)  {
> >  	struct typec_port *port;
> > -	int ret;
> > +	int ret =3D 0;
> >  	int id;
> >
> >  	port =3D kzalloc(sizeof(*port), GFP_KERNEL); @@ -2068,6 +2076,22 @@
> > struct typec_port *typec_register_port(struct device *parent,
> >  		return ERR_PTR(ret);
> >  	}
> >
> > +	if (!port->sw) {
> > +		/* Try to get typec switch via general mux controller */
> > +		port->mux_control_switch =3D
> typec_mux_control_switch_get(&port->dev);
> > +		if (IS_ERR(port->mux_control_switch))
> > +			ret =3D PTR_ERR(port->mux_control_switch);
> > +		else if (port->mux_control_switch)
> > +			ret =3D device_property_read_u32_array(&port->dev,
> > +					"mux-control-switch-states",
> > +					port->mux_control_switch_states,
> > +					3);
> > +		if (ret) {
> > +			put_device(&port->dev);
> > +			return ERR_PTR(ret);
> > +		}
> > +	}
>=20
> Why not just do that inside fwnode_typec_switch_get() and handle the whol=
e
> thing in drivers/usb/typec/mux.c (or in its own file if you prefer)?
>=20
> You'll just need to register a "wrapper" Type-C switch object for the OF
> mux controller, but that should not be a problem. That way you don't need
> to export any new functions, touch this file or anything else.
>=20

Okay, so stick to current typec_switch is preferred, actually I hesitated
on this, I know that approach will have a unified interface, but with
the cost of creating it only for wrap.

My v2 will go with the direction you suggested.

Thanks
Li Jun

>=20
> thanks,
>=20
> --
> heikki
