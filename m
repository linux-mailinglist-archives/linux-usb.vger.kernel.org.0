Return-Path: <linux-usb+bounces-22386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 863CEA76BDF
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 18:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43AD3A76AE
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 16:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70956214A88;
	Mon, 31 Mar 2025 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M62I0uTj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC994214A7A
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438125; cv=fail; b=uyORsYWGrCRa47VmazPvSv/hLNQTiwIXsQLPhREZeOFB8Gb2r+Jpx0xK3htdeQ5pdGsRC+ZNwZ6rJOsZb56FDHooR2jW8NCxM0gm57QJChuI4ToWW4o3VNdEkrjxbrfLTSFNhPp1/zyYST7vhBAmZREMZkciVb4jvNG6YOrorCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438125; c=relaxed/simple;
	bh=3Gd1UikidTzpxjILT8obWTjdFr76t0BExfS+50iwQ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l2f7VQhgkwqaHoLSMdIcAU+e2a4mZnmStSeY2JwUDhmwWMKCCH2+S6pTDLYu9N7xGAtQjl9c/UNCB2jSpRYMSmz3YHhfzHDRCNSEg1IzeIiVZBnOlNgicp4m0KYdzo27u/DQ0uaXWlkMftCjLS0EwCUIvoz3lN5F7ldcLNMvmtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M62I0uTj; arc=fail smtp.client-ip=40.107.21.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND45tcQJx3iOOdKw2qs3tWxvebedV6Z7WN3TygcD+ja1b2EeJdJ1wwPuMR5+umJKyUXJDMHRAtKnaDPOmC7HxxXT/zb0C5/kd1hUJ3OPYu7iKxDWMH5E1rKseTvb5mcRym3R6bmjMjas9ITa5impKZuWphzmJG1Cr23ETT1G0gjnzUj9RgTmFAJcvcGQ7KCngBiE8v7hxQzaAy487pAWJ2SwvaI8VTF1+cAPQiiW61K4Y8mGbXwyawrNGtVCaapfrQ7zLEWiNVkbwXS7YxI9D/aZrQUp5yjFv9lfHiAFtDHbs/k4riwuEUEVs62YvSgl09Vrzbb7DZpbffMZFh6cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gGcJekJ5R9tYQBFbbSujrevcRTZLJV4N1W34ta+63Y=;
 b=K9x0L8m214QNXJx4DzqZuy6RZdtCEzdTOaFDQJE2F03dSdHkAf0XKGvsk7HJwpz6Dfsv73Hmknb+OI82OTZhnVTtXrYJNsnZxDSLu7gbraMpt7156wv5RFtFUIE/iUwQtObYyVFNjFSZUeKC+QO6EMxN8YUW7rYWETiVBK9Dcl68HAGSXEVUZe36E0fzS7ZG4XXnshopRGOf4zFQJFGmEwdCvY1ow+Sn09S5gAh2y+nB9KUcNeV6ic9sXMzBYz6VgKOL/+16PWPfoY/ZYlYeLAA8haKK0pmJUBh1Ew3S/ViLuTm963HhUy5yyZksgmN+0FA9xsDo5FkpeMJtQdzBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gGcJekJ5R9tYQBFbbSujrevcRTZLJV4N1W34ta+63Y=;
 b=M62I0uTjuKYnCvWC2vTrERU+rmQk6EsokXa68yPZMwFCo3SNkHnMQTtl6nGDRJRXcE8eLt0IohqD6PCbfa2t0hwVvR78P2wmrjHavHVTYNFUdMOC25X7W6eWTep4NSUzs0XvF9OEYNTOBGrmaxyoeXA4q6hdzaRQGBFVN4ml/vzo7wWH/m5g7azzSAm/t/sSLK160cTF2ItW/R+cVCvtc0IcQCGlenl9U1ZC7Ob9Q5v1qPjvR3UcxmsJhFC1Hu7gb1yOhygPDVEXjaFxwoBnbArgTiqJdSgRn85o70F6qq6kolrXL2Hx+STnIc6OytT4kXZNJyB5hF8jtBpN/93Hfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8932.eurprd04.prod.outlook.com (2603:10a6:20b:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Mon, 31 Mar
 2025 16:21:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 16:21:59 +0000
Date: Mon, 31 Mar 2025 12:21:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Message-ID: <Z+rBIZQYYa7DVG+r@lizhi-Precision-Tower-5810>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
 <Z+b6qrgXz/NTOs5r@lizhi-Precision-Tower-5810>
 <6f5877cb-e6b7-4420-9a92-d2f44f931e8f@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f5877cb-e6b7-4420-9a92-d2f44f931e8f@actia.se>
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db855ab-94f2-46f5-c67f-08dd707029ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOeqtpVmiQUG7vjEXus579dDLK7OOSOoYtDtxFOBOVW5uc0Ebt87GF15hHpl?=
 =?us-ascii?Q?2khOLkKpghUcKrxfF26pGQiBJaWNEtRd7mk8EMBrECkL03kgAwxlmOqQcTX3?=
 =?us-ascii?Q?B3w4CKQc8V31KhtaRV5wyaAzsV3foMIFi3e0S/Ty0mkN1lrzSqFPhj6Cm0Sd?=
 =?us-ascii?Q?eSgp+0eR2Xy5+ZevIwJV6ECBXc5ih1n7G1vjRx1/igzOtN7grC1zi7Cg9pp2?=
 =?us-ascii?Q?jaG+AEzs7JmTdQ5Ajah5rj3MnzmuotRDVolAYMwNkGVZjpRJAFdpdolK1Hwn?=
 =?us-ascii?Q?YkEzh7LFEB0jk4Vb6hLBLWCdcRDYCFA83onJ+Lbnira9wyWZAypUUiI0eJ53?=
 =?us-ascii?Q?iDuPe8FB/ecsbpfXXT1nfLgfQLnw7QN8pgPa7eh5QIzFZ8LsetP2+3SkSxiQ?=
 =?us-ascii?Q?6ZUjwNwA5Lbq6/XJGB+c+0PnblmFqU9tRIwQEOgbEesi1Zs2V2Hu5Hky9UUF?=
 =?us-ascii?Q?g/oyLgUwrFOVLGtgGuSMgzZzjJdCmL1dGJRpIesdN92svdTPABrcT1ImOHAH?=
 =?us-ascii?Q?8iaTzMdlcBUhmURsk4XAYFQ6NieAHWzdPbuddLCIcaVaPNe+V3GkWlg6AS4b?=
 =?us-ascii?Q?n935FRwE2uihuBlOxjApRDnJcVLc/Cxp17edGvKapTfS9WJPXNqPt5qr0PPU?=
 =?us-ascii?Q?Ro4wpyhz+P9z0Yvq1DhW1ZVD9kAg2Sepp98MgYSR/XMK1ThmRiIMxby5PgFZ?=
 =?us-ascii?Q?G3Ca+ZxJwxO6prEHl0z5QkQ7nJsWG1HgTgrNQ6QS8uCWbEjhXc6diP3JiElH?=
 =?us-ascii?Q?/QqkO8ga75u3BfI8ykR9CZVJzNU4D6UwftoJ4qSuBEUgXw2MyLcKm1cyJlWI?=
 =?us-ascii?Q?FI+YShHeLCxgc23lk6vROQwilMXtjC2OW4cPdCyKY0n9zsG3yQLs5l4anVDM?=
 =?us-ascii?Q?JiTd8G7KX9dcDnZwbW1i2VypCja3XI6awM37j4fPoLecxelUC408u0aRY+Bv?=
 =?us-ascii?Q?Kv5w84p1HjMcpeYLG3RxmteF3gsUumWzJGme9Hcn7Y2pfA1zPVonc+1W+QD2?=
 =?us-ascii?Q?JV/s7PUmwxd831MOixTu2iX09N3ypDVJxIgsJeD/Rf8X5kdbNGdBJ3X+CTe0?=
 =?us-ascii?Q?TdnrBsqXDhdSbQLmh/g/Fc+orwE8jcOPU0xGswRjc/v3pGM3MJNahLT5TtyD?=
 =?us-ascii?Q?7/clfRiaJyGPPy6TmeM7kVq+RXLJdSWGtgOX6KOj+nImLCrpOOlwYSJyD8W7?=
 =?us-ascii?Q?Ul3+IxztHzJW7bXxmm/F+ZphzCSDuDVp0y/p1RJps60NVoXDhz1eRKc4GRXf?=
 =?us-ascii?Q?nOx0CuOmyxZlEGtC+tEZP8JG+gbu0BRC5ldI3HBuZlyq1fVWvBiUFpDduYKp?=
 =?us-ascii?Q?Ds1Ka0IhKESmWoHmumd7iC9nxw2IBbiQ88Mgs2MGWqT3t++l5LW9hnlRFTXG?=
 =?us-ascii?Q?18siZWfao9HLdI5ZpmFArO5JsRR3ovJiqhT2XkhZILtk6VoCqGF+2ywl01aM?=
 =?us-ascii?Q?zkg9Sj7Zvas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NNwSbZqAvv7GL/QxZdOVyDBYK/G0Fhl0z7Bf/aIze6aW/FfP+MKi6N48gEEx?=
 =?us-ascii?Q?SNr8LMQx097/f/oXxlcjlOruerdHpW5fNM7+GS1f3oEUDDBq6Hx8JcvZsGf3?=
 =?us-ascii?Q?9Z0GZyQEHwlWv1EQ5yswVwG7jmBSeG+/TixjpGDIHVe7/ya5/rozyTuCZBlP?=
 =?us-ascii?Q?uoA1g9sf/A73vdrKGTyZ7v3NCk5ga9dsJT7vpGpkukc84bSuaJP1u8n3lR8h?=
 =?us-ascii?Q?kOO7oPGVp8gcfUa5v5Wuqf3vheTHuWC1fiWbJBcXU71DaLxVnoK4oJ8jEsAp?=
 =?us-ascii?Q?QhTLZ4WjYBXs9ipJc8rLbF+FYMhbT7cAmiSo6wNUCJ4AIVeoZqB62r+FIrZd?=
 =?us-ascii?Q?WvGle5Pbp4JP1MjxGPGUIhkqr8uUe006pwNpaIB5VplVXs4YxAVk4/5Vn3OH?=
 =?us-ascii?Q?J46TAinzhy5CnKNMDDSiaCKAprgh2GhAo5SuVoJN+S1PQBYzrI/8jXpiQFW3?=
 =?us-ascii?Q?rCEZ+Y09bvW35RMhPdp/4CKhqL63rgL9cSIr6xxT/5G3PqCoIinbb6isIPyJ?=
 =?us-ascii?Q?9ZP8x0e1IP7J+vd0pTHA9XfzWAYbVwyPVbR5PPq4VW1/X48XOrcIgsHkrhon?=
 =?us-ascii?Q?xkA/hhHdQwjJCkYdrY6Ki5ez/HM4YB+oVcl13F5QqqDvbRSNrMntFWb7A34w?=
 =?us-ascii?Q?vDPhj+CGkXAJq75guacpbifP/L/pbvkEerT47eR7b17nmyr1re43vT0wYwFI?=
 =?us-ascii?Q?u8RIcxx67GodagDAHQnMFc87rfZ4juVBOfsPDIz1c/k2SNS4GTzKyAmXmZ23?=
 =?us-ascii?Q?QWcei/WF/uCs2hPBTUVU6Kb5MfWHYFj3UN96EIWCvpObbTdWaqflPLQXJEde?=
 =?us-ascii?Q?ij/CvxcvVpuTLpWHgceoeas/LdRLXO2NkZUcEz4PjWra2DwXP2jTsIMFa/r8?=
 =?us-ascii?Q?oi/T0988+bD6KmjLeRwuGifeOB2J+J0HFe4kBva8dus+es7U60KNLLlEnzdP?=
 =?us-ascii?Q?Uu2JiMDgSfKF4e7Ang2ezo5kU6HoqEQCYPZDzSd50hVSLYre7qE+8yZCXctL?=
 =?us-ascii?Q?19+9PSMUHpgZ8WjvGmk/ukEmisM9QItv5joVu7UrCHTuQVT1Q9Q5V+NZ8Ipu?=
 =?us-ascii?Q?+hOfR0HY0VwQSXAaYBfvjRS8NZBURZ4PlX7huU7dS79GHlHf+hECwlC52a5Y?=
 =?us-ascii?Q?D8YWmGPw1o4inXENC3tfp+YAEKWdwRkVWr/dgCJwjM61pHewxwScYnjKcBxd?=
 =?us-ascii?Q?qB8DnSwwL86wgspzKX8pERNGl16sX9Hjk0FsS7hLVD6GmrvdeQOW6RUTDkSp?=
 =?us-ascii?Q?8XcJmDLfG8Wvg53SVH7jM7xwJ55za44K826UrxccO4mf1U+L3W/PUdLvEdxw?=
 =?us-ascii?Q?Eov/1H64TJivGc9MNj/yWBc2OTh5pa8B4902rA2uD86slV52nFTuH85Qixkz?=
 =?us-ascii?Q?n1JpptC4BaSv4OWc9JVmnvJysDyWT6P3wu5HqwXI7CP4LHu895ZWcMJkNpL4?=
 =?us-ascii?Q?83o97EErb17PnyHqwxhomNo6BFbd24jMCU3KandfEoQqd5DjMz/UmcNT8Zzg?=
 =?us-ascii?Q?QT2XfhlKk6h7cq19IJlRam4K9m8oXnE+cnNjNQ6rwJ4nRVitgDnLyfK/CeQh?=
 =?us-ascii?Q?cHqWuALGrr+1OtvL3K5VimvuJw9D5Pf04PM9/4xz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db855ab-94f2-46f5-c67f-08dd707029ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:21:59.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUFIXxVNZ9SYUCYfWwCrmbBrU2c+Bhu/lkRAtpofzr7U9H0IXl8d/jGivYSl/4HqxFPy84jw/mAzgFyGVgQZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8932

On Mon, Mar 31, 2025 at 08:02:20AM +0000, John Ernberg wrote:
> Hi Frank,
>
> On 3/28/25 8:38 PM, Frank Li wrote:
> > On Fri, Mar 28, 2025 at 04:41:05PM +0000, John Ernberg wrote:
> >> On 6/12/23 5:31 PM, Catalin Marinas wrote:
> >>> Hi,
> >>>
> >>> That's v7 of the series reducing the kmalloc() minimum alignment on
> >>> arm64 to 8 (from 128). There's no new/different functionality, mostly
> >>> cosmetic changes and acks/tested-bys.
> >>>
> >>> Andrew, if there are no further comments or objections to this version,
> >>> are you ok to take the series through the mm tree? The arm64 changes are
> >>> fairly small. Alternatively, I can push it into linux-next now to give
> >>> it some wider exposure and decide whether to upstream it when the
> >>> merging window opens. Thanks.
> >>>
> >>> The updated patches are also available on this branch:
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/kmalloc-minalign
> >>>
> >>
> >> (I trimmed the recipients and added linux-usb and imx mailing list, +
> >> cdns3 maintainers)
> >>
> >> Hi Catalin, lists,
> >>
> >> Seen on Linux 6.12.20, it is not trivial for us to test later kernels so
> >> if the issue is potentially fixed we are more than happy to cherry-pick
> >> the potential fixes and give them a go.
> >>
> >> Having an SMSC9512 (smsc95xx) USB Ethernet/Hub chip attached to the armv8
> >> SoC iMX8QXP over the Cadence USB3 USB2 interface (cdns3-imx) will since
> >> the patch set at [0] cause random interrupt storms over the SMSC9512 INT
> >> EP.
> >
> > Do you know where buy SMSC9512 USB Ethernet/Hub?
>
> A quick google search didn't find my any dongles that are still
> available, however the SMSC 95xx series of chips used to be popular in
> USB to Ethernet dongles.
>
> Otherwise they are made by Microchip today, any variant of the SMSC 95xx
> should be able to trigger the problem.

I worry about that xhci have similar issue with gadget dma.

	/*
         * In versions preceding DEV_VER_V2, for example, iMX8QM, there exit the bugs
         * in the DMA. These bugs occur when the trb_burst_size exceeds 16 and the
         * address is not aligned to 128 Bytes (which is a product of the 64-bit AXI
         * and AXI maximum burst length of 16 or 0xF+1, dma_axi_ctrl0[3:0]). This
         * results in data corruption when it crosses the 4K border. The corruption
         * specifically occurs from the position (4K - (address & 0x7F)) to 4K.
         *
         * So force trb_burst_size to 16 at such platform.
         */

Let try reduce AXI burst len to help your case.

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index f0df114c2b53b..200166395c09d 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
  * with Cadence CDNSP dual-role controller.
  */
 #define XECP_PORT_CAP_REG      0x8000
+#define XECP_AXI_CTRL0         0x8034
 #define XECP_AUX_CTRL_REG1     0x8120

 #define CFG_RXDET_P3_EN                BIT(15)
@@ -121,7 +122,9 @@ static int __cdns_host_init(struct cdns *cdns)
        if (hcd)
                cdns->xhci_regs = hcd->regs;

-       return 0;
+       writel(0x1, cdns->xhci_regs + XECP_AXI_CTRL0);
+
+       return 0;

Frank

>
> >
> >>
> >> The reason for the storm is that the async URBs queued at [1] right before
> >> the interrupt configuration [2] in the driver.
> >> With [0] applied, those async URBs are likely clobbering any URB located
> >> after them in memory somewhere in the xhci memory space.
> >> The memory corruption only happens if there is more than one URB in the
> >> queue at the same time, making these async URBs a good trigger of the
> >> problem.
> >> If we force those URBs to be sync or use the hack inlined below, the
> >> problem goes away.
> >>
> >> The content of read_buf in the interrupt configuration read at [2] looks
> >> to be the lo-part of a pointer +-20 bytes distance from the pointers
> >> present in the async URBs queued from [1] when we dumped the URB structures
> >> instead of the expected register contents.
> >>
> >> Attached are 3 usbmon captures, with some annotations, which we thought
> >> might contain useful hints.
> >>
> >> * usb-annotated-bad.pcapng shows the URB that will get clobbered is queued
> >>     at position 280, and completes at 282.
> >>
> >> * usb-annotated-good.pcapng shows the URB that gets clobbered in the bad
> >>     case is queued at position 282 and completes at 283.
> >>
> >> The above captures are from a kernel where the hack has not been applied.
> >>
> >> * usb-annotated-hackfix.pcapng shows the URB that gets clobbered in the
> >>     bad case is queued at position 238 and completes at 240.
> >
> > Maillist have not attachment. Can you send it to me directly?
>
>
> The linux-usb mailing list picked up the attachments.
>
> https://lore.kernel.org/linux-usb/Z+b6qrgXz%2FNTOs5r@lizhi-Precision-Tower-5810/T/#t
>
> Best regards // John Ernberg

