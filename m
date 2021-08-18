Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898033F00EC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 11:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbhHRJvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 05:51:00 -0400
Received: from mail-dm6nam08on2080.outbound.protection.outlook.com ([40.107.102.80]:7584
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231910AbhHRJu7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 05:50:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4HmVZaA5uXLE1316jmGR4oB7s9hNwWOZ8PgeYMXsu2ccFrRWdpCM+JOnkETFj6eEd6vKEtl2kn/4uBYr/V9w2+oyheKefw2J5HF/CMLQs3IzYJa/LaMMRVDVlVRpJCNh9C2En/Y96ETQt119xayVtYvLDuQKmJKtQLnItPsExhvE1NHmg50RqsOvLIzsk6uLtqSZ9ObEag27a6s1DoVIAJwdytJEl+sv+Qn4iepuhq3Se0nGDEO7K4YBHQLEHQ2XuXdOL1SoTnyI1fmhBZRRORfoJqkMOeuuexZZt9wq8wW8GL4VYYi+DKTR7HsR/g0Rnue97ltZG7Znp70mGPNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHhz/IE6AXyedRBzL57gaS7vHBU4fP04ic+l2J6xRtE=;
 b=hO2nszbN919t0BLM7pRrSKrtMA8eWF38YTLIjR8SnwOmlQr4abfuZUbuth3imAkB1QKzQGCuwjkDkpjcOWvJ3leHg/lUIiPbyiYZ6RkFU9CzjauQEHLplGbYs0WIvHgKBpdMab2V0cdpCYePUuTYcgWBFKItEs6iK5SYURXVwAak+jxFNw0A+fEEiUb/DiGgNTHkvlWvGO/qm2e2BvNbrw2l+UHaRNTdvZhD+oBWUYikaIUlbVIHJapVWflsHAJWxbIA4l3Na2RuB/lpvabNmNJfmhnDaeafyuWttwrVE3Kh9L5mDxexd7OEXeGf6DF8/y17o+mqzGHaB7cfrlazqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHhz/IE6AXyedRBzL57gaS7vHBU4fP04ic+l2J6xRtE=;
 b=s/pgdw4YviUzHRjHtp4FbRbry4ZCd8zkDpAhaVADA6J1krWqikvbnL6pebdp7rxvcUGrvhoou0fLQEtgPlk0qs7bAPVeh/U71R8LyQnh7Gn8ODzXbLEi01xXCKBqdM6lbw0LZUFyIv5LkwAzXK616Rnl+w1ml9OsVsaMcAPdayI=
Received: from MN2PR02MB6640.namprd02.prod.outlook.com (2603:10b6:208:1d0::19)
 by MN2PR02MB5776.namprd02.prod.outlook.com (2603:10b6:208:10f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 09:50:22 +0000
Received: from MN2PR02MB6640.namprd02.prod.outlook.com
 ([fe80::68f0:a463:4f42:cc41]) by MN2PR02MB6640.namprd02.prod.outlook.com
 ([fe80::68f0:a463:4f42:cc41%9]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 09:50:22 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Shubhrajyoti Datta <shubhraj@xilinx.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Michal Simek <michals@xilinx.com>, git <git@xilinx.com>
Subject: RE: [PATCH] usb: gadget: udc-xilinx: Add clock support
Thread-Topic: [PATCH] usb: gadget: udc-xilinx: Add clock support
Thread-Index: AQHXlBYTqezeot3eYU+LLL8NJz4A26t5BKGQ
Date:   Wed, 18 Aug 2021 09:50:22 +0000
Message-ID: <MN2PR02MB66406CFBD3E2A49D1F1571E8AAFF9@MN2PR02MB6640.namprd02.prod.outlook.com>
References: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ead3d4e1-d078-4941-eb7e-08d9622d98a1
x-ms-traffictypediagnostic: MN2PR02MB5776:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB5776F91F5F8C4E7F1D74AAF2AAFF9@MN2PR02MB5776.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OqLFNA/SFw95MBkbGJ1orMepsPe9/IxlDDZJ/033n23WwXHAvynpOKaWoOYjw5Mm/WvTqj5cyOY1VC80wIiGuTDm6YbiFBOqbmTLfNgGEoZdj+fGcYcpfy2KTkovcjftx1Y/xc/8pIRYWcnLsTyXTDh3XzlRC+lTbkF8Eshd9nKvmzWZIpH6ESGHu80X1JMJE+I8kDVyV3mvjkYY0yDFkedcrxkoSk9qX8Ivic0R/pWpY7PkEML6HZKyQrOz1rlOlQCItZCrhXiC8G9HC1/6wTmKJZxENBkMuLeXNBwG9fiZn4zIISa28cM4RtIOjwBZBV7tU/xMirDLB5e2FELKoWrpXFm1ogZVDmuZdUVmKlXWNK+fG+v6jBxJ1vgnyzZCmhfUAX8DJ229QC8uaR4ucShJzNI7dvbHf8Ne+vNgRiNtULma7GAiCXMqbvhshsHdLvKmYLqOUAlUkPcvSo1bbtOxGrHomtijl1nOPK7n6nPbOKF/reIiGzc0QdhfxfZm/+lSNZirz3Such6VWClScY05xjSL0qQakXbmtneT5d41k365D+JvezBvGWu2/zGgQEfJ0TIA/vuD+H0UtTA/uOxEFHU1FikpC353VpOiYSpNopxrC+8mbcsSdSz+9ft9ylqG9BI8lY8a/Tok7bXYngNcmAvBiISJBDW2M6hxnxGO4355G2u/c+p/2A3KagqJS08PPAAXAjYZxXZHI3pjMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB6640.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(5660300002)(9686003)(52536014)(6506007)(2906002)(83380400001)(86362001)(38070700005)(66446008)(71200400001)(53546011)(4326008)(8936002)(478600001)(64756008)(66476007)(76116006)(66556008)(66946007)(7696005)(4744005)(33656002)(55016002)(186003)(26005)(107886003)(122000001)(54906003)(110136005)(8676002)(316002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lQdvTzc31TUIquJuD/Ejdu7t3oXsUlgph6bSWWr+5zYoBEdqPbmYAu7Smdtv?=
 =?us-ascii?Q?WhpMPVGbXPPU1XDo+eIZjSJFIOR4P01mUBPTIv+NG/BLFRxlAqGLyoIoZfwc?=
 =?us-ascii?Q?HsjZ7HbvB5R9jmnAH3/wyJTmxN/PeLWD2Ya2AWhzv6VU+kJ196F3VPSDITc2?=
 =?us-ascii?Q?ZUzbTOm8QXEUY4XWzVR7BVaUNlhALMLArXezHizDhYgV+VVLEFNehK+IMPkw?=
 =?us-ascii?Q?LIjq2xVfolxOAlRRFIYmYfgZkRxqfi6xuk9XcJlk+kLq8JH7gPyrb4zRuGbA?=
 =?us-ascii?Q?s5CBOGnp3g04/8D+skVXJL95lnv4CuPud8PViVchJD9uYtreAliyP2Rk9f0W?=
 =?us-ascii?Q?CJ35inudnrCkFBwDPdCQjoH+AHVzY4S17sn2gaXl+f/qDqo0blXG0fMz+de3?=
 =?us-ascii?Q?u+/pUwMFaCgV1+XMI49tcN2XfgOEalyeAz1GeIAX8PvK3VzuqUgIrBo1bKni?=
 =?us-ascii?Q?u7cet5bhn1S+jl/dU1dBL8FE/ufpziWIQ+Vs1Lvdo8KudjIWpYNPo7fK/P76?=
 =?us-ascii?Q?Fpso6+vdAJzPeHXnSBg3sl6vF4vZEmI34HV+FwK8s6+rgWG9OOEF9FGfYFQQ?=
 =?us-ascii?Q?lnl+/KcCcBJF5N8agsrtFr6Joqpk59a4y6pIZPfHcWrVUZQnaNc3amO0Q9Ip?=
 =?us-ascii?Q?J0wLyj9PfEXKXsfhHZLo4j62SpCfuFpqD6LIYmy1ACWVezp638fphM4T0DHV?=
 =?us-ascii?Q?e+ziIM+41GOhVvBns5FSdXst9LQFFJ997OWNXO+LfLCl4VP0HEUCsSJx2PUP?=
 =?us-ascii?Q?usdtoGumKAhveTXbFk/C5mzefdDH5YgGADNqB3cxaAYVQeSwiSjiNJUesctk?=
 =?us-ascii?Q?x7/3X9aa2wuj9+6CqaQSvf8gd901uK9qiTIzUfZgEW5Da/c2+Gp/MWMGxYkC?=
 =?us-ascii?Q?r4xXBlKAA0u+5/53R3vv+JKm5awauOjH6QT4UW246v2/hgKgUNzm1R7qzQJX?=
 =?us-ascii?Q?EvnDy9PaTHfwMsq6ZgNBQm27oiCzICuu1qeWYmzHRGGAgOEIBzww/xb2BrZ/?=
 =?us-ascii?Q?9yKkTgszQwMKzZDiPNwUOiBDDGB/lC69QQ1HZRo1EDCTmJtX1jNYg+GkCm51?=
 =?us-ascii?Q?05WZfCrDowH4E+DbDMzl9gMe4vkFAnrXd8cPDmJK8mzxiL7TU7ZCSkkK9jzE?=
 =?us-ascii?Q?vmf4yo9p0oxLLTXylLe5sYRX/+0QljMBLVa8NKnVqmfr78XSzBGEtrHtWoPw?=
 =?us-ascii?Q?Ugcqk8Cz9GPSyoKLSrCQsLEXhWjMhLvoY9pR7wVILBUklFSteBpRQMP2qk58?=
 =?us-ascii?Q?cSBAgcutvtg2PT/DZdbM6wH95mEaB7pWdCvDc+FbJq3q8SVvwidQ6pa1uRpK?=
 =?us-ascii?Q?qezxWWQv7RRANZv7lcv1v8km?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead3d4e1-d078-4941-eb7e-08d9622d98a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 09:50:22.2339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kphKM9Q4WcQDtG7mtvkPqiH3YveLXITzV6cgLs5mPHz6Ue5dr5im6eoYMDV0vbgPnXlgW2bOc5NdH4GY6KOvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5776
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Sent: Wednesday, August 18, 2021 3:17 PM
> To: linux-usb@vger.kernel.org
> Cc: gregkh@linuxfoundation.org; Michal Simek <michals@xilinx.com>; git
> <git@xilinx.com>; Shubhrajyoti Datta <shubhraj@xilinx.com>
> Subject: [PATCH] usb: gadget: udc-xilinx: Add clock support
>=20
> Currently the driver depends on the  bootloader to enable the clocks.
> Add support for clocking. The patch enables the clock at  probe and disab=
les them
> at remove.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Please ignore will resend
