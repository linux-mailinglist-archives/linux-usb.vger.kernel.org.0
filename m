Return-Path: <linux-usb+bounces-32177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1BD11942
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0C1F305C43F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D26A349AFE;
	Mon, 12 Jan 2026 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FNugesd1"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED5311958
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210991; cv=fail; b=l33QmQRIdNWlSJf9BP22xFY1Slw7MWSWxS5nobkuUqkdSHyt/EJgTsLNataM4DN+7cihSZwh75sVhAxvhAEvAgoImSjI77mZEn+ytCNfbWxPj8epWPW2x2qB6w8GHgKnnlyv8eza7H0DGeS6zi+P69L8hKHnRXhdJfWKaupZ4Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210991; c=relaxed/simple;
	bh=rCljsdqmODwbueMGDl6us72ZXiH7/zDrfDHyyB7zeW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FZdBySIupu8F1zHTy7lMwY6OtbPva3ffFQOOHmHV2RcfvdREL7LB3R5aeFxsSy5+eueL0eESBk4Qva51VXXi74N7VE/YggwfjRWihL5WBoRK0UwxPOv/yjPCw3WKRljV6ZfsX+Ozr6Yxb1xbkI+VgMFEmijaQejnibaS4CZvMDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FNugesd1; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abL5QLFa7/7O+7+BAan5AMGojHsz4RVYQMgd6f+TXlFrtvUMXn9cJ26mECtwNGav4MoM2EM208LBwHRNqzeJsYU+ZVPwbjD/s5rQtZ1VyDD5S7T9DQQ7hK2T/ac9s3yejxDIGNttQda6c0tN9diGtb4CtBNnLpojZpTjiyQoJJfPNwnj8/e1sKdQcWYzB8hPBuY0XmHYfVhhomYMQ/BMuSzvx6SvW41+tF/u0V+lpOHgASnYE8lNZlZWDY7/TbG8nz6I0PEwohWDc+YmdrrBZcNT5Dvfs8PWr1uTYCyh7aFxUTzSrLJffGrbjJHBWKuEcbgNVWWzg6Vh/WXP2rfuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAUCWcWSM9vxFgX0jdaKlyzU2qIg+NqI46g1aYWhHIY=;
 b=A4TqeSMdaiIq2Mnppvs5LypUOnYUmuoYn/8rcjXBwc5ZH4dICkrMopEoz74CO8y1hN4j5CcrFVY1BIJM5+cv/ijzno95YBNdhzj6jdC6pW5a4iqUK/VLfndqP2jvBcbMckxm43OBhKBP9YDxyXZJcLmqGUFo7Jrj4x5SuUw6RTk8NWvEhiqklnRlBpOmE4M4A+i8j/AZcm0FPoAfiF/bSNiM1mwSJpIxZk8+DN+obHG9W/4jrhZtkCMxm7xIDEFvpFs4FHmYMkqqy+GrlH8EwMqECTTiFN5jZddwqboFuP0lpnS/4Iw1GRLG4fZsxBUm+2oDIJlWhnqU+/n+QbyaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAUCWcWSM9vxFgX0jdaKlyzU2qIg+NqI46g1aYWhHIY=;
 b=FNugesd1WAiIpbWL54xwXCpQf2k6jk8gSiT1OavBmaYTB//Aa+17iO/WJkmQGi8Uhs+EjU0aiJCXZgfhy6EC2Zio7ei46gssh/ByDLnW51tm9dZNpg4zwfQjm0uZeUMOCeZmt5ZsqpcPZZuxzNVWVif0MngFQONL4RNx+WhRRT9itcSyLzMYOT9mDIrlRG9h15l0szurBAbuzoyjsAI/+dRPsuWx5pzOgXUuGPpNWQOfHfsUzLxhJzHjEWemo+t08YbKeRPUrxpF5nrvt8+jhyAT6DqfjHLSmCG0L8X7KNIi7uqzLMXXwcgOrZ4gWGRjeD5+BJpaEVHRVt/9ODlMWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB11093.eurprd04.prod.outlook.com (2603:10a6:150:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:43:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 09:43:02 +0000
Date: Mon, 12 Jan 2026 17:35:49 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: chipidea: udc: fix DMA and SG cleanup in
 _ep_nuke()
Message-ID: <wg252x55yxhgmovk2a6c6tq7owsapc2h52mxhfu32dhbdr4z7q@zwwisyjfk37z>
References: <20260108165902.795354-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108165902.795354-1-mario.peter@leica-geosystems.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB11093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9957f5-7450-4110-5fa2-08de51befa81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6ruXQGpJKaFKxTOqzoJJHwTy62ntNKewbtIz0bCE3AnkhKT/3iFfRUMUBq3?=
 =?us-ascii?Q?3kNyAsdGI+cuZ8M9Q9x7vkVKZap+29oF5m/CgOntYS3h3tsYl6b8oej+5bOz?=
 =?us-ascii?Q?/8IEqWJLoP5RdovgqXxcCLZcCXrhUOi2HbtWFNMK290TgPU4sjKpjN/vr/QW?=
 =?us-ascii?Q?cNPQs2vEEd6SBjwj+/pjqvIVD2NA8ZZUyFo2BVBqexDgpt1HP+9/7kUtrDCl?=
 =?us-ascii?Q?Sh+GOdQLBussKAoo6MtOGxu6hfztPGU9jUqSgSB1k6QA4Wj2MuAoG0y5fj1y?=
 =?us-ascii?Q?udHuNXsaJ8kzaKkbGbICE39/inW++WEEGjdc0O/E9w+mKvnnvvqbr3M2mbiI?=
 =?us-ascii?Q?OtvYLpPtn4HeY5ekQjI9QHfPnqPkhKVNqe41rBvf5uIkdy7Z1nKLsJfAC+t/?=
 =?us-ascii?Q?aY0SEUVw/Yr7qHnU9i5/c0A5XXraXUx3BZ8PujIAztOC6d2LatkFcijVfkNi?=
 =?us-ascii?Q?0E4dJ1B6tYVnbTN53P6NFtRt/Rg9jEowjB2+/lLQ4hmcMbxudnGGIXSDGoT5?=
 =?us-ascii?Q?ZQ+tbEcLCySdpu+3lywqyWx9nTiM37ZGKziJcOHcvvgd2wE1lvsGXSCQrWSZ?=
 =?us-ascii?Q?Pn3AUXa4LDnTKzLRAZrKaiPbVcv2xencjtTTDgdD5twK1eV8+d891QZ47RSN?=
 =?us-ascii?Q?zsnRGBUjhaxABqv/iwqczl4NNiL7DOWsraGDAh+DM8zT0txCN8vqtLwkUpW3?=
 =?us-ascii?Q?ptVfnZfoz374/sf757iiVXA/GHIpFkcGExcAALTgFw9OscGTk+BdZ0Y1P+Qe?=
 =?us-ascii?Q?nk1RB1d/OEgzg2qxsXtsgz4p8A3MDG456EWMQtVtX9oNu5+YIgME4pOrI9bt?=
 =?us-ascii?Q?Kws6fVgI8uFTnRP252QRHFrXu645h3OsKdZmz+lZdTesoJKAhJggcVjTiPha?=
 =?us-ascii?Q?eP1zkTp53Gqgl1rYIAwZKemupDpVsQk6gCZ5BmH+pfiXdN2AM7IhxPcSHssu?=
 =?us-ascii?Q?mtVPzu1NotRLh5Dua6hQiPQbTK4G/GJi/DNbbZb3sImnpA6gnhrEV1EkluWS?=
 =?us-ascii?Q?xyp579GSnYRdNtnydntH1J2ipjVsBOMOCiza7KatzGe0bej5+G1GOaHgnUGW?=
 =?us-ascii?Q?SUkdq8amS0/NFl5hJY+b6U7T9G94F3uuEwYYblxnAlH8BT7M2ejLrcJu+jvb?=
 =?us-ascii?Q?v7vN3JlF7PGpPXf4faP2zP++2W1+lx4xuN5seerG7oEvWzJf4zTBIvN+4f43?=
 =?us-ascii?Q?zREvmKDkrWLErPhVAICMaJYr4FSOXZVRr7Ly0T78Va7DDrnVCrT/ScJdrJTQ?=
 =?us-ascii?Q?sVf6579Crz87sGEPcvywo0BkCpvu+tcl7jDubQXYETvTGiwJuhcx+P2lYFpd?=
 =?us-ascii?Q?q5yng0R3JIg64cHnW64GPyQlhoRlq7Oq9dF8tuMrQLUjtNpMEW7I2bvkIlph?=
 =?us-ascii?Q?pFHALoEDRQbsUEqwI5JDG3nKaDJIk42qcXN0xoPUu1n84yqm62wzxomPYmwK?=
 =?us-ascii?Q?+FK02WciMMy2FJoZtlY2mFuWdfXUE2mF4geZBGWvhxd8nhhz7jeYJSWYst4K?=
 =?us-ascii?Q?PyBYVu9ACkwhZL7w5KSMIuxpJ/B/I/YFKd+W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LMBhqvXJy8wFgdtmFTZH1kM8dwYc21b6Cd79DL6VaFanD88DCg6fpeY6MZrt?=
 =?us-ascii?Q?4BVerPx8bbfGEIytPNwDmq6ymbXKF2iPDTCFFL9Y+xEnvkMitks1Lpx5RXxk?=
 =?us-ascii?Q?tAuHpjsbeJTDs+rClFpTVk811f/WZuyk6lAaQkrHQkEPWi2vGOl4SCKuC1Pi?=
 =?us-ascii?Q?tbLzpvnYO7PT19hQbUoi04Nt/dLE3Q5Myt+7H0QFIWsESkGfICZ4Hki5EE59?=
 =?us-ascii?Q?aZ3M5Pddsf/QPwAcbgObG/W06D36ieBzoufj5yYzbRGdgL9yHwY5LMoot98i?=
 =?us-ascii?Q?3AEmYbxdZ8y2pL2cAU4s8r6MkYruYP0cA9nZBT7fCegf7j19OhMCU+31t9Yv?=
 =?us-ascii?Q?/5l4JkuILh8j9x0LGkrWFhtYuTjmq8Kg/d5nqO7wnhzCt3opSYj6wZskAP4F?=
 =?us-ascii?Q?6r5PCPlVH5a3yTazuqCH577ISWnHZ56DgfGatngvaTx/4MIeoi6KuyPwgefW?=
 =?us-ascii?Q?oBuZ8V+0yvSvO7KhMxQ6k5zL/P1SCfxC7sPMn/CYWFRHAQ1XL+nvmDa2VPxa?=
 =?us-ascii?Q?v/rrdHFnVbtExFIQUGR6VyvSnJxLCmM5XDdYHEz8LZWRlmKrBRvqLcyMkBFT?=
 =?us-ascii?Q?vgkSxTpngcbzs82sJsQSYEWZGdSfHPs08R+lahEPn7vQNuPoI+mBOcCZ6pOH?=
 =?us-ascii?Q?iWKK3U3mrJLaelSpjHoWLKiJNkgzMGzhi93zjB0nUnF54YSjYKnjVZ07pYCr?=
 =?us-ascii?Q?nPThntyHlNBUmoy1cJa5O6A4n/xcCGFH3STtoCOJsRTCippwspK2hevYRdeX?=
 =?us-ascii?Q?wQZLxau68Ib0gY1KfPCTVnQw9GPsDOBLjTL6Bye6WOsU5et6/E41sqmWV/wT?=
 =?us-ascii?Q?fycczxRsPE8xQu+4BdXDqgECH2MvF5dr2IKBuNZfP0hslgyZZAChzSHYKu+M?=
 =?us-ascii?Q?i3ViytQ1aC8la7sXR5lQ9rToesYBHcH8mYfHCUFLU0OnCYpZ96pjItKUe1En?=
 =?us-ascii?Q?qQmNhje25MU0IqpvWQH6x6H4PBhCXunger9I/pmDSCj8e8ifacs4ZiGTVjIe?=
 =?us-ascii?Q?8RvX2SqmV5/6XuQD/HIVV99QLapwuWZgfXeHAIraJN0AoSUgQ2GC2FzSXRUa?=
 =?us-ascii?Q?Te7+pPj22IXdbHIUemW++m7mPkrzB1hSUVZxuneHIx8MPJI793eGiPTHDWYN?=
 =?us-ascii?Q?ypKpjtGlFgvTqZJ4oQtoytjR/oxW4nuc7OY6mdY97Bks6Ayq8e5mK1fL8i7R?=
 =?us-ascii?Q?gzv4XeFuoxfMnwE60rViAKwylYkyXE9ZhbI+4ImtJ+pO07mZjtSz8TWKDBz6?=
 =?us-ascii?Q?wuqc3eM0HWl7mBJmHMcS69lumoNrVnM0seXAmIwjhnY4ukDfSxOgGZ4Woypw?=
 =?us-ascii?Q?p/bXYphN0B8iiA9uFM72GqMHGqBhvnNS1/Ym9BNLQWq2h2WtQUiclIAsTEyP?=
 =?us-ascii?Q?9rX5Rf5utH5qyBqquPYQqu1WmSmBP9OqSS1WgbU0mQ6KXqPuWjwL1B6df3he?=
 =?us-ascii?Q?zwR07V1kTeujeuesGxkj8B4RNxdywidErAT6DZyRCnULJNEcipJf13DuDsle?=
 =?us-ascii?Q?PS+Wa4tuURwhYn5vBwcUTh8dGMYF+iIl1mfUChUCrCrjSbKNwSi4Y+QRKYuU?=
 =?us-ascii?Q?0iZvL3WNJ3fnEH7NoO9yfDQ/L38Ce3g5TfmJR282c5GdMfBwfCPMpl4y/rD2?=
 =?us-ascii?Q?KN+MmB4WBXEk0nRyb6qdSmK3YyGyzc2aUlwcHgy2YbORjBhrGqvv0TLU52km?=
 =?us-ascii?Q?6sK7hfLoLp7l0vYxMUJAdFTRtTtXub21dDvCxgEj1NaEIvUpxRK+b03/0G3P?=
 =?us-ascii?Q?XeKTE7Fn0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9957f5-7450-4110-5fa2-08de51befa81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:43:02.5238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5FuWvg4JI1wf1lPZgi4t4eG5boakIy37jxJ4Dv4LJVXyr06xngNnGJWtaLH74moNC60Jl4eSXB/5qA3CEgD6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11093

On Thu, Jan 08, 2026 at 04:59:02PM +0000, Mario Peter wrote:
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

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> 
> v1: submitted (https://lore.kernel.org/linux-usb/ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy/)
> v2:
> * dropped redundant req.num_mapped_sgs check
> * removed obsolete brackets
> 
>  drivers/usb/chipidea/udc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 64a421ae0f05..c8d931d9d433 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -931,6 +931,13 @@ __acquires(hwep->lock)
>  		list_del_init(&hwreq->queue);
>  		hwreq->req.status = -ESHUTDOWN;
> 
> +		/* Unmap DMA and clean up bounce buffers before giving back */
> +		usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
> +					&hwreq->req, hwep->dir);
> +
> +		if (hwreq->sgt.sgl)
> +			sglist_do_debounce(hwreq, false);
> +
>  		if (hwreq->req.complete != NULL) {
>  			spin_unlock(hwep->lock);
>  			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
> --
> 2.43.0
> 

