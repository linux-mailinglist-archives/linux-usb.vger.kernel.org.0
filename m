Return-Path: <linux-usb+bounces-33280-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCKHEgRcjGnelgAAu9opvQ
	(envelope-from <linux-usb+bounces-33280-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:37:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0D1237C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB7583015A49
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 10:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689B1369222;
	Wed, 11 Feb 2026 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YW9ND83d"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C935581D;
	Wed, 11 Feb 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806258; cv=fail; b=QVutDHI01eQJGTRa1JAhP8hLmFMg0SixBxm1NlnIWuaIZqJ5jjVtuXUp3wMaggyLKRyRomZOpq9z2gcpuQzUUZC5oX8Q9leLWHgxUPrcdGCaoeFV/Cp/dBqTl80hnZRFG5hAC1Bm8/n6sovzNMCN8vFD9VEF0cSrnvR1zsd3xdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806258; c=relaxed/simple;
	bh=CB9hAoLIjlwKy5dyai1DyfohE7UE50DS88aO6pwj8ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=czwovI83XtS1Wh5JaaYQsMlAzJCd53NJYDdvJVx8PTdHTx0YayghYKI3bMwZDaZuH/DjCtbloa5jAd6c1jgZT1SboMU5ob54Zic1nPVz6qSyai2FRs0GFA3pFsDb6eObBVDIhxWB1rMxwY0mZQVtYxMc8+fmvipLmQNrqsc0AvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YW9ND83d; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGSfC/NcLQY5pQB2yjgahcEC9YI5oEl8x4Xyqf9V1gsRz2YsWH9Cci/x2MjbDQK+o5pgBWE5jb2mzo9r5JHz6AvosfSSsqnpPXYFZl2k9L6ImNGJ8cyhk2u2jcjsa2EzPq1FvJE2AdNDegTfSPa6/Koxc7pEzKtZ6la+B4B9JCu1vw/heCCPQJwSD3YGIS+aGkdl0i3f91t1xOPBRuGya5eVZIJtekCB8k0zR+/TTXQY29tmu+BsbUplYWOJtt+sSl6HfNpV/89TW2GAKTqLIRZzHkKHST1GlwkM/nfIaJ/McQ1MA8yhuIHCBFrqkeOZMVUKPUz16sMLPOaUliwqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BIzuLzXuApmfYme1GpE2uZ20M1LBXEA109vN97Vn1I=;
 b=V+mi9vO7rsZ9VsQ9s65fyg+j0tEH8CehgqRTu66Zk+0cP7oA1IFaiON+qbyUg5GGnA6dtA74erdVDxpZL6dpFLmE95MzJPzQaG3SxLJO/6bT9h9Kl45oN34Oy1B509qqbSfBPuXeopGwbHKj72G+PxFeALMSYAXJFXQoZtKqUi4CiEFHmtH4qWpV9WEaRSaa69soprxeaj8N2jr9r89ibM/tofD++nBm6xGXQsFgp6iZZ0ufoZi4HQMd08da/zmPxZ8b5rOKm8iWSkLrvXYvf2cKNE+7giRzEMsOyv+d+GjPpRgZsbTYl/HrvvNiKlH+Rucy467OGcx7sUVyqlhsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BIzuLzXuApmfYme1GpE2uZ20M1LBXEA109vN97Vn1I=;
 b=YW9ND83dVxQmQ8wloX/o/6vdwR5lZBFeKdG7r7D57XuCd6wTEXX4f6ZVmnP5xK7rtim+AXlD1bTAIoDLRbbcq8ZLBCxRnApy8GcCNvNDqkriVFC0KkqVX3Gct2nnpAIeg4bW3z6CSxDSnl5zhoJ4T0w5h/2j/OuP1dHhTsKWhIBFKE2CDlzCFKOPQlTuCac4am6qoeF0BvDiuLEkOq7rxEdMw4uOga1BX4Rtor0v1buhfGenMTXGhepStyi7ViLKJrBZIXohjy6KlEnx8V/TyDcxEU3vW4GS71Pv71g20O+TiH0h2xAk4QGSq61wVlrnocrQfX7dPgwa3+Tw7K3AJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM0PR04MB12074.eurprd04.prod.outlook.com (2603:10a6:20b:745::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:37:34 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:37:34 +0000
Date: Wed, 11 Feb 2026 18:30:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: add needs_full_reinit flag
Message-ID: <jzhysjylrcurcxuiggwyl2w7zvvhimslhylncgainyr27zwgmb@aijw34rcnlml>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
 <20260210003942.qzp4jupegbocsh4z@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210003942.qzp4jupegbocsh4z@synopsys.com>
X-ClientProxiedBy: AM8P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::29) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM0PR04MB12074:EE_
X-MS-Office365-Filtering-Correlation-Id: 69813c92-c487-4d9e-ac91-08de69599154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IrUwFVEY76VXjHB1Rl9ILZS/hGLJgd5v6enMRmT8DzvN8Qx969E7py0uDQjI?=
 =?us-ascii?Q?8bDtfoQGdoeohUv4FYmTARyvXu2e9+/bR5K2zrxHxpwJXabSQ7gHDlvU+JmQ?=
 =?us-ascii?Q?wiARIUunIzBYLPmS7WaN4b4/k4+i5xYNrMk3ChaiHKFvQwciYyjd0OPfznNt?=
 =?us-ascii?Q?t0X+dNmDc39eHpMrFTondWGesiw5wJCNlTLAfUCLM0d4317NBe5QITB4JkpS?=
 =?us-ascii?Q?JqCz+bFa3j/daENwCpTMr/87F49woiKq73VH8mrkO51tizT4pMYSYx1qVwzh?=
 =?us-ascii?Q?HaQ1Dsgr6gLi2HWp+xYEJUQ71/xzjDnzok1b/TB1jtwF9DdB4tNfFnW8Y2zw?=
 =?us-ascii?Q?kH5aXAW5e9zWsGOM2mmU2XIYebPkQSu6KBSQCNMkggCJ3Nbjz7fJcCHbidHq?=
 =?us-ascii?Q?nP12yphkgoSzvkX7eQMT1hwvC3KgYt1kwUVaapU11LjJgk67/kJR2l/eTpYD?=
 =?us-ascii?Q?qzMmPI7huQDVcyWrFeCg1kgC7PEkXROivje34/orBEpi2Hm9mTsLg7hMbSYX?=
 =?us-ascii?Q?Bp3mVay5BgtMDJI9XncogNDWq8hIHkAbCb9GEbTyCPDG0Pry4tOlXUazBEzu?=
 =?us-ascii?Q?bs7YLtuh5Sr45yt5ej3RmxYKq+4vGmMTsC3HlHWvo7VQ3KZuZ7vbizdbgG1w?=
 =?us-ascii?Q?CxuLM+vMuS4QYfEe76cFNJDadwp8voz2h74sLr9qZiTz/ZTJbcNZdKo3ZHha?=
 =?us-ascii?Q?nr5eeGPB+g+QTzEiedVkStTPmyTmLlZgN7orRCWDR79QRAf7ejYArORq00cq?=
 =?us-ascii?Q?ajewwI3h/e71Z9z3H7paDS8zkZPVVE+RxOPZKuyrKAstSPp0ph2x/cuLBwKj?=
 =?us-ascii?Q?/pXtqNfaVY+g/y5enrZkkg+Rl2zXbDFuw1ylrE3S56SLbkugDHyIJQqr/3JV?=
 =?us-ascii?Q?m5WLw0HorL4OHNRq7Xv/nnEJDZ2W3acUmC8D7kZoJUJ3jE1t9oXuAqsgGACu?=
 =?us-ascii?Q?ZkjHuhf35Up60UHUGNw3h1rarBwfkR5KzmOldNd6eYLt1fSHI9pVt7VEyS80?=
 =?us-ascii?Q?bu+QK5VPr93QF2J/2cXvTA+rYadgPaULICvVJIcgId617w/8Zl2hqVM0hcj2?=
 =?us-ascii?Q?okxy7gW/eG6g+VfzUHriBMTegHZqxTf5m5oRXd9uWK3k+SDeX6EBM1x7mLaf?=
 =?us-ascii?Q?7RJUGip+c6XSixN6bkZMq/MmJEXuQBY79yxr+7TrBpr5fIWFoIEfoX3HW7Gk?=
 =?us-ascii?Q?db5DRiRHrva7g0R+cwb8/neBwddxhZl9g9yMWMVQH5vVw5G8gIiXM0FvZ3S9?=
 =?us-ascii?Q?I/I3KX1AcbP7QO8yAQfdyeQ8jmNEK8Tt7t1s+y2L1OpOqqubyOIudpLiR28p?=
 =?us-ascii?Q?gSZSyf0GBOdvYyATN8B33Eby6sFxAXkr/XPs8mCzx9I0B3AM7WpcmwVz58hi?=
 =?us-ascii?Q?gbVaPmDbgrym0WJMRGMcRQGlnDY4H8uCUiTSChHwoScrMFLO+jaXVH1xDnH2?=
 =?us-ascii?Q?H5FOgLrzwodsavI4CA0ZJ/NInt8yWLvtwjbe1+tE1yxvK2JrfRd0MELWyNx/?=
 =?us-ascii?Q?oEY/Ov7wpVYvA6AIWfSA90O0RDusIXYLvcbn71ZoSNF8Z0qkEmUUn6xy6AeM?=
 =?us-ascii?Q?YLA2gY1Q8OlW7F6ZZiql/RYwUAiSFy37ezMrZu44/uoQsvmbxzdGUDsZYOOp?=
 =?us-ascii?Q?Ojprwrqmy6cnxK1YbvU2UB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ic6SfuXuuLkl5vGSUgJsD9I1y+pEcc7P2lvC1hnZcoK0DUm5iqdfmPbYUzyw?=
 =?us-ascii?Q?bjoVY7rxIwMku8fU3f7dURwFCAtBvIT6R/dzq2c8U4TLAquSYd5fMLHqjvF2?=
 =?us-ascii?Q?OF21MeerAO8W9GUiLXW7fv9UbG27KuFRbxuA7Z0CdNCnPVqpwHCSbDgSWfsS?=
 =?us-ascii?Q?7hOriIjzY7rZbbK+ivYJyelLHh3uls5+HF+FtKnlJ1LnJgWJZ+DbxUvxT9xa?=
 =?us-ascii?Q?IEcavYHtguvtdYLfFPor0Z8EY+4KxVZogPkN9fHiPq2GdCxzKjA7ZXv0CpYa?=
 =?us-ascii?Q?gWDKP69Ur8JdJTp4N1MaAeVuHxTlqHHS6fIC9QIgyHBJOBM2ZO+Z6w/u012+?=
 =?us-ascii?Q?zrjdAsLxVAkjfs5UnhzafrNMMCyDGnE4TURGQuRCUryxv0yrDhzF+YwhecC8?=
 =?us-ascii?Q?EKMpEuY3135MuPtvu83Pl9OG626j+BT8bnehGilqS436r0TXnvOXJ6wA/SUk?=
 =?us-ascii?Q?gmhZwL555WkO6JbrLMHtnf9SJCpI1lel4ErIlEXSY8lzG1jRaGcz16q/NEA4?=
 =?us-ascii?Q?A6rvd6o/rdmTBqov4uGxczNb/C4ELidycwPAtKggOdu5SdkkrQBP6LgzNeb2?=
 =?us-ascii?Q?UNEdz2+jEfPBIaaokUvTCzPbJjY4RsLLelQv949sj90h6JEeYGpwlwVTP1MI?=
 =?us-ascii?Q?vKB8XxJUXg1dmu+knrVO1wbTi0HEaJsSzMWyS+DHxP4Hsl8UXuLgOLZ8kthw?=
 =?us-ascii?Q?IhI9+dL28XDFCSRREj4BJ0BQjp2xyvAI/4j2pzJQ1cS/Ry/frSHpg4t8zGmX?=
 =?us-ascii?Q?3AAG2wXSFW+C69676yIvODW1SPIALH+Adh6u6XLCAUHj02TuVwIyZ+tBBNTp?=
 =?us-ascii?Q?6BhXYR2b6VqiDvOxX464tbgislQx3iEwkhOth4PQH/Ypvl0Q7JrLcckvTy+v?=
 =?us-ascii?Q?ZYNc3sJO1v+NoQMF/4+uFlkBuB67IYTpoHBrLAUQuMM8l9rV0XXCRcy0k+7Y?=
 =?us-ascii?Q?Jt4WraRmboNUUHZ8x2of6RKm25n7IIUlC17/vA7crt0lUuM+Oex68ASV5pYV?=
 =?us-ascii?Q?fT+7DK9YgnFXPlepuYzw5gRmUm7R+/VbTXazZLMCqgyQ9+ZLgwR16Ag2xB+u?=
 =?us-ascii?Q?70UDfBDUDDgNQWyC/2E/+dEx8vEtHTan5MQKm2m2Hcxme6UjnrDIj8RnKuoi?=
 =?us-ascii?Q?tvWh6ZKXLSpiAx7lG7iKS0o1hEAwTHWvvaopIs0mujfNlJFm61ISdSilGPiV?=
 =?us-ascii?Q?KuXfOTmQdnSgr/f3VU/oGSypXpNGy5EhfxpCCLC0kaz8URQfLjoBPq8QZVa3?=
 =?us-ascii?Q?Pe/EAL2WVJfRceG1U5OfAuxWL2o1++NHk/ZWJQeNSBzROJ662adSfuQJYLs+?=
 =?us-ascii?Q?N5Bc/a2fqojsvR6TjNjNOHaRQ88tq9QH1Izjs/u8rnl0Of+oWMFy5KlcqIG/?=
 =?us-ascii?Q?oyvBHgFyaZEhurGQjNq2hkotDVgUpCTth6dpcZNg6bdMeHvOchAIFcBzeCyW?=
 =?us-ascii?Q?DmXRHtByGFKY8Y8j2LfCnW29tRnl95qSRZH2D6q87JPuR9gAb5cNyfEUh1OG?=
 =?us-ascii?Q?D9/jXyNQrFoKlatTSAVrB9Ko1Gp35dCjjdK57ILig64jxb8GPlA1H+jMdKBk?=
 =?us-ascii?Q?IOES/KuAuFdTcOycQaVI+UX3SZF5sO7wNcjpyGZ2BWp1LBFLDF3L0JCd1MiB?=
 =?us-ascii?Q?L1BWD7Ef/v8cE3XiytffC0kEGj+SrKB2UcJWP457s+6HWmXaolRfzsQ/Zqub?=
 =?us-ascii?Q?vIxDognpUD1TLXSVLnzlAf+EbrcHdq1GcybKK+mTtPOyfRCx6geT094/eBDX?=
 =?us-ascii?Q?WNJo5KlqkA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69813c92-c487-4d9e-ac91-08de69599154
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:37:34.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E2bKJAe1HFzwGd6WkYf30TxLQxcbt1IpGctYPtt/cPF01c0PaOdCr6Z8i9SHt52MPgyEmzHqapyU8h2cJfmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33280-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08C0D1237C8
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:39:43AM +0000, Thinh Nguyen wrote:
> On Fri, Feb 06, 2026, Xu Yang wrote:
> > diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> > index df86e14cb706..d4ea635c92fb 100644
> > --- a/drivers/usb/dwc3/glue.h
> > +++ b/drivers/usb/dwc3/glue.h
> > @@ -12,9 +12,12 @@
> >  /**
> >   * dwc3_properties: DWC3 core properties
> >   * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
> > + * @core_may_lose_power: indicate the controller may not remain power during
> > + *			 system pm
> >   */
> >  struct dwc3_properties {
> >  	u32 gsbuscfg0_reqinfo;
> > +	bool core_may_lose_power;
> 
> Can we keep the type and naming here the same needs_full_reinit. I'm
> planning to consolidate all the properties under the same struct
> definition in the future refactor.

Sure, will do.

Thanks,
Xu Yang

