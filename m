Return-Path: <linux-usb+bounces-33082-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAjaHFHpgmlHewMAu9opvQ
	(envelope-from <linux-usb+bounces-33082-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:38:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C26E25BB
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B40B8300B8F9
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 06:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FAE37FF6B;
	Wed,  4 Feb 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BeV0V1y0"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AA37F8DE;
	Wed,  4 Feb 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187080; cv=fail; b=mgcx8nKbL9pKIugMPCEYT2ddtz2dj080dWYaCdUphl+bf36D18POGJil/TaR+1duDclNYNO7aBJXSaJ6LR7fFNP/2JtSwvRA4HDWCPC6mKgtZUf74R+l8bTfDwPkE9DGnAC5wKqJ3p1gdXBx4fb08j/CWSdJTyDJTa/LW6MVU5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187080; c=relaxed/simple;
	bh=+Dxm/V1avabRrrHeCVZO0U04aTmPPZznc6BkF3yezFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nZz3tfHtsGYr7sIESjWb52xqsuH3eBLU4TxkRN4RIfKroP5StctitLqgmOxBWA3Z37YdNipWHj4fSqGvVe7Bf+z/8TvkB+8ocT8vN+802quaAD+wBcSnWv4TRSKXDNU8qaGi4D0da5oaMVnJcB/2oLH1x4RYaGIXAOSa2jovMlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BeV0V1y0; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvs3PqJr3jW07g59dcRT7sXvjMReP7BdmjjekZ5UIXZbUbICLH3LVNJBjrzNEPFTrqNS89gI5o7L3jWVZERImTK/xpbT8Q3dyS4LnpX+DGWP7CvqRx4HdACQCm5PoFiDlSeHrbhmSfMl41/QnzrygC9l74Guq1vjzUBRu3JPKIbNHh4zG7PwfxjDG8Tr42cOrRI10npstrjYLnFTzUjaFh94le4CmTeTa3Qis5AyeMrYXcnJyp35lPjGS4xhxrUMAQKuOgj7WFwonSH7EiTvvE/VAkZmCm/KHNEwS00qeZ/dXLyN85CQQpgdftoYLitph50P+/1wWAUQDgmT11Uz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4jWDq1H55NtaEWVKStOWMZomZVxdYQjvVLFVnnTvFg=;
 b=EIC2JID1qUts0CqQP61cpbkth5npecITnHF6A5eDxDalo6v0Q5Rlbih9yxNlq90JaZ8eobdIZH8fiPgJg1YCer6cUec+VNj/8VYFZzGhythYEjga9/V9Cz7ixIlTcWOq5xMCSn8I+QeES9NrF2gJ6rsmojmzypXytgR2bPdkTYX1QoKoG0RGncx7tasDnZNrZTiHb/t2Rv/bkxMvIf7pcSulDiz7gUGfDxkr00Xax5LxLCiDrSRlZEoXO/eP4HbMXsXkG7Zck0/WHgLNwQYt5AysGPwmoMarnkCAqmLniXAbc3zixMiJLlKKq2jHr5VucSV6uSm53JceHa5ddsACpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4jWDq1H55NtaEWVKStOWMZomZVxdYQjvVLFVnnTvFg=;
 b=BeV0V1y0SVqMx3kVhso/LbJ4zBuqRWR+Bt1XddNsC7yugFYtgNnRaAu4CV6zILX+vkh1gnLW2BipnZ+Oy/l6pDvUxJL9jwcNosAYxrPbnZ/XTDKIEpwLPb0ODLZmKJDOooB1Yg4qVS+dPRjjOjjBlahsNROcjElWE3h7EBEDVAm9xVpCI30PkTK77EWOe3bZ1YYCfRpAI0KhJVPYOD2j6mVCSbESB3z4GdSPWsCFyEuqxc8ZcRBg6FO++XDyzzsl9cebO+gbNkNuCnxrOjUjrw+Q0MT0/Fosh6fxKW5Iu4NrNsrf1Gkyfevkc3zT6aEU3/Arb29gkD/6g2RJwrICoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB9PR04MB11509.eurprd04.prod.outlook.com (2603:10a6:10:5e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 06:37:55 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 06:37:55 +0000
Date: Wed, 4 Feb 2026 14:30:27 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Message-ID: <syv3mma7nsll7lioso4dhkhrk2udvleaaef5mmuws4fjyjfa2v@awjqx6uqt6lj>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
 <aYFRrguYW8Ps8Nth@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYFRrguYW8Ps8Nth@shlinux89>
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB9PR04MB11509:EE_
X-MS-Office365-Filtering-Correlation-Id: d52a6f77-ab0a-480e-fb2f-08de63b7edd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MT3xYkJvxQrPIF9AGUCjY9IFq+qf38AMV2Llb++eh1tvzOCyDu9xfF1XycAt?=
 =?us-ascii?Q?VkK6Yyq0h1kTTCxlKJYDSDOktWqZa5FIDYthAASz7SfsglNJcRQJiP0pMF5w?=
 =?us-ascii?Q?JXh6pa7J0WfCvtiH5q5MQacfHDZueRXCu3yYQKx+qvZ5hNygVE9VSixCfXyt?=
 =?us-ascii?Q?6APntO0ASfdSHi/hGpqYhNljR5/uZqCOFEMX2jaiVfP6YcYxcbOT2KHJX7dT?=
 =?us-ascii?Q?SdeiFph0MpiI0JWuL+pgWGNBzldvx8AVXH/Ew/fQllFBDvHGORHy2ZzvvfT6?=
 =?us-ascii?Q?2cce7IY1Z2VB3Hs0sFlcMvKnxLiF9s0FEBZCtq1gQDxd2EfghrIkSGzFp9s/?=
 =?us-ascii?Q?QtEyDaa2ubjP22uQ5HMUiDURPC63xKwr4NQhfO/+HhAnb3X+q7tG2wNQ/ilL?=
 =?us-ascii?Q?MOqjacel2xdMOYMOYbUCeVa9qWwoXyT//6ptezLD63K3mvsD53B7UCoGLKSO?=
 =?us-ascii?Q?tFfOLlp+LY9yFlgTJ4HKmIVWzft5/vmCqPZRgenLOgvRrsqR1x3dfBYxi1tO?=
 =?us-ascii?Q?J85wD19GR6K9DhmGqjk0PeRnUkk9Io3uvkMuBnVqPnq5jhrSutAIG1rlNKK4?=
 =?us-ascii?Q?hP8+VdJwVyoQlvaB2G28SaQWnk044GGPFXpgN38uLiZnFC6aRqLDYNVdjhca?=
 =?us-ascii?Q?4fTKgZSv7cB8pv3EXHUN7/BeDZ3ZQCOdzp8Ctbo4j1miH8hGBMnFFLcFcdc6?=
 =?us-ascii?Q?s6w/dHzg4mDWwD6TriZscXIn0EAfoIeitI6nZIpcHVazAjixlU7x20zIj2Yp?=
 =?us-ascii?Q?lduhmtq592N6HAlwe0bLyceujBkLRhABWRkhd0HSR0YMlJRwzTLwXPRTyxgH?=
 =?us-ascii?Q?tIKzN5O6YnsneI4pSdIQ72sBV834vLUzCcMArx9cq1NBy5OEF/tdy6W/hDGp?=
 =?us-ascii?Q?/J+05hzAS6hEBhrYBF+BMmojqZjdTdJFuxG1TIa5tS7sGlcDX7nBK1BI03D1?=
 =?us-ascii?Q?2Sh0DHkClqZC9mIyXIE5ldQxHfM8ItMPBJ7BZs4n15xcj0G2vDwF+EIpEEBz?=
 =?us-ascii?Q?XH84NfnPbkLAHznjYZol7VyYFWmeI8djhoLORYSSwZQ4UWkCDVN7V2DL0d53?=
 =?us-ascii?Q?/g6RRebwqLgmZ/uUpgoOE/H8jEx90OPFz6SI1Y9FHb481j7fDYVTVbY2MVz9?=
 =?us-ascii?Q?BPB3iP1uggN+Q8MXR75ugSYB3TSWTaRjChdUABOqd4nfKUAOspe3PahiaiuW?=
 =?us-ascii?Q?amVawNrWX7JItkCox39wr1GakiLvG5byOWvtKbReo1jNeDjXGf8ge4JNw7xO?=
 =?us-ascii?Q?lojf8Hovz/FXt2m0r6HCCavSX0vzlvVDEAujDVv2gyVUpnly/j2q9+b/p4Bg?=
 =?us-ascii?Q?yAeNvoUWi4Is9gw1WdNGtqd5lhBU21zoMWrRmRkIUPT+FRpOn2XejHOHN9gq?=
 =?us-ascii?Q?BMWbYlG4FzzVIPpBkFtaMPWbwFiO3ySKgJ37PCIK7Q3cs5RiLoUX96/BnoLV?=
 =?us-ascii?Q?izYE5L7Pq2ZAweFtWihcugukFo1fdOH5cEyWds0MW95qlxwenNedw9QEwqJG?=
 =?us-ascii?Q?dR4QVU9OOKaES5lwIMQwsZ1076WB9yO1Crr3Uk66O0TnI/vx1T1h7V8SI2ea?=
 =?us-ascii?Q?HhxZWaLv022Hl29/OB/XlMrR7VyVknnUMgmdAOBvrXN0y4TDwzpe1eOEJYxs?=
 =?us-ascii?Q?a5qVQWvMqZ/lFi3RV5U/qGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1eEo41nwrOT2VJ/YMDYN5k5PkF9MfuP3OK6iY0tU0QUPKqhxwJHjH938u0dy?=
 =?us-ascii?Q?urUnI46CoqLAMLmb2szDsWYtS3dqtvcgDqSVcNOyDsiq7hRPBDwhK+omqa1P?=
 =?us-ascii?Q?t6NS3AWQ4dEaTx43ThNFk95qMWJ3iBhhKHay1qdGdLjYtWr778zZQiXJMvI9?=
 =?us-ascii?Q?Y1yZpT6NSZy49fD74DCNEij/UQ4pFuuo4VeXqSgywgsF1LuADBHXEHcGT9Au?=
 =?us-ascii?Q?8jZadsZLkPQGcWNrX54MWtKCWqgK5FEw0eAy/cruuxWQwvSkzOXeZVb72S1d?=
 =?us-ascii?Q?XZmjWLK9u9fJNMyVumlkmSBXzHV30Xqlu+dJivRdepqai/bMSeB/DlakNUyf?=
 =?us-ascii?Q?KDAZ5wZN/YvCtYDxfRU93EnpN831PUIZUEGoShFsfFQsIE+s+l6wDtCCXpbX?=
 =?us-ascii?Q?xw4cwhaTdJGP28p5pRQtS8jHzbTa4ctWOb7laFggfK2Av0LSwEM3PF3YCYMt?=
 =?us-ascii?Q?/gIq60C0I+1JDZPbUisP1Uk0cy1uqfCmWYBG6c1wCUDRsCPxM1lGfJdhu/3B?=
 =?us-ascii?Q?nA0Zen3xrjnoEccFtvGNrNjJ8axxhH3YHsxHmgdLJK93aD0EJM0zJtCrzVXI?=
 =?us-ascii?Q?Ei5xhe+bzSdwVRkZh0BcW/FPdMFY6nukJaATUTMh7gFSXZt+MJWmYM3xQ+34?=
 =?us-ascii?Q?fHzTDVERBtEa1KMfQZ9oCKD3rWTG0XEbtMw9UzJAN5cRWr9fqXftRt5OHSb6?=
 =?us-ascii?Q?zaVvEU2ZaFoznuL0AWjK5jRwU3/gTmsGvIMjjBIMZH/1avD9fIvYMYeC5ym1?=
 =?us-ascii?Q?WzjWUAw8ZW8pIQ0eVYmda37ZE7a/HJs4ma35jpEIkRfhkqjo4+8OVbSWjSnt?=
 =?us-ascii?Q?0qrSWA4+mu4PKkrdFXPefO1KeR6I9rMHSX5OrEpDFaojizHBSZoOABqWVq6+?=
 =?us-ascii?Q?tAKF0inb0atrkvAwwub3KHGW+WwhJw+ryaudM+WVQvcFdgmwVxQkDtgehiz5?=
 =?us-ascii?Q?IGMOxr9T7Qb5NtiQbbAJ6lkZPenxD0U2dCXjqPl8ORhFPjP+YCM+bxk0qKzK?=
 =?us-ascii?Q?ZCAw4BEmozVYEes9roi1zbouMg/xKd3ASAkvJtc8JJ671U7MjKT1jy3X4QxF?=
 =?us-ascii?Q?DM5PRavrlOhjEkqzvWOZbEsXEHAvdS5v8aE6rwl5X8pRrj2UecyFRnvFUuXL?=
 =?us-ascii?Q?JD0mN6P/h7W5D/WHvF5wxd/dxIqnA2pFEzVncn9dx0zLjcn+f5Ka9UosSmXF?=
 =?us-ascii?Q?xFtF91CFn8JKK3D5CC3vYXJ0zwyLf5v5RG4Fpdn3r6zWYDXbYD1lPcmiGQTY?=
 =?us-ascii?Q?R7UTFYTN5M1N9fVwFU76sIq931b8/IczXt2bsoItQ5gb8Z1tgTelm3XN6oFu?=
 =?us-ascii?Q?FuubnAdT/5CBmWk590v0y8ZHgpW30IwE4WIUlkfojZcdhoSl4qKfJPr2hZSS?=
 =?us-ascii?Q?oongfy9pyDbGBcuH8tmO5g4lWu20v55aKEVqZPKTmXPs45mJdgW3vIRGi0Re?=
 =?us-ascii?Q?V5IDEswuBq/pndvUwZbrzs0F97WQyxhMFTzN4HnPYnY/w67k8qbCfod0Koxe?=
 =?us-ascii?Q?kIqiTzJX6gxtOp5ZAAt2Ld9A1w5wP4AUhLhKxHYwTb+oOXbfdjmDaLOPoBtg?=
 =?us-ascii?Q?RKzJey98u53A+8mz968YW55XmG8X/eFHvh7LzIUJT4zGbHpfsRVb9Us1mrzv?=
 =?us-ascii?Q?mQU/LGCOamNAULex9f61vCFP0azASJ+TacCOMEzjxcLjlEemvOotb7A5aU06?=
 =?us-ascii?Q?OHAIbHuaJBDFCcvy3nDUoLoD/7CMmDgz/2/lERtJxke4mX2h+QInf49XiqBj?=
 =?us-ascii?Q?6HQsdLHpwQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52a6f77-ab0a-480e-fb2f-08de63b7edd9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:37:55.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUHkoDhsWTKP1BAIJvXTN1Nc4ONzZZ6tlBMloibDJcivIyfVqRh++TMdnP2zkjjhxWbfAOx9DmgBwFm+G/Q+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33082-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,nxp.com:email,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30C26E25BB
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:38:54AM +0800, Peng Fan wrote:
> On Mon, Feb 02, 2026 at 06:27:47PM +0800, Xu Yang wrote:
> >To support flatten dwc3 devicetree model, introduce a new driver.
> >
> >Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >---
> > drivers/usb/dwc3/Kconfig    |  12 ++
> > drivers/usb/dwc3/Makefile   |   1 +
> > drivers/usb/dwc3/dwc3-imx.c | 428 ++++++++++++++++++++++++++++++++++++++++++++
> ...
> >diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> >new file mode 100644
> >index 0000000000000000000000000000000000000000..57b175e929d7e163df5af7e2265ab7117fa1dc9a
> >--- /dev/null
> >+++ b/drivers/usb/dwc3/dwc3-imx.c
> >@@ -0,0 +1,428 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
> >+ *
> >+ * Copyright 2026 NXP
> >+ */
> >+
> >+#include <linux/clk.h>
> >+#include <linux/interrupt.h>
> >+#include <linux/io.h>
> >+#include <linux/kernel.h>
> >+#include <linux/module.h>
> >+#include <linux/of_platform.h>
> >+#include <linux/platform_device.h>
> >+#include <linux/pm_runtime.h>
> >+
> >+#include "core.h"
> >+#include "glue.h"
> >+
> >+/* USB wakeup registers */
> >+#define USB_WAKEUP_CTRL			0x00
> >+
> >+/* Global wakeup interrupt enable, also used to clear interrupt */
> >+#define USB_WAKEUP_EN			BIT(31)
> >+/* Wakeup from connect or disconnect, only for superspeed */
> >+#define USB_WAKEUP_SS_CONN		BIT(5)
> >+/* 0 select vbus_valid, 1 select sessvld */
> >+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> >+/* Enable signal for wake up from u3 state */
> >+#define USB_WAKEUP_U3_EN		BIT(3)
> >+/* Enable signal for wake up from id change */
> >+#define USB_WAKEUP_ID_EN		BIT(2)
> >+/* Enable signal for wake up from vbus change */
> >+#define	USB_WAKEUP_VBUS_EN		BIT(1)
> >+/* Enable signal for wake up from dp/dm change */
> >+#define USB_WAKEUP_DPDM_EN		BIT(0)
> >+
> >+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> >+
> >+/* USB glue registers */
> >+#define USB_CTRL0		0x00
> >+#define USB_CTRL1		0x04
> >+
> >+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> >+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> >+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> >+
> >+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> >+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> >+
> >+struct dwc3_imx {
> >+	struct dwc3	dwc;
> >+	struct device	*dev;
> >+	void __iomem	*blkctl_base;
> >+	void __iomem	*glue_base;
> >+	struct clk	*hsio_clk;
> >+	struct clk	*suspend_clk;
> >+	int		irq;
> >+	bool		pm_suspended;
> >+	bool		wakeup_pending;
> >+};
> >+
> >+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
> >+
> >+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> >+{
> >+	struct device *dev = dwc_imx->dev;
> >+	u32 value;
> >+
> >+	if (!dwc_imx->glue_base)
> >+		return;
> >+
> >+	value = readl(dwc_imx->glue_base + USB_CTRL0);
> >+
> >+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> >+		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> 
> No need parentheses.

OK.

> 
> >+	else
> >+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> >+
> >+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
> >+		value &= ~(USB_CTRL0_PORTPWR_EN);
> 
> Ditto.

OK.

> 
> >+	else
> >+		value |= USB_CTRL0_PORTPWR_EN;
> >+
> >+	writel(value, dwc_imx->glue_base + USB_CTRL0);
> >+
> >+	value = readl(dwc_imx->glue_base + USB_CTRL1);
> >+	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> >+		value |= USB_CTRL1_OC_POLARITY;
> >+	else
> >+		value &= ~USB_CTRL1_OC_POLARITY;
> >+
> >+	if (device_property_read_bool(dev, "fsl,power-active-low"))
> >+		value |= USB_CTRL1_PWR_POLARITY;
> >+	else
> >+		value &= ~USB_CTRL1_PWR_POLARITY;
> >+
> >+	writel(value, dwc_imx->glue_base + USB_CTRL1);
> >+}
> >+
> >+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
> >+{
> >+	struct dwc3	*dwc = &dwc_imx->dwc;
> >+	u32		val;
> 
> In dwc3_imx_configure_glue, space is used. while here, tab is used.

OK.

> 
> >+
> >+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> >+
> >+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci) {
> >+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
> >+		if (PMSG_IS_AUTO(msg))
> >+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
> >+	} else {
> >+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> >+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> >+	}
> >+
> >+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> >+}
> >+
> >+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
> >+{
> >+	u32	val;
> 
> Ditto.
> 
> >+
> >+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> >+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> >+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> >+}
> >+
> >+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
> >+{
> >+	struct dwc3_imx		*dwc_imx = data;
> >+	struct dwc3		*dwc = &dwc_imx->dwc;
> 
> Ditto.
> 
> >+
> >+	if (!dwc_imx->pm_suspended)
> >+		return IRQ_HANDLED;
> >+
> >+	disable_irq_nosync(dwc_imx->irq);
> >+	dwc_imx->wakeup_pending = true;
> >+
> >+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> >+		pm_runtime_resume(&dwc->xhci->dev);
> >+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> >+		pm_runtime_get(dwc->dev);
> >+
> >+	return IRQ_HANDLED;
> >+}
> >+
> >+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> >+{
> >+	if (role == USB_ROLE_HOST)
> >+		/*
> >+		 * For xhci host, we need disable dwc core auto
> >+		 * suspend, because during this auto suspend delay(5s),
> >+		 * xhci host RUN_STOP is cleared and wakeup is not
> >+		 * enabled, if device is inserted, xhci host can't
> >+		 * response the connection.
> >+		 */
> >+		pm_runtime_dont_use_autosuspend(dwc->dev);
> >+	else
> >+		pm_runtime_use_autosuspend(dwc->dev);
> >+}
> >+
> >+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
> >+	.pre_set_role   = dwc3_imx_pre_set_role,
> >+};
> >+
> >+static const struct property_entry dwc3_imx_properties[] = {
> >+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> >+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> >+	{},
> >+};
> >+
> >+static const struct software_node dwc3_imx_swnode = {
> >+	.properties = dwc3_imx_properties,
> >+};
> >+
> >+static int dwc3_imx_probe(struct platform_device *pdev)
> >+{
> >+	struct device		*dev = &pdev->dev;
> >+	struct dwc3_imx		*dwc_imx;
> >+	struct dwc3		*dwc;
> >+	struct resource		*res;
> >+	const char		*irq_name;
> >+	struct dwc3_probe_data	probe_data = {};
> >+	int			ret, irq;
> 
> As written above, unify the format.
> 
> >+
> >+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
> >+	if (!dwc_imx)
> >+		return -ENOMEM;
> >+
> >+	platform_set_drvdata(pdev, dwc_imx);
> >+	dwc_imx->dev = dev;
> >+
> >+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
> >+	if (IS_ERR(dwc_imx->blkctl_base))
> >+		return PTR_ERR(dwc_imx->blkctl_base);
> >+
> >+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> >+	if (!res) {
> >+		dev_warn(dev, "Base address for glue layer missing\n");
> >+	} else {
> >+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
> >+		if (IS_ERR(dwc_imx->glue_base))
> >+			return PTR_ERR(dwc_imx->glue_base);
> >+	}
> >+
> >+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> >+	if (!res)
> >+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
> 
> -ENOENT should be better.

As Thinh's comment, will keep ENODEV.

> 
> >+
> >+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> >+	if (IS_ERR(dwc_imx->hsio_clk))
> >+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
> >+				     "Failed to get hsio clk\n");
> >+
> >+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> >+	if (IS_ERR(dwc_imx->suspend_clk))
> >+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
> >+				     "Failed to get suspend clk\n");
> >+
> >+	irq = platform_get_irq_byname(pdev, "wakeup");
> >+	if (irq < 0)
> >+		return irq;
> >+	dwc_imx->irq = irq;
> >+
> >+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
> >+	if (!irq_name)
> >+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> >+
> >+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
> >+					IRQF_ONESHOT, irq_name, dwc_imx);
> >+	if (ret)
> >+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
> 
> Should this be moved to end after all are initialized?

Thanks for the suggestion.

I prefer to setup all glue layer setting before initialize core parts. So
the logic will be a bit clear. To avoid accident, I will disable wakeup
irq by default and enable it during system suspend. So IRQF_NO_AUTOEN
will be added in v2.

> 
> >+
> >+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
> >+	if (ret)
> >+		return dev_err_probe(dev, ret, "failed to add software node\n");
> >+
> >+	dwc = &dwc_imx->dwc;
> >+	dwc->dev = dev;
> >+	dwc->glue_ops = &dwc3_imx_glue_ops;
> >+
> >+	probe_data.res = res;
> >+	probe_data.dwc = dwc;
> >+	probe_data.core_may_lose_power = true;
> >+
> >+	ret = dwc3_core_probe(&probe_data);
> >+	if (ret) {
> >+		device_remove_software_node(dev);
> >+		return ret;
> >+	}
> >+
> >+	device_set_wakeup_capable(dev, true);
> >+	return 0;
> >+}
> >+
> >+static void dwc3_imx_remove(struct platform_device *pdev)
> >+{
> >+	struct device	*dev = &pdev->dev;
> >+	struct dwc3	*dwc = dev_get_drvdata(dev);
> >+
> >+	if (pm_runtime_resume_and_get(dev) < 0)
> 
> print a error message.
> 
> when this fail return, there is no chance to probe success again I think,
> because resource not freed.

I just double check the driver logic here, dwc3_core_remove() will do all
above pm_runtime_* things. So these runtime PM operations are redundent
here. I will remove them in v2.

Thanks,
Xu Yang

