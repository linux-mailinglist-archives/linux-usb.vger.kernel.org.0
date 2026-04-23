Return-Path: <linux-usb+bounces-36439-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMSFC4nw6WnzogIAu9opvQ
	(envelope-from <linux-usb+bounces-36439-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:12:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E445065D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09501306EC68
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853D837882B;
	Thu, 23 Apr 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KNlbfK9Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC03783AD;
	Thu, 23 Apr 2026 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938633; cv=fail; b=AzAxPEyBMue2oeCtf4CDi3QWdfzKI5tI0HBFQ/4G7GqwcWsRrGmrMJ59kKyeslqA0ITqz/7+oVhwRmbqSQiekeb44u/6haT68CIuzCDTPFG2gi/rrdpOpmqQs/LZ3itJ13jmAt4OPhHxmg4FlFHzt/wuvmd/bqwygYCKNRKFjAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938633; c=relaxed/simple;
	bh=6WgG/3gYk1GPzsXKMjrN45pCsyrC3PFgSTLfJanJEP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HYpBah0SCE4XUGB22t752SBzLxKCc9XyMqFr1bSB+3b197LTDJVXmUCj56ZSkpXucjsV0WGfxJVredEEDByZi/ytEBOzwegsT5JLHXWNke6MKKWvKgwgu1AdecVjeP1Z4FcrqJfkwbbZisNtg7K4jJ23rSryE0Cb1H09kAEHP6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KNlbfK9Y; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUTuDSYZwzVCr85uvP8K3ggTHaTzLJzRdheWYVyd78kA6lkoLcX9I2BYNk45DjWVkjrkRPrsLMBNSN4ikzRarEJOmsuoh0jIPfX7iURbF4P/14UeBrv+9chnmTg+OLfJQwPknuPE5exApFJ9vtVfnccN7EZJ2GGzztW0f11LRePZGsDZf+fTw1GN5KS9qoW5gevq4AoKiD9BFYH4oA9t1O+bhNlgE/L96RDYhfVyRS6WvXIebibSgfw+a/NhcL5ID6HXx1lCNdre7iT518EqYbLAeNWDTj6/B9kqMf6Y0oQavHSOTmLCs3SV1F+TZmtZKAu8xR+SVqs1VkAkoeC+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG7T/MBd/M60NysGQiMxGK/MOSiseqRZghdg41ZJ0Wc=;
 b=kPfsMCBDy8V4BxMuIcVfA+V6Gyi9pxK9KeGN/csnF62C1RmhhGAZsTwIAGI+VgsmN6hWrSXmW1ilqtnzj+BBpKsD7VmxCMxt5uxfzJductFMIvrG/SeD6hmPIvntLPfCXTBoYzjRDlDYkZypt8ogEQbAJyVDN4K+Iblqi0JuYHuW8Wy+j2fpN0AuhFK5iqMBR2i18qdp/q/eGq5c6TBEe9sVuv7tJArcADqcS0OTffg7a1fR2XNV6ixeTJM8FNNzB20oRYOA2VX714kENhAyDWIvUqro65HwZR4my1IEhs1PX7jIMxNXi7ZAc7EEZ434frbTnZb8ASHQPBKb9KmBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG7T/MBd/M60NysGQiMxGK/MOSiseqRZghdg41ZJ0Wc=;
 b=KNlbfK9Yl+iAyJExmkL7nkd0IpP3VtO68OsfsPCHu7xlBVtPAdFQcqnVzFNsfwlZO+X4DLBaEAYvLTNM2rku8pS/+Y3KbOy8ezneL7fuc8tF4ALvrjnlGrMB9YUAV8Zy96KSZQyCHrBLIOWbI4c/CSV+p9lo1LcMFczGRtlNSja4uO87ulcFYCrh1j7SOv1lr3MrHHPBNhIHl8RZFHGezAW3syLlFVIeJfkZ/E3DhL6mvlDSkRuaEEI2QiaRoj7pJcjZGs92tsXZcYl4i8vahxoydmSXZVrWqmhoTa1uKEOXocmZsV6boVyc+Ms3mwbUOlw1V/iKwOv6PK7srJjxOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10765.eurprd04.prod.outlook.com (2603:10a6:10:593::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Thu, 23 Apr
 2026 10:03:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:03:48 +0000
Date: Thu, 23 Apr 2026 18:02:59 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/3] usb: chipidea: udc: support dynamic gadget add/remove
Message-ID: <utlbar7374go7e3isferyieudfleyacqiqye7j2hdhm6zxljv5@yhuvliyt3aod>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
 <20260421082436.1264442-2-xu.yang_2@nxp.com>
 <aeg7DpI5B-Ile4hb@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeg7DpI5B-Ile4hb@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10765:EE_
X-MS-Office365-Filtering-Correlation-Id: feef7db5-3c37-42d5-a2cd-08dea11f9cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MyIfRWN5xVYf1Yf3aVlNURUuzuMDzNpd3xN9b+Ml2poDNfmo949AH8cfVq1KCtOkMTd456qDxH6fqUUnLNNWs6Y/Yaay4vpiZL8qtsPKCPFI9i9gE9m+VLtHDJvIUH4Kicfd3UB1ARRfrkCKfqpJDdhqdc9Rg8RTO3LyOd5rK9A2pzlGjahpdfr3MiogemBJxyb/SdJbTE+9BwdNyIsuG0we6fx/m8pxGHWFEyWvqvbGWzXYv3Wk+E0Mee0wZl+mKAQRcZujCBGnchcYqUwh7V4BDMqSKz6CYDez809PmvWLbvLb4fUfrKlKBkqkfEfKJ3wDO7dxJEcdsHWiiGG5EM8PcjWUWbW7b9NgzUuS2Z4Jrregr277DTtYpA8r8zBtm7eE+zKv/8qZbQo5aMnT9xH2hunOv+xBX9W6QGs5fo0PWWSJUDkjn+oOHRica5SU/1iqZHxZ0jZWUBowVowLzEb8kxdqtb2QWQT3To24VR4HWzvu4Wp/9PvEN9H6HgETH0bvdn8J8wZDAQvx5ySxl7WlV4LLsL5FZ7gkCqH2yVFdtq3RLifMJV2c+SNMxVkbSA+ag2WuVd6rYskZVgu7uf9kT97doaj1wf9a6S1CIKugrQZtQX/n+tL7duBgNcmIS5e6oD43sa9T7ooYufPyJpw3/2d3HsGuH6uKOt38884b5T+RnqSr/TwniSDUpgGldeEA10twjUnFXLEBs2rwxM009f31Vjshph2xM2Ev+Xe8B6oLxjgNlBlsMcxLnA2VobeJa885wg5aaZDOYHUoY9KPErw/JeeOeOetYvpnP8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ru5iGainxOMgKhK5THd+IiVmdTPR7c0r4MBvIOzRbnBWdYp3pJ3LSzWXSnPb?=
 =?us-ascii?Q?r/jOiHaKM6XmDIObA9GoPplbXwXAOJ+zhohkmh9g3VDAGooNCCwvfccxLJzu?=
 =?us-ascii?Q?E0c43hcJLVqdUFIoVd+n0Or1KqeM1CyzQkzaPMVz+bz1rRXsxW5p16jBR0BW?=
 =?us-ascii?Q?1LwG+SUiCTxnkSE5qPq9MjC9cA8OhinGmy/NspH0XlOWewQhAGRCLbrVYH4x?=
 =?us-ascii?Q?blxNQC7lHGcSpPCf+wA6Ca3xq5zpQlgpdjf9Nk2jFKSACFlD+mm3mkXGeVTE?=
 =?us-ascii?Q?Qo4cG/yQfLtee3peAeq3keAj02sLa0gJqq/Ucabd1QGq97BdjFlEjTgCIsbq?=
 =?us-ascii?Q?p1O4N+4rO4QYTaOcemwyjdVhXmKZadfVEE3CLjrSTNtVHwwGTs99WgPWWQ0Z?=
 =?us-ascii?Q?jOEFzparax61EpAXB7JSzuKxsDx4WLMLa94ZV0T0ukTfyyz2PX0Ozi3iPRgI?=
 =?us-ascii?Q?38rijFqWE94ZNLFF5cxevU+SeE8bWEn03Yu/ho2tf+dS8277ji86IVO0BUET?=
 =?us-ascii?Q?elEPDh7w+Q2W0hPgfO74ry4gdeHa1F9zD/nqtML0K0kWpmarQmLJDMlYu2ES?=
 =?us-ascii?Q?iYtGf8AmtLblNq3CBeywwUYhYNx6YlOc8ysZaZEixGOXBywaCRMqHRWX8L5d?=
 =?us-ascii?Q?V4rQJHFue2+AfeEaSTWGmfMsyDomKmn56j5wTX4SF+6jX/d4rciVSgdmz3VA?=
 =?us-ascii?Q?3ud4WB81eD+wVN8e+mmXkgghPvcQr2u+l+qi8qCl9PzOv4z7Ju5endI0qWa4?=
 =?us-ascii?Q?ednHJIMkGiO3aboVqYrjbSV3h/WBqlhsWwJsv6+sE/loE8asYMpLWJX1GpPn?=
 =?us-ascii?Q?wezhOcDQt3R5kzDF3NgxUsfzhJCYdVG7Gw5CnT3EnVVxij4S3XxCRNsp6zPC?=
 =?us-ascii?Q?VY99GRadrKaa06X7eLPgOiJRp25riRJcePkPi4KLVzgxsayE2dBavOkiN89+?=
 =?us-ascii?Q?51VpQGaNqvh1ccq8g+T0ZGPG31Ud/5JSbd9wlZOXrUiimSHjxjrEjh1p2018?=
 =?us-ascii?Q?3l+ac0io0RIptNhysNdqir2wI8Uo9+AT/jr2Q/GKmzPAJh1oAEauA0VYpJ5r?=
 =?us-ascii?Q?QZcEG+chiSEHDZz2DBIwJxXy7PcYZjXQ767tYhORP23/BWqddGWvWhJ0DngC?=
 =?us-ascii?Q?FvesE/Ji+n4Hao/Vt6vKh75GpFkte5YsvaC5I9yJmte04V/acmE/O+yq+bja?=
 =?us-ascii?Q?O6rPiw8STB9m/yTryuaRfaj1k9ZtyriN7wdwVHC3LBR51ewhNzNqg3JBQNHJ?=
 =?us-ascii?Q?aoUDpaVbe1QZ7jJvxRTI2Ajpa3j4k8NAmMRMxEBwX2HhUXaBxKFo7rkoF5hJ?=
 =?us-ascii?Q?v4bEHju/vpLnVYwe4syvwwxiW+1nFFo47QW7V46dh1yw0meoB2ApwpdKku5D?=
 =?us-ascii?Q?EwFiiYW+nfl04YAWHL8jQbpH8a6sriWKFPXeEGOk+aef7V18BsecoKcQIvR8?=
 =?us-ascii?Q?cJjqPfKIK5ks4enSZmwutn6lCNw3dfXLl98ADzZOs0j4rNW9B4w1+14srtil?=
 =?us-ascii?Q?JsduK8oTGTliFEebH9e1x28UN7lIfWSaJBdlDRyiLFXL9TUrGWkgHeLz7I9m?=
 =?us-ascii?Q?zJZIi6i9Os2akaRith16a+s2QYcaM7rsPfquke0F1tXJJF5Z+/ay4A34TP/K?=
 =?us-ascii?Q?EiSIfbmZDq1hkiKxuT7TdXIHtx4GUZQVCcarEUOfKjORmw2nXhnIfxQgme1K?=
 =?us-ascii?Q?0JyPTyCEeeeJCelN5Oy9i+PjXjEd4y6WudBHSP3MTMERRfXSSmc3QY8mc8Ei?=
 =?us-ascii?Q?LpK3/kqBig=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feef7db5-3c37-42d5-a2cd-08dea11f9cd1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:03:48.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FRMiVeCFM7Y7juzzEC0uNSZYwD70zew70qkilOjTbPZJQ9OCLP3c6CZz/EHJZRLK3jjRoUNO6OqcCJIOoc94w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10765
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36439-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 802E445065D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:05:50PM -0400, Frank Li wrote:
> On Tue, Apr 21, 2026 at 04:24:35PM +0800, Xu Yang wrote:
> > When the device is connected and enumerated by the host, switching the
> > role from device to host leaves an asynchronous vbus_event_work() to be
> > run. This can affect EHCI host controller initialization process.
> 
> An asynchronous vbus_event_work() keep running when switch the role from
> device to host. This affects EHCI host controller initialization.
> 
> >
> > If vbus_event_work() runs after ehci_run() sets USBCMD.RUNSTOP bit, then
> > RUNSTOP bit will be cleared. As a result, the host controller fails to
> > operate.
> 
> USBCMD.RUNSTOP bit is set at ehci_run() and cleared by following
> vbus_event_work() if bus_event_work() run after ehci_run().
> 
> >
> > The log below shows what happens:
> >
> > [   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
> > [   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
> > [   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
> > [   87.955658] ci_hdrc ci_hdrc.0: startup error -110
> > [   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
> >
> > The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
> > pull down data line but it doesn't guarantee that this operation has
> > completed before the host controller starts running.
> 
> but it don't wait for completion before host controller starts running.
> 
> >
> > Now UDC core can properly delete usb gadget device and make sure that vbus
> > work is cancelled or completed after usb_del_gadget_udc() is returned. But
> > the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
> > avoid above issue,
> ...
> > let the gadget device add/remove dynamically during USB
> > role switching.
> 
> add/remove the gadget device dynamically during USB role switching.
> 
> >
> > To support dynamic gadget add/remove, this firstly clear ci->gadget and
> > ci->ci_hw_ep memory so the driver won't access stale data when initialize
> > and reuse these data structures again. Secondly, this assign udc_start()
> > and udc_stop() to rdrv->start and rdrv->stop, meanwhile it removes
> > udc_id_switch_for_device() and udc_id_switch_for_host(). The things in
> > them also properly be merged to udc_start()/udc_stop().
> 
> To support dynamic gadget add/remove, do below steps:
>   - clear ci->gadget and ci->gadget at initialization.
>   - assign udc_[start|stop]() to rdrv->[start|stop] instead of
> udc_id_switch_for_[device|host]() because it already did in
> udc_[start|stop]()
> 
> >
> > Since ci_hdrc_gadget_init() doesn't add gadget anymore, this also adjust
> > the order of ci_handle_vbus_change() and ci_role_start(), otherwise, NULL
> > pointer will be met.
> 
> Adjust the order ci_handle_vbus_change() and ci_role_start() to avoid NULL
> pointer reference since ci_hdrc_gadget_init() doesn't add gadget anymore.

OK. Will refine them.

Thanks,
Xu Yang

