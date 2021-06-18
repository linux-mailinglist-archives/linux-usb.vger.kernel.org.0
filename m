Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3885C3AC656
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 10:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbhFRImO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 04:42:14 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:55465
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233129AbhFRImN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 04:42:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYPQy+wtwYkoh4xUX88ZzQh3iT+cDMtUa8Dd0nXbYmdCd32V6p+imNXgI1LAsOC3yGuS2clbPNP1gBYMF4rjONsUUeU6g6BYpG9LNfN9Ii7RypCWpnMFEAlRjWyYMITI9it2RpcNGcPql8u61Ovsx1/pD1FUvfZZLKNV7HU3JeCeq0NmmdQwJ8GQ34zKP7nivbMVW2vyuhUbjcRlOS7o8/T/jE6mThNJ9U6calu4ee6gUoxFVn6LLV8I74MXk7MDoTP9p+3opWyly/vMOmxJ67R2OO430Zmn2ehP50179s5dqAKixV0ry0zVjnBuMFH8etqPdVEMw4oyPL/phSkCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFGbmKH3nstUHpKikC80Ey5jBu7rGxCVTvz2v6oZIWg=;
 b=DRx3QFg7XMzzGclb0haLyv3X8x2VJxRInxvKrfe4LtL2Pv2LTp7Bc702tHIkX8A+MKaKYMfAZTHTA300LVIpjy+GLrY7qfXvYy2fKkvoIPMBdfrp02N5GqO062uh+76IOTg1zj6/IUdHxdTVCoO0SywTRq0RjQZcwRxQkQ8wAfspYuZTLrGkMd96J1tkH87H5WQp1f7WyQVzret74zM0ehKE98iQlbT3vJWDZ3tyZVc5uECdjAC7KRE9wG0IlHl5kf2Yva1BK4h3Fk9FjyTbE6YUSCNusB0H5nCkzWG9VPeTmj1HKCJvqtsKa+ZvGoZNH5fHDkVXRs87isDcTVSMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFGbmKH3nstUHpKikC80Ey5jBu7rGxCVTvz2v6oZIWg=;
 b=n/auo6tWPU55DwRSWqLdhxWr5qQ6Nqgau6pd/pc2B/JhbnlaHbKjoM4CNVpICr4CKKrkaCkf+IhaO/q2CUIZYPW1MvSR8jzOeBMhE3uz/7Mxhxuz3JD3jwdy7vbqY/upoUxb1/aOvpd3x6mhRIniMyPXOA6uU6yodcJLBx4LpTo=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (2603:10a6:10:ae::12)
 by DB9PR04MB8217.eurprd04.prod.outlook.com (2603:10a6:10:244::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 08:40:02 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::d018:debb:2e0:530a]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::d018:debb:2e0:530a%7]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 08:40:02 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: RE: [PATCH v2] usb: chipidea: host: fix port index underflow and
 UBSAN complains
Thread-Topic: [PATCH v2] usb: chipidea: host: fix port index underflow and
 UBSAN complains
Thread-Index: AQHXZBLMLyw5eU0oS0CEb7m7+mLZhasZY5OAgAADlQCAAAjREA==
Date:   Fri, 18 Jun 2021 08:40:02 +0000
Message-ID: <DB8PR04MB5931ECDECBBF988E4D3AD3B4890D9@DB8PR04MB5931.eurprd04.prod.outlook.com>
References: <1623999879-2277-1-git-send-email-jun.li@nxp.com>
 <YMxPBdaTNNMf5rIg@kroah.com> <YMxSBpXrOCljlVuF@kroah.com>
In-Reply-To: <YMxSBpXrOCljlVuF@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 770769de-911c-4e4b-1d4b-08d93234aa19
x-ms-traffictypediagnostic: DB9PR04MB8217:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB9PR04MB8217B50C12C7C96C07A8426A890D9@DB9PR04MB8217.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2JaPfgF6z1Jf7Aq8UB+ezDft/FHe33FCUkexSnnxUbczhbAzMpXYyk921EKHYayv6ia6+P/0nrvNjmS3aMBx3Bh592DsHyEIIRI2IB9BDtjHhg6ZL6WICa+igQ8yftqPWbJV+vj6PX9KMbjABWOt8CeZb7Y4tD7PNvUigGM0cziuw+uj/bis7sTdZH2qZY6SzaZzn/5eRe/tlGe7p+WIL//PeYmVdS9I72Wsf+eV0gMyKFJQQKBkpbW8w7aVwxexr6nisb3ucaSQ0LbdxDZMVMKSJbXo6nxYn8lVbTveiOcSK8i2CRCoOm7x21ntm3RkQ1mWzBNeVD3ikzpujKFCG6SuZVu2/xcAypzqOPQ4yJ9pAg27aNmc3UlnD07q9BHLn2c8CTD/Jldd88+ZQMQFeqWCSYO8hL2EwigPV4LANNHqRS70TVUMgcnfWjjG/Qn5CUfiHzwVo0X6LKyePJGadoJVU5MN/poZtlNrCYqTVGXWsT4AZjoisStvn0uTP6PTzYD8ajGFW0WuWaeaN4B4YUIVClgUp4aw3MXFAYkQgKDsk6roov+9dhCwkbHVYC8IALLuSklj9FvpcitHKR5J8/BMlo2+J5dilqK5ipmvoCQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB5931.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(71200400001)(33656002)(5660300002)(54906003)(26005)(4744005)(6916009)(44832011)(38100700002)(122000001)(66556008)(66946007)(66476007)(55016002)(8936002)(66446008)(86362001)(64756008)(83380400001)(2906002)(186003)(478600001)(7696005)(52536014)(6506007)(4326008)(316002)(76116006)(9686003)(53546011)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VzJteNMuB98NipW0cuh1vGGjR0T4hWH91/ikxK6pzPjO+UTun5k348JEVWl5?=
 =?us-ascii?Q?KAqAEtBH/wqHQbpz9bUZrrMsR+1B11nkSy3krB6FNOszjTv01U+j+6nZTqpg?=
 =?us-ascii?Q?GoE227hHiKvynhAhP2WGKuRLhOKFrK6F+z0KNLWI3f//xPOS2sqyusl5QIta?=
 =?us-ascii?Q?GIc/DSjGkSqk8X3Wh6WDXkrh40bCXhd07WrvGezP0oHPX/ScF7Y1X/3T7+1C?=
 =?us-ascii?Q?xgAOEk9jiH6ICzlyvx3hHbxblczfYEsx6cMDXv1W8jjgQ1u0aFMeWFfau9tH?=
 =?us-ascii?Q?nKtnwRc6rZJBSh5VM588WdBc3yi1IuJTNB3Xi81YguetWAEJh2coQqCFCU0P?=
 =?us-ascii?Q?VW2h5aWXSS843Qi4LeX4EtnUfwD6pDag5xBxNNqWmMHkecNqDI3PVCSGNAJW?=
 =?us-ascii?Q?3H99nO9OKiuLWG5u+iriZ7KMjjJuk4FG13ZyZZMhsBDQbFMQReuaRuv9djJC?=
 =?us-ascii?Q?oiSF2piWr+7eYXaxh3FAc6/hCSN9FPravjlXYaQUmt8ulR/7EnyT2uFWNJFI?=
 =?us-ascii?Q?9HwpwI1TdK2rexCewQKsC/CnnhVfxsFZ+/ikj0iYFRHvPPpr+d4AGga2AiJD?=
 =?us-ascii?Q?u+eIRFjGMxpVx6BUXZ4bTYSht3AEYUy0hIpfnE/M3lIX3bnBFjTaQCMgjEdX?=
 =?us-ascii?Q?QNQGMRZZeXylBF9sxLOnpAPlx3AkHpXYg3AXLHxsQeKSFO7hUTQaM/iBRNH8?=
 =?us-ascii?Q?dsu4lIz8VmH0W+OKC+952jxYpAd2O5e0eser++dDHchH6nzlQ/RhjpDDJyrr?=
 =?us-ascii?Q?8pPDAuMHZ/Jkms5i8hpvV1DPTNHeiNizVyvGel/xOMBk6JQ0xkzdmWFtP8FQ?=
 =?us-ascii?Q?S2hAwLy7ANxUdcoITFbVhVTDhnnU3CdLsKPpb90XWZprZzYAJE862kEuNhi0?=
 =?us-ascii?Q?QQXz/vMHRFwVAcUEDehoy0LkHrvEjqnwTqvGXilHzV+hDdFxw5KtMrfRSWPE?=
 =?us-ascii?Q?NrpmGJ6aA2iwGYzvQTggcCoqmDhhHP05ANcFsq6KlpOuXWzAijVXZBs9Uq6T?=
 =?us-ascii?Q?1qFBFUZwHK3+Qgr6OXmvjuSfxbls2IendUEmAj0dAZjgZUJ6rMKT7eE5dxRn?=
 =?us-ascii?Q?Gtoi/wel3YvpJ3/N5xgpkTc44550g43tTeKJmMwHhOpB/5IFQSXP3BzG0Qpf?=
 =?us-ascii?Q?If+jwNb6/dSwARzuws9xkPcZ6xNv7oxXJ7/cSPAX8ebdC3usuNv836zBw8G2?=
 =?us-ascii?Q?XdAWfezg6CUq9kIy4m1h2MPC57Sgazu5PzQ8KwP24hW3RqUMjsVjQBpq3ZL/?=
 =?us-ascii?Q?qZ+bAynzFAL602Yjl3f9ChTqigzLXM2BbHtiVOif+BJqOVtQ54sJcBBehk/G?=
 =?us-ascii?Q?vZMvnQwdDfH3FsmoHFyvgbUm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5931.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770769de-911c-4e4b-1d4b-08d93234aa19
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 08:40:02.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1SpVaF8O8TnTjnDZZufRV2X3tF8pNNNA/8vKT2JpXTXyYQ6vzJJjDey8NxjVbzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8217
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, June 18, 2021 3:58 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: peter.chen@kernel.org; stern@rowland.harvard.edu;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Zhipeng Wang
> <zhipeng.wang_1@nxp.com>
> Subject: Re: [PATCH v2] usb: chipidea: host: fix port index underflow and
> UBSAN complains
>=20
> On Fri, Jun 18, 2021 at 09:45:09AM +0200, Greg KH wrote:
> > On Fri, Jun 18, 2021 at 03:04:39PM +0800, Li Jun wrote:
> > > If wIndex is 0 (and it often is), these calculations underflow and
> > > UBSAN complains, here resolve this by not decrementing the index
> > > when it is equal to 0, this copies the solution from commit
> > > 85e3990bea49
> > > ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> > >
> > > Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
> >
> > Please use a name here that makes sense, "Zhipeng Wang"?
>=20
> Specifically, the "." in the name as written originally does not make sen=
se,
> right?

Yes, should be "Zhipeng Wang", I will change and send v3.

Thanks
Li Jun
