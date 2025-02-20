Return-Path: <linux-usb+bounces-20858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C2A3D6DA
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5A016AB39
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8794F1F1307;
	Thu, 20 Feb 2025 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GjTkO8Ay"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FF1EC00D;
	Thu, 20 Feb 2025 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047744; cv=fail; b=k/zou9BVbR5CxAkq6/2SGuMrLIl5mlt+I0HMjfk2fyWM4OC3KkJ/9os6G+YOT/CYVCE8ZJu6OxWqKNNpRxwJM4GzS/Lv+Mil6ga1A+iPOvHTDKgEDDi1sb1S+OuUNa9YplCdoxth9vmAbG6Cgr6HzWg+keZyCwnS5wNuVkbayh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047744; c=relaxed/simple;
	bh=Io3JuYeAIV/54Fl4JmZwj9P2Xg4Nm6AKZ9GpkbcECB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BBRSwJ+5Aw5BQVMgJlRXIV07u3vC/CFxGsBwtfCP8716XMlZ9wc0CfEiotKKl9IP22ESMuzVA7Kb35IpKQZ3EP34ZxYfXTdIDYGXIO9jSH66fu6/3hkpWMVPPUbtXV2UZmSegzDascXksl4Rv0JQCASylowLrvcSV6Ialp776AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GjTkO8Ay; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjsIkUeiyqEmPmmomy33fufU+vVw9Ug90irmMmIYubgb3IkgAdU9Llbn48bRZPbQjxRhbKzadpvJcfAuF8QgYi80kW5T4S2l0sJFbs3P7GTpF+VB+oqVHNhzA+2DLZmlQv2y5KqnjTuTwIEcqFlHUwBztgCUrD2Mn0SZE8pQnAHxPNSLq/7uahar87i+uMdef7u14u2GocbaMCJoOXKydkW8xnNUSTFUcjupRTNhaLGNrd8rS72Iw+CKfLZAd86roQqzSV7lSu5fhz3jCK1xlsoBnaYl0Mv9lyB66ddr0myEyIYQssihDVfitBeOQ43rgcYg4cHUbNCnHoLmuQ7Fcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7VKcjn34u4H8u1sqaQD8zvmzB1UG9anHgfEVgvVe3U=;
 b=lW6zkSTN3E3FLzVRGLNn6IAW1zFU+uzvOHrmv7GK4hl++CjRGZq1gQWgJY+gTp3M0haUiePMs6+Nfz4IyYhrQbjH/98nnbNq13zV0+QKuF07XSX41PNnTQAs+K0K0thfKuVNMQsaHmPvBmURzOldB1Nfj0q2hcsz4YvTOK6/80IBgBvtLTFrl9/V4E9Y9bYCjWG1B32kysT+S+kZq28bNAvJN/tNk+ddPSdkHYU54cVNW4yWxqHj32wFZcRff3SIjCJ0noUgEYnw5yGs3LBdCBcY0X5RKuUUwVssHGhbj45vJga3/UWVYSLfwEjP7qlE288HLpBYF+ugNjW3UjBwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7VKcjn34u4H8u1sqaQD8zvmzB1UG9anHgfEVgvVe3U=;
 b=GjTkO8AyqbSSmrriDmZZ3lt+PRKrlEVnQVCrKNRerFPTJhhYA66m08ter78dph+kNVQjd4ECA+46eBTzY1AAwUu76XScasw/+BxHgShdcNyo5LSCa1aaMsXatMl4NqMfITCNm/ggX4f+dBS9nZQys0dnb6HM6uo1ujPcKknOPDiKCr7unMqk+Pmhl/Btd/vuuqznzo3LdNKHt8f32NKsjNDVuyjH/RrJqtLT2ghS4FaTvrk0bXdL5Xv/cIMO19kajUONiqI2Du2BNc8FOYaEoUTuvfxIvcu4RM1cRvcsuApj8QAfXh5gNxfZGvf+V13n7HwKEuscmXcOVpzZf4CeyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 10:35:30 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 10:35:30 +0000
Date: Thu, 20 Feb 2025 18:32:09 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: usbmisc-imx: add compatible for
 i.MX95 platform
Message-ID: <20250220103209.zm4bvkkjtgewd53y@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-3-xu.yang_2@nxp.com>
 <Z7Ycev436gWc/4Bn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Ycev436gWc/4Bn@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d045eb9-5eea-4d37-be65-08dd519a4c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F87vM+dIcZ3Fo8SMb9DvC3wlSBx6otjUWwRVaGUB52aJCxn+GT+uZoffczVw?=
 =?us-ascii?Q?DQX7w44WXP7a76vLZDb6Qu+1mz9cA2u/XFHAsHYy02lqPRZ38+/e20R/hrYi?=
 =?us-ascii?Q?QP7v/wSMv1vLrxzNbPqcU9yUc/tkupMbC+Ds1faGpaZckLGNlpfzYjZ6rsTI?=
 =?us-ascii?Q?sc0+k5X6BjBQK1QGXjKOZsq3tnZ8o46/opRIWr7ykB3WV7O8Dh8J++iFvUHp?=
 =?us-ascii?Q?UmUairj5ud76h/Y65CKHkVTh9NTHI3ZozzxgqBoQsIjwmsH8XJc9iBZda7tG?=
 =?us-ascii?Q?pzZP4rFhMJKTEEwu+IIJTUi2SaZIP5ahskqfLegPtGp6nw1OOBE0uVDPNzRE?=
 =?us-ascii?Q?6Bid1ZoLFbQBx1S5rV25oB8dqdIkyYJd7PC5+m0c/0feiwmct8YYqebaG3FK?=
 =?us-ascii?Q?0RT8rMdddBqK22FreJRUnYJnw363OXV7paqeyFbDTIxAQOEt1ma+82+5D+hR?=
 =?us-ascii?Q?0Y3F/q2Mv7G2hrflkIWhEZnwFKxxVAx8hZ77FKWShJ6pJHX2q36w3lvB32xN?=
 =?us-ascii?Q?wyqJBTznnLrIJ9ev9SryFu917fmk3I2rnUcBKB3IGii/vNYK1bN2g/Nj/73e?=
 =?us-ascii?Q?HK08ztduGdgPyJI0ekGFoDZUiDqroZ3WqcVpPp/NM0zO4Vb53K3gC1zkt/+J?=
 =?us-ascii?Q?o75siBNj8h0QcHr/GZvmgl/oG5kzgRBSM3CRMxuQsAAC4yjh0rNeeHpNsXVo?=
 =?us-ascii?Q?+n6VIrIQUGL0JXDaaG8bTUyZ6RH1iz6n2l/nw+SxO4oAr7VafamEgpWmp/V1?=
 =?us-ascii?Q?ftfV0FhwR9DiEAVdm9MiTmhjjG0c0G7Ms5ZwakgSiQv3b/osyh+bSawj+fc0?=
 =?us-ascii?Q?LB/48JPgmw57lM790icP/kcVpcovO5nWhIrfjtvvGiRt6l74GwdlUzX2uocJ?=
 =?us-ascii?Q?Ayk6dX7u7f+ymNOmhQRt00GcYc1kAJrrkASX4LPv/abgI75PbrzOk52NviUE?=
 =?us-ascii?Q?BQ03DUaU2f2ncljMgk0Vl59lJjKGEo4Oj9Ffs24KByhHZiPngW738sof3dgk?=
 =?us-ascii?Q?+vDdPRzLsy2R9d4yxR/wl34DmT/fB74Bac/llnVI46qFRaZQucrITiSR9MjN?=
 =?us-ascii?Q?Nmhj5r9pbOFdd9pJ+fEdRvW2fMNpfydqzL1oG+flWUAL1ZHzn4TSF25syseB?=
 =?us-ascii?Q?/aHMbxiWEz0iRSdflLLAiWNC7w5VUJo13qxGAWzCr+JCMvS+y/GMzJoGTQtL?=
 =?us-ascii?Q?eHGRXNRwOHc4kZAp1o1vBOeYYkALvGsTGWPUJeHcvShUiLU6eFS08Ia/JFPd?=
 =?us-ascii?Q?Vrv6Q81t1PLbhoS7bD8U28VCRmHXvYl6cjIWQ6CK4QUmLzZfAlIFKqapJJzo?=
 =?us-ascii?Q?JSea5eaynbmpwlbPk173TqGQokoeM+PrXs/7iiSAgfZGDvCtACHQgsRcLPUE?=
 =?us-ascii?Q?/mloeWzIwjw449ntUQqF7rlnv2SFJHhN5l4atSYYoYg3bIY2AXYYMGmfKxZs?=
 =?us-ascii?Q?eYl87X2qoca5dziek63NY+/Y0t90tzKH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TmYlAhSMkhiD/WY/knDxRnTcfvC9qZAfaJNtbPR4P44H5oo0kxCa+sA5YK7r?=
 =?us-ascii?Q?ICTHVDn74K/1aazxUjtLEUdvuRpY478kvrbpdHupMrUKsQxFavvXjbDYJcRC?=
 =?us-ascii?Q?ByZqBGnNHwBtZumeI4wVYSYoKVlRgi7eoyP/dO+qylt5t05OhXoEXOWl5da4?=
 =?us-ascii?Q?kM/5oiUpiiTN+voj6b11HZdrza1zL4bHnofBexY0GXX2YSu9ONJ4nByLhtpF?=
 =?us-ascii?Q?uMigWkgENp3k+48ywtTdfMKgd35BJaiSj2m48NQJAWwBP2Kj09KKgufDLqVA?=
 =?us-ascii?Q?V9HoV9XaTqNltgXV4ig9YweXhXL4jUbETd4JsAgX+DiimKBR9771mavhULFH?=
 =?us-ascii?Q?GssoPcpRcA0HA2SkqX76hj3JDGhlbsKmNqkRSSxF3pbjR4fYn/RT+ury6fgk?=
 =?us-ascii?Q?PuXTRPcM5nzwxx4QIhdtTadhaVXP9z19Ps6m4tXF0I65y9JXZ/dzzcG6fCkt?=
 =?us-ascii?Q?w/ayrQR3ro/3XrD5YofxU516aB4mqH4sZ/f+4jCaubI4hyGRduxzukD+Ew0X?=
 =?us-ascii?Q?rd+oKdanNJYEZyGrzerJjQSVN3MvYveSahQyeMXXctJeofnH8CvcOSNwkV24?=
 =?us-ascii?Q?4tzhurbgmrCdQ82PwtIfCut3DwQkYcQeqlYCd1Tj/z0b/HlztyMd9PyQEYur?=
 =?us-ascii?Q?cpnrxYMoBfJ/sclFtVv8M08kUchIXRsYJHGDj9ec2vMbbF317//vUeSWmXsl?=
 =?us-ascii?Q?eNJPVlPrvsPpzgVP8EXahZBXK515A2JhV4bRF3JXwVhp+qHV/bMVzOQPIrQv?=
 =?us-ascii?Q?iLzoeeXXC33EGZnW7Dy+m49NIbQwiLochjB5M7qvRYZSiBYqx6H/oN6LvdpJ?=
 =?us-ascii?Q?NwFXX9sLm2C/ng2JHL1SHuEI9qMFsPY+EO/LPfCDWZbtAJyY4N8xrCQyVNAW?=
 =?us-ascii?Q?pUm1rJ74VG7oonVuldlKIcaroMGnKHgfTz8mRw3ueVrlMgBImER7tcUFLcOH?=
 =?us-ascii?Q?CpXN5nxt24nUr6AWP+sU/XiavRQNCQpR2dKExFOVcWNoaQ6KPyBgZmtc5qK2?=
 =?us-ascii?Q?TogiEcfeNF296VqD+Ty2z10u+udgDJgkRn2bPBtB1fThxmRZ0+MXncsBBPms?=
 =?us-ascii?Q?i7SQrRnXKh4Sw7P8gNvG7a0zsnHDBJc+MtvvsQU3mOfAwE1q8Pqjouv0eQfm?=
 =?us-ascii?Q?VELM0T129Sl3lvD12LpQ70xF+80gSkBP5IuMQ8PfuaWBUabu8IpSeFpU/B2Z?=
 =?us-ascii?Q?yRbIflPbnkvkWw2bj43hKEVAnYpySwT8/KMDTBwq4GWb2IIqbkHjK5dKpAgy?=
 =?us-ascii?Q?f8wrpaEbPyvSvttmHQ9UOLQDkVi567q4Oj7y/3mMop/WeO292B/SaCkAd6Lo?=
 =?us-ascii?Q?bV0+dSI9FTatuTDtv7X7iBpNTkPSXjfINdgn+C04vZP+atcVb71Ou70p9B/l?=
 =?us-ascii?Q?Uy7+5bS8fia1pBcLA1pu1am2ufB0przvobkcoe4XddFD+kUcstVjhxIoFubb?=
 =?us-ascii?Q?Xu5SWkUheysTFCTymUEWbE1wepCv4W5EZXbaJQmBvft6mfybQ9Lfa2yghIJn?=
 =?us-ascii?Q?Pzt4FlzQ3dt965BxQB+wnv1RYgJOwt3Xa8Ja+FbTlCwRqdukFBYTm2/f22yW?=
 =?us-ascii?Q?2rwNX2egOMZGDkfVZnvj9bIvIUUTN1djUnTJgYK+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d045eb9-5eea-4d37-be65-08dd519a4c67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 10:35:30.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9qHneW0M2GBDppmd2Wf1XlRrjKmMdhivwfMr2NBwvHBZMOlkmMU6wnzYTh1rmP+jZnY0Lajho1V5BlgGwDXjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

On Wed, Feb 19, 2025 at 01:01:30PM -0500, Frank Li wrote:
> On Wed, Feb 19, 2025 at 05:31:00PM +0800, Xu Yang wrote:
> > The i.MX95 USB2.0 controller is basically compatible with i.MX7D,
> > except it needs use hsio block control for wakeup setting. This will
> > add compatible for i.MX95 platform and restriciton on reg property.
> 
> Nit: Simple said
> Add compatible ...
> 
> Better mention "fsl,imx95-usbmisc" at subject.
> add compatible string "fsl,imx95-usbmisc" for ...

Okay.

Thanks,
Xu Yang

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

