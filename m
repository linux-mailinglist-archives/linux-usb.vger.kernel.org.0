Return-Path: <linux-usb+bounces-37616-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIFxFOAkC2p5DwUAu9opvQ
	(envelope-from <linux-usb+bounces-37616-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:40:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD956F04C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FF52304953F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0311D48C8A7;
	Mon, 18 May 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H49ZKwyX"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEFE3FBB46;
	Mon, 18 May 2026 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114559; cv=fail; b=En2f9Amz9bK5rzGDmqB+6/oTJgIwZeERKGx/kGXa1PJGuhg340NHYjOdXRRhC0FRmRkRjDCfpC6SPFLU4ghHkVI+R+MmNrwVYVOflFa0gzdmWEoAVcZ86ZgndZLEK5krySQm7+Z9KoHdRBIXfAShsUswCSaeMER20Gp+33SfXwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114559; c=relaxed/simple;
	bh=7vG1HlFEiGE9eU161hDJ03XhO5KUy4oERds4kMCDo0g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pTXtEneNlk2x8oLsTzbs1zdkyz1sEcYSdp4PW5QliUy4hThShDUPC/GIGF++nA9BaO+9Hzogr+yOBzsJa9N97kKmXSZbgvY5CPLolVsu9ueqhoFrhlb9U780Dkb3SHHwQ1szpOCD6IYmxKgAHn98OCnUKHRokK66hx5tEQPjnMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H49ZKwyX; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tkw9/bw5+gjXWyjtP7JH5WSGcwEwxOul3SWYhVGbhwWPbl82nngppV1BUEYhRVynmVcRhbaIy8T5n6iXq4tLeZUiusAsX5aUwEcX8QmUa33pn+BnB63c7RTPoHLHAWhzQB2DtXoqBvCBeiWZBg57nZC7fB79tnYHvTY3zP14nyVxTIAjuFmcMVc6Vx0oqnEPyc7q7lsEEUi/4VrKizo2MU5owGbO31pf0PU+rdBQ0pO33mwZX3xIF5Y79dy3gK9101389IkOWsPes+K3+6oAzl+hRSsTPNcVf1FF9AUD0T3/pBNPCdr/FPMfmFGEAtaip3Z4QXBDmlhO2D2dRipgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbKtsr4yUar+j/7pijQkG+UE3fsvh5mQ4DE/1l7I1PQ=;
 b=ucsiRGHD1O4sloRIOh1GTGpGaOsZMxEXIXuxslHixNRgB0rT7WaGY3wcLPs7E+5XfrkeYRHqCxziYH0yHORWkJEXMgyosJa2CQ1iVp41xGzPAFJe3r63DupREBajMyAkzlghstSp4R15l29HDgweMXb01iCpGgmQc6cqV8/b2FGKlo21lyDbUDcvFt36aWQfj8Uw50fpJM/scy4pOQtupqZFRLLvfUV6bQ5ZUkQV9m9jYg4E3r1k5CgqYfcOPgW1s9OVABLHOegoSyfjdXuX4f0a693vldYXMucBBwTUbbx2MKR0nrW65SdSbMHkagYssvkfpH12xP7M5gKqvJ5J+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbKtsr4yUar+j/7pijQkG+UE3fsvh5mQ4DE/1l7I1PQ=;
 b=H49ZKwyX6WyRc9YFAOZHyRrb98PbnSLNJgI8W0vnX4l2EWwTqFxJXVlzvGkOXdSMdxKwIdd9DQLtf8R+ALUpknS48o2N7LFJvPZx9Vu1I/iPGsgzqZHzMVfmiJqsKcR5zBylID7KVIxRZYfRx1V7OzBejJWShWU/qgzG8Y38HYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ5PPF6785369A4.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::997) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 14:29:06 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 14:29:06 +0000
Message-ID: <95361d3a-34b6-4f0f-935e-9e1b45698e81@amd.com>
Date: Mon, 18 May 2026 19:58:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git@amd.com" <git@amd.com>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
 <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
 <agUltzvDFgJtPa6j@vbox>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <agUltzvDFgJtPa6j@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ5PPF6785369A4:EE_
X-MS-Office365-Filtering-Correlation-Id: bbceaf96-70e1-4c6e-a75b-08deb4e9d15b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2GF8pq8mQ8BR8Qq01TLSM3X0OKHwQ6RLhd2kIg25jYtuyMxindfxSH1BkvpRoEhm3xy6L8vglXa3wjeYJB7Tn1ET6xq0qyym7TY6d0k+l6wnU775uZrHVn22jWNKeyQZR4RM4jjvw+uWrmTEkM4cFa2nEkYkQ+DsHx8xSl8GLnsAFZYoMjeUEdBalQqQwuubHtTmMHHdG/5G7N+j7vgjlVj9W7Z4ev69FD9/19Sqg+CM21pR4zbADTTBR/ux7T8GRB61wCRu4U1f3YlsWDsTxWF3pmwTAEJus6YpcT4OORKLxBYyzAa6+0qPwn+7GvzGcPT42ZdNNGrwNAYAOOjttUmrz/YAPSVQmPVETg4Mkf8n2ciwTwaLMV3gYoygVO236YDGwhwwVajgIeusjxtGqIeovGYgycisrFjjQoevFpnHxTmbaD1uUf5ycEMpD4iU71U0Ktqiut/5QuQN7oc2RPGKdWVI23pEcVkLVKLDgHJCUgdFqUkQ7DJgONTVyVnYFnQn5UE2KlnO5nCA99+4kiqYpxwGX8X7IAzvpu6mKWIMDGUzAOpIxXuxT0x+kyFX3CQs0IhAuV9Qp1Qr1vO4+Ivx+OpZ7i+LmX4VLgxGWLy7XJoaxGiG1fWUnfO1qNVMxniHHjvoiMiYusNLMKL1hpV3Q4/vU+OkEyXzYDcIZQRKSTyw12KR2/QdDD+vLE+j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejF4THFNbmpMR3VMNlQ1YXhQTW5NN0ExaGtCeGxuZ3ZJYWQvL0NaemcxTnB2?=
 =?utf-8?B?WXBneFNiNjcrSXpldXBuQ0FVZ0IvSVZFcHlxRFZhNkQxVzdQajJ4QjEvNHJT?=
 =?utf-8?B?c0xMbU9td0lENGcycFp1U0pXcitZemFJb1M3a0ppYWdTT0Y5NFFlVmhsZlpF?=
 =?utf-8?B?aDZVVjJ6alFBcFlGM1dUNGN1ZTYyUmJ5cGF1dFoyMzc1TDFoMFZqOXRMR0lI?=
 =?utf-8?B?SmkvNU84NEVBRlBMempQMmNPcUpFMFhRUHAzRHJNUXVLZXdWd3dmdzEyRlVK?=
 =?utf-8?B?MzJieHlXOEZ5TGd6UEEvU04vZDBaNVd1SWdtK3g0ZURYMENrc3BZZUdiMFp0?=
 =?utf-8?B?WkxmNncrQnhZbis2V0xqbnJqVUdJblMwME5CN2tOK2NWYytLNVNlU0FxdDlE?=
 =?utf-8?B?Y0VTd0RFWkZIeW9ETUEvSzlTK2dxaENudDdwNHNWT3pKR21TTEQycVRIZTgz?=
 =?utf-8?B?VVhaNVY3N1FkS0pYNHI1ZlB5RFd4Y21wa2F3UE9PNk1CYzVTUXNjZzZjb2hK?=
 =?utf-8?B?Z3g1cEozTzF1YmlML2U2MFFlUUs4ZFJYR1BvcHRINE9jQVhSa05kRW9uRUpz?=
 =?utf-8?B?U1o4UnQ4WlEvaUhzSktJZS84ZjRiUDV3Y0ZDWUEzTTFUQnNhUEk3dTgzK2xw?=
 =?utf-8?B?b1VyeEE3c0JvRmVpaXVlN0RTUDkxcXdGekc0c0ZsRmFjN2hwUFlkMHpPdFE2?=
 =?utf-8?B?b1JxMWpJSnF6NTBRcGg0NWtoZjBCYVBvbENtUDlHeGphZFFmMTRIMDJmZlAz?=
 =?utf-8?B?bWh2cEZCQ3BWN2tFSkR3K3VoSDNwVi9tT2RMNXk1d29uMHBnbnpQU0hmOUlJ?=
 =?utf-8?B?VXJqRjE1VDZoQ3NDdzNVdWhRZG1zZVp2Y1ZyL2ZqL3J4c2Rva0xyUjd3QUg4?=
 =?utf-8?B?ZUQ2ZGxBL3l5SWF1Nk1NaytRTi93ME1adG41cTVkckM5RzNCV2pod0doUHkx?=
 =?utf-8?B?SWZHSTlVWm9JWHdyMWRud1lKMGxRYThOOG5DQVBPL09acXpFVUhGUHFrbitp?=
 =?utf-8?B?MjdnSlBNc1gyNHlPODVFUnBWeXE3ejBBQWZpS09rd3ZVWi83L0theCtKdkVn?=
 =?utf-8?B?NkV5RVVuWVZBeHlIcnZSQTlDano1NU5XSEozTTNMSThXMERxbUFKY0NHTUJI?=
 =?utf-8?B?UU1oczdmYldhalZjeHI5ZyswYk1odzhOUklMMFJXaFo4UVFoSVRvVHdPbkxL?=
 =?utf-8?B?UHlwNXBmaFdsQXpkRUUrMnAvc2dCZDlWbThieEN0M09UdjVxSTZTeDY2R1JN?=
 =?utf-8?B?UzVJZ0g4YVZRUTJFUWhvdi9uTlR2NmZ1YXdQa0RFV0RsZ3kxWlhwRG9HbUtJ?=
 =?utf-8?B?RlliNTBxa2szNDg5Sko4aVR4YWo3Q3Q0OXBENTRKMVNNMnptU25HREdQcFpj?=
 =?utf-8?B?K3YwcGtvV2xpakpmQTNobGltd1RxQUIxdVB5c3VsMmdpazFWdng5ODgyT2Q1?=
 =?utf-8?B?ZVlwVWIrdE40WmFXWlBqdTNHUzRLQ3BKVTVaeTNOSW5GNnRTd0JMTTNtVFJR?=
 =?utf-8?B?MWdpQy9RODhtRG40OUo4aVhZcGF3a1dDU3hZRFFNYjVEOVIzTERtU1lYMHhD?=
 =?utf-8?B?YlVtZzlwWVRRQzdXUjY1UVhTTERPZm1xUWtKbmIyeDBqcUl4Mi8wVWNyTHBo?=
 =?utf-8?B?SjB6ZE14emJFTW1QRnNWZzl2dVJ2VVFvREozaDhvMlBaWllzaEpIT0xML0ky?=
 =?utf-8?B?NDZMY2IvZmVVcml6ZHlmSUU1bVU4dHhqR0NXd25IRUJkVTR4VFNhMjFSVU9Z?=
 =?utf-8?B?WjJhMTNJVXNpdUJUZHJiVy9LWW1qQTFHbWRZWXBBN2l2ZUxneGI0M2c0WWR4?=
 =?utf-8?B?S1JNdTJ2K3dOQU9hdk1VRk9rUmxFTWE2K0FhdVpha0VadlE5ZldZUndPdGkx?=
 =?utf-8?B?bVdjV0RwUXpHbHMrQXd5Z2Rxc2VXSU9iK0RTbzJBejBFZlhDcWZsWVlwRWcv?=
 =?utf-8?B?c1M3eXdJS2ZwbEJxVHAyRjJMTXgyeVM0dHM0SVRJUGlvNzExSWRES0Y3ZzZ3?=
 =?utf-8?B?L2x2R3NicUhWcFp4VUkrTDZSQ0pORU5ES3ZwcGd0Ni9Vcnl0TmJETDZYcDNT?=
 =?utf-8?B?WDNtRjJwbW9CWHByTDd0RzBHUktXTVVUbWlEWWR4N0FRL04rUjRmZlkvNjBS?=
 =?utf-8?B?cEpscTJXQ25uWU5HQUhtWmtsMUNPQ2c5ZFRZcnl5dFRzelovaVd4a3VidlJT?=
 =?utf-8?B?TXRFRUVvV1NGV0JlRVBUZGY0YWFoRlRPbGJWc3hLYUxNZU83YUo4NnFXS3Vn?=
 =?utf-8?B?L3RlRkpITzFlWjU2OWRBY3FhVXVpZ0lKUmtzNTk0eGtoVFFFZmtjdFd2bWpC?=
 =?utf-8?B?NzJDK2FEeTI3VEx2QVdQd2JjbkhLblhlMzVUU0pCQUhGcXJmYTY0UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbceaf96-70e1-4c6e-a75b-08deb4e9d15b
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:29:06.6910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kR2X73VMY9VNvpqeLS/wb7AUwLYb41nJ6gc1BNtQPGX+ac52VYVLQAPWP1M2qc+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6785369A4
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37616-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 50BD956F04C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/2026 7:04 AM, Thinh Nguyen wrote:
> On Mon, May 11, 2026, Radhey Shyam Pandey wrote:
>> Replace separate reset_control_assert() and reset_control_deassert() calls
>> with reset_control_reset(), which pulses the reset in one step. Report
>> failures with dev_err_probe() and a single message. No functional change.
>>
> 
> The behavior of reset_control_reset() is a little different. I wouldn't
> call this "No functional change". However, I assumed this was tested.
> Please provide a proper reason for this change in the change log.

In the dwc3-xilinx case, reset_control_reset() routes through the
zynqmp reset driver and invokes PM_RESET_ACTION_PULSE. This triggers
the Xilinx firmware reset implementation, which performs both assert
and deassert. Effectively, reset() issues a single SMC call for a
reset pulse instead of separate assert and deassert calls and moves
IP out of reset.

Yes this new reset sequence is validated on HW. I will include
above description and respin v2..

> 
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>>   drivers/usb/dwc3/dwc3-xilinx.c | 16 ++++------------
>>   1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
>> index a3c7dc258c7d..94458b3da1a0 100644
>> --- a/drivers/usb/dwc3/dwc3-xilinx.c
>> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
>> @@ -98,18 +98,10 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
>>   
>>   	dwc3_xlnx_mask_phy_rst(priv_data, false);
>>   
>> -	/* Assert and De-assert reset */
>> -	ret = reset_control_assert(crst);
>> -	if (ret < 0) {
>> -		dev_err_probe(dev, ret, "failed to assert Reset\n");
>> -		return ret;
>> -	}
>> -
>> -	ret = reset_control_deassert(crst);
>> -	if (ret < 0) {
>> -		dev_err_probe(dev, ret, "failed to De-assert Reset\n");
>> -		return ret;
>> -	}
>> +	/* assert and deassert reset */
>> +	ret = reset_control_reset(crst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to assert and deassert reset\n");
>>   
>>   	dwc3_xlnx_mask_phy_rst(priv_data, true);
>>   	dwc3_xlnx_set_coherency(priv_data, XLNX_USB2_TRAFFIC_ROUTE_CONFIG);
>> -- 
>> 2.44.4


