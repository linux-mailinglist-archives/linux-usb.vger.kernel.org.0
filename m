Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446EB2C7F50
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 08:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgK3Hx2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 02:53:28 -0500
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:38626
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726762AbgK3Hx2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 02:53:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDOtB3yE/23hWRaYZjE925bp2TNAgnImWbGwWiClcakWuYsJWQT3F39aSUFPvwbzIWT+uwt+ci5VgPmRMEBJMwkJyUV7eE/uLv/maW0PZsuVG4zwXus+r7rltb+v6uBtMM1sedSeayFd01ipbyODId1T/hIFRClODRngNM94lEotimu92bNmEQkDAXV5Kq8nrzlMmtJrn0dGKmX2QHtML+gJSNzVBoJUNdQonUjZWh4v2v/tMU+ixDGYB71gdL8NTt/ujeqkAuRK1h3qNV2FeRlCwQamFM6OMCFSP114lnMK59hiBW6ck/n/qVyLHks6Yzr42hcwNsWYHu2o4hAPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkB0rB6zrKEeTXnSAw8Y3QbpQyOaVTAnvJYLbMET8fY=;
 b=NrvsEKblHgHiSmewktzCmOpfo+pNoqEc+IAMjLBcG5MuQRDErvK9e+sjdJw+Y12voTmWSab8/9Bh8cm/FTBK0xpEKCwE/znfDltxAx5cSmtXts0y0To9D2YLCTz4Wo4HOdrupZKn960HQ2/XZNhA5xpvcIeNh7zYY/d7z36oSjmzMe169H9lZni14/YvLTwgqxXLzFryUmuf9qeaOdBNqg1DixEB5IJYwCP64JrDyHBJ/Y/0LJN0Aq/J9BLoIDAJ90LcO5Kczj+Qh16Dw7oo3S5y3reOCa2pA4+iabrmb9D7PYegyafarGPR4vWhGsuQF8mA6FVH6AXipTbOWjkXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkB0rB6zrKEeTXnSAw8Y3QbpQyOaVTAnvJYLbMET8fY=;
 b=IQH262mewWeSULFq0yUon7e//tfII8aZ9Bhuls7tL7nmOSWz1SvIpDSss3mozdXnj72pesOjm3cfM4TaUsxvnOfsJtgNf8hSz4Z0FZqjGHFtw41YpF9QQrIwAmHRKZSWlq/FrbpS02sSmG2vsZuc0dIEAyrLZvtFTjJimuZ1sMU=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0402MB2759.eurprd04.prod.outlook.com (2603:10a6:4:a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 07:52:37 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 07:52:37 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     Peter Chen <peter.chen@kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: roles: reference controller's parent device if
 existed
Thread-Topic: [PATCH 1/1] usb: roles: reference controller's parent device if
 existed
Thread-Index: AQHWxIaMEeZSYAPeE0ucJ+rFsWrPo6nf+o4AgABXzAA=
Date:   Mon, 30 Nov 2020 07:52:37 +0000
Message-ID: <20201130075208.GD32154@b29397-desktop>
References: <20201127062820.588-1-peter.chen@kernel.org>
 <VE1PR04MB652872CBAAE71856BBF68FE489F50@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB652872CBAAE71856BBF68FE489F50@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba436fd2-c74c-4dec-f8e6-08d89504e80e
x-ms-traffictypediagnostic: DB6PR0402MB2759:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB27592A57763E7CDC5B2B76438BF50@DB6PR0402MB2759.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1gSM8WRBU8w8SMEUPGD74kzEP510lP2jdTcBAI3jUjGsdbYHKEV1P71xV/Ocf0pIw3eZyKYJCj1vsYmCZAysBtXZW/bLlbDPtqO2rSAZKsEzoszv0xKU/dhJXVtwHZerpGRY+0a+iOcya0SgDNM34c1is512TlaQsdnwaVTl08Ma1fNHo7tWUKLCcoI0I/lFqtxDtKOTC96VwncQnU+3kq/lbfdUk1JU+8nQRT2WrywsqLX2SX0BtblAGbijBe6twpZELSjKcXNhOk7400frEiWVPeLk2oLvu4363vGDUV0tDfadlUF9INlNbW7STrud/8pQTPQ+UBDPpTa2WfeSg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6486002)(4326008)(64756008)(1076003)(6862004)(54906003)(9686003)(26005)(6512007)(44832011)(8676002)(8936002)(498600001)(2906002)(33716001)(186003)(6506007)(53546011)(86362001)(6636002)(5660300002)(33656002)(91956017)(66476007)(76116006)(66946007)(66446008)(83380400001)(66556008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cJ57H5k8jLD9EYLs/xzF41axjH8WVhHlIn9NXVoBwJo0zHtsVuzKoJc+nKBP?=
 =?us-ascii?Q?7ulTdIEoCEw9Y/YRPSRYW0JhRDq0AbMsyMSecvg5V1dx3voNsm7pLZ2qAnOV?=
 =?us-ascii?Q?XIcw/Nl2fyfCrmKvOHKNMXz4vxe1FouGuEIQh4QLDfkdv8Dr/v05JPDczhHq?=
 =?us-ascii?Q?DSsWjX58miAOZnHJGNsuoW+sWVO2qc7qpf0/fpYmOW3VV4lT0cVKxuyzfY6V?=
 =?us-ascii?Q?2LUwpoZvoOcfAWnAIccFDjPzC0sWqg9+payemB0JX9P2yI6F4RCq+eajZb5O?=
 =?us-ascii?Q?MzumPhcUxcs40Qk1NQP6X0W/xvKQTVtvHiS/oMz8VjurPJ4SmXkmNsId6sC2?=
 =?us-ascii?Q?T++VCGh8lKyBzWbcsfDxfXLZpPb6HjE+iybLjzhccBnH58bwfPZPaDo+z8Ib?=
 =?us-ascii?Q?5LoxCd70aLVixHAdX+JvorptS4+YZRFLdz+RKx4ypy6u2m72SVgEoTlguyno?=
 =?us-ascii?Q?rT9ZME1Q1ePGLQ9bavbeSLkGi5fvURkrqTKGkyXVKdeP058JMFL3Be8T+CaL?=
 =?us-ascii?Q?7L6+eBj+ahWOfSpudn8KHN71D3M+DCubRr88aeBgnYfjwmGKa6Yx4VGbpf10?=
 =?us-ascii?Q?XOdIN3VXvcx/UZIpJylb3JXr3zBknW27of+ymNoaFhb6QRfGIK9MZ5WNliiV?=
 =?us-ascii?Q?Ce0euxGgIma6ZOIgKaXGpWcWugO2kyr71J92ecgKkNdpb0/aBUN+pP3mOJgJ?=
 =?us-ascii?Q?0f0Yu7JP5SFUbMs3CttYOrIpZAcMw05xYnox2I+ILLhDuT/e/vgewqPdxMep?=
 =?us-ascii?Q?np1HlTFpdn7aHKWYIusK8RwsQc7CW6HUKSgWgqHBZtmYhxz4gI1meW464fv9?=
 =?us-ascii?Q?Wj/mmG+CYw1H+sdPh4dcVFfiBcHLcaF1sGNrYWeGzzyEy3/ChIy+Cxkri9/2?=
 =?us-ascii?Q?iKRNm4X4wdBZef2i1VF/Hy7cZRsPu6SjFgVwleRXhJZ++5waR8c+I2DVuCUs?=
 =?us-ascii?Q?9AlmT90k5M1qjHqItasQ5Ct5bMR8O3wpgQ4fGeMd97t6DjqO1VAUuPa+D8Jv?=
 =?us-ascii?Q?OQSC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F2BD1C1C5CF5E4F8F84C0EDBC689319@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba436fd2-c74c-4dec-f8e6-08d89504e80e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 07:52:37.7184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8pzgxVE55ej3/16sFaseQHqC1OOTb5Xqx1qXOYrEzwLwW9Pt8009LCNyn7sYrGBsrrNTnjKi9Whe7oBKil9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2759
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-30 02:37:54, Jun Li wrote:
> Hi Peter,
> > -----Original Message-----
> > From: Peter Chen <peter.chen@kernel.org>
> > Sent: Friday, November 27, 2020 2:28 PM
> > To: heikki.krogerus@linux.intel.com
> > Cc: linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter
> > Chen <peter.chen@nxp.com>; Jun Li <jun.li@nxp.com>
> > Subject: [PATCH 1/1] usb: roles: reference controller's parent device i=
f
> > existed
> >=20
> > From: Peter Chen <peter.chen@nxp.com>
> >=20
> > For some DRD IP drivers (eg, dwc3/cdns3/chipidea), the core device is c=
reated
> > and deleted by glue layer device. So, if role switch user (eg, tcpci), =
core
> > device, and glue layer device are all built as module, and glue layer d=
evice
> > is removed first, the core device's driver ->remove function will be ca=
lled,
> > and its device's driver pointer will be NULL, and cause below oops.
> >=20
> > To fix it, if there is a parent for controller device (role switch devi=
ce's
> > parent), it references to parent too.
>=20
> This may not enough, the trouble is role switch class isn't aware of
> the role switch is unregistered by its provider while typec class is
> using it, this can happen by different ways, if we do role switch provide=
r
> driver unbind, we still suffer this problem:
>=20
> echo usb_controller_dev > unbind
>=20

Yes, to fix this issue totally, we need to change the way role switch class
used by controller and type-c driver, until now, we still have not a good
way.

We could fix module unload issue first, unbind two devices may not a common
use case.

> I am not sure if we should prevent this happening at USB controller
> drivers(provider side), or this is allowed and we should enhance
> role switch class to be aware of this situation and properly handle it.
>=20


--=20

Thanks,
Peter Chen=
