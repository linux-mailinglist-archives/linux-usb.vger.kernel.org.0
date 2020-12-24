Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BDB2E248D
	for <lists+linux-usb@lfdr.de>; Thu, 24 Dec 2020 07:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgLXGGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Dec 2020 01:06:01 -0500
Received: from mail-eopbgr130072.outbound.protection.outlook.com ([40.107.13.72]:5124
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726290AbgLXGGB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Dec 2020 01:06:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKcPMrpCeD4aUwY6wE19n0MFjvO7DigtBVI0LZQGsU9zUaExZKPxVkv7X+k0Cc8hbvNk9YEK0hZI+7pq5SFiiQ25NQyyvHqc7XPZWBD/jYgaBszniXo9JM2+RC1IKSGVXaTgHRe2PUdKeE/1VKUal0rJOrbbuCEZmrEw8ROaBnuCyz506X4BZqTbYRH3/AH1iltD8gNkYwCWiwG5n6j5N9DPNGJq4t/2VOZSeXaegiz2C6naxHVSCigVzyrVITS9OGjC0mfrRfMs2/2hBOdHVE/2sQlrazjS/oQrXlhItlFQSDNY+o44TwbrUebEG/d89A/t3PTrTWemzq2AWaz4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLs9gjTuWDfFl7twsWlVTITfguJ1RuCynkcL2TGtgGY=;
 b=MIrv+WdZO75ge08V4PK18IB2nGuWiW6ulfA4zPn/SqTlltVDRhqpwdo5DAhL2dLJzWGlxgZKXOfZ7SPbsOc5wlwjDZpjmrUUVqMT4+3bwBnyOdzK8dSFnDqLTjEond+wucnzacgYV4q61sPFRtxgyP5BZhBTOMH4EFNiURCpjh5JYFYtBq4oOkpl07gNY+vkIk64l0jvkxSUPeZVIyqoaEX2PzekfRGgLRtTh3pUJ5Jin0CGwoIRjOluIUwxoUOpvFr8T/TdqBvgMQa4wYmroz9Kpn/yS4bMjrhpVrBUsabQ/FFA66aFouSw5nK1lGnygKKc+npoJ1WvwS48XSGbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLs9gjTuWDfFl7twsWlVTITfguJ1RuCynkcL2TGtgGY=;
 b=ZBu/03wNzmC+f0ZCJKQ7AGCW4KJnSyOg2ACT4fTkgmZKgo68rqBCi4UbYq2xEZicjkJW/wUIlMtl3iE7aWk7AhO5yfGvG5fMp7bTInq5M7BmAnqMtpLJkOoRW6HuBIrOxV/guD6Y6VbXsdzEbe2WheA7eDMcT5VHQyF8xOgZpIc=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 24 Dec
 2020 06:05:08 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 06:05:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Yuval Shaia <yshaia@marvell.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RESEND] usb: gadget: Question on chipidea UDC driver
Thread-Topic: [RESEND] usb: gadget: Question on chipidea UDC driver
Thread-Index: AdbZRz3fRrbW/iqrTKKScjzjEHKrBwAc2vuA
Date:   Thu, 24 Dec 2020 06:05:08 +0000
Message-ID: <20201224060439.GC27629@b29397-desktop>
References: <MN2PR18MB2911B7D74FD3A16F8AF9BFD8D3DE0@MN2PR18MB2911.namprd18.prod.outlook.com>
In-Reply-To: <MN2PR18MB2911B7D74FD3A16F8AF9BFD8D3DE0@MN2PR18MB2911.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: marvell.com; dkim=none (message not signed)
 header.d=none;marvell.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0eaf2675-4952-46a5-67ec-08d8a7d1de22
x-ms-traffictypediagnostic: DBBPR04MB7948:
x-microsoft-antispam-prvs: <DBBPR04MB7948061A7B9A9460283608268BDD0@DBBPR04MB7948.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLK6epqzvV68QAtxfKAa2XoHO07ybERF7RP/XZXz1ViKqH515HEMuZUhNlYNwWY4oNajvlqHosLYNMfJy/ue1QessSl1j/PKZDe0E9y/edI0jbS9plgkDbh+gfJmylCrkaB1eTrJJsUj650YQXXAMaZtWeT6ANf/kZO+GZJK531SFHvWGL64VJO8axDE7T9RZCmriJf3zZCPg498y04pKeDw77usyTbANeyxfhKO5xQd3lV43hgwOjc7xFP1UlnUJiqyB2jZtQd3JZ8E4xXxymW6xc2rMC1ziIB1LocSlPzxkvUuBfEXLWsxFdOpwVLECTNhJ7PyM+mZwg8DJCO3O+jwcBnUfAOy6qXM3ea8PMrTkXuS6vtUQx63wV2+rYNyJe8/Is5DRnc09qy9z/1kVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(366004)(396003)(136003)(376002)(39860400002)(9686003)(66446008)(6506007)(66946007)(83380400001)(71200400001)(8676002)(2906002)(1076003)(33656002)(8936002)(53546011)(66556008)(91956017)(6512007)(478600001)(44832011)(76116006)(64756008)(33716001)(5660300002)(86362001)(26005)(6916009)(316002)(66476007)(6486002)(186003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?C4oLE5fj2w4JOSOMSJMAF5OVWplhxA/cHGiHYjokgaiKuSs8gQw4BG+PF7Bm?=
 =?us-ascii?Q?YiZf999hQUQXQy6e2Epxmnc9CoUYd5iaVlLrFZ5FTnFNxIWNlhq4CSLnd7VJ?=
 =?us-ascii?Q?txKqm8wELfGEHgK612utP1+M1RSwiYoGovhDOu6d7TN25xBNDy7oMB605FRn?=
 =?us-ascii?Q?xCkHTvR3qKMgJRZJuxazAdgqC96gcXAMMX7kMBZpu+vO7i1VkBEA5LrGPKtJ?=
 =?us-ascii?Q?B5VHjHWg0PCV3vun5+WfP+sHvyOl/MpCGRPU6uWy3jB/ctxhL3yp0drMaPWE?=
 =?us-ascii?Q?66FiRnmbuDEug2IjHI5UUMXXiJt0BnAhfy8saW0XphMG3uDG0cUNYLOeoSss?=
 =?us-ascii?Q?2hURWashYU93hYlZdyNqTgGBcCGXmYciYlb8tG0ct6ApXr+jjjtj9iEaRK1U?=
 =?us-ascii?Q?+vCJqQHOrmdMdkJ3t5losHdzkfU45pqIoyCUC9LKefKscQl2XABb0dqpQhsl?=
 =?us-ascii?Q?XC/kwhD77q+8BiSBrwdLKk8M7eKu+oKQ4eczOVLn/grvCK21dCGB+2JBgwXI?=
 =?us-ascii?Q?Ce0fNF4piqXbF1FHIFwiEOhN7nLA41+J7tbULWE3pfNvoTY44KnUfngnJpBN?=
 =?us-ascii?Q?L+8nFLj6wjhkOuCzk+l5DWrPbOQSjATzA4ilgVnKfrInz/BSuIvzRY96YWf3?=
 =?us-ascii?Q?U8gsUgfAJKYNT/ylJxLe9btItKE6vlg8f1QAhYu9rSBhYXysTDXMP+xk2QOw?=
 =?us-ascii?Q?C0+0I16AHvuhoAcXdR53XUctiFnaD7R1cMbQeP5NEIfMmnp7sfcjqtGk/q1h?=
 =?us-ascii?Q?4jGOMrRdFn2IAtnXbuxM6JUkEnuVta7Iio4cDumonQZJwf4eiP1jmgFjU2YZ?=
 =?us-ascii?Q?cVUqYMePJDA4s2GWphKDn9pt174dHfEZPZhe0IfXk8v4QxyZMViqizx+HjLX?=
 =?us-ascii?Q?vZ2/KvNu6ryebxbWJ6HRMcp5uQ/SZliIVtTqGrazfApZyoO3n7QQoYffbqhJ?=
 =?us-ascii?Q?1KVD+pU+9bk9sKSC5Jzb6g+Q8fnqYhR7DvujChrow0kzh9hnejEhHMYGDdZV?=
 =?us-ascii?Q?OfHZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09D67A6167D09B40B58607EF37E9B5AD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf2675-4952-46a5-67ec-08d8a7d1de22
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2020 06:05:08.8829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTzPiNgoCMy6NWWnKRfoH09RLwkcOn9BJtIHHizfcwhar4sFOzrtLNujxWeUq67GORCJ+D1of89jmaB5Xd5jPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-23 16:19:06, Yuval Shaia wrote:
> Hello,
> I'm using a board equipped with ChipIdea UDC and trying to expose storage=
 device (for example) out of it.
>=20
> I load the following modules/drivers:
> 	udc-core
> 	libcomposite
> 	ci_hdrc
> 	ci_hdrc_usb
> 	usb_f_mass_storage.
>=20
> Next, I used the basic setup via configfs:
>                 idVendor =3D 0x1d6b
>                 idProduct =3D 0x0001
>=20
> Created an empty config, function and linked the function to configuratio=
n:
>                 mkdir configs/c.1
>                 mkdir functions/mass_storage.1=20
>                 (also created lun0 with dd)=20
>                 ln -s functions/mass_storage.1 configs/c.1
>=20
> Then started the device:
>                 echo ci_hdrc.0 > UDC
>=20
> On device side I can see that the setup from Linux perspective is looking=
 good:
> 	[    8.360082] Mass Storage Function, version: 2009/09/11=20
> 	[    8.360094] LUN: removable file: (no medium)
>=20
> However on the  host side I see some errors:
> 	[   10.087328] usb 1-1: device descriptor read/64, error -32=20
> 	[   10.455328] usb 1-1: device descriptor read/64, error -32=20
> 	[   10.695328] usb 1-1: device descriptor read/64, error -32=20
> 	[   11.875327] usb 1-1: device not accepting address 4, error -32=20
> 	[   12.423327] usb 1-1: device not accepting address 5, error -32=20
> 	[   12.429178] usb usb1-port1: unable to enumerate USB device=20
>=20
> I added some debug printks to both coreidea/udc.c and coreidea/core.c and=
 can see that the interatom between the platform driver and the device cont=
roller is ok (i.e interrupts etc).
>=20
> git tag 4.14.76.
>=20

Your kernel is a little older, try more recently kernel. From the log, it
fails at the first EP0 transfer, the interrupt you see may for port change
and bus reset. There are tracepoint supports for chipidea UDC and gadget
layer at recently support, try to enable it and see what happens again.

--=20

Thanks,
Peter Chen=
