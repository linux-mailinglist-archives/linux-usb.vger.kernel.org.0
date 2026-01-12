Return-Path: <linux-usb+bounces-32179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D558D11A18
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5600F30071B9
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E82279DC2;
	Mon, 12 Jan 2026 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sq4Y2dIM"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369EA26F46E;
	Mon, 12 Jan 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211664; cv=fail; b=oB5D2wak51M7SvmGpNiFBcZnCGEVv9UjqK5hXxSUnDpNGKc6BzJSRaTypPcGORUAD4Mg95mMxKYnd3USOlqxfrrV9UsOSE4SFGqUzp3TTt6LBVz27R/DHkViCDEA0ePw7koVrHUXRHAL4VAbjkpkoWGvk8Hc12Tagg9ONY0fnjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211664; c=relaxed/simple;
	bh=iTGh/L2kyLp6JfFfR0GppoayaKmd0PARIva8wdp/UxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ekhiz2WSES0RYOHS/gJ1gFRB1rGFohuUgQ2y/+xkGeofqzEHhsxJf7qYMczvPEpBDdg/LDZTUk6RQFTzVBa7cdEqS/XQhtCNCKUt2c11S69QwT0oIB9zbnI2Kwa3RoAIat8c5ogLpC3B7mipMZfkvHqMi7u+8cpPKmn7eDxOXtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sq4Y2dIM; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO8UokQ7fQJ17frLEoqQxIWlDfzIPFxjAs1jpz07hHmWCKdyJ/z0AynfXXu5NqvqYio83FBLg0YwvohJ9HTbxnqviRAy3ZdX9AIKtGHOgxSrSGHZFArxjaNh1wL8dlTthsrFipB7o+0MoeE7OO1dFUBmBoBjst0YOk3IeGb2EWoDENZz4gzOxjeh2KL4ABiMkidajcJGiqNkmVqGSuAi5amxCXf1wPYjYyp0Fjs+ExLpSGl/+NgseEUFPrNhXH/9k8BHaHApmx5M8NGmUzo37VFz6jTVLrVW9JO/Z9SB9ajMOA/NlHdmW69gIT03g+Tac3ASfOtAAJWMSyHWEA384A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJONoZGf716teujry+X/2i8FABD/o3TSYWbyhJ6fK4Y=;
 b=nqy3zVUKIejD/xQJE4dYjaxwwqI5Oa0Z4nPyPd9VExTuPUqzo/3qCk/S64aOu8XxxB9RqRAsmsYbAir1UhCvQCVzCGrdfQaFs79YT5L9lHCeu9FCCvEhneVolucjYbrG6zEEARMOnsV+AiNR9rk60YsRiiQm0iUoRDxXz6jBjb3ud91Mom4RTMkAu59/8GutVIHQhSXI9OEDyyQJLac3ji118OkU7StVcPXxxVDf8bPDR1wdYk5Mv0ayDpOoaQqDkA8fezmP2wekYxtku7Nj6OdTYTI/s69OaTQsMYE14OTKb4OwurOOxj1LsSKXg3rkDjTyruhPR9vaUGQKbBGk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJONoZGf716teujry+X/2i8FABD/o3TSYWbyhJ6fK4Y=;
 b=Sq4Y2dIMhJGl5JU2ofh8Zt0qwipJR0Nfl/J5TRp54ZvdpbibZvEC2TD+zUdh3UB1Egx9Co6IyHnPFCt98W9PI7FU/a8ntF1m20Px4bNS7b+SntZzstYPEH0TTZ1TW9vEWDzBPi/7gXZjlhvv6lzhT92PaOom2HUs2t2c50d0LPlIMgq9ROVmMsL3yzMPe6I7TXwZbTVMbvIHG1JWbKqhmDGdl8RP7mLvDCQWpgAR1KvDWrBxZF+s49+ov2enMNBOklDSNSRXkXG1Ugp71fKe5Rjp4A/MUJIFpe98cwdrP3tim2Ijjpzr9uQ0/Oln24e0603tKPvYm24WkY3d9E30dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8396.eurprd04.prod.outlook.com (2603:10a6:10:24a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:54:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 09:54:18 +0000
Date: Mon, 12 Jan 2026 17:47:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: gadget: uvc: improve error handling in
 uvcg_video_init()
Message-ID: <xyn6ihw6wkh76jwt5o2pgibcpuqgwshizngxa3igzoiiv7irfm@e2e7o7rv3hcq>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
 <20260108-uvc-gadget-fix-patch-v1-3-8b571e5033cc@nxp.com>
 <aV/WeW9ufsmAbZSY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV/WeW9ufsmAbZSY@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d67d8f8-595a-45b3-5984-08de51c08d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GyCGvTGA4IzL5D3YwVou4+Az/9OgJ+czwSButUr7nH991iDdTccCgtmyEF5F?=
 =?us-ascii?Q?1lDoSQUewB1h1ojCp/pY83E5+rqEBePfS0+hHUZrVw+CfKgYF2B1oTtsyjy1?=
 =?us-ascii?Q?qEdTvjhd96Qe6M+cUJAxuU+85nWpQ8E5Qbn6gTOlul3hak1IBC3kSqh5PLA6?=
 =?us-ascii?Q?gSJMCxYXZdwSvizC3XfWlxsM4vZKQOtidHnEg1VWkugxGYhV1a4Jg0jS0poK?=
 =?us-ascii?Q?wuUkFbxc6wi0Ml1FhpZ9f8ecVZK61QZP2ab2AGXd0wOs8PgAUyrwbaPH2nHX?=
 =?us-ascii?Q?FgDyaEst7Iaca7SYdcXiVw0oivrDLeMoBA75aT3fw+wFvMgX+LKSmkqfhmbM?=
 =?us-ascii?Q?XkcIT1x1+ShcrmquZN67JLu7RABbWk6W4j6XfEM8FW5c45rJuxK/hMeVFU8U?=
 =?us-ascii?Q?W6+ttUp1Vuu+tYIA50cDLGXxx5v264OC2WURl8jjVuFJUIqYFOxZ1clNCaDY?=
 =?us-ascii?Q?LUFS+lBauarVE+DqzT5MEVNNHsxPODkiuEQ0puhmoTYfO7vy2CL670biLELr?=
 =?us-ascii?Q?72X3u45tHndAzyzPDZdyUCO9I0Lyb5NmhQcPTgwDsasZvrXlQ8ln0+MQ9sMF?=
 =?us-ascii?Q?kDqUptGycF4iJSubIUIP0eT+MsihLrDTXx7fRHOCSadCKUu1CLiCMhZ2ULjo?=
 =?us-ascii?Q?q1oS08fqsOQEvkXmmtulvmVzT2o7SbbLW4Ql0lgSyl8rpUQwV6yaI5pqRq5C?=
 =?us-ascii?Q?65LovjAMFlYyjnodBYRnc66I1q0tYr36iX57uXH/Ad/H76XVqTR00jUDWowZ?=
 =?us-ascii?Q?MK1k3jsr7JMw0XGNQYlf2hmiKNYsPye2iTiJO1IamkfE+9eqMiSE1X0VRFh/?=
 =?us-ascii?Q?MeGIl/LHfOzSraKFgKbDuSXmnyKar/VIL1Sw518Sfw7Zq4GrCvIL0B8aeR+i?=
 =?us-ascii?Q?IbWxTftXJcgl0eIQ1M7PAR1Uwqa/Bh/Tqy1ikryA2JGEro0sJm78f3CY+CRN?=
 =?us-ascii?Q?6hmutZEcEK0SRE7/Bo/qXLEP3n5OhLWT7Mhh32V+fRSGVP/sVnK1ZyJoauGF?=
 =?us-ascii?Q?TZhM758pTuQ2YiEpZJn+Igk9watASA3L1D3MBWEPTUAam30a4FNJqo5Sm92G?=
 =?us-ascii?Q?5HUkC3uT0qoJ5DENHumNKTz9ubeRuI2JzzaUoGepibDFsrABwbms1wxpVGV0?=
 =?us-ascii?Q?Lwm3/lE/MhArF3bJelr9L/4RmTD56mXT3qbCQnithgID8uG6z2/QOjGXEM/D?=
 =?us-ascii?Q?CS0IPgx9a3IOm/ywpPeolNQUtN5yI9c3xGdjeJ1w3SmJWgFL2N2m95w3oiEN?=
 =?us-ascii?Q?S8Wu6pLxggkwMGrwlEYLXlEF8rqeQgAjS5yptNp22lK909b8rklPPdHq6oL8?=
 =?us-ascii?Q?6bHJ9PX2zV6h4ihw1wOXaIRoQaeZFzknwyLe1eBgvme58bYfDH0RyKrW4pG8?=
 =?us-ascii?Q?2VB3WD4U7zWugHGG5u3Ah05OSOspYnL8BsRte3GO4n1qewanHG+PBPojv9Ql?=
 =?us-ascii?Q?vbXmsPvzJx8bTVvrk3DUU5IwQX/6osOMIefiAKU9IUZQe9uZhAKGh/vMvKcx?=
 =?us-ascii?Q?IkrDiBY2fXBDLsFFgbPZohk53ZMdLOdMcT2g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tvBZO158D6TBsjbcD9DrFLvjfz4lxPZwZze+fa4GVRACbONin0T3rb7kuCoz?=
 =?us-ascii?Q?IyJEDF2ojxf6SBQvbZeF+jhF899iZ4JAC/CZ+RMy3RYux66WMHctWyOUTgWx?=
 =?us-ascii?Q?lCWh0jD6KNg3zKuSs1GYXHTdk7hSTlpYuXjEudbM2WB/Px/ERKZjxxuZQVTj?=
 =?us-ascii?Q?l4bFF5d+6d0N6EFcDXbbTyElaXjmgF/y90sE4h9qEahk2SWZDSLAaUrMfSnO?=
 =?us-ascii?Q?uuY5UW4KCwMqHUPcrHcJGgcfIHDq0beb0O6JsZfcPDFPRC5MqVrHmi+d7wlm?=
 =?us-ascii?Q?NgsmOZkr2mrUQaIHBLuWvTJYgBaZ9K5k8fCky3kHktqbaxEXJtDXQt9zl4DC?=
 =?us-ascii?Q?6X2Y+yaHBTc2Ereaf6HlDO7INNqDomxAa6mHTjlYFhWiozyQfJKWZJ+0BLi5?=
 =?us-ascii?Q?JWGCvJshjgqbhyyz0CZ5olMaReL+RzXWDxrHgNcObF2mOn2T8XEPweSCMWLB?=
 =?us-ascii?Q?PpPZG9O8mTQShl7RJu4n0Hk8CQ8vbzqrZGQyp4IyLxgw1hYgW4S6aRVo3cD9?=
 =?us-ascii?Q?HskBqs9nKd3Hn8I/Uq7k4s/mbFRds18T1DbgHrRTmDJY1KhhFYy+fRoEGbzL?=
 =?us-ascii?Q?tzvCSrrrGNNMUGq4SWmy/lG4r0wACcSljXb2/huotQe7YF4KtCmdEPHvJR2R?=
 =?us-ascii?Q?pBKsxKHVi+ELwVZGF4R1GeS1Qr/8C3cQNqa9BkOP4lVmivd5b/wgiWcYEqt6?=
 =?us-ascii?Q?iNeLAgJn/ua3EGW8kI/kJyxt7CJwrV3mY82/D3fio2qIiGjuwZSmWiVJrGjz?=
 =?us-ascii?Q?4kuGJQBRdZjAR3rW7j75Mbt6dpowJL4K4bSRr961F+fEEgyABNRgXSgmoy5s?=
 =?us-ascii?Q?mUjbOR9Hl310gA39oAgLzVHZlO/LkmLgjUsrWyD17tbDGvAeanv1//il2rIa?=
 =?us-ascii?Q?PvQe+ISit0IOTayhO0TzoJAvyLkHL0alDjdlAKWKbV9Yn0PwaJdy2WKCa7xZ?=
 =?us-ascii?Q?k2eHyQPfk+9IL7tFBN8vd40l0bGz9BGI0YsKsTfimfkKLFogumHpg9q9tmYw?=
 =?us-ascii?Q?gjIKTVqq/dqdXNhFmvTNEr4H7JqBEYZBzxUCmA494Ls1ObrRbRGyDwQnVS99?=
 =?us-ascii?Q?o6a+1Um2EjM4rAcIzMR/GBUZfU6mraNp64KQpsxv+6mAoatO0i3AXcirWgTX?=
 =?us-ascii?Q?xHdkyUhky9vZ1FiE9rTONZNUDw9LEKxljkpDnnGadLs4TGbX/ztryC1ZFnPY?=
 =?us-ascii?Q?8RO7yh9WJHGudlSo5+aeffaGJYrvb/3n/uV3M/WO3FgQoR9LJQeDNdVE4yuX?=
 =?us-ascii?Q?iiwTFn7eGPhi8XpFlyUz6A2lvmyLaqxMmozRqz+k+TqRPJHQ/PGU0HUjM3kN?=
 =?us-ascii?Q?qIXEaQQXlvg2v5TP+aZ9dLJSCBU7KvXGvqgvMpkHSJ4c6bImckpqlnWY7Eu1?=
 =?us-ascii?Q?pqNUqaTiwMkklmVe1pRwrjhv+IXi/Sw2ScKWtmnscjqQP432z70rbaMwAgxd?=
 =?us-ascii?Q?QmHwlKQwmBotXnx8Ttu6zQdVxVsXtzmHK+vKa3mr40k/+UcEQXWurCBdjKm0?=
 =?us-ascii?Q?HAD45NgNCTmuEjXzE5w0LD3Y4OZ4Iasu9p9A3s5N1Nina7N00KXgiNAPrj9X?=
 =?us-ascii?Q?/p5aZYzLOl6xj3E/iw7EPETzgFu5b8UlWdgOxPJ99xKl0vn7SPSSUNZMzHQq?=
 =?us-ascii?Q?BVz7PIDgvacHso0cMWwS/mwbBTHpt3oSGZ52x12TyDjaUCxkJWMfSuWnnnHO?=
 =?us-ascii?Q?tCCz+shLOBK70Vf9gV+vX7iLThr552WHH5491L9MoX7wyAlt59zXVj8bkWUV?=
 =?us-ascii?Q?akjE3HPH5g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d67d8f8-595a-45b3-5984-08de51c08d91
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:54:18.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fw+np3drWbZy/CpDBTH7imqo8Gimo7CwQzNUgKKousCJyU8tSjCq1CMQTIRE5/dbiucROODlZ3jvH60xIVXSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8396

On Thu, Jan 08, 2026 at 11:08:25AM -0500, Frank Li wrote:
> On Thu, Jan 08, 2026 at 03:43:04PM +0800, Xu Yang wrote:
> > Let uvcg_video_init() return correct code so that error can be handled
> > correctly.
> 
> usb: gadget: uvc: Return error from uvcg_queue_init()
> 
> uvcg_queue_init() may fail, but its return value is currently ignored.
> Propagate the error code from uvcg_queue_init() to correctly report
> initialization failures.

Ok. Thank you for provide a better commit message.

Thanks,
Xu Yang

