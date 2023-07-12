Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C953750F09
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 18:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbjGLQxv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 12:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjGLQxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 12:53:50 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09731BFA
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 09:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebkFMnCgCsqZKRSSd1D7AI0v49hYQUIADhxzfHcXiz4ee+zRYcn9HXyx8cVHd1o9p0Q9gAZrt6u95KcoYucuAcoSw9Ozn7vJAxfI7KtMb98LTWKZDa+4zqm0Q5o8jg9oBCKKvPdHo2Rgb/jIwt906io+nfklXEHB1R4rm2TeNqI+F+JEUzhgj0lyUt8pEf/ya1DZsMrrjumfhx3IAzu9uTUQwwP0qjF/5N/wuPT75U8qd16yIL55XZBuS2zWDHzMZnxglfSOUBg8k+UjVamXch7HcrYMf9lIgzzc3wYwtU9YFUIfN4pFxfri9+Wq7I0WWZDohZoyGdEPLSbUSXUGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SllxLCFSIBVBOnWbHBfpxn7udJxQD9Fk5SQgI270hOQ=;
 b=mQsn5eaiEnX5XD10RlOoXw9Vrq7/iU11yjC8677xMPW3eetIQSjKmaeJ/EldcWuooTD2TW/Ip2x03D452kA+FlSfkfgnby5f9aZzkZxRMTwmEg0vNNNyLw3KG4D7wnZ9di2reas5n4xWYzS3rswr4rDZ/O7HIUTkjcs/jug0GyesNujvymEaOhXUWcuDVjazctblmhZVXN6oz+ae9eQBtYhLUD33/BeGri5dF0DUwtQgafHujvXW9SWNfy/I1wjM8YtGSLh1MCtalHYAzYdJRSfNeP1s6BuIFIk+CQC4HpNYHIedUvHruiSCgKSMXlJc51DwxyrVNdvh+wG7MxQdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SllxLCFSIBVBOnWbHBfpxn7udJxQD9Fk5SQgI270hOQ=;
 b=K4ZaPsq7KJ0F5rphKAyyKJn5h3wyIH5WJzoyX3oO3G1IXUp+fWt3OJT/mk2oWJALEkBM+9j0PQ+pt9Trd80qIwzlwMVxDrm7vrbESaLgLXAW5cr2icxuEzrjDLGExWrn9+thsEsvxw4bdoVvOxaIwdP+h99TW/n9jMqze9gakRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Wed, 12 Jul 2023 16:53:44 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:53:44 +0000
Message-ID: <5d2c8aa2-32d6-28f4-0fa7-1cf2556a71fe@amd.com>
Date:   Wed, 12 Jul 2023 22:23:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RESEND] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1689139946-18667-1-git-send-email-Sanju.Mehta@amd.com>
 <2023071229-deepness-radiated-e55c@gregkh>
 <af96080c-5c86-fffb-74ac-3bdcf5d4e5cc@amd.com>
 <2023071235-steadier-fling-2446@gregkh>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <2023071235-steadier-fling-2446@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 49723b1a-3865-4ffc-5ca9-08db82f88d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OB7tFeqiolvGoqT2+JAhQA4ltWBzT5oHU4UNNTClYoQ/Q5yF/QRWDJ9Mip3Jn3pj1IGb0PrX8bpbMiokJb42wQ047RYj0uqWIQIFPEaaxwniZMhjtkm2JdTQ956AAuLoR0BzvUJPE+NF8o0IiRx3qE3Mcp2zO1XfxyVDyQZq+e/37lMBOuXXs4KusGlAMlRPW5AJNldPx1S9pLuqpN1druq/3b9OFnQv2/H6+CYdb0IeXSjiQUbF041nplWfTzGgsyVlwYZOq9+Ss/p3+GRni4rNKo7nJnqHFK8HR14MppLxbRVMiZLwzAIXxP4hD7qFNHzqhUVXUVfeSBenZQBPUiBpoSiaUN1Y6NTxkg0BlhRCmAqIlDJCKWAZb7DiKhnBz0epV7D2nJMY1TmniPeEwokZPBI4PI0NzI6HJmq7NA1jjwdIl8Leu7vlqxWP0ZNWLhf17rlifIcvjrOsMqUMgRo9+FXULmcjOHyaZDHdl92D9I9y/6GJLRia0nCOcrCspaPTu6Fr+DRfS4uqIzzHRiWjDgxrzDoYW8s9yxXQXGTYIdESNX4utLhbPj4Mrue8ytqHZ0ZRM5g61uG5RnxNlInGeW93+bHu5j0/bEdRtZ7LcEfqNSSl5WsS3zVzoPZsk4AaLI5PBeo6h0ugEw8YJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(6916009)(66574015)(66946007)(66556008)(66476007)(2906002)(316002)(4326008)(83380400001)(6512007)(41300700001)(5660300002)(36756003)(26005)(54906003)(38100700002)(6506007)(8936002)(8676002)(31696002)(6666004)(478600001)(53546011)(31686004)(186003)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGE5K0UzclVnc0FpUXlTS2YySFZ2NUJNd1BBOU9jdzZveVpuTSt1cUI4YkJu?=
 =?utf-8?B?ZDgvUlo5Z0xpaC9CWWpuNm1ibytzNlBNUnk5TUVXbDJZWDJ5bm5wVnk4Q2k0?=
 =?utf-8?B?ZGdhSGJXTmJ5ekFGNVdJQitSZm9LR3habzMxMzBHVzIxRGlCVHg5RFhCalFz?=
 =?utf-8?B?Y1J6TWNiUEJ1dElaaTJYMzNNa1BWaWFnUGZad1pUK0JscnFGZlFKYUxJNHVS?=
 =?utf-8?B?OFBVa3pwYXpaem9WWHQ5VmN4RDdxWEtkZ01xYXNMR3h1ZGZoYnJ0OVIyTHM4?=
 =?utf-8?B?VTRrSEtaWTc4VlZLT1RaVXBYRTVQak93V0lHRkp0TnRxMTNYRVBndFRCSi94?=
 =?utf-8?B?WVFBT3VUeTd4TG5xMkpRS2ZuMm1hREV0MVBuNkRsZnQxcjdNQlg1V1JYbmZU?=
 =?utf-8?B?V1Q3MjFwMVA2ODlXMVUwR1Fjay9OMEJpNGU4UUpLYUJaYVljYkhkV2ZEWCtv?=
 =?utf-8?B?N1luSCtJTnUydWRtcHhFZWVuWW1iUnJlZ3hDSktQUlJOQ2hjVGFwN1pmTGJT?=
 =?utf-8?B?QVYxUlVIajkrODlEVU92WTl1aXduQytXNXNQVWpLQnN2UG1MZW1mckFSeVJo?=
 =?utf-8?B?WEVvWFJaODN4OGZOUytvQzBxOXBsRTI1MlAxajNyUHhPS20yK1hQeG43eDI0?=
 =?utf-8?B?K093a3dyYmxDd3JtVmNFaFgrT1FLV3poV0hoMW5XWmQ0blhXYmpmV1FSWFFm?=
 =?utf-8?B?L000Q1VVVTNKdERVKytuTG5MU1I2QnVPQUJNWVJGNXozZ3lBS1FVL090ZDBu?=
 =?utf-8?B?dXJmQklkYmN0aU5KVy9pbkRSS0lNSllJRXpqQVdyandlTVlSSEdxTnNUNW5k?=
 =?utf-8?B?TXV2cTlnSmZTei8wYTNLUDlXT21PZnRGaGFZaGlUVlJ6ZTlZbXM4VUNLekZh?=
 =?utf-8?B?M2l2WDVCalBGb3BFZEpJU25GWUEwY0lFVURUOUFPRkN5TFQ5aUdNaWpZLzEw?=
 =?utf-8?B?RUVKVnhPTUJxbE1ZV2s3SCtYLzhYdjloSlE2MjVOY205VnRKcjV3Q3Z2eEwz?=
 =?utf-8?B?NWdNZ3NLNlZHS3QwdU9yaDhWb2RQcXRtZk90NEpNZW5hdUdKbGVkQmJoc3d5?=
 =?utf-8?B?ekV5M3E0SGRrZHZSN3gvS29oOWpjM2ROOTA0RnVkZ0NBY0RNQy9iWEk1eDhl?=
 =?utf-8?B?TDhyb1loYmcxT1JMVWN1UVZwNGJhK0w1QXI1cWsrRjlwc3BPVXNpbXg3dXNq?=
 =?utf-8?B?RURZVnRCYUtXK0VhTkpxTzdnajdNcExyT3RRV3p2cW85dXE3TnpjcVJzdjdH?=
 =?utf-8?B?TTFrOXNVVDdyVDNEQ09BYng3S3ZvTFhuQ0E3UnlsSDd4TitXNmM5cnJvL1pW?=
 =?utf-8?B?bW5xTVBzY1AwTVdXRm4rb3hTalhIcDNyMEd4VHNVLzV4R2hEK05iTkRPb0Na?=
 =?utf-8?B?c3ZaeFFVRmVSUXpFT3ZtbEdHTjRSZlc0Sk1zT2t0MUtWQWpGZ3B0Z3JnSHor?=
 =?utf-8?B?eThyQllxTTR3WTlYSG81OGFKTGdPNW13SDEwTzVzZkVuZUtONzBwSlBhc1Rw?=
 =?utf-8?B?Rjc5aVgrdXhoMlNDN3R4VkdmblljVHR0NFhLSmpqWUpYNGQ2VDY4VW5jNzBO?=
 =?utf-8?B?dTB3a2g2b3ZXSkFVSmRKdkxlRmF6YlZoc2h4VU8rTldET2h5cy9OTzgrMjhv?=
 =?utf-8?B?QVpnN043LzZFanplZ2NrL3oxS2tKV0p4QjZEZGZPMzFlSEUveFZDK1B3dVhJ?=
 =?utf-8?B?bjNiaTIzZUx1Ykk1L2d2U2FvMXFQakd0NnhuMWorN2F2RDJTWTMxdHNRSkkx?=
 =?utf-8?B?dDB5dkxaQTdaWGUweTE4aUhVSjRiZHZhL08vV2R6WmhpZExUUTUrREFLSE1T?=
 =?utf-8?B?bUZSWSs4TFlybWYrOXlaWVo5ODc1Ymo2NStqT2M1RTRVS0FHVmNrRUhBcFlX?=
 =?utf-8?B?eW1BTk1PdXpwTjhyN0VPZzZSdXJwTlRuUUQ2Rk9FWXQzVCtDMGNrM3ZuSHMr?=
 =?utf-8?B?ZnlWN3YySzlZaHVQREhzUVBsc1UvREgwTHllOTM1TUhPUkNhNUQ5Z1RpRTZm?=
 =?utf-8?B?T2ZiZi9rV0tRd1dHOU84UjBKUS9YcC9wM2ZZR1cvazdQbUhsSWNPYjBFZTZl?=
 =?utf-8?B?Z01Md2theTBvakkwNmdJR0lKbXNMdjZkb1MrQkhxSlJLWDcxSUZlSEU5dUtJ?=
 =?utf-8?Q?051vCsuuqMJTsdInaBp4cyKCg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49723b1a-3865-4ffc-5ca9-08db82f88d94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:53:44.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTzbZ+sQnE/P7hGRaCgLY4sstis7fXZHNEDZWVTq9ekjR55BGB4GgZXssqBxehP6k1NXI+ft3IaHlIJevRLO/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
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



On 7/12/2023 10:12 PM, Greg KH wrote:
> On Wed, Jul 12, 2023 at 11:33:58AM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 7/12/2023 11:23 AM, Greg KH wrote:
>>> On Wed, Jul 12, 2023 at 12:32:26AM -0500, Sanjay R Mehta wrote:
>>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>
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
>>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>>>> ---
>>>>  drivers/thunderbolt/tmu.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> Why is this a RESEND?  What changed?
>>>
>>> And the ordering of the signed-off-by is incorrect.
>>>
>> Hi Greg, My Apologies, but am unable to comprehend what I should be
>> doing here. Please guide me on this.
> 
> Please go and take the AMD kernel developer class/training/something and
> work with internal developers to get this right before resending it
> again.
> 
Thanks. I'll get this right and send the patch.
> thanks,
> 
> greg k-h
