Return-Path: <linux-usb+bounces-33975-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ0HLiYeqGnyoAAAu9opvQ
	(envelope-from <linux-usb+bounces-33975-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:57:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2191FF6A2
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B0853015B46
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0721D3AE1A2;
	Wed,  4 Mar 2026 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vGcZHbPv"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8D031F991;
	Wed,  4 Mar 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625437; cv=fail; b=CGDeryd7NaNLDfwcr6JldJe56cO7DVTKsFYY8gxHZMRDXMopyWfXMbbz+MCHSlCfJxP+oi3/sBoClXnPePbyyNg+ai/FNOEHq6qtlxNXe+rl1ZfXpXO95qTVzoFKexSofwxaocg1QYP36d0V54ZHWHsyafvB+7xPuHaQku+0N24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625437; c=relaxed/simple;
	bh=IzNE2fRT6ClMBjSVkwRdqHsqBHsPNx1j5Mfg6P9VaC8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ejcf7u0QU9f6/4iU4R4nNjF6+RR05Cy3TT1kwwelbdDXuN0xDCjx5K3YCyuvQQvCXeI9y7LeyUGQPGcTqMBAwHfdi3nApK4ZnpWVIWDis87jOSvZ/0yvx3fxU3stKdlXxFsTIm+n2WgHj6GyCjILcOhVF7ej6PCOHeDJPhT/7QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vGcZHbPv; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKsMd2oNm/w8gvF9ZZxbrmW1co4/sOOQ0BpTMLnb1i6KclIl21QyrzgrIvgJvVR6r9Y48QwGDY9bcztnbRSLesxdFOicolmWc6Zt1fQPjZiFi06LhYS4XzvV8Uies0IUDOgNypwPK08SRKcVp/LHq7lAjsdyGYa7vNMLezIN0p5ziBrazA1ocB/wOQmt31ZDDSF7Md43+W9gryUPtU8yoxqWhnbRJHsoiFe1SJWmYJaiIU2pUlLbNN+xC3KFCPxMhA8mMXtUrsvhsevJgEqcb/0MrHniZ9/A+E5wdvCLEGSbVvZhZDmDDaai1/dYM6lDKmt6QBTMSbhHBm6VarS7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzNE2fRT6ClMBjSVkwRdqHsqBHsPNx1j5Mfg6P9VaC8=;
 b=CY8/hr8Dcx9acjLPhTxQzTa0+2YsXZem+HGo1UvXJa/JwNHUfM4icKwPxL/LiNe1WQdBD+MyIo3uZ2lPOkQTfmb9YRtSkbtbDIhHI88gt45qdFqCp+pv3OzNLjbiZ4c3obHEkoIhVV87IjttibnpKS0u718/2kn3wXVYgH0FcXfO1WWTdUu9bu3poAvLCHlUBxc8jPTTFOv7s7ljP2xqnYiDqFXybbe/MBU0HrelbLCxuDH/7AI02+D7ICIHs4n05WY7zzBQFVITcxW56GYP3l4QUpIlz8GGNZekAPUpub9y9yiW+1jEfEcXEwy9ZRCEWRbynlG6LUHS+rlhil5NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzNE2fRT6ClMBjSVkwRdqHsqBHsPNx1j5Mfg6P9VaC8=;
 b=vGcZHbPvVnyopxixarJBQkdVB7Eh0KnMkxlaRwQZf9DNvdp0hZJpCY/Xllr33TZg54ctK2PvHWXtEvHB/74y0A21WrCOXb66qcBi4mKv0JJu46Mw14cdUAneMUJYmHDK5Fa270Ga4X0lI9O05EWSMgx8qEXtiES1oAueiKANDv4RmjSXgIljlLFPdKgC48MEFNdAVdVVUZo49OLjvR2Fg2NZK1fFCIWO5oHZLf+vkdD3Tt2o2yOvKbW3io4ADsQwEsaMak7PqE38RamsBAq2ezV1xSj1YhngYpfR8sS+Kj12IT8jtNWTO9tNd5WbvgkLzNMaiMa0JURDToi40w/J0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10041.eurprd04.prod.outlook.com (2603:10a6:20b:67c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:57:12 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:57:12 +0000
Message-ID: <f080114c-e13c-4253-9f04-baf148a22d57@oss.nxp.com>
Date: Wed, 4 Mar 2026 14:00:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] usb: dwc3: fix a kernel-doc issue
To: Xu Yang <xu.yang_2@nxp.com>, Thinh.Nguyen@synopsys.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260304113916.856841-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260304113916.856841-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10041:EE_
X-MS-Office365-Filtering-Correlation-Id: 1281d911-5fd7-4b3f-23eb-08de79e52bf4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	QFlNmuQZCsDbB/HoXkQtI1fuMmthDeiyBBwkRUoWVrZaMCVffgiJgXEKYvnXIv/jeKflBybIuGfqI8MOo7UHQowwtaX19tg4StVhAb9RpNw5NlQeX3qnnGzBMqAsgt5lD68+ZD1XJrqheH4b5ZWCWHZdzmLPJOTw9XCEj2E88aZ2W4j0q4249EJ6fc+5Dbgzf+qBEmAge+FJnD/SqSA2kiiP/HnnjrxyMS972F1+c3qD05ZXXZM9JDN7DyYR6adu+S2WFz1wSDkmcLSi7mre4k0XXmdtIAbbMhMxLWwdFECMGuK7fLrGniIx51IAKtHkYvbU2UBfuCfs6OjGQe9WnmP1UASY8vECqhOOVd3FJCj6Q4PupC2gxao1DBYUnENmIVZ4kTAeU7B3XESq6kuxD+7tAucE1vTplevxv6tv2U4W/yQxSsGXTDemLQKL8jaz5A1EbW6EVkCWyTVuC77Ua8RnyKnA1+DY/BGlptU36ncFWN3MkaAWp904F1e4lKuqIcnNRvoQi12fDZ3lqPupwdajLQa3XIBIeP50THpBCVPr7F+HBwiaZzx3DqcA5VKKmB0GZA2jxur0qEoFWX3UDQVpAV+RHp6UqqK4qGLqyuqwAKRqyw8THD/PwciDNx5mvFBeW2zeH1EWXEDdj5HPmY6lKsJTIG/eb6majEmTtcftFZwLHDqV7vUDAebbTW8dJyOf1IMucP4x3pGotY3MlSauWsPv3+eLdiKIBfxYFww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmhHazRvamRHK0RRMWV1ZHdUMUJYK2x0RThSdEJPVEV1dUZFZ1U3d01WWEdz?=
 =?utf-8?B?Tjk1VFFRWFhVRG5CRlZIaUdvYUdvcytKblhPWmg2TE16RXpRclQvTk9YclZn?=
 =?utf-8?B?dU04d09XSzgzSjYwcDNybCtWYkI4TDdMa0hwaVRKNG1tdm1ML3BudVYrMThP?=
 =?utf-8?B?bFdLdWZSeEptRU9xaTZrZURTbURaZlRrVm43MzFreTdWU2ozeVRGNVozbUZp?=
 =?utf-8?B?WEF3Q2pEK2czRDhIUWFhWjUzNlRXUmcxeDVnNWd2WEVESFltTDNmTEEwUUNE?=
 =?utf-8?B?V2NNOWhHOWhrSlBhT1RmSDR3MEhuYU1ZOTN6LytWZEN3N2V1YzN6UkhlYTBC?=
 =?utf-8?B?K2w1MWNGTFRHKzlKU3pHU3dWSUNKRzBUSHJEd01NOE9GTFFMWmFVZFQ4VnM2?=
 =?utf-8?B?WlBxNEZoWklKY2t4cDhicGRob3V5aUIrRTVyTVNEL21oN3NIbXlSVzR2T21t?=
 =?utf-8?B?UnpaNFhGd1RWL2NENG13aW5rdmdaNEF4ZEZweHlFRVJtS1JNMVpNZm85YWxM?=
 =?utf-8?B?ZGtQQjJsWjlZM3lka1dXMVRwL2ZrWk5jT1dFME5DOVFuNDRVSHlMMEh2bi9B?=
 =?utf-8?B?R3dqMEp6VGwxWldFYzlkY0NWWUwrQk1EeXUxWUtSVi9oTWJVd1c1MUxnUXhC?=
 =?utf-8?B?M1lYZGUzNUJZazdNSEJpYU1WR2IyTjhiemh4dFBDVzlaQlFJOThHU0xkT1o1?=
 =?utf-8?B?MUN2MVJjZFFoallOZllHQVU2YXcySmJtYVVZSTVwUS9odlY2eHV0cjgyZzk2?=
 =?utf-8?B?ZjNsWmRPdVlHbDRvU0krZkxlaE1QUWRSTXVPK3JFc2RGWjhMZnNadTNBTFR1?=
 =?utf-8?B?MU5sLzRqcS9WT3FQNjBubWp3TFVWSFFVOGNYQWV6dWFwSjJiQUlTRHIvdVNt?=
 =?utf-8?B?NDY4aUlpR2xwd3VTQStkRUovRCtJSytKTjc4SVZuWnNNM3pGYzkzM1ZtRzVE?=
 =?utf-8?B?OXRoTTdCb2dEMFRWd2dudE1UemV6UThoaGtLejYxRXBtVmhvamM5eUpsaUdi?=
 =?utf-8?B?Qk5oc1VrWkhTaEpSbUNEK3Q4a1FNSksyVlAvVU5uR2cxZ3QrbFU4aDUrQlB1?=
 =?utf-8?B?Q1ZUMk9INkk4ckpYWEZ4aGMxWVhraVQ5YlhmN05yanFyYTVaSFZ5Z3FoV3d0?=
 =?utf-8?B?c2RpbzVNZnlvczkwSWoxbm43U1M2THVwc0hSQUNoOTRuMWxoanN5cGh0UTBV?=
 =?utf-8?B?VVlCeUtGalN5N1lsc3V2MXZBUzVZSC9GblZYNERlMHdPSnRpdDhiVzgwQnRm?=
 =?utf-8?B?bjBDYkw0YXcrcVYvZ1dOR0wzc2tvSzcxaGlVNGlnYlJYTFdRSTNQOWh5K1Jt?=
 =?utf-8?B?UGFncXNSNnJabmwxaHlKUlRIZ0IxaXpKZ3VYSFZ3YTc4T0VhLzhJOGdodHpH?=
 =?utf-8?B?RkZMMDVVUWJSOE9qU3dCeU1Zb2NmK3MwSGtXUnBUVGVxaVdaSnQzUVBNUjVi?=
 =?utf-8?B?eThWaGJvVmttelQ1d0ZzTXJRWWl6N0d2SkRyeEN2SjZXSmQ1RHQ4TWtJNVdm?=
 =?utf-8?B?R0VvUFZVemUzQm1Bc1hMaG1XODZBUkxpUVQ4YitMUFR6ZGpOczlHcmpaOVdJ?=
 =?utf-8?B?UHVWYlNyM3RJWWdqaDB2N1BLSXAzL0ZEQ1p4UXV1WEpwR3YxTEJGaERRb2dX?=
 =?utf-8?B?d2Vrem5xRmFGdjROOE9xZm1LbmFiS1ZXRi83eE9UOVgrcDlrQ0prSkF6R1Ji?=
 =?utf-8?B?MHlCQ1JwdFJxVHY3TDlLSjhDaTZVcFEwejBEczVMOUcrcnNMNjArcjlLeS9G?=
 =?utf-8?B?VjdCYVduRVd1UTJyNThBRENaRDhBSTRFaFZWUkpDQjl3YTQvVXQybmJFMFpH?=
 =?utf-8?B?d2JMdW5tVUdSVS9XSHp1MXcra1Zad01mUEdWTnVLT3JRRHJrRFlHN0d0aUlP?=
 =?utf-8?B?Q3JyeTJUN3NzMGJhcUZUeVBhT0NQb3NyRnFoNWdHbW5HUi9odDl3YTZXWklY?=
 =?utf-8?B?RGErTGhDQ0hiOE5WNkVLck5SQ0hNVHhWR1Q0ME5MK2NqY2FRZXQyZC9SbUox?=
 =?utf-8?B?bVluS3lvb1BRYlp1SVJaR2pmbEdRV0V4Qkh4aUtBNEk2UDhvdTFsZk5jSjBt?=
 =?utf-8?B?QnYzblRKanhNaHQrQU5mUGNWdDEvZnp0VnAxZXVwNkEyOFM4VUhPaVc1T21k?=
 =?utf-8?B?ZkNYSmgwODUrYWtMRWVpSHNyb3FLUWtFcEhXdEczRzZWbHpDb1lmTXJjdTB3?=
 =?utf-8?B?V2dCRkVlbWNUeVh2ME9aK1BCcE9ZNWhES09zRitudGhuT3I0NUtLRTZYdXIy?=
 =?utf-8?B?ckJaWFc4a0N1eWxxNXBZc0hnc2Q2VE9zdGtJcTdRbEVPZTNibTI3d0FiejZn?=
 =?utf-8?B?UGp5WFBIR2szMUNRbGhOTDhXcEl4cnhiS3lXaHdqbWxGb3FpNkNDQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1281d911-5fd7-4b3f-23eb-08de79e52bf4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:57:12.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJmVowS/ZvXr8yHV8wrQeQmLJpUQ4qH2dlbkoT+nTBkw+vlFq0pY51f4XacxiRCklFlQBMCPVsp9sgpf6esRyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10041
X-Rspamd-Queue-Id: 5A2191FF6A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33975-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On 3/4/26 13:39, Xu Yang wrote:
> Add '*' to needs_full_reinit comment line to fix a kernel-doc issue.
>
> Fixes: a717321ad7c4 ("usb: dwc3: add needs_full_reinit flag")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



