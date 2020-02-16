Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428CE160436
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 14:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgBPN42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 08:56:28 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:15694
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726618AbgBPN42 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Feb 2020 08:56:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnBWea3hLJLlSGJbTpGMjU+v2blrl5/3hmtytsDXGWZrVWlwIuMW5DejzCByppR3HkvaCTQWGrV4gLnrBVsrISXgDupHJotPlIHLnb6O83wN44fSNqfwl3klICrHeWMhgG8PD8KckDu1/8NEOwV0AFBBBtInKtKj12/ZfjecLceGQH1GVZ7vZ/tMKhB4JxISNv/U/XRUlQU+8M9uFW2SB7xheDuSJCE01KUI+rA8xb2NIiGLB9SETUtqOhjxwmQryQYEYZieu9S/l3GcT+UbUuXtEL6OUpBu7ogdZVyEkSKjuHzZ4iHRepIP9ncGSCWEC6sw9zi1xKysuUaWlfd1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU9yNaga6jO+n4zZADw+yEF//94K9HpRwk9Efcy8CTo=;
 b=Nbvae2p9FNoF3eZLb5/HtNnbm8w6h2/pmksWRW2+7rJ7TB9DTyUNZ2EW9ofKQKuKZSN3T5ZyHM6hb4dt6mJKYT0T27zdHBughQaBLNj2OszwWgiQnueBjlTGwby5oy2V6lL3VTrKSILDXR+7VLrMTQKsQonNyy1sCy8jsmnrrlpvtBv5V18eYNx/CRER4SG5i0BlqVQ72dlhqvRIXCvK3zi47/GmfllQQ18kCCi8taTKenYJp2/8Wsdd4i7xsSI7trrjM2Y9ak6I1YcL0hXVeqhlDo83WihRWTHzL9LXw7PLvPY76oZyxm8d956WLDdZxDnI6xMwwxWkekPg7N+HgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU9yNaga6jO+n4zZADw+yEF//94K9HpRwk9Efcy8CTo=;
 b=eZt+2ANGEDmUPjjwUBbHkjHtF5m6Vb8AVkSrPQkHLPCosTDEI2JncnfMUP4fP6nEcgWBN0kWSwEm4H2uQGEihM+/FkSx21xkzMMigth/y8PYx9AdWAVxPyflvIND42nI7Hr21LKQM46Kc7itzXb7ofw1QhenfInosywba4yTqMI=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1SPR01MB0349.eurprd04.prod.outlook.com (20.177.59.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Sun, 16 Feb 2020 13:56:23 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.028; Sun, 16 Feb 2020
 13:56:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Topic: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
Thread-Index: AQHV4wZvpgdaVZifT0KdjSwZbI+W/KgaYReAgAN6nAA=
Date:   Sun, 16 Feb 2020 13:56:22 +0000
Message-ID: <20200216135624.GB12539@b29397-desktop>
References: <20200214071414.7256-1-peter.chen@nxp.com>
 <20200214071414.7256-3-peter.chen@nxp.com>
 <97bbbf7d-2718-b6a0-2fda-6cac21643dfe@ti.com>
In-Reply-To: <97bbbf7d-2718-b6a0-2fda-6cac21643dfe@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d24121a-4114-4f03-356f-08d7b2e801ec
x-ms-traffictypediagnostic: VI1SPR01MB0349:|VI1SPR01MB0349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1SPR01MB034967C70DF3E716CB6066828B170@VI1SPR01MB0349.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(54906003)(86362001)(76116006)(66476007)(26005)(91956017)(316002)(33716001)(1076003)(66446008)(66556008)(6486002)(64756008)(6916009)(33656002)(4326008)(5660300002)(44832011)(6506007)(2906002)(53546011)(71200400001)(81166006)(8676002)(8936002)(81156014)(9686003)(6512007)(478600001)(66946007)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1SPR01MB0349;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hs/71ZAcX/V9Upn66vwMHO4jJQ0aaUm9djMVSG62bwxEX6I8ejSXXm38QLXiJBfnkalDIhldQ+xS1wzYcn//ws+aObEnX7mGpyGDnJYFYAHAfWx/lcgDnpELGYQ84r/hqyngFTIrAMhaFxZ4rWJvYzBH14FWElNzUbB1LxY6dD1AnY2NvMKBEaKUOrVWGvfXM+XrEpFuVLwohP1tkWZHGgbcsr3hLFUjHTqMO9NUHcUPaGVYTxsGUUzqONJ1J6BWO0oj+YQRLTxaoSCgiZvG/HXKDZdRpTxLjeX8038pg3kdnPHklMI5yyYPjkY4VWK4gp0HJxeqvRIPvtzL9IgRwtZSpKiraaXWjeiYLqYuT2hTCQ7ha/UWTv5j93rV1wLyywTzsJwp3w7a7esaoGOnqY5JP0Z0UsSJrOcjhuWaLZQfGYuLx1Fn0300FwdQeE+r
x-ms-exchange-antispam-messagedata: iYhnzT1YzJweXuqejD5wyrXY9VutOQDxDXvWG+lHxq7YZEYSMvsRMLK6xeIsvLriKyis3xBKS4asvfTuhC/+S6KVdTx7IuqyUufsGTK3pSHt+YhNuKfwmvKbIbR2sPCOY5GPwoVgdj8I6gXXdcSoAQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDD886E6D6912C4AB54BCA1E44015CBC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d24121a-4114-4f03-356f-08d7b2e801ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2020 13:56:22.9479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3bwS+q4O7uS30vG2/AqUBkDhIj/RscjfGPyLX+sN6//XLRkxQRKU/o+W/Dsf5h6cR9XP7lAMXdaU9TwcQdTxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR01MB0349
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-14 10:48:47, Roger Quadros wrote:
>=20
>=20
> On 14/02/2020 09:14, Peter Chen wrote:
> > If there are TRBs pending during clear stall and reset endpoint, the
>=20
> s/and/or?

I think it is reset operation, just I observe it at these two operations
together.

>=20
> > DMA will advance after reset operation, but it doesn't be expected,
>=20
> s/doesn't/isn't?
>=20
> > since the data has still not be ready (For OUT, the data has still
>=20
> s/"has still not be"/"is not yet"
>=20
> (e.g. for OUT, the data is not yet available).
>=20
> > not received). After the data is ready, there isn't any interrupt
>=20
> s/"there isn't any"/"there won't be any"
>=20
> > since the EP_TRADDR has already points to next TRB entry.
>=20
> remove "has"
>=20
> >=20
> > To fix it, it toggles cyclt bit before reset operation, and restore
>=20
> s/cyclt/cycle
>=20
> s/restore/restores
>=20

Will change above typo.

> > it after reset, it could keep DMA stopping.
>=20
> It prevents DMA from getting stuck up?

It could avoid unexpected DMA advance later due to TRB content has
changed during the reset.

>=20
> >=20
> > Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >   drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 1d8a2af35bb0..7b6bb96b91d1 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_e=
ndpoint *priv_ep)
> >   {
> >   	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> >   	struct usb_request *request;
> > +	struct cdns3_request *priv_req;
> > +	struct cdns3_trb *trb =3D NULL;
> >   	int ret;
> >   	int val;
> >   	trace_cdns3_halt(priv_ep, 0, 0);
> > +	request =3D cdns3_next_request(&priv_ep->pending_req_list);
> > +	if (request) {
> > +		priv_req =3D to_cdns3_request(request);
> > +		trb =3D priv_req->trb;
> > +		if (trb)
> > +			trb->control =3D trb->control ^ 1;
>=20
> use TRB_CYCLE macro instead of 1.
>=20
> Is it better to toggle this bit or explicitly set/clear it?

Since we don't know the value for cycle bit, it is better just
toggle it.

>=20
> > +	}
> > +
> >   	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> >   	/* wait for EPRST cleared */
> > @@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_e=
ndpoint *priv_ep)
> >   	priv_ep->flags &=3D ~(EP_STALLED | EP_STALL_PENDING);
> > -	request =3D cdns3_next_request(&priv_ep->pending_req_list);
> > -
> > -	if (request)
> > +	if (request) {
> > +		if (trb)
> > +			trb->control =3D trb->control ^ 1;
>=20
> same here.

Ok.

--=20

Thanks,
Peter Chen=
