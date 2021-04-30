Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED9C36F804
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 11:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhD3Jjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 05:39:42 -0400
Received: from mail-eopbgr60066.outbound.protection.outlook.com ([40.107.6.66]:9606
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229543AbhD3Jjl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 05:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXwq3PsXtCoU48t1OnmbAE4lurBwN0FzOjJG3gYLUfIkJmAw/v4H0R8scCxwXXOKsmapvawVPbyNIQ/JlgszpRJZxAR3gP/egmtDGY5P+JUd8NG6pc5Wc3QVL2AyHIqARTCNip7244HkUN65TJ4yy8iHxT6d3cRpKAiEsbcIwV0zPJJ8HdRewPjfL7nQmkcb1HaM7eBU+zjmZMKSkU5a52jUuW/bX21Ni64qR8B2pBpuarcFvHgtPuarVXzlcDfYEC2aQ0DcWJpxDO1xRD+n9XK03KUE2hc8Z2mGgvatYlBQlMgH4JMi0jJQJMxvR9Bdy+uy98WjDZ8OZlVv1SJR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yVjis698Q3jCyOXqNfJsEIrHMgwxqkpQGy+KF5n1sM=;
 b=CPKSEe6E9WJgBnKGVAbv/Ka+1ogzX1mg+Q+2g83c3uLN6KzkT3K4ikIfYJYO2KWD9UyunY/yFZdeiTS0HNM1iVwgWSZXd7ayQBlzFOP2JCALi7jXFFayDi7dnLfnvdDz3lVglZt5i1MkiEMrMA9blOz+hnkFgfTQAil01Y3wwogZlbcgfD+KuWugMrm7Y0/62yM65iMOalfwwmZ5OEuFdtJCWcwZTPEvmUwzaurYBATPMbwb7uBOg4Ln68ILzehyROaeQwGe2BcD427sXs+mhmWgoJ+imyXaWpWwuaU9kwEhOvJXlfAYQdP+wTp2/SQ9lynlc0g10A+YNpS29qIhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yVjis698Q3jCyOXqNfJsEIrHMgwxqkpQGy+KF5n1sM=;
 b=mDcCBC7EurjJdiBoxT8Q/pfcioBQkhShnVJa3VKmGLrsFL5lYKD5ZwjLZPokqO5IbiFPmc5Ig1a0LNJTxWqaqdHmeOhpvNNYiSnOr73Z1zKB0sVB/Quzljd4Y/cOgtct498Us6B2JnqufFQvX1KnIj9/oXSStA+ea2IPtIWmKq4=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5086.eurprd04.prod.outlook.com (2603:10a6:803:62::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 09:38:51 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4065.032; Fri, 30 Apr 2021
 09:38:51 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexA=
Date:   Fri, 30 Apr 2021 09:38:51 +0000
Message-ID: <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
In-Reply-To: <8735v8ji31.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81c5c8b5-8a3a-41c6-9ef1-08d90bbbc3ad
x-ms-traffictypediagnostic: VI1PR04MB5086:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB50868BD45E1975AF3C38A137895E9@VI1PR04MB5086.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zBiNG89LKyCRmZRZF/diUUl3vvNidp3FCCXb7i2JkdnEsG6vCguTIJxiFOoarKIN19IhCES4MdmeR/1PqjDXgHdp1YrTAR0uTQwXvODopv+ud40/HBUD5kKYSd2087tkxlz4PJSYc0JnpAR1DaF7hCdoRocr0ntGdEiFM6yPcRO0Hm+2GwOicnz+3OiDwBV1PF4H5+TD75RMa7HJNMRiLM9MIUISn/QKR+uljwNUblzvDE6O2yUzocDmJfCSbzbIjF0sdfyXEkM4iHNs/DyQSvpLNB9afLllgkgmbmv8pJGEON5cKFIhrfdT/oqPLov7HpUOfSmkgvD7iCmX6dczxC5SM5hDjMhutUKqdNylxehJVboeUpZQbAruE6Pui7MKOhZHJAaIIMWmKutb74wB7cMBbxzzJXr6abcAUTCijSMQkzxXSqToschDcekhy8abvkbLwYawA38mWhxscWhABb/XTzS0J6RMzpX0o6GaHe6a3G0cKrbvxlStkVC8hBXN82gWqPmoaBv0ix80+QkXcaucdJK/dzmN94UFCO61uoppaH9keH9TihI1JcCupBrWTd4tn4OWvhqXyRhHQwOGkBLdP4HnwUipWLCoxq65QhypxMONo9g0UH+IYCV/VvseVVC9Bmn1rdKxkaAURuqmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(71200400001)(122000001)(110136005)(83380400001)(54906003)(9686003)(52536014)(76116006)(8936002)(66446008)(55016002)(4326008)(66556008)(26005)(66476007)(66946007)(8676002)(478600001)(53546011)(316002)(38100700002)(64756008)(86362001)(186003)(5660300002)(6506007)(2906002)(33656002)(7696005)(44832011)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9vXUGDVvSG2fLWJMaF19Nm5IJLU6kxnz6mV0FLOhKco6XgeVPsFR7SIKG3ER?=
 =?us-ascii?Q?J7GjAfrByVCrpvdkFL1FWB/v3cAzt6uFIhjF2sUZXu77yHH9gPVVb2+XNJ/4?=
 =?us-ascii?Q?wXK4/jECeUZypng397Ku7VUbhBevCFyG0qlYi8+JUxB5y0PzS6Jkovw96TDA?=
 =?us-ascii?Q?g/mHENPm75QRsEZ8Q65U0zsdqi619pyPQHvvGxfkgeeiM4tsBpzIvKlco0M3?=
 =?us-ascii?Q?zJGUU0dMQoDe4u9pEyofZ95RTt6diEtRWa3kB9skD/1ui8DLZ8gW35B/OvVl?=
 =?us-ascii?Q?C5nMu4zKW5j2HhL5+2TocHoPPJpZ7TwKLd5YpiETJ0W1Zs9G1a72NL4lY2iu?=
 =?us-ascii?Q?lSxntVamb5bPylsiJoowEBcGHEw+c1dG91obK9G6Ma4qPbpB+hNrzfvagrUv?=
 =?us-ascii?Q?oHFRXDGdA06h9X4UpMz3/roT2gp4sMZRzDIry+AZYFj+zarp1MuQNJ+ovKSr?=
 =?us-ascii?Q?Lao166Sh48U1X8l65aVNW4rgC+tHmE72OIerYt4X+0q3Vx8F73Vm5Zw9N+/6?=
 =?us-ascii?Q?p9uuj9ZckzAVlNEvyx9ygfOBSyHKtH/0GOOANLKnAOjuMSDEkmZN3YuBfRLM?=
 =?us-ascii?Q?LjRQsQ48XGgvY2D+DPa8NOIMyuKoUAxSPUX3PmwglduO1fgiBGaLQEIQp/WG?=
 =?us-ascii?Q?zmOwmHUlZA8JETl3epcJBGDxNAy4G9/mb5pgpI9LSnzaDTz5gom+8tedqXsC?=
 =?us-ascii?Q?HB3K05SWlxRibngeUP3XVEvltiSZAIO8PY3MGAVHQezyEOjGF4aasEgKtBFk?=
 =?us-ascii?Q?kmGuFAceDTZTKpPkRpg0IIlFEmcH1bdThCvkbZJyVa/SV1VtbSqojee8a3U3?=
 =?us-ascii?Q?SD8/eqcwBH3XEwUMizUi09qd0nDRvkJ8Y9iP8CRXykz/lRzePQn5NahoNP6L?=
 =?us-ascii?Q?MbdqAQVJwSdlOKmp2FAwor17daopK5idDLG+DS6O7lR82X37IVJBnIpQV8/m?=
 =?us-ascii?Q?Gg1VBqka9SiIuJnC6Z0WoUgXGl4ZsZMB4n6XvGjY1tutldY8r6I/e6iiim1/?=
 =?us-ascii?Q?3/jhrmPGePW227sFsVoE1d7FNYL5DXo4qKEMIA3gvdcHg0EAUvpvMjoXX0Ln?=
 =?us-ascii?Q?alITXEAN8kbRpWLBuYMiIzjymGyKL1cbmv7jElacQmjHDzydWBTPLBxEn00T?=
 =?us-ascii?Q?HMEH8HvNqO4hArTc/tH9UY43DX/HPpSo8ekUUQtZf4vjUKa0eTawaZEiH3cc?=
 =?us-ascii?Q?/kgWBF0zg/zxl7520lDvwtKx3dh2ld/1r8QCyQBuN/wtdVOaTgC2c9rOjnzs?=
 =?us-ascii?Q?VJailfhAnN7OAWyrfOG2+5Vrn3zFSSlRZ0ANzYiEdhpaMB9Ld1q4yAnzee1V?=
 =?us-ascii?Q?WvDpp3aLrThrkWceixMOSCum?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c5c8b5-8a3a-41c6-9ef1-08d90bbbc3ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 09:38:51.8101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26qevKhcn3zr5qfRig2jcAv+oiLfTPUnn0RqUfCQ32phX8jZKJQfjl3Trr5n4lCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5086
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Friday, April 30, 2021 4:24 PM
> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
> Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compati=
ble
> string
>=20
> Li Jun <jun.li@nxp.com> writes:
>=20
> > New schema of usb controller DT-node should be named with prefix
> > "^usb(@.*)?", dt changed the node name, but missed counter part change
> > in driver, fix it by switching to use compatible string as the dwc3
> > core compatible string keeps "snps,dwc3" in all dt.
> >
> > Fixes: d1689cd3c0f4 ("arm64: dts: imx8mp: Use the correct name for
> > child node "snps, dwc3"")
> > Signed-off-by: Li Jun <jun.li@nxp.com>
>=20
>=20
> Nice fix :-) It may break down if we have two dwc3 nodes as child of a si=
ngle
> parent, but I guess that's very unlikely anyway.
>=20
> Acked-by: Felipe Balbi <balbi@kernel.org>
>=20
> That being said, why do need to keep a pointer to the child? I had a quic=
k
> look at the driver and it doesn't seem like the pointer is necessary at a=
ll.

I need keep the child pointer(dwc3 core platform device) to find the dwc3 c=
ore
instance struct(struct dwc3), the wakeup setting need check the dwc3 core's
current_dr_role and do runtime resume based on the child's dev.=20

Thanks
Li Jun=20
>=20
> --
> balbi
