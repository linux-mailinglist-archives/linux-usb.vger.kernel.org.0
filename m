Return-Path: <linux-usb+bounces-37788-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNtTBsikDWpM0wUAu9opvQ
	(envelope-from <linux-usb+bounces-37788-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:10:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6658D5C2
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB05D31123DF
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5A936404D;
	Wed, 20 May 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H5r2gIzI"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D034388E;
	Wed, 20 May 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278170; cv=fail; b=Jx9doJHkks/tDOWU6Jw9a9oQ8bR56Nb4vYL3y7Zcg8iREEqxTgiS132VMhj/s/vH3k+MEVMYmOYzc/pFG5RdAIoh8MNbha3b2db8A6fyCIWGoe2Mmg6z9s1NfTj7GwaHWKKn7U8H05DThKuqOBtGVPtzsLOFOapBdQGiwbY3BFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278170; c=relaxed/simple;
	bh=frUC3fwJu69GzUM6YR5ailZk9GUCxBlZzLdmliGnAp8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nH6sim6kZ7B1/nJi6menNPWnbvmd48ltS//YezXpJLrG7xtwQc/Zz2or6p6bwRAeTr5lQKSawsEQ1flSsX9ptV4u7M32FiCUwfLcKDeBgY1tRBTaiID5orG5ZQpwVODUXFsnaqqRN7O4tNEDPmxYrTjK2bZN0AOoIbUjpNyPUJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H5r2gIzI; arc=fail smtp.client-ip=52.101.193.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5+eTfHfCpXGv8pIM+5XJ6WJREZtMnef4zi5d7krvhnjX9EIGXz7KeKs9cFa6K9PMUuw+DcvggNHae+zUW3devsdz32ReQAoTV7mSno2uUtpQZGD6ZqQvGZGdbXXf0/Xo+0qLEY6LrwrHWE7BmO9uAJ0x2rFdnY/3XkKd1+yiRMwiUWwMj8m7/25tynM4Qf+NhYeKKxqdo+fr5gSS+wgd6Nf27oSSnfqk1pMC0a9dcAVH8MdjuqGSsE5h2cXIQFNsdmSj0x+LKRhR95brYSpoUnjBGDh2ONdjH3YFOCQCi4ZJwptDxidHtiB02a0hmquL/nYbd7Yy5rrJDQhgDv0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WH1TYXWpwAW4Y4n28ukZw5TCIsuM9Hh1NUaGOvqdngU=;
 b=Oj0qz0kGbckAFlJEgv32U1qDwfV8sSlmZfZqm6+sgcLD9f+V/PSXtrWERX9KFwKaLaMMhYrLCHptI7hOZbw+qMhbWCr1QPYepRJ6wyirTTvod03uYBCbdUyw4Vk1QZZ4OZMXsMKSQJbW0uFCVnBsr9dQe9RNJHh1FZrX/waLqBkfZDsjYOyEcE50y3agqxkMJxnFd8GxJqv6NKd2y85MHUiXmxNouLCFOQSmU5QP3oPDk5xpFj1sQLUiqnzjK/qOvcopkFcd4mhlMenOHm3c52FsP+e9drj/jyShy5U4gKoFifPgR8LnhogfbMbvhem5ZqvTsHG9+65l2llBhh5+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WH1TYXWpwAW4Y4n28ukZw5TCIsuM9Hh1NUaGOvqdngU=;
 b=H5r2gIzI7kWJj7d0S61yNwBw8xyGvBddnGk7CSXsSFrpfez0FBxVfM/zQotca2y1PsjICpPv1UtLgMcdDEPA9S/KN48K3p7ZmFFU725RrIAby6G1Lt3E8pDoJxaYYddwbuwCGyHoIyUlhjYOCB0QeoBK5GJdQQO01ckguhpVnkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:56:02 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:56:02 +0000
Message-ID: <acff898d-529b-4a24-9173-ad21cea08d45@amd.com>
Date: Wed, 20 May 2026 17:25:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com,
 p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
 <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
 <20260503-enchanted-galago-of-relaxation-dcda7f@quoll>
 <f9f25ef4-a541-45a2-b98c-4a411239993b@amd.com>
 <a51d0e53-3134-475d-a19f-67d7d0695cfe@kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <a51d0e53-3134-475d-a19f-67d7d0695cfe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: ade7141d-93b8-4649-64f5-08deb666c3d4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|3023799007|11063799006|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	JlqMILnIIYrwfckDK7/+1LNHflPkXvOX8O8Css/iihdX+/exneVXAo23A/DJV5wFQjivToSILdd8HVfwW6uMsEW4XO0aHa1nF+9b9ufnzz02n4zHivWh6AoEw0dr0OMEeNH5t3tv9JdO8pmvGfFO9XhxpLdv648HvtYelIvy2Lj12zLhcsjVpFzwMPGMC3RLDGGD4szW/u5jXSmaIqKi98lgW+CI7vjE9UD0rCeJBchXJW6HRM8bE6paF4qzZJHIPm9WIMHEGDHjXmS4uR4n/shRrpBXtoY4Z2Dg6VZQddyjopS7k6i0SY6JoCIlVwIPmQqkMyXkEZar/QDml3o+pbJsoCFlVfBgkbEhqQSp9An+1RCNQ1qPlvbdOZ6ce5Twt2d6uY9haARkq6+Kn8Hg8l1F+t8wvBn046HRsM9Yz8sbyKpCM0TpnLXWHWNYwwTetMNDz2S27gJJPOdvIirR/3FwyKc9ofQd6KtFeN2raAkRs4rxNG/Aacp70ayMztglPVC4EJMur6b5CHwRrnjaieEcyhZbWPn07vkVp3Ukq7PxVlGGsZmKlaX2vLUzjMaunHJ+eFMcmmYLLCUF1iSOp5YFofjj2DQ7zmgVzl1t8RVK5Tu9HB5gXJtbcVCYlXq3RzpV0wtuIZz7ghpO4WfHZSZVTwmgtDabVpHhq7rrJIUU9iyBaCCtojJlZ0PO0cDE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(3023799007)(11063799006)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3F0SnUvQmprTlk0OEg3L0NHZERRQ3crMDFKUk1KT29jellKbmhZTC9yVEVS?=
 =?utf-8?B?bytuRXBNQVVyTlNENWVKVDMvK0k3US8zZzdDbCtNVGpmbUZhMTFLRGhCOG1S?=
 =?utf-8?B?RWhtdFl4eEkvaWFOL2ptOUZQS3JEejJiSU5xV2lYMUc3dThQSXU2MjBNbExK?=
 =?utf-8?B?OGNLRC83VzY5dUJSWHY0NmwyMjd2WmRMMjRRbFdBd1FjUzVnL3dqK3J0SXZp?=
 =?utf-8?B?cUdHUmtZTXJHV1FmSmVFK1NmLytHRHppYXhYUk4xRHYwUWdUT2FURHFEN2hz?=
 =?utf-8?B?aTE1cVJsOVdjWTNPZ0xSNEx4WnNxSFEzSlkxUU1hYmF6VGlhRGtsVzlId0Jx?=
 =?utf-8?B?UVZmeXhYVXZieDFTSXY5WEdkQXo5QlhTb3ZMZVViOTdzRWNvNmRVdEs5VVNp?=
 =?utf-8?B?MHVJZ0lQVEtJWGFhNDdwcnNWcW1qNjVKVUp3MzhHK055OFk0YlRwa3N3Nkpy?=
 =?utf-8?B?RXpyQUhRTzJkdmczOVVnb29DVjBLTWoybFFCQndTdTRVRmdoTXlDSWlibGp4?=
 =?utf-8?B?ZGdWTmtBVlR4cVV5YzUwTVJ5OUxncFI1SmQzV1FyT0hkV0lRNjJZa2l4SzZO?=
 =?utf-8?B?ZTRpNW1LTU9tbUtYS3IrSlBTcURmNDJJcWhhbEh6UGxjZzFOZkdnN09kTVJn?=
 =?utf-8?B?RVRWL2IwcmVjTlhFcGJ2cnlKdVpFNUNLbHVaNkVobmkyUFo5Wk5QZVhXN2Zi?=
 =?utf-8?B?NDZjUVc1Z2ZEZFl3TUIrZk9uWHF5enYzWnJjY0llWkI0SGQ1TzEyckd6NnpN?=
 =?utf-8?B?djNESVM3WTFVQ1FDVC9KSVpZZFlTRSthZlVEUVJxUy8rSHdYTUJSdEJTMnR1?=
 =?utf-8?B?ZzlZeTlzQ2ZLV2NzV0dRYlNBZE9TU1FRcWtVRVl2OHhQQmZUdUtEZkZibHdM?=
 =?utf-8?B?S21YU1hMM1IvaytTNWdOL2xXQjRtZWxFQzZJWnBxS0U3VWNXQWFFYnB0OWEv?=
 =?utf-8?B?QmVxRy9IRjlvQlROZFpuRm9DN0hEV1NObG9PVGYrMXh5VjJhQ0xSejNOVk8z?=
 =?utf-8?B?QnRsY2I4WXZMeUxUbStKK1hHUzRXSmh0TEFNL3ZMRTNuK04zaG03MDM3QzUv?=
 =?utf-8?B?K2ZHYWdCYnQ2Vlk1bWV2dUpjU3d6SVFaQ0hTdnZwVm5UMGkxcjhQYXZXTGNw?=
 =?utf-8?B?dUE5RTh5b092VU9EOENoQllIbmVLS3FkMkJoSjAra3ZXMGJ1MlAyUDBFQVdI?=
 =?utf-8?B?TWM5NWl1K3U0T0VxMFBROTVIbUlJL21yNk5sM0N6dGE1RS9ZOWxUQTJ4eTc3?=
 =?utf-8?B?TEErM3BZTkZiWk5ML3JXMjBKL2lFU0NGZTU5TWVTTmMrNzAwdFN1c1VJbFlQ?=
 =?utf-8?B?dEt6Y1VjY3ovREgrYjdXWjlMaHhlYnRwRXAzZmFKTmhIWkpuNElibllSQ1J2?=
 =?utf-8?B?RnBrYVdSRGR6dkgxMWtrVlJQM05LWUdVK3JtWDA4Qk1wT3pubmFSYkVxMmEw?=
 =?utf-8?B?bGNxV0g4bjJTQVc1QmQxejU5cWUvdXB4d2N0eStwVnF2NzFKREpGUEN4YWxY?=
 =?utf-8?B?VzRlOXNLQVExRzNBM1A3SVZENVEzYllONFpITmFSRzZySVlmazRxWndOdXEr?=
 =?utf-8?B?eVBmZEwvZ0UxeWZTUVVkT05hVnNDM3hCdzQ4VmZyaDcreDcxSThjMHJiTEVy?=
 =?utf-8?B?MUlGSkdDWFFSM29vUi9lY3RNMEpuR0J4KzR3cGJKQlF4bkhVQlR0dzZSUllJ?=
 =?utf-8?B?VTNpSjVaRnBzOXJvSlc3cDgra3RKNjNRT2l2QkZXaXppUVEzRGNUZG1ROHB2?=
 =?utf-8?B?YnhXNjFOOWtwdXNRQTMrcVJGMENtNE1XL3J0U25jYVRKODFQSXBSUUNqYUU2?=
 =?utf-8?B?NjlsMWI1TWFYT0oyWTJNbGdBNFcvTmVMWlBzdkJnT3dHcGtXMGoxTnZWWDFP?=
 =?utf-8?B?ajVPMTlKZU9tZnBScFdtSk0vNVJQRllQMlM4ay85VXVYRzhGc2tFK2NBS1k1?=
 =?utf-8?B?Vndveit0d1RvRXF2bWpiT1pGYTF4WW5DTkRlUGY1MEh2bERtUy8ydmUydFZO?=
 =?utf-8?B?SFcyL2xaVmZkTWhjcE9XZUdoV01RWXQxaUcwMXZQOE1JMXd0WjRTam9jU3pQ?=
 =?utf-8?B?L0ltK3hPRkZ1WjRMNjdwb3JMZndtVE9VNlpqRWVxOTNJUSs2bG8yYm51UUNE?=
 =?utf-8?B?NlQ1TFVST1dSNjlrZ1hBQUVMYVRBYnVId1NnaWIvcnlKaG1JVDgySk8zSldJ?=
 =?utf-8?B?R3d6ZDNqSGZVcVE2cWdvRjdHdy90NUxRS0J4dWk5V1R4UTJsVWlTTGdSNzVh?=
 =?utf-8?B?bmUySjBtYXNJVWNmOGNDYWFKZk04c1ZaN1F6dmNRalFXWnJ4WEwvQU15OXFR?=
 =?utf-8?B?TkpBUGszcnRpZWFnaE5lTkhQMXU4QWJTNGpmWTkyQ3V3MW4wcDB6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade7141d-93b8-4649-64f5-08deb666c3d4
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:56:02.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U88nrXllRBktbFvM22P9UPW9nk7DXMrbF2oip9t68HXUX9T5U0FaDxovm+qpgoK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-37788-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fe200000:email,amd.com:mid,amd.com:dkim,237.236.0.0:email]
X-Rspamd-Queue-Id: ADA6658D5C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/2026 9:30 PM, Krzysztof Kozlowski wrote:
> On 07/05/2026 21:01, Pandey, Radhey Shyam wrote:
>>> On Wed, Apr 29, 2026 at 11:00:47PM +0530, Radhey Shyam Pandey wrote:
>>>>    additionalProperties: false
>>>>    
>>>>    examples:
>>>> @@ -156,3 +193,30 @@ examples:
>>>>                };
>>>>            };
>>>>        };
>>>> +  - |
>>>> +    #include <dt-bindings/power/xlnx-zynqmp-power.h>
>>>> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
>>>> +    #include <dt-bindings/phy/phy.h>
>>>> +    usb {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>> Please follow DTS coding style.
>> Thanks for the review. will fix it in next version.
>>>> +        compatible = "xlnx,versal2-mmi-dwc3";
>>> I really doubt that DWC3 block comes without addressing space
>>> (registers), so either you just misrepresented things, like created a
>>> fake block and syscon, or forgot to combine DWC3 with the wrapper.
>>>
>>> And if you built with W=1 your DTS you would see errors. How do you see
>>> it now? Where do you place it? Wrapper must be outside of soc, but DWC3
>>> child must be inside. Did you read submitting patches and writing
>>> bindings documents?
>> Apologies for missing the DTS sanity check earlier. I am summarizing the
>> problem statement and possible solution. Please review.
>>
>> For MMI USB in current implementation it need a parent/child
>> representation. However, the parent IP is shared across DP, USB,
>> and HDCP, so it cannot have a USB-dedicated parent reg space.
>>
>> 1. Versal platform
>>     - Parent: USB wrapper IP → has its own I/O space
>>     - Child: USB DWC3
>>
>> 2. Versal Gen2 platform - MMI USB
>>     - Parent subsystem combines DP, USB, and HDCP in a single I/O space
>>     - Children:
>>       - USB DWC3
>>       - DP
>>       - HDCP
>>
>> To model the Versal Gen2 MMI USB parent register space, I introduced
>> xlnx,usb-syscon, allowing the DWC3 driver to access parent registers
>> via a syscon handle, addressing the v1 review comment.
> 
> Syscon phandle is not to express such relationsship.
> 
>>
>> However, making reg optional satisfies schema validation but fails
>> DTB checks.
>>
>> versal2.dtsi:1: Warning (simple_bus_reg):
>> /axi/mmi-usb: missing or empty reg/ranges property
> 
> Yep, exactly.
> 
>>
>> To fix it i think we can switch from parent/child representation to
>> flat DT representation for the Versal Gen2 platform, similar to
>> existing implementations in qcom,snps-dwc3 and Google Tensor G5 DWC3
>> bindings[1].
>>
>> The Google Tensor DWC3 binding uses a syscon phandle to access USB
>> configuration registers, which aligns well with the Versal Gen2 MMI
> 
> Not true. Just read the binding. If you refer to Tensor, then to access
> A FEW configuration registers. If you refer to LGA, then it has address
> space.
> 
>> USB IP, where wrapper subsystem shares a common register space for
>> USB along with other IPs.
> 
> 
> 
>>
>> If this approach looks fine , will create binding for MMI USB using
>> this flat representation and send out next version.
>>
>> usb@fe200000 {
>> compatible = "xlnx,versal2-mmi-dwc3";
>> reg = <0xfe200000 0x40000>;
>> xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
>> <snip>
>> };
> 
> So I am confused. We ask, since long time, to have unified child.
> Several platforms were already converted. What are you discussing with
> in such case?
> 
> Are you going to have unified node or not?
> 


Yes, in next version will switch to a unified node representation for
Versal Gen2 MMI USB.

Based on your feedback:

-the fake wrapper hierarchy will be removed.
-parent node without reg will be dropped.
-syscon will not be used to model hierarchy.

Instead, I will introduce a separate unified-node binding for Versal
Gen2 MMI USB where: the USB controller register space is described
directly in the USB node, auxiliary USB configuration registers in
UDH SLCR are accessed through a syscon phandle only for sideband
configuration access.

New DT representation using single unified node.

usb@0xedec0000 {
     compatible = "xlnx,versal2-mmi-dwc3", "snps,dwc3";
     reg = <...>;

     xlnx,usb-syscon = <&udh_slcr>;
     <snip>
};

Thanks,
Radhey


