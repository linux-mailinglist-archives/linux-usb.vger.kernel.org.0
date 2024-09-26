Return-Path: <linux-usb+bounces-15481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11601986ADD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 04:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330FF1C2154F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 02:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F7D175D3E;
	Thu, 26 Sep 2024 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NScq71j5"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6961714A3
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727316806; cv=fail; b=sflGpOAABrgrX/Gx5hTHG1gYkWH+PwmYq6KSeNWDwBCA3+eVgs09dMNhic9EQA6syUp6BuKjFx7zqeXs40mDk8qogKS+dj2NNzkLt0slLwctDkrZWD37TIhlCEk26arWzel8iUaT71BJ+wb2l0CYaYOxymgJ8Zj65U+ANH716zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727316806; c=relaxed/simple;
	bh=Z1eEzMrXDOyYgd0NxgzIs0HJbKL7vszF2BxkOOh2kf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=td+XP/MPV0PEYlpVa+DKw7HobrbZYcx0yOghnwrK3mLwVGUvOggk4gLvSIyLkW0EImHu7wzkl9GKNR5QgygGpriHfqpArItu804niMf/OCLa0KANaH6DT1hntK++pZphlG1x/31xzoR5RC8eXAt2EXhpzoM1W/yX/VHRclECV58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NScq71j5; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkT3fpT6tqxmNxplZnbwihYcDlFY4S6XmJe3f77rXzP+0EgJYipL012F3vnX6K1fRMe3TRPHc4I6SMqUZj3jLMcR7qMLEijLcGip4pDwzgFsa+d9+3y7H9bvexT8rlmtfoj3XtpIXTcxI1w4TJzym7Oow4knOB3qtQlFpxVu4w4UzPhota6xsKZBixD0g2VC3iC6qklPQqga2QzxrAIdpB2jja75MIsT1bEgvqV98Bqc7AVKOyWYpoXhx7dbBkqa/fKc4xGyiwCcaopd56qQbpnSm+Jwf2VsotUdc/M4pLTRE5O28qP2LN98E/MKegqtMT7HpKocKlXQ05R3+LvndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u/sF7lWOLE6AvXDGOjHFConhJcqYLFwc8PCDwDLPLk=;
 b=fyw7yXO6NzTCaLSAkQqMDVrxqVwr2lyq2depYvGELrJlGw82QU3Jr+b7dtwtfOoKzjfOP2ia+vNq0nRLqMSJNt6sue5eJzQvQdd+kwdm6DZvSfychgcNn03xSF76rDynaZodoO/OE24vX3dblz6/anYQ/D7msQ7H6pKzfv8OAwVy6D7x06VFsWal5d98UHKnVS8hhpuIRU/WerVAqABRNQJE2/iqDxMmKXMdbXRY/xR7l8exdOsc+h/13j/qE8Mp7sht9h5XWWUwX/56SS+aDL7vWArBInQoKZweMwrvq64dwbE0pBud3zJjV8r6UjOsOrJkDAWGVYBoBeUE3L7Gaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u/sF7lWOLE6AvXDGOjHFConhJcqYLFwc8PCDwDLPLk=;
 b=NScq71j5Tn6tOUDEC1NrGGGU4+rvRwWmR63XsA51R7JZzkOucdMFmJzx/IIc8URc6kRPagSvdRD/toxckjjBDYneC0fQWhhmzLOhejV7Gx5ktQ3+yBKDQyQfWtaZMFTBeb9XkflkTZOwoYlC/7a/4p/6gCMS2v7Hu14Tzzmns30pxoPvBxQ3BDBHAxA7HYGeasr3nBlae0EF7ztzl8inRBZnsjd+ANsW2VXo4e//WWoliZr7r1686tPzPwNJ1df/4+p81yFaSY8UigE5N2M5euhuRMtc3Cr2LLQaG/9d8oQChj3s5YxhIiuxMCsLTV2AX5Xo+VCnhwyCz+DnWE/3Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA2PR04MB10374.eurprd04.prod.outlook.com (2603:10a6:102:41e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 02:13:17 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 02:13:16 +0000
Date: Thu, 26 Sep 2024 10:11:28 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: chipidea: udc: handle USB Error Interrupt if
 IOC not set
Message-ID: <20240926021128.6blk3dsyn3ogmrjx@hippo>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
 <20240925124200.GA417263@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925124200.GA417263@nchen-desktop>
X-ClientProxiedBy: SG2PR06CA0225.apcprd06.prod.outlook.com
 (2603:1096:4:68::33) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA2PR04MB10374:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc87f4a-0989-4cdf-46a5-08dcddd0c81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njDstHfm7GUs2zf5hDbU3IXPXMyzQKH5VqzkO2gdKZVQ3NBQD6W78v2oF2xp?=
 =?us-ascii?Q?/PevILkfwpHX5qk8WoB/BCShJ/CIa7FMS9JwCzoo9i6hnJ2Q08GrYmBpdcmk?=
 =?us-ascii?Q?dSrJy0nowDAwq5562LMhogazD+TrbgXzrsLnSL/e8uCn0QMVRBH8Jt1oGgLA?=
 =?us-ascii?Q?tuTdYk3YbHhednSiZRdECZPyDLpBXnLighVHW6EzbxWKfw8xqDdAJA/EF2W/?=
 =?us-ascii?Q?smTSv0FMUWPrpXY0dZvAkD6M+071/MOLfYdGpsr0ao3YTQyb8fxzcwbHw8OA?=
 =?us-ascii?Q?bOvp5PqYhgZwrLP0frdM0ClLheGfwjIqLEmK80447QPZQDpMcEAuZ+72taXl?=
 =?us-ascii?Q?lNzzTrvWrxx1L9YucqpV6clLIitrzbdlyHGJWeDYg8BIrxI3/skR4dYDmM6b?=
 =?us-ascii?Q?0XdwiHTYjjZq35DXMkheSmKFdBFNQoTbaftdfn3fzsWqTmAb6SIeIZ8uEgTf?=
 =?us-ascii?Q?Nvl2tk9b7rLpbwJKBScMScjklBmROwsVJkHpeuN/1aFqxHs0vq5cfxvSAOEA?=
 =?us-ascii?Q?eQYFPMFVKhgmrA3nCCMeLW6vPfLhwsQuSs0O4k3Z+Nc+f9OJL/LYm6/BHi7j?=
 =?us-ascii?Q?Uj5CkYOZEUYobJEQUJbIscY3N96oQKFDm+XOrRHKN6lK4+jVj3r6afE1xEj6?=
 =?us-ascii?Q?iGOmr4vTTJ3xjpgHYTq9u3CfWM8R8f0RTcjTi5/9hvdfm0W/4J7rYaoUHM14?=
 =?us-ascii?Q?B73jcF42eLwJRl/G6aMbzxlz8/Hz0nVKrg1jZn8gdKUBf55EJJ4YoY0UQ3ID?=
 =?us-ascii?Q?EbLR6x54MSJ8Y/EeuraH7jkJ89egKhwlbLruc1zoFkLCcl+r4E/MN/YNhcAm?=
 =?us-ascii?Q?GoU+mmSpPNQ9eRjUBwMHwcHcpxZdKiPPJRXHOE+hUdGB6GgYTXxsLp71EQ35?=
 =?us-ascii?Q?UDJCSDv3L3Mf39TYmDMX1jm2DCyrRpxiNZkboF3XxisIcW/9ms8sZbnfwVHc?=
 =?us-ascii?Q?hzd1Wm02408ZFcb4CH6TY9EiWiXCWEc8sSfcSs9QjbVAGmEoJna0nqykH5u4?=
 =?us-ascii?Q?Bor4oQB+V1I6NXGV7TDKfrjnLmUQ4PLCtXgEoziV+Q6xKAOK3nB5+eiTbMFB?=
 =?us-ascii?Q?EmuUoS+tQPHVM1AxgaDyZ0JB5/UQ4EuoNJPoBlS4O8rXlUX4vybtjE3XIC/S?=
 =?us-ascii?Q?05i97txDvEzGnZWUvQJ+h23LQqgxphXAtjvfFBwB+FkSI/kNvv8vwJRffYnO?=
 =?us-ascii?Q?G51i2jR9Mt3B/AQEfZnpgl/Tq6PRIQHjpLeKvxZAgAnO5elFLLKDSrCCSfeZ?=
 =?us-ascii?Q?rSyZbCOfY48yXeuFsDGRafSPFd3pibWHQmbyrccImsfgV91yLfPoqPcNtfI6?=
 =?us-ascii?Q?8EgLjycyWU73JF2t6bh9f4SOiSMpg5v+I2AHLiCRIPI1XIZH/itF75WuQeJz?=
 =?us-ascii?Q?64t8442fXdCaO87uTWRJzjLB2MAk1a+EZXwtxTpmgeheuchFBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s37OeXzZpTldJWe8ciktM6HCxQ5CcmKfCDg2fDzwxrcVdGn0+0NoKZ791JDw?=
 =?us-ascii?Q?shy5ztJHSkBfRRt+PQWW27sXs63KmopkPLj9mH7xYN6ThpbcURYT06c/5OAT?=
 =?us-ascii?Q?CswEymo2rTllKYx26mW/YdiMM5Nc0Ur+9CHlkodOUjMz9UHzKnFwu+u/tY2g?=
 =?us-ascii?Q?BAgrz5/rLCd5H3WD0811MG3q7VWPFJbm62A1pL0MmoP5qDS/PeP5PNOyZzPs?=
 =?us-ascii?Q?CsodbTxBUMLVIJ8+l9HbJUHjXsKqd13t1Cw0W5Eqg3f82rg/XvoFS7HZMOWn?=
 =?us-ascii?Q?gMxq7V+B3v+3XXAwc9gwRqTeyhl/YW/OB+8Nsi5EERj4ocED8x9eFnuQiUU4?=
 =?us-ascii?Q?a9yMt+f1O59YX7k0D24IaxWPAp6k63PE8IN2uPrhZ9N2rZKHIqgMUsR4om/m?=
 =?us-ascii?Q?ihhm00zmp2uVerktD/txad9/6GqNERx22grrHztQhVt6O7IEQ7K1bICjen/9?=
 =?us-ascii?Q?kSqj0irLfSGn/Mlv8tekV5N39g0Pxpm74wehZ7KUi3JjfGEhFnSghwPaMiRs?=
 =?us-ascii?Q?eGCQU9fiBSblpld/CS7XdMq33vMdWt7DJPjhZu02sIIntW9T5UH0gA0qdrJF?=
 =?us-ascii?Q?WL+K3Qh5S06PNJuHRLwKqQhZibzJP5zENey1mnVCxvU0MatNHMDfTHHM89EL?=
 =?us-ascii?Q?lyG1tgEeW/tedAiivVtDxGl3oGlNmty4mc3zbruKopxKynOfC+CVzCFWEmjU?=
 =?us-ascii?Q?WZ5bTG+KxDG3OIQJnAxhHYlgr5+VIfvCLeUMqN4uaNjXOtWTQDswPgi9fMWQ?=
 =?us-ascii?Q?X9aEdY2Zn2Ccwxtw2CG0BM9v/LWBq+Y9qRJIoY+TKuoCBGevxM4OBF907ilU?=
 =?us-ascii?Q?VS1h7xkzlzcrhVpYpUNjfNF98meowb44kxFvV/JEYSZLC4RxrNyl53dQwpjQ?=
 =?us-ascii?Q?023sorLK33HivqA7HoWFJSwPCcdrkpuhZQOmbEJHyVW029W2YZODxytG4dw5?=
 =?us-ascii?Q?/tMApZrgWKEB7vATgwp9jG5wO5uy7Mg6UUght1BXcA6vuekSlB72TkrFRkPO?=
 =?us-ascii?Q?rke5YDHT0ugXB0AGWH2QYUGttwkvTtRKmhi07jTS356mVWE4KTetFhhD0ELA?=
 =?us-ascii?Q?c3YcgkCxpZ3H/rXYUcuYrRlcsrZAKEFsw/yHSdDk7hNK6DohM4qPSb7lH1/+?=
 =?us-ascii?Q?TkWyOvRefwVjPy/zADaracpa+o/hprQLg9Vz4MpLWUYrAdNNXzbR8y/kLAJD?=
 =?us-ascii?Q?YkuOM5oyomFp4XjG+ywVXCx7ZD9xlFmoCZNpG7PlBJdKL8hqMmbuQCBB3lhn?=
 =?us-ascii?Q?e0VyTUr70bWSF2Fn/wYVazJT0KUH56AmH2bbshNA5kpP4YD1Klgv+eg1+Tao?=
 =?us-ascii?Q?00VKP61W4+Rm/JY4BpWv01ATVFMQddw3TRkAFSfzOZKNFGoWfK3a+HQ1gSTe?=
 =?us-ascii?Q?jV+of7UbX/teWwDl0rw10mGoFfhd0Ez/XgH8Pdu/MnOHvoB6Slik8oftcF9o?=
 =?us-ascii?Q?yoJX0SfVph/Yzj9ss4WGTJhfGdfk2cnSy9n3bIhIfSJT8w+RjqcWt6L+WdXg?=
 =?us-ascii?Q?tjd8ZIPyrc5rEP3Cc+/NQDtvR/vNvzMcPwh4msVV+1erSNLcqIL4coJ4EOXq?=
 =?us-ascii?Q?8wiiuHmRvXsbLGfouxYu1KjGkgUnhnYgRORDF5U5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc87f4a-0989-4cdf-46a5-08dcddd0c81c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 02:13:16.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yo6j36l2dIDgk04wX04oUeW7fon+GNlOdBv5Hd7cCNripImjVRKHoGy9jz3a+N1NyIkpWn+nan3TXtMepm0BTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10374

On Wed, Sep 25, 2024 at 08:42:00PM +0800, Peter Chen wrote:
> On 24-09-20 17:40:54, Xu Yang wrote:
> > As per USBSTS register description about UEI:
> > 
> >   When completion of a USB transaction results in an error condition, this
> >   bit is set by the Host/Device Controller. This bit is set along with the
> >   USBINT bit, if the TD on which the error interrupt occurred also had its
> >   interrupt on complete (IOC) bit set.
> > 
> > UI is set only when IOC set. Add checking UEI to fix miss call
> > isr_tr_complete_handler() when IOC have not set and transfer error happen.
> > 
> > Fixes: 26c696c678c4 ("USB: Chipidea: rename struct ci13xxx variables from udc to ci")
> > Cc: stable@vger.kernel.org
> > Acked-by: Peter Chen <peter.chen@kernel.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Since this driver has used more than ten years for many vendors, I am
> not sure if will affect others or not. Please do not CC stable tree, or
> send it to stable tree when this patch at master more than half an year
> without no one report issue.

Okay. I'm going to remove fix tag and stable maillist in v3.

Thanks,
Xu Yang

