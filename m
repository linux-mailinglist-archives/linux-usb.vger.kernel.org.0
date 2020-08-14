Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151F92443F3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 05:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHNDpA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 23:45:00 -0400
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:56352
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726568AbgHNDpA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 23:45:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMKeHd1PfoLrNhDlNHGgAxaqbFBWMDt4FXLsABYYZJNZXfENF5FEl26Olw2lEzbQL309J1j4XqZ5sITlL/6PxU80r/lWmhT6g4vRdAxYv40qcAvaQYA16GnKLB19lA48wG2xz4utwa5SM+r+6PcpwkDIR7o1yOvRoEePWNA+eW3PKD9GQtGtfcyvq2wlSyiV/SCN6aPHNR+fnlFc76wsycwWogChGtbvvhiUyovw5o+1EEK7yUhEI24YaADNKQnRNGFx2w/dipjMYTdT0r8PQc9EiaqQXmZcT9grmr/8wi+RiWHyqZ3xJ9FqVVclFaIC3Hl6F5Vl7HlmyQ1lZ894RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jewGzhcfd5FJwcLYwnlrf3JeHsIBvZIQN9Man9pq16I=;
 b=SC40m6zVFPf9T068d2mhavfnXoClp1pUuUS9gJWL4YpHJ8mpqKmnUb3JDw3A1Xl+iwasWaJMLG6HnCHQM2vus8sd7F8wvaIvuNdxChvjCNGe+8UQ1Oaf7cYPpBsfuWMywgs7X80GWqb82zlvZLyf+4Dh+pYpBj0s6T32i/YNd0qlddnjeHdTp7GYleWkTYZmmYUCn2ixd3NizdKRF3hf6MilAxIAttCwAaJbs2R9fJbdIhbvJoJfZXybAGKQKN16hToQWtlMb02MfHjguzz/snhsvmaCBwMciLgCuBiAwZRTLreZP5aW+WinjORsF6KUtcsq/OqVVOU0gJC5Ne4+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jewGzhcfd5FJwcLYwnlrf3JeHsIBvZIQN9Man9pq16I=;
 b=XZRD+E7KSHffiJ/2inD3L3AGpZhPu1NWlKchcHhpUH3J/bq2W25WAv6VzzhRmd1prEi2EkIHm4fln914lsLNO6zMULML1fVL4O9C7ZxLfaZmDzjZhE7fmE98bJCzo7kVcPfZwio+jig9lYqBf7LL0MUw8ZRQkOMkLiOCmkRJeto=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB8PR04MB6476.eurprd04.prod.outlook.com (2603:10a6:10:104::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 03:44:54 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 03:44:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 2/6] USB: UDC: net2280: Fix memory leaks
Thread-Topic: [PATCH v3 2/6] USB: UDC: net2280: Fix memory leaks
Thread-Index: AQHWcSDEAWff1H7y/kOv9wi6Xhzy8ak2EQiAgADnAAA=
Date:   Fri, 14 Aug 2020 03:44:53 +0000
Message-ID: <20200814034400.GA22554@b29397-desktop>
References: <20200813031953.13676-1-peter.chen@nxp.com>
 <20200813031953.13676-3-peter.chen@nxp.com>
 <20200813135713.GA405784@rowland.harvard.edu>
In-Reply-To: <20200813135713.GA405784@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 93c61440-1d23-407e-4fe2-08d840046787
x-ms-traffictypediagnostic: DB8PR04MB6476:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6476578C9E62DFF4A59DF2AD8B400@DB8PR04MB6476.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CLEH7r9P9/PAWzHOytMBT36xahjElff95RrrIfhUTE97Y85aaPmVUuxMNNuUnMjgq1SKRl7ZV+aW8O2DmN8OKDEv+9FYbJ2TgEPPy34bSinBrrK38JcWAZUfm/eIXGck5xUt/Eprdw9nYyHZ8TBra33//+t//7mNwZSykoaj5FbXrJwQxGZ4YFBLnkk8nBVa1u3bOioNjYlq0q5ppZ1Y32YWDzKI+UEEa5jKo74W2zpIcG/sm/H22MYU3OT57aruMbLFY8STyms52Rmns/v74DjBrOjbbnsllN/PGqZ7R1DsImWsEqxb2wswpE9V0Cew4WFORLSZsUkCPFNT/fxpQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(4326008)(53546011)(6512007)(66446008)(6486002)(8676002)(86362001)(5660300002)(26005)(71200400001)(44832011)(9686003)(64756008)(66556008)(66476007)(91956017)(66946007)(76116006)(6506007)(54906003)(1076003)(8936002)(33716001)(186003)(33656002)(2906002)(478600001)(83380400001)(316002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: W4ajmEvMqnqq683rsbo9GX7MYTBDJW0qU3QhaeROAz4aW7HKE33+Kq/BnByOjG6mNFs4LsWuFhawu3bKT6B6A8fjiy/U58Z4NouSO0qN8YkfDD9iGq02TaPdgxyDffpVG7p0U+/1amLAx7Q+dG0Woh0jywHB2sf05o79WqB0GnFUej763l0O2QO1CjOlRxME094ozUx+jIOVGwglSCkHGDu3tGMoJBy7CJYU8ry+caTdUBHnnl5pZbntLTorAWqHGOR05JZ+hFMpGGzCLlIjSoAvrk78XqCbhInWEGXCmgGAi48pXy25xLKgutt12qeOk/uNhP75cm6KIo42RHMi/Tmj9fI7B4MZNPoaC4sjxF4UBDvEVD6Y8ETrO3CEYCqUSpG4ZAZ4PM3i+xyrpk+pzS9jj/I1Ca1dDgmLfFhwRzslcj+OAX0U4V1hVqP7Y3/FN4BuQgM0a3h8vURJEM/qAZFk7dMxRPi0tjGOiDktbzS4YxLC/jo26G7LScxZRGYBlwhTV//6k+MbFAgF1AjUTkLzUblhrd/t99QGh5bw6Z4o5sQ/LtbSD0asg9ixBNfa0kM5eJtfSD6ZMVXgbfDEM9Xu2qyHp33qZyh3Tu+An+hNxCQufsUHBr3Nb0JY9U1xWVbjBBjmj67GU4fAweU9tg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55285EF9EF6BC74A97ACC955C73129A6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c61440-1d23-407e-4fe2-08d840046787
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 03:44:53.3106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8JXBFtw8H0LcvT1tMsxo1el7qnPAwxkrXCZ/LtaDuv1XfwKEaj8I6BdwnRiD+yzr7sFqKP8xY6R7JEPPjKH5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6476
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-13 09:57:13, Alan Stern wrote:
> On Thu, Aug 13, 2020 at 11:19:49AM +0800, Peter Chen wrote:
> > From: Alan Stern <stern@rowland.harvard.edu>
> >=20
> > As Anton and Evgeny have noted, the net2280 UDC driver has a problem
> > with leaking memory along some of its failure pathways.  It also has
> > another problem, not previously noted, in that some of the failure
> > pathways will call usb_del_gadget_udc() without first calling
> > usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
> > when it should call put_device().
> >=20
> > Previous attempts to fix the problems have failed because of lack of
> > support in the UDC core for separately initializing and adding
> > gadgets, or for separately deleting and freeing gadgets.  The previous
> > patch in this series adds the necessary support, making it possible to
> > fix the outstanding problems properly.
> >=20
> > This patch adds an "added" flag to the net2280 structure to indicate
> > whether or not the gadget has been registered (and thus whether or not
> > to call usb_del_gadget()), and it fixes the deallocation issues by
> > calling usb_put_gadget() at the appropriate point.
> >=20
> > A similar memory leak issue, apparently never before recognized, stems
> > from the fact that the driver never initializes the drvdata field in
> > the gadget's embedded struct device!  Evidently this wasn't noticed
> > because the pointer is only ever used as an argument to kfree(), which
> > doesn't mind getting called with a NULL pointer. In fact, the drvdata
> > for gadget device will be written by usb_composite_dev structure if
> > any gadget class is loaded, so it needs to use usb_gadget structure
> > to get net2280 private data.
> >=20
> > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Reported-by: Anton Vasilyev <vasilyev@ispras.ru>
> > Reported-by: Evgeny Novikov <novikov@ispras.ru>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > ---
> >  drivers/usb/gadget/udc/net2280.c | 13 +++++++++----
> >  drivers/usb/gadget/udc/net2280.h |  1 +
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/=
net2280.c
> > index 7530bd9a08c4..31e49cc34316 100644
> > --- a/drivers/usb/gadget/udc/net2280.c
> > +++ b/drivers/usb/gadget/udc/net2280.c
> > @@ -3561,7 +3561,9 @@ static irqreturn_t net2280_irq(int irq, void *_de=
v)
> > =20
> >  static void gadget_release(struct device *_dev)
> >  {
> > -	struct net2280	*dev =3D dev_get_drvdata(_dev);
> > +	struct usb_gadget	*gadget =3D container_of(_dev,
> > +					struct usb_gadget, dev);
> > +	struct net2280	*dev =3D container_of(gadget, struct net2280, gadget);
>=20
> Please change this to
>=20
> 	struct net2280	*dev =3D container_of(_dev, struct net2280, gadget,dev);
>=20
> And do the same for the net2272 patch.
>=20

Sorry, my oops. Please skip this patch set.

--=20

Thanks,
Peter Chen=
