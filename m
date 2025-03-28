Return-Path: <linux-usb+bounces-22303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0AA750DD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 20:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024BD3B3234
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 19:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22B41E2850;
	Fri, 28 Mar 2025 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mvt2q0uJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA031E521A
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190711; cv=fail; b=teHvo8B3evDcK7Y39i21Is3+DHr/8rRZbv2WxYurfPHAAJpdgz0a5ea1Kmwh6kjwiyndGfJppOq3TA8LLmEqU6XjfK3+oWgJc0bqqTnbf5eQhbgWPBQbphGaQvaS+vpF3Rg+vwdXjSM5iyaUj2RobAzz8aEhPMwt2SQOGbsh+9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190711; c=relaxed/simple;
	bh=7a9XGfTiQRzuoQ2qIuQgRn1g2IM3yBGQ2HLADL9I2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zdzuv/x129J71/097Dga+QqBcCqHauB+8XHAyl70SUaNcLefPL8CXGYWcojy+jpPMJOI00Ye5a0bx5TzWH7S1EWBKjH68k5+q3kTC4b5euynbyDaK8lhHc5dR6J2sDRBHEhHHDH3fWbdVxyCmS4tyFgDW0O7jFZdOgA1XUtEmJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mvt2q0uJ; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7Pxs7sw4e6CHQ6hr3ozWvQ0EK1v4nJB79Y2KEEhIcVyxcfQBgPS2DJY41fE30/nM4PIp9nRJsl7udwx5Qy0yMr0vkJdI1iZFR7zZ31/b0TJMLlQciHNKGq5VPPizwlMd2rVdLhCNKNl39ZRbe7QY/fRrVj5B13+fuTg5QAJeohwX7/C2WYrKtfWRAaTjk/8N6iaCMAWkdXpLrfagIW3K60J6B36v9hIVGmtCP8djrlCV6CxSvLntp3kRjGlROq8d2TGllk3g8F0SCjXlJNyPoZzs+tHUWj/9jrSOHuu4WUuMiABoIvUp3IPNHgmguQlSKXa/IhXsEUScpC4Q2UTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q4efpXk7KFX4KmKI5bo6B8dXs0E5vLBarHAkpl2waY=;
 b=hW2kdHQH/sSYJAoV+RLDqG7/NbKoe6YYlLj1TQNgrCIkPZeq0G5FWBSoliPqp6ihOvHT3PTaGCdM3CQ2jBCsH1pfcPxoO3zuO3RrkSiwLCYQgzMBd4zE/gcLL8HPQqEjl7kw92LTAFWJv0VmoyafWUrgfBwtzAqshUSy2tqYfh7bwimiHnLH6Dh6uKMIuCXueiBrFkzfVtJVEr7rbtGgdCv474KSKsFCCvrEKYSLrLfhJUnq341LFsNvIYFjTWwieWn/VMOxXWgETVO+yvcLpcbOIs588OkCt4/riwzK2LSPX4wJHSK8luP2+ULakLuecGX8SgBmhHbEKPccbD9zEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q4efpXk7KFX4KmKI5bo6B8dXs0E5vLBarHAkpl2waY=;
 b=Mvt2q0uJ2zCoUpry+fvAYmaDhB97qQbrYNK2ADX+VLhP2dYiaT4pOyPoOQIkBubYqHl3vgkphjxsGCABQx03l0sdBKMT1gZ62T9kUE0aS99EDK0ewG8fjUUaGpNg9kBkcVXuqJgvFF8/DIEyG7ZcsuLJbqjKIDR500gDzFVKs6nDAC6xBrUnDPKk5pkEICmoFpv7eWKkKT2Ud5PwTkfXU0ue6knzv3msyJjGXZ0YDgxyhpvC+nVNufAnf5YXD0Cbg1pivH7SuYcHDFFARGxMw9/H4Iy96R28YCsHJjMnDd/DkHBBeI4VQ5mlppZrzFROMh3LgTL1wprb9IJ71xmxqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 19:38:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 19:38:24 +0000
Date: Fri, 28 Mar 2025 15:38:18 -0400
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
Message-ID: <Z+b6qrgXz/NTOs5r@lizhi-Precision-Tower-5810>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
X-ClientProxiedBy: PH8PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f63b6d-3961-42c4-0f77-08dd6e301af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qKVhiDtfyKz4KkTqyevDIYQIkdknetw4WeGIUOXWw67O5FgDAdySLgad73WP?=
 =?us-ascii?Q?zzAFSziZ1f5zSSvSs5zz7jTCokrRLbV7UChNTnXMvnBnF5Znq40kmooNGf03?=
 =?us-ascii?Q?alliamppE1mljLN3p6VhggyDapYlYSUnglZ5G3QnSZrEsK+5ndl+Yqe1qS5N?=
 =?us-ascii?Q?RafC0YnTFO0LdffcNfPturmvDmUP7Vjv24aJVfPfpvPjNcJzsvNJVlm1e47P?=
 =?us-ascii?Q?Wzwr1F3nUwIAHw0svHe44tK0xnxAWUN6qCQf2BQCFjcrOmFjC0x1AIK9AVId?=
 =?us-ascii?Q?EPSz7lygOR/Y2yQqoafdsXBEAddWSq0aMCKB3osiJpVDPInTiBXeSmlmy0ly?=
 =?us-ascii?Q?SQE1tym6s0FUcSRJjkvnvroZWIWoAbAbTKpUzP6WfwRaFCEJ4BlepcvsO6jb?=
 =?us-ascii?Q?BOnNG+YQYh7I1ZtqvnMkao2P0jlXJYfWil0bJ3xoJOQBjNPx8LtygnhAoN3A?=
 =?us-ascii?Q?hYjw6JOElcAcRgrCpXwkhRt3jVNWL95OWFvtFmUj4mgsabRPonIz8VTizNGh?=
 =?us-ascii?Q?eOLqtfsvSwD60jVa72xdvmQ/aljiLS0Gp5Wfm75Z1Znr20FuRGs6V59nM0it?=
 =?us-ascii?Q?FbTWX3Gn03YRlC/mZ9vtmIj4tGyq5AJP7MjBhZr68IZ4wRi+74ZL28+2cHh8?=
 =?us-ascii?Q?CJ1LbOaAF3+T3eKejMtYPhSC2Muyh6jJ3jdSs63P2MMvig7xQ3/sBvtzTWaH?=
 =?us-ascii?Q?Dbdyv4SRdvuqfbq/gcD2yuQTeS/UVXAAPOCgQGzntkRW3bnlNQd6rf7JtU+U?=
 =?us-ascii?Q?FIh2qmW7RYh+NqM5U9tDQwkGkF1EW2jV4VM75Cb8T07ApyRY5qU3wYC2ndJo?=
 =?us-ascii?Q?N4rkPCl7ZstP5eUyFVOyc9SKw7kmxINoTQZ0FhwOXg8wOFx3n1YC/j5bnRv6?=
 =?us-ascii?Q?J0Da2AbOXIGtYGCaJL4EPqofBpFk6NIOu9+kiaFB+NKPCNskKOMEaN2MqD4T?=
 =?us-ascii?Q?BvKcRjIV3Sk08Mga5sCIfAZbsWz0Tk44Uku04rZaTczmU8fAmLIgOxhzQkm0?=
 =?us-ascii?Q?rT5pOQIX8ERU8Ulrq0jiTg9+uXyxbIBX+kh7LQT1RFk3i0yXuTTC7W8TduDV?=
 =?us-ascii?Q?1ltdQDsqsPuIWqSUt6WjzVTTanxf5xvv+DvjgPs7j//cZg0ht9tWApQIkw94?=
 =?us-ascii?Q?iYTzf0pZWaLPg9kxtRpJFYtJpU96r1HMPrZ69F/br5hvie7HOPC153fU3fS4?=
 =?us-ascii?Q?2oUMlCJn605yOYYAOGMSyNKzSrv9VucyQ2LsAyoXGsnw8e6SiCzdAvYyoxjG?=
 =?us-ascii?Q?XQUTMjN2C9AudaAwXhHU8h1UG4bJ6j7ROPTp3iOJ1xn4WqdR7c3vTSXL/R1z?=
 =?us-ascii?Q?xfC1nd2hWQBuQVLEcPnKfERi4FSZFhJH9uqEya+TucT+uADFNsnzBH0gLoep?=
 =?us-ascii?Q?OI9asWbT6Hr/yFmlg2gFGjW4H/yCsT34uws7l5JtuETr2LNTww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wc9ABGaZQLs2TjFMnIQBxPy6O5i2r5mAv1FM9ZnakxTiHyii15qxaoemfQH4?=
 =?us-ascii?Q?j5qzrzSl1VeiQ9C8v562x4A4CXrFvCgp3fa6hnry0545NfkekQ/M39jRQDGf?=
 =?us-ascii?Q?YKum33k2fMfaXqIPV/KkBfOIeImxTgEKf3sDJEzHmBhgCDmdJpK1wq1xuc7z?=
 =?us-ascii?Q?bqEesEQy66nvweUX2RNaiwy8x1xhmAngWJNff3yRp+q5OhyvA+puKgkEj4z2?=
 =?us-ascii?Q?WoKeaY4Ct2Wok0arK8Tt3YjbRIt652WA0C//M40OH8ZAbD4CrS1mYIQrpeTg?=
 =?us-ascii?Q?X3ZkpE/1+CozT/G8phxND2KHC39iatMtcAByW9eAR3YobASwXhYIal5dzxpg?=
 =?us-ascii?Q?VEQB/cVAanPKxvn5k1ZhLBZajTczueYSrXXr1lX4sY0K2Se4zOMBklxGhy8H?=
 =?us-ascii?Q?gRJxsJR7XFDe1yYZThRgWuJFjyWIe+S+vD5HpCorXEA6KFlV1wVVlpVsm9sI?=
 =?us-ascii?Q?oex4N2qBIjUV6WAxW0x6Kdc8iMLLgWpxvTwXfklIlSBDtFU7hdfke43qaare?=
 =?us-ascii?Q?ekQENYOvuhJSNZdIObDMGkDum7gO+hL+ECAShIC87iuyv4f0uDSHKtcU67ua?=
 =?us-ascii?Q?GJYFvntUrlzKCL2mHcpZMCmaLOGMwiQcKHibQdmHw3++MdVrKM0eN7oRnb30?=
 =?us-ascii?Q?9+8qrPfXzyqV95c4KAgFR7cDlPCE+eyQ/8mwAZpEVeehZ+gFen8dn9S60wCd?=
 =?us-ascii?Q?zawVb4viAC/qaU6yCDJeZaJ6b2i1Lqr3x0WrLhHvJ3ZftTS6OrJkbdJ7+4iN?=
 =?us-ascii?Q?sX2Nn+WQm76J+2xbqGQ2OqqT/gGijitiEklIW7tdWbNrN9d941jGwsnDPkqQ?=
 =?us-ascii?Q?Jpo6roryNlkPOwDdt/XklaWxda7KmVsJtF1G9ipoaBytPGkPi3xCmMWKo0Bt?=
 =?us-ascii?Q?UDPGp9R+y70tkzLiA/blyZPWb9KgT2ihkIiP6316vOj6GEvIvL7qTVnWPqQN?=
 =?us-ascii?Q?Py3LZ4AoCJwsSV7ELml4guxGyHu0V9k+rTBmGrLy3cZwJBK0/iautpqRYwUh?=
 =?us-ascii?Q?E2fDGX6/pJ86Zy8Q5bNk91q4rz6XMgyCI8O3m7JzBpWSyF4bYIgDw0pG7A6G?=
 =?us-ascii?Q?iFjoQLbHuntzG+WeFoJ1jKxAEgCdGL6ZvE0cIk1qof/u5DgMFS4mt35PkVs3?=
 =?us-ascii?Q?2oxZkvXgz7j+7LPEY7GJQaQd/53RAk01ziOY2iQPXw2j6GJacyXraPJ06nZu?=
 =?us-ascii?Q?hRlX29KFNEEqW7dA/E61I29HpvAnX2lrrtCHV1eirw3UVt+jF/MMlaXCXeVV?=
 =?us-ascii?Q?T56Xkr0XjwJOhYLZ9HisCtfsJKMxIwhcR8KkJuGTCDJd808bGQvSRYFI3GHf?=
 =?us-ascii?Q?a7SkPHJKYV421fLxhxmx5uk5reEoeljvIrRE6tUcBCXBTjPXdFa2sUd9dALj?=
 =?us-ascii?Q?290bcDus3ANJXsI+GCyEWJ9wnFoi4cwyXHs/WIAGCPf+fFsyJeRT95oeH/OE?=
 =?us-ascii?Q?TKL3KeJ6WXcdBwM+KhpS2sEQwLxfIXWbhgPRSjeJVFB+hheD5kT3se5yESGu?=
 =?us-ascii?Q?dnX63i9jBmcwP1/dVSJvixhZXeNNXxVUVfvPbSUd5Gh9TMkG7XFCPbYUWAO0?=
 =?us-ascii?Q?/n5ErZqlsEE9DQQGVTU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f63b6d-3961-42c4-0f77-08dd6e301af0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:38:24.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsFwU0+S5TlSjdDQ5MEwQ0lQPZMWMItCiR03nax/nRfQWQ60WKobZeLLUCxFjsBFeExkq519Z8ZoTWWyK4hNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199

On Fri, Mar 28, 2025 at 04:41:05PM +0000, John Ernberg wrote:
> On 6/12/23 5:31 PM, Catalin Marinas wrote:
> > Hi,
> >
> > That's v7 of the series reducing the kmalloc() minimum alignment on
> > arm64 to 8 (from 128). There's no new/different functionality, mostly
> > cosmetic changes and acks/tested-bys.
> >
> > Andrew, if there are no further comments or objections to this version,
> > are you ok to take the series through the mm tree? The arm64 changes are
> > fairly small. Alternatively, I can push it into linux-next now to give
> > it some wider exposure and decide whether to upstream it when the
> > merging window opens. Thanks.
> >
> > The updated patches are also available on this branch:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/kmalloc-minalign
> >
>
> (I trimmed the recipients and added linux-usb and imx mailing list, +
> cdns3 maintainers)
>
> Hi Catalin, lists,
>
> Seen on Linux 6.12.20, it is not trivial for us to test later kernels so
> if the issue is potentially fixed we are more than happy to cherry-pick
> the potential fixes and give them a go.
>
> Having an SMSC9512 (smsc95xx) USB Ethernet/Hub chip attached to the armv8
> SoC iMX8QXP over the Cadence USB3 USB2 interface (cdns3-imx) will since
> the patch set at [0] cause random interrupt storms over the SMSC9512 INT
> EP.

Do you know where buy SMSC9512 USB Ethernet/Hub?

>
> The reason for the storm is that the async URBs queued at [1] right before
> the interrupt configuration [2] in the driver.
> With [0] applied, those async URBs are likely clobbering any URB located
> after them in memory somewhere in the xhci memory space.
> The memory corruption only happens if there is more than one URB in the
> queue at the same time, making these async URBs a good trigger of the
> problem.
> If we force those URBs to be sync or use the hack inlined below, the
> problem goes away.
>
> The content of read_buf in the interrupt configuration read at [2] looks
> to be the lo-part of a pointer +-20 bytes distance from the pointers
> present in the async URBs queued from [1] when we dumped the URB structures
> instead of the expected register contents.
>
> Attached are 3 usbmon captures, with some annotations, which we thought
> might contain useful hints.
>
> * usb-annotated-bad.pcapng shows the URB that will get clobbered is queued
>    at position 280, and completes at 282.
>
> * usb-annotated-good.pcapng shows the URB that gets clobbered in the bad
>    case is queued at position 282 and completes at 283.
>
> The above captures are from a kernel where the hack has not been applied.
>
> * usb-annotated-hackfix.pcapng shows the URB that gets clobbered in the
>    bad case is queued at position 238 and completes at 240.

Maillist have not attachment. Can you send it to me directly?

Frank

>
> This was captured after the hack fix inlined below was applied.
>
> We have no reason to believe [0] is actually causing this, but rather
> the improvements uncovered a pre-existing issue with the Cadence 3
> integration in the iMX8QXP, as otherwise USB would be some level of broken
> for absolutely everyone on ARM64 since 2+ years.
>
> The reason we did not notice the issue earlier is that until very recently
> we have been stuck on the NXP vendoring of 6.1 which pre-dates [0].
>
> We determined [0] uncovers the breakage by replacing the host/ and cdns3/
> code with the NXP 6.1 vendor kernel code in a Frankenstein fashion and
> still ending up with the same USB breakage.
>
> Running KASAN on this doesn't trigger anything, so it's not a KASAN
> detectable issue.
>
> Our knowledge on how to progress on debugging this has unfortunately come
> to an end. We'd deeply appreciate any suggestion or possible patches to
> test.
>
> Best regards // John Ernberg
>
> [0]:
> https://lore.kernel.org/linux-mm/20230612153201.554742-1-catalin.marinas@arm.com/
> [1]:
> https://elixir.bootlin.com/linux/v6.12.19/source/drivers/net/usb/smsc95xx.c#L525
> [2]:
> https://elixir.bootlin.com/linux/v6.12.19/source/drivers/net/usb/smsc95xx.c#L1045
>
> ------------------->8-----------
> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> index 06a4670bdb0b..7356801faa52 100644
> --- a/arch/arm64/include/asm/cache.h
> +++ b/arch/arm64/include/asm/cache.h
> @@ -33,7 +33,7 @@
>    * the CPU.
>    */
>   #define ARCH_DMA_MINALIGN      (128)
> -#define ARCH_KMALLOC_MINALIGN  (8)
> +#define ARCH_KMALLOC_MINALIGN  (128)
>
>   #ifndef __ASSEMBLY__





