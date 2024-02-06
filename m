Return-Path: <linux-usb+bounces-5965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163E84B9EE
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 16:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9063428C009
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 15:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FA6134747;
	Tue,  6 Feb 2024 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4r9wbZAf"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45542134728
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707234170; cv=fail; b=PfdgtcKLiz5Aj7xjV06VOvDKS4FOshob0G9uzp4+E2n3X/GOOkRvQTclUhuHZG4mRaHC4U7Dz0aau8v8r167k6tlH0pk6KRZuCg9s0xVNhotVJCuWXjHZ+5XtbXQWNQCQ/ryg71M2OaexVv+SsEmsn+XaaL5esOuTYSiKJDeC2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707234170; c=relaxed/simple;
	bh=km2o7wIJtsfLDE+3V2EnAZpJf0H1zxeR42tnhAFsFws=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U5Jm7mDNx2q0/LamAW8vm25PlcOSOPwnAXzHZQxdPyDLKcAIKiJ4/RI0mACOMPMPCi+cgFEAqlXaM714bkdmUrHNmvnvmDujCYVqGRxd+yuPja3ETMlO15upQgKAmaKaegBxXyI4Xt0CBpZSde7g7Ze6YDD5w42K1GWNvPmC/qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4r9wbZAf; arc=fail smtp.client-ip=40.107.244.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcJJON6syCUgY+RJa3AKaWy/WIfdTJKMy1plcvsSqMrNo5QVF+tNaXIr5xBHmo8bTRMQA6tkMauoFPylJYDTjj1XPmpIBKxVUWuNZKVxoSfhznr7d21R029eFOAyt7zJFtp+8hWjmgFY4wJ2SP/FSx6DwShwNa7vKeRtLgI6izAq4j1oXbUP/Vdo3xa1EOH4nCMuZR9MjFMn/7Q3xVoa3UfxqnXka7f7D4EOIi0I+JaHXU/QxoNkjVBAC6jlp0fcEUbNL8NLnjDJfjVk1tJsSVzWt/OuUG0yMhKTkOgIFWEN2SUJGzLjkBWPECM7kjKGMGal+9w0fze5Pdvm38zVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXeMWZU9vc0sZv8uv1wyBK32PuJ1+SXwyq/tzxASVGQ=;
 b=fpLE5JxP0ncCegIOQvluZjPeB56eloHiCb7xqNVp+30TbcWhG0nyFrC4tLTuioXGBp92yJJdSPYOjczGkH+Jfv8UGjc9dqAyr9J6gqbNszXyYmOIR+8QXdEdsb1yWNb3Nbw3IBFoycn7+Nu77V8GDGdRkVPDtyimOFwZxEPXJYV3/Ao7WKtuO4ua9Y45OPVaO91ifWsTbvU//D1dKblQjRlnKVN5M+a4Xcpj8EKKQ1RTsUdLHWulwC3LhuldK/qytiOmGaggF1spMy5uDzkT8fwYNyy0LRSSODoEw/mHUpB5CVkjyfrSzpLQ1Sp8m/Q+nmUP53RhKxH5Kxqwbkmmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXeMWZU9vc0sZv8uv1wyBK32PuJ1+SXwyq/tzxASVGQ=;
 b=4r9wbZAfX4GLmg1OwuRIwdZAbWrts+/FIKaMuOsCkMp0+yQVql3xaHqbzS4XfJ5mzxJ25N2XixnhFsgrKl2GSuh8GgPJXE5pvp7HLEBh36jVy0NJz024eWlmuR+S78mooP92Ufe/fApl8k9swQNPYeum7yp8s92Jw9GDbYIiQNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Tue, 6 Feb
 2024 15:42:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Tue, 6 Feb 2024
 15:42:46 +0000
Message-ID: <83671315-fe58-41e5-9db4-1939c528672e@amd.com>
Date: Tue, 6 Feb 2024 09:42:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] thunderbolt: Host router reset improvements
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Sanath S <Sanath.S@amd.com>
References: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0089.namprd12.prod.outlook.com
 (2603:10b6:802:21::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1e2fea-9153-4ff7-67cf-08dc272a43cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQXHLSRYPRuA6CNMENhBocaA8xO4nhu2Qsod5nyT1vkxFE3AeOZ4er0j0dm7fHck0W0e1W49eSfBhSSEF4D38aDn31oPC+qyav4icAWcLIRdkS7PYNhXfgyK6Z5HmeM4jMqDDEYaUYXcncZJVQPOtAI4di+3z/EodzaNm4m2y2urupALfFsjDW0Vk3mcMM6YbcDGJr01ZIVv9x67JaNt+vBfM2dMyHoFOgD4iw8OfuyLXD+ntO1JmFfXDD682tJnLm6YXgt3xo5ieLJVRC/RvGX/4+4a/h4hPLOyNVR7hBhKywv8zpybpya5Et3JJcHjYEkqiGLYb5bYQLPFtpYiLYFyxIZKsLIisH792wVn4rljrX/U6TmC5mIdAhCiAAJAzkW4GqXVWoRGW6yps5glU7SEtGH7rv8SliUOcGmb6HLkplPDf0Zs/2uj/D0nipSafG214v4cnQFSkoflvC84v1aQFXsqPWzRfV+Xftg01wdW7q/mamM1nJ1iRgLmYlKtZ1zlcIRqma3Gcdvex79g7MHsxfBRYVZaei2vU7IGSLy4LD3DsZOmAqLANmDQYd8pjKBE0Vl+JD0jH/dygZABb+cyk8YL7KhUrxnWkHs4OAINA2ewsxY7Zhik1pIP+jyyQm3XvxvPrqCzMU+D63oWQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(36756003)(44832011)(2906002)(4744005)(5660300002)(41300700001)(26005)(2616005)(66574015)(83380400001)(6512007)(478600001)(6486002)(6506007)(86362001)(31696002)(53546011)(31686004)(38100700002)(66476007)(66946007)(66556008)(8936002)(8676002)(4326008)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elVyTFllTklHVDFwVUxXZXJQbVpaWXFxY29jaHBlTUI2WElsM3FIOXdVaVZm?=
 =?utf-8?B?QUNUaERSZlZEZ2tpUW5weEF3emJaNXpsTHgrS0s3WElEdWZ2akZ5MWt3ZUI2?=
 =?utf-8?B?bnRHZmJKVVVEUUVDM3dlNjk3Q3QxU3lHUktVUjBvOFI1b09hZm8wZkREUDRU?=
 =?utf-8?B?VjgyckVJTmxpTGVzMkM4OU16dVV5WDhaaXVvdEhuNnJ5aTRBOGw5aDdWY2Uw?=
 =?utf-8?B?VHA1Q2pKVC85bnhKNVptZGRGNjZjMGZHbUNvWlZZZWY2R3lMVHdPN1hKMDdi?=
 =?utf-8?B?UVEweUhzeXhZOCt5S0ZmSUpzRW5wVWFzaGwrd1R1dVlONFBkQSttTDY4UjdV?=
 =?utf-8?B?MHFOd0RCUXVyb3c4NU5KUU5WcFpFbGlOZk9xOHEzOFhnQndlMWNtdnlvUEY3?=
 =?utf-8?B?Sm5LMGFKekVsUmEySWxpOEhWVFhyWEhVUVVxVnBldzNCMi9LK2d6MDNhRURX?=
 =?utf-8?B?Z0VzazVpNjl2Wm5tYlVxVWxROGtaUHhpenBZeEI0L1d5WkdPbUpoNkNGZEw2?=
 =?utf-8?B?TTVGVlkzdVVjV3FqKzFNNXViSjN2dmRTeTg5OUpkZ0UzMnZpRjI2THNPY0VM?=
 =?utf-8?B?aXM5NTlPQW5ScERyUjlHSEc5VVFJamNuT04raUZWZ2JqQjJzY0FUQlp0ais3?=
 =?utf-8?B?OWlZTlV2QmljbHp3aW55U2xJTG1UWXdERGJzb2JBekpWUXJKdnhVdlNPWjJ5?=
 =?utf-8?B?Q1hsMy8zaFNHdnFEUjJ5NFVjU0pEUFdTcEdkTUo4VXZwbnU5bzl0aEZCK05W?=
 =?utf-8?B?bXZZc3JTb0s2QVJmV2Z3cFBzdVl3QVc3Ky9jaUtOZWFKenpEYytqQTZYY1JZ?=
 =?utf-8?B?YjBtaW9JdFloOEE5ZVNWUXNXOWdJZ1cyaUVoUi9HaFMwNy92K0FjekdIdjNK?=
 =?utf-8?B?ZElDRnQ5elIycndhQmQrNU9vK3FWZzZOcEZwc1d6YjVXR2VWcEM2T0lMWlpr?=
 =?utf-8?B?MzNicWdoNFUxaUxNS0Z0V01reUo0d3Yra2ZmN0FjNzZQZUNjWVNZM2g2Ukt4?=
 =?utf-8?B?SGppbjdMTVNOaVNrZUV6UDgxekc0eFZTOWQrbE1NOUs3R0IvdnBrdzcrWFQ4?=
 =?utf-8?B?cHJ5QnE5VXJJUTJ0ZExzTEhPTzZxSlEzbjhvQTdyQjZFRk9MdTFsN3RFS0FN?=
 =?utf-8?B?WkZQbFVtY0lwSlJVL2x1dkxYWUNDc0w3WW5vbGVJZm5oZ3cxQytPYWdRUk1R?=
 =?utf-8?B?OWl2ZXp3NWVtbDlEY1Y1UW5EdnJxM292MFQ2NGUyaHFacWJPQmwyRjYyV3lG?=
 =?utf-8?B?MG56enkvQ3hnYmF6V3hzbWhMcGdBc2t5cGVwTW54UWZzenM4ZmVoMktFcGk3?=
 =?utf-8?B?aWNGNU1vTjZwcXVFYXY5Vmw1Zk5iS3hIVGtHa3ZXQzJnaDRYOVl0ZFd5RCs5?=
 =?utf-8?B?ZzVMSUpYbThhQitPN1lxZmV5aW1tNFlxWldPR3VZNUU1UVBWa016VVBPMmJs?=
 =?utf-8?B?M21qc3VUNEN5NGQ0MW13aVM3ZXExM0pkMzYvZXBGQWs2aUo2dXRhSEZLd3N5?=
 =?utf-8?B?cDVINlRqbUtKV29Dclc0b0lLRVc1NFBjcmVKTk9BRFd5bE42WDVxLzNaVS9v?=
 =?utf-8?B?WWpSUitqRFZJNDdYZnQyOUxBSnF6bms1anVDUjl2SGFOcS9kK1lZWkhHaFF1?=
 =?utf-8?B?dmVFQ2g2TzRmdzRaTTRBN2hjK2tsWkc2ZmhIZGRmSDBwd041MXliTHdUT2tD?=
 =?utf-8?B?c0RXYkdKL1VqVHlCa0VQVk9ZUGx0RnNneGZLMFpMZ1M0Zkl1Y2lDZ25LeldF?=
 =?utf-8?B?NC9QbjBqeURFd1N1TnVUNTJSbEVJeVhtbTZLTGFpS3Nra3dQZWpma1NTRlQx?=
 =?utf-8?B?WVg4VVlxUm93UXl3R3d4b3VDajJFMG8zVlhRYWJmWUJSUnNmYlVCb0hrT1pG?=
 =?utf-8?B?dDBOWVFPbFl1aFVhejBsa0EybVRsS2JBZFZWUFVxWmxZc0haRnJ5dFk2bThV?=
 =?utf-8?B?QnNkRG9EcWt0bzg3RFVKYlZsUmRLNHhxeVJreEZac3lYK1I3dlFLeEpTUzFQ?=
 =?utf-8?B?U0V5dVpBSTZaT1UvNVdUdC9VNEN3VzhweGhZVUV3SEErd3hRaWxDTlh3WXZ6?=
 =?utf-8?B?cml4dml5UTFsRU1nY1drTzVlL3NjVEhsWWoyTzBBOGxJUDFWWXZGVGZWL2o4?=
 =?utf-8?Q?2DE1MGN2aaiWtfN4YAUbUOWTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1e2fea-9153-4ff7-67cf-08dc272a43cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:42:46.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAYQtUW21Z58lrwmsTyhA1IHsTisM3wJUEdX6GBUoWbf4FWNPv2uv+CF9yl5IyHp1KS1RwKcncu9JkdVMcTSZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261

On 2/6/2024 07:03, Mika Westerberg wrote:
> Hi all,
> 
> This series improves the host router reset support for both USB4 v1 and
> v2 routers.
> 
> Mika Westerberg (3):
>    thunderbolt: Reset only non-USB4 host routers in resume
>    thunderbolt: Skip discovery also in USB4 v2 host
>    thunderbolt: Correct typo in host_reset parameter
> 
>   drivers/thunderbolt/nhi.c | 22 +++++++---------------
>   drivers/thunderbolt/tb.c  | 19 ++++++++++++++-----
>   2 files changed, 21 insertions(+), 20 deletions(-)
> 


Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

