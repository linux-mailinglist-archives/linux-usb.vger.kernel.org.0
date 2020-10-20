Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E58C293491
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 08:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgJTGFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 02:05:19 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:59398
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730131AbgJTGFT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 02:05:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu107wETzyZ/wNrL7kDJ6A7xX/kxBxYXZU+ROztxoEqqGqUXaC8jbiM/RitacbKDYDIVeMj+ek98oslOJs7LA8Vr/dK9Jv76IbQVRU/vhD8X4Ywi9R4ME4xEnqy3S7ZA7KRxp08G+SFZ8oAwBPXeIx4+ZCv8zz8QOwpULz7+H5Fn8GhVOepOYJ3g5VnbcM2tQMK0OS6WuzPM9+fBOFGQYgT5ZYq8pzkNtVbXnhUECyb6kO9I1d584HYk1vbItLITutFotzS7xVWiO0SK38qStfnzZZvMjmw5juZF5SkIVRm1OJegt7XxL09TyaBf8FpQQ3bQoXqpBn4NNdwZOZrvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jer9I0RD79sckcVJ/qfVN9zvZqJiG6iTZ3YXbBhL2T0=;
 b=i6CoJbkUWErESPU3pBj83UlQydcmk3PLv/CT3+DqY3Uc23l6nJ8Zt4fCI5Sxer6WCvwHDSk9B+BQiyAzWwzdiXKU8GMjAzg2frotQmIFgat6uPZEY1UFtaba10ihRskV3AYtzpOfGf56SdZEaydY4R6Nz2swzCXHlTRPLbjeQVEzor3Wy0s3lzxUwB+H4SABKiwnz82/ijjLE4s3YG0B0O0h2vHOUrOYCQZ4ncEvCHLM4yI/hWv545C9faVZOd5kbwzlbPnX1b2oC5Zhd4K0jcsWHuCSHd3shMjaOTwl8pWTwBB8e1fBITOo/hQ6BrR0IpB/U3Qi9iT+eEQIUTgoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jer9I0RD79sckcVJ/qfVN9zvZqJiG6iTZ3YXbBhL2T0=;
 b=NlXva8NsBYuq6jR93F2izWgERvKyRgdAcc/14nvZnL6En5gU1B8XoFbVb9FqAxK2hfeK7DKVCv7oyVVWg3rFcqy9dnmuZr4r0cI9mdFe4GTblutyUCqPS3gOjgRQj2Zc2DCDxIuI9rNkQrq2xQcnGV1rn5fxD2GAY8MkYcDspXg=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3540.eurprd04.prod.outlook.com (2603:10a6:208:25::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Tue, 20 Oct
 2020 06:05:14 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 06:05:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Topic: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for
 switch match
Thread-Index: AQHWpfeqzYLPux/yckakQge4yJtm56mgAeUA
Date:   Tue, 20 Oct 2020 06:05:14 +0000
Message-ID: <20201020060448.GA29717@b29397-desktop>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-3-git-send-email-jun.li@nxp.com>
In-Reply-To: <1603098195-9923-3-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34974885-f8b2-4893-d745-08d874be1ca6
x-ms-traffictypediagnostic: AM0PR0402MB3540:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR0402MB35407C3B8CFB555ECD2EB9C78B1F0@AM0PR0402MB3540.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /EtBMADZN4ewZ+bNToHyBiHnv38t8mb7FGYWvof2XD+a85vCvxK1Wzvrz6SLMvAnOi2l562aKt7ItAKprksHTVLm2AEa07/7XZlqCX3Pt8glBOoG/nWAbvMQFuoPpUu5nBrV/hEkDN8RyH5eD9D1MbEjb5BR+aaklDtxrckpQUrq40zlxepugOxKJ3CcfzxRopems3/gn3zpq4xX23zWlpZGF1YdHVMe2XnB5FaIObkgCdIlYoNRhTilMJr38b9KPoAsC9aQqMgL6GuR8ZfoLzhqdu9iqYUaarIDcn5IWbjUStIJw7IK2mIZzcQ5rtpwg5IRfqFpLUmLe1m1jijBfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(9686003)(66946007)(6512007)(33716001)(316002)(54906003)(2906002)(86362001)(26005)(478600001)(33656002)(6636002)(6862004)(6486002)(186003)(76116006)(83380400001)(66476007)(8936002)(66556008)(64756008)(66446008)(4326008)(8676002)(6506007)(53546011)(7416002)(5660300002)(1076003)(44832011)(71200400001)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZXn4U8bQyEODIcCtQ9atH/O1f8CeWez/z9V+AxNPgogW5bAAG64dMv/QTF9Cxj/AmNkVGGmR56iR8uuh2OfCCJLBHO4t5fEPJnSpP6fb3RQRaCuKP/favHgRuCSOdHIaGx+03I+9Rpnygj2W1Ruy0kR05wdeKx8yV6n94MCM0C/WcZULDPHoHWXj1KmQmCExFI0cvpaahxMdd2+raECslU3iuAnBiAtyCxG27+kRsLxSxETllx7LbPM13mb75NQHohl6XhbJ4a26kKQyW27PtA6oXMVhYjkH1cqIxnhIsw6Xs/rL9z4/R1LsyDXVf8npuVYzAFUQ1bdViLJCt58KOIGwTxq9cLhran1XyEkibKtULy9+7o6Eb94fxkQVZesyZwfipS2aalfvak+F8mmiUwuudU+VlG+utyGIOrlj9P1BbGAeItgtNektint9lauxHtEhzHKb1uS8LPnAxpyfQYgfsKbRjOTUyqOpIZt9rck0vy/ZcqKb6o8AANiQOVErSEjaSNJel/BcfG4CjmWS7fkLfNtXbCeHxqadUkGG01Gw3ks1sNEn/mDrpXCHye1/e9IM4qsKguib8BSpwBB1DOWwqur+zNThid2cEhlxI+ecqdv7LPZvj1qgWJuTPHxHTDAbDMA3gQN8n20x778mFA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3203D7F3DA28A4AAEA2DDC05539FEC7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34974885-f8b2-4893-d745-08d874be1ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 06:05:14.5393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1LjHiq4+Y9FCl4gfHENAe2AP1kEYxynt/8k8gjCkQYsMt0wjzI4kuA+jTdKaXE+42XCx1Jvjn8Otwcn97RrWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3540
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-19 17:03:14, Li Jun wrote:
> For those need a dedicated typec switch simple solution driver,
> use compatible property for matching.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> New patch for v4.
>=20
>  drivers/usb/typec/mux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 52ad277..3da17d1 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -39,7 +39,8 @@ static void *typec_switch_match(struct device_connectio=
n *con, int ep,
>  {
>  	struct device *dev;
> =20
> -	if (con->id && !fwnode_property_present(con->fwnode, con->id))
> +	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
> +		       !fwnode_property_present(con->fwnode, con->id))
>  		return NULL;

If property is not present, should not fwnode_is_compatible return NULL?

Peter

> =20
>  	dev =3D class_find_device(&typec_mux_class, NULL, con->fwnode,
> @@ -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwn=
ode_handle *fwnode)
>  {
>  	struct typec_switch *sw;
> =20
> -	sw =3D fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
> -					  typec_switch_match);
> +	sw =3D fwnode_connection_find_match(fwnode, "typec-orientation-switch",
> +					  NULL, typec_switch_match);
>  	if (!IS_ERR_OR_NULL(sw))
>  		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> =20
> --=20
> 2.7.4
>=20

--=20

Thanks,
Peter Chen=
