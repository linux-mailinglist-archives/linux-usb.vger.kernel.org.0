Return-Path: <linux-usb+bounces-33972-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEEDFrIZqGmgnwAAu9opvQ
	(envelope-from <linux-usb+bounces-33972-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:38:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C981FF1AC
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A3683091941
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5227435D615;
	Wed,  4 Mar 2026 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f0yz9m3N"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CC374E56;
	Wed,  4 Mar 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624257; cv=fail; b=px5HbKM1J7Z8hGlBXwSipdGcsUtwgm4POKQ8MuNCM5EJpJ//t/jKRsPnu53pDj7hEq/vCLSRGyj2e/+dD0dlbEwJkst9y+omzWwgVnrrmD7UvNsot0JKhdwGJeUpN3EXPopk+P8Iw2pB4WhBAVpzzqV7LlSWEUfrWf3hIeURE8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624257; c=relaxed/simple;
	bh=x1Yv8ua+HlufkdZwPmebNkNLryk9J9EqptrqrMQP3bQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DdB9r2f6u5IZz4voZaZaK7Cb3TqrhJa3trDzp0KkVj6EIXtMB7mucQ0DZJl+W/zuo4YxUCOMfuUiInj5hbt88UEoi/iNVHLDHFG5OrQDJOB9pfLiQLwk9nUNjCC37vwpYr4s6addSuIGYu+ypPGeHKechgM+R51f19mytnjcD5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f0yz9m3N; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngno8XwUPrS36DCVHCHQEDxAivqtMYNap8efMjTjFeE8To/IIwD8pPUvYXesPjflBgRyx8YxrwfCOFSoOmX24V+yYQwGsfWaDVM7zxhXpQs3IgkiH495OKzUbtEyVqNGNpmIpJ6sNpFPd747FIPz07FGC36SOgZHWPuiZohIC7xlT2qyb89cdBWGfnqMKcEiup4D50qG9R2YxZQj3SIj5fusGr6kDgOdkQvLahmQojCRlVW42dZdLq27fqg4oFnplszwfdQEOIx71fst6Pz82AT31RBMsyMGgRANEhL0dmZ1H7JJ8GgXoKXdu0DVp1Zcx5UUslrbjJXQ/Z6W0Bth6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3wTO7tGSg6dHazcIfzdvdwbLV+VShYFb/wGxTJRWxk=;
 b=HM6w8AnHV8Bmcu+cn3gnCfMwHCyt0nwdpsgnJsNjcW6vJqw3QZtO9bESHsKcMs0jec/8kiz7hvh1PkbFgOA96bzgSvUJumVkgljYAypgqvDntJLS1Dio0e1BtDxn+uUf2A9LyF95a82o77wGhHsVFOexJBaE2GsLospKf2otGfVYpCz9V1CJ+jN1o2tjGM+9ZwOXMM2Ep61nbf7o++wnvP9x8scxAffDT55uRjdi651dBzFu3zjAwTbqE7z+oALm+UOUGwccvxpsrF8cRvx3JLS6MnDQkWgF4CTiUjyqZ7sV4TKhSTcFpUD5JUChezgbxgPcoAnJDlv4LUUT3w8PWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3wTO7tGSg6dHazcIfzdvdwbLV+VShYFb/wGxTJRWxk=;
 b=f0yz9m3Npwkr1BIXGtk/7kE6HwjUVbd3r76LxpM0t+88g5zqEN/3XnjSOvPLblTzXivTA2C+mVPyQA3paKL2AEyuMXKRQ0V8l0v7sr+JfZ2WnlRjNHZSMPi/yAspA0fRiBT/7J6WnXAGVssKfipyHxbPYSGj6mx5u+zsawEDlB+G1lVj9c2WfdF9qlTM5AAI0CQh3Rxdi+7HvipbNJAWrSoI/n05Tco63dMqeQnaLR3cygMr7gw+5Cn5FsQyGcao5cJyI1aMsV18FPB4fUnASKKu9OLd9GjjYKkvTp5FGJGk7EM5Ww2UfYJKwD2361VWAdEQdjhprMYz7QdmSo7GMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DUZPR04MB9795.eurprd04.prod.outlook.com (2603:10a6:10:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:37:29 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:37:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: fix a typo 'HishSpeed'
Date: Wed,  4 Mar 2026 19:39:16 +0800
Message-Id: <20260304113916.856841-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304113916.856841-1-xu.yang_2@nxp.com>
References: <20260304113916.856841-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DUZPR04MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 634390dc-bd01-45e3-d2ed-08de79e26a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	t+UquFsVB6LS/FV/JEdIMZzvlxnlUjHG+46qHxh4Ddcf7gLZrB2/fh6+PJbtC7fM0ofMhJujiHSnfgPU3YObyjwK+Sninlpmz/8uOugd6XHPAtwjr/N38lKUyCLHDCKFRLx48OlCr64Lt0Y5lpIK2y1LRy4ugOeeFFcl2H29vIhxXyuCM+caraZLh4pzD3BCU8HsWa1X8gdaKH03Cp3LYKqkyCJe8ftg6EdhcBx6swqGd914me588ZpmEYxVDhKVdo1S8JgLmnH2/NNb2GFHmGsvSQrc2kL5jFAzXs5hEBK7WxlhIP7YfB6hTNrBF9IYUraA7BWmpOAA9kFWMY7VOQbI2t7Lw0fHFxr3IECqMlmTpATvrG9LwszR1il03i86/HgJdguKEUjzL/JYcs2/l1hBGVmdZ99eJBeEyj6q722NIDrWxweNnEKhW0hWY+ujHvQyvdnb0g6PXtlv8FaP65umKPqF5LftBRcS8oeLpUa633dcfxIE49C5W0TQpQVeAfdCOfFPYX5v09skwPDNKK+ntU3IdAymEj4RPkxxvlD9tD+k8ZvHnjhMva6oK8Z9xwvCEPuSGAoZ6b6ghn1qH+jPV24PfNE2v4BXXwPGLs9NDxYnGGh7A+6zuNAU5rboeZFv4JO6Q0AMc7X3ouCpu/guPNUpL1vnimhs8fVCzt5uxCPSXC/QQ9J9iAWVMoCPrCZP3mO6OAkAgS1CDliGbldB7N1oA4/uJ8cf2R/OYG0Q7xeGtkzgI7/vro9XYoMMwMSgPBx53H/+TBF8VyY8+L2Grvh4ZFP2MpTJEE6F1+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s42MxlEuqYdGzs9RLV/S2wJQQeOj7HwoLvnwaZDnNgnXzwvOU0nQLyMRuu8M?=
 =?us-ascii?Q?pIgKh0BxD2YR0vJxK6wTijR+oGeRrGJrq4JWUdrRYF3Bug5Wgli99yJJMUeP?=
 =?us-ascii?Q?ms4UVfxCUg6X3LnNqeQWzt9xs9c0cErDLdRtOrnH2wdDsGshchD8cJD9Co30?=
 =?us-ascii?Q?gtcRdhiMziom03yL3hRBXosTJuo1+thKGxwwZKUMR+6zwugeQNzktDuOQ8a2?=
 =?us-ascii?Q?wYhryCK3E4amxVuCsgmM1/5/c51oHxA8+xcmqcFZgbMZpwcp6Cj6/ahWRT1h?=
 =?us-ascii?Q?NREApuMH7HHGlPnjEHGBTtWE2/teHwC24KFA3ol1eOf0DzjylggJhIuyGQ/L?=
 =?us-ascii?Q?alKPOr9BG76aeoZMO+S1FXvh1bRALNxkYGH9w19Sc3ijum7M3UqqND5SZq8c?=
 =?us-ascii?Q?vjfuD6snRUCuLXaKJktnNWckkVubY42RPF1jCl0/DcpEURaMIJpfThYsmi8l?=
 =?us-ascii?Q?am4rQ/no9w5vq2FVOOr+GorfWCokxN87MSHlewPU9C6ZPUWy/ZCin6K8tmEo?=
 =?us-ascii?Q?f1Fg/oKU71S5RuKgpLsmnmo9Oft8KvN3Sdfof0tNLeIgcUqJsCsISsEKZadj?=
 =?us-ascii?Q?MPaqkdAGl6jMHnw5gdDe/7xerTQgLPv+OcDuldgy5rRp7mKjNCY2IPUmiXg9?=
 =?us-ascii?Q?QoRgmw65wR9tLrBpGvxodgD6G51Oz+sG2/cpxJzlxn6tMaVz25Civ/jEnfub?=
 =?us-ascii?Q?fip0r541Q2GT1eB0n5Hz0NgFdPVXWoxvja9na0/VSKrEWASq63gUMWyRqxeV?=
 =?us-ascii?Q?pItNg3JV+cTMtH7+DXbUiN5Ra8cvoSl4SWwpbpTHFt1vs+BcQDbRGJqXQVLV?=
 =?us-ascii?Q?KeGA+N8/t8Qz7ktPEJlurpqbzwvygPQ60loznzPcPN8KEziEFi2Rfq7FYppo?=
 =?us-ascii?Q?vVsbccyKFJ3ASglFi9QB0b7RrAl7dOfBkTLdb5XbZ8PU+fHJV50VxtJWEtkR?=
 =?us-ascii?Q?6lVPNEsAfuDLB3x+Gsek7gJQy8jlY+wmfqCn1XwblIc0uKwYKF1hqz3SLGTG?=
 =?us-ascii?Q?1OGZ3T35VGC/Pyi/xonOdszUYFwvTzr3qzCclhI/REko8vEl+T/FXOSu6Rcc?=
 =?us-ascii?Q?uIWJqYeWrUFa8DFhTVw+IGb2WWuayY10QG+X6E6107+8p1JzGhxcL0NqSeiW?=
 =?us-ascii?Q?OVeOIlQSCodYTlqXa7aScQWerrjHlAI64B8+Z8mQ+NeZSBkOoY52RQJ5YyOI?=
 =?us-ascii?Q?VnWc5pMLGRh2H9ACWSqr/IRhLd0s6IVou09SWsmfx2cNKRZv7WlJwQNSvPMA?=
 =?us-ascii?Q?VQNgfowk24Q0w93O247grR0z3goTlGALEvnD5fkc2i4MCz421t88K+/aickA?=
 =?us-ascii?Q?YmcQDEen2ALkbD9IUVFplEfpAdBpVmqbPiMuSMUiEAsVd4XwiwUWy5BvmpSl?=
 =?us-ascii?Q?88KweCI1vrwAsOj09fkazr1WyIiT1v38lZaJcconsI8+j+ndgSag0VkQmkfD?=
 =?us-ascii?Q?ymzXekKIGG6S26ZD2SUcnNnZ2b/aQ29QRj57vN7NfwU3ozQK0tD8KArtxLg0?=
 =?us-ascii?Q?3k/JVHoLLkTfe9BZcT6m+YIMNT+NiV04ijusHEEqXWD+7m5whMFF42DK3V+G?=
 =?us-ascii?Q?n1QL4GAh8/W9Uuq8Y5u5OpWgS2NX0hjGwvAMW0pBds//sH/5xH4VrU16GVO8?=
 =?us-ascii?Q?M1+XiKPI+BYqqpHniixHyymkNFrF8HW5qoiQSj3lLk6z4EgIFkZ3RzqYMC9H?=
 =?us-ascii?Q?w+ad7oI/qe2LEyxhtDHeJsVStpWcrpT0vqFGCzblsr3jS3/kFBwTTJerawqn?=
 =?us-ascii?Q?SIfCRzqLuA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634390dc-bd01-45e3-d2ed-08de79e26a9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:37:29.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6w6N4ue3xHOYZsdTh3MWo2abbizGzCAXTdYTE/W0JyXxK0Ao084xK9cT90a7/lwUcPFGYL4H4MuMYE1h/QspJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9795
X-Rspamd-Queue-Id: C6C981FF1AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33972-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

It should be 'HighSpeed' instead of 'HishSpeed'.

Fixes: d21a797a3eeb ("usb: dwc3: core: add support for disabling High-speed park mode")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add fix tag
---
 drivers/usb/dwc3/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7adb8e74bd84..41cfefb34abd 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1151,7 +1151,7 @@ struct dwc3_glue_ops {
  *			VBUS with an external supply.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
- * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
+ * @parkmode_disable_hs_quirk: set if we need to disable all HighSpeed
  *			instances in park mode.
  * @gfladj_refclk_lpm_sel: set if we need to enable SOF/ITP counter
  *                          running based on ref_clk
-- 
2.34.1


