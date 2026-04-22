Return-Path: <linux-usb+bounces-36411-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F1ZD5w76GlfHQIAu9opvQ
	(envelope-from <linux-usb+bounces-36411-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 05:08:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEFD441B5B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 05:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83E9A305A240
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 03:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A228C3A2566;
	Wed, 22 Apr 2026 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ewEt8H7/"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7F39D6E8;
	Wed, 22 Apr 2026 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827169; cv=fail; b=tTvKO0A/xM818mr/XU00W1XezMebUoq6iRM4+47IzrDzRu6PnJulezJs9L6YlpgJLgvw47FpG0YmG/fFv/zhdqtcPwVy3gSk21px0ggI0GOtO0OaoJZ8XXPHqQtvSNIUp7yYHUnEH/W9vL5tuHKzyYs8/xHrHjiy8UC90hvA7xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827169; c=relaxed/simple;
	bh=mJmC2nM4rSzQmcxbzMqKT64HeZyd3sgGXRo4QxyHYLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u08zBoDYeqFjYAU2rZFnnzLNbY5ZzgEpyFaI0ccj4Sd0tiVsGVDhuxHNzC58jQHkHCrYRypKffVHA4ZJLeLpwUffUyFRX48WzzwRwF750nEoySWHK0JOLYvGrPapXbCxw5MSP5fWQ0Q3MsjX9ff/XNDmCpusa3lD9GD3JNF+tgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ewEt8H7/; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0+N9g2m7DDvgUvpbfYLyGDh/4qlZvm/xQcThz3IbvHNpfmz6bif1DRxCpLs1B3T1PVoEyBKq4L+xAoma7P5DIelxTNgiI0LlEzZgjIZduduzZf9k+fbZTX319kSN5bvdlDHuNtBpOzS6HCKVwltHBu2bOpC1+j3K8rZp3KhzhKVOfEyXA0+sXVnXs5ESqTS3d0ZoGmfn8+vQUk6VAIfpNdyxG/x7zSb+5E+MshduhkfbQPyA9EigM0UllVoOMB2bi9Faw3Yq8F1xdyyxW8B+nH5VMKXX/dHDReUyETyZGZftCen6B7p7fLXUJ65cREh9kcEpKuHPLxENMLQL59qSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taw4qR3u2gQzk/qq5U4A8OZGALBToYYcUwCBRjWFc6Q=;
 b=eOH0NJLesW5dldOtCO3ZbZnHwqd6DsQKIMop7pDen2GQev72IDMMABrT4VGmfVEdyQMJLfj3+ZCWfdCQInorppTZZz6v2HR9GbWmpKg+56244X5aKF1DX2FzYR7pjMhPcGf7HQoC0lR9CNxnFEfH8seGt9h0N65bVZX6E583d9owc0wqUn13p/6gbrpHb356si4nZONdT7/HRtdrVIqpK5Nu9kN4azSaI6l5tTsKUF/ePC6GC084bxnM/RoE7xzwQ1FydKNMv8M/pJJp47Bk5OluaHB/6xYTodd2R8qlf2qN3PHJnJMm9QoO6SUZeBgTAGDs/O0c8i6xJRAMrXTKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taw4qR3u2gQzk/qq5U4A8OZGALBToYYcUwCBRjWFc6Q=;
 b=ewEt8H7/kI4zgTSsMzkVDqP4oYFBmYIvfFTlh+AoN2AFt5tqCNEgl9pdWkrv6yYk0gbUZWOHbGajKU0oOcFWV1hU56y7PYghP36FGh8zZ69tnIqHDm0uFZSQCjckMYhsbBRhgxVDgMUfk1jfSJE+pVqN2FDOqBwmTUcFis/eV1mdSVHl6r52Z/E6AGXQMVMkIIQIdUAm/5rAIWbO6tn27hr3u89CswxUOqUWd7eHhgdIHTzrvwLYFagxyBN9WmJ/KLrS+s+TQ1P8zZX6R4RkI6t84e6F0cOv2JDCZqTA2BlRxctHv2iLIcR6nS5YyQAe7IC+tk1iWzWGDgHIv/I29Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9011.eurprd04.prod.outlook.com (2603:10a6:20b:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 03:05:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:05:57 +0000
Date: Tue, 21 Apr 2026 23:05:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/3] usb: chipidea: udc: support dynamic gadget add/remove
Message-ID: <aeg7DpI5B-Ile4hb@lizhi-Precision-Tower-5810>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
 <20260421082436.1264442-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SN6PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:805:ca::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d8e606-b964-4eef-324c-08dea01c12c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UGPVl7E+m5kx1JJ6OkmNriMkuou9u/njO2yYvCiJLI8+pGNVX15UAwYd+AEsZTh44SK2zsr6ZN/Maij/2vO5dLEA0SMpFmGzK2yBKy6IOlmRqjpnNnQhBLvaLt1mMhoRuGzI/0BQeigWRA3RXRAzV8ellYj4RLs90vgi1f6i7JkjFUtD16gPn6EY3PFfsXkjUaLoFn74K2d6Xfakc/paoAUgFjxSIcD/kQejA0jn9e2ksq1NVPuexjUA2hp4Ozhw+IBNxnbzPLmkw58lRgf+eUj2RgiJB1k6d4xhj8BLfhwEJ2Mr1GUa9SLU5wLWKGWCQU7b8u86vD+YoQcyvMXe/Ec+UrO+klI78677soYE6Y+BpFB6nU5UzlxUsj+/v0/Kg7s3kBONtTfiDACgotps8/eWLkZNOr1tomYClEO5Lxuud02OlwOpxkkCcJJEhkZ5zQW5RCSIItTOvtnkBcWzXNcdVXrT+fgVU0/D/dJPLgZGi3LQSoQ6igoxQYQciahHcnPUAa5SvMesSAufr0ojClkCVbzfX8G5kQQ4hvNmSXGwG8xrrkMG7NGLzOQzhwenurB+r2bpLBMu5CV6nV1Zrsug/O3LwIvznu7Xr91OVAm2+Jv/cZR0iQCnQyJMyp1YxHkYB8ypnWcXIi8/3JUkZ5Ry/QTDvHX+IP53ogZXU4PfPxhtHat1H71s9EGqe4n5zzOjSnjuo0AfE5bm7ZE0dnB85adigbZl9rwHchAvGdlLIJan83U1uzvjQgS7NUNqqx5eEMvKvIRS38GYJp0hIOd5w0EWHTEaMvuIbYkk/j8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyX5d8RJjmG4DoRCXaSBH0TOwEJG4jMic6GxgAfj3SlTOx03EF/19J8zpnYf?=
 =?us-ascii?Q?WUmLqFKYQqR1GuvWujQXO0hjq4NHuUOoQSkeIM2Li+gW1R7L76Qhg6sD/+Bs?=
 =?us-ascii?Q?81oRePZJ9NHozVdgo17SMdCsR+3P1PffqcLZZexej+1ZYJfvKHZdTo23l/Rw?=
 =?us-ascii?Q?SxkaprEjSiM7WodKSIlhiy0qWcy5zT+FCJHoZGxOhcGUI5EIH4U7vWoKWEOX?=
 =?us-ascii?Q?1vei6KPmLGY+1gzRTwA/0o4TJlZ54174oGjHb7+NAvWM/7OdgBZGWFoui5tu?=
 =?us-ascii?Q?3ArWQhx+COUc/uyCYvqx+HSihgo69C5CNRi5ef6ff2Fx1NMKVjjABtd23gwZ?=
 =?us-ascii?Q?NQycdG2i3AfCNmeErWDCQ2l/4emFHpNZ3ON/XhMdGJy1/qwlzU4Jbh5boHww?=
 =?us-ascii?Q?H0lKT/jztsPYqsN6uRms/sde1cVcI6NOUs54typUFAYReGM9MhUPgbMb7MU6?=
 =?us-ascii?Q?hkQHcz5jwkEsxckJpbgRTPgvsdHe78HhpLk8xEGEwTNN4PaVLvCx7HxIyFLI?=
 =?us-ascii?Q?gGO69qp3tQpNItwZFoPZK0TmEm8RdNTPkDx7JMs/7tXBhFvCZBe7ibtqu/li?=
 =?us-ascii?Q?H+3xU9rbqN2/KJOb3vGpAXPnSMw13W+TrgbW/kWWpQsyWvh1llbsxT1HdLlT?=
 =?us-ascii?Q?txlo9GcpmbyBRaNp7wcsJxrxLI9VAEfS9e9wE7WMpLXzgTIEggAia/SjmGhl?=
 =?us-ascii?Q?FYSWyc8AN0mTow91Qk0d5SzMSBJdKY5zQSUquOKNRwMTU0KZovsPEawO8Q7H?=
 =?us-ascii?Q?cLLmMnuwDg3LMbqN2ufRQiIBcWbvNn6PZPnLvTWHJC9bxyVeuHydWxvgP4gg?=
 =?us-ascii?Q?pJbUL47f8BJyVUnQmNQ0blGvTeP4fASM9KIym+mgDTacr+isu0ymZryfCO42?=
 =?us-ascii?Q?WyF1M+dqdyPpSs3H/oeaffVTBjHw7yT9U26XxCoIWRggZdSULtrcyeJldRy8?=
 =?us-ascii?Q?XhhbhoPuXYrCVkyxPkIXEvhVRuMAn99fH+MbVm4IhJkTfao6CCJ093pkjGmJ?=
 =?us-ascii?Q?br22OnmdbcstbmxzZ8d/60oEG8LOasDU7OpBFc3G0M2TEyXrTeERHJwluN53?=
 =?us-ascii?Q?/G3KVKxj0DfCLJSW9ApgnLoXqZxu4s/EHpiVaqhjw0SLme72i/8MEpONa7vb?=
 =?us-ascii?Q?+NPL90rg/3v7Z/UTj6gVOSKnzN/mwDxWIJLrMcMW/SuIE9Y8YIY/E17gpCF5?=
 =?us-ascii?Q?AgOJBASS+Y7fnyKHfbLX5vny/oYGKCcKLDSdbeVB/DY3/pQyIZceE7CNZs2M?=
 =?us-ascii?Q?tiXmAD2NCXc/+MTknLpyunN+ME758IUMnNRs1/9FlZsEJwPvDuwrHPeU9gRv?=
 =?us-ascii?Q?annMsAV6DWjJPo/1JR57VvvBiuVFRyanghcEnSlmBNYsb9icTVPzUncVpBCz?=
 =?us-ascii?Q?tzbLe94Zj5Giw1IN2s4kcVqcj47Ny9+bZUQ/WgWzW2MTXILqBb6/RhM9XkqC?=
 =?us-ascii?Q?8QpBtGynKg57xp8pLWjA6PQZdJzURUrZAWc4nXBKTAJiVthrtrW7dZvFt7D1?=
 =?us-ascii?Q?KHXlQ8fcgTKIapSgMct4WX9CzcfSP2xZ/4q+88aFl8btU5uWp3nCNAh0Pftr?=
 =?us-ascii?Q?SvyrwuKiKAhHexi9ystqa1wWgJzVBKv8DqVwGvTK+ZcUuYgMOMrR3waCdo6H?=
 =?us-ascii?Q?C5R/WAYdcizNpBA4SY8G3r9WxyIDWqMLAtUdKTjQ7bkp22oT4/puGXE352zo?=
 =?us-ascii?Q?eSHZBFAPXCbJyXqfctynNwfaGxlILkdozbBiX8Q9LOKWiidyViCOMt3rzeDr?=
 =?us-ascii?Q?84880+GEhg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d8e606-b964-4eef-324c-08dea01c12c4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:05:57.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSPs6Hl7qtyAWJ0WZA3GMWcrhEo2O096L4KVNguyXQNtncYRnhjFJELHnWmoOmMpeXmXG6EdEImo0Ft3BaYmig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9011
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36411-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CAEFD441B5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 04:24:35PM +0800, Xu Yang wrote:
> When the device is connected and enumerated by the host, switching the
> role from device to host leaves an asynchronous vbus_event_work() to be
> run. This can affect EHCI host controller initialization process.

An asynchronous vbus_event_work() keep running when switch the role from
device to host. This affects EHCI host controller initialization.

>
> If vbus_event_work() runs after ehci_run() sets USBCMD.RUNSTOP bit, then
> RUNSTOP bit will be cleared. As a result, the host controller fails to
> operate.

USBCMD.RUNSTOP bit is set at ehci_run() and cleared by following
vbus_event_work() if bus_event_work() run after ehci_run().

>
> The log below shows what happens:
>
> [   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
> [   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
> [   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
> [   87.955658] ci_hdrc ci_hdrc.0: startup error -110
> [   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
>
> The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
> pull down data line but it doesn't guarantee that this operation has
> completed before the host controller starts running.

but it don't wait for completion before host controller starts running.

>
> Now UDC core can properly delete usb gadget device and make sure that vbus
> work is cancelled or completed after usb_del_gadget_udc() is returned. But
> the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
> avoid above issue,
...
> let the gadget device add/remove dynamically during USB
> role switching.

add/remove the gadget device dynamically during USB role switching.

>
> To support dynamic gadget add/remove, this firstly clear ci->gadget and
> ci->ci_hw_ep memory so the driver won't access stale data when initialize
> and reuse these data structures again. Secondly, this assign udc_start()
> and udc_stop() to rdrv->start and rdrv->stop, meanwhile it removes
> udc_id_switch_for_device() and udc_id_switch_for_host(). The things in
> them also properly be merged to udc_start()/udc_stop().

To support dynamic gadget add/remove, do below steps:
  - clear ci->gadget and ci->gadget at initialization.
  - assign udc_[start|stop]() to rdrv->[start|stop] instead of
udc_id_switch_for_[device|host]() because it already did in
udc_[start|stop]()

>
> Since ci_hdrc_gadget_init() doesn't add gadget anymore, this also adjust
> the order of ci_handle_vbus_change() and ci_role_start(), otherwise, NULL
> pointer will be met.

Adjust the order ci_handle_vbus_change() and ci_role_start() to avoid NULL
pointer reference since ci_hdrc_gadget_init() doesn't add gadget anymore.

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/core.c | 11 +++----
>  drivers/usb/chipidea/udc.c  | 65 +++++++++++++++++++------------------
>  2 files changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 7cfabb04a4fb..95d9db159ce8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1191,19 +1191,16 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>
>  	ci->role = ci_get_role(ci);
>  	if (!ci_otg_is_fsm_mode(ci)) {
> -		/* only update vbus status for peripheral */
> -		if (ci->role == CI_ROLE_GADGET) {
> -			/* Pull down DP for possible charger detection */
> -			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> -			ci_handle_vbus_change(ci);
> -		}
> -
>  		ret = ci_role_start(ci, ci->role);
>  		if (ret) {
>  			dev_err(dev, "can't start %s role\n",
>  						ci_role(ci)->name);
>  			goto stop;
>  		}
> +
> +		/* only update vbus status for peripheral */
> +		if (ci->role == CI_ROLE_GADGET)
> +			ci_handle_vbus_change(ci);
>  	}
>
>  	ret = devm_request_irq(dev, ci->irq, ci_irq_handler, IRQF_SHARED,
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index d4277d6611ee..d52f89489893 100644
>Since ci_hdrc_gadget_init() doesn't add gadget anymore --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2044,6 +2044,8 @@ static int init_eps(struct ci_hdrc *ci)
>  {
>  	int retval = 0, i, j;
>
> +	memset(ci->ci_hw_ep, 0, sizeof(ci->ci_hw_ep));
> +
>  	for (i = 0; i < ci->hw_ep_max/2; i++)
>  		for (j = RX; j <= TX; j++) {
>  			int k = i + j * ci->hw_ep_max/2;
> @@ -2289,6 +2291,8 @@ static int udc_start(struct ci_hdrc *ci)
>  	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
>  	int retval = 0;
>
> +	memset(&ci->gadget, 0, sizeof(ci->gadget));
> +
>  	ci->gadget.ops          = &usb_gadget_ops;
>  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
>  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> @@ -2327,10 +2331,15 @@ static int udc_start(struct ci_hdrc *ci)
>
>  	ci->gadget.ep0 = &ci->ep0in->ep;
>
> +	if (ci->platdata->pins_device)
> +		pinctrl_select_state(ci->platdata->pctl,
> +				     ci->platdata->pins_device);
> +
>  	retval = usb_add_gadget_udc(dev, &ci->gadget);
>  	if (retval)
>  		goto destroy_eps;
>
> +	ci_udc_enable_vbus_irq(ci, true);
>  	return retval;
>
>  destroy_eps:
> @@ -2342,38 +2351,20 @@ static int udc_start(struct ci_hdrc *ci)
>  	return retval;
>  }
>
> -/*
> - * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
> - *
> - * No interrupts active, the IRQ has been released
> +/**
> + * udc_stop: deinitialize gadget role
> + * @ci: chipidea controller
>   */
> -void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
> +static void udc_stop(struct ci_hdrc *ci)
>  {
> -	if (!ci->roles[CI_ROLE_GADGET])
> -		return;
> -
> +	ci_udc_enable_vbus_irq(ci, false);
>  	usb_del_gadget_udc(&ci->gadget);
> +	ci->vbus_active = 0;
>
>  	destroy_eps(ci);
>
>  	dma_pool_destroy(ci->td_pool);
>  	dma_pool_destroy(ci->qh_pool);
> -}
> -
> -static int udc_id_switch_for_device(struct ci_hdrc *ci)
> -{
> -	if (ci->platdata->pins_device)
> -		pinctrl_select_state(ci->platdata->pctl,
> -				     ci->platdata->pins_device);
> -
> -	ci_udc_enable_vbus_irq(ci, true);
> -	return 0;
> -}
> -
> -static void udc_id_switch_for_host(struct ci_hdrc *ci)
> -{
> -	ci_udc_enable_vbus_irq(ci, false);
> -	ci->vbus_active = 0;
>
>  	if (ci->platdata->pins_device && ci->platdata->pins_default)
>  		pinctrl_select_state(ci->platdata->pctl,
> @@ -2422,7 +2413,6 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  {
>  	struct ci_role_driver *rdrv;
> -	int ret;
>
>  	if (!hw_read(ci, CAP_DCCPARAMS, DCCPARAMS_DC))
>  		return -ENXIO;
> @@ -2431,8 +2421,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  	if (!rdrv)
>  		return -ENOMEM;
>
> -	rdrv->start	= udc_id_switch_for_device;
> -	rdrv->stop	= udc_id_switch_for_host;
> +	rdrv->start	= udc_start;
> +	rdrv->stop	= udc_stop;
>  #ifdef CONFIG_PM_SLEEP
>  	rdrv->suspend	= udc_suspend;
>  	rdrv->resume	= udc_resume;
> @@ -2440,9 +2430,22 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  	rdrv->irq	= udc_irq;
>  	rdrv->name	= "gadget";
>
> -	ret = udc_start(ci);
> -	if (!ret)
> -		ci->roles[CI_ROLE_GADGET] = rdrv;
> +	ci->roles[CI_ROLE_GADGET] = rdrv;
>
> -	return ret;
> +	/* Pull down DP for possible charger detection */
> +	hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> +	return 0;
> +}
> +
> +/*
> + * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
> + *
> + * No interrupts active, the IRQ has been released
> + */
> +void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
> +{
> +	struct device *dev = &ci->gadget.dev;
> +
> +	if (ci->roles[CI_ROLE_GADGET] && device_is_registered(dev))
> +		udc_stop(ci);
>  }
> --
> 2.34.1
>

