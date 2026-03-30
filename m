Return-Path: <linux-usb+bounces-35650-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN5vOtNBymky7AUAu9opvQ
	(envelope-from <linux-usb+bounces-35650-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:26:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686D358299
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58D13303A871
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4143AEF27;
	Mon, 30 Mar 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ebm+ncgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870CA3822BA;
	Mon, 30 Mar 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862475; cv=fail; b=jd4wbQ1jsw4Klz/XALnh52uIXg2rbrWlaTPI2fS7du8GPLCg+yIUOfs6PWzBksxXyh+6dttv+GkurZMCqCh3+iT8ObXUak+sM9n5B/xQABLKJsI1wO770VOifvc9D5ZtnqHp6QNlTEU5wFoGjmDnp4JDKi8aiVxcfFpUV1TE/mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862475; c=relaxed/simple;
	bh=bzqNFYE2aZY8UIyoqw/SkipZKYVvS4eZMNwVAr8yYfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b+vat9n4i9f8r2lS5zqUNOyXrQQzWkf9q03QaougpUNFAX6tM+ryzk6k/a7tFeizWpIke+dPvNwtNc7GXAIrOhdFqAc/l0pSrF/SFMwm7T32gLBIEUtpOnO01VRKAqeliJ/ON00jWZngHirNpXpzPREjhIJL7rgJ7cQL7ePHHwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ebm+ncgZ; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWMWS9nNmXHqcGdY9HXuUIEykHXoF/HNBog55dV+OwCRQmCzuqRxOvmP1IqBOu0xW3J2N08aFlGBLLuwJSMHEr0nc46Codx1hLmBTkIut8uNooSf1Zy+yqo+XjAmYgL5qKrpPZ9iRSc7f0N5tOwb4Nr6V5kCOqmf801wkDKmeYI4qXn6m6FykMAuPg/vCoBAiwTq5yuNjuzEIxMJs6YmyD9i/PzS8RZ4u6Ns5lFFkZjcdAua0kT4XpOVealNJ/VOtZ+V8FCQHX3MKs/zpMzqmXzsMyRMnjnvSxm1aQa0Zz7MhjVsSq6WlM8g9UyNuUbSu65ePIINx1EMZFcWXJH3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWbKxUKKOeN0LIdSZwEZcfZsxEO71cyEjhbMf/J4ywA=;
 b=ibxGtw+KzmG8KTBTnzgiTsNSn9IyegIgivF3VXXF7a81uztFbE9ZKo0tFD0yM6rvAF/m5E/TJIgA82O+VbjA+34wTY119Vs9V3WDiY4N3y84acNuoXvSsSEU8/oGjBYBlzMf59bGdjICc1k7xgs9ToG2rBNSXhznv7RlQRjRl1j9X5Dylwg3zS8lKrt6dr/kb/3S03c3Th4QauxFt2JNeOBu0gAjZfsDsiELnJRKOTiB9ae62qckVH0CAp/czQrArDPjcQYsLnvYTNbouVcu2z1vBTScL2kSXCPckgr7vSQGlpiTIYWMb8bzbhvwBQWfVj4sBkwQ+G1tHh5/IxEp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWbKxUKKOeN0LIdSZwEZcfZsxEO71cyEjhbMf/J4ywA=;
 b=ebm+ncgZSLzrCPsxZ9zrKnuLgas2Mwbq09l3IBN8QoV/3JuUG0/vvRUX9gwTOUIate1sz+hCEnWyCnIcfzVbq1Nx7BmKrInlizgcvwIYU0xnglN7XadFQ3grU5Gq7gU5Sp6fWO55FBKPd9Bx84V5b73Z8L8nMayCF40rq+nmL0t5ToF/JfzM3Yn3y7EDxOHWgYdCdq5bzepA4/kmGKsXWYaSHmOia17KDF3TPS7ZkCjQMvMaT6KytX/zhc0M39HesN5Tg1rsBQlk80plVHij9b5coElZn/s6YkTeUt7YAggjRcZQnER3ZdBSvXyX1+LS/BjR0fnQh+HcUBQBjGYxQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AMCPR04MB12670.eurprd04.prod.outlook.com (2603:10a6:20b:76d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:21:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:21:11 +0000
Date: Mon, 30 Mar 2026 17:13:18 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: chipidea: core: fix device mode not work in
 non-lpm
Message-ID: <hv47oqihf2o3udmmiz2vaafy3cyr5rbyfxbacfjp2y5663rv3o@sf5uidglgwlg>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
 <acOKAeNKWT86veM+@nchen-desktop>
 <7n6s3luk32sk36y47u6axedhysnrrin3radc7mgxh2pjzwdzv6@v3yu3tg4moiq>
 <acoiuow+HrDQTBKz@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acoiuow+HrDQTBKz@nchen-desktop>
X-ClientProxiedBy: FR4P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AMCPR04MB12670:EE_
X-MS-Office365-Filtering-Correlation-Id: 5655b48d-616e-40a9-f829-08de8e3daf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AXPuAfjevAecwzBfoOTPbxTRXT9vudBBPkydKEq+3HTyNOoE78NQBzXMfJ3QJnOtXa5J53HgoxCLggFXGpuqw99V8fBo5ZNr/5zNjaW3OXwrRVs+PDqr6BZ41nj3EzqmzAXZJqe67uH9Dd9PHSXvFWN8WuUwWf3SloCu3P07sCRbo9VWbUOuxv0LGlYF7GaO/9xGc/zHcbxG0NfS19tkOwINLCUWlTp/PLahcqxFCuv+7/7vqKjjTVhDHyO1qT+en6j54YP1jBU+/GgmTtCZYUAoQssoAlF3e/ALZ5DSzF3xI/cpU2AsihpsWsfhn6gKpgJ9tSmZ53QSCd0A+6JuDlsuOeC/57tbINY+GrSnSHb5rXiXVSKm+sCP4OrHRErQsazTrNdXuN32qNKfyiGebBEcKUSeJb+4wSW47eP1yNM/KCgdNXO6OrgSwbOI9Epp96RjF8BIOuW3YgElMSgxTpAxHDMjYkiZNGYwltLRt5EybAxJMSRaaJp26AV8X7ukNYnKtGTKCB3Q1Pqznck1w354OQuTzSDQ5zUaFMe7zlOVM0jN2w2o9ltw+P0X49xSVcTj0rYw8y7TbLR8B0wmTDU8/9b/UIFaSG7Xhsgh5IOij/bkVm19j/FhNxIWFs0tFW2OHc3FwasCnc/R5Ru5H5jvgVokS67YHrGOqzK4pfqe1hWUMd3iGBsN7LMpQu0pgzDq34nt9KddlSDris3pnEvOUZI6d4JxWcdM51Klfz6f4aHZsMwRSyvfZCkpkVOty0XtrFDm/4+1j29Zrh2Tv9lUCSMqfL94w1WrzDdxCfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LuvlT5W0+SSu7KrsEPoap6y4rTh8KzPmVMIMaN/+xIiTO7pEkb5XW8M1Wimx?=
 =?us-ascii?Q?CJFCMaueJsMG8R+uy9wBMPl1Q7IPTvaPgYCySPErLFLCDEBQeEvl69HJvenE?=
 =?us-ascii?Q?DPOGYg38RJf14rPobVMI8d/menU9HvXrD9On0s35quj5YdIJIyisInjMfRlV?=
 =?us-ascii?Q?tlCqrb3dsn2zDYh25vTHmyTtoFpVvRiq42SKFUAVyIXohb8IaY3BERh7j3ri?=
 =?us-ascii?Q?JbyjTWcuk0y8horyIRaB33SJF9Hybr6x17cviuDOU+1dQmmRocv+EO7dpaJx?=
 =?us-ascii?Q?iGgt1yhkVpUUxlD0WhPiEksgPkdorRT/QfOjZx7sHMUcWjb74NRXsrdMKut6?=
 =?us-ascii?Q?9Mj6UZOahpiVU24xlX10tuMB7Uqcw7S7RNZU09W6hAViZAz0edBmEB8j6j1P?=
 =?us-ascii?Q?gO9/0G6v4vlpUTlUpYZu6JVoJgS3J5yPP+VIQxMNq8HCDyknB7I8uKRitBcF?=
 =?us-ascii?Q?90b0YHsaic/iOn+79NMM0A8QnIsRddSY49VYTARWvsjrIYb+WDfP7nABDErt?=
 =?us-ascii?Q?P9wAhRN6SXUwxuSx9BKDr7/1Nd54IaDMzf9YvF7SM2vZLQCi3YWE2lA/tbJR?=
 =?us-ascii?Q?Y6eWLHgCK1PzYCe/fHkjoUMRHHxzYJXqOY9pVKqDst/7ARwWgwmrSsnwESq5?=
 =?us-ascii?Q?TFjGmvcIE7zU1Y5wlWYn2Nc0D9UORdYEghe9HuXDmsCFIEH+Fjekrk4VX8qx?=
 =?us-ascii?Q?EMBwqLR7FRJYj/le2aViW9lPQ4dZpg81TD/fbquRHeI4zgJMx4KuyniWM8IK?=
 =?us-ascii?Q?k1AhZSL4q+f7/Y9lRMo1PUmmueJa+xAFn0qcC9VbzrnTaC0cPR7Tnrz9SItz?=
 =?us-ascii?Q?CiF/dRYI0JMuYa/ciH81Zh5d4LwC1eq0glqcqfUhR3OTCfBIVoFYtxHSNgvi?=
 =?us-ascii?Q?Rpovpo6hdM3CXooG7BCswcFYx9M1IGgSZYMLOsID+Kok7fCUUJiR2dmq3C7s?=
 =?us-ascii?Q?WzoA8nseBbNeoWl9AQZrHns7imlxHtWIwHHCUaquf6yY7UaqBOKbZ0IjSLTl?=
 =?us-ascii?Q?Nedsu9lDa1x77UE6M6zBL1jgPX1tQWGtWcQwy3h8b5c5PWoCqs1te62FwNk/?=
 =?us-ascii?Q?O1aAL34wxROYI0lwQq5OjI+T1XdBp4mI9DBMbToPP4vii24kRX++i/Z6FCHn?=
 =?us-ascii?Q?t080iNpweCu3SAlXSb6h70uR9jDEaZP6BrU2xsicdoCNYA5T7MUqk5RQZA1R?=
 =?us-ascii?Q?mgqmEeq6IsoYo6u7RZUp0IEJrxx+AXk9eHiqtgs5DqSISqCyX08o6zi8ZW6r?=
 =?us-ascii?Q?oRyxQDwV7zSYBPP585PX+TPJ/c599vEKLxjfV6mDzR57bbxnQCuMbOeu+ihg?=
 =?us-ascii?Q?EUZCegNUPkosKHq8bTU3WAQ3DoHQRzrLnHQbReWT0H33xrdG/c468+v/5AL5?=
 =?us-ascii?Q?w1KJXDpwDEJ2HGqGfOb4J6ijNY0Zf6CpT8KLA+UQC399UaHo0gTLvG0JOo9v?=
 =?us-ascii?Q?IjIN/wwCk4IqOsHrcLGVxzqqK41j/hNStEN48ufa8rMuYIIB+zbYTdbZREhz?=
 =?us-ascii?Q?ssvIBEUWNuN2/BKdT1mpZ/jfsIlqrzaL7yAnJNnBN5xYb3tF472w9B3lx5Cl?=
 =?us-ascii?Q?Dq5wmy7qTFAlQ3/NH7ID6fOhs7aENadjNLzMqEp7h+oRENisnZCweh/MdIJK?=
 =?us-ascii?Q?XX98ksln0IISMKLUzlMfV93vA9gPpCHcQBkjfaPWaL1EXLz4G7921bboJfjE?=
 =?us-ascii?Q?fOrIb+TyHpW6GMQ9O/3U2zbYR25qwm0zIjgfv59NwJ64p6oKiY81ZHXT4EpJ?=
 =?us-ascii?Q?WldBLhpnRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5655b48d-616e-40a9-f829-08de8e3daf04
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:21:11.6431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zdM7yB2Ma4X0yYWqaX8sPyUotP7Cflx/mjhEjoDxEuTZTMeAGfz7pAKMiFgWPliWSHAiprDOab5K59+ea+R+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12670
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35650-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6686D358299
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:14:02PM +0800, Peter Chen (CIX) wrote:
> On 26-03-27 18:54:45, Xu Yang wrote:
> > On Wed, Mar 25, 2026 at 03:08:49PM +0800, Peter Chen (CIX) wrote:
> > > On 26-03-19 17:57:15, Xu Yang wrote:
> > > > In current design, we expect 2 ci_irq() to handle ID and VBUS events in
> > > > usb role switch, like what ci_extcon_wakeup_int() does. Now we only call
> > > > ci_irq() once. However, this won't bring any issues in low power mode,
> > > > because ci_irq() just take the device out of low power mode, and then
> > > > ci_extcon_wakeup_int() will call ci_irq() twice. If the device is not in
> > > > suspend state, the device mode will not work properly because VBUS event
> > > > won'tbe handled (ID event has higher priority) at all.
> > > 
> > > %s/won'tbe/won't be
> > 
> > OK.
> > 
> > > 
> > > Is it possible change ci_irq_handler and handle both events?
> > 
> > Yes, we can change ci_irq_handler() and let it set both ci->id_event and
> > ci->b_sess_valid_event flags, then queue a ci_otg_work() to handle them
> > later. 
> > 
> > I think this just unnecessarily call ci_irq_handler() to handle lpm/non-lpm
> > case as the final path is ci_otg_work() and it will handle lpm/non-lpm case
> > by naturally calling pm_runtime_get/put_sync(), otherwise it relies on
> > ci_extcon_wakeup_int() to achieve the same purpose. 
> > 
> > Both methods work for me, may I know which one do you prefer? :)
> 
> My main concerns are below code, and it may confuse the reader.
> 
> ci->id_event = true;
> ci->b_sess_valid_event = true;
> 
> I may prefer the first option, it is easy to understand.

OK. Thanks for your suggestion. I will rework the patch later.

Best Regards,
Xu Yang

