Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693222D4387
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 14:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732542AbgLINqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 08:46:34 -0500
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:6790
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732187AbgLINqd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 08:46:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYkTHIR9GvBqRTcI7Qe+sKDJXIq2SUgE5mJDCAHJknTifPfkqKOznfa+Ms2FptkX8p8SGpPdXGt3dTBm6Yx/s7FCWPyztZQ9W+9SvNEeEYDNQVp0OPzuxv/JfNffTITWQsSirccebnoxmCgwH84GOwDy/ti68FjTQtKIlW7wA0B2YP6oSZfbzrDCvYEIBY/chbdYQPAfSwiSnZ1dGwt7x7rfLMNXvw0HgSIxwM+OSYTIeUw5rtjzFBQ4GmXcdDsgnvAz89ZLp84xz0zHwYG2cFJRA8h15Gecg3L6sqP+UbRVg9uJzL56MPD6wp2LfO5WTGLHLDYdGCwLl8jy06U1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNxUoqBa6o9txN7EpvBetrWWahrcEv9W4MljHWKltu8=;
 b=G21FrN0/fwu/D0t5KUduiumipKsvbs0SPDEB3nvOPUxoluccnsnJ8KItviPaVH0Oii5AP7cwD8vTiXnrfprqdXOYBlUZXR7s4T78zRheICsUex/Y6jvDrZA9STcMPUckWV5YhCl0pAVFNqFXbEsdPERjoYczidGp8AYbY/oIeY5V9KfvutoY9nLE+KQZ5BNmie9UISGSCiYmEAtyxYM8+JCxGtJ2ORWZyDlR8uPJpdOjglNWijVilIkOzphGCI7HqgdHv57stPdzLypOT3yP3hhsoFMXmAHc3Ay695uH1wRCeVKLuL8EZRJDe1Z4kj2I+1B9+W57CGUTEd3Noc1WrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNxUoqBa6o9txN7EpvBetrWWahrcEv9W4MljHWKltu8=;
 b=l+YEhzv5wIWy8O87rNLbw4J5pNse7kz+OuJVYVNNIbr0DJRsdRE6YPn9gaV4Md6Gv3xKAQU7K9S6Ggoow7Jd8pik9gmKajzVQdm4NHaekEieMehH33FAMiRI3SGAmlX6yliebCKDygeEnxMWnvQ5yUHX2ZYWE+/onMbY5CFJjtA=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 13:45:41 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 13:45:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: function: printer: Fix a memory leak for
 interface descriptor
Thread-Topic: [PATCH] usb: gadget: function: printer: Fix a memory leak for
 interface descriptor
Thread-Index: AQHWzdee6otRJ6WHfUalXjcblykpO6nux1kA
Date:   Wed, 9 Dec 2020 13:45:41 +0000
Message-ID: <20201209134512.GA1598@b29397-desktop>
References: <20201209030018.6001-1-qiang.zhang@windriver.com>
In-Reply-To: <20201209030018.6001-1-qiang.zhang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4422b4a-1e5e-4cba-9f5a-08d89c48b860
x-ms-traffictypediagnostic: DB6PR0402MB2757:
x-microsoft-antispam-prvs: <DB6PR0402MB2757A64B1D5134DB3B1CFB798BCC0@DB6PR0402MB2757.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eiZ1efGXT/pHedZxjpaBkCtJDt0as7upeBEsgCetTZ/B7d4V3Zh8mlseOOWfDHV1uk9/fqWZkuv/tw9sOPfI1LXry19OoaHKDXrOjHcMaGdHa+mhrhTBvM7twz8VdyC4lJJHCEJKoQF+GiZ5LXstTSqTGFhGRQkubb9WV+774IlJZ0h3LtwicTAyZv/8kCwiYDoGi8qwWLPYbPlkFRRqIYcI++sdDUrmkUgDQSN6R9wT1pqwPSqSsJk+a1G485/lsgZ8BXRBpTqeAafWddpMayQTjfJpZNS7fiX9hzZ8LEM1GAbuDy8VHhEp4gJiURwbqIAMPoG7Mrpng1TJ96JYEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(346002)(136003)(8936002)(44832011)(6512007)(508600001)(8676002)(33716001)(6486002)(5660300002)(54906003)(64756008)(6916009)(186003)(4326008)(71200400001)(26005)(76116006)(66556008)(6506007)(9686003)(33656002)(66946007)(2906002)(1076003)(66446008)(91956017)(53546011)(86362001)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yd3LolcIdHlClolyyyqG4VPzezcEStFa3ig/qEH2cmVXy0pYGfLpQNyU+Bgy?=
 =?us-ascii?Q?SMjQLIJTKkdDVMaSo3A/+C4LjpLTeA2i8pZQtTWOWuzHFceGrOmKg3BE8g8f?=
 =?us-ascii?Q?cA/4Ah9p9xHaO6Brz6/Wfa8VqRkVYo4UkNDKkMhO8+AOhNQvhD8vBwfER+le?=
 =?us-ascii?Q?DXiczBlrcUKbJn20Lt9FmR8wNm/CNgQJy9H/U7l5bthUXGfhZElfGdYnWAnL?=
 =?us-ascii?Q?PXnn9W5yCnOPeweI0uYKVKfxYKHP3hJbxwTiUE2mdh4EKhbVEI9wEmg3+OwB?=
 =?us-ascii?Q?KLdV9X1OeLf9wr9NrqGx2mzCpkxhWIGHudLkaaZ9l/uS3wuLIilpVAITYYAW?=
 =?us-ascii?Q?lUAD2apwDxM9j5Q/SUxPF7Kjp36MfAq+yCJ4xsaZqA19lBgrpg/E38bKXaHf?=
 =?us-ascii?Q?tQxTWg7rwbISnywtIrd7ZwDAkm9u8BniUJiR6ERg10L9egJMktenS2jdERru?=
 =?us-ascii?Q?uNCdGcJgZWW5OOQPLrji1hSALKb4B+dfVpcqH7lTmACUOnQBP7gDc2h17E6l?=
 =?us-ascii?Q?Z2QIax8pYrcIfhJ9n69xJoTvJox+j3CFCLLEr6B5ZoOcyY1Kzgm2+k1lTkq7?=
 =?us-ascii?Q?830udz3iS8hQSxXn3CFf0QeOgxt5I6A/CiQ+yftPm8H+dlKoL02JrnCG2VxJ?=
 =?us-ascii?Q?A0njTgbnm1iqa1rwCEgpuKBrTfGzN6Ipum0V4pH+o1Oa412UrFin0wCrT6+G?=
 =?us-ascii?Q?gVarbGuP5agGXcdXKaBH5uoCLEEleLXDJccYQjypW6ab5zypGUjHFTeB9pGU?=
 =?us-ascii?Q?fIm4JhxX9RM0f5Oj4gZDo8pL/3MzfneMAs5OlphqjOn1NDhcjqz1uduxTle5?=
 =?us-ascii?Q?1+NK49ZfgR0SL3blk+epvNCg8bN7c/A40MNd1rZ4pOeCZoKvjqifPClK7k1W?=
 =?us-ascii?Q?mxX2iMURLphCvF1/k8T+me4VSbl7Z9tbEKBsTCg33bE8HmHg4iKDOLkyEBGe?=
 =?us-ascii?Q?kBjPXKNV6ganEMNZv4UZz/qHYu570HlINAZvsnwzcSHpS7/OGvSLDZVXICwR?=
 =?us-ascii?Q?Xu2Q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01140F449703784ABDFEF62E3694BD9C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4422b4a-1e5e-4cba-9f5a-08d89c48b860
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 13:45:41.6927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cw5dSReFMhjyJPEb14zgE15b6hPRBC8NJzmDxGbNbItfhQtAvw1yd+ORBzRX5YJ9gRFeoqWijNgczq2xirJ8KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-09 11:00:18, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
>=20
> When printer driver be load, the printer_func_bind function be called, in
		      is loaded				      is called

> this function, the interface descriptor be allocated memory, if after tha=
t,
				descriptors memory region are allocated
> the error occurred, the interface descriptor memory need to be free.
		occurs,		=09

Except Typo, otherwise:
Reviewed-by: Peter Chen <peter.chen@nxp.com>

Besides, it is bug-fix, you could add fixes tag, and cc stable@vger.kernel.=
org.

Peter

>=20
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  drivers/usb/gadget/function/f_printer.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget=
/function/f_printer.c
> index 64a4112068fc..2f1eb2e81d30 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -1162,6 +1162,7 @@ static int printer_func_bind(struct usb_configurati=
on *c,
>  		printer_req_free(dev->in_ep, req);
>  	}
> =20
> +	usb_free_all_descriptors(f);
>  	return ret;
> =20
>  }
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
