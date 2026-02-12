Return-Path: <linux-usb+bounces-33318-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dJZ8FHGfjWkH5gAAu9opvQ
	(envelope-from <linux-usb+bounces-33318-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:37:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA712BEBD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCB01301FB7B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602CB2E0B77;
	Thu, 12 Feb 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="io4WlL8y"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981442DC32B;
	Thu, 12 Feb 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889056; cv=fail; b=Qam7cl5msS4mU0QSkwggRcsCDvTgEBbjlxotE0ivmxTlt+AVwWiA3AK9NWiTX/bd0ADZNFGQXmo1bsmOh0v5FPii6JmqAz27yXdjJGVpjW6MvQodM+3v+V0mSKQDt2LEhIzl/GYJ5lvneGH9tYp3aOfu7r9+1+5sBpDG3ufWv/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889056; c=relaxed/simple;
	bh=Gt9thmYpOxXohdJWgflk8BuF+BtlPnjlXW7NXFI5YXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T7OR1YR4ljUSkOXZvV8wRhEMgA2TPGfxBR5a621YrsHGvHpx37dcYP+fBdBop4L43Tf6k0o7qlKqf3u+yXl8IJSlrCD3FBR1fQ9pjsIWZ/rs8NXLLzH94opI6mR7pVoxXZ61oXwIgZfwQKhpv42p38OUNn8yah0upv/2i42uwP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=io4WlL8y; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm/zpHKnl4T2h089+jklLnxEuqhGxTIVFO/wtupbAIvuE4gdI/8vYxQq50LvBFI9xY1qSBo8DFY9y8u41ei1EISH6HwipxPe96y3EBohg3ta9XQ/PCKVOecAYQrsmCUDrc+o1DACmunCK+55EEyDbJ9TFt8BpixfeOFdm0RQrQRSUXw/Co0vmqCHulBkmS5kdWPQz5dNCd3AmNs/mqnz+mhEE7TuRM3k+yKWNPYyQ2SdDlF1Sv/2oLMPhDPpF2GvUbQrI7fxB9hmXwUoqNsB28uFwnap0IQD37cbkDfDF2sPWfmjIegBFwU/WKDg3IoXo1GY6conLW7DhRP1vp5/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DZ65QGpUVglEhju6oB6PR+Ga7uyzgIWSWiY8SWGcRw=;
 b=RZT4nE0uTyzEhhM4hQnEtmNoVhhzgtAE1Y6Mw80EPT4WKFDCkIPU3FKlPdqcqUwUTE4rGUuTwGkaTG/hqAriALqFbHrDXP9rc8M8jlaADBYonDUGFSPPbgNwDnso9ZMbxLQ3ucGyaJJBfA8RRcB1lhKOW3PdSldayX36BjBs66h9FDRZ4greEXXb5UofR1BM1SBZ1tHAIT0KCfmotVLRmuHBHiNfwk4bZPRUuKPUWogU+IdzeCYjMH8+gBOpzYoVtboKOBnyz1D1QlR8CVbxUSxx/AiTyR59PkPYqZUc9/Cj7B3OtL0sZlJSNSrQy4xiREOd15GQ8/cqM3FbZZPX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DZ65QGpUVglEhju6oB6PR+Ga7uyzgIWSWiY8SWGcRw=;
 b=io4WlL8yj8X7mrSWpqauoVPUhoG0cEYcRWWQMGszHAzE/hxFRnQVjKTumJ+BhWXDYapE+ykAEsMH91u/6BM6AA7/hmNgVSCDVNljbiWnfmk+w17sgyC3cGQ0SjkLCqEfRyAaAMWKzQn5EgKpm54C4bvIXfRSDb5BB4yChN1kG7Y46f+3jfP13jEYyehvIHz0bA435OIISgDhpHXDBWhJzC5NDioFRhw1/TVF0cyTaDPAmBVDCs8GZ2fDZlmx9L6c5Uf/xH1DIvXSpzdJCgj33I8zP/VhAZSvFmZrCqwTi2t1tmODg+kotN2O8vIFqDSbY081aVP9LxcZAzSB5zYqhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB11667.eurprd04.prod.outlook.com (2603:10a6:150:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:37:32 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:37:32 +0000
Date: Thu, 12 Feb 2026 17:29:55 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] add DWC3 i.MX driver based on flatten devicetree
Message-ID: <eagpdh7tg3js5wxgx4dwtggiyetzhuvljvcbmwjmrnaqtmefiz@tik74jepvv3o>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB11667:EE_
X-MS-Office365-Filtering-Correlation-Id: 978182ab-6201-4acb-2516-08de6a1a5866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pkFU0X6yeXFbdOuC+hy7nEptJjwYh4oXiujikrzVbq4sm57SJgERRwcLRj47?=
 =?us-ascii?Q?Q5eSpCC+L0eqV5dgNA3HJoUvfT5ZOo5pw1UROcxn6Kpd0B8j073WOewd1cMZ?=
 =?us-ascii?Q?dVs5S1oFvHs7g0BJk6hKgaNoi3UHA7xIfZiowpsGfU+7DOKeXA6U6o3kS6Q6?=
 =?us-ascii?Q?kIMw8QJmCcjEU+xmrRFx0U/vGgndHwWBelSl/0CVOjGHmJe9vLfNHiRgCo9P?=
 =?us-ascii?Q?qrixGzryyVHmkV9NTz17/mwZTdu//xy/J7tmD6Dxkd4kLTih0ip/R+fl6rfy?=
 =?us-ascii?Q?cfU6BAshH/1LmEtdrj9giiuQK2b2/ytAqnUuGbO7Qdk4Szi/KwJsEymseXJl?=
 =?us-ascii?Q?e0xsZihcyUUwdPowE3TTOQxtxtHupXj4cSZ9eHBcnFRx0Hmt8Ig6ezR76WLB?=
 =?us-ascii?Q?4xG/4WLYQBJvjrg7DjGIZF5fZavDArnveKEapcQ0ycemoNeLnZC94+8v0p76?=
 =?us-ascii?Q?CqrSXdo+yadJJyus5j7o228eBbUvHUARn8MZBCf2WsZ0apEXYlsGPm1mIILU?=
 =?us-ascii?Q?nawnuIEJlA3C3eKB4UWgQLaJdxAMBjl1KLqxHoWVaE5My5hYS+1se9OAZNPr?=
 =?us-ascii?Q?uSiT65OENlm4Exe3QQUPTdZbsRN3KKIZEhg7LQo9oQRyGUUGton2/BrXJN8D?=
 =?us-ascii?Q?XuSfcNue44RthTaf2tzR4eei5aqWcUXVOtkG3j1Zh8tC6Q9kPwpkCN8QKUqr?=
 =?us-ascii?Q?FsFPXpkpqK7GnhmiBfIWCV3JNugQu8n82Zexr3V3TfaFj7Xk5jbOycDx6JT3?=
 =?us-ascii?Q?T9jk0pJG2m59SJ/p+khCzl+X6O+aIPV/yAdxCzPT5npCCU0znCFD9DQ0DaxL?=
 =?us-ascii?Q?Ou1dhIifRwewZkKD7ek6EPle7oMgQ9KJ1L/k0Z/aF6veMC+oWVVdMs16Z1+n?=
 =?us-ascii?Q?Pf3PUw1d/xohaksTxuWxjtD4RnvuH2mBxmrf/x90s59ZO399Vfj6euFw/io2?=
 =?us-ascii?Q?eNzXHfykessUtSyFZp1NQkKLO12Ku18bqYo/mc2Z3/lMq3Pmd+cCVeeAMc9w?=
 =?us-ascii?Q?BaQNM/dn4MBclztIUA7f2RxtKnR+6ppuwH8QngRL25FsmHztOJpRImwABbLj?=
 =?us-ascii?Q?Gh/LKKQV3SMWRK+WXKUvR9xnfJis5TGFhog2aF4bXZuXuuW616/0i/OJRowr?=
 =?us-ascii?Q?/jc28pFmCnD/SLeN4WpH6EZHy6J35t1aKNSzurdYp3ngSZUlnFh64I6DAFDL?=
 =?us-ascii?Q?tEow4cnp8xC9dfisIDTQtXK+eJxKiKccf0Pyfy4boXGXyLFMSMokgPvEjZUn?=
 =?us-ascii?Q?QvsVy8PRMO4MrR0y1MRaXtRgiMx86Ez5emRkEp6mwm7162zoQ75CWSSEBITk?=
 =?us-ascii?Q?S9BpvLTjd8rSdMb86UIW7PyIBX0u1P88rQFr6nNMAS8Om3JjaJSyIsawCs+H?=
 =?us-ascii?Q?RgvLxnfZzn75pMF62vofsjEVYY4Q/Q/Y/fgIuQGcntahlOTBAsso8cIxdbcx?=
 =?us-ascii?Q?fKSLyp+KWpegpxkTyTFjqxAHIDNcuvdKtO4d7eux/tBNbR+aSi4VbacmeNNl?=
 =?us-ascii?Q?reWerXdHhKKF6Mjt/k1a87b+mNYqQnQ/bhRH9UZS76j/FZsyU5rekh5/uEo5?=
 =?us-ascii?Q?XupoqNn6zUEAmgKtXWBUwNAjKQBABNfonr4sPbGnQlbGmLX4vFnyNm/28BWV?=
 =?us-ascii?Q?RiUHlFrwFsFhwaia+VN+QxngcKwN77Yl0t6uZB4aViLL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yylXtswHIWesn23cpAMf6aTAvXaxo8SZG0GzoSnk2nVTvOkXSxS3iBBsoHrp?=
 =?us-ascii?Q?DAc03SxdmFigZVQTroSSitybukmmbAMWarzsR8So7S0Z/bav/cLfVyH5buuT?=
 =?us-ascii?Q?orYNa+JuDnqmsdlq61+LRLwBn9d9KlVDmTqpyZLBudIbIhG9C9ENPE6ySdIt?=
 =?us-ascii?Q?Pc+DgpyvNXil6n4d9QZ2avmQB891OP6Xr3Zo3sWrIzZhhGvGVehM57EMPGdT?=
 =?us-ascii?Q?kZ74oqaAq8vjwRf5mWMqOksdkTr7TUC+PNJOLsGiDwziY6BmvUB5i383R7Vq?=
 =?us-ascii?Q?vmKtvIBrJAMS/zpSiawjIrE7r+1Ani0n31UMhKIL2p99BTGYk4V1o8RSWuYk?=
 =?us-ascii?Q?W//Hafa/GglGX2RMnRrBfWWy0Uh0DNLEZTFz3OgoDm/fviFiwqwXQefgdRtt?=
 =?us-ascii?Q?6mBHXBbvvIzQ7o7FSNa09ikr6ONQpHlgpYF98Tq06tZ1BS08Bki9WN3DjOxt?=
 =?us-ascii?Q?/7Ih6MCRrxLiOOqS5pU8MWP4FWzbWTccTBjlRuEG7dSyd7+Ma6UXFO0fIUXj?=
 =?us-ascii?Q?f4cdwQJVzCqYAXDOS/lqmKgT9bHWYRP8Sr7CU1aFhtcsUToDxX5zjSHK3tKC?=
 =?us-ascii?Q?4VS0iXRt3lJkdjWPYChMQFtBJuWQeUGE6kG6MrQG5+9ls5N1czeArxJDejjk?=
 =?us-ascii?Q?8b0anFZ6KM2UrN1V3pGXSLuRvMcUBDQED9U/mfE4n3T+2XH0rpQs56zCjWxZ?=
 =?us-ascii?Q?/RPYnZWiF5P0PKcM5F7AXa0lnPKpAenh/mfSgcZBpJKQmBsWjwqDV8RLv5ll?=
 =?us-ascii?Q?RflEg8iGtiLw1bO1f2Um3x384hpUjIg8ilR/ohwZZmKBlMd+QriKzjQBA3mb?=
 =?us-ascii?Q?JwtD++V2HmH0+RCsDd1V4lCeNzm0TKfTmpPeor9//hRtDdjcdq+97d30eH1A?=
 =?us-ascii?Q?M6ET+YePHIlQa+dIm3NfPdQr7LxW115lZA9UlEkw1QNxFz99/mlgG9Bn0R2w?=
 =?us-ascii?Q?sXpQIWudCtC2uAwGRGzhfih6tW1CNU/IFDw8segzk7GJL+YdcD83TybvmLQ6?=
 =?us-ascii?Q?hKXnbRePvn4/O3ZYYTnUeQ4AzbIV4PVokt2fDclbuZ5+afRI+fCRyoYESGjQ?=
 =?us-ascii?Q?SIJ02o0yvqfi0F8IlDKCsHuBjhAxRox62GozUUXQJkXDUFpr6QqT+5lfYcPA?=
 =?us-ascii?Q?ObrdUegbJNlYK1CnNTPL7Q9sLk26IU4FiNZFf9j7Yh+nNqBA4pJpW0h209r6?=
 =?us-ascii?Q?zm5VH5mOKx9sE2CzK6HVSTOjUjAVt82/mI8EFLI06YW8JBOY4NDp+eQx5HLX?=
 =?us-ascii?Q?ChMtZtVDW/QEatZj5gF+loYwm6QVrhbc341VErbIvcWU9h8sLHWFhuGse2IV?=
 =?us-ascii?Q?d+cmSa4EthQIeVfbY0EGHfh9S9rIzeZ5uS4XOG1JBvOQs9jG2h3dW/ZBA1Sn?=
 =?us-ascii?Q?FPlz0wiqaMpbS8AwcyplnZ1GosmPF9bXc7rLYxPu0AMhR+0xLUDokktATmLv?=
 =?us-ascii?Q?UDr/O4hbbdLyioo2237h2y2go60J4BjhkT09/9lwcrtw/43S6FXRTvWANU0y?=
 =?us-ascii?Q?s31+V1FfDg4o5xxg78rb/iAq0nQ8eL/M2sqXsA5CJB4OZ//HCzekNzb2rB8z?=
 =?us-ascii?Q?dlWNOjuzR/a8LH9Mex1ppjzuCDveEmoKKcn1+Jshm9sGLwqrTcrqnrfESGk3?=
 =?us-ascii?Q?hWIo7vOBK2pD6jXAVZ2jacgyQ1z7c2TLABl5wASwPjHwxwzTiIDOhEbNeneM?=
 =?us-ascii?Q?LYCAz0JPwpjvwrf/bF92fXBow0gr9ee133LCylpfLXLtFL4WRbIKpspqLjtH?=
 =?us-ascii?Q?mszK0EQFSw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978182ab-6201-4acb-2516-08de6a1a5866
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:37:32.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DZbNzgqcGmoQmkXJXFDw0wUknMo9P7vX6VbTUjWfh0Nc688oGIHkTB6jzxC4Qodty9FggjYVELmEiXpW6A+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11667
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
	TAGGED_FROM(0.00)[bounces-33318-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CCA712BEBD
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 04:35:02PM +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation.
> 
> Now DWC3 USB common driver already support to do more key jobs in glue
> driver, such as power management and core initialization. Now let's
> make a step and add a flatten devicetree based driver.
> 
> The first one add a new "nxp,imx-dwc3.yaml" binding to describe all i.MX
> related USB controller.
> 
> Then, to support wakeup capability even when controller experienced
> power lost, a fix patch is added to make controller work after system
> resume back.

Please ignore this patchset. patch#3 contains irrelevant glue.h change,
will remove it in v5.

Sorry for the noise.

Best Regards,
Xu Yang

