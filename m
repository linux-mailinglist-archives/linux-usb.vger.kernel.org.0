Return-Path: <linux-usb+bounces-31307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3DCAF065
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C9D3089E65
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D83F30F922;
	Tue,  9 Dec 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VuX7Suxz"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255D31ED97;
	Tue,  9 Dec 2025 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261675; cv=fail; b=YpzLN1lkAcmTzCm7dbu73dhN1F4nGnJ6jhnXXUzYG/vttkOZI88klbvze6TXHFlpI0dY20CRqROeSQEOc3Bvv6IxnyVDzAULjYk/iGkHDoSuoMxAg3a8hUzwK5klR6uK0ed9ZLZqEhJkCzsaSl+qceN7WUXOjHUOok0kLX1n/48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261675; c=relaxed/simple;
	bh=CXulcPBFAbGQqBEwhCcZX9aRQJIJFU+Q5MYiD0MOQSc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X8JLbY04jKKg4VeJG4KLJphRpXoc3MYlEzUBApzXhI05sFFAEHlRfPQI5RL4Cmcj0QchRQ46hz9lYXOXbfCZTFKbygouhmwqjL40bVhrQyj+zW3Meg18zynqI+DDlhcHEqY3pYP5Xe1Zz6tIF8TTUC1LGnvdMO51fUdPHZ7aLaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VuX7Suxz; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4lrp9dvvZC14/kxRwbglyedsXM+SzkJOvzrwMtE6VDFm7tHZvWLqRo7EJZ7epA09a3i+sXKiAtivWUgPZFx74ZXY1JZDJfDN2k+/mch5R8UkGXhNZi1Kr3Xe1ZnYwGcDeb4oW1iA0TqyMPOD5EyQMaUVzecB+nwM89yJA44SV4P+kPqsu25CKTsLeF+NRe8WSP8YMZWZT2Ok8dlwDO1X4LzsGx0gHgjkK/4iyFMWrfnG+hJNpCd7MlqR96XdOWK0wQmDuEnykRLY6UzFB4EtIZyKrMSu4nf7RF0CLNLNQH7b66w54C180f7zV71tVh7Rzt33uZXjMEHkZWIiO6/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNejdvlKM156/lnzVmXlxm/XdZo7HV+wddLfL1ZpLPU=;
 b=qufTOri0HoJTE/zO5qwVQ5Px7LZ8WCzCtaNspojjqHc2oeO9NQ2cpyqdhnvtA09YmuNEGUMWAUgjm0Tn2fQApOQuIr0X+ylbQzbS+bvi1wBSt9eTR/YTv2qjcU2R1LVApcYptjw3HakHZekj4lyqt5utWt3bpAqousidbSABuM9W+5QD9tSrGPjDeto01cj2UeUMUhupMf6ZFa7wopimF5x0VyevCM72wkXsvlP1Ee5vYv2i0bQuSnGjBlC4e8Wvxe4DWu2f8JRx9LJ1H/UM/cHnfG+t3mRaiWH1RyTs+kMcaB2ZiAWcNvD67RuJdtzQFsI+k5dLOfM1swpTb+3ZXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNejdvlKM156/lnzVmXlxm/XdZo7HV+wddLfL1ZpLPU=;
 b=VuX7Suxzy34M0rcJeEvtIS4H266vOjI9agiKbc5ybzlrpovVzNZj2XcRWE4EkmxwP70Ab6DrO44KEwnJQJMOZKRLb2eHCYTsj1Xj1Ueda36mgFgW99nVca1UyR+LC7DcmvJkHXn1Hu14QTiq2opJ2vEcNfYlCId6BLL4YX0O4yWf+ETN+ERZyPlI6iL5YkTiDuYX1j+baRygapEsH/XDSPfFSHOdZ7RsLLmEMv6y+WBTdRaZeTAW7yCnJtHdc7SK5X4sF8L3Vw2HQp6o8zwTT9j2+GQfgBxoEoAYFwsOjadZa8rbCTNgVB+a5zrBobhUXPf6I79O7/9K/jURdofd5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:27:50 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:27:50 +0000
From: adrianhoyin.ng@altera.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 0/4] Add Altera Agilex5 DWC3 support
Date: Tue,  9 Dec 2025 14:25:07 +0800
Message-ID: <cover.1765249127.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0008.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e7f620-3bd6-4787-1002-08de36ec136f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RgjEbArYmNam1lxZe5LbLVRyZcIreMIXS2jj5he/ahKo67Dq5xmMC/eUnWV7?=
 =?us-ascii?Q?srj1r1NLOo4zZLGiKRn3HNlh0oAkogAs5KrDO9xeAK3z/IW01AsiQ4X4KOUI?=
 =?us-ascii?Q?ckkzlK4kHe9iEQD60aMS8C6aS7BlKJj4kc28hOGblbVp0wND27mMJ8cFFLVw?=
 =?us-ascii?Q?65dQjVdch9XJ+yfiQAmvjGGMNbVwkK+cqUG04kDHY9O+i5wKpSIpwC2jgCYQ?=
 =?us-ascii?Q?FMB3XUX08PcgrCzKMIq00Vcb6JwCJDi64zdG+1eBoaCMw0P8RUYZwwT/WQuQ?=
 =?us-ascii?Q?sVAme7AmzoUpTiBhPLO4Pqv/C/YJF6rDoYnVptU+Aw8SJU0U9GsxAZspd7ha?=
 =?us-ascii?Q?TSs11fdpckkGn3eoff7wBPs1yHK2m4HDFlJBYWXGQSGC8KQyF5y7QnIu1bbh?=
 =?us-ascii?Q?12K5QYBZZyJ5IrTeP6xOemNQ95uZd7Eofal+vy/yrLn6ENtiz3B4ARpGaCbP?=
 =?us-ascii?Q?Z7HjWKTF46dmalgYV4a83mnabbpGpqRnSlYQNM0X7UTgY6g9rewu6YCQPNII?=
 =?us-ascii?Q?HQrdXpfdfZ6bhZxGZLfvFGOt6cPqQXdQNchhu9z5AIbbrjO6wsSKKYUlW5Lz?=
 =?us-ascii?Q?KLT7ncozU7EI4KVDD4Z0tMzhCOpCFwbbvYtXPh4N1jg3FK4MmnsOqe9XQS7V?=
 =?us-ascii?Q?hOCCshzX6W/SM+g1Wc+esi0f/8kVgp3L1Y8wg9G25g59/SSrJ+0vBiG8tboS?=
 =?us-ascii?Q?pw2vxM+WaSTNcbwcSwZdqEqeTx0nCgQxJwD0dqal+dkzE7a4BnQX9OknLB5S?=
 =?us-ascii?Q?uW0inVNTnsyAL3BNc5KwpNLuXyea2HjxP9YPfTvxGSosQERG7W4g5FPJE1vK?=
 =?us-ascii?Q?DGsXD90IiQZzVwxve0q7P6Nlasn8NsKsdpzBp3HZ0DZUh0g5ldhrv60rFDFB?=
 =?us-ascii?Q?xE0EBxtA1EC7D8AXqHgZ39XblqjM+fDd14Px27jbL0yfy8vTnmmm+995PmDc?=
 =?us-ascii?Q?lZLpBbTp/OkskzUQe4CvqPyZAX3EwGCzoAfP3E7v5c22a3k10IXY/1/uZNaR?=
 =?us-ascii?Q?Sc9dwFPdTGHzxZZrkWamXaTKMJHhFu8gcA1JrCePr8cPaYFSZPYfuM/3/Hls?=
 =?us-ascii?Q?r8n0VJBcW20C50ZHcHa1yhYVVXQ9ZLOm1WDuAF3KZo16//s+Gly5H2ZvndU8?=
 =?us-ascii?Q?prlYKfs2a7GqP2AsbLiycuNbBONa68n14x2mbHEzzMd0UawBu/xZIppbzp3b?=
 =?us-ascii?Q?mu9YB6URADD3pcGiHsKiEuy5+LreqrSQtfOkAGufRfkvDW+LiLVFzc2MNExR?=
 =?us-ascii?Q?FqvX+fbqlfwPHEwNWEIzlqR/nJTsKJj/YxStUJxDwLLAGlD54kat77Gro1t6?=
 =?us-ascii?Q?8T25nfvl9wO80t7/94II4WwfPvfxn/EtjjJfPiIiEM/bRendMa3BKyjsY5xK?=
 =?us-ascii?Q?3c2IImXOUPLc4grc2tz+hLwCoc9NvgfmsfSOXGLE1vaDl6M0AaFj9JawGjFe?=
 =?us-ascii?Q?Vd7x/69yoPc77FniHTBvctr8KwGadAn3FTkWaVc0qpJoY522K7PeaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pa48VaPUQseXGSgxE6zKj0G15gwsdG2VSPpTeH2gClkiYIbhBuevQfohR0id?=
 =?us-ascii?Q?f5FArzbmjN++KYxx3jJZKV1PlqvUrSZRvP+4+MX5CcFRCkdUwLZTDIYhH5od?=
 =?us-ascii?Q?6BNPV1Oz4gJPMQnCtlIrjSpPo026TRugxjAt9bVScL/UEAjji9tFW45elnDL?=
 =?us-ascii?Q?eM25IywtHCrxkKqeJOXe4FcJQTUMA6UZDLb8TumvOW1goKFOorZ8M1i1Ubny?=
 =?us-ascii?Q?FbF1DjyMv4cjQME/07ozuxf+tKZtelLiJncn1qZELvkU19qt6SYVohcEo8GR?=
 =?us-ascii?Q?Kcdxak7mZZNZVT1qBM5LY/gWZDTmKeUOYbydscvGJLZgy9fLutD1Xem7PRtW?=
 =?us-ascii?Q?dylVNjkGkLPP4g3/MiejSIACtDkjo9/avGK8/Ng5aqhft5YSNOZvFeHGyyAQ?=
 =?us-ascii?Q?Qpk02fAFAS0Qz/fPCDCqaVw9muMi/MTbL+1zGEc6u5RDwCJJA0wwM1HyJfzx?=
 =?us-ascii?Q?QM66jL9+lxI8wYcAaPJ/L44ExB2HWwQtyhkitTAM816M8bcaWwt8fG3QC+NL?=
 =?us-ascii?Q?GrUZi6Wh0FBu0x7+94WTetLH//SP0EpHrwY8ekUE4otfCro+IfpxZ1+zEhwK?=
 =?us-ascii?Q?jp+1F/iDYbu0FTmOFhCOnwO7+ZOH3QirIOlIIH5lRKDCsBNamj20MN2p7WCu?=
 =?us-ascii?Q?x6pSE6ETDY1Yn0YmUl8Aaoku4QpHUTqVpz9BnwmbHSGeCo/9yNZyAWB3buXU?=
 =?us-ascii?Q?n3p0Ezr2Z4J/TVSaxPCvVP4wms8qaJOEr1fJVqaBRIlqvWJOXLQp2Yv33uIW?=
 =?us-ascii?Q?DP/82q9h1VlJWcSN5etbejDJD1bU7sApgpPmyI7lak6TS4XGCLaERj7est95?=
 =?us-ascii?Q?3FOordMtdetU7LbbPbTJQCG4a3jZGq//zmaNsaZBhos6utDmgku0+LgMGEmA?=
 =?us-ascii?Q?yzkXco21TBanBlvXYRZASBgiQDFUrBq8Oh7hIrZxjrce6ZGpLICDghl/2Rjb?=
 =?us-ascii?Q?uUePQ45/ggFapIP60eMNM6fEDsrktjcbbgak4WdUi+Qav1SRWNGCMjAa8160?=
 =?us-ascii?Q?ijFe7CaOGeiYi2dioKpSFNKd6Rc6kSC/VNQFb0bqddBPFMbi4ta0NCzZxAnW?=
 =?us-ascii?Q?a9hD33DfaWGcaHobjHm5fGF1wDxQHhyKePb+f4ntT1d6qJXGP2F+xLuns1wS?=
 =?us-ascii?Q?KNmYER7e3l1Zadv31jzdlqH4Ntb0WDWBDO3pqCA9qJcF2SF1q2AKK5dbesr0?=
 =?us-ascii?Q?LtWsl07A/OCAD1URaMPYrAlPdBR9hvby7EsVU14JRNdH0ajtUwoWIo65Etyl?=
 =?us-ascii?Q?9UxAOzexp4YDV+OCD5J8xfHoQpqpa457t39uacCOzxmCjfCLL2oVdvMpAay8?=
 =?us-ascii?Q?5IfoXyzI6Rj0y0MUFZ9eMI95d6EIySEj3zOW1RBsvp4c1xgM/LHveneWobQb?=
 =?us-ascii?Q?BcKRFI0yhLrFR/28yoCdQow++xlpnwZQKBbt2SHbDht3Q6COMOtqmnihWWiV?=
 =?us-ascii?Q?R15BaxJSaDrBpbuaNmsyTVps3vYrbYjjvwpvpxKKvSkmllJqurhCQ0ci77KI?=
 =?us-ascii?Q?bFynlK0dJv6vc2pxKvXFLMF75IlauOFPKmFMqzGXQwRtc8eeS2aTGlCSVFXt?=
 =?us-ascii?Q?1R501KZQsVkSyyoKECh92N9RXtBO1CMMdyZTDib2S3lwCG9hZUs974+7oxXi?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e7f620-3bd6-4787-1002-08de36ec136f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 06:27:50.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cetudI5QH03vVre4lcL46tqPMYg9hjm3D5Yy5to+P5J3l9gURQNLMylFx9Ys7LyPWMH3nfrnk7cv3L5krCSpswlL+26G1JzxuG3LFN2GpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex5 integrates a Synopsys DesignWare USB3 controller via a
SoC-specific wrapper that requires dedicated clock, reset, PHY, and
optional SMMU integration. In addition, the Agilex5 has a 40-bit DMA 
address bus limitation. When SMMU is enabled, using the default 64-bit
DMA mask can result in address truncation and subsequent translation
faults. This series addresses that limitation by allowing the glue
driver to constrain the DMA mask appropriately.

This series adds a device tree binding for the Agilex5 DWC3 wrapper and
introduces the corresponding USB3.1 controller node in the Agilex5 SoC
and SoCDK device trees. As the SoCDK only exposes the USB3.1 interface,
the unused USB0 node is removed. The series also extends the dwc3
generic platform driver with Agilex5-specific configuration support,
including limiting the DMA addressable width to 40 bits to avoid DMA
faults when SMMU is enabled.

---
changelog:
v1->v2:
* Update new binding name to match compatible.
* Update binding to use single node instead of parent child node structure.
* Update binding according to comments from maintainer.
* Split USB3 and USB2 changes in dts into separate commits.
* Update to use flattened model and use dwc3-generic-plat driver instead of
  dwc3-of-simple driver.
* Add dma_addressable_bits as a dwc3 property which is set by the glue driver
  which is used to configure the dma mask in the core driver.

v1 patch link:
https://lore.kernel.org/all/cover.1762839776.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (4):
  dt-bindings: usb: dwc3: Add support for Altera Agilex5 DWC3
  arm64: dts: intel: agilex5: Add USB3.1 support for Agilex5 SoCDK
  arm64: dts: intel: agilex5: Remove usb0 in Agilex5 SoCDK
  usb: dwc3: Add support for Agilex5 in dwc3-generic-platform driver

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 96 +++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 18 ++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  4 +-
 drivers/usb/dwc3/core.c                       |  6 +-
 drivers/usb/dwc3/core.h                       |  5 +
 drivers/usb/dwc3/dwc3-generic-plat.c          | 20 +++-
 6 files changed, 145 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

-- 
2.49.GIT


