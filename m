Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43EB2A037C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 11:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgJ3K5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 06:57:42 -0400
Received: from mail-am6eur05on2077.outbound.protection.outlook.com ([40.107.22.77]:8609
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725948AbgJ3K5l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 06:57:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeP5RWKkeX1KAU6KVXKwK0K1Ijgn/LHRJZhmJVbY1QQvWOJBG8vfGGtv3eQwYmHMYnLvUmc9jmLhTMAWt4GtJJ2kt6GJrA6g5JvKvmf0fuFXOC92lkq0MZD5iWP0vpzP9hW7bcrX12CjwTXRxjVGGH1qgNH21jgRH2S2rNKNJLSSRDCKiQ6ImY1lZnXgv1xxh8l2C3Iw68n0Qk44bXuVGw4Dp570w8r8Jf/9suKThlNw5v5toXb2p8b9u6gYgYoi4cqlCEFNuTvzLYapdrorEgS1iNO+yNiwiW1zsSGrDqI086yqLGZIkdrxr6YNjX5/5q7Fr9uWYMEnN/9p0svxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HIzsYsQVTGx+RT3wnwUoBSA1z08DIDmfv/V0HVDn4U=;
 b=Al1IHxXvwTr4gyhbXjMO29chSsNp9OO7iNk3nXVpPHGv969AfOR0BtUMNDyQOb/UlPFUnDbfCK2LAfQwORmtyXwXbeV80HffY11IvhpS+r8rQ7F97WAsG/eTRzhKpv4jd8hyZ4yUtMZsl0CNioYmb4BY9XCmMhOoufo5CO/jRyqiL+3bUXyFAVNvE/ZfMssu5rOV8mKfB6PKekbLf1n4kppAsBn3Ap8szyzRjxGbd0w8dCRC1tVVyqp8iJg1geaFnrE8hcMbttjgBAHyxOfKlijZCWnRIZwS0WXerobJ16ntBQO6qYdeV/u7Fvv0QD66Vf8uZyKpERWcNSVZHHFrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HIzsYsQVTGx+RT3wnwUoBSA1z08DIDmfv/V0HVDn4U=;
 b=iOD52fNimQGiN1BxvRXz4ZjyDdjDRPYStpzGpSBs3bAZBhufksLm3SKdl9e1LsHuZBr+bPsTGZ/+5+1hDlHjEnTA/NeTNcjqRzFINdzjOqFpR+hdhW1fsu0tab+Iw7U6Y7v3h8eHtEUe+I1+6z3of20tLr5RlOhQyiGti/uT7S4=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7122.eurprd04.prod.outlook.com (2603:10a6:208:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 10:57:38 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 10:57:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Michael Sweet <msweet@msweet.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB printer gadget (usb_f_printer) to use default q_len
 value
Thread-Topic: [PATCH] USB printer gadget (usb_f_printer) to use default q_len
 value
Thread-Index: AQHWrfwJELAZgbQgikyh9eI9OPpiFqmv+tuA
Date:   Fri, 30 Oct 2020 10:57:37 +0000
Message-ID: <20201030105709.GA27594@b29397-desktop>
References: <5A8792F8-6CB3-4161-9EBE-5DD204A4B794@msweet.org>
In-Reply-To: <5A8792F8-6CB3-4161-9EBE-5DD204A4B794@msweet.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: msweet.org; dkim=none (message not signed)
 header.d=none;msweet.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5dd7c40-396d-46a6-fb78-08d87cc29d84
x-ms-traffictypediagnostic: AM0PR04MB7122:
x-microsoft-antispam-prvs: <AM0PR04MB7122F2BFEB00118BADD208798B150@AM0PR04MB7122.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi2WvAKnXxVJCIXrdJrkmSPCATCJeoKaIZ+nu1/WcUcBXEZauRoSRkCbMLSyofJc0Wcs2ZnRqHyDjI9qQSVqsMoeZVyxc37zoOHB/r8Hvw0QWyN1OW3FmOP1eo3edTn7JpizA7VCa/kdEADz3O/rCNFVLqn08MpMgXUoFxS6I8y00RVYTOi5vjDB6BoCSLvYkrRDASliixHT8ivqtBTN9dIBF05g/QqyHG9OH8ZrnlPJB/xaA0EUWAP+aqOIBIX8Dv9FHDVwFojtV7Tj2PvCVV9hGW69OkvFJ0eJ5uyED4QfDfc9nJ4p/oTlmUDNeXxmkJLauhwCrCML0JTJaSIhcEmID3kY5YDmWLzhRtNS0KE2AV+RbZod46UzwSeKnOrojr7nzoS+j94EZQOtcpFz1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(4326008)(91956017)(66446008)(66476007)(66556008)(64756008)(66946007)(76116006)(316002)(6486002)(45080400002)(478600001)(5660300002)(71200400001)(1076003)(6512007)(9686003)(6916009)(33716001)(6506007)(33656002)(8936002)(53546011)(2906002)(44832011)(186003)(26005)(86362001)(83380400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZDVXrsV6HWR3r5wrxRQMZiV3COOUDEW6SNMvHObY+jnUNBvilQfmXMasTwtwM0/dT7BQPNUi+kc0Ar/3jHp5uzonPCjwoulzi8Xvr5Y08mwEI0w7qgki1CVqN9DULTZy97kTn543Gp36mJdRmgtdfpeMxu7hnrFoEc120tMkr+tpPl2V4zF/128LWyYB850jE6lNThSHL8ygwMD4rbRNFVdyvx2n/fLqr1nWr45v/Er6vvqcEFvegONAPPxQi0y3Nob0NUwPT5rB+/J3r1Vp2OU198MUfN1LW8PDr4uJMwr2PeljFcjm1B8LdDRtBfxChYVdwveso5udftIARtmXgdc8wllhpdd/F+umsuVdy0QGupk4m6SpZOK/oJWxDBjGRPmhxKy5AgosiBydic70TwRUTc7HEs5k9D8tSBxFc2ZfOvuJHOlmQohzY4hBDAZOFccXReJk0IaV9EE8kDcbWE/W96M2xwikQERj/ZaluuyJFGDLLSvvOF1f2uzOQ6p1ehyOaREyiMMdyvO9nFp4gPSLtx6AczS3sbrtK1sz/RbzHWmV5/T54dsn1CR1kQMNFWbMcPikBuhR35vmhsLnc7rdm7P4U4hWrFHP/ICShCtf913x5oCNhn9Lh0b/P87JmGurbSoZY8UrfwK51WMzcQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A54F3A12F9727047929F1A48F71FA232@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dd7c40-396d-46a6-fb78-08d87cc29d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 10:57:37.9798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ui03zA+uImt7oBbqsrHAJCnIRK6PhO+saLFGG3Cy59VQccHkhqKpbEKpsCDYfUjfdO5JK7z4wDihYBOQWRPhfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7122
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-29 09:54:05, Michael Sweet wrote:
> Hi,
>=20
> I've been doing some work on Linux-based printer firmware lately (https:/=
/eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.msweet.org=
%2Fpappl&amp;data=3D04%7C01%7Cpeter.chen%40nxp.com%7C4de2e2c683e24d14316908=
d87c132af4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637395769063475191%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DK5bQiNEcMDJ0dCNNvsmG%2B3Hs0KfeBc1wS9rQox=
e4R4g%3D&amp;reserved=3D0) and part of that includes support for USB printe=
r gadgets - right now the legacy printer class 1/2 stuff, but soon class 4 =
IPP-USB.  Since I also want to support functions other than printing (seria=
l for debugging, mass storage for access to SD cards, etc.) I've been worki=
ng to configure the printer gadget using configfs. After spending a few day=
s puzzling over why the legacy g_printer gadget worked but usb_f_printer di=
dn't I discovered that the default q_len value for the new driver is *0*, w=
hich prevents any IO from occurring!  Moreover, once you've configured thin=
gs and assigned the UDC it is basically impossible to change q_len, so if y=
our Linux distro of choice does any "helpful" initialization for you then y=
ou are out of luck...
>=20
> The following patch uses a default q_len value of 10 (which is what the l=
egacy g_printer driver uses) to minimize the possibility that you end up wi=
th a non-working printer gadget.
>=20
>=20
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget=
/function/f_printer.c
> index 9c7ed2539ff7..4f3161005e4f 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -50,6 +50,8 @@
>  #define GET_PORT_STATUS		1
>  #define SOFT_RESET		2
> =20
> +#define DEFAULT_Q_LEN		10 /* same as legacy g_printer gadget */
> +
>  static int major, minors;
>  static struct class *usb_gadget_class;
>  static DEFINE_IDA(printer_ida);
> @@ -1317,6 +1319,9 @@ static struct usb_function_instance *gprinter_alloc=
_inst(void)
>  	opts->func_inst.free_func_inst =3D gprinter_free_inst;
>  	ret =3D &opts->func_inst;
> =20
> +	/* Make sure q_len is initialized, otherwise the bound device can't sup=
port read/write! */
> +	opts->q_len =3D DEFAULT_Q_LEN;
> +
>  	mutex_lock(&printer_ida_lock);
> =20
>  	if (ida_is_empty(&printer_ida)) {

This change is ok, You may generate a formal patch, and send it out.

--=20

Thanks,
Peter Chen=
