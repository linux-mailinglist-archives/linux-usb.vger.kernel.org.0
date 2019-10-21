Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2C4DED58
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 15:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbfJUNUj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 09:20:39 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:6397
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727256AbfJUNUj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 09:20:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3rlQjyVGYImDCqDUCvifnLHVXOh+ajg0I8kD9JT6EIpfeZkpXztqK6kRvaWudfI2v/mpmb+MJdX2EGhepxkMBk3YalYW+HlNqLeaEFrBYtrYor/lFnVgQdqMFVt6jU7oS0zpGCFFW8HqWtP8/4/5laNc053TtEWpccdoovpC9ipZyhMjC2BwwOfbVIO4h+1CutkWZnLRG9OujA7J0ksJqfJkjCgFciWc5gIkz9nQRf7IJ309w1IRKMXuQxEhPhVrELV1LP2LCmkqYpoCXi7PdZkPY9/SCf5EU8PUGeuuFThKgA7vhARzbN28NGvGfenKs5BhOuUI+WuuB+s7dz88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wex6wrN/P4hp+rD+cn3mU4PWYByjjaCoDbc+06hIQDM=;
 b=M7QmT8Px/KyMCDXIqiMZ4DWsZ9Ur015dFZm5enX4XjP/TX7yoyQL8XXqP/AaXtdiouqAV98Uizcgym9osdahQ6jRWzedrZMbF7GxOVQlGw7KF+qhNfN4ZCmz57p/7bzMTwVxqeuU5FeuHpo/KUYAaB9lszd56UMOlVYof5YLZnBJWCaKSpygyDaK7VFp4yY8BgLTx+TmV4s2Cz6v0kq1UQxFQ5g04IsgmT90DKSgEj9xUSGbYDghj5f/pVDY3RXrXDsx74HkRnMUWtdzslNGBBuQ8JvpK/XazaXbdFzOm9mkrw7zjNV1jr6vso/aKtrKG5n9qiNJFCeFFleAnMeqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wex6wrN/P4hp+rD+cn3mU4PWYByjjaCoDbc+06hIQDM=;
 b=H19QSt+0ziAklIL2MLUmxZL3Ru9LjVlwhxDJ4uTx1CZF7LgFeBh0DYJb2Ncd7w71OLcSjTuC6DTT6hIe+MrJvyKvDh0QRh0uMzRCcCb9+vnb7mCzUkpAW4/9D7PWuOBHDroGvCHFwCnmErkicWmEY8UXbCrFQ01cp9CkG0PeoYU=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBSPR01MB4.jpnprd01.prod.outlook.com (52.134.225.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 13:20:36 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 13:20:35 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 10/18] usb: typec: hd3ss3220: Give the connector fwnode to
 the port device
Thread-Topic: [PATCH 10/18] usb: typec: hd3ss3220: Give the connector fwnode
 to the port device
Thread-Index: AQHViAJOJ+NqmQs8i0+w4I8F8/E1zqdlE94g
Date:   Mon, 21 Oct 2019 13:20:35 +0000
Message-ID: <OSBPR01MB210351F044B093C4B3327C71B8690@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-11-heikki.krogerus@linux.intel.com>
In-Reply-To: <20191021112524.79550-11-heikki.krogerus@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 562fbce7-3786-4256-74c2-08d756297560
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBSPR01MB4:
x-microsoft-antispam-prvs: <OSBSPR01MB4AEDE891FAD66E85FCF6BB8690@OSBSPR01MB4.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(199004)(189003)(51914003)(13464003)(476003)(6436002)(86362001)(8936002)(52536014)(102836004)(486006)(55016002)(446003)(6246003)(66446008)(64756008)(186003)(229853002)(110136005)(66476007)(54906003)(66946007)(76176011)(3846002)(99286004)(9686003)(6116002)(14454004)(8676002)(66556008)(66066001)(316002)(76116006)(305945005)(478600001)(7736002)(2906002)(74316002)(33656002)(71200400001)(256004)(5660300002)(6506007)(71190400001)(7696005)(14444005)(25786009)(4326008)(26005)(44832011)(53546011)(81166006)(81156014)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBSPR01MB4;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYnERHnVmhk+atK8P01MWixWbww05fabQcJLKRj0KmawgsRY1GcLsMbBAtpl29bc9i9ltaRoNYQHvcFhmokAXJwKQZyhdoXMJo5/15QeqTfARF0smZRWQyBnJRxFXNpFL42HiIeoBLjkEuzKEw2kM+CKehDc+bceH403idNUPyAsSD6q5k/IlbtIgvTaIFLbdlznSZA+WEKjrV0x0FSe6uo41RHez2Ho25uNqEW6lVxFWr45UuKr3FTYM7zf0HVKF1/oPrB9d/u/kocSGMFGYbHaf5xUhLzz9N3tKGuU4NORxEZaR9sbQPDtTsg4DARk2raOQpEIQSumJGIk9e/zCNfEji4pkPhtz+BCRHr94tC96115o/QnupoiDC080BXbCmTWlF/owUs+Cz0BaSLm+BzXgFq7PdFxeo2tmEw3fQGXenMKDT5VFVnvFM6Mr7tx
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562fbce7-3786-4256-74c2-08d756297560
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:20:35.7848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSO2f7TpYpHPpX6NuXpYAsTpFmd9JDuEThAxeMvxmPeBJfvGkZ9Hcnq23GT930mFw6A3DNAWJ//+OqzB4Ezptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBSPR01MB4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for the patch.

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Monday, October 21, 2019 12:25 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> linux-usb@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>
> Subject: [PATCH 10/18] usb: typec: hd3ss3220: Give the connector fwnode t=
o
> the port device
>=20
> The driver already finds the node in order to get reference to the USB ro=
le
> switch.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Biju Das <biju.das@bp.renesas.com>

Tested-by: Biju Das <biju.das@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/usb/typec/hd3ss3220.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.=
c
> index db09fa0d85f2..323dfa8160ab 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -178,15 +178,17 @@ static int hd3ss3220_probe(struct i2c_client *clien=
t,
>  		return -ENODEV;
>=20
>  	hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
> -	fwnode_handle_put(connector);
> -	if (IS_ERR(hd3ss3220->role_sw))
> -		return PTR_ERR(hd3ss3220->role_sw);
> +	if (IS_ERR(hd3ss3220->role_sw)) {
> +		ret =3D PTR_ERR(hd3ss3220->role_sw);
> +		goto err_put_fwnode;
> +	}
>=20
>  	typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
>  	typec_cap.driver_data =3D hd3ss3220;
>  	typec_cap.type =3D TYPEC_PORT_DRP;
>  	typec_cap.data =3D TYPEC_PORT_DRD;
>  	typec_cap.ops =3D &hd3ss3220_ops;
> +	typec_cap.fwnode =3D connector;
>=20
>  	hd3ss3220->port =3D typec_register_port(&client->dev, &typec_cap);
>  	if (IS_ERR(hd3ss3220->port)) {
> @@ -220,6 +222,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		goto err_unreg_port;
>=20
> +	fwnode_handle_put(connector);
> +
>  	dev_info(&client->dev, "probed revision=3D0x%x\n", ret);
>=20
>  	return 0;
> @@ -227,6 +231,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	typec_unregister_port(hd3ss3220->port);
>  err_put_role:
>  	usb_role_switch_put(hd3ss3220->role_sw);
> +err_put_fwnode:
> +	fwnode_handle_put(connector);
>=20
>  	return ret;
>  }
> --
> 2.23.0

