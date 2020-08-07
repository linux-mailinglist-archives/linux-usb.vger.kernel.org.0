Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE11A23E657
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 05:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgHGDfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 23:35:22 -0400
Received: from mail-eopbgr10084.outbound.protection.outlook.com ([40.107.1.84]:21313
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726038AbgHGDfV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Aug 2020 23:35:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAPS9O5wDKyxWw+lxgeddf9nZ7nzKXtyPyC/2p2nJFi20dT/PGUT909MYhTUZ6RbjKSbrGWd9A5gbmgwdPlWFsCdq1gO2wZlui0XTIO4SakgZgL29S9JgL5OfYOknPQrfNP2JANp31KPT1ICujKi5yWWZflkaRmvmK2VAO8L1RzWYi9k0ZJzwBkv2lq6NnQp8n9z07aO1fIcH19dMcizOqGELDDmFELFz7xQU50YGK9XaSUfaBm+mkJ9KWn9bT6DXQjVMvH4MPQ+Fm57onjWF4BSrpY8ug3y6KHccWOefqrHJZXIO/55sUKTICCj4es8J2HtVO4kzsBsaDhwxoaQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyHs5PEXe+gWBojmdCrQWCnOKYRLSCrVoTc7pnVJXDE=;
 b=OGTHbklO8JKPVpi9kFHq9jMjbil6DzJ34xNRJ1I0N4qKk9xOZfiFHONSj/2hrzzdhku6J37TWWcDT6IBhFqnQ28lRAwpofcOTTa3eZnIkeIxdtCZ06tUGJgRwK8IRahCh/fLgjM44IEpVy3L+HULIiVRJ2wnajtvYbSiAkCi67g8GUhdH/hnSEovA6hs85c4VtD1FuVdRLhhrQCLSOXtUDJE7OkT3A/AUODcQRETjuZgyjfpPf8EllTuGuO67u5PNdDaEbCYiucmomLrr52esPThMM2TAYfHknQKNcjBrBix+iD4orAyUDEmbgjXufb5zmLrnRB0QzY2LDFXdVXzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyHs5PEXe+gWBojmdCrQWCnOKYRLSCrVoTc7pnVJXDE=;
 b=MKWjmIIYMNyiRkZeo4lFBclTfWMZ56hj41QqaiWeVm/5KDF3jK210k6DJHwv6Ra6bFHOrrHwiZ7dYpHYBn3RRAtFHZWjpZDQ10RtZ8mKAc5VWpmnXeVTpVy1BQtbVgaVCkUTac+uEdibTOHb+v0GxEhMJAD8k/xyBhxEmyTuuxk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 7 Aug
 2020 03:35:18 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 03:35:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC 3/4] USB: UDC: net2280: Fix memory leaks
Thread-Topic: [PATCH RFC 3/4] USB: UDC: net2280: Fix memory leaks
Thread-Index: AQHWZeYhmVwzqjjWmkOV7PIsBZoLa6ksC3yA
Date:   Fri, 7 Aug 2020 03:35:17 +0000
Message-ID: <20200807033423.GA17207@b29397-desktop>
References: <20200729202328.GD1584059@rowland.harvard.edu>
In-Reply-To: <20200729202328.GD1584059@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: 646b01fa-918b-4416-5aa8-08d83a82e7b6
x-ms-traffictypediagnostic: AM5PR04MB3137:
x-microsoft-antispam-prvs: <AM5PR04MB3137F4E10F5137136B7CD8068B490@AM5PR04MB3137.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5Y4/xHhfRQIpl2nXjDzV9B0wmNFlQwCMs+cpJA8CymGgedQ2YBN6afOEwzc8wBb3/8gUUHQ6sAPvMfhloQv1O42+WQcDERKFOp7UjDnSnV6syrYsXfTc2nSdYYgH/DKI4uCbf4zJbMvYn+A9OTWfBnZcnx8n6kzDwwO6AVO4OAsOmnuZkuON/G+uBBjyGAh7oQVoSLdx5rM1KPIPjQxOG6pSCSvaEAkZlq9dctmL7KS59H9i0LiM/byZjYTCkzOVs/J5zLM49HS6AWEfovcscgnDyJKF0cLINAdLsCDzcTeNAYl0k+8ubnGL/5tb9KskBh88k/lhRKpk0BqqAUbdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(83380400001)(71200400001)(86362001)(6916009)(44832011)(33716001)(2906002)(54906003)(8676002)(91956017)(76116006)(26005)(66946007)(4326008)(66556008)(64756008)(66446008)(1076003)(66476007)(186003)(8936002)(478600001)(6512007)(6506007)(53546011)(9686003)(6486002)(5660300002)(33656002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MUaJUowV4MsSPQYUjYdcK1GkOQdRV9ez4P5dcL9eI+FLkO0H5iyffMhNdrY0XBT4UbXo0MjQ/l3BdNO5Ymi0hCvx9aETK4EhwPmp6GToIZYFphklpSQe99FD9qur/ly7MOyvOW3vP3jWnbhXj47JrM18QWf/RcVFl4wwhXsAnerVjtgJXl/YKuG8yL972JcVQXeUBUSMKVXrasyMfwkRE5OHIZGmWxfWzG9NwzhLIzip0JJhCVMzyQo/D8TPC5tZREM4g+Q9Yt8JtsvdcZJu189nKmliCBZGETfsjzs0Qy/tLMyMHz71r8z5HOlYWk1US95pLuE7T9HKR4gK4v9vbNMY+0xWyPpMa4gl3ohlGbH4gmYNj4PUSseJjSSdodPz3+9UvCHLKylO8D0bOqbEw6DrmVFn0BJLTOpbH1FnzZWT1xkpezCBsGyRN7ir/mMfP+7tR5Y6pNM+fQvEoq7o0Yj/lj6HlvYwIhNHNM715Rzd5jG3lcFPfph3yPig3j/NFNHWwYjCYxrFTGXkKYk9dYBAnm4eq5k4rWBe2S6q8j3Iie/dIso2lWPdEGnxOc80dIefEMfZtg8xCm12VNP3LjzSjroBSS2F1ftoYYlYsRfL0mts9Xys3ouiFTOSavv0/YRnwAwaWigrF8k5NAEX2A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7639AACA3FA2CF4FB3F1DF941FB4EC1C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646b01fa-918b-4416-5aa8-08d83a82e7b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 03:35:17.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0b6sCseGxoeELOS2aWyWQp8MTaED93tn6AN5FJtuRZr6D2yBG4xFpeagfduIyV3b4rX7Ri3mz1I8uzsXBAqSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3137
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-29 16:23:28, Alan Stern wrote:
> As Anton and Evgeny have noted, the net2280 UDC driver has a problem
> with leaking memory along some of its failure pathways.  It also has
> another problem, not previously noted, in that some of the failure
> pathways will call usb_del_gadget_udc() without first calling
> usb_add_gadget_udc_release().  And it leaks memory by calling kfree()
> when it should call put_device().
>=20
> Previous attempts to fix the problems have failed because of lack of
> support in the UDC core for separately initializing and adding
> gadgets, or for separately deleting and freeing gadgets.  The previous
> patch in this series adds the necessary support, making it possible to
> fix the outstanding problems properly.
>=20
> This patch adds an "added" flag to the net2280 structure to indicate
> whether or not the gadget has been registered (and thus whether or not
> to call usb_del_gadget()), and it fixes the deallocation issues by
> calling usb_put_gadget() at the appropriate point.
>=20
> A similar memory leak issue, apparently never before recognized, stems
> from the fact that the driver never initializes the drvdata field in
> the gadget's embedded struct device!  Evidently this wasn't noticed
> because the pointer is only ever used as an argument to kfree(), which
> doesn't mind getting called with a NULL pointer.
>=20
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-By: Anton Vasilyev <vasilyev@ispras.ru>
> Reported-By: Evgeny Novikov <novikov@ispras.ru>
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>=20
> ---
>=20
>  drivers/usb/gadget/udc/net2280.c |   10 +++++++---
>  drivers/usb/gadget/udc/net2280.h |    1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20
> Index: usb-devel/drivers/usb/gadget/udc/net2280.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
> +++ usb-devel/drivers/usb/gadget/udc/net2280.c
> @@ -3572,7 +3572,8 @@ static void net2280_remove(struct pci_de
>  {
>  	struct net2280		*dev =3D pci_get_drvdata(pdev);
> =20
> -	usb_del_gadget_udc(&dev->gadget);
> +	if (dev->added)
> +		usb_del_gadget(&dev->gadget);
> =20
>  	BUG_ON(dev->driver);
> =20
> @@ -3603,6 +3604,7 @@ static void net2280_remove(struct pci_de
>  	device_remove_file(&pdev->dev, &dev_attr_registers);
> =20
>  	ep_info(dev, "unbind\n");
> +	usb_put_gadget(&dev->gadget);
>  }
> =20
>  /* wrap this driver around the specified device, but
> @@ -3624,6 +3626,8 @@ static int net2280_probe(struct pci_dev
>  	}
> =20
>  	pci_set_drvdata(pdev, dev);
> +	dev_set_drvdata(&dev->gadget.dev, dev);

The gadget device's drvdata will be written by usb_composite_dev
structure pointer at composite_bind, composite_bind is called after
loading any gadget class drivers, so you can't depend on it at
gadget_release.

Peter

> +	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);


>  	spin_lock_init(&dev->lock);
>  	dev->quirks =3D id->driver_data;
>  	dev->pdev =3D pdev;
> @@ -3774,10 +3778,10 @@ static int net2280_probe(struct pci_dev
>  	if (retval)
>  		goto done;
> =20
> -	retval =3D usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
> -			gadget_release);
> +	retval =3D usb_add_gadget(&dev->gadget);
>  	if (retval)
>  		goto done;
> +	dev->added =3D 1;
>  	return 0;
> =20
>  done:
> Index: usb-devel/drivers/usb/gadget/udc/net2280.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/net2280.h
> +++ usb-devel/drivers/usb/gadget/udc/net2280.h
> @@ -156,6 +156,7 @@ struct net2280 {
>  					softconnect : 1,
>  					got_irq : 1,
>  					region:1,
> +					added:1,
>  					u1_enable:1,
>  					u2_enable:1,
>  					ltm_enable:1,

--=20

Thanks,
Peter Chen=
