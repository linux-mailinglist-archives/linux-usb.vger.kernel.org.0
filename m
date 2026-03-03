Return-Path: <linux-usb+bounces-33894-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEn1LgZApmkZNAAAu9opvQ
	(envelope-from <linux-usb+bounces-33894-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 02:57:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8461E7DE1
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 02:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A933304A2EB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 01:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CB3374E4A;
	Tue,  3 Mar 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P1wa0mBF"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A224374197;
	Tue,  3 Mar 2026 01:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772503022; cv=fail; b=HnjQmeqcYXtQB2wCrJgSCvJOS908mC/JsQz/MAcmJTjvdGq9eynLSI4bhHyPgXBZcP9roEHNQoXB9hsFP2S6xXMFQ/f+W2Be66SQR5uFspIsgzgz4mqBlJNTJqo/RO9O7/GabqCi7288TOemAU86M+cB+xGZYnlAqzqTvaDiL40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772503022; c=relaxed/simple;
	bh=Q84oGwadghHH/YfLhdb3hf2H4dO6nm1Z86fLSH3ngXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MWtnL7Uq0+n7KtNyY3SPy1pvPoCI1etg+BPScAZyU9WmJV5eYmRCBEPNxAyHgLy+1/xfwlR/5b6CzgCNWXVeEMKlrMi5vjx8ujsJPotsmmXe3cvy0dBj75/CD1MZay7MAwIGkblOU2fE1/TWUE0Ki5ku5lsfGI9Brb2AZ2n5afE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P1wa0mBF; arc=fail smtp.client-ip=52.101.84.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAy50F211BHzwrTEBD/Foq65cI9QAB8kExmTUNdIyotKnK0Fio0i9OpsN9CCw+qzaAL2AmVQM26c3XFuVzfIzFxEg551AsnWnR3W/XizfZFegDkuHdsNr7HdrvnKshmjMRws7i1mEwNjDVQZxI7DExcRHOwYE9+lCovyr8CDDj4cGtp56e6dYCRRBOqVgCLw++MNYWiKu19yLvxbny7h+I3jXMQfA/t/VYgIU81J0LI730TLunofXykpVQH6wKXrZ2PeoyG5HIciq0KrrzAOo8Npex7HEyG0rk2jwwonM4jpWjv7QUxxEXQY4HYDDNL07c7zHSxYfeQ2tQn/Aq409A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEMh68fM+IDwO9cNP3Op1RIVquemx43nqUMkkLRMIyg=;
 b=lBBD89n8GnnQ46zx5irC2KVCa60xYLzO47TWX493jaAsf5qXqv/FkZLQgqmbTMtcez33j9Aj0CvKFSIgY5Dh0Z7k1KmamLCK1IW+AFK5RRngk8/Tl06Y8nFDUVmXEe8UZCGhe/RUIBZT6nd75iOlx3azb6X+GXPQukAqmKToSmGR27wPT8VTIbj1fbrxKgXrbx3EHDbAFx6wpaBuGRnVjQYotV8WbzxDUvy1T8ctsBbskp48K8VmzB4ju7X/GVlkviTL+Al73kFjToD9mQ6d0Uiv1/Hx9lQJvNodeZoTwOtfy0qIG9giGBpM2D9ivVI8q53MdyxKqhBQrpEOQ5uuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEMh68fM+IDwO9cNP3Op1RIVquemx43nqUMkkLRMIyg=;
 b=P1wa0mBFsr1IgAEHcbK65xVQQSjftjPR0cHo43vLRzk2bg1ddh6OaMrPHM1QM7NnDWvMnM3GblzYlzvGpCiW3KYkxfWYT3ndZZmd7QnydJ8RNUL+fkztWWCOrMy18/nyZxQVPloZ0K+9UDW2ReK6aApnMBg4oDL/tVOka6AbMd2pVCDkUQIbfeszgPfmCYXGke6HPUt06YO3bytBq10YOPYWnsls/3UGJaBTjcVuJhKwqHMwSAe8ZU9AN40WpSEgN4DxrwcmrLn2ErKKTsx+c5BnLGQMRroABRUf/wbB3m0YvKVQU9p7WofpUOZDcJSL3O0fiKN4Hiis8QnIKavM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI0PR04MB10137.eurprd04.prod.outlook.com (2603:10a6:800:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 01:56:56 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 01:56:56 +0000
Date: Tue, 3 Mar 2026 09:49:15 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Li Jun <jun.li@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
Message-ID: <qguqvazmu7gccdu277moihntiwpdkocxnz7mua67rwk5vfq4kd@ahpb4e6hptnv>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
 <4186c887-fec4-4677-a7b0-e48c52ac5dea@infradead.org>
 <20260303013255.ubvrpojawfztyszh@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303013255.ubvrpojawfztyszh@synopsys.com>
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI0PR04MB10137:EE_
X-MS-Office365-Filtering-Correlation-Id: 664019e3-ee7f-4182-16c0-08de78c82621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	2v6PHgJSJqsU+PUX0zk2WUh2sbEc2SgtyX9AgNtZPBkd5/9/lftIbR3qc0vPNraYy7q5DsTy+QAoTyWpzlHkPUaUGFO4jCjnblKgR2CCuGFF8tMqroD9YtnPmiWNNwMaCD9vhL4iAJw++PV2TeWWnFr7t4Ar2o1395teEBYPavqHmSWnqiTq1nNBTX7D7Dgxz716OxQiwcrrcWAMGjv6rOcJWYV9sNpUOsHDEmg3A0RnOi0LTn7j9LqkCauph92O/Wn6FM1H6+6WlASWoGcETcmXtHYW0d4khlgzRNdvPTHHVdRUgHf7fQMXCCGQnK0CzsaVjnCM6IIucfi6e8NqcvijyNhZ2MAB5ZUf+eA3Chw3e9+fSqIKr5d1juoUaYZp7626q/I8GbEXrgn9x11U28Mdkyf/MBHMVyqftnm6ShUbmkzlshmacQ6cweWaCcv8xJeOQzzSa2Hkx7ng5JRgZyXmtYJvAXG77g4t/UblYnjtlWHKzTeKtWR4M8M8e/x2P3iPj01Gp446OhkD/5wUmhQ7rBErC8yu5Y04+rA3Y4EsdEB+tgP/9gh7rxg3rkPEGYKld9lRCI1JzXENmFXqUuaHH1M63RvvBlN+cyW+8XIIEfezLPaNncR/tXFGdkqaxqJzKHyCUZrYT+5W0mftEFchIA/wNSt5H36y42srUaMWAlO+tZhbBSZCBKZIMvDwj9+YxUau8yZbKCbQjWTO6IQY9XI74FPWcL1kWDATVs0e4hpy9mJlEM+ZszXPmZMCmJ1eziqWhpY18B28w3CPFCQ26gfit2+Kq8LzHFkb+gE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW5XN0RLSC9TK0Z5T1ZEbUlVeUJoMzlMeU15d2oxSWRTdlMxOEZqOUtjdUZB?=
 =?utf-8?B?dDNzeFV1dUhKdlZPUDF3Umd0WlZCcUtsSDYwZ1ZKbWZ1TUcvYlNFOXVLZWJR?=
 =?utf-8?B?dVNSZTA2YU5ZazV1ZjNJK3p5K3pjYi9CWGY2elMwM3M3d3ZyUnRCVFE4bm53?=
 =?utf-8?B?WmlHTDE0NE1UZ28yWmZOMUxnL21GZ2c4RytxQWZiN2wxTnhEUzhWK2lGdjdk?=
 =?utf-8?B?K0M2ZjJOckZQYTZabnVYRVk2MTloWHR4cXoyekplbDliWGRvK08xakJCaDFO?=
 =?utf-8?B?K2I2UHdTam96OXI3WUtqaWdTb0RkVFQwV3BVTXlrcVp3a09QTUhrTU9TVTNM?=
 =?utf-8?B?eDBYN1BJUkt1R1lCemdnUitHUzZIOW1zL1N0YmdWd1FGa3ZOaXo2SzZ2aERV?=
 =?utf-8?B?T3g4aTJ5VEY5VlJmZG0ycWRwVUlNT2VpSUQyUGtzQmJ1QzgwVjJkZVl1VWxG?=
 =?utf-8?B?WGN0T2wxeVNuV0FaQmxKcVMzVnM5VFU3czNXb2N0MWpjVEE4V1A4dmQ4TnZh?=
 =?utf-8?B?SWFZY0NQMkZFbTNQUUJWaURCRnR5eEhONDNDdlVhbkpYOXorbGtidWN4NVlI?=
 =?utf-8?B?NFNLMXBLaXJDL1QzanNKSGgvUXJQR0o3dXBGZE9KdFpiMklYRTNBcmJSQmtk?=
 =?utf-8?B?c1VSSXA4Z0VSSHJ2dXVsak1WQXpISnpEZFhIVnlObDZwQXJrYm9ZYXBLM0Uv?=
 =?utf-8?B?M3MzTlc3NlZwN2x2WWgrdjM5SmJDaHRHejZENEI4L2xHM0FXWlZlUnBydTU4?=
 =?utf-8?B?VFZYN2tQNE1seXhsQVpYVjRTbVdENHJZQnEyTmtxVHlieTZzTDVKbWhVMnha?=
 =?utf-8?B?UHBONXo4dkFrWFA1U3ZqZE9SaFhyNDZhenJCWmFhTE5OeGs4OGlFUUczZmFX?=
 =?utf-8?B?cUJycG1EbGNjeUg5TWc2dHYxVVhBejBCRTNvY1BXMlBPb2lPUCtPTEM3S0I0?=
 =?utf-8?B?cnBweHlqaXZsVkppNURmME5UWTBVWllMVlZMc3RITGUwRk4xaE51cDc1eXcy?=
 =?utf-8?B?NVZYUHIvOU40cDVteW0yaXZaRWNxN1E2bk5MU3ZRR1JpZWdKWStJSlpqTzh1?=
 =?utf-8?B?YXoycVNhRitvRGdzZHRNUUlCQzhiWXJyZWtxdkpCRWQrWjZ4bFpEd3Mza0dE?=
 =?utf-8?B?aTdmNWJObWw2SEthRDM5cXgrcE5PRk9KM3dvdnFqOFFEOGh6ZzAzc0pCSjBL?=
 =?utf-8?B?Q1Z0TU9uU0tnZHFkYVN5K2ZKY2RmWHNyd2c2Q2Y1b2p0dGdDWHFnbE5rSVpy?=
 =?utf-8?B?TFhkbWJuMklPc3dYanIya05IYnJCSnZNM3NiWHM3N2RqUXpwTUc0QjNDWC9O?=
 =?utf-8?B?YXlMaStMUjg3K3V3dEJsODBIVE5zS3A4STh1a1JwUDZ3bmI5WmVIZFF3Um04?=
 =?utf-8?B?RFVYcXVabDlLYTdoSHNVZWhNWkxiM2grWG8yNHZwN0hMbGs4OTdybFo0UnNp?=
 =?utf-8?B?NVNkU3BDZnVHcDdIYmVlYmJEWmFiS2ZoSG9CUW9VRjNLMzczNVhNbGdkdzFH?=
 =?utf-8?B?QXRqVnZONlZlcFNLeGVaWU5VK1hVMjM3NmZqcWhFWVZnVGszTnlFTjNIUGYw?=
 =?utf-8?B?UGwvRmdLNTBJdVVDdjNMYlo3MStaSE9pM3dCK2hJNUwybFQ1RHhZMXRRK1hn?=
 =?utf-8?B?YjdLMzBCVjdlMG40WkpobWIwR0RCaE44ei9QOVUwMnZ0RDkxWHVuK0dzeDZY?=
 =?utf-8?B?eTgxVWxVeVR6ejdBWmFFU210aGc4K1N4YzlZbWVDVWx6WjdIRlI0bWVvd0xO?=
 =?utf-8?B?clMydjJvSXJVZU00OUE3VmZnQlJadkpPcHNPaFpqTHJVTEZuSU5BUTVsd1FI?=
 =?utf-8?B?SkJSUjVPTkFyTWQzc3RwMklVTW9CMVF5YlU1ZUhHL3NxWUdxM2hTcnRoUENC?=
 =?utf-8?B?cFk5ZXJqQWVWOTJ4UUlCdXF6MkE4ZEUxVDNxYWEyOE4wdWNNZ1dmcWJLbmlX?=
 =?utf-8?B?VzdQV0tvSW81bHA4bS9GK2orVDFjZnBxUkwveW9nN2hZM21sNC9OMnBGNE1X?=
 =?utf-8?B?b1p5UE0vcHQyMmYwRWZLTHZPR3FubXpSQzNNMWJObXlSY015MFIxNCtIaVR6?=
 =?utf-8?B?bmxNNGhoSGQwblVkTnIrQ1kxRXhoRTYwbGM4cnArOVdMeXo0L0VaOW1sSVI0?=
 =?utf-8?B?WSttbDFueDV6Mm1BUGh2Um5ocyswaWNXT0RRSWE4MHhQL3lQcDF1RE1SbW83?=
 =?utf-8?B?ZG9FZExJQ05zbmJQZEJTbDVOa0hWemZxMHRFb2FVVUNBSTdZd3JKR0ZWR1kz?=
 =?utf-8?B?TmF3Qk1lR1lzY0pEakdxbWJKMHVZNk03blVsaTlPVXU1ZTlpeGNzSlc3UkJL?=
 =?utf-8?B?MThDVCtEb1hpT1hIMkw5S2ovTnZDMHFaODJmKzFPaEVYZVd0RFd0dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664019e3-ee7f-4182-16c0-08de78c82621
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 01:56:56.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6vRZ/wlAHU6Z7xvAJd3LdCforW1Y/Tvlq+E+y8KfuYDmfZZKXJZnUa75+klt/N7nLOxFOlmS8ERmfDbc2P9Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10137
X-Rspamd-Queue-Id: 5F8461E7DE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[infradead.org,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33894-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 01:32:56AM +0000, Thinh Nguyen wrote:
> On Fri, Feb 27, 2026, Randy Dunlap wrote:
> > Hi--
> > 
> > On 2/12/26 12:35 AM, Xu Yang wrote:
> > > The current design assumes that the controller remains powered when wakeup
> > > is enabled. However, some SoCs provide wakeup capability even when the
> > > controller itself is powered down, using separate dedicated wakeup logic.
> > > This allows additional power savings, but requires the controller to be
> > > fully re‑initialized after system resume.
> > > 
> > > To support these SoCs, introduce a flag needs_full_reinit for the purpose.
> > > And the glue layer needs to indicate if the controller needs this behavior
> > > by setting a same flag needs_full_reinit in dwc3_properties.
> > > 
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > > Changes in v4:
> > >  - also rename core_may_lose_power to needs_full_reinit
> > >  - add R-b tag
> > > Changes in v3:
> > >  - no changes
> > > Changes in v2:
> > >  - put core_may_lose_power into dwc3_properties and check it in
> > >    dwc3_get_software_properties()
> > >  - rename may_lose_power to needs_full_reinit
> > > ---
> > >  drivers/usb/dwc3/core.c | 9 +++++++--
> > >  drivers/usb/dwc3/core.h | 3 +++
> > >  drivers/usb/dwc3/glue.h | 3 +++
> > >  3 files changed, 13 insertions(+), 2 deletions(-)
> > > 
> > 
> > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > > index a35b3db1f9f3..67bcc8dccc89 100644
> > > --- a/drivers/usb/dwc3/core.h
> > > +++ b/drivers/usb/dwc3/core.h
> > > @@ -1119,6 +1119,8 @@ struct dwc3_glue_ops {
> > >   * @usb3_lpm_capable: set if hadrware supports Link Power Management
> > >   * @usb2_lpm_disable: set to disable usb2 lpm for host
> > >   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> > > + * @needs_full_reinit: set to indicate the core may lose power and need full
> > > +			initialization during system pm
> > 
> > The line above should begin with
> >  *
> > 
> > Please correct it so that kernel-doc doesn't complain:
> > 
> > WARNING: drivers/usb/dwc3/core.h:1122 bad line:                         initialization during system pm
> > 
> > Thanks.
> > 
> 
> Thanks Randy, I missed this during review.
> 
> Hi Xu,
> 
> Do you think you can send a fix for this?

My bad. Sorry for this.
I will send a fix soon.

Thanks,
Xu Yang

