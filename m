Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851D2293C2B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 14:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406598AbgJTMs3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 08:48:29 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:51009
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406171AbgJTMs1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 08:48:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nofX8mubI+NFAlGgnNj+rG2jELWIUjZVPaDyt0J3fnEtP7Y/vmUyKSDPpMSWLcrbOzek9NRS1zfK/4jZ8K1bDzn8RhYuXs4r7KQ7tfIXzZe+l/f9pkAUK5ZQgbPMMBh52g2XE5Ebr+YIFPiCcOTSMKqyzCaMvXGozC0f9NaBUq5oXjxsoo8Nq4WdBCcRL3andg8ePSkIhnQPVJijGsmyNSy3S0HHbJZGL+0eZ3NzSBDVGn8jaj6mLl/0i63SSdbOxHI2BEb1XmMaeBhZJ67ZrouLI9JRUQ9KD54JXR8vrW71TdQyqwHd1WPcPnSHhykqjxf5VaCghFgV0Q4OqeFYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdAJxdJ40Jd1KxLBw89Fjnljmd+kIGSeGMLucmfGEjE=;
 b=HpO3J2wueTzJDDfEGASO3GdruH+5E0VRGnm3Pu8JyAUElJtqS9EacDa854WpNR/DmOibtbdTJH2SXIO+fSqdzdT3UhcJNOlO+ouLRnHUa705lo4hqP9ayo0uu8VW/KrsvxuXM1B2cWoAPg8+2XHmulDgF/4adI1+teKrtW/KDV3YnjSeeNVKD+JtVODJYhRXykGio+z0yJlU5zLAyz8k0+Fy8C4mUKzX/um8c0YV9pRwSQHXSoQj++wd/NoX7F65Dksdthp9zctDVVBSg0oxfb/Tq49+0duB8DH/s0zMgTSarc+5SIGzMLSZfDN2ltJ73xnm/6rG/erGVFNTQpgYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdAJxdJ40Jd1KxLBw89Fjnljmd+kIGSeGMLucmfGEjE=;
 b=p9rwQTOWCkAbqvD6yS/ri3kiII6MQg4mXxCCbjDCRwAW7R0gVXiOKo98Kt1paZ9zuPENxmvCdRo+yprL3HlVVQAb7+I9bXufdgWPmaiSizoL0r516SEKhwk8SY3DvFY01PdaWCuWtC+0WFZiInrYITWyyq8gRzoORP1uPtgswww=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4751.eurprd04.prod.outlook.com (2603:10a6:803:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 20 Oct
 2020 12:48:23 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 12:48:22 +0000
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
Subject: RE: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Thread-Topic: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Thread-Index: AQHWpfet77/VWwZAd0Ga6KW+E0wj5ame24gAgAGAo/A=
Date:   Tue, 20 Oct 2020 12:48:22 +0000
Message-ID: <VE1PR04MB652864AF6C76016DDD7244E7891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-4-git-send-email-jun.li@nxp.com>
 <20201019123114.GO4077@smile.fi.intel.com>
In-Reply-To: <20201019123114.GO4077@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7b8ad437-4064-4647-bb2e-08d874f66dfd
x-ms-traffictypediagnostic: VI1PR04MB4751:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB475169D4EDB6E93F7AA86C90891F0@VI1PR04MB4751.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNkjf42vdYXFspSx+QBRmnt7/mOIPGZ2EBWsaFTGHNRz8T8j3JfgWF9TaLPryAqR9ww3fn8qW+w2BDTEsB9R0CXHYESQ7lzmP4S/+lykg5vTfuz1zU3IytfvAD6kZF4VeTLFIs3IXXDKzwMzJpjvRQVV6sV2L42Ue73Xh0OxaJapYTIHEWTkwv+EAzyV+yBqq21GdZoxwas+xgTbjmOQBvvwcNchqxaqdLg/9QepojVF19XciQAsHC1Q79sLOQ1Nyx/ENbDCnaMZeXBu+/Z8Q5Cj0zVFewMqNuTeNW/11i3i+7DyZ6Ale8oPZTryWe/9Fdv/M4LNffW6pSAeKCR4oQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(64756008)(76116006)(7416002)(52536014)(86362001)(66446008)(4326008)(71200400001)(2906002)(8936002)(9686003)(8676002)(66946007)(66556008)(66476007)(53546011)(33656002)(186003)(54906003)(26005)(7696005)(6506007)(55016002)(498600001)(6916009)(44832011)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0DtLKnftYkbXcvrQg0NQ15XE1KZPpTOBNqRwta/kAm7gUyilhslqIjwuDbkxIwOexzSrKzwZ5QIXSDB935hjSw44BN3STTlK3MLL4dN4bjmeq9ffGIBVbt8Y0E8p5j9VkglkmN5mFjCXan1zEhWU/5txuy/gBXoRofspELlU+TJgOuvfZZ2HQ6ljNh9ePkn+2ayjlq0YcMui/7yVOT8qVfRfjT+ktzPa7goldWD/2CLYN/1aqrMMbGaMWPS95jvc1XPw6aSiTVwGCkqtz83FgLvBm8IE4floms3d9bANE6Ws0XS/cVSITRmblbTUdHk5vVndmJ7Qu+moXcxosOkwO7WILsbklWiBxmL0p22b67Jf0k20+tQzi0kwaSGum1Hdr7+289PROBv/QmMYQ26KQZzsWQNX2TWPFA9O0CMakyQuO6I8lXZI8tErHgJdiJ/SJcqyUwjbxrtdoAZuYaOHjen59PxR1+uig4HDgMuMLKVcy4mLmPRv3F76uxIHXQyxLJtVzszX1H91rzXvXkX9Z/I6jpByI/4zDHTySxnRZtVk4/jr4biO2CNXcvqPimGLII1jaX+T8kGaGJHmtao7gKQr11m3gqPBWP+mWQ2ML1UMRwSRudUukC3eDIDrYCOfSbtXfrOY7pedR7PD62QM7Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8ad437-4064-4647-bb2e-08d874f66dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 12:48:22.8037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zEAdlXW7Nj7xkKmIQ9i44+RoAtzu5enWZWCF9FYaI9/A30f1vwgKIfMbF5SOTg0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4751
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, October 19, 2020 8:31 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driv=
er
>=20
> On Mon, Oct 19, 2020 at 05:03:15PM +0800, Li Jun wrote:
> > This patch adds a simple typec switch driver for cases which only
> > needs some simple operations but a dedicated driver is required,
> > current driver only supports GPIO toggle to switch the super speed
> > active channel according to typec orientation.
>=20
> ...
>=20
> >  	  Driver for USB muxes controlled by Intel PMC FW. Intel PMC FW can
> >  	  control the USB role switch and also the multiplexer/demultiplexer
> >  	  switches used with USB Type-C Alternate Modes.
>=20
> Missed blank line.

Will add.

>=20
> > +config TYPEC_SWITCH_SIMPLE
> > +	tristate "Type-c orientation switch Simple driver"
>=20
> Type-c -> Type-C
>=20
> Simple -> simple

Will change.

>=20
>=20
> > +	depends on GPIOLIB
> > +	help
> > +	  Say Y or M if your system need a simple driver for typec switch
> > +	  control, like use GPIO to select active channel.
>=20
> Driver name?

Will add the driver module name.

>=20
> ...
>=20
> > +/**
>=20
> Is it kernel doc?!

Will change to "/*"

>=20
> > + * switch-simple.c - typec switch simple control.
>=20
> Remove file name from the file.

Will remove it.
>=20
> > + *
> > + * Copyright 2020 NXP
> > + * Author: Jun Li <jun.li@nxp.com>
>=20
> > + *
>=20
> Redundant blank line.

Will remove.

>=20
> > + */
>=20
> ...
>=20
> > +#include <linux/of.h>
> > +#include <linux/of_gpio.h>
>=20
> No evidence of use of these headers, but mod_devicetable.h along with
> gpio/consumer.h are missed.

Thanks, will change.

>=20
>=20
> ...
>=20
> > +	switch (orientation) {
> > +	case TYPEC_ORIENTATION_NORMAL:
> > +		if (typec_sw->sel_gpio)
>=20
> Optional GPIO does not require these checks. Drop them and learn what
> "optional" means.

Checked, will drop those checks.

>=20
> > +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
> > +		break;
> > +	case TYPEC_ORIENTATION_REVERSE:
> > +		if (typec_sw->sel_gpio)
> > +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
> > +		break;
> > +	case TYPEC_ORIENTATION_NONE:
> > +		break;
> > +	}
>=20
> ...
>=20
> > +	struct typec_switch_simple	*typec_sw;
> > +	struct device			*dev =3D &pdev->dev;
> > +	struct typec_switch_desc sw_desc;
>=20
> Be consistent with indentation.

Wil change.

>=20
> ...
>=20
> > +	/* Get the super speed active channel selection GPIO */
> > +	typec_sw->sel_gpio =3D devm_gpiod_get_optional(dev, "switch",
> > +						     GPIOD_OUT_LOW);
>=20
> It can be one line.

Will change.

Thanks
Li Jun
>=20
> > +	if (IS_ERR(typec_sw->sel_gpio))
> > +		return PTR_ERR(typec_sw->sel_gpio);
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

