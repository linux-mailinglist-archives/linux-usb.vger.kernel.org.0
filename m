Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1966295DC9
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 13:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897601AbgJVLxC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 07:53:02 -0400
Received: from mail-vi1eur05on2056.outbound.protection.outlook.com ([40.107.21.56]:53729
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2503697AbgJVLxC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Oct 2020 07:53:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1eWTu5UnWJOQ+Gh3KOTjdkM/5iEWcQGf7MDUSuOItOFK0LmyfBuUPwZidvDTGLOtDvpWn6oGbdLxXRJuIR2rWQ8cI/aJkSAyMf2Jlao2mb74VONtufvHUKv/Tn4ULhjqQ9quYyece9yuR5IkWSYxgtuAwaUUinqIRoKLVy75ZoU1AvPL5t5OmceGu1w37fzdZ4THFIbMsztCP3NovW9o6N1zrUK15NbK6flZQuN7GAbL6wu0CSNNi5Ujh3PsUyLzlfOyuyTIIDEAyzsFldBsbwapOTTKyCVQm8kkOmrNe36JweYY5IsiMcAjwBa831ZDr+rDjWwrXJQz0a+fAy37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EmBL5D7Vg/gwtxlCVtKtUzuGw9shWlDcooROcV8CF8=;
 b=BYmXFbAwF9txaFlIC3pE6weNAFANnOzEzxXdTBi5SSh0ZT2y02hjAKUuDo8ziYYq3VEBEIvIfMroqbm97NVcE82oJPhxIDaZL4aDXbP2qSz78a/or5bPWW8ZGHvWipQmj+ev6AYKUvoitNN+zUJn9lWfv/L7N9X0yI5FB6prq+ruTf9IarZHtiro1hYLKD0t38fKtSs4uhSulv7GqoAhJWGfH+VcWof1TQ7eCM77j8+wQ4qZ+++/MW/PjosM9eEqIbWjNWbxaxWhkRqRjU5gyMCYtV8wtc7tS6t//+VX4zslcsDoGworsdXG7Xu2rzlpJMMmb/3gD9kxjH2MuUcejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EmBL5D7Vg/gwtxlCVtKtUzuGw9shWlDcooROcV8CF8=;
 b=DE2uGWm7s8w60EQV64YV3hGPHlsscZwbAB/bQQNIVyUJyaiYQTK9dBC8y1T6/fTDIHGvSUeFC2JLM4tXZRIFtMG9KMCvrBpNZ7IPAvZc6mUiol7aP4ypSCwBinqJHWkweUQ6TQ9Dx1w/KM492UjPt4Mu1dTWCMe9t6n3n5mJniE=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4752.eurprd04.prod.outlook.com (2603:10a6:803:5e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 11:52:57 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::d9da:5c3:c978:43f8%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 11:52:57 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Thread-Topic: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Thread-Index: AQHWpfet77/VWwZAd0Ga6KW+E0wj5amifGcAgAD9x7A=
Date:   Thu, 22 Oct 2020 11:52:57 +0000
Message-ID: <VE1PR04MB6528F534E66256B187140383891D0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-4-git-send-email-jun.li@nxp.com>
 <20201021195548.GD444962@dtor-ws>
In-Reply-To: <20201021195548.GD444962@dtor-ws>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a71b254-9990-4377-a47e-08d8768104ed
x-ms-traffictypediagnostic: VI1PR04MB4752:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4752D7169AF0BC5509B545A2891D0@VI1PR04MB4752.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2djHMt6C2pKS+rTj0cSjUbaFTOYOAcUaWSOeahARdabNwXT9dkqHGiSPdB3UhXc+U4pjVk/T7rq+05nXCLndt7HzE/G0gPak+wAtzDxJ0liSC1f/0e6l3gquVEhHelpTpAJIArQ8HVYYV++diWwlOPhVQfaQMbh8+8Zx95IEQB/CaEU/rHWIpVzw7WZ4OAUsFH730HQxIPGw8p+UepaZF1og6BdRKiMLi1L/8eiFpU/g4kiT6Lr7Lhj4Vp1lnRKGKe5H/oiqFG7bqoIrxpZARFVJIgP+pq8R3m9+fdA7mdXYDAcSR0UmJTyvSjJZqjqZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6916009)(55016002)(52536014)(64756008)(33656002)(66446008)(2906002)(5660300002)(71200400001)(8936002)(44832011)(478600001)(9686003)(54906003)(53546011)(6506007)(8676002)(7416002)(316002)(86362001)(66946007)(66556008)(66476007)(76116006)(4326008)(186003)(7696005)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sskgq5wcyOr71BtCMbg2Bg+LV7z+BCFxb4DaE5WKcLvPFjIBtD9P9JaueJZgaUvZkSUm3kAAHIMO1iRPT0vchubUsUkInTepwypC9+bWz11IR49DNmZK7Qn78bRDvqwghyNnx37EQZnEc/MRqibw2GBsY4pq2W0fY0shACaOE5MDGMrsykDXliHw3KBF/Y9+EjInDE2Yo5qfBOgV4puWf0MWxQ4/ZC+xEIf4NMqD4tA3EVOiqbQG/iiTPtZaUWF2jgpGHGNvjegAxAvlGW3A3fHG9FRw7lmLdDl2R7MuUqnpGrNP83ltM1LHOFEi2P3BJJDDlE2o+HvEtUQlxH0hazpjJMRu5KKl9kYzq76KY58UYPPbCPHvVjuxnNi92t1OHmGmdP+bBAJvgwYJuZT3wFgv8UQ+wKXysGpwT4/UAgvSvWIM/CR/qqncKFp/9of65nCXfCVQIwHh3Klq6UFUB3PXOa1Gyqn/RaJjh4zFB8VmUBss4lVf7eEqZZfPxApYD21m8F8oAZ+nW6y3IEWigxoS92KtX2CFs+SSf6m5Fx1RSksrCXHIJtcuxJlQfMtg5M+JEYKpRnUJcugDO3zOoklrzTMYRplB2rV7TPF1tTmIJvp9Gz+aoKF6J+UY9cHhKwJ29hti8DNBX7pe8gNLMQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a71b254-9990-4377-a47e-08d8768104ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 11:52:57.4958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E96cNeMt04DnI8B9R/NnnhUFt5EfSAg0j5YZ8ci2OLXZL9lMEH5OI/8Y1H1JGwbT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4752
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: dmitry.torokhov@gmail.com <dmitry.torokhov@gmail.com>
> Sent: Thursday, October 22, 2020 3:56 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; robh+dt@kernel.org;
> rafael@kernel.org; gregkh@linuxfoundation.org;
> andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driv=
er
>=20
> Hi,
>=20
> On Mon, Oct 19, 2020 at 05:03:15PM +0800, Li Jun wrote:
> > +
> > +static int typec_switch_simple_set(struct typec_switch *sw,
> > +				   enum typec_orientation orientation) {
> > +	struct typec_switch_simple *typec_sw =3D typec_switch_get_drvdata(sw)=
;
> > +
> > +	mutex_lock(&typec_sw->lock);
>=20
> Why is this lock needed? It looks like we are passing requests directly t=
o
> gpiochip which I expect would take care of this.

Checked some gpiochips, looks like with only GPIO, yes, this lock is not re=
quired,
I will remove it.

>=20
> > +
> > +	switch (orientation) {
> > +	case TYPEC_ORIENTATION_NORMAL:
> > +		if (typec_sw->sel_gpio)
> > +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
> > +		break;
> > +	case TYPEC_ORIENTATION_REVERSE:
> > +		if (typec_sw->sel_gpio)
> > +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
> > +		break;
> > +	case TYPEC_ORIENTATION_NONE:
> > +		break;
> > +	}
> > +
> > +	mutex_unlock(&typec_sw->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int typec_switch_simple_probe(struct platform_device *pdev) {
> > +	struct typec_switch_simple	*typec_sw;
> > +	struct device			*dev =3D &pdev->dev;
> > +	struct typec_switch_desc sw_desc;
> > +
> > +	typec_sw =3D devm_kzalloc(dev, sizeof(*typec_sw), GFP_KERNEL);
> > +	if (!typec_sw)
> > +		return -ENOMEM;
> > +q
> > +	platform_set_drvdata(pdev, typec_sw);
> > +
> > +	sw_desc.drvdata =3D typec_sw;
> > +	sw_desc.fwnode =3D dev->fwnode;
> > +	sw_desc.set =3D typec_switch_simple_set;
> > +	mutex_init(&typec_sw->lock);
> > +
> > +	/* Get the super speed active channel selection GPIO */
> > +	typec_sw->sel_gpio =3D devm_gpiod_get_optional(dev, "switch",
> > +						     GPIOD_OUT_LOW);
>=20
> Does this driver make sense without the GPIO? Should it be made mandatory=
?

My old version made it to be mandatory, I change it to be optional in this =
version
for possible extend to other simple typec switch design which do not use GP=
IO as
this is going to be a generic typec switch driver. yes, for current impleme=
ntation,
this driver will only register a typec switch in sys if without GPIO provid=
ed.

Li Jun

>=20
> Thanks.
>=20
> --
> Dmitry
