Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A852B457C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 15:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbgKPODR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 09:03:17 -0500
Received: from mail-eopbgr60088.outbound.protection.outlook.com ([40.107.6.88]:42926
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730067AbgKPODP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 09:03:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWgjHJT0dqVuWPJCpfPkUsv+zi434kJZGp43jmwV/b6IRFZfB7JlULq9/59cyyFtPcmACva8qHsxNgk0o+vB3VhNIeFgjopioS4KFR6kHEiyMQvUX3cfGSZEnoZX2flDzjHURiZzH/YFEU/2JFFBtoTIpYfaN63ESGe+Ok/UdpZlX8IvVUuXLPFsBhu3+tBh2+VxCkmtsN5n7Ge9QzSxm8rbhQFKpR8NuKnSOWjE5Lz9Jg3Fl97yYQ3kpIfywec7AluShG9u7KNebibef2VaoGlRwjaPyHDM55kvYCQT++LSweDLx8P5yNbNHunIPS2KDlcamWxb8n6KmAeFluli6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3zSZ2e9JD/Ila4tqPFdV2wKKA4ER+yCYG2Hkpy5zU=;
 b=MZkaony/iLsi9hABYBK9EIzk0ePkyJsHHXVcJ0/uUZDutGDBIWe2KbFB3nrzUZHTUIB15m+TC+YrmOp8FGzm/2u/67ktX4ARdFM/QtHrTDFBv3y/dATIgETudJ8OdPXUbnEZ7DKsLh2g6OSw8Qib94zONGvSXZx2S8obfHOQVAasymSZfBje4YFSixpPxJp4aryIyNXdbgx54IemiK1jPh5dc9bBBeUjvpjMyChZBYYk3sXoDAwTzpkd5+Z+u9BdUnZQ8KWrhPSXRZgHin1uWI5Ytj4QtXTztly2y2uhDhBx5f0VMw47Ewna3BJa09GY7aoECmy9zMuJJt9DimL/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3zSZ2e9JD/Ila4tqPFdV2wKKA4ER+yCYG2Hkpy5zU=;
 b=DILrIawX+bhQevMKhnSTB0ZJ8kJopy/loyNbbCyFq+Of9sSD0U1Q4782oVG8G9dFZkLFVUONbGUSJLF40ZrzkU3wYYQzqJKrkjkamilyjmcDgY2Ck/OMwzmFjqIA4ZBcz6xHnUOp+TEDuHltK6MYDkU3qYNFGQX04XjBYcK8z9U=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 14:03:12 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 14:03:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jun.li@freescale.com" <jun.li@freescale.com>
Subject: Re: [PATCH] usb: gadget: ether: Fix wrong return value of eth_bind()
Thread-Topic: [PATCH] usb: gadget: ether: Fix wrong return value of eth_bind()
Thread-Index: AQHWuPokSk013jIeC0CDrWd7V+JCiKnK0FgA
Date:   Mon, 16 Nov 2020 14:03:12 +0000
Message-ID: <20201116140242.GH28313@b29397-desktop>
References: <20201112134820.2257361-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20201112134820.2257361-1-zhangxiaoxu5@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: be7a3906-1500-4840-2b2d-08d88a385afb
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-microsoft-antispam-prvs: <DBBPR04MB60274372103DA1B6F792BFA28BE30@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o4rFoGUQDlR20I7acOvu+Qcady9n1oyM7QSwRx34KeXZ6+N/vUis7TqUOvR5KTTY85pykbEUYtkOLKllWvCzMZw8dytADLNI9iUewXlA08hcld4ie+vUg770vn4LpnegDrKG4GYfeH+X4nlJLHb6eRQYXcWGDM20LQY8UyA/jMywsAbVcpcm56S0wFTUi0vycGiSQurL+gfL85HW/HBYTLCAhbY0JV/nsT7BwG0g6hjKoIk/LOJYswB7L6n7Mx3sBpBT3TSriHwgcGZUhs2j4DP5OJIh0E2zz0vggAAkZK1CktvoIvAEaLyUeIMEu5L9hdSkG+BW4owNwFGA713M6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(39860400002)(346002)(376002)(26005)(53546011)(71200400001)(54906003)(6506007)(316002)(186003)(44832011)(5660300002)(76116006)(91956017)(66446008)(64756008)(1076003)(8936002)(66556008)(66476007)(86362001)(33716001)(33656002)(107886003)(8676002)(4326008)(66946007)(83380400001)(6916009)(478600001)(2906002)(6512007)(9686003)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yp04v7gDRrToPnozDWI6CmiCWKsp07nb+D9H5v+fAaHTzwBPjllitJkMf9Wb5pkEhpbfEpSDIABHZCKMpy0gEp01LlFAHwvxYoWfeNAnR/aw9ifNwiCF3b4NM5lLBCRqr0Pv04+Xj6GJyKBjMz/VHfSowtYMQb05mwSZNHqbfXkVMGp69HyzX/Y+uvczRFz+B7CUYJs2LcDU69F5Wv0S1bbX/qgZN0C5aOykfqVkpTNRd6LUoP82s6VkrQJUXtKqe6O9ZBYFp6pGjeBHIkvFfRxe6oIrDCVS+7Syv13NlAdEdYnfO39vU9XEiDuXWRsCenKZtaDSbtS1aFGa0NYIAnFVRLORlkRWSPGEXE+1QtT6dHPUxHP05gfDjncFDgpbGrxvdMeyPHXLheY463QfZcudepTnvKUKsJUQyOuZuq3bl5YTgtxghRdd7nngRscnmfqFtmg5c3ZWRcuwwmEFmGTRfIPMs+AZTejasSfYiW+/iwkADUIXmZgsk0TnnBuNKtSXufwUMvIaK+VH/v5ERZbCsbAyD7Ujiauv4yxoJuykbfKlXaRAETkORIPATVRwP10pT+QWpmQPsLp+BUxJitBdZthiPOgGFICU+Eqszlwv6Tg6yqOzbxWyQSshB19ajpVst+tnb7zJxz281y8/aQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94E6E67DB08C164B8EE3468B170FAE3B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7a3906-1500-4840-2b2d-08d88a385afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 14:03:12.0882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+DSJn+oGjgoi3qfEQXgzeAqAXlcGvlPmdh5NVTZRGs19vWpf1pa4W/IusyO2sS5QtrI8rBrCW9oQ/I115KrpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-12 08:48:20, Zhang Xiaoxu wrote:
> If the otg descriptor allocate failed, we should return -ENOMEM,
> rather than the 'status' from 'usb_string_ids_tab'.
>=20
> Fixes: 9b95236eebdb ("usb: gadget: ether: allocate and init otg descripto=
r by otg capabilities")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter
> ---
>  drivers/usb/gadget/legacy/ether.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legac=
y/ether.c
> index 30313b233680..99c7fc0d1d59 100644
> --- a/drivers/usb/gadget/legacy/ether.c
> +++ b/drivers/usb/gadget/legacy/ether.c
> @@ -403,8 +403,10 @@ static int eth_bind(struct usb_composite_dev *cdev)
>  		struct usb_descriptor_header *usb_desc;
> =20
>  		usb_desc =3D usb_otg_descriptor_alloc(gadget);
> -		if (!usb_desc)
> +		if (!usb_desc) {
> +			status =3D -ENOMEM;
>  			goto fail1;
> +		}
>  		usb_otg_descriptor_init(gadget, usb_desc);
>  		otg_desc[0] =3D usb_desc;
>  		otg_desc[1] =3D NULL;
> --=20
> 2.25.4
>=20

--=20

Thanks,
Peter Chen=
