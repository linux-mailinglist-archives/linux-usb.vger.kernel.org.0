Return-Path: <linux-usb+bounces-12276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1B934F89
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 17:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4243284A13
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2C984DF5;
	Thu, 18 Jul 2024 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Iax3ubJh"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404EC3BB30;
	Thu, 18 Jul 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314822; cv=fail; b=atbJpDL+Bs6q5ESR6KF/J2uhSqvhx6ln6hjoiBnTbBLLinJawPTy9E0AvKX1sHd+VmYZ1FVd70GzyUk0f5pL12GPKd9zEz8WsxikNHFxm8akyP5oCluQ2J/YLmrzJeFY0K47LkfV8zPGVA3M5CdsTqNUwSNhvMZ23X7k86IHACU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314822; c=relaxed/simple;
	bh=OG0y0yW5d+B7Xj5my+sUyUk7eVAAtDrhsHhY7jaVyoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uenJI+dv9nB3qj2PVpkCmcc2hnnUvSbCp/PAodD+wEKdbwYqMQEbZqk73t4jNNeOfhKwIRZtUKU0JayHlleVbhJKwhyoNqc8XSDwtN47QCvWr9tArHaWVVDBYiCzcwWTpLPX1cI9RJyODvgUSgXsx68rNjXba48my9qOYQCXgPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Iax3ubJh; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkvCglf9bV9kYoqnEUae+UEcbozCpBJEafhfsQo0negzqaM9sSOQ/FPgIa8qpePWzx/9CjeuoKu+rCzbM9m/jucgKjMCpTmRTUnK2n3Ve6dBasaP0/VSTJuaqUxrf/pLA6Aet7AHUzCgrdBqnicHJ2prnILuUSNu9LiObAv3QTv0OwsY8RWaMyKm4knUtSFTugyp+KRBOMA9oZk54/hnpTpnJ48cjtifPnTxQEB34fxojQS2pgSIjvqEtgBkHAsCrvnzMok6UkgJRJKZUwup8ebpXNektgyEMhy7Hv/0HUnTdGlkEzcoMLzGaY0MzRwy8fxSNeNkViaPh8TAFKA3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2OQ0U4435KvIrP9eI9t3+0rQPOKYdsUYuxvlw91OW0=;
 b=Q231ka8W4mTpS1YpJSn6n0Rc67WI66G2tJkC6Cpg9JzlTLaoDQQhdH5RDfVYUTagH7L1gZ910kSamh3locyX6EDnOJl8bRgXzvmQWF11yEJN1ivBbmTeesjBy/QHsmQcHUIk/HNCRTf+uJZkV9qgrRnLsi5mMuNrzdoZhyTuWSOC13UZzJeyhAQ4V/9g6c9Opi8dqX/2RABStPcMrMb8ibVUSH5dsVmFDfyU9XTQkyJmXSIKXRAgDZHnA5dYEtGjJzahJD8PmdoW9uA+8VAbkWEaHvAGGynfa6xdzTJv04GFM3Osz+RzSUbHDImtQnp4Smub+zp7qwBXUc5N3Kp+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2OQ0U4435KvIrP9eI9t3+0rQPOKYdsUYuxvlw91OW0=;
 b=Iax3ubJhjfYDSmW+TyngthRRMnGRy7x9cMObwcvm0mavF/cCx9cMuH7o5QG1yd2YdXglfYf8cdGsg4qKWtsd2IXJCqwHue+UpdS4JccfpFQ/Kv5Hw+o9mE+k08e7q0HdRyXfrs+BeKERgxRTBvIDqDfCh97mBARFaYmSjWYDDRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 15:00:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 15:00:17 +0000
Date: Thu, 18 Jul 2024 11:00:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 2/6] usb: phy: mxs: keep USBPHY2's clk always on
Message-ID: <Zpkt9i0jMsYQ7rx5@lizhi-Precision-Tower-5810>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <20240718102637.3964232-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718102637.3964232-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: a6006ad5-4854-4ba4-4612-08dca73a55db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6FLfPlmKXpBepuR8XwbKbWnpqzqjwZGYWGRhSKeRsd4p+VuKlDSL/1wz43Hp?=
 =?us-ascii?Q?yIYQGKaluAv9j2kdpAPLzGK9SAjtIgNkhV8SzejAzvhjoh8C2FKnkuRX7R92?=
 =?us-ascii?Q?FZmUYDdWnvAEGpdUXJzYmLLgiMBtZiyCpbI4B3Gc7jYYSJnniYsz0utPAg7p?=
 =?us-ascii?Q?3sHNUFvWwwqfc+ljo+sTbWI4Tk0Ntm4V5dtiPJ4OIDZO6npyNeAhmlI+0dWX?=
 =?us-ascii?Q?7CNoEXwHYXsKWzfGLioIi3IuJEzhoZbbmmoYauK5D/4okQrof+bngi9HYIPH?=
 =?us-ascii?Q?NrgwL9Ym0srFOsryRyexgi8ummz3FKWsnsOeljwj7tBbigJHwOoNIubzhpei?=
 =?us-ascii?Q?fNZVobjV+8DicsUhVFzERBfuWJ+9F5kT2TBNdwzObD57Infr4P5hOsmRa1z7?=
 =?us-ascii?Q?utsJbyqXw7vHXIn1jcLynjAdTnrGBpDBHKFlnFxodL35cHh7/ylk/KgI9Ed9?=
 =?us-ascii?Q?xslfzKcOgya5dXYz7RHEXNH0ur0BXaxBYxAke0lgCg49E4ZLbNsRuC01DSbQ?=
 =?us-ascii?Q?/3EWyuhR749BegH9jTntttoId6oncDdQBLy/RRduAzPIVBQCf1LxLqnkfC/S?=
 =?us-ascii?Q?zsmhjoZ+gB/5NSALGQYv9eTSM+uTaFtpX9cVVnH6lPCxkH0Evfb3X5un8rDC?=
 =?us-ascii?Q?5XyeEbnsUh/kLjQTMOnQKv1lSpdeQvdKF+/o1iHa8ft0cJDQMkksz5NobloB?=
 =?us-ascii?Q?5byyDPQtWOnoVAEB0RF9skBn4epHcl2Vs4I6+wJKTQ+Z675YkO/RXGS6KsuX?=
 =?us-ascii?Q?Ymj8gle7/rcykN/zJwUc/VxMskyj3g7gNEFKhyrprRk3dXyY10FFyOxG0CIO?=
 =?us-ascii?Q?TlgFGlOaBdl638IPHm9ctxOMuGqUNE8iKXsRzQVW4dVk5SGlA3o1tWIo3Of/?=
 =?us-ascii?Q?kJ/SloJJfMItyboWje7om6mxvxeNHpvcskXdGtOYdCC4XWmfUw5IBRxGSa8H?=
 =?us-ascii?Q?mVLiYBoFnesBVC+NzckywYUg3+c3q0Gv6yPB+wE6oY3fK0WO7pXexrgLOFVS?=
 =?us-ascii?Q?+z3BQOIUfAfbBWTNnZlz7FIPAD0j8sC2HF9R/CtteX9Y2zta8V09OXEVYvVD?=
 =?us-ascii?Q?QLu7xB0iexexPYFGdwoMQuO2Uzt1MIZsyG90GNYWbCRBh/fRnJjtKVCViYfC?=
 =?us-ascii?Q?vuzc94cb+Pm0vGh/5NoZ/25MSxEMg80pHqY8okCUQnxsmSoF4O7MoimGznUw?=
 =?us-ascii?Q?OZoKXFgysNvjPv/GVVUOintWArkTJpKfKeOssGnmy+3GIZ4491WXhgMJcri1?=
 =?us-ascii?Q?EDSIuVdvPUTvKKnqeHJiHg1LvLvtd+DyAqQjj08+pdv0Q0PSaRobzx8UpXEZ?=
 =?us-ascii?Q?a3/z2p9cBaFULSUNG8Vo/zYpfbmdGUq6NgLk8/0M45EA1tCglvkM9yZIcXjb?=
 =?us-ascii?Q?xI3/pRK9sROJORTs+pmsq6yLBFcFqzT7tDIhlV8yJWgpWm76eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLsGbrrfmnFgpRnUDGH4QRCs9lS1yYai4maYK3Pth+a+Bh80PPHiP9CXYjTp?=
 =?us-ascii?Q?WhgwGAH+BAmomPNz76SuhJs6PJnKRrvvLNiJ/tWIic6S2N5g7yr+HVXEZjnn?=
 =?us-ascii?Q?vkE79rJwLaulPGQEijOTcmnaSx7hhn2dQarp8gE5XSk14S5nmggTeshSJSXr?=
 =?us-ascii?Q?WJ+L9qO773Of8BKO3m3Eca355cWiTLa8DOkh/8BVTufIJxQC0uF8eJSCJVUK?=
 =?us-ascii?Q?o4FzSAb6a0ubc+P7mfNumPCDgnNaLkQF/Z7Q1HhXtbU3cLwphnr/X6Vv6D7J?=
 =?us-ascii?Q?hp+kL4gOfWHND757mkOlchJCthXsyjsbqiRtnVdESNsFwJJwxve6XHnlXYiJ?=
 =?us-ascii?Q?77b9wAmBKHn49HKHdUYNQSosiiNg7nn2vN6+IgSmL3g7k1J9vSy8JPwcbEcb?=
 =?us-ascii?Q?3TkWwiM7h1GEyJCcWj/4lmfW7j9nQ5OLz4jHp7YxfQ63iM7fLzEuInLIK/2g?=
 =?us-ascii?Q?bvCuQVPQHUkSBjzq/izVOmRHgSNYufh7XbAgH5HvKm5LYvC2kSOAEKr6Qy5n?=
 =?us-ascii?Q?gVH76KxL6Y9gNeWDh6MZkmSDORdc9hGq9rDBe2fsQcp/468kWSMM3r9KBp+c?=
 =?us-ascii?Q?dzTRWCdlGvCEVo+1L4IXOINn8WPw48vYv+LlxssOCpFdEuJQ6AQqfR80Oizn?=
 =?us-ascii?Q?agnWiXGiE9r/h01AsOj4znrkpRFXqIvwysABEO9VKPEddOu25+VGkJQnoUuW?=
 =?us-ascii?Q?nz4H179iAdAvqbkc9IVt4DJa9qb9UNuWYa0sm+eyr1rY1UMwIcaGgQXzTW0F?=
 =?us-ascii?Q?GmrB1G8Fv3q2C76XSjbMM1vuXO9I6IYPBkpUHJjC1dWYNCPOwE4Zm7iNvCHS?=
 =?us-ascii?Q?ziGn08tDtRuZmmmqxvkxueZOmj1YdAl5MT9/vp3AdIMtawohLQLCjZ58ipyq?=
 =?us-ascii?Q?tV/iCRv2HOgmV8c+9psXITEo/ko++bb2dfl1+MCZbxxnN9QP+z9UpaJ5K4c9?=
 =?us-ascii?Q?6ZPdQ3Vz0z+OyhaIbO7R4Wy7rn4x71invUcv9f5BjAqFYCJSOwZ938R/zc7u?=
 =?us-ascii?Q?frsHaD3M1N4EH1Ao238/N8CZOFDft1KUQFfmgrtzd8RNx4utTByrY1HuWrIC?=
 =?us-ascii?Q?cIz8XlyGTeqvttGQCxBZGMLGAJLipQVK+ZZYKTvFg8z2GWjcURWx9pY/Qyjw?=
 =?us-ascii?Q?LwRmPN0L709i18ZgUGs3nH2DjP3SFKNEzBt1blFfOb8zZl02GLG6LQGPtyoy?=
 =?us-ascii?Q?nnHQNrxtnVGuuxtdhmY//1YngUp045YjQiq16A5kaKP2USf7mYrCKU4wI5oX?=
 =?us-ascii?Q?4RqucmoEhDSyZWmAi9J4XDNGR6k2ku+JpW3OrB7BHU/zR+MRMq2icHw6N4aa?=
 =?us-ascii?Q?FdOWfR+/QSdEDm9g5RA2ZiJu5UMYoiCxGCLJ8ac22PNz0xGlH/Zk+J35M/MH?=
 =?us-ascii?Q?n6y/XVme3W2Hp9KNYBmmOGSCXIkWGD/s+EM2xY0bO2mSaSDJReEUMDfxS5JM?=
 =?us-ascii?Q?bmIKziGQxKImNG+ZcuFl6vrw6cIT6I55jhex3aOXKGJXsUA00TXLnlALVMxN?=
 =?us-ascii?Q?UhEbF77lpuZGFznuabGgtxTXfIpUdfYYMrKJ4nyb8M5sAhBmp7aYLVIFh6TF?=
 =?us-ascii?Q?VqmHNY6/pZEA4lYCvfbxgmMNMKGBelGast2MkYA1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6006ad5-4854-4ba4-4612-08dca73a55db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:00:17.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kUZ7kpggs+rOu9l+x3Gr1XQBNy9osWVigMV9bLkDp+vdZghUNuSVKDgO1fK/kZsc4qw3wCjBSjMwMMGfW173A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249

On Thu, Jul 18, 2024 at 06:26:33PM +0800, Xu Yang wrote:
> Per IC engineer request, we need to keep USBPHY2's clk always on,

"IP require keep keep USBPHY2's clk always on."

Not personal request, even it is IC expert. It should base on the "fact"
instead of personal's opinion.

> in this way, the USBPHY2 (PLL7) power can be controlled by
> hardware suspend signal totally. It is benefit of USB remote wakeup
> case which needs the resume signal be sent out as soon as
> possible (without software interfere). Without this, we may see usb
> remote wakeup issue since the host does not send resume in time.

So USBPHY2 (PLL7) power can be controlled by suspend signal. USB remote
wakeup needs resume signal be sent out as soon as possible to match

"spec requirement" or some other requirement.

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 36 ++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 42fcc8ad9492..b6868cc22c1e 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -150,6 +150,16 @@
>  #define MXS_PHY_TX_D_CAL_MIN			79
>  #define MXS_PHY_TX_D_CAL_MAX			119
>  
> +/*
> + * At some versions, the PHY2's clock is controlled by hardware directly,

It better declear which version, for example, which chip use if no version
info in IP.

> + * eg, according to PHY's suspend status. In these PHYs, we only need to
> + * open the clock at the initialization and close it at its shutdown routine.
> + * It will be benefit for remote wakeup case which needs to send resume
> + * signal as soon as possible, and in this case, the resume signal can be sent
> + * out without software interfere.

These PHYs can send resume signal without software interfere if not gate
clock.

> + */
> +#define MXS_PHY_HARDWARE_CONTROL_PHY2_CLK	BIT(4)
> +
>  struct mxs_phy_data {
>  	unsigned int flags;
>  };
> @@ -161,12 +171,14 @@ static const struct mxs_phy_data imx23_phy_data = {
>  static const struct mxs_phy_data imx6q_phy_data = {
>  	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
>  		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_NEED_IP_FIX,
> +		MXS_PHY_NEED_IP_FIX |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx6sl_phy_data = {
>  	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_NEED_IP_FIX,
> +		MXS_PHY_NEED_IP_FIX |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data vf610_phy_data = {
> @@ -175,7 +187,8 @@ static const struct mxs_phy_data vf610_phy_data = {
>  };
>  
>  static const struct mxs_phy_data imx6sx_phy_data = {
> -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx6ul_phy_data = {
> @@ -206,6 +219,7 @@ struct mxs_phy {
>  	u32 tx_reg_set;
>  	u32 tx_reg_mask;
>  	struct regulator *phy_3p0;
> +	bool hardware_control_phy2_clk;

Needn't it. just check MXS_PHY_HARDWARE_CONTROL_PHY2_CLK flag is enough.

>  };
>  
>  static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> @@ -518,12 +532,17 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
>  		}
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_SET);
> -		clk_disable_unprepare(mxs_phy->clk);
> +		if (!(mxs_phy->port_id == 1 &&
> +				mxs_phy->hardware_control_phy2_clk))
> +			clk_disable_unprepare(mxs_phy->clk);
>  	} else {
>  		mxs_phy_clock_switch_delay();
> -		ret = clk_prepare_enable(mxs_phy->clk);
> -		if (ret)
> -			return ret;
> +		if (!(mxs_phy->port_id == 1 &&
> +				mxs_phy->hardware_control_phy2_clk)) {
> +			ret = clk_prepare_enable(mxs_phy->clk);
> +			if (ret)
> +				return ret;
> +		}
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_CLR);
>  		writel(0, x->io_priv + HW_USBPHY_PWD);
> @@ -819,6 +838,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  	if (mxs_phy->phy_3p0)
>  		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
>  
> +	if (mxs_phy->data->flags & MXS_PHY_HARDWARE_CONTROL_PHY2_CLK)
> +		mxs_phy->hardware_control_phy2_clk = true;
> +

Needn't it.

>  	platform_set_drvdata(pdev, mxs_phy);
>  
>  	device_set_wakeup_capable(&pdev->dev, true);
> -- 
> 2.34.1
> 

