Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB703342C9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 17:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhCJQOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 11:14:44 -0500
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:40678
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229950AbhCJQOO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 11:14:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HigjDl09xleom9xxQ7pQCKFFqQqDfGHFmOBRhjPva/k0pvr3d4OZRHK+N1QA6d2apzxCMtJ0EZeu7hxFwPzQ0w/yPA3Q8dsrRXoJW6kXo3hjyBPoGdOauBxUTQ2qV3SCIx6Qn7+Y/hmGq7fraFDsc185WMNAAkxBq0Q92ab0AT316kG+6MLfewCdYtvv9zxQ8jIy1+9ElKHLWb20k2wIV3nGjPLZOSzpj+f3qjPZyq7gUVlu43W7uN6LP4pG4VIXKmAn1OyAGMKkr4GQcDFV1/+YR0RrWDxbnyBW62khumcTZ7K8PQEe9zUsZREpvUgGpM+OkqTHnOCWWn2zuMWn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYewYDydAdnoUVj1sIsez/rEDr2TEF8/huL4z4Cx6us=;
 b=m5TtbMQahwDVLP/0Wehqez9YPqdCyfent1ZlwlQIzX0WITaJIdPnKsPbx4W1b9+/faCxENkdRhLYfAQNERfERHHbjx07R7kzHZLgqdMIBAlxdf0zHwelXCdJKKsPkE5a8dAZHMaLztBbvJ0DqBbClnzf7h0aqDcrNgYu2g4LUZUul0+XyWWtUg7Z7DoZrXb5xY/AI3Bh7ytfiFO10n1VhIBmhRGHYUrZ6EbPmko55FOqJ0iUjsdBU6VBd0P4/ir0K+bHfBciybNiTH1gER6MlNOvSM0TB8ee9knXtMTTM3hSNc8Jl1+eUjIIV9+X/fqqlbNsPh2JDzXNPCTuOOhtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYewYDydAdnoUVj1sIsez/rEDr2TEF8/huL4z4Cx6us=;
 b=k34AsLLxS7aBJ4uaQxBnRTNDAGNz0ygfUNzj3G97pcdJfNNgdlS33OMIIGOf/ax10ZNpZ59lSd0kfEfXjUGz3qZgFGqj/WCXjb82NcYeggaehpkSPR9IX8wpPrWxXVHl44y1w4oigFrBk0HHCY0V6rvCXLhEEP1G7Bjs+sGghr4=
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 by AS8PR04MB7639.eurprd04.prod.outlook.com (2603:10a6:20b:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Wed, 10 Mar
 2021 16:14:12 +0000
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e]) by AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e%4]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 16:14:12 +0000
From:   Frank Li <frank.li@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re:  [bug report] usb: cdns3: add power lost support for system
 resume
Thread-Topic: [bug report] usb: cdns3: add power lost support for system
 resume
Thread-Index: AQHXFchoWdfTXKzhfEePJvuqok8cQw==
Date:   Wed, 10 Mar 2021 16:14:11 +0000
Message-ID: <AS8PR04MB8053BCAB89FF26A9C44565F988919@AS8PR04MB8053.eurprd04.prod.outlook.com>
References: <YEiPD6L0BJkWrjid@mwanda>
In-Reply-To: <YEiPD6L0BJkWrjid@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [72.177.87.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8f7d2c2-5f0e-4fd2-a3a9-08d8e3df8aee
x-ms-traffictypediagnostic: AS8PR04MB7639:
x-microsoft-antispam-prvs: <AS8PR04MB76395D20231B244E4018145588919@AS8PR04MB7639.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tp70Ts2C8ANCQ0pHXw9oba46/2pMGek6EOMLVWnZY7XBVVOU6oKiIOiE/PZEpCH5H5rwltwPDLnS0JCsl4TwfeuBTkIVuE2HC34tmv93o0n6M5iLznVKR1KYUuvnl99OiQmGe5OsNnb6VPw0LQWMX3jlwgNhB/kAx8VkYv3jdzJWd0bLbHPO8QeoH8I/Am7YKErzdQjHeY5QwNZPzvxj2gdD/EMc8PbSWo8nFMMMrPdWn8Pr8dNBs6YdBoA39452JkrTUcQQmdCifj5jBw3LIRBtgi4GZYZiCeyjAJVsQN84bThJgg7ETQiWlsspDuUpSvPXyAD/2/U/IOdcupm9nD9VqPP81BUVkQ0nLhAlWrBv1m+QyvIe3DhiXPZIl1G/voLJFP2NKRld3EOnz95me4aqaxY9q3AYDbOwG8qJCQ82ISUmVJMLBbm+BUp3Yr8HTcfPP7jhtGMexnuVAzL2XH/0lD5iirySImPhmMyvOJAntZDP22IF2/GsBgZxJqvQRi+qJ74FHgC9cTUl0ns5/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(66476007)(5660300002)(91956017)(76116006)(26005)(186003)(316002)(4326008)(478600001)(52536014)(86362001)(66946007)(66556008)(33656002)(64756008)(6916009)(66446008)(8936002)(7696005)(8676002)(71200400001)(6506007)(55016002)(9686003)(4744005)(2906002)(83380400001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?WUgC6gRYZbado48Zmd/sdSAzl5deAZsaWOLOaePUA5H2vQQ8B0NWqIBRwc?=
 =?iso-8859-1?Q?QJ7eXwZvFs+kRLfK4qJIHQqBRlBSL1F11yc4Qvwy9nbHD55BXeQ1rRCXiO?=
 =?iso-8859-1?Q?7sEp5O9+v6L/8KpTMxV3dlwa9QAYHMq9cvSYGH8WAeRuDiBrXTcaPoTdri?=
 =?iso-8859-1?Q?SJeaDTC+diCdBMkfwnHssdO0XTTdcqJtcUBs3dElrseAdjsHdmAzaxWPgj?=
 =?iso-8859-1?Q?lYD7zBcnkAfTcVv3nlJn8y1Ngv6c7NkH24tdhI74/xghuXV+AZUC+AM/Z6?=
 =?iso-8859-1?Q?nnUTBeEHqhGUgXvpl1nqJni+XD3AwKKWUxFgDiXx9MswCp0qX+fNJSZbXv?=
 =?iso-8859-1?Q?REd873me/0R4UyxQI/I4MZuI65rQwMEMazpX2uaYN0pGgXS6Ii2avRhx8P?=
 =?iso-8859-1?Q?Gyw5oGyIwp4K5j0e/vW1bB7S5MwZW7QrbBBprBovc6gPe6Eluh0N8BBl9Z?=
 =?iso-8859-1?Q?1lc+Rr21FSqIAMRfBFGfQBTTVzuWqSX1x9qk1Nzs426oRtN0JypOL99jLe?=
 =?iso-8859-1?Q?YwByL8cd28ZbvHr3EoKCBo7624qErd+6c5CoFRzU/jcbJoxi8RkT8exIej?=
 =?iso-8859-1?Q?XLjoWqQl63jtWDvjt930w/PDOlWcfJqe9dZ0gwrpU1PnbauDsKxWirTe54?=
 =?iso-8859-1?Q?eqLq4mWlRkKE29/Zx0AL/aC8iqiKEpsZILuY6TdFa0m+Y/Deb/pk8+dOCj?=
 =?iso-8859-1?Q?wCGs4t4W+du+CAtIkKzBJA9JmPdo1TQ0tSa3X9Q+MhTu8EAyxH46pho+23?=
 =?iso-8859-1?Q?l8fBw0lk9ocUo6Q83IYbIx5+8AanZ8Vs146D90UDcW7px8NVuQASqITLI/?=
 =?iso-8859-1?Q?G23QlYNQCUuLayvVFJ01zEfu6vkK7TvKwUdexc+oOmk+2RZsOYKgZs2f5o?=
 =?iso-8859-1?Q?V4OkGBTUNibc0n8CKv+jfordppI5pBJtr8c8qOcpBfr4wiEs/kFw5hnIPl?=
 =?iso-8859-1?Q?7w6p2LKKpOI5bOq3UFjvR0tudIJtLHlvFTGPeBAYD02pIauX53q/NGUij8?=
 =?iso-8859-1?Q?eISRiHbh+dp4ZucMUupp5LRwogzEWbiLNZ8lQ7SrD1loolOWE4Gwm6jXY5?=
 =?iso-8859-1?Q?KUkJSRq+weXEmNCL4LWynSNt7kLC0qIRF7h06U9+89fLJ6vR/kcEAnkLZ1?=
 =?iso-8859-1?Q?1zw37HgnppMsTiwCykZ4tm2lhnvEBK5K+WgZlBzB52y4jTWqC8clkMNqyk?=
 =?iso-8859-1?Q?ftKAmApZ6qdmd6cq4d3IdQA0zdieYofoxwARoC40li05vJ3i/eLEZ3vqd6?=
 =?iso-8859-1?Q?BOcrDCL/Zg3DVZAZ05Pe6AZMdrBj//2pY0Tz9u0fnUTJgtOWqP+u0DPVrd?=
 =?iso-8859-1?Q?vVd9+xSYB+2qao4nxTiIQgDianhFpDuHZVm4U4PQQuRu5jQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f7d2c2-5f0e-4fd2-a3a9-08d8e3df8aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 16:14:11.9628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: saMYbkYohVvHojtsLKLpstJtkav8ULVscTzd1Bfi2lPg1fil+AhI/Iz3lnm2LtGjaZ+FidJ1skBUGsszaI6DbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7639
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=A0=0A=
>Caution: EXT Email=0A=
>=0A=
>Hello Frank Li,=0A=
>=0A=
>The patch c450e48eb570: "usb: cdns3: add power lost support for=0A=
>system resume" from Feb 18, 2021, leads to the following static=0A=
>checker warning:=0A=
=0A=
fixed patch sent out.=0A=
=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 drivers/usb/cdns3/core.c:551 cdns_resume()=0A=
>=A0=A0=A0=A0=A0=A0 error: uninitialized symbol 'ret'.=0A=
>=0A=
> drivers/usb/cdns3/core.c=0A=
>=A0=A0 544=0A=
>=A0=A0 545=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!role_ch=
anged) {=0A=
> =A0 546=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 if (cdns->role =3D=3D USB_ROLE_HOST)=0A=
>=A0=A0 547=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cdns_drd_host_on(cdns);=0A=
>=A0=A0 548=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 else if (cdns->role =3D=3D USB_ROLE_DEVICE)=0A=
>=A0 549=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cdns_drd_gadget_on(cdns);=0A=
>=0A=
>What about is "ret" if the role is USB_ROLE_NONE?=0A=
>=0A=
>=A0=A0 550=0A=
>=A0=A0 551=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 if (ret)=0A=
>=A0=A0 552=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>=A0=A0 553=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=A0=A0 554=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=A0=A0 555=0A=
>=0A=
>=0A=
>regards,=0A=
>dan carpenter=
