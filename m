Return-Path: <linux-usb+bounces-14929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0513974A22
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 105E51C25909
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED207762EB;
	Wed, 11 Sep 2024 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PbkEYLs4"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6723FB1B;
	Wed, 11 Sep 2024 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035034; cv=fail; b=LTFJDsmEMIt2M9a/tyjJtE6fUgOrwCr4p613Gm2YIK7gojh+Kx+tXk9yQVf0SjucOHy3Dz/jqcS1TJlSYHBk4AsLvbtpnUPby+oFglHBMbs1iiClp78kP2kn5npoYGLhFCLizxqZkxSn6+HNduGJOzP2a2XkuUg5UOcatx/7gQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035034; c=relaxed/simple;
	bh=R5ZnNdS/0B5MZpmsNCBBnsFVlKvCPJzl9VHXQeU7x5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IfYQcq+UT5PFxoDgfXwl8ebHUijwHMy8Wbm9xncDYEJAG/l+IgoVA23rtHxqk6H7gvFcwejKrLUOyvU9LDLUkhjof+5an0gsNaOMM1/TH4AQwkBdX07yaD5hrWQz8zNXkfg1iEzm6ldBK8fQ9Tk3eSixNC5NJDFPdzav7Ozb5lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PbkEYLs4; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL0a/zDvCymb1zlk8fFyNfr4oXUettzAWAjKXXSrxCI8PD24/Ez3PQF9i7SBNINdTMASnVmQoWWYZsV49VUcowSsxKXZT8+TAS3vBJb3iB9FKL2xuT8C2GnZtv+nfxl9pg3knDUO4wlQnukmFSJLRWkBYz26RzAhZAho6qqB71FKuxtU749hYSog9kABt5gzp3pwjz85aMKlCAfxznhdDuQxJ1rmkTzIMOkpS7hplquhdTEOIjq/ikr6tigG/J7L4i/RPoTw7w1IRc5ZRwhFBk6RDEMB5ymrZZt9KhAj8IjGyPrCexpyn6yXWe3qH25E1P42BC01o9MMdZcjr7ypWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rG6W0keBgT91oLYdQTU3LWgqgk1aBR4uSC0kZVWibg=;
 b=G1kh522VOP3iQikYvJU8bF2pO6z3H3cS2PlXC7xHWa+012lJuY7hec1GQ7B1zt5Bmr39VulMvzG932oxKVUQSZnxQaA4UOp+4Flr6y4h0lSCU+DVAVuMIxV5goUxA3YzrVLyL6rvclTebOS1K7izJjTtSSF2F/f146ZFryXAnIGwjN6ZNBQRqprUANFXyTbGk3Iws8h0dSEbjkNE0W6gwATOpYlAg7o1NDWWRFPRpgqguMF5jf6idG06wWJ0Fjcv5GCXVmVNIDVTTbAkAnPU5z5B6nZRHRhOqJduwh2zFruUSU4d8zpkAxndo96kv15kQW/7OXz3Oju7P0P3qNsY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rG6W0keBgT91oLYdQTU3LWgqgk1aBR4uSC0kZVWibg=;
 b=PbkEYLs4A2FAuDwKzpsAdqt9OI1PfPPLp4WiOV+QZVLnawdDApFge6bWfG5ESgXNQm72r3wDO0qi2ShzWkInKuS/zBo9AJPal71Y7gR83wKdacM9vCTU2X73in7oHvVeJ7r5iVxRsjCKap0FZs8GKLcUTQMuheyC9gHYXCiIaRV+kXTExHNreDtOGdAYyOI/bKXUzYuZF3sWYGlsFdcCIomws2iVPPSxpFXJKWBWoFfDVt/1AWc5HQ+L2i7kQih62W9g2EC52/eRLdVdxX46RtUYEhTcYmf/eQtO4FvLrNG7o/UZbFzUYNBalRzr5TvUaQSZ9ZfYFrOz5b4iJ+GxzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 06:10:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:10:29 +0000
Date: Wed, 11 Sep 2024 14:09:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com, l.stach@pengutronix.de,
	aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and
 enable usb3 node
Message-ID: <20240911060902.pjfrkjbyuvcqso45@hippo>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
 <20240910070339.4150883-5-xu.yang_2@nxp.com>
 <ZuCaquGr+ocHmD6x@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuCaquGr+ocHmD6x@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6fa987-215e-482b-a748-08dcd2286f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f6lz7Et940Ojxo85MOD8lLdaATMwFvir8Eb32DNyXvEUdNf+Jct0F6JOq8lk?=
 =?us-ascii?Q?qWGE8jlf0PuhgINCTRtzQPQcrzLRuELJTM/7sHdw3BVdb4gcc1v6amg00h1/?=
 =?us-ascii?Q?GwFa3t1A6N7p1BIWr4EANPfOTRmWMbNtaJztAwXiNzL7HnjviVhTy8GW1ilZ?=
 =?us-ascii?Q?WnlldEQxGe6rxdE/JkZUm3DYgseTdbZLLrx4b4zf7Jodfm1kCfBkubSDwYJ4?=
 =?us-ascii?Q?Otv7ygxatf14XnJ2EJsQCK7onpS11oiRpqUkTltj1gpJWcjt1f3sJoJaKsrK?=
 =?us-ascii?Q?euxsQxrqusHqB6CmqNxFUyL6CoHEtUYbkek5+4GTaWU9Nbo3SYU9sDpnQqOJ?=
 =?us-ascii?Q?+ol7c4YNdBF7FbQzPOgIYzFjsQeBs8TrRDrqXJXTENSfNfqoo1PaUSUksfMf?=
 =?us-ascii?Q?wR60TmUgSNXX3eZh9sgGlG3JigQW6glfX0SEvlfK+ooUB98CAbnQ9S24wNnl?=
 =?us-ascii?Q?WRDWAVNd4WXjViRFi1wE76O0uQmEd2Il5tQbnnS9gL5lQv4WJr2t8np3tAQh?=
 =?us-ascii?Q?HtJ1vvlfQHlwKz+/OjULXadzMXptav/+Rwlu5MeL0DQFBw8KAZSRzCtVf4KQ?=
 =?us-ascii?Q?Dv/r51ySlu0FjnQNzFtizjukqk/C249n4G5nGN/U0lzD+pt6yrK9i3G+DZ8E?=
 =?us-ascii?Q?bz8D2AtYZ7ym1qE/t0pPKpwuLReyVme1h1CXyX1fHlSuD1VgexPqNrUy3tQ/?=
 =?us-ascii?Q?9hd0zlqxl0UbUgBFQ/GvBkxIVgtK43W8MAS61EJ5pRQkJk3rlzHSUgmpuICk?=
 =?us-ascii?Q?O86zs17XpZUg3H5hRaZPO8bbQUJ8W7aUayAc0LXPtLyBJAUwAeRiEYornsCD?=
 =?us-ascii?Q?Ab23er3lfCiIHdF1QW5iSU8mzu0PuHDRHT2bjHykyyjqkKA6VvKurieFBFLJ?=
 =?us-ascii?Q?2HfLlp4Wlis+LQMW2ARZDHMHMY3KLTGiW+6ilt+p46ETvKC2HMrziWWzmN5I?=
 =?us-ascii?Q?2ZqzPtCWjHJP6xYtSirxm6wL/+KBOM346AnmG72nwYhoRNLqHgeIhxd+LYGT?=
 =?us-ascii?Q?SPFpqfutYTrB3OE38NZhfS2STVTafQvwX2GfIec1wDI6m4R6J6ITJReez47C?=
 =?us-ascii?Q?v/rhMrFF1X5vrTm4X8ynIhSLHIAvYVq5GjOybzNkzj7QatxyecgCibZ5gYOj?=
 =?us-ascii?Q?NpsNZqopuznKaCDTbwyf5eGID3vcciLYw19v2g7TfIKhXgNq494f0kEd/PEA?=
 =?us-ascii?Q?4qHMZyW8KtPLr8m//BjazMTuKwNMncPvUX0Lzzgg8HsBDinNrtPeYs22qKsh?=
 =?us-ascii?Q?+pEU3vzawUqZ7aIcr1ar152ukxtlS4r/qRlveui6EOQdbCk4x2KmCMxp11Mc?=
 =?us-ascii?Q?4SE5BZiR5cNLFqCp5cjYZGVo3VG/7iCZ2H/WXNinvKa+DRGZSdeIz2ijJ8wo?=
 =?us-ascii?Q?pbeE5eE5btpSppkOjoilmeaU5TNVB5jGN4ObUdfiy5ZnoobpJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ei03mkf0BJ94uMmgnnZPJsUsp9s+RiO1R0UuvRjIApFWQzSO1QECjg3xA7qV?=
 =?us-ascii?Q?N+WiScpXnOjrfkzsZPprdiYl8bm74+Vg9brCyqVH/en7wP39ycl9AY+em16c?=
 =?us-ascii?Q?8zt9Q6kI3jgJdBPsxRpn12E+0Xjpxt8tKSOW+dCXqzHrDwNZGWqusUcEh/oq?=
 =?us-ascii?Q?fdHrY1U+so42H91u+uT1mqX6vStzS+LsJFXpBSORLlVMtlxY9Ypb710tHS0W?=
 =?us-ascii?Q?FFHgmfXWbhwUSet8uGj7t9Mg9S5incV0DWYC8hMgnk2/08r+LrOaxN64pQbw?=
 =?us-ascii?Q?+ics8ahxJKOgOeuhFPRtZVX8bKeEAbKWk4NrU2cT/muX/WxS2tevHpa9nQbk?=
 =?us-ascii?Q?GS0OTQdKFKmHQNDwW8wYczgfQclHplnkxeYmTpPgWMh2k2n8KZ2wxvxhJA+O?=
 =?us-ascii?Q?eynSLLKy1VlK72lzWHd1lL0ztIi4PHiW7M90byoxM51mSfOQDi9w0Lfg4YpT?=
 =?us-ascii?Q?+CoI06Qds71mWV19tOv0rk81TXrWE1tzIl/7jABhsKQNqmjwTzCHCEONMAlz?=
 =?us-ascii?Q?tRkKj4UE8tL0OWCaVx6S3caPu4M3aavbZ8RLZBdxizKvYXXUYWvI1El2np/3?=
 =?us-ascii?Q?J5MPx9IqeFCgWvwtAY42o4o4fm2lkobj1Pn5H1bcAZSz064o4j9QECFIeQor?=
 =?us-ascii?Q?cdd1b6SUmxZgRZJeF7jVW5jr9jGJWoJTcAC73zUVfxFZCEUvAb/V4R9ipnMr?=
 =?us-ascii?Q?B2WbGvchdEP3HkMdzUFoyXdOTKggRGaKStZ5BWAC8US7cpJKiDb4AFXoDNdF?=
 =?us-ascii?Q?oi2LEp4RCdTa6T32zXrPUW8C8hGSDoPbo7w4yctiBtieYJdCfiZd+45NZUdz?=
 =?us-ascii?Q?rH2nqvqWgwX6fUBQrdIjQHGskRAxpvvTt6IxfxmsM4SMRNOZaieeKTm0PnZK?=
 =?us-ascii?Q?6AErETnaw4bOCoySzMNCfa1w1yzOi6a+yDLjnUGLq2gotVxsI6UqRx3lGCrM?=
 =?us-ascii?Q?GWdbvc/iidYQehDq0elRKkipgaS9eijg/BZGyWhCJ3brCvPTlhSLHC4JJHf3?=
 =?us-ascii?Q?RdpjtBALnJNLbaKB2SyaHb6gVBt5yhsUgfGF/BDiw3b8+nqnKaA2hYdKc5u9?=
 =?us-ascii?Q?MFefdUJsicGFpgmwgxjXwwkc3pMCxWzhpvmOI7t4I6JD4zBi+/Wg8ctEJSyz?=
 =?us-ascii?Q?+dEJ78RfESwJpug76qx17lU6lvE63i9L8zKQHGlpad5RupwqrmUy6i3w2RK6?=
 =?us-ascii?Q?aRS20R0RjD//FJXAuUgIxmEp80w6cyT8a6kRLFdohqrMlLDTgq/lAu4g5fwD?=
 =?us-ascii?Q?fGw8nK6NpmlvkcX46PuTLrS9W5iZ5qqrsU6mwGaKODdEpqA2jdQzTSmJl7OP?=
 =?us-ascii?Q?F8ltzYoaO0M78SXiOdYLUWpF0QIwcD+gakEN2PB52yUxMZ2ENGbmmCADHGdR?=
 =?us-ascii?Q?Iyt2GlekXsnJpqz/WgxUMUt14wUqHxE6XIJfKXO6B7cq1Feczj0xhycvY8Bx?=
 =?us-ascii?Q?t9VJccM7S868QQqylbBZ5oESVST0uKfp2zlQ512ACVbT3OIqQwZWtEhRb3l0?=
 =?us-ascii?Q?ETBLEEAm9ZO0CmKBdS3iiqtbbUHStNWmetG2A/vTrSmdKuLfWMcJTzLRhgSx?=
 =?us-ascii?Q?KvDpkq3t7shPeolokgzrMBUEM6jw3lrNy/1TQLl0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6fa987-215e-482b-a748-08dcd2286f66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:10:29.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG/tWHaLdoI74uVBXq37xTkOkdIBQFCXnxIMcRhuhfzGbrcPxvDgJ3bq7sTI+7GHDd2cGLzJG1C4NElMYPXIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005

On Tue, Sep 10, 2024 at 03:14:50PM -0400, Frank Li wrote:
> On Tue, Sep 10, 2024 at 03:03:39PM +0800, Xu Yang wrote:
> > This board has one Type-C port which has USB3 capability. This will
> > add typec nodes and enable usb3 node.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - no changes
> > ---
> >  .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > index d14a54ab4fd4..46a9cd3d4403 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > @@ -5,6 +5,7 @@
> >
> >  /dts-v1/;
> >
> > +#include <dt-bindings/usb/pd.h>
> >  #include "imx95.dtsi"
> >
> >  / {
> > @@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
> >  		interrupt-parent = <&gpio5>;
> >  		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> >  	};
> > +
> > +	ptn5110: tcpc@50 {
> > +		compatible = "nxp,ptn5110", "tcpci";
> > +		reg = <0x50>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_typec>;
> > +		interrupt-parent = <&gpio5>;
> > +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		typec_con: connector {
> > +			compatible = "usb-c-connector";
> > +			label = "USB-C";
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +			try-power-role = "sink";
> > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> > +			op-sink-microwatt = <0>;
> > +			self-powered;
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					typec_con_hs: endpoint {
> > +						remote-endpoint = <&usb3_data_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					typec_con_ss: endpoint {
> > +						remote-endpoint = <&usb3_data_ss>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> >  };
> >
> >  &lpuart1 {
> > @@ -128,6 +171,38 @@ &pcie1 {
> >  	status = "okay";
> >  };
> >
> > +&usb3 {
> > +	status = "okay";
> > +};
> > +
> > +&usb3_phy {
> > +	status = "okay";
> > +
> > +	port {
> > +		usb3_data_ss: endpoint {
> > +			remote-endpoint = <&typec_con_ss>;
> > +		};
> > +	};
> > +};
> 
> Please keep node name alphabet order
> usb3_phy should be after usb3_dwc3.

Okay. Will fix the order.

Thanks,
Xu Yang


