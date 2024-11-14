Return-Path: <linux-usb+bounces-17593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5079C88C5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 12:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25421B25EDF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 11:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5D41F80D2;
	Thu, 14 Nov 2024 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ARNScUl3"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF5189BA0;
	Thu, 14 Nov 2024 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731582350; cv=fail; b=r8aIIcsYJbc0u/YeHKK97AuwcMnvXVByCoZnx4uUfCidN/KXciVN51pBdOXlk6QTTFnndIRm3cCdEGpP2BfMrhMsSQ9NnjKX79jYWU4jXNTzM7enVHV3XRUtrK5bVn/lJtjoovyGx6++vTtpYHv4psRPiWvDs56/1ohvKUe277Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731582350; c=relaxed/simple;
	bh=xuzZmVsnCUQ7cOvT01Ro8J3FofsyC5kuLOwcy+1lfPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ifF1j//jgpVK+gfxGOFcfFasQvrD6heLBe7pZ8p+scuzX6ROi/dNVkC+KooVocgLuMamck9ZSeoYqZWDJtPptHcyIyybhxWhvoIu4iQooX0wu4cGeRC/gpZZa8DnEkRlm6cCA/Awj5wWYRBySdo1pegfse4po2fNiuh2ta6o66c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ARNScUl3; arc=fail smtp.client-ip=40.107.249.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu+asE8BtsXhIInAeW9Gtr09U5jJpfL/FC6Rz9/jqUZPKsxEWMdAspiiYmS8Md7b+8P7HoQmy1JCxDPH/kK6Xtdm62du5XUFjj+V2c5tevjo40bD6vG9guctSjYhd55S1pF2OaAEAKdHBB60fFNA9zb+WhhHDrT1RuCLcKDNrgB/+IcNy5E6RcBuYLBevHgwfoVR8VnXx38w/uNOxgSn/jupxcTsDFDTKPXJlumt+NoePl1SJaFHMQ5yCtzKNBr/tsmLojJx8LKoajommt6yRySjN/hgFYOpPV3ienx7pRIMrKuH1XsKWFihtKcHkV2CCxn8qEfe1ZeFd+kTZjpEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMgRw/4KgLfzPzIqEQZxz4BhuAttqw9j8fbRZuCP3do=;
 b=Bo0AO6ieoEcpUCQwgjUsDfEO5z2eEdRZ81tokgjdC2RJ0A/M1aWmrCAkpYYL7bAWXE7DRrGpgfd7GqdmqA1FgfgPQslQjABwM4t+oITGBpUqni5UvZnePq+JIoaAKh+41v5TwwidAz3SnpoSQwvdnDMnJXcwxRiqBdgWNhQi/YjWS1oq1bARNfJMEZXoYuXlAbSypPalAYdAoLrCCqaHsRcCIm4CPk3Xq/StG07D8N1j6D7vAsbfuedhl5saSrNiNJ/VvskeddaMLa7x3zdR9Z9IO2l5gFbJYlRyg4fhm//4MOfUFBo4dEtcjENJOVBrxtRU0stuhIknI3mZkw+oBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMgRw/4KgLfzPzIqEQZxz4BhuAttqw9j8fbRZuCP3do=;
 b=ARNScUl3pUYm+PhDGoFt+/1zv47nym7tlMrFIotlH34HPT6HzBMh9lCsBb2NBBbQb2pUFg5Ur8jkhRS5dda1dmmLy6jUttPFHOm7n3WzpjmAaoMNesY0dN2FYn5+LxaYVEz89YOd0LL6i8p62wXc6Z+/s6s0yewtH+ZWWqnthdLtDcu+FfKyxSgP4yTJsePQkvzdXTft1czIUvKDA0kJJZzqGydt4SrvKGPObgO8zZbF43Y7W6c9TRflb4Tf1ssuCL0u80hfNSGxr6Tl/h7atet/HJ3folZM2EHhfQ181le4dN1enYBZ68JKkz+IIIgVp8bmS0m9tAmNuwW9Hydy9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB6842.eurprd04.prod.outlook.com (2603:10a6:10:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 11:05:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 11:05:44 +0000
Date: Thu, 14 Nov 2024 19:03:25 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v9 2/3] arm64: dts: imx95: add usb3 related nodes
Message-ID: <20241114110325.qmakphgvkqoykzbl@hippo>
References: <20241113080745.2300915-1-xu.yang_2@nxp.com>
 <20241113080745.2300915-2-xu.yang_2@nxp.com>
 <2968363.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2968363.e9J7NaK4W3@steina-w>
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: da213759-8fbd-46aa-16ee-08dd049c489d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDJhTHBWMjZxSUJmaWYvWEF3elRuT1F3aGhJTjRubmU2ZzZkWmRnbWJwNGFt?=
 =?utf-8?B?UEorUzdDSi9QRFgxdjVzdGtpdXRYbjhpbWErWUh5TU5abHE0SVN0SnUxN2N5?=
 =?utf-8?B?Nzg4U1doKzFENExCWVQyU1Y0b1BMYTcrMTBJS2g2NW5SMHlJQWVUYXFVZ2Zy?=
 =?utf-8?B?azZURmlOd0h0Z25uSGpuV0JxY28wZERqdWltemhvZjUwWTBRazJFRFZ2UkI1?=
 =?utf-8?B?YmROUURuNWRycG4zaDZGSjJsMTU1d0xWL1BFcHh5U0pqc2lHcGFTTXo1bC96?=
 =?utf-8?B?SUYwZUdaUEZKVDhUemtYeW1NeDFsa2hhU3kzQ0F0QTRFU2l2SnlLVHNaVUlP?=
 =?utf-8?B?bkh0U0dZUncyYjdjL0MvNkFDT0YxUlJKVk1tbXcySGZFT0dlOU5DZHNyV2Na?=
 =?utf-8?B?cFJHck5kSjNuTHVHRTd2RnZrZDdWMmxtbFR0Si9iL1A2MUYrUDhNOFZNREZS?=
 =?utf-8?B?YURucWNPRm9oK3pYT2dYYVRETC9WZXhjaHIyekxnWlNNb0tJUERkdkdRa3BB?=
 =?utf-8?B?NDRBVDJUY2Z3TjhxUXRIL1hzdC9HWG5ZTTlaUWg5cmUvQm54UkFMdVFNeTRq?=
 =?utf-8?B?Z2QwR2ZtYzVUVFJ1MVI1b21wNElTWHpkRGs2dzJTcjYwclVyb29IVVhLRDIx?=
 =?utf-8?B?VTBHVC8yNnROMVNBMkRiS2Q1UmUwSXpQZUxHNUtlcWZBaHFPM3N6TE9QMUUw?=
 =?utf-8?B?dWRuamdjeTBMTE04SDNOTVdKVnFZd3M2V3ZZeGE2ZWZ4RlJMa1BWQWtFSGs5?=
 =?utf-8?B?UC9YSW81cmJEbmZLKzRYU3FLbTJEcnBXNkpPMUhPWmNNSzJVL2xTK2tuUEFZ?=
 =?utf-8?B?Ly9SSmJLc1ZtMzNJN0FLbldJTS9Jb2lNQnRRcnJRVXFNSEs0TGhic2lEVUlj?=
 =?utf-8?B?dTNSMHRGNVR5U1EzNXpydGRuK0lCQ2phYXZqbTRkajcxNnBWbkswd1UvYW96?=
 =?utf-8?B?Wm5mSzZ2cWtTeHhRRmdpSlk1NStDUzJ0U1kwWmE1RkFCZ0tCSGJCc1ptQzZJ?=
 =?utf-8?B?MC8xYWxNVVRMWDlXQi9wVTVBTHpVa0UvL3IwcmJZajJ5UHlJWVpFMitOaFl5?=
 =?utf-8?B?MVRsVFErZE8zNjREWjVDL2tDNGQ2TmNMRXB5Q0hPdnJlMDk3WnVnOEdNamFL?=
 =?utf-8?B?M1JEanR2a050dE5GMzErcUhGamx2bXV2c3NSb3NTNjlxVTdySGs5Ym5qNm1T?=
 =?utf-8?B?R2Q2Yi9IYWh3TlJFdHVTYnlJaENmeC9oNDVlSFpMMzRuN2ZZenBSVUpPUXVK?=
 =?utf-8?B?SkJqUkRvMUJXTjdrMldNbk9rSEhVbHVJSWFwa2ZvaFZ4ZTVNQTQxbExqNmFv?=
 =?utf-8?B?emJsOHZxb0lja2dEL3hDUlFRdGdldFF3MVl0OXh3TFdoL3NzVGtrVU1yMUR2?=
 =?utf-8?B?NmpUbVVjenMzNmUxWExPODR5ckc5UjYvbnQ3R05VcG1wQkhxajFLOCtHQVc3?=
 =?utf-8?B?MlowQjNVWUc0QmxRcVdzVHN6THlTNlVGOXBDdVgvdmVwVWtRdC8vM1RIQnA2?=
 =?utf-8?B?eGpuV2FCU0NDeVJyVXB6dVEySm9ReDR3aEFvTmxMTzlPMzFCMlVpdkZLYTYw?=
 =?utf-8?B?c0lxcXlDZlZ0YjVjc1JTOUtXMXZ4RlU1OVIrZ2VsYk5oZWkwSi9sblMzV0VF?=
 =?utf-8?B?Um0wQ0pyeXdxVFUvZ1NwZWlGVm1tOEx2ZGFMcUdoL2h5eFI3cmFvcE9KajBl?=
 =?utf-8?B?bVd4MnBYY2lzbzhlS0orTWF4WkVJaUwrcDdXSld5RHNLcUZaeDd4TFpKY2JM?=
 =?utf-8?Q?zYJa67+9uH32lhONsgory1VHnzoblwAmPgrKc4L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2VXOTM5T0tJeHlqa1JRNVlOdVYzYWI5eUx3RVM5dzhGNzJyTDYxVlhabEZY?=
 =?utf-8?B?MlkrVTlZWUk0L0VPaHcyVVZUbmNHZmdiZWszSVBLTEtLQUtmNEIrb0E1TmMw?=
 =?utf-8?B?MHkwRlVJbXdOZUNFVG5wci91NzBaTUw5ZjYwczltYmkrbElQS0c5RGh5bnpY?=
 =?utf-8?B?MFlHL0NDemxuYThyeWZsOHJ3MDVKTGFsK3c1VFc0M0J4WmtCd01DcHQrY25a?=
 =?utf-8?B?dTBWN2hlWE1Za0JVaGtBQzZubjcyQ2NOYTM3cmM0eWJad2FxWEFmNHgydUVZ?=
 =?utf-8?B?NjkrVEJOaWllSWlnU3cxRU1DazJqTjl0enRZRFNEbWhpa0dRNGdlT2J6b00w?=
 =?utf-8?B?Z0pxNEFwcmxDcGl4UDc3VEtvRUVPbE1TVldXa0hvdTlSemVscjE5S3ArSkFo?=
 =?utf-8?B?VjZLODUwa1RwOElKaXM0UytkbUJCSEp2QjJnWVJCU1RyZkxpUU5tNVNPY2dv?=
 =?utf-8?B?OFZVVVlVNDIxSXdxdFQwb0o2T1J6V3REb2ZOMitnU2pnbkVkMGhnanpzYVZX?=
 =?utf-8?B?L05RM1JRaU80bFFmQmtnQ1FxOW5RUHVKbEEvT1FoSUJ3K1hMREU3UUJnSS96?=
 =?utf-8?B?VGVablRRNm93ZHlKSnhzSW9PRlZaYlo3OUFmU1JrWHNHNW1HcDMrVFBEdGdt?=
 =?utf-8?B?enZpNVcwUldxdktaNW15YzNEOHJKT01VR1M0TFRiZnJqQzhaVHBabVM1eFpY?=
 =?utf-8?B?ZG5QV095cTVnVHJpRVF4V0tEd0FKL294L1MzQm5BZHZNSFA2Q2x6bFArc0Uy?=
 =?utf-8?B?aWYxUVdZekZ4eERRbUxsTWlHRDdqajNtaE5sNEp0UmV6Unp2VUE5ZFR6TGtL?=
 =?utf-8?B?bnJJbHdtVDJzSnBFZjZPR1RxMWxFZ0U1cHNwNndMbGtydEhRVnkxMWI1dEtt?=
 =?utf-8?B?SUNnejl2MmMvTHBXYXVOeUpscU5NYVYzKzlCeEo0amdEQ0xwT1hlN2czRjJ3?=
 =?utf-8?B?c3VMV0FXb0dLQ2crM3ZwOTFKTFJocDNGSDRkRG5VTUNCNyt6Z2xGWTltQXpj?=
 =?utf-8?B?eXMyZ2RRd3Z4VmNZSVRaMlp3R2t2OXRYOXZ2Z09PWXdoVzJJRUJEcFMxODNQ?=
 =?utf-8?B?MFdSVVpEYXVWL1BlcUIrWm1vTi9KemE1eWtMZERpN24rTHo1N0d6VDVSdTVM?=
 =?utf-8?B?RFA5SU84RjYvTEprSElpRS8wMFB1WUoxaDQxQ3BPSzljREE1c0ZqcjRXTHVC?=
 =?utf-8?B?RGtlRTc2SjFHa24zbUtBTU0xTmxjbFJEbTJYdlBBOHJ2K0MvcnoxZW9CTWJ5?=
 =?utf-8?B?UVhEdUJwLytrU3g3ZzNQbEwzYXhLdDQ5SHZ2Vmx3K0R2Vm50bGVHN0toM0RC?=
 =?utf-8?B?VDdxbHpPbkFQWUxTTEpENlg5VWhXUTNCaDVoanhrd1VGOHJJY2s5MmFHa3N3?=
 =?utf-8?B?VnlFWERYa2ljeGtUYTQ0WjRQUk85ZEp2dm5MOTFkbzBxSnJBT2hJS3lLaWZj?=
 =?utf-8?B?bm92RmE1VG1XTkZHYStVT0toWmxwWTl4Qko0aWZaN3ptc3RiWWROcG9MNmJo?=
 =?utf-8?B?eWQ0WldxM3RhMEhtbDVPWmVhZEVPTE5jQTI5Y1VLSFV4c2R2TVlaZDRPWEt0?=
 =?utf-8?B?WnFObk1rdkdTckxrdDcvZkNQcy9sMytteGpSZkRFV20xSit5TmZpeUFpekxn?=
 =?utf-8?B?M3BIcTdLNzZ1U0Fhd0JyS0JXZk1hR2t3ZVJINkI3NWtJamd1MUVoWWM3cmNK?=
 =?utf-8?B?M1lVdlA4T1F1YWl2VHJGNTNaRU02dFdOMysrMGE3enlHNXl4UDhHZzBLMVAz?=
 =?utf-8?B?dkZKNFZjb240VFlJQ3BnYmRPNnVRUlJYZDFIczN0a29VQkZQSGw2STROeGp1?=
 =?utf-8?B?NWd2RzhoZ0xaVVkxY2MvYU1NVzRsL1d0b1lSVlhxL3h1L1E3VTZlcWJDcExa?=
 =?utf-8?B?UVVwYXNWUllUa3dNL2szdzBCdmwwb0lrUGE5d29iZ2pjSTNDQk56anJnS1Zk?=
 =?utf-8?B?Wk5wN1F6THRYeUZCMkpOcE1MaUJHVVd2dVprTm5vd3d1Q1RJUS91MEsxQS9I?=
 =?utf-8?B?cHk4VWhPTG5SZEo3Tnc3cmdSUjM3QXM5NVNsU1ZUSCs4N2RKOC9acDFjTHlv?=
 =?utf-8?B?aU9aWWZiQ1ZpZlpzdWRlSGQrTk1xa0hLVHRiYUhDU1J2amtUTGlldnJtMm8w?=
 =?utf-8?Q?RLIr3AB6wfT0jh3H4Dq1QGcDw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da213759-8fbd-46aa-16ee-08dd049c489d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:05:43.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/OsMiHYk1qr+rnlmlJQ9xu69pJsM7ave8HCKCmZ495TBf5nPskmvoKse52qAinhBN5qx+2MrtQYA11dmGoptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6842

On Thu, Nov 14, 2024 at 11:59:23AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 13. November 2024, 09:07:44 CET schrieb Xu Yang:
> > Add usb3 phy and controller nodes for imx95.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - reorder nodes
> > Changes in v5:
> >  - no changes
> > Changes in v6:
> >  - rebase to latest
> > Changes in v7:
> >  - no changes
> > Changes in v8:
> >  - no changes
> > Changes in v9:
> >  - no changes
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 03661e76550f..e3faa8462759 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
> >  			};
> >  		};
> >  
> > +		usb3: usb@4c010010 {
> > +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > +			reg = <0x0 0x4c010010 0x0 0x04>,
> > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +				 <&scmi_clk IMX95_CLK_32K>;
> > +			clock-names = "hsio", "suspend";
> > +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> > +			status = "disabled";
> > +
> > +			usb3_dwc3: usb@4c100000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0x0 0x4c100000 0x0 0x10000>;
> > +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +					 <&scmi_clk IMX95_CLK_24M>,
> > +					 <&scmi_clk IMX95_CLK_32K>;
> > +				clock-names = "bus_early", "ref", "suspend";
> > +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys = <&usb3_phy>, <&usb3_phy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +				snps,gfladj-refclk-lpm-sel-quirk;
> > +				snps,parkmode-disable-ss-quirk;
> > +				iommus = <&smmu 0xe>;
> > +			};
> > +		};
> > +
> > +		usb3_phy: phy@4c1f0040 {
> > +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> > +			clock-names = "phy";
> > +			#phy-cells = <0>;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			orientation-switch;
> 
> This adds the orientation-switch to all imx95 based boards, which in turn
> requires a port subnode.
> This is incorrect if this USB interface is not connected to a USB Type-C
> connector but an on-board USB hub.

Okay. I'll move it to imx95-19x19-evk.dts file in next version.

BTW, I just send a patch to fix your previous issue. You can test it.
https://lore.kernel.org/imx/20241114102203.4065533-1-xu.yang_2@nxp.com/T/#u

Thanks,
Xu Yang

> 
> Best regards,
> Alexander
> 
> > +			status = "disabled";
> > +		};
> > +
> >  		pcie0: pcie@4c300000 {
> >  			compatible = "fsl,imx95-pcie";
> >  			reg = <0 0x4c300000 0 0x10000>,
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

