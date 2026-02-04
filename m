Return-Path: <linux-usb+bounces-33080-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECkDN/flgmnNeQMAu9opvQ
	(envelope-from <linux-usb+bounces-33080-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:23:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982CE24AF
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1777302659B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 06:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735E237F109;
	Wed,  4 Feb 2026 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B9rmJanW"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD357352941;
	Wed,  4 Feb 2026 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186219; cv=fail; b=cAlrIn0I3z1Hl2OQhGovjmBGLGlw/TBZfD6gX1WowMoP4VgAb3K3YB5JDVdd1Mf60PbgQTxFGGfHr2wxTDazAMNy9Baw9sb8I+fWDlGuQ9wTNmw2VpsGuQV7+vacjXb9YSLF0wf6gRcmhHMl1s+y4NL3O2f/2feEcmW8FcyAy+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186219; c=relaxed/simple;
	bh=VZT6mpa9QNA52keI8UwGEoFVWRen3uB3ntj5K7geqpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gay+sHdihhoJibhyBe7hc9VKkK+2lSMVk75FGcpmAtqZg9wZrjEj92niWSAgursZHqQsWjIflk+wV7z5R2cZl0z8piD//7Lqhhph+rJ9EYkAqtWvV5EhB1j+m+f1we7Xi/RqmWkFWu22MIl1e8I+CU87Oa0PJmgxy9EkJY6wq6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B9rmJanW; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KanorbmS1CmtdfSGsAg2BgyZVcXDlcAbzuehiQ1dVrLH/4sT7TeMF0wiFW9xPbyuWK5qPKg45sTCHcYHQXpMppfV2nuxzipT6TrjkbeFE/8lQXiuam7q5aSO+obhPkbP3+32/xCZJ+/rJ2pAxMQwUKdmZmycCXN4qVAXK32Rs83r7S3woxnXmF1Ar+HfQqMyxWNntLdNFmdkoli3GLNV/XpZhFArrccOnX5Tfi0JZNE1xMwRLzNAkBNeqHkQc+6ZbPomBne7plbxyRwuX40z3n+16wBOfNYL351yXBZ0gHYEK653KC6e49qVUn6N0BqWR0n6Kq435zI5BTgWmHFtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDAiN+ggTMIdK9eBNqFv0qW8MtG7WrZwdp14ux91t7U=;
 b=BAMjG5WP/rlK48dAK1Mg2fj2OOLSzPY1gJFniOOdVfxq15H/lcm1JtSrH8ZUjKsbakfVdCG6BdN4qKDEn9jZpYr/scTkMOeNxmmoc74kP86l1FeKgL318pDpsQFTkS9hyqdGpIhq7W0NXuinaRCUVd5YfqhFbs47FJpYdjPC07Na2gRyP9J0hjiqkdmsBhub0eer17X/B2wxux1jdPvT3e5Q4LWloexUFI8TRTwZFiykA2jqnCk+seHwMXCw1kB7Oy/EFk9QrTmfqw3rhHI/lgKKXrtC5xj1OSqz8vdmCWF15YtP+xZXsy50pdElaJtuCmuOQLNO9reR1Y4TXphcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDAiN+ggTMIdK9eBNqFv0qW8MtG7WrZwdp14ux91t7U=;
 b=B9rmJanWbssJ4C99o5vP6QZjYhxxuf5AKh3ggwXFyAPP1Ai9ACd3li44ZZ+X0xeN6AER2y1KC/XGgA252h7t1g/RShir84W+g37DcRRZZZryVu9UZjrK2gzrk9hMm3iYA69Rm5oLuZZi1xHiKy8aG0v1sbDuwnX2wC9U5TPl8RvnkBejZm7Ge0sSzWZ7iMlxQmxNS5/4sP8ziddMbSDVGxRIUJI7E2AGAZ8RDoUR5pVSGcHMbxlZ5YpxIsHZtP7X9uH3TL4FqFMo5DESTpT/mgUSqEa9KJEHkG3Ws+kkRYygW1xculj2E3N6FKb5GJO4FmdOxyRS7NCcUovu3bX4+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB9076.eurprd04.prod.outlook.com (2603:10a6:102:22a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:23:34 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 06:23:34 +0000
Date: Wed, 4 Feb 2026 14:16:04 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Message-ID: <lhsqrr5dksq74zxjmkxrjjqtl4wvyvqdg65f77xxiabzxykzow@f3qz5kzwowm5>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
 <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b12359d-69be-46a6-1721-08de63b5ec42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VtoZ5hKXMxJ9tszT6VVnz2whXWdWNs13INYeDBGw2VzXVijHmlR5dX2T+8+i?=
 =?us-ascii?Q?kvefMpNaXG8wXSyKS3/jV9t3eNzzSTz+4ba98kE9As8gtC6vR2OoTCkVWusc?=
 =?us-ascii?Q?EfZEFqxKoqgzrkKTnAwRLd12Tkiq5LW3II6l8fYe35HQEZhV0XCQOzh6A1QM?=
 =?us-ascii?Q?qpz++HQcbJyP0qmooIRcxKXAWoCUUQRBXGYC2ePoInU1TeNvMw2wRhzC1WGI?=
 =?us-ascii?Q?sJNfoxTYBj+dSVrpqd7fZ6bOsKK7Z2LCLMTj/eUqnAJabBX652y7ECqtXFPe?=
 =?us-ascii?Q?n3jcUwV3MRZTY9Vi0pPw3uNZlAJp/VM5iOWK2O9vW/kLd9JNkelBwbtwNeiD?=
 =?us-ascii?Q?fssoNrI6fjFr3XcjhK3nfciaxCzXr4sPmcpnqanqs/rTxE3fC+GIS2eBkdZC?=
 =?us-ascii?Q?aHQvc97k+GSQoTiZLtz7LDmCV6f94nIugR5COivXKOxAXmVuxBGmahR2WaTF?=
 =?us-ascii?Q?cjDF/bHiW9NC5s27NN1zxQgWQjsPi8/jjuEv20fz8yisiRg8MB1bjVH4DS+7?=
 =?us-ascii?Q?DSOoHkQC8XlbH5A/Pm2wDAJ/HFe0PCdjK0+J+jn/B9QbZhqzG/7LI3S4tYo8?=
 =?us-ascii?Q?mvc0Nfl51rmnSo7UXMkOK7DXqlp83qzKSDYLL5KiaAqdmbjRnEMNBKAVHcII?=
 =?us-ascii?Q?NsyoU5vDhV7EaYZ6b5zne2vV4g61zSD9XM6ibtjsQlmJNghuSwhqsTikDIQO?=
 =?us-ascii?Q?md6Ttj92yOyQM6hIo8tMfqpWr4kNiRLnroVvEaveUeAFoK29sHLBI4BnpHLY?=
 =?us-ascii?Q?xvQ6QmcgIUXdfAon8n/8CHsfsD/s4pi7I7bxN585BDMvg9pIXdtBTkwNnL0i?=
 =?us-ascii?Q?jSJtE10unhFpgr6at2y1c0GY3mtM6rUzyFfx+YwbtPmWF3gDMCilPWMi4Udb?=
 =?us-ascii?Q?Nzf/V5g7zKBhNvvBxTiTVNmKAnf+ti47yzdMcKypeXFUpflOQ7XVZ8p5Swya?=
 =?us-ascii?Q?UJALbgEH2ivUQSaPHFeWc+UJ/KowrKhOuYIAIrbg6wko6/jPGIaLALy3MsCj?=
 =?us-ascii?Q?FYuzc1UxVcNs263+JWToEwi8t3w1grkbRb+37GrSuHZhkNmIk9L3QPxBBKxO?=
 =?us-ascii?Q?uFjzgNvjoF9EAHSE6OPtUmfJc5IfFk371z5mN7NL1OZHazwRESWHsMY7KZH3?=
 =?us-ascii?Q?QyzdHybLYvVvwgfrPyigSzkXFKRAvmHJr91mgzQ05IhxgEexAvxIDg3kJ6yq?=
 =?us-ascii?Q?ji78B0dqj0gVrIpckAZbRBDTwI+zxAZKnR3zSrk2zfJv+lR2/o/0udQTEx7Z?=
 =?us-ascii?Q?d/HFu5Lw3MU6gDpZTaNtC7K9FLHLPo6ZbjWSmP2YdpXZP9NPFVwMjil+brLj?=
 =?us-ascii?Q?/h0cwjn1h13wmE+qq8Zfbr6NzRiZ8ss8yl47Tg0Y2mpplupzFdepZKButkBM?=
 =?us-ascii?Q?JTSJd2okMRtzqiDnGvcpeUh8o1ve0KLljFVEYQG6hyo9QsBSYslQgHA5r9iP?=
 =?us-ascii?Q?LMAwffoG4C7JwPkXOAcViGvQ2SPI7wFv5ekYK9uekR6UNuFLvPquiCULvh2m?=
 =?us-ascii?Q?EkDDYgyer7UUWt6b73hGvaiLz5H1aFjKpezQ27bYa/uxuv+LGtgNrPHyr6fF?=
 =?us-ascii?Q?V8TjpZY2hBPyBONA6f0DOSNou82G/3izVLIc86izgMqO21rvkc7XB8nGEPca?=
 =?us-ascii?Q?1kxFPVaiBzUOQxN29Bzol7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?goxlaZM7O/csb9vHXxqYR/SsC4lKFGBQWevH9QrPgHwsWGB/dAhOGv9FsL2t?=
 =?us-ascii?Q?HLQvu5yoqWBFTKlqv2RhuRbjsupY67N5SmpuET/rPjc5M2DAstRGZkkgaNB0?=
 =?us-ascii?Q?DwIqQTSAz4jlLoiuhg8nRJc3LJUMPJUXlrXfPuEsPAKDLMHon1bXZ7IqRp6+?=
 =?us-ascii?Q?O4VLuZsaVmkySBHLcBzHRaWNyLcNA9XoDJ8BfgLCy8OdzrMK4cbByB8Pz8G/?=
 =?us-ascii?Q?npvTw5rzFL3iJrwPo05+EY4v2K4RJvgjUbxF56EFdw7442T9torRhQyWQNNj?=
 =?us-ascii?Q?+3mw3zhpQ2dRxM5Rw/R2cEEIQZ0brwWax2IMjnAGafE2iDa5bnfw9F0r+bDJ?=
 =?us-ascii?Q?VASE9VB0AxnZpI3/OaC+Th+Bvdzi7+lTUxOKR1zM4hvlZLaA0wCpLMzUFY9f?=
 =?us-ascii?Q?DTD40LFGlacFlVhuhu2hQwzfmD+DqY+Y41bBfN+Gx0GoiHz3E01tggQA5dtc?=
 =?us-ascii?Q?ppDHbxQgvzFnAg7VsvfB8cn5s5nebIk9W1wV9916otggRcpmJ48JYI7tp/p0?=
 =?us-ascii?Q?Zu1gJwymTigvYfBaSQoZ9zTHL1HLAcnz5ZPV357a/NEMlSFyYOVuLcTxjaSI?=
 =?us-ascii?Q?ZzWY0DlmUw/ncoYOd83Ltq11jdzzQsW059AKK1/xyR5LNaiqXQOQKBQcT83h?=
 =?us-ascii?Q?zJoMclG0c/jXjq5Qck/Bah6G2E0+DMujLj7psNXMiKu8l0lpoPILWeScgeY8?=
 =?us-ascii?Q?hWawcbIbG7dAQUTT2VnJyd/2AhSE4xkGkV3/YSpxkWZkYMIi1aHwtviQJO8X?=
 =?us-ascii?Q?EQWpE0jRdxhrw/7IWsMCf3nvplraQ67oXerE6EIeqEYXsliploRbMTjsFt08?=
 =?us-ascii?Q?Q1Fg9tTlQiMLyfJa3Rvkm4SNW+guyisyVbBSz4lN0RDn5wR6qo7ht8i24hP1?=
 =?us-ascii?Q?fWBzRTcygYniLDx2wIsanCdpF1giVCvZNbOq8W5cNOP5SJUUGykLEwRxXZW8?=
 =?us-ascii?Q?lcWo/OFLDO5GF7HF/aUNbyx0SSM8DONzo/fjtjgtZyAZXZ9S75LKe0+EkgJi?=
 =?us-ascii?Q?Bpa3ze/E8GQwyxAYiJBNnzTJi4kHff40zCc9Hz5iA7CF3TAhGOWqQ9uRxoPx?=
 =?us-ascii?Q?CNPqdrj5JyRy3pjdb+43DpD5/j8j+qAgBukAMayLF71yT/yrdKJkJ9ch2INP?=
 =?us-ascii?Q?BFpCzMLXr66AQ7lE/gqZu2A/IsTLCiq7Pf6sMKVcojdeva0IRyos5loSFpsG?=
 =?us-ascii?Q?ec66PtUtnpX+nZ/VOzILTsy//9GngaFUfqtOvL+KQ/+OY+YU2DInxkaABbbm?=
 =?us-ascii?Q?Ct9mDyBGx3A6669frgRDYTNrWJ9ind1mwH2rIyEqWmna8CTCXT1g3Xpao8hm?=
 =?us-ascii?Q?uJvCTU/brRCAWXnoU64H+3Zehapm2trSdR8oYPDrK4mg3+VQNy7xYWRXxytO?=
 =?us-ascii?Q?aUOBPCVLCUn6J6GXyl0HlTUVptbBKbyhNvtMvmV0wFp+dQrPFBen4ZKxMxzI?=
 =?us-ascii?Q?ilYybMMwsAgNAXcUIpk9uHIVMiS3atehGqy2DH3surgpQQidFkNRtUEyv97O?=
 =?us-ascii?Q?X/G78+XZ3PWF2uU+nQDeLr5Xv4qSY3A/9tnZRYAz3KN1g2Gmib3ZaBVvr3zM?=
 =?us-ascii?Q?YKoCWbZGj6hBKTd9oIGI5Ln8DSyx/7dLMSlJJ27iwba1CTK9Xzchd2ArilUF?=
 =?us-ascii?Q?cChr5ZpTqBK8A650vhETMejc2vUoe28Tzix23P85mq9tlgtx8esPp7cKZiZa?=
 =?us-ascii?Q?1YXx3gPyQ4XpcvhwlvO5pJIrlpSwrQDhnHY393bddscl68CcW2OFvmeQZXJp?=
 =?us-ascii?Q?5W+Cnu8bYg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b12359d-69be-46a6-1721-08de63b5ec42
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:23:34.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHS7QIm/MFtk1Ub38EqImB1O5xvWsuURJmvBdm66NhTXGDcpSoG0AjpqXWbOOTv46O6eEZbGuFCE2910SZngsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33080-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 3982CE24AF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:42:33AM -0500, Frank Li wrote:
> On Mon, Feb 02, 2026 at 06:27:47PM +0800, Xu Yang wrote:
> > +
> > +static const struct property_entry dwc3_imx_properties[] = {
> > +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> > +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> > +	{},
> > +};
> > +
> > +static const struct software_node dwc3_imx_swnode = {
> > +	.properties = dwc3_imx_properties,
> > +};
> 
> I met similar case for layerscape dwc. because already use flatten,
> directly use probe_data pass these information to core library.

"xhci-missing-cas-quirk" and "xhci-skip-phy-init-quirk" are used by xhci
driver instead of dwc3 core driver. So they are needed here.

Thanks,
Xu Yang

