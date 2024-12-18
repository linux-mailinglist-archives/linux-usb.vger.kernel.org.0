Return-Path: <linux-usb+bounces-18622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4559F5F14
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 08:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5714A1888391
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 07:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7195D15886D;
	Wed, 18 Dec 2024 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="US48A0Mv"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5A14A624
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506035; cv=fail; b=VrniQ+RAR6F2tgnsOGorC7Ucvef8ll2SkbTtPbJwIE4nC7RhzWArZ4R6NVJEanRxuufOHtO/7wq2MphAYAj8tetlVUdHWuSJ58jj1hnLx9Z9IMXfKAjeZ112+Bl70PoRgMJH7ACi2mIdD+DkQtVhO+QItdyjerJXzhAeiOY7wWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506035; c=relaxed/simple;
	bh=z9ZRLhkjv1LeC8gb0p7zPdMquqja6QPcxHKIbnVk4iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aB2fK241pMynrfaeVfqTxaQPF/EF3FHHkZsyYRnRxgNs98SxsVd/AYTuQaBp+k5OBZ8hx/SswTob98q4lRhENVc2rWGCmsv09gt/XRcpE/4RdL2qr6xOCwRLLhc3kIeQIeWieuvZWAA3o920RKCQx7aUQV82xAt0KcbhxurvAF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=US48A0Mv; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGyKDuDRWWG2eTzBBm9FBGMmaHf55UP7o3iKPtdullwmSQOMO23PLFwvVBZmFHwlU8V5m5paF8vuVTaPErUeG+Hwjx3VwjOCTSxDJJDuw5mwTJzJUXvOf0PEYX9R6iwb/Vq9MXGY8LmkBmClSDxmvI+X9xVPKykulLdxyiseCX3SqfLWa9Y6pGMDE0PzM1hH88QiTicElbHBqjQAbzKv+05WnB/iMz4NyOmBwWNr0sN+cKB9yu4kZnhf2LFbqn3yRBj3HTIAPQJ4MFL55hnG+XrTfzH/6ppeQ5Fljh9dAIzUMkgIyS6aOhJTD+N/RWQwgsK5CjmOVewyHwL8oA9+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agjtmNUV0SytR6L8ToeLkKGKaEPjSRWkF/5Tjgdooh0=;
 b=x2sQRF29fkHTc8q9x8CYvOKG2bLj+R/0KmQIoPpLzu9NHgsTkNnJbiBvSk2sK01jwRXpn/SfX1RIpO1Y1x/LYZpbyIOERBLwiggtHx//UjQ3Qe2nfEORrAhQNQYsPboCftWb1V/UzJsXyW0p3HL0Z8s+yCiymD8t/CCNmIx0+DhK+Cg4ZQE8PNkuS/RdkOzBkEKdgQcZEIG+W0/0XAx5TRXe11t4JPQW5Dy0bj5wkBRHDh4atWzWoa6up5LsVHcV1WhLYQy+K/pk7/jdQArY9y9Y4vExLfBvi/wTqLqlJQExECDNzxHcAlkOIUj/VvU1K1/XDQHN78cUw+AbK+x4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agjtmNUV0SytR6L8ToeLkKGKaEPjSRWkF/5Tjgdooh0=;
 b=US48A0MvHoc2jDWE/Q0H65ATvgeUuipIdZSzQcGcxnleExtDU56NFoJ8/LYDnFH0pNdd4UMxP14N+nouVq+YSTyTth8TisGGtWQd0hqQsr0ED+W+12lwcNjXrg8Bwi6WxmxIMwN1nnzz0TxuKr5Blhk27AiAOyo4w4ja4kce24MGt5R+8sbPUkb4yc743nQTYnpE29+yy1iflxb1PaC3lxRCMXdMZ9+jV52Y83x+oZB+6+5xh6cmyBOBjAIAJFPMRdkEPFZzEoj5+ZLKprRkwBXwovUG5s9E+M1YIF+TbduVsmBSiOH2pTZqAmWz+/rP2LrF3CtpxIIe9KzNadOddg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 07:13:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 07:13:50 +0000
Date: Wed, 18 Dec 2024 15:11:01 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241218071101.g2wwgesbplk6vlkg@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217163506.GA80703@francesco-nb>
 <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
 <20241218053120.7r4ytd6bqzcmsbcm@hippo>
 <12af64d4-b9eb-480e-b6e9-9842d76901a4@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12af64d4-b9eb-480e-b6e9-9842d76901a4@gmail.com>
X-ClientProxiedBy: SG2PR06CA0207.apcprd06.prod.outlook.com
 (2603:1096:4:68::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fbb247-e126-4922-05bd-08dd1f338594
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?rv0A++A8RCp5YOtB7Gra4yZcSnYV7ZwniaOhkdBmKYlkLjtnb9UC5iP4sCO1?=
 =?us-ascii?Q?pImv9xmMjmYgViddvl/KTbZivr69i4RY1dztAeDYCX/nQ8p9P7SHr5wkI6AK?=
 =?us-ascii?Q?hGWyrk/Ty7Qmhd0LK5pgyW/s3LLyzenkbyXk3muYGkOGWFDcOoppUFjJ+vQb?=
 =?us-ascii?Q?8lLVtaFEw4loR56ujlgLj9KJVCheI0D/9E6U9ra3EI7dfLY5uuDJyrnGaSF3?=
 =?us-ascii?Q?FHqOKNrQB93AAiTXqzdyxhQ+LCZVT5W1wQqTGEUGANsQcje/GpNQp3muZuxS?=
 =?us-ascii?Q?1NMzXkuUkQtEYsXHZXSdSEs7yfbJbYxDU+yXum4Ir5vJ73Mq0nsg+hLKBC6x?=
 =?us-ascii?Q?9oLEEy0oEtE8d5dOxNNYxJDldkMAfn6wci6eO4hysZfGGlMoCIr4X2ifp015?=
 =?us-ascii?Q?e0Tpj8Dv8JQdrpB7aV/2RwscnSBelUYXfuv+Gm4fdkL5Ujw+dgm6oQRp3AQa?=
 =?us-ascii?Q?Ssd6F3tZpS5+4KKRWxlRIP1hHy8a7FXvmeiLEFC9plB0nFQgDKDUt3ENT/wf?=
 =?us-ascii?Q?oj5qHh1Q+HYBRjrmrHMDJ7diUKHdIEcU7UCRWHynEHLjpZxPTxvupm0c4gzx?=
 =?us-ascii?Q?02kNf5JnvcPySs8q4Kez271YTOOYaYX1GSHh4X3lkYqceash15TjpPe2RDa0?=
 =?us-ascii?Q?TYtUxxJiWlRPqJbY3OCVJ2q03gcOinR/jPfFkHkbVLNwqNIGxCvKENsAmx2P?=
 =?us-ascii?Q?00+m5cFHkY6hw3YU2N0vy5/648jWiLbp1xpvrPdE8LHPmUiyh/sexVv8zvy8?=
 =?us-ascii?Q?ImTFqTfpZDDZJZkwAJpP+jTbJ74Hz7Hs7DWaKtSPyQ4kiLWUo1m9wTFY1Dv8?=
 =?us-ascii?Q?BzZac17OUvz41AgAOhysRGgf2eJPIa0M1DgIJh6/lsePrlSXP6plSj80+6Wz?=
 =?us-ascii?Q?rYS5WTt+RGM6YkIGpgvnkgMyNyuqssMWvgAO5Xe+6JEm9lvfvRl9O0X3hFgX?=
 =?us-ascii?Q?3BdX+7zUshqGiOrCwRi7yV6aZIOUNOmM4ZRCP3Ic9FvP9PElw4lu5M5U41NM?=
 =?us-ascii?Q?oLD/5j+K+OE3JFbQg5ZOcaiox1/tTmlEz3tjYgYBQKqmAL4yrEdExtn8GnM/?=
 =?us-ascii?Q?PJ4llK/9b0qFq8hxHxhz/z3zLsw1qMZjtR2Gmfe6IjvHOAP+F5HGquV5qdgZ?=
 =?us-ascii?Q?FYpVSEZukko6oFneCvXjj4gIEsLMGwtgXmCJf2GHobtiy57Yz7T3PPW7ULe3?=
 =?us-ascii?Q?aunsej8rHHozuFLuEJAKlVgeh3sQ6APCFCxYQWG0CLM7+tPpxmpgZ5GRHBBY?=
 =?us-ascii?Q?IwzoL3HWnGoIYp15s5lfR8VV4neFS9cVj5r+PyqEmZ3wI+j1Z7an7d52zeUs?=
 =?us-ascii?Q?lZh70DjH0h1Wzf7bRToguBPifnZ6gXy4nU4HLM/xc+ZGiL4xBx4TphrVHPc4?=
 =?us-ascii?Q?qtGKnw+GZHTwVcXS1InTeadeDTqM9RIG5lcMauym/Lpkl7KARfKjaRO20NTq?=
 =?us-ascii?Q?48jAMvlK4YpJQbvO07KbQlodru6poXs7?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fUbMNryA+u8RLwgJ/xcGLZvezTn27fPPjwg1ohd4IM/4xDIXR8sVymYouEiA?=
 =?us-ascii?Q?th1fcqrGz+yeVvwxZeNxaOA54/SXyJzm0ecB+cUrovSv3YwS1HJ5W+zCQw7F?=
 =?us-ascii?Q?uPhAFE/F8B2YCoF854hWx1yoQVl3pn4yvSMTR2sCBhpdG9Gx4GmHMbANN0Op?=
 =?us-ascii?Q?R50eIdmXJxuUcm0tKH/AQsMBOFGyWbE/ZSnPoIvOjt8duLskWXA2R0lV1KOh?=
 =?us-ascii?Q?FlJ7ZsSW8xfjbwC+15NBZ5b/qrKkEiZcB9nfnbjbZixZy69hZZc6FTmpNx8a?=
 =?us-ascii?Q?rVSN0mhy/kw4SGeD6nPkoXs6XWGjVBFGaprNANyZPwC/ubSEzXDlt/pzFWFB?=
 =?us-ascii?Q?NIe+IbHGL6k29eRxMPLk9DC/9tY6jDU4I9ourumTGiQrRSKnghP6AWh3puZB?=
 =?us-ascii?Q?vwKPOgpF2nruXng/Ksz59zFRZ+VDn7Lc6RmmToOsvdK0Y/vQ9m2N3bf+g+ld?=
 =?us-ascii?Q?FJ4W7J/5t4D88BjDUHqIpv7JnPrJl6BskQ6h9/yFXp6b0J1MZt6bS0ekcKsv?=
 =?us-ascii?Q?1r8hkI0V1fQYCPBQd57DWq0GUhVCgnRHPT4TV/9bkiu1OWXAARZLSmd9WHsz?=
 =?us-ascii?Q?uYWAdVHcMhzcrpdvN0OxfDUSev9PpyX9v2NITMug8mOg+8ltp8r873S3dcvt?=
 =?us-ascii?Q?mLkoLEr72n4LOEF/jxhFPbdhbD+tFiAIkltfFNXQ+5AxhjdeH6XrJ1UzSYVX?=
 =?us-ascii?Q?MGoMeSsd/6F7kif5UGjtb4AdWJlOx86PkroyPPaaIdnhvMVensb8JHjhv5+k?=
 =?us-ascii?Q?6GIpq8Z+3efGDUvRurUA0C4cw5VJbiOXyRNHoSnKGD7R6iyPvlHJrlM+qCOL?=
 =?us-ascii?Q?RNUfhjmZPjtrjkQ/X4YINzkx17c3K21vizTs5cDXfzbg5HJbp4bUIzINSw7u?=
 =?us-ascii?Q?1AnMwlhoq5UdiluHjCjF7RqwSICES7qC+wUfW+X6EYtUP+zRYzKJlznppNCj?=
 =?us-ascii?Q?T3N2oTyiQLqwz4VmWNq0oGYK6r7T89XqWxdlGHMNcCLNgn5pbnbH/bTN+m5G?=
 =?us-ascii?Q?lz4s9iHNDLOGF/19Nya0MzbyYdyyFlupaeIiUHfYz6J5UJ53k9yS7sDO2hBs?=
 =?us-ascii?Q?TngI0dIds0GeCP5dcYdYfIGjfsOF3leLgVdughRkdmTBIEMjsrBncAcGF4TO?=
 =?us-ascii?Q?AuYUansZFXSD7s0znG1H9GcX1xU/1X7oBymdm88v8bd284usJLST0y9ipEJr?=
 =?us-ascii?Q?og4vonAeSWTYyF2qGqbVmZG+aLyfA+cehhmlWLYQmLk4ijSAS+vivkrFlqMb?=
 =?us-ascii?Q?fVwwRr9w1kJj5I9ukZa3jHZueXyc/srppqI4mf2sdrv1W4kGDkywCBDS8Mgi?=
 =?us-ascii?Q?9XRUs2niuKXkxwsynGKc6T5Cgxls3OxJotZ9DQw4Mcw9DCqVZUONQYo4PDN5?=
 =?us-ascii?Q?qqSr46BIWzCFwqveCF6t0O/cahXwTbiI+Jz12kiQeGfl9DVaP1d9Rgr/FURs?=
 =?us-ascii?Q?mx3uxTwYc952YvBCz/56bL7RuV7S3twCBpQ9SAVCkyczcV8+q4EtkyHatCUB?=
 =?us-ascii?Q?7zSUG6H4n68SiZrvYQb8gsg7+Khyyvu6MoGHXFmxagG3G9Qmz+1QBh4SMXm7?=
 =?us-ascii?Q?K7WYmTKPwro+CTSaixbrOh69Y5YNF55hxYFrss/i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fbb247-e126-4922-05bd-08dd1f338594
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 07:13:50.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJk0IzBSuq8KhiZYfeB9xuSN1dDTAGs52L3a1KlptGgsXdvnkO8llhVRGs3qROuKUbxzZSqn3xBTDtEpI9eigA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

On Wed, Dec 18, 2024 at 07:41:49AM +0100, Emanuele Ghidoli wrote:
> 
> 
> On 18/12/2024 06:31, Xu Yang wrote:
> > On Tue, Dec 17, 2024 at 09:29:36PM +0100, Emanuele Ghidoli wrote:
> >>
> >>
> >> On 17/12/2024 17:35, Francesco Dolcini wrote:
> >>> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> >>>> With edge irq support, the ALERT event may be missed currently. The reason
> >>>> is that ALERT_MASK register is written before devm_request_threaded_irq().
> >>>> If ALERT event happens in this time gap, it will be missed and ALERT line
> >>>> will not recover to high level. However, we don't meet this issue with
> >>>> level irq. To avoid the issue, this will set ALERT_MASK register after
> >>>> devm_request_threaded_irq() return.
> >>>>
> >>>> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>>
> >>> I had an offline chat with a Emanuele (in Cc:) that worked on this a few
> >>> weeks ago and he remember that he already tried a similar approach, but
> >>> for some reason he did not work.
> >>>
> >>> He should be able to try this patch in a few days, but with the upcoming
> >>> winter holidays he might not be super responsive.
> >>>
> >>> I wonder if we could wait a little before merging this to allow this
> >>> testing to happen. Or maybe you can just test if this is working on your
> >>> setup using edge interrupts (you would need to use only one TCPCI, for
> >>> the test).
> >>>
> >>> Francesco
> >>>
> >>
> >> Hi all,
> >>
> >> I was curious, so I tested the two patches. I can confirm that if both are applied, 
> >> edge interrupts still work correctly.
> >> However, with only the first patch applied, it does not work.
> > 
> > Yes. This is an expected results. So could this be regarded as a tested-by?
> > I have tested edge irq before sending out the patches too.
> > 
> > Thanks,
> > Xu Yang
> 
> Hello Xu,
> I confirmed that the first patch introduces a regression, 
> so I agree with Francesco and Dan about merging the two patches.

Okay.

> 
> Anyway, I tested it.
> 
> Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Good to know.

Thanks,
Xu Yang

