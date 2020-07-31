Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09974234EAD
	for <lists+linux-usb@lfdr.de>; Sat,  1 Aug 2020 01:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGaXm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 19:42:58 -0400
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:51771
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726347AbgGaXm5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 19:42:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QagNAvCSveKy8TFRMmkKytnOlvsQpyztPiLw35F2Wt9hC6kZdlDBH2swoRyfWNUfBWyXLwqEll4c63O0d2Bp7tdkk1/cgj0vi/vM2SC7VZZUKclpn8ae08M2o3bLBq1oidVT3ZXD2sYAbBfYfii4apgLrVtoe5Fbu1W1DU2LjT/+WXZA3nZEzC16epPgA+zqGhlOBLvfFfGFJPyS8WvQimqsSJJWPWiuQm3IMNYzoHvM2a87HAQCy3dK1gfSN9mM6teds54qg8PbFQJWOS6OpNsfa+nOdk4Yi7dGppmgv8K5wvZP7NbBxprm+RX0Mo88adJTRUdJ1tys69KZ4a7jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLrwY+sskOPDBdSZVyZM/JcQkXxvrpR574KWvORfqP8=;
 b=TPXGIgFJamCv4iAbkrQ1N3RfRFQ6ZHyL4JcmaVTmjHlDeXmHNW/dzCf3+hNOVV+4NK38SeX63NlhPVuB0LEGox6RyxUNa1ZRSNq+MVYrJYHMj3sABSOeQRsNukvKdNalW6i7Y7ux398l/MAFz7EatV1w/cE/Ps6LMMDHepAPtx7bklVAwWdmbQ+0OBRtGw+Sxv7a/PkNsMn6ydlaIwLAa82z/dceacEiEsHODZNCmoW27Zdjxmm6GKP92TomihSvwFKTjNdffjkpGSK/1gh/ayJ+ZWHkRmOkbK8BemcuhU4zXFNNbAFc0gVyjVgTYOoTuEIOSl6GsbYFzyYJC8HHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLrwY+sskOPDBdSZVyZM/JcQkXxvrpR574KWvORfqP8=;
 b=ghnU0cgU7MhTz3JRFiYn34rBLgraqlv4f0N8kKml4UoZ3A1Fo4A/WIpgpml9aDm7yGMVNkKQ7ZJHP4aMAADy0T+reuQr/XyouI7vYnLWDCTiglcO9qC81OYdZeb4x9x9k74kRf1AHomkqBmt8R6vsWcIZEBrnSG8K7wB6mYg9XA=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB3PR0402MB3642.eurprd04.prod.outlook.com (2603:10a6:8:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Fri, 31 Jul
 2020 23:42:52 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Fri, 31 Jul 2020
 23:42:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Topic: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Index: AQHWZyFjrjQabElMSUmE/uyQe+yec6khlL4AgAAB30CAAAZvAIAAHBiAgAAB7wCAAJ8lAA==
Date:   Fri, 31 Jul 2020 23:42:52 +0000
Message-ID: <20200731234224.GA13414@b29397-desktop>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com> <20200731140553.GA8013@b29397-desktop>
 <20200731141248.GC36650@rowland.harvard.edu>
In-Reply-To: <20200731141248.GC36650@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f298d5e-8413-4356-0485-08d835ab7138
x-ms-traffictypediagnostic: DB3PR0402MB3642:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB36423957EE647085D68D34068B4E0@DB3PR0402MB3642.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sn0s8Q+bt584yn6o1Ls6uV5olxgd4LNrVmz68lvMrTlRohHOguwaou8QPSSFZRZGQn/k3/0DX56YlJYGuKafF14BmCzYQCsdiZtHmmZg+H7zZF2FmL0ZI6j/R4b8c000TGIc5ySsu+MkH8935b1uim1CbA6snRRv7+NT57sOB+swqyU5owG9VS35tHfpzc7DP27rATyP9NEoIIp3pvC5eAQNfZYdDIdP5U5a4Oag7QLHng6UYWsGstS7XQhIpgTY/M78TaPwBXKObccC68H3JvLkOHVJaqJofuizw6JBiuNNBCffXDyiomXFCJfPmOudsZGSIGknVOunpWrdhYZlp0gphPFTc61y7mi8ooaATf8mUrIoEqxEGlAV1ZkyXPHE8wvPktd76Y5G04iQKMmj2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(6916009)(66946007)(76116006)(8936002)(2906002)(5660300002)(91956017)(316002)(54906003)(8676002)(478600001)(186003)(66476007)(44832011)(53546011)(6506007)(4326008)(1076003)(86362001)(33656002)(6486002)(33716001)(66446008)(64756008)(6512007)(71200400001)(9686003)(66556008)(26005)(142923001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +x9++HBKRdGATRD1QUCUMtpExYyRjP9Bal1Dn+tNoaKR9apyWXfB9fzsouihba4WQ2lM3ckrKtPZSUL1R4wj9LbmWxrLSeLwhuBN8IscGq7PejOrKdlAVZ0VwbajKqYPWpgB1bSofYvqwC05AZaMyw0US9B1GIbBENsnMq5fsnoklYFYpNzaOZHjYiCtSVVUDsmWnCN5nXG11/+NEK6Vpra99jfKFwNFdnX1pDLGOuSxy0k+SwxZFV34gapLy9FsWllYAn8u8KT4NM8BLB4KLkUWSYdMwvWSIvyCNdZjX3PtBK6tOCO7cH/GVSBFmjRuS35N19O/02ZKolw24G6hvZ2eY9xPywsN2PSu/izUgkWsBEesJjT/DNAaEjZr1DehZZel8K5i+A+zj4M3GzRk/jN8CPLrFlimbXEHprvZnir1nzHVVUsyPtBmxEcVZeCOvOdOAmSvKy8noBE0G2r4ONK/peye2yaWKFRQsYq7hwg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <50651B4E29338D40B6F1BE0BCDB48145@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f298d5e-8413-4356-0485-08d835ab7138
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 23:42:52.7056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWh4BCflgy+mBqfYCYrbCDpDx6gku6XriJAiwudrBjiUv/hV8cx0HuuK/RaHHRr42evrlmDDy+OiDq9QEu5xRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3642
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-31 10:12:48, Alan Stern wrote:
> On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> > On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
> > >=20
> > > Grab a reference from somewhere else and do not give it up for a long
> > > time.
> > >=20
> >=20
> > So wait_for_completion_timeout is suitable? The similar use case is whe=
n
> > we open the file at the USB Drive at Windows, and we click "Eject", it
> > will say "The device is currently in use", and refuse our "Eject"
> > operation.
> >=20
> > When we try to remove the gadget, if the gadget is in use, we could
> > refuse the remove operation, reasonable?
>=20
> No, the real solution is to fix the UDC drivers.  They need to allocate=20
> the gadget structure dynamically instead of reusing it.  And they should=
=20
> have a real release routine that deallocates the gadget structure.
>=20
> Alan Stern

So, the basic routine should like below. I thought the usb_gadget should
be deallocated before the UDC driver remove itself (UDC device
is the parent of usb_gadget device), I may not need to wrong about it,
it is just a memory region, it could release later.

xxx_udc_release(struct device *gadget_dev)
{
	struct usb_gadget *gadget =3D container_of(gadget_dev, struct
			usb_gadget, dev);
	kfree(gadget);
}


xxx_udc_probe(pdev)
{
	udc_priv_data =3D kzalloc(sizeof(*udc_priv_data), GFP_KERNEL);
	gadget =3D kzalloc(sizeof(struct usb_gadget), GFP_KERNEL);
	udc_priv_data->gadget =3D gadget;
	...
	usb_add_gadget_udc_release(&pdev->dev, gadget, xxx_udc_release);

}

At xxx_udc_remove(pdev)
{
	usb_del_gadget_udc(udc_priv_data->gadget);
	/* need to never reference udc_priv_data->gadget any more */
	udc_priv_data other deinit;
	kfree(udc_priv_data);
}

Since all structures xxx_udc_release uses are common one, it could
replace usb_udc_nop_release at udc/core.c.

--=20

Thanks,
Peter Chen=
