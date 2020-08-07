Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9599623EAAD
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgHGJov (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:44:51 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:31102
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727017AbgHGJou (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:44:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0zYXZfMfBlfipgDLqfOtuHcxeZ0SIFHgbrRFIcblLP7P8wtBWGpfALEykSXK78Tr43NOV9VGcj+749MztI+4nbSbiePTsXfTioblVKx/SJ+AAoifZZk6sO6rj8zXpy0ywbkh/pO2lWjXmsb1clDSwDUXyNHUuWXepT6rOlyO9rNVBvV6WYINnB56tPKpx/DUXMEmFd+26UmjAokHxxf+Na6t8DCfdjKHFAWtjT78ejuHo1b5EprH2Ht6bfY2tXP2HmkRwRnIipN5haHxPseGxqWoj8XMqWqDgNl1j9xrkGbWPXDFZr9E9oMVQv7c+6e7LsqoXKlCCR4nc3ck3o7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggs64zyauEgym+WL6WjeniPX6f2M0/WaDdhLVQ72MUI=;
 b=aTR1P+q/iSUnAbeKI7adXRXxXt4ZmBZfsGPPQY+P6TkEjSEfLF4mvMryFDdEtph0Yvb5EmAapYgIAweWW2d+246uLeE6wiM6ZxHxQTMfqchd0gP/AR9y+67FDzvxcWz1BbwWoLTdsuNuhwX2/YeKVFqDFFrSVJiSq4W9hvd+o3MkwXHFI+R+LN7Eg8/SXdrvUr1iYHb+9Pu8ss3u+yqbeXoSk3NOpKDHKegKmDJ/0bbvH9lLrx3R3mIYBg+giIzT+IgNqUWHqlUPmgC1h/btaFuwbsHrnO5ipz13+1D3vHwrO2pvT/lk1bwAp4mw0Uyfsqw8FCj1+rdDozVG0mIoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggs64zyauEgym+WL6WjeniPX6f2M0/WaDdhLVQ72MUI=;
 b=MMRO5Hvg1eNOWDQe/YnJSqWu+TkmY5Gd85i0jmMB+Ur5xb9xj7qNfqlV3K69GfrgDC6Rggpq4ve4mvNKv4mXxklkcHcUBIj19M3zI+Cukgj+IN93rhArl62RdNhZl4oV9KSdKZcOsSACIHPuDAq+I+ettgtIcySovUYh4/P40l0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:44:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:44:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC 3/4] USB: UDC: net2280: Fix memory leaks
Thread-Topic: [PATCH RFC 3/4] USB: UDC: net2280: Fix memory leaks
Thread-Index: AQHWZeYhmVwzqjjWmkOV7PIsBZoLa6ksC3yAgABnTAA=
Date:   Fri, 7 Aug 2020 09:44:46 +0000
Message-ID: <20200807094406.GB17207@b29397-desktop>
References: <20200729202328.GD1584059@rowland.harvard.edu>
 <20200807033423.GA17207@b29397-desktop>
In-Reply-To: <20200807033423.GA17207@b29397-desktop>
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
x-ms-office365-filtering-correlation-id: 191f0f67-f851-401c-3dea-08d83ab68536
x-ms-traffictypediagnostic: AM7PR04MB7077:
x-microsoft-antispam-prvs: <AM7PR04MB7077FA02EC5A5798351FC4938B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ksFxqf2UgDWLsbWwEMJ5C02J69qoE7nF7QTC6IB5Q4NHPsMTkWXI8V8UQb5UwCYxu1EhosI4y0Q3eTqjLG5mcOGVUlHMBr39mHPVHc84IUlZtqY3wOiPqrsFgAtF6cos3G9o46tFAw2tTQXrTmPrkREJ/EesdhGysJxLVAXGKh7sgpqZDEVrlcEVuPCOZZOfsyMwgZm2zY4z1drXDfr1dzqoSeE3v9SWIKRkk+Ts+HY4U5LtL4DLZI4CuIrJv9DUmwT2SlzgDdhQOl1MncM8YhuuIYv1gQeB6RPGWV48lyFbT2tGSrpcoE5C/I6mTekgkPenEkMS4Uj9Wic8YvuhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(8676002)(83380400001)(53546011)(8936002)(478600001)(2906002)(6916009)(316002)(6506007)(1076003)(54906003)(66476007)(76116006)(33656002)(6486002)(33716001)(91956017)(66446008)(44832011)(64756008)(5660300002)(86362001)(9686003)(4326008)(6512007)(26005)(71200400001)(186003)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SkAm0Y0uOqMnkryz8oXPNgBBH2vgH39m3IucAPkzNAo5hjKTWQZFQRKhpM6dQHx0DJebXsDY12YcSbYAClT0iuDv6D3C1tFPnPNu7iF/JaJdf3t5oUCb0oQpZLy/E9wpzLILOnyqmI5yo16rI0ph4cVPy2UUEdBs/7NctB/2H8PynTFbEnwyiGwOy9YimV2hIByhD+2EWyttmqQfxfEdtpI0vPQUu1tb4bURIw3JVxqtOicl55xwdvnpDOL+z/+1MJCPyrv/9YXVIxrrOi+UecWRZJzEkiQ+PcUbCIM5syOn41lOjUSn9qxUgKlSHUpwqvAxAZSYptOQp5I4k9Wjs2yexuHM2Dad6MNBZW4jPDbHjlfI5m7llZI9orTQXjy2hg66DZWO0QcwJ503ZTYX6cXy88r4gzI49qTK4zQPOlx5bI1hx40L0u0Ty4jg0Erp0qAwHD2K2mIbPiMelbwA0smbmJvUA+zIWSEanLYiU2C1KCwAYPno4g3NFKZvvmSTenM6UdpUkmwt5uk42vGvFC5CVtjV3O0D0zfk4tiXGn12o8VAVE/i0k5ZDv0e/ONPjffoYoqPJkag6jmZF8ct8A0qqRjcWEWC2uGJ3ecU7+tuiYfHEPQmGyRNBr9JTihvXiPFa7vw/lbSxDGaAQPpMQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29380EF69FE5744392CE45D0835F416B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191f0f67-f851-401c-3dea-08d83ab68536
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 09:44:46.4735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FI4IIA26jRdntu9vJIUqL4O2EEisEDI/0L6GzKJ/zmk2GhABURzihteO5e1M3l8GY5uiSQziTMHedSm9Hhq46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-07 03:35:17, Peter Chen wrote:
> On 20-07-29 16:23:28, Alan Stern wrote:
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
> > doesn't mind getting called with a NULL pointer.
> >=20
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reported-By: Anton Vasilyev <vasilyev@ispras.ru>
> > Reported-By: Evgeny Novikov <novikov@ispras.ru>
> > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >=20
> > ---
> >=20
> >  drivers/usb/gadget/udc/net2280.c |   10 +++++++---
> >  drivers/usb/gadget/udc/net2280.h |    1 +
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >=20
> > Index: usb-devel/drivers/usb/gadget/udc/net2280.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
> > +++ usb-devel/drivers/usb/gadget/udc/net2280.c
> > @@ -3572,7 +3572,8 @@ static void net2280_remove(struct pci_de
> >  {
> >  	struct net2280		*dev =3D pci_get_drvdata(pdev);
> > =20
> > -	usb_del_gadget_udc(&dev->gadget);
> > +	if (dev->added)
> > +		usb_del_gadget(&dev->gadget);
> > =20
> >  	BUG_ON(dev->driver);
> > =20
> > @@ -3603,6 +3604,7 @@ static void net2280_remove(struct pci_de
> >  	device_remove_file(&pdev->dev, &dev_attr_registers);
> > =20
> >  	ep_info(dev, "unbind\n");
> > +	usb_put_gadget(&dev->gadget);
> >  }
> > =20
> >  /* wrap this driver around the specified device, but
> > @@ -3624,6 +3626,8 @@ static int net2280_probe(struct pci_dev
> >  	}
> > =20
> >  	pci_set_drvdata(pdev, dev);
> > +	dev_set_drvdata(&dev->gadget.dev, dev);
>=20
> The gadget device's drvdata will be written by usb_composite_dev
> structure pointer at composite_bind, composite_bind is called after
> loading any gadget class drivers, so you can't depend on it at
> gadget_release.
>=20

I do some fixes about it for the new series, if anything is not suitable,
please commit.

--=20

Thanks,
Peter Chen=
