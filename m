Return-Path: <linux-usb+bounces-34815-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AZDFLl+tmnsCQEAu9opvQ
	(envelope-from <linux-usb+bounces-34815-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:41:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A640A290587
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A833302F99D
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF0F26ED41;
	Sun, 15 Mar 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="mu62XTWR"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022134.outbound.protection.outlook.com [52.101.66.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C97262B;
	Sun, 15 Mar 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773567656; cv=fail; b=kwrnwoRJgs/b2gzWn+PhluOyQVRsLzUz7NaXTXvV+QgV4nubvchezaBRy/Ct+6SEhXi+gIHorQ4RAYM7q6YohzJidX9aHdW6jVMKOPFQNEaIuykVbr8MvTy/VR4Z2ZvWzsrtP3gfL76qFzuL6rt0leyhQ/Jendeu/SYaG01t74w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773567656; c=relaxed/simple;
	bh=yHgRgDmuOOcvFapYohc8Z5EE6ebDbhwmBcrFiAhpGzU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OKFFLQpFhKTHRDvxM94XilbYTmOxtIx8AyofNqLkRNtpwcoojokmzgmIY3Pqidy7Fbk4VCnVpzvXI4cAfhn1B/Lp95aDeF2tl73k1vW+5Pu8tnH7rJBCd7qO+80SGHUcilLl4YkJFfcoUO3NXY8dzCqfpq/gO+3EVA4XbrF2Ljk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=mu62XTWR; arc=fail smtp.client-ip=52.101.66.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfMS9QsRoKauv/z3wvem1UbimMURJDnjZxFZP1jjdKiR2fV5T26j+ASl7csS3D3yl7G1lx89zodeKdkkVIEGiEzZOs+yPjzlBHUWv9aB4bzlHyoenrhKKPP6Ya8iZmypnUEys+PykkdzwOUtNBCnnrdaqWyOx0PycGxarMXf1/1J5/GDWe2S18Qkba2wPwIy6YarjDHt1XgllZet1U7Ky1Q4S+FjM1Wn63KD4JP2oyDfeGuIwCOFi8xnwtHn9y3A8cCVhtY/8Zn8eD1ujh3l2FbGMN9acRptula+VdFKVTMR9yyz4eh6XCJwkJlplANoTDNQNGw2flmJmJ1A46GBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1YROSfXvTeu2dr/k6oAI1iBex1vReb9MXKbarA8yAA=;
 b=f7G8spqiwGHex+8BwHoa/LQA1//oLKYak8tcVXnZTaJ3En/mdwS7ch9APpW1FLbHpxntO5akce0zFvGju+dfWBWBklk76C8Sq/y1CL1LNbA/WDflygPBaavzF1N5wRVD/QFN6iYHzl8AcQj19Ua2XygsDM4QvpSLus2iNdhhyjM+VFmNuqvnq4gXNBpQ3082G6Erd0RAOqYgw+8x3bUfLsRqfccGbVSKieOoVgXS4jFrPYkCbEfY3HwVkmFcJvjKzGFwCSmNcJyN8T2/jVnf+SHu9YHpQF8C5B9nxi7CHhPwoJK8Qz6u0ozQUyrYFA3QtdE5BsGhbpYVvgAK9H76JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1YROSfXvTeu2dr/k6oAI1iBex1vReb9MXKbarA8yAA=;
 b=mu62XTWRQhTgHl5lZDaWI+wkBSlI1SYlIylIv4vW2Dz0eE5cVAOjlSSBrCs/w9+qtQDW3+P1QJPPHz2NhoBlew0CPJdR0rBd8mO5rI6dMip5IvscXH/xUBlIiVpUlHzvP3T6Qg1Djk2WZoxJUDtSAQaLU1rk7pBbUVaZqymzDrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 by PA1PR04MB10843.eurprd04.prod.outlook.com (2603:10a6:102:480::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sun, 15 Mar
 2026 09:40:28 +0000
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8]) by PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8%5]) with mapi id 15.20.9700.017; Sun, 15 Mar 2026
 09:40:28 +0000
Message-ID: <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>
Date: Sun, 15 Mar 2026 10:40:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
 <2026031209-shawl-unshackle-f4eb@gregkh>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <2026031209-shawl-unshackle-f4eb@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To PR3PR04MB7260.eurprd04.prod.outlook.com
 (2603:10a6:102:8c::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7260:EE_|PA1PR04MB10843:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f57221-21d7-4681-b7a7-08de8276e41d
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|786006|41320700013|376014|19092799006|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A+N9Yw2gSjQRYRQZt9DffktuUkb+XAPPhvp5G1TlLiomLKpfw28ZEdDI71CiyIf0wzA73Ti91Ahdca+ARAGR0mii3gFjkhKfGuLAic6H6+p4V5DEzSpkWDivA+YWDERMY5SccDfhKT41vWD86WqwXdxgSEGXCHoKqie1d9Hn75xxcfZHA07kGnC0DUF3OFcTmU/zikpdokaDFWVTINyjeQaHrVPgIesRxqnwmjZfb6yaCAMVVzUF2WzbI6+dwZx883O7IDdDXAydpgJ1bXHwYBtCOxukRrV8HjHFz1ZhOhqChFJDBIcgkqtdR6Jo7vvwelKWx3cggEiflRrz0ch7QBCBosXAAJoxGg1XzO/T4P5+b+r9tmZ5Q3/ubOOg9DOlfQ9FCVJoRYy/HHkWh7d6vmClgCLwzt1DJgL0bXuNiocVLQw26sbJx2ehyb8ywIbymriS5jFM80dgpCGc6UJbaglQ5kZXAJphdbgYHsiO8Jjlo1fbBPV/d9z4woFOxG4ViWm8IKssFmcua1nIGWLVjjwuSY+78VzTy6optuxCd7o+4Kh3IQgw5WJi170CPXl5nsWm2SS5KTBueRDdtjExqwhsA24E4lYI61N9k777Gp4PHQ6x6D622ZEWkpRgDvDs7nB2hpu5eTaABO3wM6czUFxxHOAW8oblr75EkEoHnb01VBqM8jjP4ddfNuJ63A16dLfG97M92W3eE8zh2zghC2zzh8Wh05PUB+RJo9cEjEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7260.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(786006)(41320700013)(376014)(19092799006)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3hpbmZXSXZnRHRYaWF5eHVjQmc2aVE1MDU2a0hqcVQyeUFvMmRQQ3lObk5M?=
 =?utf-8?B?NWFnSlVBQjVZNDQ3SndqNFFmTCt4MW1qU3ExcE9oekN0Tm5Gd24xNkc0WUF1?=
 =?utf-8?B?RmdWUVZoWEpXWmdOL0dEYXRlR0RFS2U5em1RcGRMdU05ZTU3VlBSU1UxOFVq?=
 =?utf-8?B?eVladTFtSS9GTDV1WFhqTGdVZmFHMWRxZnRJemY2U1VSZmltM0ljQWRaV3Bs?=
 =?utf-8?B?T3lSMThLVE83Y21zYWRSRHYxcE8vWTlDVlF3T2JLQVJISTZmeFJBWjQwVmdv?=
 =?utf-8?B?aDBLRllKS3pzVW9XRHhNRDViODMxTTlnbTd1YXNaZm9PTllFQkQ3S01WWEt1?=
 =?utf-8?B?U3U0N1pHMkh5RlVNMHNobHZ3S0N0VWRtSzZVdm9tUWw5WGI5NlZuZVJIbDBH?=
 =?utf-8?B?OE9xa2NzN2hsREpLUlBtVTk1dlVwbnRISExJNVV2NjBTMWh6Q3NVblI5Rlh6?=
 =?utf-8?B?ZjBzcGxhTENJQWN3bVFnWmd4K0xWVkFCQWM3UERWOUFURHpDS2tXM05RUUFD?=
 =?utf-8?B?VDVjbnhrV01QWnBsK3FyTWFmMlg1dkFTeXdkT2JiVy90cnVGdWZhWkxibHlX?=
 =?utf-8?B?RzhXRlJHeHdIVmZGQmN1dkxUWUZXNmF5WjZ2S1piTzNBRVdSdTFHU2RwYTlp?=
 =?utf-8?B?RUoxc3VQU3dvL255UnYzS0tyZmxDQnhQWDN6MWUvSHdSNzlxUXBCajNjckV0?=
 =?utf-8?B?V3g4OXBadmpwVk9QL0tpRWlJZjBTUWhyYk9pc2MrV2ZodXlxamFLM2dIZVBX?=
 =?utf-8?B?MS8rSmxSSmVtbHkxREdEMzBnU1VMbEd5aUs3SlZsOHRqVzNra3JKamllajVq?=
 =?utf-8?B?TTJPTmV6aXNBY1BsclgvZUtsc2l3RjNCOGZrd1pyNjY3MnAzQVdXNnIzdklN?=
 =?utf-8?B?REYxWDZ2MFhLQTY1U1JyTU1MQ2dXMEMraXNGTi95aS93dFJVSGRleGlRcjBS?=
 =?utf-8?B?SHlEOVZ4eW4vZlJaQjBIUndBR0NUV3NTVHJWejg4Q1QrY09CcXVIRWduTUtG?=
 =?utf-8?B?OVVVeXUwWHNEQW9KVjE3bFJjc0dxYlk5TUdFTzNkd3dIWVJzMlRmNnlESGM0?=
 =?utf-8?B?azUyQnM2K0dZWWJrdUdCWThVZ2dqdHdMVVFhZ1ZNOWVBRld0bmpvSVVxRzJr?=
 =?utf-8?B?VmIxbjFYZkQvZ2R2Ti9XMXFNNFJUakJTYjIvZjY5a3h6eldUQnB6Rno0Qmw1?=
 =?utf-8?B?RFhIcFFrYXBiVVlsdFNacEFudG8wUjlzeGFJSXJSeHRWay9Ta3F5RUtEalJV?=
 =?utf-8?B?Q3IwQ2ZRWGFheUNvMFNUS1ZEcW9ObmZXK1dvbWtnS0ZMZFR2T05NcUZ5MHV4?=
 =?utf-8?B?alhORWxNRzIyV3kzRngyM0IxWmR0dzFVaXQ3UjJuUlFGdkZISi9rckU1Umdr?=
 =?utf-8?B?VklyY2RoZmRDUU1ZUlVtTVlXRE1hWXVYckRWT2sxdWdSWEpMdzB4YTRVcjRK?=
 =?utf-8?B?dUtTbzBadytjNkxDMEVjVi9YekxOZG04YmJhbGxXbkptMmpEZnhsSFg0U2xO?=
 =?utf-8?B?YUdCLzkzUVdvay90WWRIRDN5WlNtYzU1UTR3OVY5Skh6VUVVWVpCN3VneDNW?=
 =?utf-8?B?am1vS2hVOUlOV0RGcVVzUzJuYUErYVRROUdoRjN4cWtJbWFacmpaRTlBWnU2?=
 =?utf-8?B?cmZDcVNNcWYrZE9aWW9xQXRuZXhwbWJJWG9pY2w0NWFsMnpGWlpWT3BCdkh5?=
 =?utf-8?B?Z2pSRGhVUGhNZVF3TnJ0ZHUwVEE2a09kcm12NUNacko0a3BFcVB5YndTQk5l?=
 =?utf-8?B?dC93WWQ3Z2c3QUM5Y1REUlM1dEFGbjhILzQ3WXNkeTFGclpDZEF1OGFsQzU0?=
 =?utf-8?B?cFgwUWlZVGYzNS83VXRTVEI2dVNrVjVkMGxla1R3SGxIK2J5bVZaMUxaWThJ?=
 =?utf-8?B?YU5XTzQvM0FQSEx0SW9JMmpNcWRNK2x1N2NJNi9iQVRNSkUrWlJoZ0FMcjk1?=
 =?utf-8?B?d0Z1clk3NVo5SXNMRk9YOERueVpBNVJ1UmtNdHowNWxSTi9DOUNKdDMyMlhV?=
 =?utf-8?B?OVdudWxYWWNjZjZVZk43TGZUY0JnWUFrdzdYSllQdlN3YzBYL1ljZEZJeWpv?=
 =?utf-8?B?WEZMZk92eUxPWXdWVDlNTFVQaFVnZ09CMUFOMUtXNk41TFlpa0VJaGx3TzEy?=
 =?utf-8?B?bHFRdWYybVRveUxOalBTTHFydGlXWDN5dkJKR0FGUm55eGQ4N2VLdGMxTjZX?=
 =?utf-8?B?TnpyalRwK3M0ZTVQZ3diTnNNcVU1M1VDaTRweTdEcGt3NXRMS3QzTEIrM01S?=
 =?utf-8?B?L2NuUS9xczVQMDZUbll6VEo3eWNWREw2dktMdnFKODNqbjZINlZsQ0ZMbjBM?=
 =?utf-8?B?ZDdpQW83dm9URWQ1K2Z2TzlVeU1MUVdrcHV6cVNLZEJNNnhLcTgyQTY2MjVH?=
 =?utf-8?Q?VjrH1LlrzCXNtPCGQ/Sa7t4Q9GFI+xvcCn64UMqLKzspO?=
X-MS-Exchange-AntiSpam-MessageData-1: dI5nsrwntSBqGA==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f57221-21d7-4681-b7a7-08de8276e41d
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7260.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 09:40:27.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Av14hBX+LZUM0iqqGzzdYbmT42EgIiw8YcH9erZ3TkhVhU2hdAuKw5btpIOQtSsOeMrX5wyjFlE39tOssRo1Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10843
X-Spamd-Result: default: False [0.75 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[bme.hu,none];
	R_DKIM_ALLOW(-0.20)[sch.bme.hu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[sch.bme.hu:+];
	TAGGED_FROM(0.00)[bounces-34815-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bence98@sch.bme.hu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bme.hu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A640A290587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

On 3/12/26 06:02, Greg Kroah-Hartman wrote:
> On Thu, Mar 12, 2026 at 12:06:35AM +0100, Bence Csókás via B4 Relay wrote:
>> From: Bence Csókás <bence98@sch.bme.hu>
>>
>> Instead of "shrinking" the allocation by `kmalloc()`ing a new, smaller
>> buffer, utilize `krealloc()` to shrink the existing allocation. This saves
>> a `memcpy()`, as well as guards against `smallbuf` allocation failure.
>>
>> Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
>> ---
>> Using `krealloc()` makes this code from 2005 more readable as well as
>> robust. Nested `if`s were also unrolled.
> 
> How is it more "robust" now?

My understanding was (at least from reading mm/slub.c, and also by 
analogue to libc `realloc()`), that krealloc-ing an allocation to be 
smaller (without changing alignment or NUMA requirements) just shrinks 
it in-place, instead of allocating a new, smaller buffer (which is what 
the code was doing before, essentially "by hand"). Under memory 
pressure, this smaller allocation might fail, even though by the end, 
more memory will have been freed than what was initially allocated.

>> ---
>>   drivers/usb/core/message.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> Same number of lines. Well, not quite, because I'm going to ask you to
> remove the ?: stuff below...
> 
>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>> index ea970ddf8879..dfe61d8b913b 100644
>> --- a/drivers/usb/core/message.c
>> +++ b/drivers/usb/core/message.c
>> @@ -1005,7 +1005,7 @@ int usb_string(struct usb_device *dev, int index, char *buf, size_t size)
>>   }
>>   EXPORT_SYMBOL_GPL(usb_string);
>>   
>> -/* one UTF-8-encoded 16-bit character has at most three bytes */
>> +/* one 16-bit character, when UTF-8-encoded, has at most three bytes */
> 
> Why change this?

Right. While I was mentally parsing `usb_cache_string()` I came across 
this comment and found it very confusingly written. How can "one [...] 
16-bit character" be anything else than two bytes (assuming 8-bit bytes; 
let's ignore historical architectures like the PDP-10)? The answer is 
that the UTF-8 *encoding* has <= 3 bytes, not the 16-bit UCS-2 character 
it encodes.

> 
>>   #define MAX_USB_STRING_SIZE (127 * 3 + 1)
>>   
>>   /**
>> @@ -1026,17 +1026,17 @@ char *usb_cache_string(struct usb_device *udev, int index)
>>   		return NULL;
>>   
>>   	buf = kmalloc(MAX_USB_STRING_SIZE, GFP_NOIO);
>> -	if (buf) {
>> -		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
>> -		if (len > 0) {
>> -			smallbuf = kmalloc(++len, GFP_NOIO);
>> -			if (!smallbuf)
>> -				return buf;
>> -			memcpy(smallbuf, buf, len);
>> -		}
>> +	if (!buf)
>> +		return NULL;
>> +
>> +	len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
>> +	if (len <= 0) {
>>   		kfree(buf);
>> +		return NULL;
>>   	}
>> -	return smallbuf;
>> +
>> +	smallbuf = krealloc(buf, len + 1, GFP_NOIO);
>> +	return smallbuf ? : buf;
> 
> I hate ? : except where it can only be used (i.e. in function
> arguments), so please spell it out exactly what you are doing here.

Sure.

> Also, how was this tested?

I just compiled and booted it on my Arch box (with the original vendor 
config), an AthlonII X2 PC. I'm now typing this mail on a USB keyboard 
and mouse under Plasma, running this kernel :) I also plugged in a 
pendrive, mounted it, `ls`'d the mount, unmounted, unplugged, and did 
this 2 more times.

I realize I should probably put this info under the dashes. I'll prepare 
a v2.

> thanks,
> 
> greg k-h
> 

Bence

