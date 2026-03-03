Return-Path: <linux-usb+bounces-33919-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL80OHQDp2k7bgAAu9opvQ
	(envelope-from <linux-usb+bounces-33919-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:51:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FD1F2F38
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700FB305DD54
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 15:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA644921A2;
	Tue,  3 Mar 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W7S2aF0f"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DD492196;
	Tue,  3 Mar 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552974; cv=fail; b=mHAiUe1H70F4Ak0oBvQCVpJNiPWQdSJJTlexiy4HEx3ZqZV5WE+p0BwzyR7iaAN2ha3c1uz/xrknk+zqfq68lSiN0GAc1f1t3ywiQ4U0i1pz3ECXmPHGvGrRWjciXn6lxIH++juOnwrm5S33XgDr2w7lrCnDE08pjZdCjEG9S7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552974; c=relaxed/simple;
	bh=SCyBe3gIHNLeGeXxTXUkJ5k3mZklBfKz5hXUXuYFCRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SJGhJJl4gtzX/36BR6dIM3gGyXSWhvnMVc63mxiwhrJ/WXDrmDLrzKzxKRd0MAR1VRRzjh+GcHsESTvtf+Cs3Ke3pG/MMXLBorzLRp+usfzGpZZCT0pibV47seVoUm2ScqOudJOkEW9K3DbBK0G1QB4+8u/4XDjGjkiitEcMGwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W7S2aF0f; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYB1YwLAe3RJNtdaEvdtt0xm3skn9YIbI+dBUS/epeRYT7ApiUyWedZaIkRpNb2yr9AOn5r56WjIPvSUxphFtdhduSI4lctS63Ka/qKzOYy7KpvCMn1MnirWeo7ZTV0nA3E7j2L1jrZKZdp4/RdOuGYbdYITNQoY54P0Qo5JX0TJrFzpGOInZZW5bvhtJXUToZo+Ljh85v3//XtGziPfLZUg4xgY2EM6ympJgKfgDYszROdqGYtT7msMyDjMyB7EbAuX0WuEtqf0Jpqa9Zwsi88kBTo5hXNiJZKehm93gkNeyS0gDOs9y1d+ZFGtiubAHDAu0N/V1Mzyq9Kj/7GSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecY6Wk3vqRuZ944d3EHq2brxcHaJTkQOttVB3Sb/dE=;
 b=vTEMJTvgulM+h1UQh1wcIDmsnfnwnX28pHe+VkCijROfqF1+ex6URj4ZCkRVQ/BjtiIdOoikymuqzFzoNUotqN/5ttGDmVSPYnydd42QXFrMQsVWxoOGcAZpVOAECQ5wcnRCHlGXsEXmpIDKLBA9BYGT0Xgg3UJSL1EuintgbrHoFlRPTyReNazbfY/reDFOWbR50Kd/6RN0j1DTzwx/qLSPJ9e6O3MF4QAKB+0UdT+70nqflcfgAQQUz7ugBxv2zXvJ3dwGylEUvSRgM3kw6KeXpwGmoKO6ofDslCGaKj/EeWK3HsDSGY1s+94VqUaROcKaeJugvwOhrrwXgIAG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CecY6Wk3vqRuZ944d3EHq2brxcHaJTkQOttVB3Sb/dE=;
 b=W7S2aF0fIcLbazAWgSUxa4U5KqWJnu5InIzN2ob+nEL+/4S/+la6KHRjIy71Ya8V/QIqPyTOpeFwx42FT0tPqY1OICiD7hN+/vXziX/Ht6EcAxP5HDPos0UtonQJLPGKHuuVR24t27l1071i5dPUR7+5JED+LJvr6gBxvSU/oJ7SmiK1PWhbFywFpAP1GeXMizNhw2ICaq8JMrPu94j0DcrU0iofTHSevAB2+N9C96ViduCJWTIO0dToTmCbhw7Kci0ooNflMPKcF80EcbNK7h4cXSSLE/jCncc6dLuGjTjtW8N0Qwq+WIWrys1htYezwmhr+V8guUya55aDCQL7YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 15:49:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:49:29 +0000
Date: Tue, 3 Mar 2026 10:49:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: add '*'  for @needs_full_reinit comment
Message-ID: <aacDAgN-5bXp51ZO@lizhi-Precision-Tower-5810>
References: <20260303021559.4021177-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303021559.4021177-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 048a7c0a-9e5f-47de-1c54-08de793c74b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	IUbfxcQ5SsxOEK3w/sJhrjV8o4zkDwlE3KSwxk4eUY6QjQFFZ0Qo7EkBwgoSb8SmRoxtVuTwqvH+3ueJlTIOsnJ2vqFcE495vQzHEoF1UynjIDu5cAcv+Z9BXEA0lDedqFCoOW2QSRe/8o+JRZLCWH4fbUvEJ//CYxmh1fZg8Hz4E0A5PLP3HLQt7zjZbPoU/bjLIGsFo3/4vBDyDFfT0OG816165MDdDoS1ncVeLCK+1NH6G5MZPKW7Z+updiGnHaXIzqSVMJZ8MXSOUB6c0hPO4n8sDpjUe5Mv+FLQ+YmfcdObj7jX6WZjDnu96DI1/EsWOOdHXb8D9S6ck3QaUQS6e3U5ia2q+9LD//HveZO0dDLggxxBQzwAczbBq03BgUA3AV4G/wkf2UDV6hz7mv/uES00CE2o4xvHUpWvpVU8dEOGgxBfn9cFoRV/Z9gMCr643ZHwRuefetmLiBgXJCn9smZi+DoNkCHifp+ynDL5abwLsxEi+UyEQ6P05MHwNmcrlOnoHLY6+j2W+1tw9wqJr9llEzOL2Exzam/jc9x9HAWmBWV/pIqNHiKxYsX/7TcRNlUOL7A6gpejDpJEubdv3eXHGgaMXzLrzwGcnHpaSF5QxEJCbbHTPaYfxBw++fYlPD1PVYUtFdZiePGpm+DhdTW7K9nWGVToWTm3nwXtT45RC7e1Ek4eT0cNKCUMd587n9jEoIXTpN3m8QhzRuQir58nIbI6SJyuN5zfdLMwfXlrbROirKiQiMjr2Rykm2ChtWzsfleVCTcO67nNLUSC/U3qHh/aNgZOCYtBzEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNo7GyEf5osXXZUx5nF9A6lhTae8ibO4zun76mp0hTSC0FhMzQxOYZ77OHEO?=
 =?us-ascii?Q?sCsZIcDZ8nBKY1gsDQmsxkLSimVSq+h4PywBQTayfEOJIJgSvhfU9T5pSppw?=
 =?us-ascii?Q?8iRWMf1Lxw8uU4CI2dj72fLJJR0awLPMV0b5pvYOhdNNXTooxIve/h6KTpwM?=
 =?us-ascii?Q?BtZIc5GmOPVyvmGogJhpL3NQL6UHm8KiVsY/aL4+RzqP+cmFW1k5rYOOAJnw?=
 =?us-ascii?Q?5D7/dCsmt8TF/j56il//1Z8iS76PVCGlHfQR5x//DiHa926ZeJ5mBngskRAX?=
 =?us-ascii?Q?xMHQoH1TBsf7nJuSdwg/tczNhqU/mkk1l/Q/NLy6DYgxcxRAp+HMnMylutU1?=
 =?us-ascii?Q?qAIJVqF9s081FnnTvSW4vW1oLz5lJga2UgKva5k9qGIxlBVtkkCXVZVgUExM?=
 =?us-ascii?Q?gzGiKLsH0Pim5QMOnVOZclWWV6wUELGNyj3d5rshKrKdGp6c1rI7+h++c2oO?=
 =?us-ascii?Q?6zsfO8oLkTO0wlUE5gTIok5VN1bBZJyhcaf5e0GofvOoLdlpiib9+7IZ0jqS?=
 =?us-ascii?Q?PtISKQM3Sv42WoSNY+bkPoR9hC/wam0su2DHY2N8vk7CibIQA1NXHDwEIWI7?=
 =?us-ascii?Q?BdHRdsRpcjrffugXHX6Q6XaAzlrvfNYIV6szSni0E1otYz82efJqxAEaeLA4?=
 =?us-ascii?Q?yN80asG6700Nh9jiG+rYdjNEw6yPTPSWBrpnEzu/wqkLP+UhnSdKtC91B7Iz?=
 =?us-ascii?Q?h+pJ7IBZVt0sfxOr+B9npOelslZN34eGgPc4g/LW2D3NTANwR1OyiOf0FdU4?=
 =?us-ascii?Q?wfjxLOiLDR4v3Q5DVvP1yNdQ8UGHqKqp7RjSCyQY0mt0MT0qbqYfiBewweX7?=
 =?us-ascii?Q?4RlEkvO9jVbLY0vmZbzMKidxnUC0Jk/QNccqdOQIGqkgOXCiWnu4AUv/X27E?=
 =?us-ascii?Q?HkFT8MAmhMVozbzgmUL1LGlH/kWKU5M8bH1mg5HV+QYXq15VHeYJqfuUCub/?=
 =?us-ascii?Q?MWnQ225+v3IlAqv9F7iIWJ/rjyMbVZx1XW4zQk13QMIxcdSYURhIwHmue68v?=
 =?us-ascii?Q?LKw5Ds7XHSczX0mO0+xLDpooykacLCLMKOf3hdDhENrvmTu7P3D2OvXopJNm?=
 =?us-ascii?Q?b9X1YVDQPa0N6w202XMvAKvEJOnYy90+E9vGYd/yQJL5qg045ERGNoaY+nML?=
 =?us-ascii?Q?t0egQkU+3zWdgyQNf1D/p6xmplhiVc4zA92deAw7YpkT6WwDz3lGJBRWoVlO?=
 =?us-ascii?Q?AS15eDCkoFsWvBdm5+qJEiwCZCJZiNe8F9/k+RpTjnYeDV1oawnYhXp21S0h?=
 =?us-ascii?Q?e9C3YRzk0erl10tIgLUte1kYVy6BqNVKaOq0KrLzIgpkqrYd3FoGFHdeybKi?=
 =?us-ascii?Q?UnZ3roOZdiRQftIQomoaMG6Obx1qBgCBcmQ5LmMm1mm+eJrg+8COvoUyPD2u?=
 =?us-ascii?Q?DBunYxOXOXoaYsquK9PjAg0Ff0m6TU9avMSk+lIQ7W+4BdXGJe9fq+vsjMvA?=
 =?us-ascii?Q?SfqJstUm/l7RqlCIwXJcsbTOheW46+SgZdgW5CF6icALXJ3VoOnogqwbnKxK?=
 =?us-ascii?Q?+1ZwqdYrTFZn8CIK5Vne+OGUki95nEtsHte/mCt6XGONV5S30yjZQRGKueTb?=
 =?us-ascii?Q?zUQD/1fcpMK4Y6hkuIgHsiy73GlJTdPA+lWHLTDQN5TV2BT6pt982eqH9Sxp?=
 =?us-ascii?Q?hHBv8aXgeCWogp7lksMAkdtvhOKsxG/hRAlmq57YgIqikHsSCm18Miw/d7t/?=
 =?us-ascii?Q?oIPWrbxetclsJlPk/KJFJH0yAHq8rH30jgyMotq02OzvHo74c3OJs3owM00U?=
 =?us-ascii?Q?JVxuMTA/BA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048a7c0a-9e5f-47de-1c54-08de793c74b0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:49:29.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm/mGTjAH/tUjlp9FFecP7U4jU5vqswGGmZHdnK6IwwBVmVoZfN7QFy1AnALU/eI4govtdHmjwtVqk1D7FDJGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-Rspamd-Queue-Id: 634FD1F2F38
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33919-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:15:58AM +0800, Xu Yang wrote:
> Fix a comment codestyle of needs_full_reinit.

Fix kernel-doc issue?

Frank

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/dwc3/core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 67bcc8dccc89..7adb8e74bd84 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1120,7 +1120,7 @@ struct dwc3_glue_ops {
>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
>   * @needs_full_reinit: set to indicate the core may lose power and need full
> -			initialization during system pm
> + *			initialization during system pm
>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> --
> 2.34.1
>

