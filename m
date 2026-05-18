Return-Path: <linux-usb+bounces-37621-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIowDUo5C2qWEwUAu9opvQ
	(envelope-from <linux-usb+bounces-37621-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:07:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF19A570991
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BAF4302F9EB
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A433BD224;
	Mon, 18 May 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dm4ZRMxa"
X-Original-To: linux-usb@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E2480DCD;
	Mon, 18 May 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119785; cv=fail; b=QzLUHT/d/rzCvJ7T4d/fVJFd7GJm0g80WeCslSAmA9VFghAC5X0aJD3wCagahHMdmVLlHpfm4gVeIEOteIb+NK8d6wL99tltEhJEWnlFOA16YmqU6pLNB2uxzTTjAtd8LGhIaSXD5/xpz5pGV5OB4EDyXWjZtxk+TscWPk9/V1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119785; c=relaxed/simple;
	bh=4TskTQeTxk9734xgpN+0xFQyZw0yGyFDBDNx4Aj4HXc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=THY7uGubrBo1UrN7xOBV4LhuxDyqWctyuGxgX7dOq3aA5lJyRh4arNEfL02DflRasdT+fQifEMVBk02cZ8cTpAqAZDdv3MOcRHViedWauJFlw/s81vQOjy06wLHm7AsIBMOL/U4ktRyttfKHFc0TNwvngVGJiEu5GaUy27Jo3zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dm4ZRMxa; arc=fail smtp.client-ip=52.101.57.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eezy7MDHhKiQ+o7NyjgfiwHUbYzLSVbUWsik4G0sBn8V6cDZu24DAasHxzZFVpoaFEcBlOF5n2ZfNUzTV27gQnCOsKLrLkGTeocpC8hu8u3ju8M/3eIqaLqD+Xg+FeisOL5wsCyNIFc/b/+cYamx9JIDRtqw7CKvpHD+Wfs4rxEJvAdyCaGKcamVvY/2QboCrZQoqWl7/MmccsoWQpqiKdj9uuCL4d7ZBY7rxTgrVXvaKW37zfir/PkZXJF6KqVvY3HjkHY6ynv+87Cf1P5Xcvr+zrjC32HD9hNsqSYxUyNqRTGNOb9SHZlieuKVmh0YLGPliFhu9aaAmo/1ouSZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhfV5ir0SJhT8DfFg5oUAc1bzem1tYs5ArOjVbyyVNw=;
 b=PrGf/y44dUZuEgy0ReEEHi1Dn34h9zadqS1m3aTvqRQ1MotRugaiLFU8+SOEHe/msS/EkEW+M4lb+hmJp2T5W3+Y0tYJeRmLdYEW/nUBlprpW/kYBitWgKeY7zdfjPqHEht1MWU2B5kCwHDshDcgjw00FFRI5i8mJ1+qKBT9BS5V9dc36PsK3Cv8uEM5PTqY2cK+q9vaLUubWCEFLeXenyZ6h1q0fgUt2Qq+Qh+cZTHWbNBFpNpZNeRZQFZV/oFJHupOqZTC7EhydkYbt31jB4qpLUKq8FG530q0vKuZj0FXcgZxXD5G1qRRQfRydZ1pKk3Bt5noGxHCd5Fz4UJ3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhfV5ir0SJhT8DfFg5oUAc1bzem1tYs5ArOjVbyyVNw=;
 b=dm4ZRMxabtjFpP1+dTPsNt2SRY99qo40pjEZ2pzwNQ7QlhzeZexwbn/nOw9rInOn7hYDLoo7Y7tmkJk9qoWSx9TckWNJPeA+X/UJxzoYRh8QyfC+0yVsfzKWAcxW0n+vWa9BlWM9T+kvc8VuzHM82R5+vLRLIqqrWfIlB0I/eQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 15:54:06 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 15:54:06 +0000
Message-ID: <a80587a6-7833-4af0-a882-1748cd6cad7e@amd.com>
Date: Mon, 18 May 2026 21:23:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: typec: tipd: add error message for vendor ID
 read failure
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-2-radhey.shyam.pandey@amd.com> <agrnlRSyW7_A0AiS@kuha>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <agrnlRSyW7_A0AiS@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::30) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acf247f-e661-4540-8b9d-08deb4f5b0a7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bwjRYWVDWIOEaVLH84chE54xnO9eOKzWdk6hAuEiV+bnH23+s+unO2lPvZSxIlNwXjrj9rylUHdYH6LOHF2ZWB7S4v7hBq8i0I/7GAIbejSbBxlDxkm8wHdkqDlkwA7Y+/8TOBq/YYCpkl95BjN26Atl4ronxoktri5aIV+723d6hPM5fxDl6vtz+U5NUOjAdQ7PWqf9PKIytuxaEiiwCefq0zGgFMZpMjHgoDjaLSNJxPmQ/ND/qkTnCtPpIjRGR4BaRFlR1OQvSr1myLiLdOJex3tYOCMJPZ6k7Bo7VrObbx6SkwU6kNQuOgnLLVPtKtbfkjqH8kbDV4Iy7Fj0QgQRVW2vZQctxUFN41YMIK115oZbW/HSl6NJj48DCzVzfzv40thnidqaDDGFVPpMFojMzdEfxJmTfTDHiDy5bFW7XNw6dI9hdUHuUSgUhFgV2XMA8oy/e4bY8xZ5NuStMPIzQcBG/CFp7/IDEqkP6rjhpHbvqpZ8hyqreqF4WFkw4i17fMihVTzSg5AGCilvDdNv6oSsDQ2c6E8C930JNNsKJkV4e+wahoD2vK0GgAv3YYk98w20XaIyiZ3eDyO6iiu1UJm8TuBeH2+PDA/2AaPuMPa5cqMS1W7aXcnTkxX5kWEX1U6oSX2r45r9uC62FrGRlSxSHTLosn+xhulsRB0mUkoz4p6l3vzLfjrbiF+P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0ZNbTNRS3hhWUF5MWpSdTN2L1NpYitjdUFsVHhIaXZEeDNJdGtidXBvMlQy?=
 =?utf-8?B?emtMWCs3dWcxTGlZNEp4UjNGYXVVbUdqV0NhUUtCL3dKM2FLVGZORyt1Z2h1?=
 =?utf-8?B?U3c1bGc1OTRER0NYRHQ1VGZXTW1zL0VHVTZzR3dZM0ljQXlXcHN0alJ5eXJB?=
 =?utf-8?B?S01SYzVsSFpSb3JvQUlucW52REhNb2VoWVo1Wjg3RXN3WFlaNks3TFFETVFr?=
 =?utf-8?B?ck5DOTFrZmN6a2ZiYzE4enBsQVVCQzRCTGY4WU5aMGJzVG45UGJSZi9hL3hN?=
 =?utf-8?B?QXQrRW93Q2VNV002QTdGSWVtQUNOdHcvNWxBQVMycyt5N2tYZlNhdTFKZk9q?=
 =?utf-8?B?azlXbUV0YndGd041YklnVjhWVWlyYjhwM0h4SG5JNnlJK2dpRERVMFF3YWdk?=
 =?utf-8?B?QUdac1d4VWxiUHNCQWRyb0xSdWtob0J3MFhPb0lPSHNBYXFNTVMyTk5KcHV5?=
 =?utf-8?B?RlNnekVhOENIb2JZZCtRV0Zmd2pWY1BPL3d6QW9mYjg4VTd0NHRYeHU2SDU4?=
 =?utf-8?B?aGNLTWVKWnpGT3NpaUJkaENmRXNTQ0FablVjd2tSTGZLQjR1eWg1V0I5WW5v?=
 =?utf-8?B?VjRqMFc2aEptSEZRN0dhZnJBVFlIdjJ1ZTZjYjFIbDUxSjhSbjNoYXZtQ2Rz?=
 =?utf-8?B?ZVRZN3gzZ2FKU1Y5L0ZWU3phQVRjUDlSd1V3QlduY1dYVWZsRHlPazlxTnhJ?=
 =?utf-8?B?NmlXdTZOYTJ4eWJkZW9rK1ZieXZVVys4aDYwSFlhZG5oVmg5WEhZSkE4b3Qr?=
 =?utf-8?B?b3JvdW40TEIwVFBOWHlDdFI3a0h5c0plRUUxTjlYRWJlcklZVldUOHpjdzRK?=
 =?utf-8?B?ekZodUNhWjFjOFh0ZC9WZFR4S1gwcEw1MTkxYS8xZUNLMjhpZUR5ZW9hTkhz?=
 =?utf-8?B?c1JzWjFQaDlEOTRvSXBJTkRtaXFlRDZ0dkwyazkwYmo5b0JVd3dFejZVVmNy?=
 =?utf-8?B?czZ3dGhqZENWTFdYZkF0b1UrM0R0SFcwWlhtYXFySjZrTnJtbEtXeHZBdlFC?=
 =?utf-8?B?WEZ4bDF4b0gyQUJ5NGlXUEppOUNLUDMrcGFNMGpsMUpmeENCMlYzNkxCYmtO?=
 =?utf-8?B?ZmRNMHRTUTZRRmF0cFgrRWY5ekkvOXZYcWJMMGcwd1ptOVpNYjNPazNZNi9Q?=
 =?utf-8?B?QTZaSFNqc0J3c09yMjhabXFQenVlVXZXRkZmYmZGL2NTRzRTSzdxSXNNQWNz?=
 =?utf-8?B?NHl5ejNpUEV1M2N2L1Z6STk3cVJkdERXZGQ2K21ZckhMNjEyN3A2andiRWRK?=
 =?utf-8?B?TG5BM2tjNDBJVzFjYkhlRTBkUDdtVCtnakRTUUNHYUsxZmNwb1Jxd2xtRkdF?=
 =?utf-8?B?TXd4bWtBOHR3VkJScU1YYWhOYjJRWExQQ3RLRzEwcFBCcW9rbElzelg4NUNR?=
 =?utf-8?B?cEp3N1UwR2JUR1pzSUtnczNpcS91VGwvR2toU3ZXc0pUK0dsUnQyVXRQL3BR?=
 =?utf-8?B?bkpQRGIyQ3diZmVyVUpsaUhHbGxpQ1JDR3dTRnR2TzZtaWRaZDBVaXpwbVd0?=
 =?utf-8?B?ajJyZGdhMGhQaGtTMDRhTklISTA4RWVZK0NUclNlRjg1eWJyL0VHTGR3Nm1T?=
 =?utf-8?B?Yk1YSTdPMDE1UTBpK0FyZUJKWXZuSjEvOWZsR0h5ZmN0TkJkWm1kd25hVHVE?=
 =?utf-8?B?dm5PV2JZVThlRysyWkw1VjhUektIbkM4T0N0S2NCWFNQaCtCN1VzOUtoZ3V0?=
 =?utf-8?B?NTBlOTYyYmVVaVRTVFRKN3FIYjFqdXhCakNjbU51a0tUN3l5dGY3bVduYThO?=
 =?utf-8?B?aGdvdWwzb0hQRkV2WWdTR0pFY3lOcEJTNTJUNXh3TlV2dFlxQ3grZXUyeEVl?=
 =?utf-8?B?VmpoTFUwVGozWSsxQm10SmtyK0JUZ05TQ2h1bXUyVUREdDVuWk1hRmF4NUpz?=
 =?utf-8?B?dnhHUktJTkxWTkZYQlRtTGRmWmsxSkZxVUNJeG9ETnB1ZnZ0RjVrdHo1RnNS?=
 =?utf-8?B?THhReGxodU1ST2VBTTZZd0szOUxzOWc2QlBvaG5VRHg1TnBQVFFWMEswdGlN?=
 =?utf-8?B?NHNSZnlwYUtMNmttcXRMWkx5SGNhdXJRcTliTERVS0VhemVaQWV3RWRxaDFH?=
 =?utf-8?B?OG1SMTRZRGhVMkdZeWdPcXJBUVRXbm1yejV2bE1rcGVZcW5yUzVncjgzN2pz?=
 =?utf-8?B?a0JIZytwREVLQkFjeGk2eEtIOXdDQkppM0luQmdjV2IrQ1NMbnFBWU1zVzdn?=
 =?utf-8?B?bU4vWFZhVGxkZ09nUGk1QkpJZzhWamtRa1g4RGM3Wk5LQW50cnNrRkFpUWgy?=
 =?utf-8?B?WVk1aTRyMWcyRm5pWXdEVUpCYktsQ3FlZ2UxR1V4SC9yOUF5N0R4UnlqakZw?=
 =?utf-8?B?QnNRVFdPbktDZ1J3NFJnRm1mdUpINnVYanhoWVFzOTRsak5qeUpLdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acf247f-e661-4540-8b9d-08deb4f5b0a7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 15:54:06.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coGZ41BcQl3qQ0BHumcvaw97BxfAH6Ifv/wHXi8cp/uMedhwFxJP8qHBl5saTqlb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[bounces-37621-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: CF19A570991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/2026 3:49 PM, Heikki Krogerus wrote:
> On Wed, May 13, 2026 at 11:58:48PM +0530, Radhey Shyam Pandey wrote:
>> Log when the vendor ID read fails or returns zero, including the I2C error
>> code and register value, to ease probe diagnostics.
>>
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>>   drivers/usb/typec/tipd/core.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
>> index 43faec794b95..b282366b5326 100644
>> --- a/drivers/usb/typec/tipd/core.c
>> +++ b/drivers/usb/typec/tipd/core.c
>> @@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
>>   	struct tps6598x *tps;
>>   	struct fwnode_handle *fwnode;
>>   	u32 status;
>> -	u32 vid;
>> +	u32 vid = 0;
> 
> Why is this necessary?

Thanks for the review.

When ret < 0, tps6598x_read32() → tps6598x_block_read() returns on
error before writing *val. So vid is never set; passing it to
dev_err with %#x would read an uninitialized u32(random log noise).

ret captures if I2C/regmap path reported an error and vid tells what
came back when the transport layer did not fail. Hope that clarifies.

Thanks,
Radhey
> 
>>   	int ret;
>>   
>>   	data = i2c_get_match_data(client);
>> @@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
>>   
>>   	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
>>   		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
>> -		if (ret < 0 || !vid)
>> +		if (ret < 0 || !vid) {
>> +			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
>> +				ret, vid);
>>   			return -ENODEV;
>> +		}
>>   	}
>>   
>>   	/*
>> -- 
>> 2.44.4
> 


