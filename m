Return-Path: <linux-usb+bounces-37724-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EKLC7+UDGp1jAUAu9opvQ
	(envelope-from <linux-usb+bounces-37724-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:50:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE6582A32
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9C2430A68FC
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 16:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BB1407CF1;
	Tue, 19 May 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JKmeqX1T"
X-Original-To: linux-usb@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAC400DF6;
	Tue, 19 May 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207815; cv=fail; b=ZJFPAWEKc9VTI5Cul5F6R6Jfv2ofMDwQ6Zd82vVj7VfXYkTkVQI9PkHQZ7rrzXUCqU/e7rzTxMB4p3og27cM9YpXJ6EETLIpzNPY0c+SlopET4URpDvTXDJvk+LOEVXSs/plD8h6yKRJ0pU+IxljgC3CjaoM6aw59yH0jIpFoFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207815; c=relaxed/simple;
	bh=wAd7PLUjmgX95KhhG1AAsrr7Ewve6vK6es/y1x0/Uak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JWLEd+j+RX0NNgaavuLKlnKJO5Kmv3jsRk6kgiduk5J6LxweyOFHbpRQHsy/5GNBRTFLwQgWeqDowYsEa0dyY1JfJGxkF5CsKAc2mwQridmh1EMAjdqWk29E+oO5XjF5nFHcf1X7jpkIB71BZsuUDnqdJNud6bK+BFARc54tAdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JKmeqX1T; arc=fail smtp.client-ip=40.93.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjiPvUvrJ9RK737+FajKg6+MIxhI3yvioeGT50Rc34aKipBXcp2qJ1RVSzlyWMX+NJHTIzbPMrQ3oPY9mGP/XN1SsXi1yLr8iUVBWoxnaixMbWV46VFDph8LX1WrwI/4qpuZlkKsA7UzSG/fR4tuZV5rFye5m6w3pPa8QJk/dKDyFF2sTMqp/a+VT1EFi+gFev9GpXxCiexjKUsUYwLkb3o14Afp++U7uNp4C5LrJoGV1KxZNX1vV/FCmmmLAeKc7YgTPdZXMOFJZyLIzB/qJIJ2AQERfIiJW0WhujbqFXlDJZOx2CWK/EdOHVSY3eE9emo+WlbAE/DeMUP+cq1hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUccybPRjlcr0qZ5YvD7W3hTG4R+qSX1tlPunGS9sVY=;
 b=UklNpJQbVT+anZnta435TWEJGg8sHSTVdoz7ED4/zwZY2M5Dn8hHqI0pdSYZYvpCSlxTxxuRTu9xtsv3F30t2rKkCkEdemUMi9vkRC1egHnWicRTW7pRj2jiAPL1icLZaRBlq9lWP0nl3fknxigFWEqCoTbVbhdVNa29OFX+eioH+dZ6g5JAUBBUvES1DhiVHFYE0EvvaaRxGMRAfQ2/s5S+nnVDbq4ohWRXEVo00j9iAP/rnw6jDpfjU0hsQc5BrjDzHq1KWuqGF/jGVWimkkv1E8wjxmW3zie7L6PxQqh7LzflpPsHaoiENOYJQuxmhjcEsowhrulPeUbstiJqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUccybPRjlcr0qZ5YvD7W3hTG4R+qSX1tlPunGS9sVY=;
 b=JKmeqX1T+sszNvsh8l/icdBF5JOEUafRn4bj9+0s+4lMyFX1CqGtBc0+QV6+2wVun59I7+W5yQPWemsV88IFuKcMmD2XyUarKiwhFlBX6GENUG72w8Kju8HgAKRow6IVhYp/AXAywcKri6tgLXOFbaeoWWufHKPwS3RSpsTY5MM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 16:23:27 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 16:23:27 +0000
Message-ID: <1ee63583-03f9-4515-ae97-c970bbe20672@amd.com>
Date: Tue, 19 May 2026 21:53:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: typec: tipd: add error message for vendor ID
 read failure
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-2-radhey.shyam.pandey@amd.com> <agrnlRSyW7_A0AiS@kuha>
 <a80587a6-7833-4af0-a882-1748cd6cad7e@amd.com> <agxri7tZMHA1gyqz@kuha>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <agxri7tZMHA1gyqz@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffd05cb-0726-439a-df9d-08deb5c2f4c7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	exXdznfHnqANHBK1Co6Fz8ZEG46QkneagxExSTGv+d2FDiWtbDRTm8Sw6JUMAdjZjfoBMMnjbJK9qCC9ai0m22zXun/Xq1G5kXddOWhQXZUFC9hUosXB42ES5js8pgiy1YT8krU7cR9kgA7oS4cafwoEOEBmZOWwBrAWPPeVuR2jOy8Le7Lw/FAy3d8q+a1qvx89b7bV8+ul1l3j+dwIRJ1rtk0OlVWWf/LbD9sG4WRNDIK4ruX87SJc+oS6Uqh8eVlme7KLICS9gpT4ToGcuc51d0uJs8ZiQYX4nsW3gz4wGj1y5BN9jcDIMHRpcIfvZ6i54lVspzmWpisYO+UeZIbeUwGBRJnFBaOaUc0nVNi72vRSLsIz1tQgWIkO7JpQAj2j1VwSFr6AKYaM2Bf/L69dhyMpDcHqES2Nx1GYlb+2ozNKUov0uezy476Dma+OhSbGeWgsXF1kTpSIJvK/j6UDme9cz0N+Kn2dpsjXX3Sm7AQkTO76esjJIauDMlhji1+OEYiWATJdInGDc/RZyGeJUlOC4eQe3k04UL2bPqaIzDyeZSYiFTqH531VMhPvI9UQ9eRQSOzNm7F5LoPaHfsu9Cs4mHEuR6RkjVh6NaUCG3ZUh3icXHI2vITt4XCz6JcrjGmM+tBetZs3UePmZWUEZQLNmze0i8pmmw2wh6hLT0aZ8Qp/XmWpKPSuK8ya
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG84U1ZROXRtWGd1MGIvZ1VYMy9HZ2dUaWpsMmZWWWpCelM1ZDI0S0QrTEw1?=
 =?utf-8?B?Q3BLUSthcE9BZVRFdnErUXJtLzNvTnFRdWtGZjAzS2FIWnQ3ZXRvM3E3WTBr?=
 =?utf-8?B?R0JiZ2xiOGljZXdHL3ZsR3lucHM4YkFWaDVkN1owMmhlU0h0Z3dIQmhXbkg3?=
 =?utf-8?B?eWF0SUUxUUM2eHhQU0pIQUM3cWtBdnR1ZG9yUTlZSGU1dTNXdGlDOXpUcmlp?=
 =?utf-8?B?dWg2UHBTZHM1aWJsRXB3RStuVTBvaTdWeXdSWlFvRzBVWFYyeEtZa2FJT3V6?=
 =?utf-8?B?cEhzM1N4aGkyWlA0ZXZtUFlKbTNhaGF5My9SWmlyaUVrY25jWmwySHp1bHUv?=
 =?utf-8?B?a3BMRmRtZWFHcGNkUTR0WGExZVducmU0Z0JEMTArQVJDWjlFTlAyaHBYWEFx?=
 =?utf-8?B?SnIxVWUwSldVWmo1NDdua3BLTFRDNlowTGxnTEsrN2dQTllrVVBncTR1Z3pQ?=
 =?utf-8?B?cHA2d0ZQRVlFc3hWSmtTNVh5OGEyclgyemxCL3VUd2xoR1hnK1lwR2lPd2NB?=
 =?utf-8?B?UExTdTM5a1JFS0xNSmxTSFoweGEzTmVHUDFvR3M5WEVDYlJNVkdMS24rRTAv?=
 =?utf-8?B?R2FLTVJLdThoajY4Szd5akhMekI4WkVJT2NyV3NsaXMyQlRGN0Z5WUp3eU1V?=
 =?utf-8?B?RTRlQ2ZES3BHRW5qRUxPc1FKOW5aaUpYNk9YWVR3QlNYaTFRUFpJbDgyOW55?=
 =?utf-8?B?SGVzK2QvQ3RZd01kZjBxQkUycXhZaTV4UmlwRTFtYjJidFhXSmw1eVVLMmx3?=
 =?utf-8?B?cnl3Z3hXM21FdVZMNEV1TWROSTZVQ01mc3djNVM0K1ZPMHBHRnhSY0FkS042?=
 =?utf-8?B?R0xraHE4c0dnSE1xZzdDeC8zM2VJNi9lNTcvQW13bzh6TzZobVVCRysvYzdw?=
 =?utf-8?B?SFNNZ2hPVElLd2tzVTd5RWQ4YXROSjN4ZU5Od2l4anVSamhkTUVib0tWTmto?=
 =?utf-8?B?V2RJMVhhVHhlbmhKZGJRWG9BdnRkRlFYT2paWWNMZlc3VEFpSEthQndLcmMv?=
 =?utf-8?B?a0V1d3A2R1d3Z21WT1JCUEVkTnNTTndHa2J4emRLTzZBRlJuRUNjYk9Ucklz?=
 =?utf-8?B?WGlzUExxa09tM3JTM2tQc3pwZzhPdGgzL1JHUXc0QTBPOUQ1R3h0K0p0bDg4?=
 =?utf-8?B?eEdXVGxIT0o2d09iRVVKa1pGQkNqTXFtcTNYbmJRc3JFN2kwM3R0cGNBMllP?=
 =?utf-8?B?dFo2NzVRV1FvRW5HTWlLblBoNHhGM1Q0Y20wb1ZuOFd6a0Q3MEdkWHQvQmJQ?=
 =?utf-8?B?UUJ5Z25wS2ZsejhUNVFmNHRKWndjME9rc3VkRWpQamRhNTU4dzRIVWdsS2t4?=
 =?utf-8?B?TEJDcVhXUUhBa29SOVFsdFpMTXZFMWtQYXJ1dnc4TStJWXFQS1NLenYzUldB?=
 =?utf-8?B?U01pUVVDTkNvN1Fjalp4MHpYZGZKOU95UG5Kam5PS0VPQ3JjbU40UnFWMHdB?=
 =?utf-8?B?RE5EVkxiRVRBL1ZkOVdkZ2gvbE0wOXBPTlRBSVprQVNDMm1vbktQdDlld0xi?=
 =?utf-8?B?UnRrY3ExbVRiT2NHMjgrUzRUY3lNeDZvUjc2NTEzNklOUGNLU29WZHhMcDlx?=
 =?utf-8?B?L1QxeGZVMkJaVkxwc3dDRXoxUktQN0xLbUNsRlZZcnJpVmxsQmh3R2tpTDdX?=
 =?utf-8?B?MmZXQVowbWJZWFVtNXJzMk02U3ozbmNwYm1xQWVCZHVYM0pRY0UwYmdIeWhl?=
 =?utf-8?B?K3Zpc1A1YWhiRFhrdzNLaG1OM29sYWpWOThXVUtLQm5WY1RxbEplYXdqRTd2?=
 =?utf-8?B?WnNwQXJzQkVlME41c0p1M1I4K1NyQnVERk02K2VRdzlDUWVTcTlXbGRPaTVN?=
 =?utf-8?B?eU9FbXIvNHZJdzAvTFFuUU5ZYUhWclZObDNySlovUnJwY0JYb0dzazRNb2pJ?=
 =?utf-8?B?TzJ5NEx3L2t6MUV3UWlLcHJUUXNZb2pEN2VTdzFoa1gwL0xhOGpKd3pQS3lk?=
 =?utf-8?B?Q2dmcTBxMmdyTVZmL050aGFCY3ZQZDc1K3F6Y2Z4b0pnOTlNSUt1cE5jSmpo?=
 =?utf-8?B?aHJ1ekRnVGtGcktZNS9SQzZSVVdnTVQyOGhMaVRDdXNtT01jQldyNWtCc2w3?=
 =?utf-8?B?RlhBeDY1OEMxUEV0UVlwYUovMnA3bVhmM1NYbEF4cTlhWVgzMm53K2JZM3J6?=
 =?utf-8?B?V25URVI4ZTJ1azU1bFd4R1JhSDZCRzIyK2NPaUdwTDl4eVVXQTdvR2dIeUla?=
 =?utf-8?B?VzNONUM1UVZtcDd5ZzN5eFBZYnphRnVzQmcwbVlPRUdqSXJwNDVxSHNkVVBJ?=
 =?utf-8?B?bURyVTlvZkV1Vks4S0I3UTNHdThhanl2Q3ZDMnh0Y0FTV2RpNlpXMlVpT05Z?=
 =?utf-8?B?N3lsUnVpSUF2M3kwdktGNXhyLzN6TjFPU282aFZoeURwV2tzK1I5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffd05cb-0726-439a-df9d-08deb5c2f4c7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:23:26.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ5egswgG7YL4/pKBrVh4srxa702yug+LMUs4QGxWE+fKFLx7F7qoaVpg/S27PnQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[bounces-37724-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 7FAE6582A32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Mon, May 18, 2026 at 09:23:58PM +0530, Pandey, Radhey Shyam wrote:
>> On 5/18/2026 3:49 PM, Heikki Krogerus wrote:
>>> On Wed, May 13, 2026 at 11:58:48PM +0530, Radhey Shyam Pandey wrote:
>>>> Log when the vendor ID read fails or returns zero, including the I2C error
>>>> code and register value, to ease probe diagnostics.
>>>>
>>>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>>> ---
>>>>    drivers/usb/typec/tipd/core.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
>>>> index 43faec794b95..b282366b5326 100644
>>>> --- a/drivers/usb/typec/tipd/core.c
>>>> +++ b/drivers/usb/typec/tipd/core.c
>>>> @@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
>>>>    	struct tps6598x *tps;
>>>>    	struct fwnode_handle *fwnode;
>>>>    	u32 status;
>>>> -	u32 vid;
>>>> +	u32 vid = 0;
>>>
>>> Why is this necessary?
>>
>> Thanks for the review.
>>
>> When ret < 0, tps6598x_read32() → tps6598x_block_read() returns on
>> error before writing *val. So vid is never set; passing it to
>> dev_err with %#x would read an uninitialized u32(random log noise).
>>
>> ret captures if I2C/regmap path reported an error and vid tells what
>> came back when the transport layer did not fail. Hope that clarifies.
> 
> Okay, got it.
> 

Thanks , will also capture this justification in v2 commit message.
> Thanks,
> 
>> Thanks,
>> Radhey
>>>
>>>>    	int ret;
>>>>    	data = i2c_get_match_data(client);
>>>> @@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
>>>>    	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
>>>>    		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
>>>> -		if (ret < 0 || !vid)
>>>> +		if (ret < 0 || !vid) {
>>>> +			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
>>>> +				ret, vid);
>>>>    			return -ENODEV;
>>>> +		}
>>>>    	}
>>>>    	/*
>>>> -- 
>>>> 2.44.4
>>>
> 


