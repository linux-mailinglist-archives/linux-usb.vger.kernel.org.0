Return-Path: <linux-usb+bounces-32057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A37D02870
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 13:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA753021776
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 11:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFC03ACA77;
	Thu,  8 Jan 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RrmHj9BR"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC83A7E00
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864911; cv=fail; b=hch52B2QY2wL2CKyeiAwDlIftutmF6oXZTjUqbh8PAf8ZrgUKMTNtmj3FQXSI5rbneTPRJCOMzoACOf439JL2pR2WYul1hbS4Ng0/Yc5eeVTvSn1I/6YKlzQYgBIhZL/LQPQAhLPvY6SjJ+Dlu04UfIdwmahMDSjQHpGkhAG78k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864911; c=relaxed/simple;
	bh=nK9QzY6jRNmGJrUWTruZsBugW4UT1+0EOEyHkoWQZEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tjLCVHzfqUu3CeC4A/1HyJ48mxHw5CConRblKb5XLGJVG5dCAprzf6535o6aCOFbS9GFSs3kfKvEZ1x0Orqdt/D1YD+5+z/SIShN+JGTwAqG4UuAUGCdvpD1oy9SkPZ1salZ/9OSvoPxInD4wBhMJPojEcokISlTggw+NA0PCRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RrmHj9BR; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2bT6zySNH6dQZdjhWPPR4EGosL184hfbp/vwGacFbSeb95A9FJDfu1poqHUnLU8hotFww15mL28Cqx1DkQaGKMtu2ra1NHwX768z7ezOcQzS6NMbGaG5m+Br+wjYmw+XilydXeaTQuz8uhEdutB/8x8jAL6yexX38wk+tfps+J6bplhI16xJrcReOA3Sy2l3bTZ6DE9G3zAFn/KSCl/knhrpJ+k2CQl6GlFle4RgtEcivkAmfiUWc1d36sWERbC4+JA5ssGN+2kJuxG9ebQlO9v5e9XS4BB6btMtIEP/rvFv4rV7Qgvwragg9r59qhXym8JM9vKdrfZeTVjghe6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5pGwqgzAPlrctCRzhBCGsAcDTUxCGQOfz5r59AQ4V8=;
 b=TZDtMy7WljHWrbv/w+9uWN2aaHxF8oHOzjpy37HlMUYe6SQp5zfs/nx2vzIxMi7caQ/p7CM9xeW/Ykgge15UqI9laE5dQuiUirpxq8EjoJCAkh3UVXYaEf/WEQPNG7FU6dYftYyrSZg4suVnrLCMFsJPtJVSGzTO6+BhOGMuuLCc0tT9++KO4Nj9JusW7ofd+wm6A8d9VeAv+pw7VlgFWYv4b0JD7Ri9I9/OGH+NGEc4L8ptjQ+lPiJxL9ru3ROeaj6L2ahtbl1F91xRqb+kdXc1FPESf8MmoJt+8nMiUaFTfgH2rK4oxhWPtPDXn4iwhYERagVL0tFXnW0aUi3M9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5pGwqgzAPlrctCRzhBCGsAcDTUxCGQOfz5r59AQ4V8=;
 b=RrmHj9BRKgxjMgv8z50IRKsCETwboMkmgceVs5pq3lk6se5sAollkES5GljmtVyl0QZlnNljweBDYTQ+mpIgsz6ouKXQGOkCVhdZb3r5QJs5SGrAeETYG2+7gThmmFpVkqdnRI68/3qDZYullZLu0vwyx8sW9I7ngmaSGzvIqXAzSvvhXEl1XG8ajXq3guJaBFfXNCXGaYd5ngNDlj+Y2uasb2jeW2HOzyJrfSrWuKNzcyWI6FOjiE/gyA7jOXbGr1cl9gBOerJa2DvoCZS8PtV5sR1UOoyZDwjP1HyKsReJGeYrntsfjhxYAQ1HH3FtBy+8WTDXomNq0pokOibwdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 09:34:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 09:34:57 +0000
Date: Thu, 8 Jan 2026 17:27:47 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: chipidea: udc: fix DMA and SG cleanup in
 _ep_nuke()
Message-ID: <ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy>
References: <20260107104509.421795-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107104509.421795-1-mario.peter@leica-geosystems.com>
X-ClientProxiedBy: AM9P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: b73f3fdf-4a84-41e6-53c6-08de4e99300e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hJpmDKlNgWPLM8RSVY7ZwaZedzb+CVTgFVem5R2cgGqjarcH7P1OWmm3aceh?=
 =?us-ascii?Q?GFkW21y+hzodwOWIVMdXXYVo5YwyGNy2Sz0+5YSPZo0iHXPHkfJlqpJ4yLG2?=
 =?us-ascii?Q?X18W3IwxqqWY1NXxhgYBg3ncz3VsbCqY/AjstzmiLJ6DDZuCF24ukSomMi3G?=
 =?us-ascii?Q?Yoxy1f/DsOyDpsUjQ/KH3Dv0qwQLx/boUBnPthHV/vZhWpzebp9SgSUpcVis?=
 =?us-ascii?Q?76O7h0C1bhW3D1PiicOgvTa0KXKovyWYfwNY4etrd3pQrA3k4i6psrjfgour?=
 =?us-ascii?Q?ThAyGUW2PMQEW4EkFelzBmm9hLeOtSPvo6I21f6QnnQfnRjYGJJEVgVHSdxd?=
 =?us-ascii?Q?IXyJzgjHwjBP3PXZ8mQ4E/ar71xCNKU1+4iDJ9z6JypOmQBF7B86a0Q5qKkp?=
 =?us-ascii?Q?dlI6+UC3L5GI3au5eLOQS7hCfHP/vbKyZOm1VBqYTGCUIwuUfDIikIMo6UKY?=
 =?us-ascii?Q?9hMW2vD+EtaySIWFzp3QMdApjNlg/r85qgPkYPWoGDMPa3ULr8cKNo7uoxC/?=
 =?us-ascii?Q?P5HdgxQzB5Ven0IfKEL9BE6dBSR86fOY0p1jtwxxsrmIEuV4TFTHN91sfDec?=
 =?us-ascii?Q?oL0BpANkK2dEgZTQyJSwAUlMs3TP3/Tac5NSZQz0tQeIXfHFoufssxWx4/Rn?=
 =?us-ascii?Q?AbIbIzIEx29Q1AgJXPrQW/M+w7QrHRVpTjw6gKxGyaBEgH4fmcklRZC+x4D+?=
 =?us-ascii?Q?+BBb94Z5OvodKH45XKekpdpNjArpfJMCmZVy0u/qbOzm5jjTiZqIGbmAtAeU?=
 =?us-ascii?Q?j1MwCN3OkIDsIM/JwR3Uhqkcdm7UgPMhQeyS8BlNLeSEek5uookmLzW7Bpao?=
 =?us-ascii?Q?jI++JKkI2+5Uzlku/Si6Lq6lNz0otaYt/WAHly6STyxrRNqGGSlhzt3ITt9u?=
 =?us-ascii?Q?/t/7k8KNPg9ZPVNUdeZYnexTlavSIl0c4vtJ3qsLvbRD/VNosIa7eBVXWjDe?=
 =?us-ascii?Q?GpehiWwIPvjEhxyVQ5CEcFWkcAOOKS9QgaC3nCyUnNiS+88IHbPgqbMYq/RP?=
 =?us-ascii?Q?ZwPRMCXtQktGz8lz3u5s3YSA5w44IzYwuoB0R03eyf4E8dorhm2axucDX/5R?=
 =?us-ascii?Q?uQM6oCQIW0+cepRhnLffQN+ZZHzud4JUc8yEcf0YRrNCff9TgBEk7Kb63GC0?=
 =?us-ascii?Q?Nv8QE5tCMi6p24P0CjT+c1MCllZBIFz+y4tB7y3gdcrCkPBwT8uOvAz0gQzJ?=
 =?us-ascii?Q?XCEV3z9NffA82/vOxifzncf8L2KaKx7kMwd24d7vFyIGltb5rgDw8ktoskMX?=
 =?us-ascii?Q?SpvxnBicwomt2xOokP+Yt2B4rfgiwqxr6endwYnAS1fLaeX2pa5+VjxQ4oQm?=
 =?us-ascii?Q?L3aBjJGIRKWevpBzys6JSxTnQEiirYrjvUPVdHqR/IuPOkisfjdiecErjas5?=
 =?us-ascii?Q?3gwsy5Xy63puejkgbC8RIDdtYv0CEv41klq0/hHsUxFbl8GMYePNXUqEt5xI?=
 =?us-ascii?Q?DmpLLxWVNNNn8d4cOCzDTU4UtHtx7pGWJ0YGzfU7SaXKyZPvNnEV7z75kRW9?=
 =?us-ascii?Q?/XVNsGYXI8yRx83YntILc7yTWTPEusXmpLdA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gE2n+dqrcnKxuYryyA9U6DjyPXfMvnhtR7yf1fEsU2/keHfV2iX7RsB5HxZ2?=
 =?us-ascii?Q?88IDSIcbRupXVqs2/t/6LETXnMiI7xqSbeUx0sA1kX2LpgwuNdXc5ta1kBSM?=
 =?us-ascii?Q?HrferlCQGdoNiJRG4eZo/V36KGa/puxJobyIIgOLNNYvQEi6c8hQnlwtCzdm?=
 =?us-ascii?Q?jSgMyXPct3sQvuwUwhSEzzhVbczQrbLoXmsH60oo4ON1Y4w7bEEc8VteZlAW?=
 =?us-ascii?Q?jB5pt/R+Nv7LgzXVrz8i+Hm1IJEfXrxc0+JuYimMlCkRkNVp8xJ1CnZlsjCq?=
 =?us-ascii?Q?4vlofZzUHIc4A/sGwOEjn7Jb3c0irbOmdXIRcY66pGVVpnNYfD2gUg5WN6lq?=
 =?us-ascii?Q?iFpYkDf1blHL5/KLX/i7Kr85A2b1d/+XsJGz2Gut9nB1hrummOeRvyPi5LVv?=
 =?us-ascii?Q?trjSwhrDLPjqjcNCrzv3frOAwPIcJh5ottGo2Z/c3CxkWDdhhli1I2FELh9r?=
 =?us-ascii?Q?vryx7L0RJXNhRKdom1nihLSFNqgww6b5nY/DwSRsxwHqfsS4fzlQKqRqyhAA?=
 =?us-ascii?Q?e6KViXyNoqdrEyP42HqAgYkSD8c/c0gbNiOGZMaXEPtHFc8r6NZOGMlVq3+q?=
 =?us-ascii?Q?8+/uGqtVhA9x0oD2Za+mGsHYCVhOWnwRsQufdbIZB6X+rll9VLQDD69wifZj?=
 =?us-ascii?Q?i+gtBKZBFQ6h/7+31RgOzqFyUlrIFnV4kP9uF5gmi0241VwL95FwIvdU8djq?=
 =?us-ascii?Q?JUef0jK6dbo7GiUZSrPTou1J9rmKmgUKfn85x95zc2qfavwW1PSW90g/C28H?=
 =?us-ascii?Q?v6DghSdxJhe3JD3YBEvO4oNeU29XzFc1xsg34Vf+06LnJx9P1ecnx9MyXJFh?=
 =?us-ascii?Q?cXVuqiKNL0ku+CWChrEYxye+pkf94zSHhxbr7bqf3/5HdjNtJIP7IWw3bG6F?=
 =?us-ascii?Q?hF36NIG1sDbB/pQmV3cb6Mvmwh2Xc1YLfwi9O+pI/JCtRCnVv43jO6r32tGL?=
 =?us-ascii?Q?u0uNOkK/1VhtqFQcYRyhn03mKymgaP0jnDEsUvG6zBz7Ez7THbCl+ZTyNArc?=
 =?us-ascii?Q?SOcBozujaj/GtMiMwlzfPcJCcyQOEyRaeCYDfVo5YhQo9sjjVKpOsAjyoIQT?=
 =?us-ascii?Q?8DfqFJxIZ221U7fAB3RHE3ZVPyNeEHae2z/+6cmvjJ+ZuwqYUeMtVCG9XEmW?=
 =?us-ascii?Q?ihhkhF9wN+x5FmG0w2OJv+CkcXYouUhPVBrh9/1X/8KpBxcaB7nFHAa8SINy?=
 =?us-ascii?Q?a/89Z3XirtLOs3sCTmsZ0jF7Ay/cGJgsnH96FigmysAEsLYV2lxPAxQ3bBPH?=
 =?us-ascii?Q?SIR4f6ZQ5i5z/j/NFBqst/g6H4MVZ0MfAkV7RaiGjz/9tA3yolNuOJQ4eBPM?=
 =?us-ascii?Q?AtidwBKr3iabqZ7pFYO8DW6j1Qsu63URTVfuUKU0cBYPItLQBDOiE2td7XYf?=
 =?us-ascii?Q?yyyF9sFL+nooTVwUeqGjTNvWAz8u0kKizB9IQJFoV4Z5s6GpU5m8YdypQ9ZK?=
 =?us-ascii?Q?lI4jyYM0ezabmjI6WjGU3XsCjcUw9Z9VEoIdJrBNI5UfM0dbOH1kMQAAVPDh?=
 =?us-ascii?Q?G0QzKRhQ+K4Ti6I6V8pStvG3NmIK5S4+c4fZyjLcMBbfkg1LRjCQUl+Hshn0?=
 =?us-ascii?Q?fCvFR/oD1CUbBErgw/4QtW2qp5oERb+WSyJnOKZNDSDQJGLLJ/1FQQaG/nrh?=
 =?us-ascii?Q?88TpeaGKQCnqC6gBvEHk8CzQYJGpBoGfvW0XhNdvW1VE1QxSvJ8S4ZyZ47ru?=
 =?us-ascii?Q?7vZ24yvrsUMbDw4RwQdnXZj4iNAP/QVaFX48+H6hxih4JtY2Wzn9t+YE80WA?=
 =?us-ascii?Q?DIlizpyuEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73f3fdf-4a84-41e6-53c6-08de4e99300e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:34:57.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXkLUMMTWKfqDnqUr1EEdlLEPc7O+Bs1fTI4A/jDptgyMF5vWr04+F3uFgbOfWrt2uaMrCT8fPq/miE36Rp2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200

On Wed, Jan 07, 2026 at 10:45:09AM +0000, Mario Peter wrote:
> The ChipIdea UDC driver can encounter "not page aligned sg buffer"
> errors when a USB device is reconnected after being disconnected
> during an active transfer. This occurs because _ep_nuke() returns
> requests to the gadget layer without properly unmapping DMA buffers
> or cleaning up scatter-gather bounce buffers.
> 
> Root cause:
> When a disconnect happens during a multi-segment DMA transfer, the
> request's num_mapped_sgs field and sgt.sgl pointer remain set with
> stale values. The request is returned to the gadget driver with status
> -ESHUTDOWN but still has active DMA state. If the gadget driver reuses
> this request on reconnect without reinitializing it, the stale DMA
> state causes _hardware_enqueue() to skip DMA mapping (seeing non-zero
> num_mapped_sgs) and attempt to use freed/invalid DMA addresses,
> leading to alignment errors and potential memory corruption.
> 
> The normal completion path via _hardware_dequeue() properly calls
> usb_gadget_unmap_request_by_dev() and sglist_do_debounce() before
> returning the request. The _ep_nuke() path must do the same cleanup
> to ensure requests are returned in a clean, reusable state.
> 
> Fix:
> Add DMA unmapping and bounce buffer cleanup to _ep_nuke() to mirror
> the cleanup sequence in _hardware_dequeue():
> - Call usb_gadget_unmap_request_by_dev() if num_mapped_sgs is set
> - Call sglist_do_debounce() with copy=false if bounce buffer exists
> 
> This ensures that when requests are returned due to endpoint shutdown,
> they don't retain stale DMA mappings. The 'false' parameter to
> sglist_do_debounce() prevents copying data back (appropriate for
> shutdown path where transfer was aborted).
> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> 
> v1: submitted
> 
>  drivers/usb/chipidea/udc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 1a48e6440e6c..8e1e0f9ae7c3 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -931,6 +931,15 @@ __acquires(hwep->lock)
>  		list_del_init(&hwreq->queue);
>  		hwreq->req.status = -ESHUTDOWN;
> 
> +		/* Unmap DMA and clean up bounce buffers before giving back */
> +		if (hwreq->req.num_mapped_sgs) {

It is redundant to check req.num_mapped_sgs since usb_gadget_unmap_request_by_dev()
will do that.

> +			usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
> +							&hwreq->req, hwep->dir);
> +		}
> +		if (hwreq->sgt.sgl) {
> +			sglist_do_debounce(hwreq, false);
> +		}

The brackets can be removed if only 1 line code in it.

Thanks,
Xu Yang
> +
>  		if (hwreq->req.complete != NULL) {
>  			spin_unlock(hwep->lock);
>  			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
> --
> 2.43.0
> 

