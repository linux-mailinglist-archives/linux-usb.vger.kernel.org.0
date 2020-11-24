Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6E62C1B18
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 02:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgKXB5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 20:57:02 -0500
Received: from mail-db8eur05on2062.outbound.protection.outlook.com ([40.107.20.62]:59232
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725815AbgKXB5B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 20:57:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lABAQCutCsd7fMpFxE4IrXBsrozJ8xpTHFB8MK/S6QSc23MwiBPHh3yfAiCsz/6z5yTR70EfPG6SIpAH7CZ6nJ9VZqpslLmGIEuGXV/HqBq+5ibV+Ee8s7MsUWeqvZu0I49lNcKTvVjB8SQ5jMAOrne8TYLFgoCpTjgBvnlPfsvZrr75MQzFlMLbx2JKg6I0LpL9Dqy1yPz4apTfIY37AXs+rHuH0efgbI7s1BFzMvbLdMeqybWwb6Fd9pnxq+qbzlD2+Dpc6BP3z+5jDPBMagkqYcedd176S9w2iwsmR8thtYoHJQ74dNkcUzB6Vz/mD0bmNWM+IAs0iperSh3Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S5gZyukyEKTm1eUEtQIjTEpyb6EhG0qGX3EK08XnF4=;
 b=D1rzyLB0mcNBqyQer2LPWMPGacj+6Yba/mqyjNpCyZXrtDF17coo8Innt4QlQSZkd1MC3foGjqN183Yds6A+B5qQS5rTwImemV5KsI5uTHet5pGnN0QluXsAajFTC4Zf1zw+jOxLXzeW4mX4pR2AjL+Z0AbPAaq2ZA7wsWGq59ywKWhWkP6reb1QKfZZkfFynRkZUdW3NKephLYZABxGtti59yjEHv8BvqjICWIsCeeFMmVmWtq0WS9CHDDf9NDFrkD0fz2m1a8eE6PQiKAjUXCFeWxHErivoilDLfpfTR/1GAjiVspLZBToABiZOY30VwBS7EGDcXflmQD26bcSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S5gZyukyEKTm1eUEtQIjTEpyb6EhG0qGX3EK08XnF4=;
 b=JdTYKwLpKUyYwPjAkOlTzgPt4Sadi38N89G++FOdm6VCajZy7XozUW+ZZ40hiVrrXgw6C/NAveQbqrmwsNKp9C8l4nowIjmnIwZCY9J979dlKU5VKE0fFrq8ci1LoFQGQeyOVph1R+68gbemvHfSSSNtKrpzL+y36igzflj1FII=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7279.eurprd04.prod.outlook.com (2603:10a6:800:1a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 01:56:57 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Tue, 24 Nov 2020
 01:56:57 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v5 4/4] usb: typec: mux: add typec switch simple driver
Thread-Topic: [PATCH v5 4/4] usb: typec: mux: add typec switch simple driver
Thread-Index: AQHWsdb86rSMVDhCP0e/UMsDmFxU76m/gx6AgBciHeA=
Date:   Tue, 24 Nov 2020 01:56:57 +0000
Message-ID: <VE1PR04MB65287AF64B6ADAD143740D8489FB0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <1604403610-16577-4-git-send-email-jun.li@nxp.com>
 <20201109083621.GJ4062920@kuha.fi.intel.com>
In-Reply-To: <20201109083621.GJ4062920@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5ea0215a-6835-4a7e-098f-08d8901c39b3
x-ms-traffictypediagnostic: VE1PR04MB7279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB72791FA70D3ADA939A57922B89FB0@VE1PR04MB7279.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +688SHrOy6fdyq53EdW2776y0T5c6RwRWhpZZzlWkkSTl1C6F0/DAvpSznklXRsckv2PMcJ7WmlD2mnomPEt0hYDv4F68rKdu7x5AL52/ErT3KHL/bty869cxoRtCQeBfZjkQm3dYV4BlZOTrjdqCDMBsbCHQcBl5E9MFvgy7TpP/4zKcxkzv0T+IADT4WO2xBboPEC2GzSkvRipCiM4ay2pQCUTJhVpMg4wA4Dd4ZaeeZQbS3bkXFRA3OFXSChQhinBDzHGv2TXmwX6OfOA20BCQ8h8YldcZjBSfhoUVblPemGkudxlqYo4lqTpDusF/W/VrqFlpTSwAtsXfPeqazR/aHpeRgg3WoaW7ueRujax0DTCH9L3AQbRY8itGMyS41aCNGLKlaNuLqxHs5oLRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(83380400001)(966005)(55016002)(66446008)(71200400001)(186003)(54906003)(4326008)(53546011)(7696005)(86362001)(6506007)(76116006)(498600001)(7416002)(52536014)(8676002)(66946007)(66476007)(66556008)(64756008)(33656002)(44832011)(26005)(9686003)(8936002)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d8Goq19MZevbBXrXahNs2r8jRCUyB26THSsFjGDokQ0hAYZsxUIavwsrkOhaUKpEu6cRH/ZR7QM7jw3gFtNoCWnBe5l1ZLQ47pWPmsWrLF9+bK9qgTFBXl4tMpJMLl7NMJ1MSY4Y3Mv4BKIagNpUXSP5l34f+SDagWGu3/Jy1K8jtsxocE/C8aiQFqA1uc5CsegFH5+Ajj3FA+3JO0qLd/K+47jhso9hCZG3IHVbAcJHNaiZV+HjUr40gcgDUg0FBNYjvMqZFweLwP2coQFrS4LfI5MNaGh+ioHbEiRWUsYLnlYcMbIbfic6wYVCCL1Ygj7yBWdLO41Yzs34qzth6JzdQMUBC70oHBDLTyZiKfSVRd+frapRQthtJGAIpkLJ3GrzozK4c4G9MQOxc1j34K3tIyqghGVxfqIp5EbxPMivRidjcpARKXsjsoC48sySVtpi39b74AEJPpOKQpbK65pplIFo7SZ+yDVKo5giUvFRM4cUwB6z+3ceFur4k+1FnP6okMFRf7Mao1Kq6uOrb1LeoVTkCqO8iCzPiwVElsgrgWErKshXs37CamBhlN1SLkowW0Aql+kjvPnL+XshE0N9DnDHTXXyq3rhB6B0PrxYdIWHVj73Cwxr1pNOw/Vc11KyJB9c6Zug1mRMOz+q00V9SKOau6goipux+ZXv4BfKToGZ+3tlIGVeFqUvf8XLaEiHPw7ew7X20S0qt+TXNIAC23KfrqpIqzqhYFlUQH0Be3LwpdOUmZlh1hv8T68YI/11h1njQ/Ovbl7mhMZWSltjHsnNQYqI57+dtn1Hzo2EMm6vFUb4/FWxXyBY44zgBeLUKiUUtSRaED33/i6q6sc5AznDm/4Txvg0PonD9hCzm6GwvKMKkVfnhzQ57lsMfsprgkRPGxm1AasQRm/vew==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea0215a-6835-4a7e-098f-08d8901c39b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 01:56:57.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJQzSF9a6mE1YdUqTMd8zYuhR76Mm8l4v6uk3KctvqABMVrBKvZwszT67FurDR15
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7279
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Monday, November 9, 2020 4:36 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: robh+dt@kernel.org; rafael@kernel.org; gregkh@linuxfoundation.org;
> andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
> lee.jones@linaro.org; mika.westerberg@linux.intel.com;
> dmitry.torokhov@gmail.com; prabhakar.mahadev-lad.rj@bp.renesas.com;
> laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> <peter.chen@nxp.com>
> Subject: Re: [PATCH v5 4/4] usb: typec: mux: add typec switch simple driv=
er
>=20
> On Tue, Nov 03, 2020 at 07:40:10PM +0800, Li Jun wrote:
> > This patch adds a simple typec switch driver for cases which only
> > needs some simple operations but a dedicated driver is required,
> > current driver only supports GPIO toggle to switch the super speed
> > active channel according to typec orientation.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
>=20
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Hi, Heikki,
=20
I have to drop your A-b tag as the driver updated to use mux bindings
(drivers/mux/), see v6:

https://patchwork.kernel.org/project/linux-usb/patch/1606140096-1382-6-git-=
send-email-jun.li@nxp.com/

thanks
Li Jun
