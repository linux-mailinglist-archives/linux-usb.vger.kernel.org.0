Return-Path: <linux-usb+bounces-33155-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNYeJRUQhmk1JgQAu9opvQ
	(envelope-from <linux-usb+bounces-33155-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 17:00:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED957FFF81
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 17:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 464B330713FB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 15:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBA52EA171;
	Fri,  6 Feb 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jUdqw8Aj"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC632DF155;
	Fri,  6 Feb 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393476; cv=fail; b=G/zAGnw22FD4ISWaG9SOoTxftWYjKtCmDCHD0ZMv5cKCeat3hw7LyddRBwXC57NB4Q5pCyfa7ssTyw5ltH+ehDFh94ZwOIA5GH1+HQSbK/Koze69VspdHK4J/ROJCz/TiHNC+CC6Hw+487XXxrh2Qi6D5f2SMKFbhJ2MDtRbhmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393476; c=relaxed/simple;
	bh=2Om9ObEST5k74jSJEeGmWB3zprb1abp61zoPlX5JMds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GQJ1oXjUWCIi3sM6fqTq9T51hejP+fle3C7L07uYdc4B3LFmrzBChPQxVDfQbULkCHQQRKgiTH3HZ9WfFg3rolb9KXn4hvdOJYKpIwnTAWD4zlc+M8YkSaq3N/OaB6/a+xFDcdM5w9U91q/leu1IoUXiQrUPn7/2/MY88iAa0OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jUdqw8Aj; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxV4s9GOd/txTaSgMhnV4+NJWNsYsHlbVXxz3B0xXwLQLn3bDK5hS6aZE8tMttdOIELmm5E0LR+xMlhmHifGrLFd/tTF/FY8wt84KuCzmwQj5gjsIL+OL8XUuT6sELHhwap/lyL9Sol3fnYVeONprOJby/JaDksVdmmLVYkpLyzv4snX988ZkvVoo8ac1wDtqpVwYA2BGg2uVlwbSzBJeWcrjGPiG12GUntvgbuzF/NN/5vxtRKGgIwTlabQ6ZXvflN+b7zXnyh7B9kwGgodOL8TghwbDf2tDTK1guwG1LuN6OlXq3xuEhSSOFdJZlpNPcwHzzjjhrYqdMTHiC/MOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yjH1xwS6DP3+UL07i6qcZr8mseC4Wz99aUWsL7U+ec=;
 b=jaUwODetpbgAePx/OxUMVSgIEmdwKqPaNr/1x6tLeOynyt6ceYqyQzmXxr5xr0YtsBcrZwaRQvE4WR9p+45hGRxwp/Rmj6HGAsWwVl8+5aJTGfYhbD/QHSuOe0TCnOl2vS0U5x0eHxfnvMiHvxvqVL5Kas8Lx6ZBR5VbWHdZeCgbm7Yw6UQE46aEW/UVZkGB3cbilPMpJGsdyBJPKypokToXuydtqMoudOTnlb9DyU8maWGrpIjbDgm66CGMIfAy9Q8BdFdXc4yFCL1XqtcUwCA/2uL9M3Vgh34FCF3Af31WlXPixUJZx4KN3/K1DJuYJIJegBYmymR/KzhlEuIAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yjH1xwS6DP3+UL07i6qcZr8mseC4Wz99aUWsL7U+ec=;
 b=jUdqw8AjSoHSSHHVLOrCU0C7OaGTHQT09POdFUGNIKwI8xKLlSoTh/ktUdWO7lpBPRL5NBW6zrkTivQ8vKt4MQyUZi1BdaEFwnGW8C50ZVG9BlXrMutNZ5SWbq56gvTkPkeKEvFcw94QPnpJL6buJ2IdaeS6l6GAYryRkE+NSZd3RpLY1yZjcw2DMerjPyh8QOaYJmybWo7YkFxCepPszqS727Ob6pvjV4HCMl1PZ/kIU/AKmmpMDjdylGrUuk7Dds6oCkzAQqK1h1OA6efsZCvJWzLpoqlOcCC8mhAVm+Buh6tW6zfno+HgJ347sM8UQJk7vmzWm/lXpCWfPIPb/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 15:57:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 15:57:53 +0000
Date: Fri, 6 Feb 2026 10:57:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: dwc3: add needs_full_reinit flag
Message-ID: <aYYPdGKdMdVgfm6x@lizhi-Precision-Tower-5810>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: e9982c3c-7fda-48cf-f832-08de65987c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmMzSisyU3VSTVlDVE5YaFRiWHQ1Tnp1R1NJcW8yMmFNdStsdTlCeG81R2J3?=
 =?utf-8?B?QlVsVXpPdnVLa0dLK2FsSjVUREwyVVdqczRSNzhPZnNDOUt1ZHpOakNpSmdN?=
 =?utf-8?B?K0pRMEFPOGhUWkFyZlc1d0Z4UkVsZU0vYys0WDB1S2xnalJuT0dKaHFHQWNE?=
 =?utf-8?B?dThYczhiZURBU2JGRmY4NFRtck13YU9NMUttRGt0NEszMmJlK2JTNGVwQnZE?=
 =?utf-8?B?dEtRTWRyVEJBQncxK3J2bUJkckJveU05cGd4aXhiOTU1akp3RWt5UDRZR25o?=
 =?utf-8?B?bUFYbDRFSGtveGtzV1Y2b1dOdEFkamxQeDJVMThOME5JeXRDRlpLS1o2cXRy?=
 =?utf-8?B?TG03bTZJRFZnUnBGRXk2Y1FSenByVXM1TTErLy9nNkxYcVJSY1lGcjJXQ2NF?=
 =?utf-8?B?VXpSM1Y0RmdjU2ZjMTFqSUlIdWI2ZjFsNUtmZitkSmxQWWc5dTJWQUxYRUZC?=
 =?utf-8?B?TDlJZXFMOWxHaGg1WW55ZTZkanRsZkpLdzhZRENwd0NMdlh4WnFMcmlLWits?=
 =?utf-8?B?ejl3Y09oWHN6c01Gc0lXeTVqRHhUbXJUWnRYbERYKzNNR3JxeERQUG13K0k5?=
 =?utf-8?B?bUNMeVVNK240cnF0V3lQQzJ2WGtEbDlwaHlybUYxMy9IaGZXaXFVZjNYNHZr?=
 =?utf-8?B?bGhldGVJY3lEWjZrZTJyR2dBZTd1REpjZkp3d2cxS0hTbzRsVWNZaGk2dmVh?=
 =?utf-8?B?YVZ6bVVkMTZ1Rm0zRDVYWDFjZGxhaWpnWDRzQXI3VGZhQ1RzRHc0dVN2a2tr?=
 =?utf-8?B?YVVwbUxSR202d3dWZ3p4eFN5UjIybk9aZjhHWW50VHNGQkxxaGMvQWJtL2sw?=
 =?utf-8?B?WXlNRmFzaE5yK0t1bWVHQVVBNVdJaWR0aUQ1K0d4ZW5jczVldG1kUk9YSGxO?=
 =?utf-8?B?bE9xeFgycXQxUjJSalRuMWFoQVk3WTRtYnZxMTZiM0dxRlBBMkRFd3pRK1ZE?=
 =?utf-8?B?WEEyV3o2ZmxicEZyNlI4ZWVnOWtGK0hrQk9xWHU4SVJlOExnZE1QelFxOVE0?=
 =?utf-8?B?ZStSbS8yQXFMemVMV0ZvUVB2aE5xOE4rOVZDVlJjVUZsQ1I1OWdjVTFzVVFD?=
 =?utf-8?B?UmpybWFkY1pTMGYvRjEwUjFGc2JpNjZZaStCUTN3K0kzcEpZM0hHdDg4ZDdW?=
 =?utf-8?B?Nkp6THA3YUVMVERJbVlhY2ttQ2lRbDZUUjV1LzcwUndDU3o1VzlOT1gxdWE3?=
 =?utf-8?B?eXc0dXNDQ21pQXBjSW0xK3paN3JLc08wOW9BaXBPemtobWhYTkhkaFRGN3RD?=
 =?utf-8?B?elRZUFZHV29zWTZXTDdFVjlCbmtlU0gvc1orcjlYQUVUc0J2ZkZiNm9TV1NO?=
 =?utf-8?B?dmE0NWErZ3B6b3d0eU5naWJBSUlaUlo2c2lYbnMvUWsxVncxYURheUs5d01t?=
 =?utf-8?B?T1QyYWNxMmFhamorN2ZDNWlDWkxMYS9IN0tSa04raWRqaXhMbGFXbjh4dHRV?=
 =?utf-8?B?aE1tMStRZzBZeWpIcWY4czdVOGxJdVVleThDM2w4RTRiR25ERitFOEJ1dm1n?=
 =?utf-8?B?Sk95aEwxUHRJbk9rQVNIamtXNndER2t0MWozT3c1Smw0T1RRTWRzVTE3MERP?=
 =?utf-8?B?K1o2V2ZGZlQ4cEpoNTdHTEhTMFJObjBiZThtTGVBRkx4SlpGV2ZoM1Nmakh1?=
 =?utf-8?B?SjhBMnNRVEJXRFJzbFFBdG1PVFlaQzJCakUrajV2Nlh0NDkrSVd3cDdVY2w4?=
 =?utf-8?B?NUZIQlpJTFY3ZlRzOFBkY0I1SzNZNkJMQUZoZVhONkQxdldKUE5JTEZVdFN2?=
 =?utf-8?B?WWxsMTFGMU1kNUh6MS9kMlVyTHh3NkpZZmFxSThiTzdpbTdWUGtJc1hmU3JI?=
 =?utf-8?B?akZjUVJETkFzWWxaZEpzSUtSU1p1WGFlenkwOTN5UnN4d1ZkUWwxSGdVSWMr?=
 =?utf-8?B?a0ZtRENmbFhtSUovTU5zTTA1eEdzOW9POW0yRWUyUTMrdDNFd1ErTFBkQWd2?=
 =?utf-8?B?aWgvVU9qZWtSN0lJVlYvSUQ2NXVOeS91Y2dvRzk2UTc2dy8rSGRmNnU1eGR1?=
 =?utf-8?B?WGJYWUtuTXBKNVlXUjEwcVdXUzVjTGpaLzJvbVQ3aWR3T25WR1VOWTBzd0xT?=
 =?utf-8?B?V05ZT0FySE5GbHJqT0ppd1o5Vis2QVR5WmlWaGhBSGpvbFZHSGdWSUxEdDdP?=
 =?utf-8?B?bXdGN3pMRHBaK0pRMTY1Z0xieWVqNzFyb01DTmFub3NlN2tuU1hZZDZpWis4?=
 =?utf-8?Q?j5OceyKp4+k/LVGrUdGmmEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJ6eE96c3VvUEhvVjRiTGJDMnFwUzh3REVhMjAwUUVONFRXWWRPb0FCbU9s?=
 =?utf-8?B?bDZyNGVCVW12T2NPTWdHalBVQ1JML3JGUzVQcWZyWWRpczdYb1dWMmFyZjUy?=
 =?utf-8?B?a3VwRFFpZHFqQmdraXFFWGpHNS9iOXZiYmFBdmtGdDlVSXlWSUxrYkprUnBV?=
 =?utf-8?B?RTBtVThCK1FGOGh6VGNnbFhoenFPZzJibk13Z1RpT282b3prSXdndFNQZG9p?=
 =?utf-8?B?MHNidUFWWGN0S3RwMDNtckNXcy9EYmpaR2hmL3VKczgyQTd2bHRNUWphdVJo?=
 =?utf-8?B?WHFmUjZUR0tQcGhPaXQ3S2d5ZUh0K1FoMEp1NWc5ams4ZzlMQTRpS3gyMk9I?=
 =?utf-8?B?MnQ0cWNPUnh0YWhSSkt2TXA1WVVoTzVENmRKT3ZoN3IrWE1pWWRlNC80QW51?=
 =?utf-8?B?bXNHMVdiUVUyODdSWDRSY2dpOCtPVTZnQTF5cXY4SytadWVVczdvbmdMRlNT?=
 =?utf-8?B?VlJMb0xtTHo1MnhabTdSbGN1Q2VnUXd0M3BZREZiY0tldHZSTUZmb3JtamMz?=
 =?utf-8?B?c0ZXeFp2Y3l1TWtRYnNpazl5VHEwN29sL3M1YUtBdmdXVkhaNWRuWWFzdmFq?=
 =?utf-8?B?VGhDSVRTTTNjc2tabnVTWXA3ZnFjMFhWZ1MxMnhrSmpyUDA1VmNZUmVJNFdC?=
 =?utf-8?B?dWFoOFZyWlpHZHlDOE5zWUs2ZDBBT0o1ZzRWY295ODIrbkhsbUdWMWNPMVVr?=
 =?utf-8?B?UmRwS0lnQTRpMkl5R1lPWStzT1JOdnR4ODc0a2VzaXdIbkp1SnNtSGxWK1Zr?=
 =?utf-8?B?Zk9iUnhqM1NmL21XNFZLeTFBNVhwQmphOFRIbnhWd2tqeHYycVVJVUZLekky?=
 =?utf-8?B?ZndDNkd5TmpCcWJ3ZHNGb29OdklBU050R3Ayci9qS1lHY0xMcGdoYnZsWjFR?=
 =?utf-8?B?RytCWlZWOXBaUURzM0RGNDNuQjl6MXN3UlJMcG1hSEg2Nk5naXd4NFp4WEVn?=
 =?utf-8?B?Zjl5VzZFMTNaaVg3ODRtRnZaZVJ2TGNyOURHQTZnZC9YazZlTFpmMTdaRFE1?=
 =?utf-8?B?T1hjdGxQdW1jSnNIQjFyaVZkbWlrd2RmdStJcVJpMnpNSGlITXVOVXhzM3hw?=
 =?utf-8?B?OWMvYjF5RXE0NHkxc0VuY0NRSlZLZHNYakxWMDRHK0UyQktHM3BPcU0wWGF1?=
 =?utf-8?B?Ly9DdjdmbGNXZ25jRFdwNnJFYWxWZDI2TXJMZFV5bVNmYmdLQVYwM1J6Yzl3?=
 =?utf-8?B?REhoOUVmak5LUzhaT0J3OGMyeVVkaTBpb3ZPbHFERVE4cnVQeUIrclZHQ2VQ?=
 =?utf-8?B?ODRENXZwbTRRSHJWbktEZVJGZG9DNGh3dHh1a2VtZGlKb3ZBUTVqWGplWElx?=
 =?utf-8?B?OCsvaTdETTRLZkhxZUcvMHFUeXJRT0cyeFF6SU1zN1o1K0FCR3lxMWI4MUlF?=
 =?utf-8?B?bWxsaU1ZYUJiaFE0cXBTYXhFRldHMnhPZXFaRFo1c2xVQ3Q3cTU2SDRNWkJi?=
 =?utf-8?B?dzVIMW1SdWVJSGR1aFdFWm94eFBBNGQ0Tzk2VXFVcHdGTFhEd0NPeThLT1Z1?=
 =?utf-8?B?alRnbzJkS0FiVWdhQ3FGM1N5NUN4aGxpQnZzUHBNTDhRUXpDZEFWdzB5NnJV?=
 =?utf-8?B?QVozdjQvQnFqZVRkaTFEc0FiaHpXWWNRN09FY1ZKMlhDQmJjbFpZWGFVK2Fx?=
 =?utf-8?B?RVlNZTZpUnAxb0dkeWtXcFdvSk9aYTJLbTdVK25lekhEcU1lcDZkTUNSMjFL?=
 =?utf-8?B?eUNBU21kV1JmQ0xKdnVSTHBVZ0VDcUFTU25Da1ZGRTdxRVVRSFUyUHV6TVdH?=
 =?utf-8?B?eCthUWNhRGI3dzM0MGUzVnZxQ0ZrWkhZbUxXb253OEd0VWdzVVZ3SjlxOFE2?=
 =?utf-8?B?VGV5QkVXeVpNOTFRcm9aT2ViOTRWR3hKaWMyUElaRFlPVFk0MVRqd2g5RTVs?=
 =?utf-8?B?cUJ3OFJlNzk4OXJ1QkdCWkdjNGZtL2sxOEtWdVFpaDFPVzgrcTVyRnpqTDAr?=
 =?utf-8?B?a0M0Y05JNzJjUDVETlFZWktZbTlqVFpXM3VRWjdQRlZNMWRlZ0c2a3Z0cXA0?=
 =?utf-8?B?SnZpanlnRGo4Ymh2UXUrQmwrZWxUcUlSYW9CTjh5dUdsY0JEVVJsTWpBVE8x?=
 =?utf-8?B?UlppMWI4RmhjSVp0ZFBveWZCdU9Lc2crYlU5ZkFEcG9NOGdvQldZUmxIdTNi?=
 =?utf-8?B?ZGFtNzc1eEpqK0xJMUIyTXlVLys1djIxUjVDcFVkMSs2MHIrMFlIRXl1eC9y?=
 =?utf-8?B?WmRNbHJseVJKczlBMXk2VWduM3hJblJOZENtdS84bHlRNUxodmpkaFhtK3B4?=
 =?utf-8?B?Qks3NXlRTjA1QlhOUFdTMlNDRGoxOHppSjk5K1hTRGx3Z0x5MDlrK25UMjYv?=
 =?utf-8?Q?seolRwexw35tclJegj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9982c3c-7fda-48cf-f832-08de65987c55
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:57:53.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kZ85NOmMX15tpMHnDVYroi5Jkz+Mbitue+Db4q3B2uQ9/J6QH66ga3JR6MBv3PAeQsk+RfCV5DTZnxmfhkU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33155-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED957FFF81
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 06:18:50PM +0800, Xu Yang wrote:
> The current design assumes that the controller remains powered when wakeup
> is enabled. However, some SoCs provide wakeup capability even when the
> controller itself is powered down, using separate dedicated wakeup logic.
> This allows additional power savings, but requires the controller to be
> fully re‑initialized after system resume.
>
> To support these SoCs, introduce a flag needs_full_reinit for the purpose.
> And the glue layer needs to indicate if the controller needs this behavior
> by setting a flag core_may_lose_power in dwc3_properties.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Changes in v3:
>  - no changes
> Changes in v2:
>  - put core_may_lose_power into dwc3_properties and check it in
>    dwc3_get_software_properties()
>  - rename may_lose_power to needs_full_reinit
> ---
>  drivers/usb/dwc3/core.c | 9 +++++++--
>  drivers/usb/dwc3/core.h | 3 +++
>  drivers/usb/dwc3/glue.h | 3 +++
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index c07ffe82c850..c5e0a1705b6f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1675,6 +1675,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
>  	u16 gsbuscfg0_reqinfo;
>  	int ret;
>
> +	if (properties->core_may_lose_power)
> +		dwc->needs_full_reinit = true;
> +
>  	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
>
>  	if (properties->gsbuscfg0_reqinfo !=
> @@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg) &&
> +		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_gadget_resume(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg) &&
> +		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 08cc6f2b5c23..01d92d680ba4 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1117,6 +1117,8 @@ struct dwc3_glue_ops {
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> + * @needs_full_reinit: set to indicate the core may lose power and need full
> +			initialization during system pm
>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> @@ -1369,6 +1371,7 @@ struct dwc3 {
>  	unsigned		usb3_lpm_capable:1;
>  	unsigned		usb2_lpm_disable:1;
>  	unsigned		usb2_gadget_lpm_disable:1;
> +	unsigned		needs_full_reinit:1;
>
>  	unsigned		disable_scramble_quirk:1;
>  	unsigned		u2exit_lfps_quirk:1;
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index df86e14cb706..d4ea635c92fb 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -12,9 +12,12 @@
>  /**
>   * dwc3_properties: DWC3 core properties
>   * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
> + * @core_may_lose_power: indicate the controller may not remain power during
> + *			 system pm
>   */
>  struct dwc3_properties {
>  	u32 gsbuscfg0_reqinfo;
> +	bool core_may_lose_power;
>  };
>
>  #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
>
> --
> 2.34.1
>

