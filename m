Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2915E2B4437
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 14:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgKPNAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 08:00:02 -0500
Received: from mail-eopbgr30083.outbound.protection.outlook.com ([40.107.3.83]:14339
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728533AbgKPNAB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 08:00:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niGx4IMBNPyyW+s4hmCa1XjvD4UaPIxdQ2pML1d8tU4CaEqnUznn78UXf/+E5UyskmxkR1KXpFKWysS0XZbfVNdhMBOr6+weYmp0d1tYGkL7KZw9eVxy4fJhOv27DUIFwoPmbScvA/0wxsbxgEkmBcdhyO9z0ZP7P2DhWMiuJuMbIOQnequBp6va1c5QJJsGUyV2BFF5GmLyeBLetK/CKnatCEGg+mjB+cnScAoBnwulQ9tBS9VoOeXvGPZDut3csR0opmgRn2+M5bw7qyO9ScWXgetCu4iZaei431krdbB3NlwmTpgqQU/zNsEBGaZ+kjw5xcRUGphYwvHJKMcCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXYv807Jlz66sVHycD/2ARJlfZs39uMZ2+uSkeHhLWc=;
 b=hnMmRT9wk0I+A6U+cFFCaUx/g1TLqSt+qApSpC+sGPeyj5V8kqoinV3EUcqVzBs3uIMpZ8b4cl6MSb/c1WmjLaRwn4SjwbL6J4dHPg7xoYoWeQjmM61k+v3ayjYKyi8yLTWpUzNV3hpkeCbN53WZogdgaihQ+EakIEfchBqX6bDF0vZ7ZxyOUC7H2tYH5VZhbHqLPPD1xdJyA1Bz+EfdhO7V+uv7kDj0FEsbIJD7UZ6oe9thCDjJqWWVz8pXkd3lISW9csH+85uldK4HVguQ2Fh/rRxKrcAKPYgjvnxRTxSJhQFNGAAfMVZWFBLD5hJhaJiTuQu58FZZxAK0VsDGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXYv807Jlz66sVHycD/2ARJlfZs39uMZ2+uSkeHhLWc=;
 b=nEy1yfM1/5EIQBQu9MxNF0BVAVBo3zcVINF/f6HeRMZqnabF1jJrH1ROv8oeWAE6DcEIGVBB8oXtILqV+eqalUHetY9OnPlauoQ7OuZ1aqL/5jve22W1y7Z2tpxvIlWqKpnTigmDKCqltD5KZfgFk3p0Y7jDxSYGcIZpgsJjGz4=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0402MB2935.eurprd04.prod.outlook.com (2603:10a6:4:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 12:59:58 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 12:59:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: gadget: f_midi: Fix memleak in f_midi_alloc
Thread-Topic: [PATCH 1/2] usb: gadget: f_midi: Fix memleak in f_midi_alloc
Thread-Index: AQHWvBIUYubXH6yh9EutzOY0l+CwD6nKuH4A
Date:   Mon, 16 Nov 2020 12:59:57 +0000
Message-ID: <20201116125928.GB28313@b29397-desktop>
References: <20201116121710.1546690-1-zhangqilong3@huawei.com>
 <20201116121710.1546690-2-zhangqilong3@huawei.com>
In-Reply-To: <20201116121710.1546690-2-zhangqilong3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba6b8913-f637-44ee-46f0-08d88a2f857a
x-ms-traffictypediagnostic: DB6PR0402MB2935:
x-microsoft-antispam-prvs: <DB6PR0402MB29358652145DB0AF60E063438BE30@DB6PR0402MB2935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z8Via7mvfJihgzoKKF2VzHs0QfaVrDE9RDxmLcqjLPpmuF7Vfpa2GHDFJVvoCtBS0JmsyzAuS5vT0shsLkZJHumHhVDQWzZQag2II7i5k8MZZp1elBX+gMK13P75urquSbKnbLKhIK+6bIRrK++Rlg3Lkh9Y3jfaraB5RCmacDKX35K8EjXy2z3F2Yoo/qFm6+6Duvo/H9R52PcCluZrpcIvoPWtSx+tWwqzONBBuMS7sDPaMd7LraORSdqp4NhwWPRJR8XO29CmCxiejcRsslAwKuxmRHd5FTNQ1UcxFYM9azJ+fc4u32ili+BLfGcSCJGj1ts9yf4QQfTdj/aGbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(83380400001)(316002)(4326008)(54906003)(478600001)(6512007)(8936002)(2906002)(44832011)(186003)(33656002)(8676002)(9686003)(26005)(53546011)(86362001)(6506007)(6486002)(6916009)(4744005)(5660300002)(91956017)(76116006)(66946007)(66556008)(66446008)(64756008)(66476007)(71200400001)(1076003)(33716001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: j3WxbAywcRy83NiMvj3lA+Kkqvb1clzkiEDR4KatO5XJU2K16GDCO6tMJOJ68FPKcIPSZWujG/nx3rJehmLKHmgPtnK65JA3xWi7Bj7EC21iuJpEBhcepC/z7P6+lsxlUW71NsMXY30NuKOv76U4o3bjvYIuohxGvvaCdHXsEeWQbIWtZcTfKhhdF+VS5lElCY0tMNHfAGBa4CiphzaqJ+X2+K7hRngQ0O9AwHIPboUgcuLjVSKcTYo6xW8PNx26o2TSI3q573mhUEz7WPmL6JvvSaQdj1OMrO+uYsSUQVyVzhUBbULV8lhrq2bV8kyikHFvSzr5IBeV8VSxqiWE9l+FuEVRAX7//QvXBBOCopytezJUlQ7FUl65gnVW6g7WHceOcufbAz9Zb6mtGU22hvyyTluv7omhJqVXTZwOyqnyO81dyH29qaadsmAXpYiodgCj4qiHqPTDSLcoyRKqKK3cNOuSqhvlxgD5CoTwi8T23f48EBXpni7Xn85ywIUuSX8vazDPwssYOhPLYpaj3JqlKx/CV0qJrCubZZd0vRIG9u5NrOyn6VwzZ/+Alvm2SnSaxRpOKf0C+qn7vl5kc2RWM6vdiQbiqffRXKpAZLJDQpP+f6TCNGbgMRL3VM4GYENZnoIw8NYGB3LQ6NLRmg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DD3809F68CC3040880CE6B56EE50333@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6b8913-f637-44ee-46f0-08d88a2f857a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 12:59:57.2120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiQE0GWqWNJtZnxhtBDNskAYniWWrTgAK528+Vjy4j3jmr/cCPHNUOwBrTMY5ECnwZtZZrtxmJNQHstsYT5Olg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2935
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-16 20:17:09, Zhang Qilong wrote:
> In the error path, if midi is not null, we should to
> free the midi->id if necessary to prevent memleak.
>=20
> Fixes: b85e9de9e818d ("usb: gadget: f_midi: convert to new function inter=
face with backward compatibility")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/usb/gadget/function/f_midi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/fu=
nction/f_midi.c
> index 85cb15734aa8..596fd7ce56fb 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -1345,7 +1345,10 @@ static struct usb_function *f_midi_alloc(struct us=
b_function_instance *fi)
> =20
>  setup_fail:
>  	mutex_unlock(&opts->lock);
> +	if (midi)
> +		kfree(midi->id);
>  	kfree(midi);
> +
>  	return ERR_PTR(status);
>  }
> =20

It is better to add another goto label for this memory free.

--=20

Thanks,
Peter Chen=
