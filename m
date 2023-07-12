Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BC874FEFB
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 08:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjGLGEk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 02:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjGLGEj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 02:04:39 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5588310C4
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 23:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk6qevvEE0DNjz+tj/olv5i2ZUv1BU1dmcRC1KHoYqFYA1ExEgA6VTazz9Y8zfxn8996776fW2OIa/7kIw7UAZz4WbMYrUWqdOujwHLoZ5z2gP1XQYOE3y233htX5TNLnvcb5xAV+ZKPV5xJ4oiN4bsYqwJl3TRwboDhQBxo2PPjX2r5L2Djb0cmKYpMor9QG6LpMepJTKqnSlINU/vmQ3BwO0NlcsrpTRtbVHi/eUG9+81+ephVGojnRu4fXLPJ0/FvhFbAegGmWVRdtZQ++LhkmYvYxtbTq1nArmL8gY8w2fiiZUKkZyuB9Vtb6TkcwZiBaibda4WTutK9AQ7AFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr7yvPdmoAT9GdaYMvh1z/HclhP7Kky72l7iWTvNF/Q=;
 b=SqoFJ8OOMTc/AEHhF6+UTX06EwN5YAOr0nNNagI+7d11HAekEyaELCZjwpnoL8irZnK3GqDWUHS8cmcRTqSbZFsIvzQYWt7ITTaRon9PXthcIX3jkDCpp+MG1r9kVLtse3ubImSC7DPynjeDLiQwfhbR+nN9Ok0XWWFvp0CwVthXLgxfd4n3kjX+XoZkqoJCaksH3jBB6xYDNwJkYA13F9k8FxreemecZWFKGhPDI9JdpG1x2FzwtguVVMKDbrKgAvH06/l3K1xjr4kjHT94C5DmdcVR0VvggLlmlbtOdNlNF9yVvS4gkTHzBE7NzmMkx0+SKH0Ti639EFsA6JCvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr7yvPdmoAT9GdaYMvh1z/HclhP7Kky72l7iWTvNF/Q=;
 b=t8JVuLc0OPTVv0HWEZkjGkD1gTUZhFXsz+3KU8SABdClMQ6XYMNzWVBV4HVDJwAlqJUUOXTcaLvxjRGFfL3ga3+JeJNIMkhfYNPXQDY29loY4U56Y5ddryPPT9uk3lZ9b3Y4u3oP0OlDcXiKm052GXsk6Xxty6JIi2i8NbIaw/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 06:04:12 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 06:04:11 +0000
Message-ID: <af96080c-5c86-fffb-74ac-3bdcf5d4e5cc@amd.com>
Date:   Wed, 12 Jul 2023 11:33:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RESEND] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
 <2023071229-deepness-radiated-e55c@gregkh>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <2023071229-deepness-radiated-e55c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|MN0PR12MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d75c872-9c06-416e-dd0e-08db829dcfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bOaMdmi9lEwoHIVK5XK7RUDjbi8GtRd6zsTY7ZQyb2QHEdkC7Hlnt4Jf774leOKQ7qpqjXftA9rMB57Sxso4XKa3XdtXYFuqJfaakcyCKYhrkXiq9rnjQ0S2rMkBjS9QFC2fkgfR85bmQ1aPeRC/mTpEPbuxHafxeHfPsqZL0VPgYNC9Mcwq/cIBpsFvrB034u7tvJFen41NdRE0J6AUWA9CIFHYnGyrfwXzhQJW3MqBhb1mwX2T9NHL4hHWz2ml4ZGkfhnkgBDa4n8pEVXAAyIVsBt5mgm6ZiGX0pHQldXzppcByKnbwo8PwDNIPmUQJ8ooAjxc3ilNWubhypFVOMOAZKQ/8rHeIg5tsJr1q+xM3OKoV1bhfWjQvAID3Ysm96iXMlICfPkYybWMl/S/N9AW2H4veol9QT+FOhyMGgjRnbq893sZwiqKItXRY2bGK4loFfyCAntAApmuArvJXjpHpPAFM3yF73bHvoKBtMWrvXEgB3aUempLoN5za7lnAsIYYXVsOTQ8pBNeb0kMNw/42B6u5GdLw89YaWzx4EvskqC24TN7iAqj1jLLMhrcM3EN3BwvqjHz19PNkNU7sKFvHIZz1qMis1dplDHituSRI2/ldSWkzJlxuU0eVFxKEc8wvJCR3sagzZAWXkzfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(31686004)(6666004)(6486002)(478600001)(110136005)(66574015)(83380400001)(36756003)(31696002)(2616005)(2906002)(6506007)(26005)(186003)(66946007)(6512007)(53546011)(8676002)(8936002)(38100700002)(5660300002)(66476007)(316002)(66556008)(41300700001)(4326008)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdydFZMQ2ZVRzhIZHRCOU1hOWYvaHFSamZmZFlUZFNaWWQzTE5yd09XT01l?=
 =?utf-8?B?TVh3WjFWbFdUWmNxbEpuNSticVZFa3lET2ZzWk9iZHJVTmNRSEZMNnBROHhi?=
 =?utf-8?B?NFhxaUwvOXdjMFdJb1ZMOTYzSDZWZEl1bEZ4b2RtcmpLYnJnblNNYlR6Q3Ji?=
 =?utf-8?B?R1RGZndjYVFxQ3hIeVl6NnBCNVhLSDFpcmQzTVpxL0ZjNk9QTEwydkUvanow?=
 =?utf-8?B?NVhaZFRQcTRnVmJ4ckFZdGdxN1F2dWlYbmpQSmgwUE16UTIxMS9QUy9KemJG?=
 =?utf-8?B?MFBPajJNbG9mMVNWb0NpQnJjTVNSTzI5cU4vbExCQytuTml4bXBPSStEOE1t?=
 =?utf-8?B?Q0NaNjdjTExlSFhPMitGQmRWWXB3dXBsVjZ2MEZwYTREWXRzRnY4WDBLOXd4?=
 =?utf-8?B?eXowV0ZZbE9ib0tTdC9iQWJJWktuL09ucm8vb25XSEFIQjZZNHc2MUlWaWZj?=
 =?utf-8?B?cmxvdmFNQWxYWnVqZjBUaWxVTzFjOUNoeDV4TnhGbWg5M2VhaW9YcUU3NlRm?=
 =?utf-8?B?L2pSYkEyem85MHg1U0N0YjVIQTJTRGY3bVJPa0FqQmlHQ09RbkFEQld2NVcz?=
 =?utf-8?B?ZWU2QTArSWtxUk9CMUh2aTRqYlZIODQxQVpCUGd3YnZIblVKbTVGbEtNZitz?=
 =?utf-8?B?R3c5cWgvZWVyb3RIYzZ3M3pMUGVOVWVJUWRsMDA2T0MveXRDTnRPa2dPQ05p?=
 =?utf-8?B?NkRGeUQwdWpuV0cvQmNzNTE3eHltb2FtZThMUWk1K1FocUlrckk0dW4rOWJ0?=
 =?utf-8?B?ZG1BNE84d0djZVFHcXM5akpOY2MrSmZBRmFVRWh5S3NNTHVHdis3MmtRU2pu?=
 =?utf-8?B?Y2pTdVFHdTVwckplL3BUdXlnZTVEUWhRcTJuS0taR2RxN21RdkM5TjlaLzdW?=
 =?utf-8?B?RmdTR0MvTUsreUROZk9JYmRrWSttNkwwS2VMaTRob1dZK1FNN1FLZzhPUkha?=
 =?utf-8?B?KzVBSlZZUHpIMTlDb0xmRkNJWFhiZG5mRk9udmxDeFZjOHlGTGQxZHNWSWJD?=
 =?utf-8?B?MFI5R3NURDZ5UExWRXh0K3lmTGdpS1ZCcTJUcjNNdDZLdTROWG96M1E3MG5i?=
 =?utf-8?B?YTNYYzFtNXRjWmRMM1EyekgxNGtLNWZNTW1jeU5pd3lEZlNzSHQwS0pzOGps?=
 =?utf-8?B?ZFZnUlVBUEhUTGR3NjRxUk0wcnJEZTdRbFJGMzVwS0MydnJKam5vS2Y2L2VH?=
 =?utf-8?B?MGZ0NUJERmZRUTVnYStKMkNsMUlEcnVSbkJmbHlWYkxtZEFqK2xyNUt2Z0xa?=
 =?utf-8?B?L2gzbFBsd2l2YjZyREplZ2lKTUY1QnJHWnRXbVIzd2lRK3Nub3NUYkdMT3Vm?=
 =?utf-8?B?WVhDTjNZZElaS0NLYStWT1cvKzdYeVlOOEx4cmZiRFI4RE9UQmpOYWFRSFM1?=
 =?utf-8?B?dWF1ckJyWjRvSldtNHM0Z1duNGRBSllub2VFczZ4V1Rnb1dQL0pmTkhOQWc2?=
 =?utf-8?B?R0tyWGkwS256ZWRnUmdTWEo5cTVENVVjTTUxMnhQZnNsOFh2TU9xY1k1M0Fq?=
 =?utf-8?B?Tk1UVFJLY3RLZEJ0MEE5T256bzFBNy9qSXdNSnBseHV1cjViLzVRUXFYRXhh?=
 =?utf-8?B?Q25sL0RrOVV4aC9vT0hEMVRUeS9Ic3FESWFGYWJHYjV0MkFSS1pNZjI3YUdv?=
 =?utf-8?B?Sk4zQzNaWVdXOEdndXkyY2V0YXI0MEJuNmRBS3ZuN0xrTkR0eDFNN2ZlOFRx?=
 =?utf-8?B?UzBHak1RS0JNL0xiZTArbStlUU1tK3B3KzdjZGpEbVBmQ0VFbWExSEt6d25K?=
 =?utf-8?B?UThXaEswUlFVcGxBQ1NLSkhsWXN5K3B2ZW9oMEhJMnFsUDhiWTZ2RHJSdWU4?=
 =?utf-8?B?VkcrQkpQd0NYbGtNc0hLbE9obWlKWThpdHdWQm5IcGhVeHd4WkZJcVo3RVRR?=
 =?utf-8?B?SnpzV0NscGhJUVhURG55bzk3czMwYmk1RXI1RXlWWDFscFZHNGl5ckoxOUJk?=
 =?utf-8?B?bXB3TEVaWFVHdVNKYU5VamdoelFNV3lZem0vQkhsNjZrSVhSTURCemVyV2lq?=
 =?utf-8?B?RklvY1YwN256UGN4L1dPWE9OV1cxZ2JyWEE4ekZ6UCt1WmJDU2tEemFyVEll?=
 =?utf-8?B?OGVNc1hCNmVBRHhzZjBpMTZtZDU5UDhNUVhOYkU3RTNhRS9OWTlJdnpUcnVz?=
 =?utf-8?Q?tIpVl1jzqcr211JgKd7D2SVs8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d75c872-9c06-416e-dd0e-08db829dcfa5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 06:04:11.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODuOz6tZv8WOBzFpIJitDXAiIZ2fmQasddauKlmrtYyc1rT8HjMVPd2nr/+xjKYFehzJT2OJ4A+o/dig82JEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/12/2023 11:23 AM, Greg KH wrote:
> On Wed, Jul 12, 2023 at 12:32:26AM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> Previously, on unplug events, the TMU mode was disabled first
>> followed by the Time Synchronization Handshake, irrespective of
>> whether the tb_switch_tmu_rate_write() API was successful or not.
>>
>> However, this caused a problem with Thunderbolt 3 (TBT3)
>> devices, as the TSPacketInterval bits were always enabled by default,
>> leading the host router to assume that the device router's TMU was
>> already enabled and preventing it from initiating the Time
>> Synchronization Handshake. As a result, TBT3 monitors experienced
>> display flickering from the second hot plug onwards.
>>
>> To address this issue, we have modified the code to only disable the
>> Time Synchronization Handshake during TMU disable if the
>> tb_switch_tmu_rate_write() function is successful. This ensures that
>> the TBT3 devices function correctly and eliminates the display
>> flickering issue.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> ---
>>  drivers/thunderbolt/tmu.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Why is this a RESEND?  What changed?
> 
> And the ordering of the signed-off-by is incorrect.
> 
Hi Greg, My Apologies, but am unable to comprehend what I should be
doing here. Please guide me on this.
> thanks,
> 
> greg k-h
