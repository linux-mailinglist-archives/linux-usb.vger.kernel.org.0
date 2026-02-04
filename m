Return-Path: <linux-usb+bounces-33075-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPT6AuDdgmlJdgMAu9opvQ
	(envelope-from <linux-usb+bounces-33075-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:49:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB0E218A
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 522FC305A424
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 05:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE8334DB41;
	Wed,  4 Feb 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fYStkBFH"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C964199E89;
	Wed,  4 Feb 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184151; cv=fail; b=GAkC0R/EyABsDp6aduvK8XFi/C33f4c88ewdTsCI6GPj78Cl0e+U/BIyMFOA//nqftxdrgYE73SiymM36sZI0BWR5uVOU0EFVvXfCXsuAJyfuxB0Px8mX/T7rRZUb/7+c8VA3xmVLCizYkZO9S2ksRezRQUlflB5KoX6cJ2BcGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184151; c=relaxed/simple;
	bh=2Dp1vsWI1knEemAqTEogZQv93Lq1EveCDKR2SZjWKfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UrM0aYnpgaSSSQYKqd29jWAhuQkDdB10X7Pqgd46nTCWh/x0Cl/ZusZlq1yKamvCYyTVwDsvy9nMCCXRYoPmd7bOJnfuMrSb+is+rtg1snfOLvruYwcYl+TUydNAWSN58KVjOw2qhFjI5ZVYbrmwxcf2+yDO9R4eIdJ+nkW+wWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fYStkBFH; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW/L06lvq3vrmw2UWL7QU4j1SfW23Ma87/Ai4LegHUJS1aMslWkHe6fVBwCk9bvcL5o0N+U7RrkiyACK3GfYuX0iwS2/YLCxAQxJdo8dUNrJ1Vmc4sD5iemFBUbGgQlebQEcPtU/4A9Jr0Jg0zDxnaZu/Xn25ACjt33Qnr+FOUrAJL8LupZ5HCR2ZLTYE9NGP5INZNN4xJFBk+kwxqgrlDcMAWDe5MHLxeQUTrYfHZdScGjPob2OiiytCTOMQXvvRbnvM1jKfuCGrrBXQStZLh9QAFeG+oq9es5FhLpm6t/iXJ/O2W6+bCNpswSlDHkb3QBgRX+U1UL8LeOVDU3/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1sRlis1yGfciBDTHTJhNqCegYVMDDHQhk2yPHlZxcc=;
 b=qvCQzyIObEPgibFKiRBgPsn//qE67+JBDOb3lVZLPXg/+XW4bsjh6Hop+kOcVUnnUop72GzKaNnMFfX8GgCLT2x6C04pFIrLwbOZAW0vA0CaLv7g5Nv3wde4OcukZz3NS8O/NJwMmRkRQRW80iMcba/87sKY0Uhbsr2F42O9kJ9/xGeYRZJRBA+S1s0mDFY46S7s2GN7GX85ily5U3ngoCB1RZEdCkhg+QDFCOfSrb14dNUYPECw/Myx2MOBOBq4UkT+sQHM1SjGuU4b1ObrZftqEVH9HgR1qB4Lzs5q/g1K8GXtfQ88z4CH38Bpdc3h4D6IWlKCSvH5hfq2PS0qpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1sRlis1yGfciBDTHTJhNqCegYVMDDHQhk2yPHlZxcc=;
 b=fYStkBFHtHPgQdMzEc8wf2X1gI8q6PfpvXDxJJxeJwdu4IuFuW9kiiQ7FvVf25iDvwsm2TfDrfYzLmMvPfhzGzu/sdQNy9OacSHR0VxwLHy9c8MWUhYMcRecdFVhSukUjxghAFrgC2EGoys6gewcmrkdk60IKc/vx8774jdz/YIe2sZOqpupsfWYN4eVIiHEGguq2e/2XeU4CJ/E1H3raM3w9Whrmgar+uDNeMcvOwlyg/FQaOh2kalEsLlAO4lPjN1GbQ55RhPz+JOul+Rn+g2GGqT2wYj+QRA0II55o2kB0J1Eq63WoN5IwXQhzSXqpp2dWvEE0buWqcZpStQFTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU4PR04MB11316.eurprd04.prod.outlook.com (2603:10a6:10:5d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 05:49:08 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 05:49:02 +0000
Date: Wed, 4 Feb 2026 13:41:32 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Message-ID: <d6blnkoztgh5xq7jumiebuassqpkavdbt57cscp6lhjmu7zcdl@rrlmhv73xwf7>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
 <2820312.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2820312.mvXUDI8C0e@steina-w>
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU4PR04MB11316:EE_
X-MS-Office365-Filtering-Correlation-Id: 7746b98d-bc6e-4c4b-6dd8-08de63b11969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HvEdPenz7ve9fMI5U1GrHGQBJuL/FjKiQEQNhBAcHaBU2aSrQ5mu1eHZEfz0?=
 =?us-ascii?Q?5iT0ygBznnqF0plhmvPZsDTr6rEWqaLb2NhmpEJEfaAZdlAEZtEQftnKmFj9?=
 =?us-ascii?Q?2Z44lqdiVyxYris6uuIlM6pXaZrmGyiVi4Fhmr32csdt6kJ+YWJC0qmR4lgF?=
 =?us-ascii?Q?Vf0A59H3CeBMxMr7UdqsunC0kYgdqPwCzAUoMQZtydObAtmoBM0khhUR818b?=
 =?us-ascii?Q?FBVPcTEsoVdDnIs3mubCLKymegWiKgmVkln+78b+Dx63XvJYX1zlC2kgRzXD?=
 =?us-ascii?Q?CO8+A0UflOZo3DtY3ruLMhml2iqAtEG9jnqh1giOjocwUxeCDGZ8Flj6Jh/u?=
 =?us-ascii?Q?nvDeLYMKeTl8xv3QMZaLE42NZyk9bbhdOiWxyIvjRieaC1qmtc4N/q4RtOrm?=
 =?us-ascii?Q?oK+bFe/s0ni7J+vGG7QQVkxxCHP/5h4sPrxVlYVWVNgZxj8nyswRvUkS9XyV?=
 =?us-ascii?Q?Kxx4RPqEzB5p10hQgXGoW5/jqIWXFpqfmSSt27XYI4JNktSJfH6wVComVzMe?=
 =?us-ascii?Q?tyT3oEib0I9U2b1hb8uz1uNazTdfpuPi6bcQPTLLj6vj1BhYycW7w1CJuLdj?=
 =?us-ascii?Q?Oq8iDE57LcHiTsFnL/oKW2ew/ET8VXNstOGj04yAcJbGIzOTTnmw19OLCaJz?=
 =?us-ascii?Q?Tmhg0oYMgoBJ9rR+j9GbW7IkH8gQ3k+TrF+NsqZLsdnXE3RtLoiYYUC5rPge?=
 =?us-ascii?Q?F78TSFuVDNRLn82yXIjtCpKQRsST4TJW78YGyTqbV0HnZ1Ccy7Y+AUN/ozsz?=
 =?us-ascii?Q?AxSFdTP5pYD78G/Y39V7fF5Eor8M+10D4c118gLoU3+7yfsDH+9uq9kiz3JX?=
 =?us-ascii?Q?tpvmBEsnpaB0nrZk3MwJAUgKJlRNjkkJuMRxGovwp+cyWOwaLSfMCeLCDRKf?=
 =?us-ascii?Q?/xOMuJ1U7BYscng0Oo6Xupm4027/KTmTy5Gl5WbhoimbgQax344xc7eXBlt1?=
 =?us-ascii?Q?ZCpa87vb+oUxHKGOU3xLI9D1nA5J6PnC0jqK6/q0L9QP5nzxZMq5RZq5hvuY?=
 =?us-ascii?Q?6PASsl6LyGauCRxa6D6DNVRYtNYDPy2C+DTRBkddb6aMe0dAchHDq+6Q5yg3?=
 =?us-ascii?Q?MK0i/lLagwhTy15cl9h7x/6PHbLiCr8Si8oRx3li0p/VA2oLI41A5YmLGNqc?=
 =?us-ascii?Q?Mx3cX3KkyOKV3GRV7w1FEKvh4pzWICwRxxyk6NIiBRWhG6KlbTozN9DyFj5Z?=
 =?us-ascii?Q?OOJn261esawjVrm5ZGUIJFFhLFoiCbZxiBQwg4oKc01NjwD+Eb7ZFwG36+Cg?=
 =?us-ascii?Q?Cwk9bNxH8pjWKLwW93918RvHqoap3ztFgo6jf1MmWFIoTMR/F9dvx2Ie5rf9?=
 =?us-ascii?Q?wSN429S7lMBBeZMZPJs6kMFOMo42ZmgoGiBpNY/p40oDy0W4qOi+IifOcRiu?=
 =?us-ascii?Q?uk0+TbrYih5uSTWyp3mFLjo8tU1GQZ0H6cLg5YOG22Zq3/tWONzAr2iPz5ok?=
 =?us-ascii?Q?ld4zke1ReJUGy5kSlPJLAD8yr4hXqZ9WohhfhRCuxVmUN58hB5TlSue2kdxn?=
 =?us-ascii?Q?GMGCGc57i445bGhLDsmmltirIOAIVe0VLifQQWU5Dtm39Ygf0nwh/txTNGEf?=
 =?us-ascii?Q?r7oXZWDCofCQwM5jgOmhX71848ke/9e3xsI8mTA1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4sSAGPTDvrnhdrJWsY4pbmi3MDSEUDfiGZZVib2dr2qaxIdBhoy92t73RMjk?=
 =?us-ascii?Q?8Ow7Rt1eMdanRnS1nf0lfjpR/DxzwIGY5hzh2DoJaQomnZfNtHi8ht/ijw54?=
 =?us-ascii?Q?gTUBJEW9MDI/3gz65YuU3LihBXs0e4j5P23bOPltZbBaTU+rCqoIWf2rG139?=
 =?us-ascii?Q?fFzxc84r789vbTPTfuydNB6bqgvugjETOm9lXLgB6cPGG0X9X9XM50zEWBWr?=
 =?us-ascii?Q?DTEOfjvpJL7pGJOrf6jKHa8Rw7v7AM1IsvwKeAVWHaV8v05dxYKJ17X5Lpb4?=
 =?us-ascii?Q?ZeG3YOlYaOd7tifTJqdodzYewowDo1IGisBJRXoAeyQahOY1R75K1aHRKjbI?=
 =?us-ascii?Q?m3yxnR9yhWxIXJzE9KJZgLTNiFiky+PlyCAe+cdP7Dqhgs2SSwOztDJWzHTM?=
 =?us-ascii?Q?VdUIHG+6iffwxY/E5e3NQq8nQ6bg+V76NZRzZVyhSpT1b7cjdR00oTniVNDb?=
 =?us-ascii?Q?jg7PeU6u+6UgzzlhDx7fsqK6YnTqnqfOUibZLjyPa1VbSh+TJnWOkzq3Gt3/?=
 =?us-ascii?Q?uVszz9n4PTlT+F44o2DCvPOSL6zFJStyHt8onwvQvJP414kTvxsE0FvLGbCF?=
 =?us-ascii?Q?eOlOvIe4FiTpkW9HSZ3AAfrhLChz/uLPCxoS084mc+rd6Oa5119mRyTJ5Nax?=
 =?us-ascii?Q?qW9jpwyj5hNq4SiMs52ce/+ggNnUv6vZ4HY9/yCIu5aE62bD84XXTdY4aO/5?=
 =?us-ascii?Q?WCj3QugVi1GTRjjeiwJRpU083+t0RgLin2I0KZOUTeKUulsCmYjpkLhQqAIQ?=
 =?us-ascii?Q?NnE/dErm+u1+v/yX5zG4Gqq93MOJ5izrPHqvLmXQqyXcqYtA65kE+LqZw02p?=
 =?us-ascii?Q?DFL+xw1TyCSb5s7Jn5F/Qu9gn1XnKx5sF4Y9weZv5ygPxL+uJzfOWcw2QbX8?=
 =?us-ascii?Q?RdocA3m9PK0OseUZrC0y/GwG6XB8EqiUo9TtxinWjKfR0/1MVfMU6S/fntQY?=
 =?us-ascii?Q?MTCvQk1DKYecePmxe8D/LovTad9YsCT6LL1A/hiAgnetr4aEh2l/lBRt+uzl?=
 =?us-ascii?Q?3se5/fxGDFMHgZDZ2dZvRyzR4ISWjoRaYpbL4GTagNg9CGoA8OlNe3n2ti8S?=
 =?us-ascii?Q?E00r0Uy0uKtRdQYW/YTYFK8Youx+gxNHxd1e9Wolky8MoCD+ys1FXWfySowx?=
 =?us-ascii?Q?EIegJoBQNteh51fZFANmgZNL9x/dKzJoEEtd5b0bBibcoN9mJjaDVZ6VLXEC?=
 =?us-ascii?Q?laj4SsSCHt59hHe/Iz05pHfl8Z6krJ5jROlSv4wbZWh9Jbr9uhFLd67mNIWT?=
 =?us-ascii?Q?Pu4pN5X055CZDD65nk3Y2H0uApTrA3v7SZC2LaFrc3VELQak2wYN6nFtfF/h?=
 =?us-ascii?Q?Q8zrf0XJ/i3EhNc1NdgIwnDnfdhIEFuPI/BHi8U3AlnHfN74qKJE2iVJZFGA?=
 =?us-ascii?Q?SxFa7SQ52kTKvGyLwOMYsoUSVWFuH6dU72+vyYMAjZW5QnZQbIlWaiSSRgxm?=
 =?us-ascii?Q?OiWxzou8ojV9lH3DvswzHw/nUiqpxSQLLOfMot3xT1uS6pvDGsuketRHL/Jj?=
 =?us-ascii?Q?dKnWu8i+6KXOFiJ4zoD3C7IlP0q3Hmf0FNNtrYupgNbDJmoQyzw4q2aj9sF+?=
 =?us-ascii?Q?OHCGQnkTdd9Eo5KuNe4mGe/x5FQKedUSjTVuWm6hP24W/qNK6BOgOxrK3v8C?=
 =?us-ascii?Q?kO3mZLfxNdsdDu/LUqmm8PJi7j+2avbgzcD7OBZNMayZN0Nk3SJ4GJ2whyXb?=
 =?us-ascii?Q?AvAOFgi5b1ILQbki4oPLGSCrG4THa8m5Dzs3WWTkqa3vQKSXE18XB+8QfKVY?=
 =?us-ascii?Q?wdc7AtJ8Pg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7746b98d-bc6e-4c4b-6dd8-08de63b11969
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:49:02.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvsNvG3/GL1FTewFwaMdVVypat7nF27dWPpmSMc7ISJt4h/p0N3Q2LiPTpvhK0cJ/TWADScxmzlyUX4X/C05jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11316
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
	TAGGED_FROM(0.00)[bounces-33075-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,i.mx:url,devicetree.org:url]
X-Rspamd-Queue-Id: 5CEB0E218A
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 08:19:13AM +0100, Alexander Stein wrote:
> Am Montag, 2. Februar 2026, 11:27:45 CET schrieb Xu Yang:
> > The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> > USB block in a single block will bring more benefits than a parent-
> > child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> > the needed modifications.
> > 
> > Add the common compatible string "fsl,imx-dwc3" to indicate that the
> > flattened module should be selected. This compatible is also used by
> > "select" to inform the DeviceTree validator to apply this binding.
> > 
> > To avoid redefining all the platform-specific compatibles, "select" is
> > used to tell the DeviceTree validator which binding to use solely on the
> > generic compatible.
> > 
> > Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> > using the new combined binding.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++++++++
> >  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
> >  2 files changed, 144 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..bc6b9743396e8f6b698706caae71241b0512ce8b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2026 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX Soc USB Controller
> > +
> > +maintainers:
> > +  - Xu Yang <xu.yang_2@nxp.com>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: fsl,imx-dwc3
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,imx95-dwc3
> > +          - fsl,imx943-dwc3
> > +          - fsl,imx8mp-dwc3
> 
> Can you please sort this? I would have expected the exact reverse ordering.

OK

> 
> > +      - const: fsl,imx-dwc3
> > +
> > +  reg:
> > +    items:
> > +      - description: DWC3 core registers.
> > +      - description: HSIO Block Control registers.
> > +      - description: Wrapper registers of dwc3 core.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: core
> > +      - const: blkctl
> > +      - const: glue
> > +
> > +  interrupts:
> > +    items:
> > +      - description: DWC3 controller interrupt.
> > +      - description: Wakeup interrupt from glue logic.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dwc_usb3
> > +      - const: wakeup
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System hsio root clock
> > +      - description: SoC Bus Clock for AHB/AXI/Native
> > +      - description: Reference clock for generating ITP when UTMI/ULPI PHY is suspended
> > +      - description: Suspend clock used for usb wakeup logic.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: hsio
> > +      - const: bus_early
> > +      - const: ref
> > +      - const: suspend
> > +
> > +  fsl,permanently-attached:
> > +    type: boolean
> > +    description:
> > +      Indicates if the device attached to a downstream port is
> > +      permanently attached.
> > +
> > +  fsl,disable-port-power-control:
> > +    type: boolean
> > +    description:
> > +      Indicates whether the host controller implementation includes port
> > +      power control. Defines Bit 3 in capability register (HCCPARAMS).
> > +
> > +  fsl,over-current-active-low:
> > +    type: boolean
> > +    description:
> > +      Over current signal polarity is active low.
> > +
> > +  fsl,power-active-low:
> > +    type: boolean
> > +    description:
> > +      Power pad (PWR) polarity is active low.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +
> > +allOf:
> > +  - $ref: snps,dwc3-common.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    usb@4c100000 {
> > +      compatible = "fsl,imx943-dwc3", "fsl,imx-dwc3";
> > +      reg = <0x4c100000 0x10000>,
> > +            <0x4c010010 0x04>,
> > +            <0x4c1f0000 0x20>;
> > +      reg-names = "core", "blkctl", "glue";
> > +      clocks = <&scmi_clk 74>,    //IMX94_CLK_HSIO
> > +               <&scmi_clk 74>,    //IMX94_CLK_HSIO
> > +               <&scmi_clk 2>,     //IMX94_CLK_24M
> > +               <&scmi_clk 1>;     //IMX94_CLK_32K
> > +      clock-names = "hsio", "bus_early", "ref", "suspend";
> > +      interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "dwc_usb3", "wakeup";
> > +      power-domains = <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
> > +      phys = <&usb3_phy>, <&usb3_phy>;
> > +      phy-names = "usb2-phy", "usb3-phy";
> > +      snps,gfladj-refclk-lpm-sel-quirk;
> > +      snps,parkmode-disable-ss-quirk;
> > +      status = "disabled";
> > +    };
> > diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > index 73e7a60a0060dee6417b9469251e121704b7a148..fd23c345149e0dba1ed3919a25195edf247cfc08 100644
> > --- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> > @@ -10,6 +10,19 @@ title: NXP iMX8MP Soc USB Controller
> >  maintainers:
> >    - Li Jun <jun.li@nxp.com>
> >  
> > +deprecated: true
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      oneOf:
> > +        - items:
> > +            - const: fsl,imx95-dwc3
> > +            - const: fsl,imx8mp-dwc3
> 
> Same here.

It's not enum here. So the order is fixed to match:
    compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";

Thanks,
Xu Yang

