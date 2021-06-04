Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCDF39B80D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFDLgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 07:36:44 -0400
Received: from mail-vi1eur05on2041.outbound.protection.outlook.com ([40.107.21.41]:33632
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229962AbhFDLgn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 07:36:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtSr55dysam5QmGmSZ1WD9iwtEt5ehZY4/f5uZLw/6x7OFDQG1i5+ZLZyCGx+SsPM45Df02Zabl6dCxgXQzxsRhEA0Jk5FhFir8Xo5lC1cLN9O0aEV+fHsg4prPU7TM6ovcwAo4g0lDvnd7HYdTH4f5m6h7fShXm9vHghv9rWCAqFK87JFYo90bpxfDE+jlVzcTY3yL7b7Q6hhB2eZCRtaZxx0DCxUhRgzC1Rv9wiEuKbJ22a6nT7oXe8fIbOyuc1HGmCYD5xJ1UUixgZIn4eahjfOQRvOmyWgOLQIV1QzTIXSpGMpkDlZdzpMez/p6xFRpPDgsMD80jMJrhwgOGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+yXWmd+isBu1C9jjsm2DWAuRqKU5x/OX8ktIOmCXCE=;
 b=PqR4UMs9HrpKB7Dyj08c8GdTNduhOHAdqgxqhO1SosLUp4D3cnk8ekYXmWBA5FQXHQMaiej6hxfqjNSadOPE5zCf8OEL6PBA23ipd/XBduL3xkf3sdtOG60bth750MYKPFi3HpLCgWU2ZsUsALJVa16lIOLtTcDlQbkexqRTLh2so7emMPJHUPIMsz72kFfp3EhIQFEzB1b3MrN27hvhXzZQ1a9//Tr4A89R0IKoUbrBqoi4wHu4l3XLg+OwIP17v8wdMiB7/VVvIHwz89qCkw747jIH+YA6t8pdqy9faHsGjD1WQVbaAqvfXpEaHALxjucUBLvyaxnFrmuf2cyN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+yXWmd+isBu1C9jjsm2DWAuRqKU5x/OX8ktIOmCXCE=;
 b=QqQSU30AYXLy8BlL8GIirmZyNWkxRlYB4D1BvoOtiZAdeBtvR7NaSyGjKKIk2fa6u5jor6kL02pWFpYd52xjXQ28obDxzEzivzeBSXTdQrPs0gB3V19BifInc0qN7RNJLwRDcjJFSJPbIcsHWmovCuP0Fbq/FPnVuXuLE8uVx6o=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5789.eurprd04.prod.outlook.com (2603:10a6:803:e2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 11:34:53 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 11:34:53 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: RE: [PATCH] usb: chipidea: udc: assign interrupt number to USB gadget
 structure
Thread-Topic: [PATCH] usb: chipidea: udc: assign interrupt number to USB
 gadget structure
Thread-Index: AQHXSLKZL5icc46Z3UyHEkdV9jYDQasDzdsAgAAEoRCAAAS1UA==
Date:   Fri, 4 Jun 2021 11:34:53 +0000
Message-ID: <VI1PR04MB5935921F1543147A27C23AA1893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1620989984-7653-1-git-send-email-jun.li@nxp.com>
 <YLoFyCyRofg/Jz9r@kroah.com>
 <VI1PR04MB59356EF043AFBFEF160410F6893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB59356EF043AFBFEF160410F6893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44ed9d4e-f7e8-4167-c23a-08d9274cc5a8
x-ms-traffictypediagnostic: VI1PR04MB5789:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB57899F401445F7C7798EDC63893B9@VI1PR04MB5789.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBNdHjnLbbNzGbKogYnYx1ww6NDQWT7nIXY64D5r2TqSTvFmdwpu0bfX39W3YS86MOu/fzr1GYFjL0fyQfyNJbvmSZMNo4tktkN/Srp4N08FNnQcA5/bKjPi4iYmB97v0n8FEDB/NcrdmhuOHQPc0K77swv/gdGzeqkLcDnP8CKV8sneYolz4ugQxBAz5o4Ucahgj+fDFjVfcjgBLTL4vjH0eWgfmNxejMqRvZn+54ihpxfnsuxIQR9yZQeUv5YlSApx2NVPlkKoR4y01wSuvF7XvMUvJZG/PrZ5ZTwJTy5OU1weDLwmBZRc0S6LlT2taAAsLRmyx2Qlt7x8kcB2qqcQFjL5GU67YHd7szEmVj2cdYkzofvgbvngBmq68fEzRGrJ+ErBYmfF3UjGXrKXZT+oWnWZ9fa+T54eFBEunMqMKm3x+r8Sm+2c8KUl+VjIuOGT+lUBl1TUdG+A2Z036EWN2LxgJ5VftDy10nHkztkYcfizusbhezhga0Lr3aUzGmY8U375Uc1y+DSTkzXt3ecxfHzeKYo1ueiDNnUvVtZT9J3ZEc9VVuI8P5laKmPA1PjE40Tm2jDpdwN/yUqU9o5Tfgm5bcLzTCe7YlVEpH8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8936002)(26005)(53546011)(186003)(6506007)(4326008)(33656002)(54906003)(316002)(6916009)(478600001)(2906002)(71200400001)(76116006)(52536014)(66946007)(44832011)(122000001)(38100700002)(5660300002)(55016002)(83380400001)(8676002)(66556008)(64756008)(2940100002)(7696005)(86362001)(9686003)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/Eu9Dmt1wmutoA9nNMbaUcNvWs/gacIQR4b84BJXDnupAwz/C+hyydy1kiZz?=
 =?us-ascii?Q?DVjObvl4niYo8KHhdZxPgv8ZXHkcJi3Xq+tetiwS90GTnIeh1IDIoUr/NC1m?=
 =?us-ascii?Q?A2ZR2REuKgFOIsiYt0fvIH77UaHb1UnHvVJ4P81NYoN2veenP2rNdZWDAY59?=
 =?us-ascii?Q?uqXzDGjKwXZpewWrbGm95RS0AGWcYNMMGDb9ahfd+xHwwx24Fy9Ud++N2uNs?=
 =?us-ascii?Q?GXw7lA3yHGfdV8YTyASwBgwcho4XxKuSbqR5axM4LXiABWVPm3Sodyf2Pw5O?=
 =?us-ascii?Q?LERLiw54FHfCAs8NpPg4YBGkcu52TtCyuHX13+uMIuzL0MXOn6AeJZqb2/81?=
 =?us-ascii?Q?9mTcFQfD+F+fm0mkyjT8UfspE6B11Pz9VhY5+6VckmoLK9lThhI2KJ/ypVxQ?=
 =?us-ascii?Q?nwLTWYMp6OYm+5p2J2kxNekYGd9lmQuZyPYj52fa3gXehrovq4HjDnaiCEv3?=
 =?us-ascii?Q?EdWnT/mfmw6ZDzXJXT2p4BaJBdH3F509uNsh76NNlwX3PeccpQELswAPSG8C?=
 =?us-ascii?Q?pt2frl9M3D+4eC+JcG2L5KxQvZ756HtWv+uCMl/xmF1YyXvIk+Am13wOlyXM?=
 =?us-ascii?Q?WZqv71bDupOT92TtYa1CoxIJcbJbpCOhHw3zTxDbMn5R5I1OzI3WXBm0OEsl?=
 =?us-ascii?Q?ijVM5CECpgw6985KQHrYKyY+M/V6b0Yr9X72qiQuXvv999SIk26nvcutU9d6?=
 =?us-ascii?Q?NKHq3S3lg7RWD3vvzQ+Z72cVSTVOFGFf9O4EiutaM6le/VLjVR37DyT+QgKh?=
 =?us-ascii?Q?/eQSuJ20LqDJdJg74niG5qd5tJaHMj6Xm6iY9DCMH4ofRfghw63YnAqZ+9bT?=
 =?us-ascii?Q?4myGb+b9P4AgM+ZAsdnpkCC4JoLmJaN6twJzJ/V0LJ5MrjATOodogZ07VsSM?=
 =?us-ascii?Q?4SgyOEh/vhnBKWzMoAfbOoMgFr8nkpi7F6cVv/gF9aZenuFxKSywzzpwwXlw?=
 =?us-ascii?Q?9IMeZ13lZy06aW6UXq0gmDlNEtyEgJb7SvY8tPxp41PZpS0hGGym5KHr9bXI?=
 =?us-ascii?Q?pjycKOpgQtmXa1w53tMa/Ugifsy2hiBFqrJ9sSiixpv8xgiYrIpijE+qagkK?=
 =?us-ascii?Q?/HF7Xrcii57YG/sppvzyFgquXL7uKM7Brj5AdQUrny9aqiSIs7WpbhKdVIsH?=
 =?us-ascii?Q?yKnpG4UcjcjK7i+bCkWCf79d6g+Ep/kXmaVvYzMBpPlR3EzT4zvsuuUCWMwM?=
 =?us-ascii?Q?lxR7Yc8Gcoor0V3Jlf2ytEYFte2l6Mm6oagMcHNofH7YP3ESjFKUBLYcieWm?=
 =?us-ascii?Q?4Ra5XEPbNpx7B16jRs9SYTeEqoKRllAYYXcGJ3P9JDW/e3yQHGqRHXdh2pJT?=
 =?us-ascii?Q?K4OoDiCOJXlHohFUMfX0pOKz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ed9d4e-f7e8-4167-c23a-08d9274cc5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 11:34:53.5705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkTMhASZ/lcUvzgjDybYDXkpXIwWY5PtyjDX76ALKKEp5E5mbHqHenZxiwBKU9wy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5789
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Jun Li
> Sent: Friday, June 4, 2021 7:10 PM
> To: Greg KH <gregkh@linuxfoundation.org>
> Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
> Subject: RE: [PATCH] usb: chipidea: udc: assign interrupt number to USB g=
adget
> structure
>=20
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Friday, June 4, 2021 6:52 PM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
> > Subject: Re: [PATCH] usb: chipidea: udc: assign interrupt number to
> > USB gadget structure
> >
> > On Fri, May 14, 2021 at 06:59:44PM +0800, Li Jun wrote:
> > > Chipidea also need sync interrupt before unbind the udc while gadget
> > > remove driver, otherwise setup irq handling may happen while unbind,
> > > see below dump generated from android function switch stress test:
> > >
> ...
> > >
> >
> > What commit does this fix?  Should it go to stable kernels, and if so,
> > how far back?
>=20
> I will resend the patch with fix tag added.

Hi Greg,

I assume this problem may exist all along or very far, but this patch
need base one commit[1] to fix this problem, so I think that commit is
the point to know how far this patch can apply back for stable kernels,
in this case, please let me know if adding fix tag pointing to that commit
still the right way for this.

[1] 3c73bc52195d ("usb: gadget: core: sync interrupt before unbind the udc"=
)

thanks
Li Jun

>=20
> Li Jun
> >
> > thanks,
> >
> > greg k-h
