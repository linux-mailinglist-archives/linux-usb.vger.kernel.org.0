Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FC02B445E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 14:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgKPNEU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 08:04:20 -0500
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:22852
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726440AbgKPNEU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 08:04:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC53vfBD59pfTuC6+ZhuAKifIXrqq8EGQfDT+fcnNHidRK2IrWpBXT1kVArY24grsfFj7Y64brGyXo5qu9fUSr0i0yfGpmp5x7KUDUHwia4hx9RnxyBiWYw0hycKcd7YQDrgLjpcUu/ddbC9/xW3S8qD4twLSP4tAXk2DyG+vOZPh9XnQYxrlig6Je6IO65NMOBvj7F63Ixe2liOb3u8XYKkWY4xZAbyzysOyFoYL5ujc7n5zwCzWoRviI4kiU7Xk4oMOHClSZpJOeKUURjsgZDrA8pvyw8aXS7zq1tFFsDhOluJ/sqf6zmaVELRmQdElOtbOizuJHjjExdoi29vLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzAHfYbBeQbToqPMP6o3vOV8li3R5LZ2lW8v87hpWc8=;
 b=ek4QOVfFWQ1blGmz8qs2Xn/r+tIeTUdtVGJiurEIxsryBiCgQ5CWAPiEgXTxYetb9D4H3J+BfT4nUaepJIFP3Pqx77aILUrg1HD1zvcRPkFac3Oqb/OB0RYi7B+wzkDW6hh7YwZOqfstC5OrTm5QcKbDUCTKGDrnUJn/luDDOaOHABgAAaYy/JaQKlV836+LTythBZ+CbO2nOSJ6hpFupl+mjxQOUyB/IpMm6z9Dmm0ei6cLfFEIGLwSMi5gsUcpF8YKm457cAYQqTwsAiFIm7AB5o6bq73CWIocjkXu5K586fw+Ff9xYf2R8kRTHhOkQf0+AqTlfNy9aj0FvN3M9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzAHfYbBeQbToqPMP6o3vOV8li3R5LZ2lW8v87hpWc8=;
 b=cpjs6xBWCzyMK0IScvyUPe3fC2Nsxe0ahYonn+K0EuOJxCNNBxe6+NnYb7cMtDlAP/k5hGwJK2aRrf7slMiTEdEcFsSEzG31zN5RKL5akckfyJ10ArBMM30arqTt+dVib90+X+eEq6bXkTRVvcLEj/RorD2nf8pG3R52/TZl53g=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 13:04:18 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 13:04:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: gadget: Fix memleak in gadgetfs_fill_super
Thread-Topic: [PATCH 2/2] usb: gadget: Fix memleak in gadgetfs_fill_super
Thread-Index: AQHWvBIW4zJkFsxU70O/FYQG1OAVV6nKubWA
Date:   Mon, 16 Nov 2020 13:04:17 +0000
Message-ID: <20201116130349.GC28313@b29397-desktop>
References: <20201116121710.1546690-1-zhangqilong3@huawei.com>
 <20201116121710.1546690-3-zhangqilong3@huawei.com>
In-Reply-To: <20201116121710.1546690-3-zhangqilong3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e761f0a4-9a13-47f1-0554-08d88a302070
x-ms-traffictypediagnostic: DB8PR04MB7180:
x-microsoft-antispam-prvs: <DB8PR04MB71807ACEE13748B5D74669AB8BE30@DB8PR04MB7180.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pQpGNLyGvHLolzRNSA1jtodbM4gQmUS2MxL8ZpZdJLjCd2SAydvhJ+52UI+VhaFZRHkLX/+vzYNTZaCUYnr6jk3cnKychQtCAtPJ/lAbEBrDAqEA6AZUl+VDuus8mKdKGNYdZkPd/4OuesKhlIS/BTrdE8vA4n1h0mA6nnMYl24cv90ty3y1R48buw6m1mIrhenwFqYT69+ByFPgBWYAKdLDGUjZElgzJJQ3vnobcIuakaeG2+/L25ru3+9xoz75frBcchQwKGbotr7aCv+CK9cKFdrEzDRDjb2VdMi9nyaROsmePat6aOG1Cs9qThbsHczOFRtaopSajXAAd6eOQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(2906002)(5660300002)(6916009)(33716001)(1076003)(4744005)(8936002)(186003)(66446008)(64756008)(26005)(44832011)(8676002)(91956017)(83380400001)(66946007)(86362001)(76116006)(6512007)(9686003)(4326008)(71200400001)(478600001)(6506007)(53546011)(54906003)(66476007)(6486002)(66556008)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: F26pwtVq2dlLDPnmp+gqjGgi29uGhgPgSTlG5/hZQJfdgRpB5eNoqSsw17ImeFJV75YoG8Jogr6htmBb7hIVAwojL9QgS+t8IICWMvnaMby3uPkoMuhLT/Se6FX8UYLleh1yGhk8jcmQ9qosxddBj6nzps7RXIBZTtGdYU5C2a/z1jN8lmqoLj1VAE2d80fB3RrPsm7qQ8I5FuM0hE+0UR1D/40IaLWv5PO9rhlkzl3YTIz94vF91pm26gaZsSaC1eUn0o2aeSwpNASJJ5YvaX2v3KRyXMFLoD3W5dIgKtV5KwCIKFzW2ILKhWkZjaQBEBoQCto9Q/UuoeZMlCf1nu+mJpO2N74UDE5PnKWRiUasNZvj9BIx818Ykq8/eCzuzhpz9Vp53vdbHfuhwUUuALcEnJARqQeIWsWH4d0zlFS3EOev1ABevE0iauG8gQUictDIaoqweHmk22dE/edyXJZ6KsRdPINejhZ8Z4dehVhGMZtIzANFcaNxxQMLt4IDTjSMNwiZyMcrFleDtT+JCTjVu7Qt92HbX3AAfGaofb/a+gddyGaRLvQTxOffLpihG3J0UvkFHjNGBM0JTqBR87iPQ2Zd+OSMY/9NAyGVabTjc8tMLg9NgJdx1GYZAtySQ7ceLnnPZeYVVjbYYlsjoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F53A2A4BAC4D74E88D032D8D2A70B94@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e761f0a4-9a13-47f1-0554-08d88a302070
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 13:04:17.9065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3UQDHBV8wPBVrDAcnN9GGgX93Lce4WGkQSkBt6Xbr4P99ie1ML3MKzD0fj9ArcBApYY6qKGyFhO6V2JIBmzFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-16 20:17:10, Zhang Qilong wrote:
> usb_get_gadget_udc_name will alloc memory for CHIP
> in "Enomem" branch. we should free it before error
> returns to prevent memleak.
>=20
> Fixes: 175f712119c57 ("usb: gadget: provide interface for legacy gadgets =
to get UDC name")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 1b430b36d0a6..3cefc27be098 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -2039,6 +2039,9 @@ gadgetfs_fill_super (struct super_block *sb, struct=
 fs_context *fc)
>  	return 0;
> =20
>  Enomem:
> +	free(CHIP);
> +	CHIP =3D NULL;
> +
>  	return -ENOMEM;
>  }

It seems the dev_new also allocate the memory, would you please change
it too, also, create a new goto entry for it.
--=20

Thanks,
Peter Chen=
