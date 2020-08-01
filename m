Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F7E2350D6
	for <lists+linux-usb@lfdr.de>; Sat,  1 Aug 2020 08:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgHAGxo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Aug 2020 02:53:44 -0400
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:4868
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbgHAGxo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Aug 2020 02:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTGvmR834XJJjCm4Oe2/fylpo+IvqB6mWPqVY/b4T19146z9AHtvz/he+EyuWb7xUjwCnZJKtPKiF9gPreVbdK+tO0otNVUwVMteRak0xi6/bwUsYOGKXu8PZZNbHfyBEECg0BVplIlYbqy5rSoTJkRCsy36L+hs28d6H/cw544jakitikofxUGGzPWvChkcnMYKz0ISVXTUKuebCvpueh98pkxgGatqJlEvyy+slNaEqcVKaPX8Ne7dJugPHkUB0xrUOcZ2hIO6zdcqqiveWL6zKT4qaxRo5qsbRNMhQ6GlXjwx6k/caExc/XSJfRhy5kncCRZv+NH+3tIZthahXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUBceDXBgQPh7kk5XjonuM8C3+qb88wBtEjDVzXyVE=;
 b=ncd77crJChdaIpWjPjfcZYBCf0fFQUeResMpB1jZ44DWJeFCjXVvXkLk4DvAW5zATSv6AdqhifmHhbJ07585Qh126Goq3mwl6TnHIWXYpSlTtkeK2Tsz4hl4vygPJ7fkvIWthT+ilzkgl+ZuvWKF9eLmByjPieDkQ6ruESWMyx5+FB42ZmssloCI1ciyGuSOMeiRChl64lxQXYdAdYo5qo6vj6FL1IgDzxH4GtGPdgRs4IR+1ESC3ZAeNHDFvT92qJrl2CE14aCcYFpQ6w+2Bo8non3DPjuFWvOvT1GDQpqj6KGWvQgbXqBdmmIRbQia6ry3OjWg/flyX8hmD9bR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KUBceDXBgQPh7kk5XjonuM8C3+qb88wBtEjDVzXyVE=;
 b=mfM9toXDoyMsCROb0jOlfx2SGQBvMVQF5qV8YozrDk2Lh1Wip0FkyqTLrcH2ZXj94X4yBywkAqXVt0bE5mGI8e2vYj1W6GTvqEIazisivs1GWL6MbPn/Fvii2bWmxDvGfFB7b3JPy9oV5kRCsEOXZT35n6J/sgY3O3lbRY0W0nw=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB8PR04MB5755.eurprd04.prod.outlook.com (2603:10a6:10:ac::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Sat, 1 Aug
 2020 06:53:40 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Sat, 1 Aug 2020
 06:53:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Topic: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Index: AQHWZyFjrjQabElMSUmE/uyQe+yec6khlL4AgAAB30CAAAZvAIAAHBiAgAAB7wCAAJ8lAIAAdx3A
Date:   Sat, 1 Aug 2020 06:53:40 +0000
Message-ID: <DB8PR04MB7162CC76A1957F83F6079F688B4F0@DB8PR04MB7162.eurprd04.prod.outlook.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com> <20200731140553.GA8013@b29397-desktop>
 <20200731141248.GC36650@rowland.harvard.edu>
 <20200731234224.GA13414@b29397-desktop>
In-Reply-To: <20200731234224.GA13414@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 295a38f7-85ac-46bb-be05-08d835e79fd5
x-ms-traffictypediagnostic: DB8PR04MB5755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB5755BCF1753CC07612C8B1358B4F0@DB8PR04MB5755.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LYF53zaeiD3rNo0VVU74WNUmFqXIOtsQjGPujKBR8YmTkoq24Ou0L7QtVnBpTPskDUYcJ+k/dHaFIehXxCqJ1a81fovnx9+V8W/UBypiMC/N4QM2UBOqapKNzMabx64VP0bbtcE0e68wS860sSm3Ba1ygoI2etA8n3Z8qU0HxNKnvN1KNgXfG1p8IFtevAJFLnHuig4y/gn+KbVwYBnlHkys50eAT4x352OaQL4b7l3/7oLPksXQrzTllgA3PfsFkmo5OBqfHKV3OG00JnJ00qFmMhYuV40uFsk6yylZdyHGWxMtXhi5s2MOMynSQxOvl8iFWlEyZM7SLLN4xs1oSNVVVfWhWVYuy2VilQWc98+h8VXTCOyexnuOV1KhJrZJ6wRV53MR1tusoSi6WKIUWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(52536014)(7696005)(8936002)(6506007)(76116006)(478600001)(2906002)(8676002)(66946007)(53546011)(66446008)(64756008)(66556008)(66476007)(71200400001)(86362001)(9686003)(186003)(6916009)(5660300002)(4326008)(55016002)(316002)(33656002)(26005)(44832011)(54906003)(142923001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: H2K6ex8L4wKs2NHMFXxLcIml82MYN6YkH1J4aBeKsAHMPik9y5h0J9tshNHphJca8pAehLSJvgpNWlKXXCF7xsQIeJDvcEtW0JHDVFc7RmRHwBATTzJ/nSlorFalleQ45jf2w0uH6gfm2cIiafyQAmBnmqchefLM6df9g8kp27/rQzfuiXrkaCbsQzsDZ0MY4k2Cg1YYX71U5oEc8paRm5OKTC8zk/jl8P+5LzS4wwHyWOIgInRZnFSYsRZCDfVAWz59ld+iKBYO+PkXh4xzzuU+S9WQLX+lk8zGswC4OfT2/gUBejp/GjZBBYzhUBDC/bKBxC4zkJbx0q6xQE7BLtHdA4zQjS0OwURWgQHzoAJttvgrMwszlS1YfVeqBMU8fj/1SrR1uH+QW7lWIy7/MjgI+TSRXtYPiVEC51nZ0iXHFqdPEJ1DmS/phnxeQaHQy7XVytwZOb0r1zuxuDxSDtdfhCfKZo6Ps6jVleym8wufsNQ/MP3hVxyB+72oUE7fwfcFnmc5Q3GbJjnKVtKYukRS+vFqTjkcZQJiG4v5/yqhQKCzV7YGw410La6hqcUHGrGAmtd6GQamYUBxp+wgGa/zTara7Zp8UcqEVrVaZR70hVvCxQ1fTeJ/B0STD351+e63ohbdbNERGjEvG5j9rw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295a38f7-85ac-46bb-be05-08d835e79fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2020 06:53:40.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1e+zxNL8Vg+D6ln3zseY10KWzt45JSBV63gMZHmnw07Sg9sgKYAh9CsAqEL7IguJ/AFVhYer+CCgd40sC1nkyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5755
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On 20-07-31 10:12:48, Alan Stern wrote:
> > On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> > > On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> > > > On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
> > > >
> > > > Grab a reference from somewhere else and do not give it up for a
> > > > long time.
> > > >
> > >
> > > So wait_for_completion_timeout is suitable? The similar use case is
> > > when we open the file at the USB Drive at Windows, and we click
> > > "Eject", it will say "The device is currently in use", and refuse our=
 "Eject"
> > > operation.
> > >
> > > When we try to remove the gadget, if the gadget is in use, we could
> > > refuse the remove operation, reasonable?
> >
> > No, the real solution is to fix the UDC drivers.  They need to
> > allocate the gadget structure dynamically instead of reusing it.  And
> > they should have a real release routine that deallocates the gadget str=
ucture.
> >
> > Alan Stern
>=20
> So, the basic routine should like below. I thought the usb_gadget should =
be
> deallocated before the UDC driver remove itself (UDC device is the parent=
 of
> usb_gadget device), I may not need to wrong about it, it is just a memory=
 region, it
> could release later.
>=20
> xxx_udc_release(struct device *gadget_dev) {
> 	struct usb_gadget *gadget =3D container_of(gadget_dev, struct
> 			usb_gadget, dev);
> 	kfree(gadget);
> }
>=20
>=20
> xxx_udc_probe(pdev)
> {
> 	udc_priv_data =3D kzalloc(sizeof(*udc_priv_data), GFP_KERNEL);
> 	gadget =3D kzalloc(sizeof(struct usb_gadget), GFP_KERNEL);
> 	udc_priv_data->gadget =3D gadget;
> 	...
> 	usb_add_gadget_udc_release(&pdev->dev, gadget, xxx_udc_release);
>=20
> }
>=20
> At xxx_udc_remove(pdev)
> {
> 	usb_del_gadget_udc(udc_priv_data->gadget);
> 	/* need to never reference udc_priv_data->gadget any more */
> 	udc_priv_data other deinit;
> 	kfree(udc_priv_data);
> }
>=20
> Since all structures xxx_udc_release uses are common one, it could replac=
e
> usb_udc_nop_release at udc/core.c.
>=20
=20
Since gadget structure is allocated at UDC drivers, I think it should be fr=
eed at
the same place. Current common release function at udc/core.c may not a
good idea per our discussion.

Peter
