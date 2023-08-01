Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1676A861
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 07:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjHAFgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 01:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjHAFgI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 01:36:08 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04578F
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 22:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIXF9ntbLbmcPPPfB9XPf/M8qx5BdgaLpTdNyA3M0xIRD2djmeV1FOWoDak8nuePMUS94mgKU50FwHdX2Qf5dYlUU2XQi348UC+AWELJ3WUJOtEBV8OfoUMVJgAUxBsj6qD1y94qNf8eCC0lV7ACIW/duJDctJ7rZiZG/u+NSSwwjD4Bt9ruViH3oZMJX2nBQ7H9g5kMf7zBWNc4LqwSE4iK1I0endBUKhFnrEHlQnHDI1Ico63CMfpSpQV4LJCDR2v4anEcWU7zVwHKL6/G4/ICTAFHRar/EHRKbFholpBmYg9Eh3FBbxcOgL9j830eF+IwSJYeMFjy/e0HtkArHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06MpmMr7j2Mm7SYETWuAV1+NYKZFsUCDhY1WeDTrwzw=;
 b=F0KkkUCURY5yT8WdYe7HHAwq0msRtaLo6YHkfZUaVVgtXNre3283lqT2SHdG5K1PQ/rpxsMMPcsnRG9TnqcYxtisOE4E+LoeZMN7zl9gOqvjbQ4KC6Xc2VFvnLJtVt6N/HOgBFYP0O5Ci6Wivbh7Y7fK7NHDGsOjeiNmwHsi5vQMmNpB5vNkbkt1btbweXzFuXUiCFlrSoJdZTQP/WEURFPqVY9aEZ3htt5VELKagxMGUUDMHLdGkyDh3czA2rbdOk+W3VgEqPFEeeiQnL2Ci41yt+osPW/aps3xTklO50FngeKQPYZW40xcrvb/37NW5kragLM55UcLsqJ7XaCTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06MpmMr7j2Mm7SYETWuAV1+NYKZFsUCDhY1WeDTrwzw=;
 b=iyWIPwshT5L6+pE2RihIP7P3hoyp/WhFpCdGiGObJSJG2kz9T/SQylKhGyUYdOFUI6TJ06MA+wyod4INcfJF1dlp/gtAge4oz0F0PGMJpNEosigKfwMlOLWfcbx985OSoG8kPPIsyN3auLLD0KY+6IsXlePWk6q5ytZPeFf0qV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 DM4PR12MB5087.namprd12.prod.outlook.com (2603:10b6:5:38a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.42; Tue, 1 Aug 2023 05:36:05 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::56a2:c9a6:ab3a:36f1]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::56a2:c9a6:ab3a:36f1%4]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 05:36:05 +0000
Message-ID: <0693cd20-1356-8ac6-c93d-690588b78d45@amd.com>
Date:   Tue, 1 Aug 2023 11:05:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <sanju.mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
 <20230731111530.GI14638@black.fi.intel.com>
 <16994867-0b94-5ec7-f467-6f9fd6261a96@amd.com>
 <20230731145443.GJ14638@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <20230731145443.GJ14638@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::12) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|DM4PR12MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e42ff2e-8951-455e-4329-08db9251332d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZmwdWF/A7O9mrC8kOJneZtXmV8OFKhD5oNqVu5CM18WEmwfmuoY6KPJZmhfZLijhYc2ZcR4Mwj7cGt4Q9zrTkM0FSF9KTIjOWeEVs4iTJnXBLTMjSarHorlqgSySdqQNZoos8M9D3ySeOFBEHzVn3cMwrOXFTFL3qVaRmFfDWPpb7uhvESNUmPL+WBas2sdPJ7fYgHx5DaUontgj/ePA7a/9aH/GzNCGkpIgG8EKqVL9WlSQsXYfj3OW5fzPu0wwW56MEngDFjBtf2HWDgUimOOh3sxS54E5CvzS8ffjToYbRzhmyI9qNXJluSXiCrAIUeWb197zw4dy8u0RCrLQ5/8O3NPS6Kgo+tfBGiH4aS6hPtMpRkyucdLXvB16k4fjx6tOpIpdCxpire5/XxEYt/9To5Itl/bCCJ5/J6sauJkx98g+/UvhnGduTUk5+bdbtSFtvHb2G1SAFXRQgEtZh3Q3gV8PONIUE1i1Nv+tlPlXN2csYUq4WmVrwuScq8cZhsYEziCZASJMAsoZUujOAkbU3LrLmcDy8h6Fhx//pK4xGPYsqAQzN4l5WM2PV9hmDfd9MzvEPAq0FJ9APTS+7Z4284eBoQ4dEL06Ovxhe/RABN2qyBbsXRJpCA1b+NYtvqqplZEoJJgl9jz4yX21ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(36756003)(478600001)(38100700002)(31696002)(6512007)(6486002)(6666004)(2616005)(53546011)(186003)(26005)(8676002)(8936002)(6506007)(31686004)(5660300002)(4326008)(2906002)(66556008)(6916009)(66946007)(66476007)(41300700001)(54906003)(316002)(66574015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBTcmY4QjZmWHo0aC9QeTRuZ1pBckdxQ0V6VVdWWEFta0o5UHpPTkk0ZWVh?=
 =?utf-8?B?d1RVNlYvYlFVSCtRdTYrdG5ZblZaa3UyekdXY0FYNm16T05KV3lZUE1DYllh?=
 =?utf-8?B?OTV6ajhodWZtL09zNzRUdlhqYmw1RllTL2xSaWtjVFV3UmhGamhxbW5kQlcz?=
 =?utf-8?B?MmV0ZGRTMGlqbmtPZ1JlMndWYTNleVBKZHcrcVIvcmIyNTBxQ3dsSEJQcTVZ?=
 =?utf-8?B?U3Yvb2RlUkN6VW5FaC8yK0J1VVJYdjRZMVJHR3VYblVCeHlLVlA2bU52SmpU?=
 =?utf-8?B?dUtPSnNkeGl3UE53VlVvd01oaWZrTkQ2R3JZRWxiNTQ4ZzNYakNWM3g5TER0?=
 =?utf-8?B?VTZkejF0NmZzTXQzNFh1dmRlWHZHUXQwNHRIR3ZDVWY0U3pLUHBERFhRYzN0?=
 =?utf-8?B?YmRvWFhDMW5zU2tiTGRNUGx6blFONUNJYmhXUXVieHRzU3BnNzBDTG9qeVpv?=
 =?utf-8?B?TmxjeitLZjJaUXhRdk01K2F1L3BORXVaZTNHaEdmRkpSQVFLQ0FpKzB6ZllC?=
 =?utf-8?B?MUNSS0RCTlhVUVZpZ2Q2UVdkNXBib01nQkZ6WGJOc3Q4RDRjd2Ivb0R2QmFI?=
 =?utf-8?B?MTZCNnlMUC91R0FzbndRc05XMVh3NUgvVWpqMDVnTXNZd0cvYUFlazh2MU1K?=
 =?utf-8?B?cEhFZ1ZsQW5ycUIrYTY2b2dMM1NzbWRGa2YraFY4L2cxWkorRHdncGZrV25F?=
 =?utf-8?B?QVZGdmgzN0grcnNiQkVxNktPSFJ1TXEyR1hMUHlPNGFkSEUrZ0J2L1paMFdJ?=
 =?utf-8?B?Vys5Y2lMSThXbU1XR3ZiWHJITjJKbXlhejFWd2RWM2J0Vm9ZOEd4ejRGV3lm?=
 =?utf-8?B?anVFaTVxVXhPaWtZVlAzMlBxVzV2N0ZqRFYzempYNU9CRDFBRk83ZjB4ZHE4?=
 =?utf-8?B?TDhWaldKMk4zVFRTWHYyem1BRXlrdUxxOThWSGlUanJNUS9DRzlyOXRaUWU1?=
 =?utf-8?B?RG5EeGNTMjBRUkk3SnI1OUQwc2ZxWkZobXRtcWM0Yk1pK0lpbGh1cEVVSVRY?=
 =?utf-8?B?Qjduc3UxQzlWVWV1ZkU0bWsyZ2lwNjFSZEc1c3NHbGhjUHRvcFVvMWY4Yy9Z?=
 =?utf-8?B?Ylo2cStrV0U3VXlOa2p2ZU9xRThwUzJSaHVubHZINDloZXhYMTYyNyttd3JZ?=
 =?utf-8?B?b2Z1V1F2WlBNeXpGYVluWERQZFJoWDkvdGRnS3laQ1B4U1ZvY0RGMm9tMllS?=
 =?utf-8?B?U1FGR3VxL2tQeXFyOFJxVkJ0Wk5WcmIzYlNoSmZmZTlLRDNZeFlUck1pMVhi?=
 =?utf-8?B?MHBHN205NTJRNENwYnFEY1dNMnVoNWNtOXFsZUlidGJZRmJxY0VtYVlGWUR3?=
 =?utf-8?B?R3poUWVIMkE2d1h0VFVrdzBMa2gzaGhTcG8zelJjeW54WTRPZjdhQ1ptTWoz?=
 =?utf-8?B?cWZlSzFTT1J4NGFEaXo3VjF4ZEhMdVZIOU1vbE13a1hVaThaTVZPcEVhTm5S?=
 =?utf-8?B?aE51eXAxajl5TWtTa2piOVQ4NVA0WDRnd2pXNWEvUk1aVXV4OGl0WEtDZlVD?=
 =?utf-8?B?OXZ2cHhMREYwK3pXanh2WkpnZmJkVGxsTWl3V1ArRlk1RldDWDdtOVdVbFQz?=
 =?utf-8?B?cW0rZnNMWGkwdkk2S2VudHRlVDdoc0xDSkw4S1pmQkhmdENwUHZMUVo4ZGdZ?=
 =?utf-8?B?YVZGeDluVUJaZ0pEenNPRDdmcGwzOUJhOUxVcmFwSGhBcG1HeHRLOVJtRFFv?=
 =?utf-8?B?cDFWSW5MMU9EZWpDdzEyZnRQYXFNVDZ5c0R6U0FrMVIwUU53MndVTU5ZTlE1?=
 =?utf-8?B?WWQvYSt5Rm80RzhLSjhMNEJuNUV5WHdEczB3TGw4YUZRcDNUaDc3MEloUk1q?=
 =?utf-8?B?OUl3aUE4Wk1lS3pzYWV6ckIwODlrVUowUWlDbTFYVXE2QW9DN0hXVEFKS2pk?=
 =?utf-8?B?dHVoMllhek84NzFCT3ZIdGdVcFpIVmdGZHR4cG03Z0xwWlBZTzdkem1NL2Za?=
 =?utf-8?B?dmlESEc3SDRmV3ZnaUp6N01ucjlyZm5TQ2FwNE8zU2xTekZoa1JkU2N6N2cy?=
 =?utf-8?B?U3h1L1RhaEJibEpoYlBZK2pFQmxxTzhUZVJLeG05elRlUVQ2ZFpkWGViZnR4?=
 =?utf-8?B?OVIwdkxSV1NUSWZWcHpkVm5aam5XWFUrUEYwTXpEbURXWVZKRHNjRjgwb2cr?=
 =?utf-8?Q?rndRyBBYTGKUXsXg5rQxwm3Ou?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e42ff2e-8951-455e-4329-08db9251332d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 05:36:05.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cnQWumhpRIJM/Qsoi5psn3KDTDjath/y+nxsdD8Rup1toZaDZe5hIymZPUPqU9N4baBB/xjI4y7HaUwpVdcUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5087
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/31/2023 8:24 PM, Mika Westerberg wrote:
> On Mon, Jul 31, 2023 at 06:37:16PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 7/31/2023 4:45 PM, Mika Westerberg wrote:
>>> On Wed, Jul 12, 2023 at 01:16:19PM -0500, Sanjay R Mehta wrote:
>>>> Previously, on unplug events, the TMU mode was disabled first
>>>> followed by the Time Synchronization Handshake, irrespective of
>>>> whether the tb_switch_tmu_rate_write() API was successful or not.
>>>>
>>>> However, this caused a problem with Thunderbolt 3 (TBT3)
>>>> devices, as the TSPacketInterval bits were always enabled by default,
>>>> leading the host router to assume that the device router's TMU was
>>>> already enabled and preventing it from initiating the Time
>>>> Synchronization Handshake. As a result, TBT3 monitors experienced
>>>> display flickering from the second hot plug onwards.
>>>>
>>>> To address this issue, we have modified the code to only disable the
>>>> Time Synchronization Handshake during TMU disable if the
>>>> tb_switch_tmu_rate_write() function is successful. This ensures that
>>>> the TBT3 devices function correctly and eliminates the display
>>>> flickering issue.
>>>>
>>>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>>
>>> Looks good.
>>>
>>> I suppose you want this in -stable too, right?
>>
>> Thanks. Yes Mika.
> 
> Hm, I get:
> 
> Applying: thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
> error: patch failed: drivers/thunderbolt/tmu.c:415
> error: drivers/thunderbolt/tmu.c: patch does not apply
> Patch failed at 0001 thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
> 
> Is this based on v6.5-rcX or something else?

Hi Mika, This patch was tested a month ago and built on top of 6.4..
I'll resend based on latest. Apologies for the inconvenience..

- Sanjay
