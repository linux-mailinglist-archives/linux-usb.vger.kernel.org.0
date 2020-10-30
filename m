Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652DD29FF88
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 09:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgJ3ISw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 04:18:52 -0400
Received: from mail-eopbgr20088.outbound.protection.outlook.com ([40.107.2.88]:19842
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725784AbgJ3ISv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 04:18:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHABjl1KDxT3gUBCQGPSxgqv3Iul3TEq6wdIaUgr7G5WlT6VPur7ZvXTb3X+gQkGSA4fz6s1gJYCpTzyo6lwF1Ie7eF2/JpHz14hYqyTsOZl5qD3MA2cselNYLmymCoTlRtJrFFFOv6ZbZQJHyr2TxU4+/7Z7HPRZAq3B3bNWm0gnIyN8ewzlGeo1dnY3fheFUQlNIadYhkGP0Y7RNBQIB+dmmFHjHeEgYncydKRj/YvGO/A5W25QJYR/fg3k+HOUa+tqLeaWHyqrbxAPXIIxO1XCB8UrWG2b2g74mY1TdQ9gu41lvjjJd4hXVELT1tACxxy0M1iXctqXs0ZmjogiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFpq3yDFiF/G12CSMduMKGx9Ah4Ph7MIbmVfh9VVIoM=;
 b=g7bfEj2aIV/ImsOkso0h0450I1H+2G1LTLFr1SVUWC9BA+JH3XqhbftbWZzPe5S7V87ruqyzSHsd9UVURz5AfFNO5rGcIUrCi4yA0d8SgXCAaN3zSAoIV57AD/tBTDGyx1W6xyN8fNkDdwjLrTN68LvlECMfcF4FbrtYAelFVcaBAJowyORuPrCbUFscR8+Dmzt8Uyd4K77ZB7YCskrWmy/mnaiTX1x9wcumU7utlentbADbKGzPDLXKM2GGDEu9l1x+9xksyUfUH9uef/OVW1KAb1HoPKJVFWehQKfKuIjhOZVPEs3JCMGN9FWEp/ao1qqkXiHMvXs/JwV+ohkIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFpq3yDFiF/G12CSMduMKGx9Ah4Ph7MIbmVfh9VVIoM=;
 b=G4VQxPBQgvy3gzM9Hq7s+4wokmmKmZ1PAZm2N5m2R/KNYQupPRM3nnRIZ8Sp0+ukcpNnqYHKyc9Ld2PnyyxeyGc675WlMBgvcqVUPIUMAj6haPJ9duJ/IUhc5fjj/j9ENpCxMHpS8BJ/DiKpo1ISbd5QTTWlqSByC6zy2QuDwfk=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 08:01:43 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 08:01:43 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mike Galbraith <efault@gmx.de>
Subject: RE: [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock
 held.
Thread-Topic: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Thread-Index: AQHWrWkkCR4qtkz2JEe9KPalNa285KmveJUw
Date:   Fri, 30 Oct 2020 08:01:43 +0000
Message-ID: <VE1PR04MB65284EEDB8B607FF28B4DBDA89150@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
In-Reply-To: <20201028203124.375344-4-mathias.nyman@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.64.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41f37021-2235-4946-bbd4-08d87caa0aa8
x-ms-traffictypediagnostic: VI1PR04MB4958:
x-microsoft-antispam-prvs: <VI1PR04MB4958AB6F423C4066E3DA110189150@VI1PR04MB4958.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M+JyQlaXXchCz5ckqqClXOZctT8+vtuYIigfLie5dux4yq6IFEqYxKNyD0O4AZAM0vdKvhro2Qe48L2up1CUarsokpNrFlkJ0MhGfpoQTPkirf31Yu83AtDETFD0S0HYlU5y1KquV2QJKuomCcTnKC5oJUY8UhvvsUo7W2Rv4xzllZYkpZ7WTcXVCQlJsEmvO73NVxSnPC5iPMO8qVersc4PssyjrHYnwAdpUQNjTlE4a0UiIRGyYM9APNhCQDjMmS1/Er+Gavn8V7D4N8Oa3tNDKTwfFpMVPVTWEIgS6HYZTJTiWs/r9nZRPSh4hdVoaDMhPlo+5NIyp0WbEL8tlw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(8676002)(71200400001)(8936002)(83380400001)(2906002)(44832011)(9686003)(4326008)(66946007)(26005)(186003)(55016002)(33656002)(110136005)(316002)(478600001)(52536014)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(5660300002)(53546011)(6506007)(86362001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IYggs2qrdmjOiYu801DY/LJ2H9NDtWreE2tJpfrRtY0nYtZQnWa7+/RCa8A2VmxAJn0TKzd0UC01CobXaLF6/hvsh9uv/ZRCX2eYJBMV2VUJ4lW49Ebtwkkr+/ynOHHoSwckWq9pm0S5xE8z6DsuqTL3w3rrQzxv1DIYoydlqY2BHcq4gaZQozp9VU/doJZtuUe8xbo7Rqra5Q7ZcdMI0qYv4AjHQszZdJmNYHS/h0wZEFPDIFjXhi+4rRGc27pFJ4ZMKl519ynDegNk7icp0hwdO9GtDjUCsBDQu4hK9yOcQS2lGDfLZd3XRoOMLc2HMtCTMndqnqnGOMJ4VkP8ft/NCucyI2/tQLpXMQ/cNI6tZzg4sgxxTxj625us9gjonDEKLCN007AA7q6lnkOLCrjncm1YO+TKFAZ+j6qAhnkfWnKeNmhsGI600UmPL+Jkz6rCjl6UKR18cR2+KxqD8kmRthpNYRE2swGtTwNCuTY44h+hzE2KRNQB8m7c0BfDJpBPKCY7GdH/lTnBhsrmb6ggvUv3U/ybF4dD7f3uqhLdwyNZZq+DlEkcq4E1Ilv7OAlXVKjEgWewNXXmV6jwBqU3PZC2TZ1k1iM0jrnTWWVEyeuMYCJJ6midf50D/ZL8qVmh+/NaJnCk4ZXJVI3wzg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f37021-2235-4946-bbd4-08d87caa0aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 08:01:43.6850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kchDgI4ktZg9Lw4iTZikeEuFLFp2D6DPXeeQUf3H2LOIgSyaYbQzDX1xf1E8NO3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4958
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> Sent: Thursday, October 29, 2020 4:31 AM
> To: gregkh@linuxfoundation.org
> Cc: linux-usb@vger.kernel.org; Mathias Nyman
> <mathias.nyman@linux.intel.com>; Hans de Goede <hdegoede@redhat.com>; Mik=
e
> Galbraith <efault@gmx.de>; Jun Li <jun.li@nxp.com>
> Subject: [PATCH 3/3] xhci: Don't create stream debugfs files with spinloc=
k
> held.
>=20
> Creating debugfs files while loding the spin_lock_irqsave(xhci->lock)
> creates a lock dependecy that could possibly deadlock.
>=20
> Lockdep warns:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
> 5.10.0-rc1pdx86+ #8 Not tainted
> -----------------------------------------------------
> systemd-udevd/386 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
> ffffffffb1a94038 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x22/0xa0
>=20
> and this task is already holding:
> ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at:
> xhci_alloc_streams+0x5f9/0x810 which would create a new lock dependency:
> (&xhci->lock){-.-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}
>=20
> Create the files a bit later after lock is released.
>=20
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Reported-by: Mike Galbraith <efault@gmx.de>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> CC: Li Jun <jun.li@nxp.com>
> Fixes: 673d74683627 ("usb: xhci: add debugfs support for ep with stream")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Reviewed-and-tested-by: Li Jun <jun.li@nxp.com>

> ---
>  drivers/usb/host/xhci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index
> 482fe8c5e3b4..d4a8d0efbbc4 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3533,11 +3533,14 @@ static int xhci_alloc_streams(struct usb_hcd *hcd=
,
> struct usb_device *udev,
>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>  			 udev->slot_id, ep_index);
>  		vdev->eps[ep_index].ep_state |=3D EP_HAS_STREAMS;
> -		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>  	}
>  	xhci_free_command(xhci, config_cmd);
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>=20
> +	for (i =3D 0; i < num_eps; i++) {
> +		ep_index =3D xhci_get_endpoint_index(&eps[i]->desc);
> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
> +	}
>  	/* Subtract 1 for stream 0, which drivers can't use */
>  	return num_streams - 1;
>=20
> --
> 2.25.1

