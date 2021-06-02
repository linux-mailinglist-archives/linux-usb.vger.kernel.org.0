Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EBC398BD5
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 16:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhFBOKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 10:10:40 -0400
Received: from mail-eopbgr60063.outbound.protection.outlook.com ([40.107.6.63]:16142
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231574AbhFBOIj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 10:08:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTqaW4kahGyQ9wsagdc4+/Tc0aqsH3P+RSqRxBhyca8pAbrDChs9D4H+XVc+G1sDcJd0FinTX6y6PtQGz5axC9YQsSKPBEUxrFp72Aw48OheC7UpjzbcwNjuVYnmkoX0DZ6aciDfeTdkHmYgBa9lEqIstEDh3BFN/1hLbRH1TrYXdEpFT9g/iDPD86NEuXoDF9N7JTh+zvGil1foFcvLH+BOIhqRf2RVsrfOODM4sk6/gW5YW6wha9Qp8dtV4QMNTTVa+jdnTpImKYE1jMBLZe5Zxe3aYf2Z1q1HPoJ1QuZPOycDOAlXwkUy0EHN8n152XXAqy0jmlyDRmfITumlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/oSkITAXuuD3LQZYNntNUChry3bqt96zallIGZesU=;
 b=ZblTea8FBPS0PQb3PVTkhVcx9B2v45iLfmK4LgVddng8oSK52qQiCrybMOzh0a6UXPh6BRkartoPGOHMFnlGkXyjH0Pa2gYSoTu8oWXgGkjCdv879yjDzXs1BmwdW2F2StgSB+mOdaFJVWxl2cwWq3tadhSK37gfufI1ZbTZgFag8nITxQv/7i72G3e53sEB8ErILkgdktlqy4jvXaXf+QNz4xAcWz4Kh1yVBf7V1HuYkA4TQBAzzOT7x4xNsWLtF7hnOdJbcw8e18wqYJ5/z85TWv7ayXDvV/KF7OUbvMaYUxHFLqIGBBg2g4wbIgJ3dd2AhJbcueu+4SZ3H5dT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/oSkITAXuuD3LQZYNntNUChry3bqt96zallIGZesU=;
 b=SRz4p7adlKavj26/0gFingQ3kfq7tx+67L2UjDtV25yC9BbCldfnUMxVQMGfjE6xM9IWiAcy6wFwuLFWXikGwu1u2VNDYrEkQc4V0nVune6zGvnE86twqtF0lrmOFUu+dIMEgh1/9m91B5hqy3MSdtc4pWZ80buFEZZ5qDsljcw=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6029.eurprd04.prod.outlook.com (2603:10a6:803:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Wed, 2 Jun
 2021 14:06:53 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.020; Wed, 2 Jun 2021
 14:06:53 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] Revert "usb: typec: mux: Remove requirement for the
 "orientation-switch" device property"
Thread-Topic: [PATCH] Revert "usb: typec: mux: Remove requirement for the
 "orientation-switch" device property"
Thread-Index: AQHXV6GWcWKVz3TNX0et31W2rRHhlasAwTLQ
Date:   Wed, 2 Jun 2021 14:06:53 +0000
Message-ID: <VI1PR04MB593557697E109CFDC1BCDC2F893D9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <20210602112253.70200-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20210602112253.70200-1-heikki.krogerus@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e80aaf7d-178c-4bf5-a31a-08d925cfaca3
x-ms-traffictypediagnostic: VI1PR04MB6029:
x-microsoft-antispam-prvs: <VI1PR04MB6029901DA1033B45380036B1893D9@VI1PR04MB6029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdEVfyn29PbnkSluTCNslVjJM1FeLFaY3agUw8n6rUpug3TfenVWXi6Bm3jo36vGBj+TUPyZyMl0ou3qrZI4yKoS6F1D5FYUY8Nk0MQ3k/IC3rXSpYM39QFPOTQE6E05L0FqtzhQhWXiZmlenNYYC0pPwdwaXrXFbTFmFGDRzVoIDK/OSU7w073eK5r11MMv3rlvLX/l3ZozjHf1T9iy3hNn4BUaagpuKGEBgkZOOLEwxGLMy+1QTKeFL6Qd/9Haf59ozzgIYbzfibVngP5e/rDc8i8jI8xsZ/5+e8McWmfgiRiOkOfEHCAEoGTlAQfQANgZz+C33gLqOfz1L/NIZetIPlKGhgEJyBWzvJHHIJ5NlhQHFacMtjhkz+5/GsOVjb0CepWcLG5Op0Rin496XSXxqjdRXKr1pflJBaHQsSwJOrPHiZzbitrUqvHj3GJ59PcOQtz1ZhMc0yjLwdMaIFcUwI3p88i7ZED9YN8LFK2OaO3oeCy9j8Nd5WOrtX6rsenfjTtcJsjidhaXW61FVkhJhEgF1IBJZrfGv0jGNbwxcNlW37vieSuiJ+GwaHxXVNtH9cqjc2etTcu8csbKYDIAyBLZdol3OphhoRAastQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(316002)(8676002)(71200400001)(8936002)(66476007)(26005)(7696005)(86362001)(52536014)(76116006)(110136005)(186003)(2906002)(33656002)(38100700002)(9686003)(66556008)(66446008)(5660300002)(53546011)(64756008)(4326008)(478600001)(44832011)(55016002)(66946007)(83380400001)(122000001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6YiSZKDxFQQ75xupKkynTaK6FhXRsHFmJLtqtAZPZVU2zfQ4kgDrJhcsxOdv?=
 =?us-ascii?Q?t7cx3FIoOXUWXHMZkpNks55+k3/jjTbIYLm/mFIcexwlOtxTY7c52ozucHnt?=
 =?us-ascii?Q?VLhYBt15/FclOW0IO5Srct69pk98VajTk8brzZV49caUc5sFn0UoQ5udYJgI?=
 =?us-ascii?Q?NlIsuSzFs0QmN6QM7Ti9odd+Hc2j+vo0DBDma8eqH1SKyc3Y3h+ZuPEVDvpD?=
 =?us-ascii?Q?VdXocMKAzIqD9RCq73kiB7CdBKiB43T8Y78qJjG2FpBnAVRECoXsg5DRsyIY?=
 =?us-ascii?Q?gky3Q2NB9alRA3vdgeTn1/pnl0xNfj69xU88C0FZb2C/RYyW1JCuDtEL5+qL?=
 =?us-ascii?Q?QCiPF/tRzh9WUt/HrrMV9QhJloWkh45LHmBFJtAt5vuFIcK+HsEiKFZ3L+6W?=
 =?us-ascii?Q?+BHTuY9Z6BWQRMWENveLVnwwuN7ndKFw1C1V8nWhhZGjqw4pxWq6BD+7kM/k?=
 =?us-ascii?Q?LOF4SAORdvhk1qc6gcBNBgxMvadh9Cf9KZOLgM4STmxZ5QH2l+P5IdJyurYc?=
 =?us-ascii?Q?DE+U82/ZzMU++9ChKsgfpvh3YcHxQhui/7E3AdmcWXbaRaNFaKumhqwEa/jN?=
 =?us-ascii?Q?TnxMSR3+6PGTR8afDIp/zTIrN9n0oClA2Q0xTt+moh7w0bwlNUWjHX66de4y?=
 =?us-ascii?Q?NFLXYFg8RTouQBaZciVCcwFQ+PvS9wmhZL7wDuTKtkQmHtGYoCjTTTN3LRc9?=
 =?us-ascii?Q?im/CbvkeH1DqKbim66Li0L1/BtiZBhbl2Ir36pQc29u58VWNctDSIiCl+GgC?=
 =?us-ascii?Q?M5bcJYcynrCQPgW3ZCn1KDI+UJGjozzYZSDrYwDfSQvr6t6WJev/0EYviqqO?=
 =?us-ascii?Q?48EIbOwxPl8W+mEbAbqZKbV1V404n0H2te1HlfWLiz19ZhWk73aaVbp4cu1Z?=
 =?us-ascii?Q?VvNKvpmRS585AFoKaDPGbof4wjHsRvX8QIqUY/me6Avgip2NDt5BB28oQk4W?=
 =?us-ascii?Q?sacwetClhRqvICUoEiFPX+SaSIRxzo6u8GJxym4ed5HJOScPHFH92IW16M0f?=
 =?us-ascii?Q?fpsE9xKQs2JNuSSCP11at7wP2Zbw7BHRirjPfNTrUqm/OkDZXUM0bJIJJOvi?=
 =?us-ascii?Q?acovhUuiMeyCgvK93M/EMTLl32pkV8Mu572O3smUDfw+XfHT8q2mu/GPCfLY?=
 =?us-ascii?Q?bkgK4r36avLLrkmiryQt7rwOtA/Pc0TZi7NlEorHWmpDtbxR21N/B8zKN46s?=
 =?us-ascii?Q?0KXmwWVp7QODH5tC8yEVUnLsAT+ldaRfqO0GjviYIg3XLGvcu5iacu6tuPyb?=
 =?us-ascii?Q?zKDd3gdzI5s9SDrSSORm6922UnxuHav9vnITN/fHbxRbitB3vCDrhMg+HWL+?=
 =?us-ascii?Q?/idi3Y6gj+tewEbwgHb2GlIq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80aaf7d-178c-4bf5-a31a-08d925cfaca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 14:06:53.2940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aiLQjjkf+YIErKsiZncNVUz3BxTWvVOdHuyWNXRL8CCP7t1nogkqpElyfSky77p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6029
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, June 2, 2021 7:23 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jun Li <jun.li@nxp.com>; linux-usb@vger.kernel.org
> Subject: [PATCH] Revert "usb: typec: mux: Remove requirement for the
> "orientation-switch" device property"
>=20
> This reverts commit acad3e9c7250c5fd20d9778a163f2adc95de38f5.
>=20
> The device property that can be used to identify the device class/type of
> the remote port parent when device graph is used is always needed after a=
ll.
> Without it there is no real way to know is the requested connection actua=
lly
> described in the device graph or not.
>=20
> If the connection is described in the device graph but the device instanc=
e
> is still missing for what ever reason, the code defers probe for now.
>=20
> Adding a comment to the code to explain this.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Li Jun <jun.li@nxp.com>

> ---
> Hi,
>=20
> I'm sorry about this again. I hope the comments help prevent me from doin=
g
> the same thing again.
>=20
> thanks,
> ---
>  drivers/usb/typec/mux.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c index
> 603f3e698cc0b..664fb3513f480 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -30,6 +30,22 @@ static void *typec_switch_match(struct fwnode_handle
> *fwnode, const char *id,  {
>  	struct device *dev;
>=20
> +	/*
> +	 * Device graph (OF graph) does not give any means to identify the
> +	 * device type or the device class of the remote port parent that @fwno=
de
> +	 * represents, so in order to identify the type or the class of @fwnode
> +	 * an additional device property is needed. With typec switches the
> +	 * property is named "orientation-switch" (@id). The value of the devic=
e
> +	 * property is ignored.
> +	 */
> +	if (id && !fwnode_property_present(fwnode, id))
> +		return NULL;
> +
> +	/*
> +	 * At this point we are sure that @fwnode is a typec switch in all
> +	 * cases. If the switch hasn't yet been registered for some reason, the
> +	 * function "defers probe" for now.
> +	 */
>  	dev =3D class_find_device(&typec_mux_class, NULL, fwnode,
>  				switch_fwnode_match);
>=20
> --
> 2.30.2

