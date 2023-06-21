Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F85738096
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 13:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjFUK5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 06:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjFUK5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 06:57:36 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BA512C
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 03:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFSOo1oyCWW2mPN9BRmXVP18yi1iZKyv1TEib/jrYSJkjVB85piJSNPj7AHebjRej7f5neWMl1RGi0yRKS80snSgbgdHkJ+rgaD9Z/0QNgAsBovVBlb4gakldAkfe/HBAXTtyFQpVyrFoDXJk1SuEjTzURIskPXWUT6YjdRSPpCj/+9SoHIhxkcmoCqG069/abmY+EKX36Yax+7YPtZBgFS5frQLq1L7+j/DKoqoH4szMLnHcxTQFu6b77HxeW2g8qZWMAYuUxvFRLZO6+1J1YofNBEkDKVb8BiLBs8GOcraZikFxF7BibrrmXHL4oF5ukm0VWmqL+RsOljQmfhx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDy/RxOYoSWBZ+09th7RsNuGDe0X+lxpB9NK727OSbU=;
 b=njMKCqXHXgiEycplXB5fVW1NxxMTe86iWkdn5lPBKLcxaRmS6dPdoGdzwU0dp5CjFDuST6QVtsOOAJ/yBbk78S3YkebqZE5n3mcJ4GhJQsxzM1JJWgF3dU7OIZUQ7Uc63MW6gYFNiMEKJ+29Zt+mOxlHF5fyeC3vgGvrdJ3VYrIK/zvsuImHmNfUeYSe/4bhMYwhLefWZoOKrbrr+WNZFTbvLIDNUTsVZa0H8Q1e7qTDB0fLC7W19zNQpEfItppedP/wDfCdpQUtR2AR3vBIJf7nm7TwT9ICohdilKEK5VocOq7nOUIdtcfOC/SKlK0uXSMcLE0P+lLPisAugmDJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDy/RxOYoSWBZ+09th7RsNuGDe0X+lxpB9NK727OSbU=;
 b=ksdKuThxkhYmyCGt2LJJSIrCr4iIvgqy1KiKZPnWe/GH+hI9bnGHXuWKVRktw9J9t3vjXeJu+7yfs442neWDGkDe9NLKJvu9T2jdosPy2vm2uUp/mPvLxABDRKQtmKzS3RuI/0OchSnmFmK5Im9SHsmV9rIB1yB+y8KGpPeynzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21; Wed, 21 Jun 2023 10:57:32 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 10:57:32 +0000
Message-ID: <b3023162-d6b4-6c67-6839-be08de81116f@amd.com>
Date:   Wed, 21 Jun 2023 16:27:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU based
 on CLx
Content-Language: en-US
To:     Greg KH <greg@kroah.com>, Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <2023062136-canine-editor-e9fd@gregkh>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <2023062136-canine-editor-e9fd@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::14) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a22269-846f-4546-c10d-08db72465017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebm65hM7AKsaXC6nVZgb2I1cs3mBXrvAcQkYwJkH/sljg98sPweOWq/AqSeGNY2uAZOGHvqJBYnDAp5WhyiWOU4r4pgn4X1NveLVYY40AaqI4YL0wyrl13Xj/r06Qj32Jsp5UQx2JYkV6ugAmGAKBuHaQCNwpAuFGM7VoU6OkRofO5b+t9hWywV3GdOaUO10MGCVGCHnlJMdj0inl14W2fjvWmDXDVuXWBC6aFVUTvwnJT3gk/RDK5KLBPPqE4YrHJPWBoYAQwqr+eVS2ke0Cm49JSAfdq33e/zx3RUo62qrvZ1oBAEoQ4jQI5ZYqIG4+qcF4Q/RxCs4z8Iwj3S+ZKvWv8+1kIKx1Q5EEzj9kBLmb+MpROytdHO1VQGY8iLoHNV+fodJayES628gTYlMM8ZbH5ucFVtjmXkE+yUfrf9WRHIX3v3oKh3a22Qf4M00Ii3F5Chmx3WUC8vCOOMEMfIlqZvXiShhpSG6bLp5ymlnSFJ0jRiAEpuvdrHo3Rbxg05mPiprt8o/h6KyTWV2B47T6OqNB15/NbbGLBqVkMPbQo/BEyw5lUhCQzTV3LkSm9D5fFsOTIRjX2GOMRhSf1pnt7IRJ7XWh89On/YpfRgMx+g4pYzkcDyUY800ac83b84/rlOimLy/lUyYnwuE8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(38100700002)(36756003)(31696002)(31686004)(66946007)(4326008)(66556008)(6636002)(316002)(66476007)(26005)(186003)(110136005)(5660300002)(6666004)(53546011)(6506007)(6512007)(8936002)(6486002)(2616005)(2906002)(8676002)(478600001)(41300700001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eitaQUd0em1hUm9FMnMvWkc3Z1ZtdlJiTHUrMTEySGZVSEx3NS9IRTUrVlNE?=
 =?utf-8?B?NStwclFtQnRoTG9oQm9hSjd2OGdsS3ZwSFZJS3pBVkRDU3JEZUgwQjErYmR4?=
 =?utf-8?B?TkxSdExwdWVXa2ZhNVBIMXFKTGpzWE8xaDNoaHZSTk9la2k0eSt0WFAzcGhq?=
 =?utf-8?B?NjNMbHhSemhERFZaSko5RmJFKzhFeHFvb05Kd01HWVBIZ0J5MC9QaHJRNDFy?=
 =?utf-8?B?MkdCUW1uYTN5a1dDV2gwcG9hL3kzZWtCQnd2UElrWDF3aVc5SnJ5ZDhXaDc2?=
 =?utf-8?B?bmsxRm00UnBwTkh3ckRNREl2cjVVdE9xdG5taEJNdWNSdk1GYXI5ZklxU2pM?=
 =?utf-8?B?Wk5NdnZCR0NwcjB3T3FmTUhIM0hmOENiVktKR211cHFUVk9kdmc4NVhvZzFS?=
 =?utf-8?B?cG9YdHV2UHliYWx4T2owblJpeWRHeGZIYS92bktPVXJyaXlVeHBhVFdBcW13?=
 =?utf-8?B?N0dYVGI0czJOQWNPamM5SVlzQVJJcW55alFTdUNlS3pXb3ZncVdzQVV6WlRv?=
 =?utf-8?B?T2pFMDF2ak1ITGQ0L0xZMmRpRHB2Wi9EMzJBRWwxWmlGMjRpSG9yN1BGZjUz?=
 =?utf-8?B?akh1SXZmOEVndVlDdWVwWlB2NmgvaTJ6YTFhc2hKQ3h2Zk1sY1lBUVhUTWov?=
 =?utf-8?B?QUxDVHNyZlFxeVczY2RKdHdXZ0xlWFFCTW5HYmVZaVF5c21RT0JmTHcvdkZv?=
 =?utf-8?B?NU1YVkF4c0ROWVc4cC96Y1dDcEZhZmJjYzFOdmE5a3BtTkp5V3Zlc1BnYjd6?=
 =?utf-8?B?dkI3RktmK3lrdmZyeUk1Z0J2RVNpdk03U1NXVTRxVkc2eWwwc2tqdlkyMndk?=
 =?utf-8?B?L3dyUXBVQmNzS3diUnJwZFgzSG4rbnhuRS8wdkpxbExURVkrZmVoTTZFNXM4?=
 =?utf-8?B?SDBRRUJsaGlTQ3NuMXZDTExUNUlzY2FLdnJZYzlYQmZBQnI2RTQrRFMvcXZq?=
 =?utf-8?B?SDJsVTF6UlRKdUUzdUdsTC90T1hpZUVTQ05sNXFPWHV6TEN0S21oUW1CaURn?=
 =?utf-8?B?b3VXTXZiVEpmTzg1bTMyV0ZJSzQzZWxnZUlKVVduL01SRFc4cmtBZWV6RHJI?=
 =?utf-8?B?a1grSUdyQTN3Ym45eGhaR1lDeGdNVDRJZldnK21LcUZOS3F3dFlMRExYTW5V?=
 =?utf-8?B?WUh2NVFDQURKbEQ3cTJDczZBMDJCbzI1UXVFTVpHc1lkd0pobFNxR08yaTVP?=
 =?utf-8?B?akVVVUlzQ2d2bDZCUHBaZVE3NC8zMEtXeGxPcEMyeG1vdjFyKzA0RXBwdzNl?=
 =?utf-8?B?TW4xSWFJYS9HbTN1ZXF4cGwrSEh3b3g3S1duWjN1ZW9PQkc1eTRXR3kyNmpx?=
 =?utf-8?B?SVBFMFFvdlp5NXl5VFZxZmRjVlZPcW1oYUw2T2hTSXZJN0RNejcyL1pERUVl?=
 =?utf-8?B?TVdqUHE1NU5MRlVFSFAwRzlSMnh1OFU3YVNrZ2tua2tkMUh4Y3lReko0SEo5?=
 =?utf-8?B?RmpXUHoxckxzMlFvdlNUeTJtZG9HUlJZS0lWUnR4N1dYZUlzdHYyN0Y4d1BC?=
 =?utf-8?B?ODdWM1FMYlNKdithc2RwUGVRcm9SU21RVGJWY1RtbGRZL2k1WW5Pb2FTcXBz?=
 =?utf-8?B?aWtPSlRIQndZWUdSdDdZUTdMc2ZGMnVnakVGcVlSTGNyb3V3OVhCbmtxUVE4?=
 =?utf-8?B?TWpoV0NqYkFpZlU4S0F3NzREdUtkdFhXVE9PaGY1S215U2VHVUtJYTZOazR4?=
 =?utf-8?B?NnN6d3dOdUkwZ1o1cXptWkRocUw0ZCtrSklIOEtleEJQM3dhdzhqaitneWw3?=
 =?utf-8?B?MUkvVnpVRlMrU0JCZi9nZENxSTd1V1Fjd2x3STk2Sk9oVkkxTUE2RkJoMkVS?=
 =?utf-8?B?T3Z5ZHRXeS8yRlU0ZVk4Z1ZrM2dGVWVZSzNzcjBhY0JXUFdIYjVpREtpRzBH?=
 =?utf-8?B?R3BHV3lUdGZKUGJNNjJOZnRsVkhNc0tkcWV0R3NvZWhPbHYrM0lCbG9vWDJ6?=
 =?utf-8?B?VUl2clRjWlZ2ZEE3ZmxBYURXbFMwemt5K2JBeGI2SEZqUkFmWjVPTm82NDdp?=
 =?utf-8?B?d2gyM1hqcytteHFZUGdBeFpvd2cwU1U4S1RJN3cwNCtySjVmUG9pUmtIVGVP?=
 =?utf-8?B?WCs5RE4vbUQxUllEeTJWbWFnWWRSTzVIdVNzOWgvVTVGeU5RdGdsQzF6N2Vq?=
 =?utf-8?Q?HCWjQy+hwQ0p8qvsxw/RxxmSN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a22269-846f-4546-c10d-08db72465017
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 10:57:32.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZsuJypH6BYl0iQNq0HbNkDJr8Onh2TpDCF7Z/gnqvJNT9jW6nrBmhiO2ARaXWZbINSgl8luBbDYVz457CySkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/21/2023 4:22 PM, Greg KH wrote:
> On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
>> From: Sanath S <Sanath.S@amd.com>
>>
>> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
>> Ridge, explicit enabling or disabling of TMU is not required.
>>
>> However, the current implementation of enabling or disabling TMU based
>> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
>> enabled by default, such as AMD Yellow Carp and Pink Sardine.
>>
>> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
>> implemented to skip the enabling or disabling of TMU for SOCs where it
>> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
>>
>> Fixes: 7af9da8ce8f9 ("thunderbolt: Add quirk to disable CLx")
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
> 
> Wrong ordering :(

My sincere apologies. Mistakenly I sent you the wrong patch. Will send
the correct one. Please ignore this patch.
