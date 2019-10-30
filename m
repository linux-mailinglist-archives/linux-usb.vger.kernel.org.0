Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0EE97A8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 09:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfJ3ILR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 04:11:17 -0400
Received: from mail-eopbgr70073.outbound.protection.outlook.com ([40.107.7.73]:50887
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725953AbfJ3ILQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 04:11:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSeul+evWs04N1wKpoY2GR4VtIgaX21UhX2bS2gRmlikN5zW+gqgApG6ZWCiqfeXE6encipftqFENYW+Zcu6b/sgROo79ndRPUQ6w6vM08CjZ3xwzAxq+vFBpHByW26NOI7F0YDfVftS38dZTEJI0WyszphAfAijR1vvpq2Jg2P+5hecgMr5Z6HFvBFu+9xSkp5ORWeLJNu85r2Z9+r2o4gs/x5jHXy8FnYbO+wv0d2/UJQTyRn1XAw8KPFOCnP+JPiA5hoL1JUvAO2asaK2hiFRS6kHz0SvBGb+b2ptUdNYilxoLIUToe1KAKBtszYxgHM673pg3AJgOwZdx8yYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUV2RghAhhQluDw5weRzqZLpo+bfQnzeuoMIJSX6oZA=;
 b=MWvOFuZIU3l+GOjtXNVygN+HW+tQx65BQODcUs4TniAoXuv84+mjW8u8mc3kQiDkZ9FejqCmm42J60yXbC7/FRtNv6JZ8kizZk11RIBjrZXIwhHpV+Ao3WH7nqPjuCeEsoR2w+oTsXq+DdyF9x/q+nUM+/S9zrloyjymRwVQaLci2LH7xQoN/nIPC/r333t1Ltmo4Fb2tQpPCsqUa457QvnXlyLj5WveXoNATQCuFX1q5zW6tHozwiKFM6CRjuwS1RRQ5sHjW0tEI3izHu2xEQPIEMWUz3X00RjctfMCA0fMFADhFXA2crVhUTbG8Ess3E09B/iB6ISHqTfNJnzXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUV2RghAhhQluDw5weRzqZLpo+bfQnzeuoMIJSX6oZA=;
 b=imeJ6J2qmybODlAHZ/1ZR5mqeRq6jWjdVyP5IdkFVsPilEXrwwMduiiCVXeyBKvqL8rmWWxH2UenO+qOleVqFgM059FkbxlEaAajk0BRp+QtLI2liCmpE1rFnbAuRN7tHZ0F7bX4CBEVdvjGUJVvj+4ieoYeTEYoJzZhMw+Tkts=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3198.eurprd04.prod.outlook.com (10.170.228.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Wed, 30 Oct 2019 08:11:12 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133%3]) with mapi id 15.20.2387.023; Wed, 30 Oct 2019
 08:11:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
Thread-Topic: [PATCH -next] usb: gadget: configfs: Fix missing
 spin_lock_init()
Thread-Index: AQHVjtPm8Ll1Qsa1AEGGJ9d9UTCKQ6dy1XqA
Date:   Wed, 30 Oct 2019 08:11:12 +0000
Message-ID: <20191030081101.GF26815@b29397-desktop>
References: <20191030034046.188808-1-weiyongjun1@huawei.com>
In-Reply-To: <20191030034046.188808-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca1ac4aa-e522-4384-0a44-08d75d10ba8d
x-ms-traffictypediagnostic: VI1PR04MB3198:
x-microsoft-antispam-prvs: <VI1PR04MB3198EF3F6CBED45647929A588B600@VI1PR04MB3198.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(1076003)(476003)(2906002)(305945005)(446003)(66066001)(11346002)(478600001)(7736002)(71200400001)(53546011)(66476007)(66556008)(6506007)(3846002)(64756008)(6116002)(66446008)(256004)(14444005)(4744005)(33656002)(99286004)(102836004)(91956017)(76116006)(71190400001)(66946007)(76176011)(316002)(186003)(5660300002)(8936002)(81156014)(4326008)(81166006)(26005)(8676002)(6486002)(229853002)(6512007)(33716001)(6436002)(86362001)(25786009)(486006)(6916009)(9686003)(6246003)(14454004)(54906003)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3198;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yachmGjSWg7ppr+Z3TYqeVQaUn0faSXfHKdSScJDYVDQOhczzkFTaWMNKnHOnJwZCMfVWihFsydJUUbgpIj+XgbZD7c7+f5mOK4j00nKPt8i1/XH2TXvhAUJVqkndr4ByianWxQX+JMQMypeOqET4mPEHvsbI8VWklx/2dMq6zr7XsPvlYwKD79Jk2jq3BVTIkIYSI+lV072hdofVg0J0DezitBiPb68U33rfcfKcBcRmJqOcDLNECdFlLakxnz3gc1SPCuhhdnDW5yD6UPqdwICQDmCrMXi2mwxYl54EwJyv1DaK9vXl6TUwbo3OBoFKusMJKK4A8E+OHqmA+crw8wUNW1d/uYrzzuK3ljO3YbUBgNdMYUScRjkYZYDyJ4h2eOrqTbfwU0w1dZc8qb24wCQdZbMKj7sNtY63wWSofBoDlCCQngJRgSShIBAE6ay
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <529ED822A2640A4496A79166D00F693B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1ac4aa-e522-4384-0a44-08d75d10ba8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 08:11:12.6460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYGqQ7HDimoWi1dt12tQNpgNiX36xCAIABptQGy51kVntoOJPamsGN9etTS0/k3aewCiZlVVmRiP1KUTjedLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3198
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-10-30 03:40:46, Wei Yongjun wrote:
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>=20
> This is detected by Coccinelle semantic patch.
>=20
> Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between=
 composite APIs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/gadget/configfs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.=
c
> index 33852c2b29d1..ab9ac48a751a 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
>  	gi->composite.resume =3D NULL;
>  	gi->composite.max_speed =3D USB_SPEED_SUPER;
> =20
> +	spin_lock_init(&gi->spinlock);
>  	mutex_init(&gi->lock);
>  	INIT_LIST_HEAD(&gi->string_list);
>  	INIT_LIST_HEAD(&gi->available_func);
>=20

Reviewed-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
