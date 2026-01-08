Return-Path: <linux-usb+bounces-32056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC8D0229A
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 493F1311FC9C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 10:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E742E004;
	Thu,  8 Jan 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UbHqr/Bp"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9B3EEFD0
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863906; cv=fail; b=erazW1zIkN1ipffLthTSXbROWSd/2csCg9O1Ji/QnEo5GOwEOn4O7vG/iKUfrXiemXwBAELhoPQEQhM6waQapgsoUVx6kjAbIaH85x9OeLv1XnD++q9Ow03RmO9RGYOW3oHgGk1H3LYqVKAs7yDQ6QMNClcPrSvglmzNWv2/UAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863906; c=relaxed/simple;
	bh=EgTUeP7NNmMZ/f05u7Au4fm5fBMQ2eg8H4I6vapqHss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LQc64z77ixztzNIyhc/yTyaQ9lcLcGHAl9CvNXe5F1JnGTzKxBzDV4OkW3Wrrz+tjCXueTq+3FLaa6znSdi0S63U7ad/pOyftaBp6OX9hEWsuJtjnNUvxwHyTy3k5rsBGYm7dJ58BvoJaTd8TXoxeCsKwJ0FTOyMxDmgYCYoP1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UbHqr/Bp; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCwyn+9Y/FK/STsYwjgAFJ2oHb2HSdk+VPs5Cfx7/JvQ4HiUYMY/vbVLxbmb2NvBBJStLHwxrACKjGqfoRAXeu3rHIyDQrYGj2qkedO7G+RmoOHOdAZBsB6XtPqDoYJiq79AOUxNazIsMRwZy9mPrevimewkXWx7NZhzQlRpZZKNYiJ5ft2v9l2uBfq/4k3D4IJHYRQd2p62qTD9Okkk4DUowK3l+0KeiHVZfI/LTkKJoUEd2OxlS/VDi9rczNt/g50AQOtFJ9wfbO88gNGr7vWp6EfciL2Tyl2TZEO78RW9WSJDOqMzjQvS3dkuM2tt1v8s3hcNtMgafVWp/4Z2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZG/UOtuGQst7u9jcA5I0/EILOiZrM9rGpk9bO1DkeZM=;
 b=cl0/pb7LL3VGvJrM8CQPPoc+TIRKhQny2C5GvAg5qvRWWxMxStOs2Cd6OYFpgZFOHD9SKx0HW0uTf4irOPiFnZSPVYLkQ3iYykGrA96m7Dx3P/79L7lzgXCV0F54oijhBk12fJs0sdFUEpBFsRDWgNp6w7W8h+iNbvklwmt+9TkI3ydvuHGkxec+XhOFO8TupKTtNwsLjtFk8RamxvZ3s0L34bWSXoQcEbfqeWk4/Vsrob0HJnY5H31pGyaIldO6DlcypdVgId0xCOyL8MV7qMzJLdZnWDAlqW5ENMU6w5DP/A7WpiG/QMpWnBzuPKaHA7ulNgIsBP/4Fz9m9dLhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG/UOtuGQst7u9jcA5I0/EILOiZrM9rGpk9bO1DkeZM=;
 b=UbHqr/BpzpHlWT+INwNFp/kHBHl9X5T+MMU0RV9cIkeq2qshLEFDryPahoKvUbbdoi4QhonSpO1UmmEqcmeum7e02mCkQZnKSOvubSCvdx2f9M2wyRtvyT02Q5DGUUus/doPTYAnDlvOKVLh6WgsR7mS/m1/vh0t7YWTUVsALJVjzzFblot3efe0k7nPVl8tRpM1YeV+/WuoDoI2CIBeSXkF2vl+xdHmz3OTNSUbxqvY6Tk+onCHmvOCYPXN/r/8U5jfLFBdr2ScTCKjCHnd+Ro8lrbJ7JK/pImcq1528wc720Py2ixHwwHwfkZory4pD/Ba9PH3LQ+2Slssdv1TAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 09:18:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 09:18:14 +0000
Date: Thu, 8 Jan 2026 17:11:04 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: chipidea: otg: use autosuspend in ci_otg_work
Message-ID: <zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54>
References: <20260107104220.419563-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107104220.419563-1-mario.peter@leica-geosystems.com>
X-ClientProxiedBy: AS4P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e41ac8-d647-4649-70c2-08de4e96d9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gTeAymG5HuAriK3q5th6zbfTJwY+gB2c0+BcaMQzz64INRbzV43G8DI7OAFi?=
 =?us-ascii?Q?VjZV7zciHTFr8Pmgvrqbaleo8M9s5Sr8ka8npbi0msajkL/i5rEQXXg28kog?=
 =?us-ascii?Q?MvxOjK79d5Tv4hpPX+NyfiCbhbmrZZoM3moWSIVwVOwTaz5b7bBd+VDFMenP?=
 =?us-ascii?Q?jjFIh1LntoLHdLqIQlQy+iVMbA2ZcKvNiphXUTwg/cvouk9kKgtmCBYtgDm/?=
 =?us-ascii?Q?9mG/Fd5534/YyCBG8D+v1+LSepJ4mLKdyro2+ZJKh9pmQiJSNDzBfVo4SwPT?=
 =?us-ascii?Q?RqIWBe8sB3oaMC/hARO2U/Zav/yea4c8t+XK9UsNL9rguQYHP2z08r2+S+a7?=
 =?us-ascii?Q?2Wqy9/wmDKC8S4hBDKhNDRzxpn4Fy2x92E+m5x8b1jaC93pqeQtLA93bEaaH?=
 =?us-ascii?Q?ajf0fSeN9HP6XpzBHXnQ8S/Rh8z1PWZNQOJHNHzflYKGTZQqemAJ9FaYZ6aR?=
 =?us-ascii?Q?9Wj5lP1uzN7k54k/7aPPzuJoHc3EfcKTHvjMtjd/JcZdu2dbI87N2Cw5dZ5Y?=
 =?us-ascii?Q?CqMvD1EvqI2oNCsrgHpAImpOPvNP9JjVYUSfhw/RPugaTxkz2eWILAKS7FHb?=
 =?us-ascii?Q?io1P8miW2lfJGTz+3XsfXn9p5EjDW2+9K3IvdQQsqrzoAPs4tXfymkrhWy5z?=
 =?us-ascii?Q?Kn6LZn3Mgvf/0xvf+59MDTIVZg0pNr1BFZtNgUNtphlyUSrClZ9rCmYu303a?=
 =?us-ascii?Q?iv5AWYuaZZCJUmi/GxWeTIFTSFtqK1EtRglSs93nccJlgI/r+dgnBSbr/NJY?=
 =?us-ascii?Q?yV58tFkXZieihhk8QQgkIXIr0GA/Yce52xRxfyfR0+ZItsTnYemUPdv3LmNC?=
 =?us-ascii?Q?Yi/K/Ran1cu+jQpW3fzu+gJb9fU5oeLlenJPCb9w8JlSkwwxc5SvR+7Rk587?=
 =?us-ascii?Q?pcTVIU+KZYk3LwVGItWkftUOJGsGrndH2OnLB1qFQXSs4smvJVtJm4RfyPP2?=
 =?us-ascii?Q?B/4vBNZLVvpndiBpBquakd3Ifp+tV4FMZmO/6vnoL441yoW7+wgnAnxj+gFU?=
 =?us-ascii?Q?bJ2lrEOpREobGjw/hlP83L+oirc1vFNYIfUd4DUWlK39BqiUGzkQyF6yzqms?=
 =?us-ascii?Q?esl+BwukEyGI8QK9w/GxxYVPGR64+1qBWkDapKeDKnBD3zcvY6/Adwj0TK3K?=
 =?us-ascii?Q?muVrqy3l3m4nBAzMqpXAZVfiMgzOeMPIMNEvOKxL1cWvprEip23A/GUpVAlF?=
 =?us-ascii?Q?KuAEQRP40NueufXFwcFhgABM0kISYin7Ok0/BFjfVFcksyzzd74HBHdLK9/G?=
 =?us-ascii?Q?semEFJpIXBybkQ1rQTBaDmQ3yYziaCD29GYUudebh2FeXY1mvGvFwFmKvNa9?=
 =?us-ascii?Q?DFeH4GJmV8SR2n5ZDWROrmM/AA7VKrq2UbjoMbc/8OFQs2Lcl1+CuuLAWa8J?=
 =?us-ascii?Q?fcUQJCmkvK4qR//WBA4TzjuSXSzjiyaGvNpH+qtrlsT9NckByJydVkAn39wO?=
 =?us-ascii?Q?zHTq23y4UvWps2A1sXK3e4D3ZncUqcieiVUKWa2nNuR2ySrjDLi4X46sht9d?=
 =?us-ascii?Q?3tpd7b4RpbjL67RxKShDTumER4FYivi3PXat?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pGnX8X4jBYWS9P1WQnn1MrQK+gNaw9DPl+4QT+1dYkrUqBVnueJHp94u5H6B?=
 =?us-ascii?Q?lXsZbaK6jiIaKKQut/2BYSTiQLac/N3PPUmUMSBkgzLaAjiExLo0GW7xI2SO?=
 =?us-ascii?Q?aUhKBvus+jkm8SID6uxZ2jrCvEtoBX/c8K9fhgB/gcIqv6u3qmr3OXxpwdo5?=
 =?us-ascii?Q?T3IM+AiPJX2NR3ipgUv+UuUNpCmCtXD6P2xV6Tr/ZKd8WXDD11LTj9Ldrj+w?=
 =?us-ascii?Q?YhRgk6Alr4Z1OegaJtL2dVjvmVx9VEesVmAv6EXGRKnCJHK+xwBGP4NncMXc?=
 =?us-ascii?Q?BDf+lo9o5Sye+mUmLnhxLUcTPtnlX2r57V+uwH1kfjeixYGMM5EJWhxacb9x?=
 =?us-ascii?Q?zftJw0aUOGFJr3+AAYQJfxwKelsCmm11TtzvSTCQBFTKbML8uBZuwtBZvxJD?=
 =?us-ascii?Q?lSEdAyUn8jYOEhT2QCUGmRZb3byJMZ4bXlhaEth4QnFUlQBQyjfvIlGMbK1U?=
 =?us-ascii?Q?SxyHi6UClKqGG6H/YNYjncZ1044K5MXIQMdMoN8UpQ6H8TwRCQqvEMXpkymL?=
 =?us-ascii?Q?s7aT3amenQl39+b7ZoA/P+Nq1+r7QaJPk4jjF2LOFI1viNdzfiFqoqJ2jzEM?=
 =?us-ascii?Q?X2kV/99nmyqlpGYZ6KDqpUGPrO+dcQrxuyWeECbZPhRZqutveYI433m+ESTW?=
 =?us-ascii?Q?dQNdvBKfAyzzchLgsS+uCqibW+4NfxUBAvoNnDCjaYcSyrKM9ao81CkLR0gZ?=
 =?us-ascii?Q?uvtUA+a3sC1vlPjO33EHfKvaD7+uJMSn1LBGlumi9Czb4gl/eq8qH29fzHMC?=
 =?us-ascii?Q?96Yb59RXvnfQW1pGKu3n6+HiZIKgm3VKwJ4lXnU2vBfnt0y+su+feglBYQuc?=
 =?us-ascii?Q?GHnJf0UEl6mnBVknd3uyiOFUjHyFdhKDMVUWBNH85hekvoygQEeydqGDNf0u?=
 =?us-ascii?Q?2u6o0TiNuOXXRvHx1FIN6694aBRx2rTaTcb2pIJtocFBcAgCMn1Ct+oHqRDb?=
 =?us-ascii?Q?jdJJAhLP9if+cARIiYMm5DmcxNKVNm4OYvn54XSDRsjmo6aijePl1w+r3Seg?=
 =?us-ascii?Q?dXBBhH0j21SLzilOz0lJPGKP6nP4Yf6fzqG0iBucu6cubrFffsJcVONAcsF2?=
 =?us-ascii?Q?Y/2qTy4gIGEm03BuVPUel5LGZ+QeWoR0sVwB1xpNrHWZYaKoBUGzPQ5rFGvM?=
 =?us-ascii?Q?nwClgAmHSMxJZqGRlPpv0ImQwkPcOJ5USxAI6rfbxorVCXR+ug+z8yqR17KZ?=
 =?us-ascii?Q?p0dHqkQ5zpelhnkGOnka/loEUxnXYP9zOT+ePsv9DVgwl1wnbkbJ3oawtphW?=
 =?us-ascii?Q?V33uzqCT9TikdXj+yKTx3io7lnvNOxM7rCJGNWtrZPcMg0+zKbVwE7ves5fx?=
 =?us-ascii?Q?lRS1pNdne2ys/A8o595OyLXtXLyxeGskuhaf8C4jSq6sX+u1rJxYtt+poNjt?=
 =?us-ascii?Q?Zz6ZhGa05pdwxuRrBNwOIj9SadbhH1IjKFvu8p4K32u92kkNaQSCV760gAUJ?=
 =?us-ascii?Q?Om3WJnqmXRvEqrSZwSFJVRdBbrBJad5+DFqwTqRZ7zWmuXNF1ZZQtJ3tgCnS?=
 =?us-ascii?Q?Apw+eJR6MjpbjRA9GTZ8JUYG8TjAD4kPN6WyfaJiTxmzCJv/UPt5YLnGB00F?=
 =?us-ascii?Q?16/K3W28cpgn7yz48frjH0+IHdKJVgqW1QO5LVgvCo8XCeJEdTh6w7Hl+PFo?=
 =?us-ascii?Q?ZJQtmy7wcaudf5LoMxSXu1K4GD4LurUx/KYsaAiAd1+KZoUfYNcqGaQIzgnw?=
 =?us-ascii?Q?A9F2PuDgY/bU0xb+VYnL1WOvk5XJtKWw1eH84xKZzs5EtklhcdnIL0/UZrfo?=
 =?us-ascii?Q?7clNM/1ENw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e41ac8-d647-4649-70c2-08de4e96d9d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:18:14.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BoPMk5uYhi14Jn1hgYWIg6zBzWJJsTEq/FWZchJZrI82kWCNyP07dEiU7aNDRcoTgfFqiOKZiS32BWYW6fagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

On Wed, Jan 07, 2026 at 10:42:20AM +0000, Mario Peter wrote:
> Switch to autosuspend mechanism in ci_otg_work() to prevent race
> conditions during rapid device plug/unplug cycles.
> 
> The current implementation uses pm_runtime_put_sync() which triggers
> immediate runtime suspend. This creates a race condition when a USB
> device is unplugged and quickly replugged. The controller may suspend
> before the new device detection completes, causing detection to fail.

Do you mean the USBSTS.PCI doesn't assert when replug it?

> 
> Replace pm_runtime_put_sync() with pm_runtime_mark_last_busy() and
> pm_runtime_put_sync_autosuspend() as recommended by Section 9 of
> Documentation/power/runtime_pm.rst. This updates the device's last_busy
> timestamp and delays the suspend until after the autosuspend_delay
> period, allowing pending device detection to complete. As documented,
> this approach prevents "bouncing too rapidly between low-power and
> full-power states".
> 
> The synchronous variant pm_runtime_put_sync_autosuspend() is used
> (rather than the asynchronous __pm_runtime_put_autosuspend()) to match
> the semantics of the original pm_runtime_put_sync() call.
> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> 
> Testing was performed using a scripted sequence with a relay to simulate
> USB plug/unplug operations at various timing intervals, verifying that
> devices are consistently detected after replugging.
> 
> v1: submitted
> 
>  drivers/usb/chipidea/otg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 647e98f4e351..8482170c55b4 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -230,7 +230,8 @@ static void ci_otg_work(struct work_struct *work)
>  		ci_handle_vbus_change(ci);
>  	}
> 
> -	pm_runtime_put_sync(ci->dev);
> +	pm_runtime_mark_last_busy(ci->dev);

pm_runtime_mark_last_busy() is redundant since pm_runtime_put_sync_autosuspend()
will do it firstly.

Thanks,
Xu Yang

> +	pm_runtime_put_sync_autosuspend(ci->dev);
> 
>  	enable_irq(ci->irq);
>  }
> --
> 2.43.0
> 

