Return-Path: <linux-usb+bounces-17709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82039D2316
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 11:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB131F22938
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 10:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844F51C1F11;
	Tue, 19 Nov 2024 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a5EVKKay"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F41C173C;
	Tue, 19 Nov 2024 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732010999; cv=fail; b=BLM22pEphV/VN9CdrZlX/lXfEaaoUuy0b9HhC9kEbvDfZSP+4nDaFBYUrosm81QgCFXNdGKVpc753sMRhvL+HI3UlAGc20uak12J7ALjc/MdC5IcIMthIspBmrHPHnkyX3zYQ9K/QLZsjcaDgJm5IQEfdeDU38d1hs9IbcXVpm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732010999; c=relaxed/simple;
	bh=N+WmSPDoxi8DNjz7rt87Rp+oGt3Zl2pymBkj7lUpJ5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NAxvwsi3QN8Pe4z5/dN46B8qK++pzvOm9Kb/soFfjSwXyw/Q/IpaKv4KG8ClyGNGaRtEKcFAdGgVJsx7AvSa3Wp4HZlPho9TC1eQoL5+a5LRxvjE16xGMZ1ZMcuUiv9Lyg+8FwTpO2Fc1RVYpZeL8pNtwsFwDqZpHJVD7yMbWyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a5EVKKay; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxvr7P0prZ+WdD24393gHrQwxZsj0j73Lv1n5u/147qRamIbbLRvuvdxJTd0M9r3M9T1JmrpQhJo4PsvM27kZYH2efGIyCgdYnDdjZ07PuY+bMNhV4x8m9RiKjjiuBboIlNUg9d3IFVwYoTHbT2yULeNivjX7L67nOqXgzZzoht/Yqkc9wKpqLgY6vi2tstpJRqvdUa/rXV6fLDjBOVE3MW8sP/q5NNBTbiVfPuFz8+thye9aIibup3vhzc6i+/Hnxc59n4GFAwRPqjCGm+mvCD+Oc4Xdni/EOMF6prSjKbRdYKzxTxSq6Mnu9kXedJ1uKGd1hKa1bWVnGAjhjz4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1og3xBx3TcLGOM0hgrhkwz0AE9BJdmvnl46cNmpAhTo=;
 b=nng8IRVJWtXaqUU5UvUJpR0kFrHR2SqmULCbRJZ1NVVbpB9npl2XNOTIsit4+hqyeYAoZor5tjb0L6OJqH0nUMdAfZXJ/f126UtEKxWsNzJPLR1Tkp086YsQOg6mVg2R6wRZy42dW+UOeLB/xC70KwDLT4yGJmwmyO8LZw3kRPreUiHd9lUWkJfgGybagcC0NFxd5sDy4YAfTYqb+F8Fx/4RXdeGzPva3Lhj9kznJxR6vHCHTbfnrPxztqJLVTr9PD4veyM3mOgttoSDbsTMMhNstCy4r9xuGAqr+96esI++0tsuL88Md1GK5gTwFTw4XMZ3Sg1GEN4zZHAuWmDJkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1og3xBx3TcLGOM0hgrhkwz0AE9BJdmvnl46cNmpAhTo=;
 b=a5EVKKayjPw7WSVJ/5e38UCvKhSW6mYhNFietRAQ0jfkBKPa3IujaaC8c3vD9i23FRrzwckN1jd7sWetnOw3aSshEWl6IrdUY4z2r0Z5jfRoffmFMLpZC6twxHr6q3EoP5SZzKZFr/7yzYnvXhoAsi1jalL4gkUl8bQ156CK4rs78SrhuVqSYj9qdk+s9FEjxccMJciiRciSrgzE+Buz2THJxYyT1rtTI1+fQ4UTnlwI7lTvHg9cgFXcvEfRvbOogmA/QzsX8KskJJke6mxZvf5zYwUjZuEJqZa/doucB1QLEuwVuQITQKTbuLCff/xR8x8tWBKAuqcePLJ5PKqjIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9215.eurprd04.prod.outlook.com (2603:10a6:150:2a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 10:09:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 10:09:50 +0000
Date: Tue, 19 Nov 2024 18:07:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to
 usb-switch.yaml
Message-ID: <20241119100729.cjol44ozd55vcter@hippo>
References: <20241114102203.4065533-1-xu.yang_2@nxp.com>
 <20241114-marmalade-bottling-8fe656515ee7@spud>
 <20241115020045.qlrkyrelpgdwpxxk@hippo>
 <20241115-bladder-legislate-7daef7a750ad@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-bladder-legislate-7daef7a750ad@spud>
X-ClientProxiedBy: AM9P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::26) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 2089a5e9-e93c-447e-178d-08dd08824dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aIaZJ3QPgV3jC7xhWbTyheyIDQCAYqVSvrt/w1H3ABUrLLQKVzurx3WmKuCv?=
 =?us-ascii?Q?b0eK9BbE5G+yOqYaAvg0NKxWPlJ9AA8RKJlHwu1mCUnEe8g6EmpJQLO9g0Em?=
 =?us-ascii?Q?fk4OXqav3LRHbxTSRj7mkdP3PDC8L/BzeM84HhClPGQo/r2KFsFax7vCqWX5?=
 =?us-ascii?Q?O0xS1dBLtYjNFeqIbJIJiLtxZc274MWOD2XFh/IAYDXbU8Uj5FWXQfQunu6f?=
 =?us-ascii?Q?T0KdqNSuSkWzQ/1hIi1hir0D8C+MLY3PO1GuF5Nbv72NK/Y+BosFcqkcdcWC?=
 =?us-ascii?Q?QqIv6anqWbp84ryfPi5VVC7urVGcoSpZubGyJOXQGY+wlnuAncfCN1y5k/4t?=
 =?us-ascii?Q?7nWVedCwLUhIQ7EeSbhnqfGcNTH0kWciBD36bkRLzUv6glFab8qLxhiJ7L/q?=
 =?us-ascii?Q?NAaelQDAsCv1JtGPqz2bO7Zr7We7PSmvuDv1Q9XhFZxiz2Sso9fbDIl+Wu6r?=
 =?us-ascii?Q?qDSec/08gF1vv9XH9uz8Arx35XoK1Zz7np+IRxzcgsPXEkmK9I8asGng41/v?=
 =?us-ascii?Q?jh06WlvpMV6ob1tbx8GmIy29d/j/JUudv2wHvF1svnw3+r9o8c8NVA4cU+6t?=
 =?us-ascii?Q?S17g6itOGaRmo/aVqyzoW/QTqDw+I/s3NlQe3CHbzL42HogiGBvCqwWVCwcV?=
 =?us-ascii?Q?kSwdjSbqk1xsFhBACiatVNGyaUVMA+bLct45pAxmZ2NEjC67oI69y/Vse+bP?=
 =?us-ascii?Q?UF+w1yiAr8AhXkS/yTRifQXYhKskLgal/NUjjERTe2XuC0+EqfEDzWsrIYIu?=
 =?us-ascii?Q?jM/PWmESQI4HH1CHNjsAHQwNNhnL1VSVkafhNwWHE5I4vtZZuMZ7cwiJR6eh?=
 =?us-ascii?Q?TSDYTRTUOyaHZKanGoxLjG9Hbsc2/ap+ZUFmk+mg8uz9eC8vs/c16aYQ82lR?=
 =?us-ascii?Q?2IfYZJR4/RaXxItLqQ4FuVnc1y6P18hbJotcNjT6P1ATSxGnPu3Zhc8iSyVR?=
 =?us-ascii?Q?fJEMP2hrx6vLcf3E0+gvtzchOg6l66nHI9YylY1BFzF2Nc+7qLI+6GBIUTU2?=
 =?us-ascii?Q?zhMkrnQpXuYNSn6hQBOQzjhQvm1HcX/ErHxyoG9twTCxUKYjU3a+B03pIFZp?=
 =?us-ascii?Q?MSLVx0SC2kNh4W45WeaGOqrctfxWWairrt4qpUns33ExGkRF51ubHcnudKHg?=
 =?us-ascii?Q?f8BWBjQpBRmcqbsBbaK/dt5lo39itboFc/CiMkwaDjp8NSvXmfC60cRT+R/q?=
 =?us-ascii?Q?1Rth09h3273xHQXo1VShC2qwgjzyXoU4hnD1IUU7iRu86L89lkZaZEc8Qh7f?=
 =?us-ascii?Q?somv2bRWpiG8mbTPZwgblIJ4DCHCRDBCluCplqG3uYj4qjJ2y5CGLdjj8PD3?=
 =?us-ascii?Q?mPoMj5RwpM6Kqnv+AKFf1fdY7UMQRLTygcuVsUSx1vDVZtk41KLplwRtT0Nq?=
 =?us-ascii?Q?ss4Iw4JP5JNraaSOIiaUPOpT46pc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hxcyZbJdCYs2NCHTHcGy/ea69A+1DSPTH7MrRoC7l05+aax76t7gk+OnQD2z?=
 =?us-ascii?Q?S9Q8hQZt8H6LJUvGQP6GSuA8/vq+HZG6gVW0UMavQkQURcr6x9CsyN2TRzFs?=
 =?us-ascii?Q?/WTPLYzams6iI1oijRdOud+wyVcPA+aY1iQK6QzysSqwpgqPba3NZD+6iqHX?=
 =?us-ascii?Q?AgvcYDx0eXX4eQe6gC7Ufl6T99lu3k7t2uCGFNUoeJtaVlcTDNnFKeIKq/cf?=
 =?us-ascii?Q?BS6OD1ONUgeoubqkT7QI+bYpKNfbqYetyAG7oAnwRmVD9OgqBQw3mFu3MAs/?=
 =?us-ascii?Q?HQ2PBZzxdK1Iz4bVpfTJ9EUaxNLQy8AUTo44pva94928sp1rQalWk2EMiUul?=
 =?us-ascii?Q?T7hJbLjl+F0PSk1tyz1Ur1zQcQwr4usf/N0YKb9+h8cTrv4o+tDpdQ+hDUGe?=
 =?us-ascii?Q?POFM2TikitOpGfOzH6xX7hOJbh+lZV2KTBp86cWl65lcC5SkQhpCtVcPZKPd?=
 =?us-ascii?Q?iRn+abm92nArqQirTc8SkemoCEU510bLbKqXgHzEHKxIdF2VJlAVneLWSzdK?=
 =?us-ascii?Q?4VNYnyOQpvx6A6XWbBWEWQtHOIzquU/LrcAoXD9MVpr5ffizBGFlz+MgoIjX?=
 =?us-ascii?Q?bjTSkAKtTAvuEnJNPP4c7Q3U0Wavfh1rWHVm9v8/Ffyj7mcZz3zF2H6y97hb?=
 =?us-ascii?Q?5mqzknWG1d+T0wzZCtHrrRG8iSSxwRLLoqw0KvZQubZ6YBBBbL98fuhOvWpT?=
 =?us-ascii?Q?uxyTkYoaNQWdomgQsalOVN8MImquMEltlgKAkgGNKMaLM/JwgpTOuVKdu3+K?=
 =?us-ascii?Q?TMLh9/NbEHTGuTy7voXtqVYVdHs1HyQ2wOoirregRveBivWGYXYkiuRI13l8?=
 =?us-ascii?Q?h6tcNmtMONkvfNBYr3J/oSVmQozpA7aU3o1+QwR+STq4LUwn12RcGZm7YD03?=
 =?us-ascii?Q?X0sfMHHTkwSrMsLQEHQIx2x5OVVLX3eUg3NqbVCtaJF3ejCUjXGKlooBCih2?=
 =?us-ascii?Q?0iYI9EBqNDuRwNOTFe1ezAYKh0aHizMovCaJrgkJsJvMvqZqbiV9RN8ygO0a?=
 =?us-ascii?Q?pjj/W7SMoi6D5SbV63bbcWyy0DJ4iYZexlWDFb267z518vOCL2DSI5MRx2i7?=
 =?us-ascii?Q?4BJ4KY+nCwfIjedCk8BRk73QGqSaMeaRq5QSXuhRLhJ9nbUb99986XWvIKWY?=
 =?us-ascii?Q?i1wM/N+PduN4KyJawTyJumzlj+EorkTgoyzF10VIQN5fqF42da2KRRfuqq8a?=
 =?us-ascii?Q?tzbgt4iyf20sSnvG6+ErOnlP8DGnW3mZBRDZmR/E+X8qG6aHICgvLTorHFLZ?=
 =?us-ascii?Q?jcwyxTnepvtMLEIJ9JahAX0n/+0WVU1zquCaLb8JRDYIW83ZBstvk38JQmpr?=
 =?us-ascii?Q?rcKJwAWnS9fpWNRam+4g5xWXFXZrZA4ytnCZEpQDAbpL3pAT9VyM7wjqS+L5?=
 =?us-ascii?Q?J/jwTaWIqJthbfFRf84SX4z2oDJp2pGUn9qjAhHQjD2zy8w0Lm+J9EQcN4Bj?=
 =?us-ascii?Q?V70JpZjXDjfF7GwqQr5jYmFWwgE0f3UCtJX1eP1G/KCYjP/Rqyi0sPe/aPUO?=
 =?us-ascii?Q?b1eO01gCbFF+BT392RdrywgnrIreS1fZUbZVnURdtmuiapnKvyzYgRPr6Y2O?=
 =?us-ascii?Q?up02QKhVYFtXSFY2SFlXtXURLyRU0vi9yD5lMKNT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2089a5e9-e93c-447e-178d-08dd08824dca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 10:09:50.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2wN7cHta/kJgaK+Xr6dN0lNZcnEDPKfzKJTSnOkOmpaAodvfg9lwo+46Mrgn/GUh16TjVw6WkhZPMhz2Si68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9215

On Fri, Nov 15, 2024 at 06:34:50PM +0000, Conor Dooley wrote:
> On Fri, Nov 15, 2024 at 10:00:45AM +0800, Xu Yang wrote:
> > On Thu, Nov 14, 2024 at 05:45:07PM +0000, Conor Dooley wrote:
> > > On Thu, Nov 14, 2024 at 06:22:03PM +0800, Xu Yang wrote:
> > > > The i.MX95 usb-phy can work with or without orientation-switch. With
> > > > current setting, if usb-phy works without orientation-switch, the
> > > > dt-schema check will show below error:
> > > > 
> > > > phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> > > >         'port' is a required property
> > > >         'ports' is a required property
> > > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> > > > 
> > > > This will add a condition to optionally refer to usb-switch.yaml.
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > $subject is not what the patch does.
> > 
> > I look through other yaml and find below format could achieve the
> > restriction on one property:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml?h=usb-testing#n54
> > 
> >   - if:
> >       required:
> >         - mode-switch
> >     then:
> >       required:
> >         - enable-gpios
> > 
> > If mode-switch is present, then enable-gpios is required. If not, then
> > enable-gpios is not required.
> > 
> > For my case, if compatible contains "fsl,imx95-usb-phy" and orientation-switch
> > is present, then this schema needs to refer to usb-switch.yaml. If not. then
> > this schema will not refer to usb-switch.yaml. So the subject could reflect
> > the thing this patch does.
> > 
> > Is this feasible? If not, could you give some advices? 
> 
> Hmm, I guess I can now see an interpretation of the wording that
> reflects what the patch contents contains. However, you need a hardware
> based justification for the condition you're adding since it disables
> mode-switch and defining port nodes etc if orientation-switch isn't present.

Okay. You are right. Based on current schema, it does disable mode-switch and
port. However, the initial intention of referring usb-switch.yaml is only to
support orientation switching.

> That's fine if that hardware doesn't support mode switching or ports
> without orientation switching, but not if it does.

Yes, the hardware doesn't support mode swiching for now. Therefore, it should
be fine to add such condition. Maybe the future hardware will need mode-switch
and this schema needs update accordingly.

I find the condition of judging compatible "fsl,imx95-usb-phy" and orientation-switch
present is a little complicated. I plan to send v2 to simply the condition.

Thanks,
Xu Yang

> 
> Cheers,
> Conor.
> 
> > 
> > Thanks,
> > Xu Yang
> > 
> > > 
> > > > ---
> > > >  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > > index 6d6d211883ae..1238792157f8 100644
> > > > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > > @@ -118,6 +118,8 @@ allOf:
> > > >            contains:
> > > >              enum:
> > > >                - fsl,imx95-usb-phy
> > > > +      required:
> > > > +        - orientation-switch
> > > >      then:
> > > >        $ref: /schemas/usb/usb-switch.yaml#
> > > >  
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> > 



