Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A902F2C1B58
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 03:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgKXCPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 21:15:40 -0500
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:34401
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727554AbgKXCPj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 21:15:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJiXnld8sSryjC/2NnNoJNUf8ddFaqAqOBbZ9z5p5NRdCStSiW92OESwaT821YTsREUAZQWx9knNAtn9Y7krSPNEmOglX3JDjaayPFKxOo7Ff+mo11Jo0gL0w+GSrB1C4XdRZgZYpD7v9tazHZveLdpbT9CT6LSCSbaJECW6SLoHFVUWzeqrZIeidDIBw6XSaV9qhIEyen+bXOGzh3RwAcuX9JZz5BPerq0pGiOs8PTbomilRe21/Bzvfa32xiXnGlJ9QRRTz6gmiylDNZ2VZ4JgLxIKAhkZs2ZIsKO1zi7MLLbHQELrF8ZHROg8E4t9ytmNnto7yzoqkM1+PHDAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ler9KPbM2/ZHVd8NE/Jra3ZViaBQbQ9rMiy+Fx80a6w=;
 b=k1p8gMOqdACqA3oqi11+EREUjPvwg7mnS+xShZavkdKy4XsvweVo+62qgtQSzvMLm5wujFUSAUcLzP4b3qTQmJ1TC3nP5E2YNRic/g7pOuDgJEBtVMVx4oAaEJghYJBwTcKkBWsrR51tp3Fe+uDO2OWSXNrMtuGUD8ZLJdaTuSU0sMxlYC4lLQ98epmI9hIBs41BZkd3u4qXnjfE0t7J/EdbdW3pmRmIXJWkMrSpM30B7gWjJJEwzbyshQiVYSy5yEhPo+w4HbC3nGi8pTQ09Yw9kIktDpUyH+ozfGEvZS187Qa8RsD9ZbtIZfsrfceZ8YIQnxiDjPaus1nj5RW0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ler9KPbM2/ZHVd8NE/Jra3ZViaBQbQ9rMiy+Fx80a6w=;
 b=fPu0/712IUbqQsplxkK2ZJVws1GFD9ynaQwlSwlIdyGK5LeTjFgVWhZMOqA9Uwda6VVYSkcTKEc9EeWh7DxNSx9C6wRp7YeElCul5j7MYfqJJJkcKZ2GbgIU7SGjD93CMo2qQretmmxZTFvsPrRmp7eTESMROD77fCArmbxrioE=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 02:15:36 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Tue, 24 Nov 2020
 02:15:36 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v6 5/6] usb: typec: mux: add typec switch via general mux
 control
Thread-Topic: [PATCH v6 5/6] usb: typec: mux: add typec switch via general mux
 control
Thread-Index: AQHWwaI1YTdOw98hlkS2RZztQVqSAanV2AoAgACzZeA=
Date:   Tue, 24 Nov 2020 02:15:36 +0000
Message-ID: <VE1PR04MB65286F3C01D4A092024013CC89FB0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <1606140096-1382-5-git-send-email-jun.li@nxp.com>
 <20201123153104.GI4077@smile.fi.intel.com>
In-Reply-To: <20201123153104.GI4077@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 153c7bd9-637b-4b4b-eef5-08d8901ed48d
x-ms-traffictypediagnostic: VI1PR04MB6909:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6909CE0C5E734877C54F4F6D89FB0@VI1PR04MB6909.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEX03HSlK06EyRyf7Uiy5p1zdhLBRdWHisATWxyrlnAjEWaCq/ZTOyy4QgONtb2UDtjgDDsqzSm1b4ynX09P2Y92lag7QGIgBnj7+bDgVluOxLqZ8ZGIrsGY5VHEcBaLTfqPo8TZIUDPwS2naBjNPAAe8W62FcmiOrT5JnB7Ktu+fo3xRroMIg34br0sOqFEtICQw6rlNUojtneOt9WSTmz8yN1aDtmZGDOAbx14h2qg/9wNETotiPWLFySuGqdfZHlXaNRBll12e1fc+8ycnESiy53rR3P4wzD1vCwlvuVhrQ8DSlTMc+7dbFxP3JCNI80f79HOCgApxk6Oqe76VQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(8936002)(66946007)(66556008)(86362001)(4326008)(44832011)(478600001)(33656002)(5660300002)(186003)(71200400001)(9686003)(8676002)(26005)(54906003)(66476007)(7416002)(6506007)(64756008)(66446008)(2906002)(53546011)(6916009)(7696005)(52536014)(316002)(83380400001)(76116006)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lGEQ+iiMtJxSRY5MAM/z9oOp2C4H4DAfxLMULKBzALYEGvlPF/8OxE0992x4SrfA84F9uZ4K4Cn33C4BIPUCKO7N4L0q9DABBwfPKYB5jdyEi0cBvztXfJYTPwOhcT2ibj2KupIWkYzkQmwuLceaXjUWa8EN5jXyy6SFmFR5jk+o0LL11mtnqp8ZgIWx4lhhXo66x5pof297LUlLliHRLCnXRGd0oXjOB8lO6/pwiFZq3MLRtntnDvxiF1Q1U1aA8Dy6t7fQpHHtEVdw5CVeIuH8rsirAH3mlUq4oD2ldHhQEh+25Czh8jX5TTl+s+Px/hImwetGQMsJvTAMnmq4Nx3DmvjugnPcH6iaTOJo6XgsZoQJPH9wP3wrl4i4FCizE4QRH6U2Yq7/d3SgLfFIEQLsAubNAY6aV5z0PTZEjFfqvGZkaBoLb/stcnEwQVK6x9+fpa+HkZnQ5vecFoH+6wAtcc0fAzBGIpKHbQHplRsIE7Mo1F6HJiEi4B1Iov0roNPSCbJ7l/hEPLOjm/6b56Tgkk2QVrYzYANA8lylpvnhPOiHVqYrNbe1iYPFE83hmNq9qk8qhYMGTJivvUdqJdK+W+Gyr+FxJEB8V8v80Kk+flOq8jNKrMEwoZ5dProVnlIZG9fDv0es5beStiMKlQrkl4z8YMM3PgKHyXMPOS5CPXvwDypKYP9GwbNT5NuSx5an/GnU7r8h2/n19bCppVabV+zppp0r/BOr5LCTdyO03Vhqy3XKEKaOLHqlNvPFXnqZYDqfO8MTO5+NMn7exE1hFxgcW2uHdDXYzDsM+d4UVsPN29d9NjLu37SCp+1Y2IHkcUjfqpjBWNr6VT+l78lYDdRzrh3qbAu8Be5CCYJxGFij+ZO/11lVeNhCcZSl4Mun798ZOfwcyNrJpxKZkQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153c7bd9-637b-4b4b-eef5-08d8901ed48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 02:15:36.1315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTjP/kxLOihBTRrK0sOD574eehtmlsrNJOkZXhgocEjbb3Tojz1FM+eBbQnNGSuN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, November 23, 2020 11:31 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v6 5/6] usb: typec: mux: add typec switch via general
> mux control
>=20
> On Mon, Nov 23, 2020 at 10:01:35PM +0800, Li Jun wrote:
> > The general mux controller can be easily extended to support various
> > mux selection, this especially fits typec orientation switch block
> > with a dedicated driver.
>=20
> ...
>=20
> > @@ -42,10 +43,8 @@ static void *typec_switch_match(struct
> device_connection *con, int ep,
> >  	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> >  		       !fwnode_property_present(con->fwnode, con->id))
> >  		return NULL;
> > -
> >  	dev =3D class_find_device(&typec_mux_class, NULL, con->fwnode,
> >  				switch_fwnode_match);
> > -
> >  	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);  }
> >
>=20
> Not related change.

Oops, above 2 blank lines should be kept, I will remove the changes.

>=20
> ...
>=20
> > +	if (sw->mux_ctrl)
> > +		return typec_switch_mux_ctrl(sw->mux_ctrl, orientation);
>=20
> > +	else
>=20
> Redundant.

will remove it.

Thanks
Li Jun
>=20
> > +		return sw->set(sw, orientation);
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

