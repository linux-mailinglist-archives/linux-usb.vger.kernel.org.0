Return-Path: <linux-usb+bounces-33644-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ONbBCiFnWmVQQQAu9opvQ
	(envelope-from <linux-usb+bounces-33644-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:02:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A07185D0C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D1243080B9B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75C637B3F2;
	Tue, 24 Feb 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QXce/wHL"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456237B3F1;
	Tue, 24 Feb 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930803; cv=fail; b=efrLHg2Xib7u1/VMMMUDqLOcIsOStvcyPXobzz8w0tyQamaNNemhsL07WnYbfGcOe2hoJR7XV8tjrbEFvqZ+QgMAShcGPx53i+xRClF0NwH9eSsEmp+GKz7iJksSycpV9cvmtKE7QW5RDDupxo1cnDNEUv3dRQs1qTHbjO728mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930803; c=relaxed/simple;
	bh=C3En6gjKXro9R7VDgwL/g7KF/0ugnz54K3ZUT7DV9PU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oE9iEAsrhddQ6HXFQDEmYAwUxyDPKf4xLT2medeE0hImCmGIJPN1wNX3Bk4ICF9xA73yc+AIK9CBnGB+dMAsYra93dhgm+LdXJwDtW8pEVkAlZEuO6PxF6gsEN2JwUMvY771pNj2x0av5TGeTPgShhVsZWPP0cr6GT9TVUK/RXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QXce/wHL; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjO3IE8jBKWAK6I/y308vPgZZ6p03O/9VOLsHUyZewjSz/uejMexllah19oFaVuelPwt0v85r3acuJwj/cpASAZUBnoF94e3E5hU6Nn2ABKC0drNXqZkFnhPamop+M6Ui7aO1kPiyjpXomU232m3baOmjy6x3ans7x+AmpIML6rwoCpe80hjGjMteNcPfdefAF3pIpwxy55xWAPJiP1Etfkd29Q86K/+sA0wgT0bFBgKsbaX7PqtW7ETa2qwmXXSzt3wmyl1haR6m76q7onJGPLQU/l1hbbEZImJAKoi9bJrdLikGOZpNMR/DqRrAOQyh5Oqn2X58g9jZFc44FRCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YDwhHe0XaEXRZsZ/S6gKMU0FmQNMurasE2LuEV0uNA=;
 b=j+6d2s7mHzqEbm1JjyFBlNBnKLWc+CE0/ImmMHLq1UItexF3vaVXhlC6U+KJnhyEdTxZfo1q3sT8TDKfAuEtvCrjZzwd4l6pIwVPYwg0t4BjkeTanEfb13jEr+0N6sgGPyrggZaNkZamPRqY9dPIlfY/B/cu2ub3pSa2uD/DTSnVSbgitOXjj4sJwAwAxqI85enBArJKBnWvlqh/xGKf7j84ppH52KiE+Y4wvrafki6hPo8gr4y2mZZ1AEEEslCRwXfzm0M2ymf9v9Y2fK8B+b0EbH7QI1U4Liv+pxK8jtvXl3uJIJfdTWdV6t5PesUCQzDV9KafPlB73ljbHZ8iPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YDwhHe0XaEXRZsZ/S6gKMU0FmQNMurasE2LuEV0uNA=;
 b=QXce/wHLeabf2Irtpx0jbVVHsPIcFZC8716XqtaODuMFbaQrrhjJ6g95+pUi/dMif+zhMv3ssYxSl9+0ARTJBdaoK1a+p5V77xFqHAmEzVRvk9O9oY8xQ/0aaouNwZnRbdKk4pFMJbmEqCiD2+1gjqwOrSlMxMX9ZWPtvuX3bY4ecsh6rHyPXUqUd5jG8+8lVjSodDbMgD0cCe0aAMnjP/Hxs95wVb6q2WwMGy6I+L+cZyaYCuN/qe0907ajwaN4frQ/CWdUpGrjjFmUfeN4H+ZR9mdm4m/y4dNVzq1/cTi08NEa3ujDmIo4RiN4xbh39XL3y7nDpjNcaXsEYfXYeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AS1PR04MB9682.eurprd04.prod.outlook.com (2603:10a6:20b:472::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:59:58 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:59:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	arnaud.ferraris@collabora.com,
	dsimic@manjaro.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] Revert "tcpm: allow looking for role_sw device in the main node"
Date: Tue, 24 Feb 2026 19:01:39 +0800
Message-Id: <20260224110139.3812757-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AS1PR04MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d8f09e-1d87-4f6f-6df3-08de7393d909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lC3BzDYT1Lhbh6QC0HxspHWnrUBDN3kiHIhIIVmXV45LV8woD5UJ99qY5YJ8?=
 =?us-ascii?Q?ilYUPSEAe4NXAp1u9HgegFnrd8MfNHw2exP92wqd0l6JKGzGf2h5Qyc5AE2x?=
 =?us-ascii?Q?ucVUTEdJa66P3JBkBoAMS7Uupnah8LUApEpul61AlEqlsvRpZfLAjnfBrEkH?=
 =?us-ascii?Q?+Aa9ew6wQphtMxSbkc7TCvpsHWo7OtcRlh4PQT7ym/Su9ApE1FnnFG9VjFPc?=
 =?us-ascii?Q?/2ByPoQKG2P1KT9CiPcQDSBsn0lMeHidCLsiJIICQWZ69RN1BzFDXYBeeDsx?=
 =?us-ascii?Q?DjPvU91bYgf2Ua0KccWhyrAi9iysX2SC8ZSUtWs/Tnq5iXvFRxLJNL8E8d7N?=
 =?us-ascii?Q?nuh4HGHHTUAiSpgXcGxfTQPxatokLLj8T7+GnOu/WzJSsaB+VqM8faAKCCEg?=
 =?us-ascii?Q?nOYO1AEd7qTMEZq7ZKX7FGq8h2+2HCQBqba/6it4Sys5/sV123AvXWbmsNm2?=
 =?us-ascii?Q?G41IeQnLVog36HbASvcL6jgK6Vu2xpN+kkAySJQ50VxyxBskwtPJnZLyj3IT?=
 =?us-ascii?Q?rlSxs0RcLWeO0H/BXoZmlwNmKcBQkcYTw9aG1th8lY7mPn44i8xkNACYSndw?=
 =?us-ascii?Q?QpxhC55W8NjrS98Ko3EAEVQwAM8EJsT3CFASoEBsqECFJQX/vJx7lZGJ/YxD?=
 =?us-ascii?Q?bpBjddh4jJAntJbv2cBFLBupvIPXek9sQRnxGy/umUw1hsbEoMdUTtbsDNcR?=
 =?us-ascii?Q?F6GIv5Y3IcvYESMYBlhogpQC/N2yR+ja/zWX2JCw3dkoeseBdF0gBEt+o09Y?=
 =?us-ascii?Q?zrr1Plwbk1ns6AhENmehafT+PgP/5ITSmg995V8L/ZfS15sp594J+u2ymV2Y?=
 =?us-ascii?Q?SNgI39xDJ1UjHJyZQaX0bQp4XUE8e9pL1e0feN8LrlKh/0BYrby9w5sqwXp+?=
 =?us-ascii?Q?LL5fedKGml3ju+k7VWp4qCrIPwEDRSVn1Qj6F5oKerMFP+s+gNvmT0aBkcfT?=
 =?us-ascii?Q?kjfhq4trcjTHYh0ZlerVXnR3oRq4YbBLxUs6P2ZMiyVz6ASF8hMZUSxlAvS7?=
 =?us-ascii?Q?JMvs5MaO1HvY+psQk7WEuAHyEogm4MUAnRwf+5Yn0DM1Gaq/4M8tEBobxySf?=
 =?us-ascii?Q?1RvtaOhtghCRfxJD1w1whTYW/j5SJuE/Rve9myKan4+gT8mv+WGocCD1jHIn?=
 =?us-ascii?Q?cWI46Dv2ymy2it03uxxYtQlVp+9qVPKEakDpkFW7nqD/+AweYngErXsxbu+A?=
 =?us-ascii?Q?hUMajxi7Uad2einbt81pf2JROwt85zY2P1QfKEmY2FxFVU5y87W0IbdUykvx?=
 =?us-ascii?Q?S+WM5qc+JCLFfpPwQrIQ9D2Hp/vSafp8tGz4F/iHebHaiW0GgVFw9CQNgFbp?=
 =?us-ascii?Q?P8PQSHjQh/++2wM44QUm558IK3YUqiHi3X0Zf+/ZbKAxyUACyH0t2ZLHsBqz?=
 =?us-ascii?Q?+PZLa5bQMUj2uRpi1xjVDDAv+PvUCOyrJFaJTT+Fjf+YsiMDtTkBkXQPjrX3?=
 =?us-ascii?Q?F+G1Hga5QInLnCNZuWnyQyoFOQY69XVrQI74M0VEZ73eYs3BatwSoJfIAgsC?=
 =?us-ascii?Q?eRgKjd7qrQvAYf0QkTzzKl+H5yuyM6y+C89nSxYsQ+zqYqhQbBJbLDuVBQHo?=
 =?us-ascii?Q?RInQuFx9Zhcsdlj7DTY/y8XHRMJXSnh8HrciUTfRoLuUYK9OjKz/yXKNUBfT?=
 =?us-ascii?Q?aa7bQARssJe4CPD6sbpTAKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7rgZ5AU8MydQOpiUF+jF6rndfLFA0xuVRqHVGlJZKog0xHOJwWEXlmm0BkWx?=
 =?us-ascii?Q?/srHTDgzLlPvhlbQcEJKZyZIEdDszNmHkDTpgos4tZG/YEXu0L1QmOhBB6Nd?=
 =?us-ascii?Q?7gPilpR0GOz0fPy/egjR/GmABruwo0mPLl0cuXdULkAl/XTULRKkcFsXHRqM?=
 =?us-ascii?Q?a8D36lKFKWYyjURLxlAMM1gPgNRDxQw8vldWAu905UTdAbFHKUL/Sd0K3VTw?=
 =?us-ascii?Q?gjC0g0c0+IgD30PJC9OZoGToDvHdj1p8H0hBJT3OanOo4Hq8cfhmaZ884eE1?=
 =?us-ascii?Q?nz6bkfLhGoxPR0Kc51wcouhuoToUBABMQbBYw7aPA/yn8z+ZIdzqk2wrJvO3?=
 =?us-ascii?Q?Sjdgz0QnlHsnrDO8weozi858RSNVp8f+U3a9DbXqv2jYN60AqgsNAzmWhaCK?=
 =?us-ascii?Q?XCj9iJOCn6BzqXxFpYxHeuk/gIRZFcVPkFBB6PoPVlBH+kWju3WWvp1PYtuM?=
 =?us-ascii?Q?XtQfBFWWIQI9jVZV6H7caeTyBESTOVaxTOu3KvqNKTxFat192gHvcog2BiJp?=
 =?us-ascii?Q?48tnWlM/NJCU6GVNEu6SCBUniokPMDrv6UVKUFHXVP3AHvgc+vwCxY2CXE6j?=
 =?us-ascii?Q?zFSMnzE00sKBDxBTTCAiFD/hkrZxAGP7LKQjka9bUj7UWMJGlhOr5pPrDkh6?=
 =?us-ascii?Q?lsNgJLQ4fFEXk1RX9ZqS8YrfSD4qn0rgXDKWd8mAsKvGhn6H43A/vnX9PzrA?=
 =?us-ascii?Q?0gFLCKudN/IMjFeoFrCk17HCx1rKaGWcrmIjbby0o3eRqS3DLBmp3OWxZN1R?=
 =?us-ascii?Q?3QjLbFw4ssuY0qG3jVJiy0BwK+qPzD69CpNH8WSeTToK3WAw2xrGTw2Pvfq8?=
 =?us-ascii?Q?Lc7Qw8UZh+BiVpHP+QcRmHXBePtE2pb6vj2UZ0iRQtR0GtAlN3NEvLstnX2L?=
 =?us-ascii?Q?cIsDjAFONvkXYrc9k14uBgN+KgUcorglZPRPZDorzEZpQI04vhPVzX/L66HZ?=
 =?us-ascii?Q?LHs4X9npPWnYTW8wngUnEfgp1mrVvI8vag+50PncvxssTtMg300H82upRxNd?=
 =?us-ascii?Q?pg8GTg0C/cmZsXTFIR6H6sRpAE2GIk9Flmi0PzXwBBMSzBh/dbwpgY+QhaX/?=
 =?us-ascii?Q?gYmfvPLDqeU8MHR2h4GQZoeevdTAGfsLznHB7u03STF0lj9r2pJsTEEjz2cV?=
 =?us-ascii?Q?3BPR9kNx6DP+3XKKM4nGCX76W3Si/TKiNz/8RLB7JyyTJrVcLEl/WFa0totW?=
 =?us-ascii?Q?+Z6buONqbTYV847tyYY1GbBOzXYWdOV+QH2pWTU9/Njf03UXbigjo23HM7UW?=
 =?us-ascii?Q?hNQ0USqLhTPT1XwA27T014IbNBXEsQ+qny8x414cA9MFlVWw6VJlLojWkgiq?=
 =?us-ascii?Q?eWPwQEGuGw3C/+1U7mEDdzJWsrJiTkOWqBTWpeFNdX8ti7tyOk+p9UX4n9W7?=
 =?us-ascii?Q?QkroXeP8pEKP1sUFM3oRoCSzQQ8XMdTBZpzwateRwkVbzSxAKacveYnlno5b?=
 =?us-ascii?Q?zJdtHPGcqgUaHSx9jb15/mkY6YRSrDNG1Ycgwo7XdZvkwO4Ic5LZJvowyW7f?=
 =?us-ascii?Q?YbrbISH6tK1vHLf+mvEyxWbUXULRpXgFtLB8rK4jU08dhJyrjcNYPDtVQn68?=
 =?us-ascii?Q?7hMIX0Qr4dgnC8K45sqjMlHt6F2Lyw3Na1xe/W3p3946yOS5RV8Lc7b7a197?=
 =?us-ascii?Q?oxXsx+d2X12qNS76nrnkx2SM2LpbU6FCSRPRvx15fdvwxQBKCa8QkzlwJlgN?=
 =?us-ascii?Q?0mh/NFS+K2/WZhBBW15/qabByd/1pQpPFJyrE1K+byQlJGiJ28ESL+pg15R/?=
 =?us-ascii?Q?seE1+HNTxw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d8f09e-1d87-4f6f-6df3-08de7393d909
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:59:57.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6s5USPa5URgazwkl5XVqvhzo0E8u6VNkV/Re4PanTXhX6Bf4TxTGvrfi3kVYBrcF+LwVoVejjugCQVALLol9Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9682
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33644-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.vger.kernel.org:query timed out,xu.yang_2.nxp.com:query timed out];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F1A07185D0C
X-Rspamd-Action: no action

This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.

The fwnode_usb_role_switch_get() returns NULL only if no connection is
found, returns ERR_PTR(-EPROBE_DEFER) if connection is found but deferred
probe is needed, or a valid pointer of usb_role_switch.

When switching from NULL check to IS_ERR_OR_NULL(), usb_role_switch_get()
will return NULL pointer which will override ERR_PTR(-EPROBE_DEFER) which
is returned by fwnode_usb_role_switch_get(). Then usb role switch can't be
obtained because the defer probe info is lost. So the unique error should
not be regarded the same as NULL.

Fixes: 1366cd228b0c ("tcpm: allow looking for role_sw device in the main node")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Also correct a description in 1366cd228b0c ("tcpm: allow looking for
role_sw device in the main node"), if the ports are defined in the tcpc
main node, NULL pointer is returned by fwnode_usb_role_switch_get()
instead of an error.
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1d2f3af034c5..8e0e14a2704e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -7890,7 +7890,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->partner_desc.identity = &port->partner_ident;
 
 	port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
-	if (IS_ERR_OR_NULL(port->role_sw))
+	if (!port->role_sw)
 		port->role_sw = usb_role_switch_get(port->dev);
 	if (IS_ERR(port->role_sw)) {
 		err = PTR_ERR(port->role_sw);
-- 
2.34.1


