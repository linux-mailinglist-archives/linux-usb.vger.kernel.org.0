Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E6B738A7A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 18:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbjFUQH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 12:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbjFUQHw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 12:07:52 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A4EE68
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyeXss50sHZiUEzATFy6TdM612M49tlrDM1YCbY9DAP/7tLKuXY2SQvdLqqgnrTEHj9K4zJhitBCUSednYPmfI40Wx679eAm9Mkn8q9C2xmccaiJVcMDw8DhyzUySn7Q2M7AFV3b/Tee2pJUiTgGOAY6u4lAoL7igmHmIIM+1RC5TLi/s93sOBfzfYtkoJEJcnrwPicvgC67tdxui2cTwv4tmxZLIzFl/BqaHc3OoV/mecClQNGySec1BNzNhmUwRNw2V7lScKipjJ87Yh5rF1X20X5eKxsRW2hj3H69USW3sv+U0ffHTGwIbxOO9HbrLu8o9NaN9VaZUQdZxVhmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1bPlznonXX1htlPXQzUkdYZMWlYcqODFx28z56KCtU=;
 b=oRv5Lwa4pjxWbFetJtOMr7Dn/wyEZwmcLNi66VK/oB9N3tRD2rsaIto9u3seo8De4Px+HMuAej8VvhR7UL/jIQVp1CwzmehjG4hqnuRk41TnHigl30tvxNMTY+4oSCYyJeLLvDxeGD7y1tbmoGJqlo+OkgpdYEBvga2IreDdmQmEkgGTuL0HWNMEQS7PJ251/LxzfOSjo5CfIuCwWfH3ZDwyEuwrm76IH5AmBkaE50DY/nhvPJW9i5icQtDRk8a9+7erTane54rnpqQ1UxdvWMkSqyKO58PZo86+SuuGp2IobQc57VDqWZPt3P/C4tXukdWq8WfAT2t+ytT0wWfDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1bPlznonXX1htlPXQzUkdYZMWlYcqODFx28z56KCtU=;
 b=ubBsxh5k0kqcSg/sCPIPoTT4cJoL8Vzk2/NuKxu0KptSFefTbO/QIqzDGmDRXzh0IaPLlgMLt/gwR2TZR6GcelPJeV6qQx2gBifY1nj8vsOieBxA9LGHhASdd1RxOkxQ8lMZ5Ongr0+qcwehp+iIoMe9DqSkj8ped7oOOGzvYCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Wed, 21 Jun 2023 16:07:46 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 16:07:46 +0000
Message-ID: <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
Date:   Wed, 21 Jun 2023 21:37:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU based
 on CLx
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <20230621111525.GL45886@black.fi.intel.com>
 <5fe10a65-4538-cdbd-a0a6-827f9445cee4@amd.com>
 <20230621125406.GM45886@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <20230621125406.GM45886@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::7) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: fef9805e-b468-48ff-4807-08db7271a6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EP+ZKZGOsC7s8W/rknNl1Q4fI4H6wjhe/ZcCvzQvWtZZeShw85jngsadCj2qm2+G9VX/hLF/NffMZX9hRxotutTs4hA1Ykj3TzKz7uP9EqeN9HtO7rbnCCCiV5FFWTHQAyKcrZRyO//Fqo2wpWQywty442BSRrvQeRRfBPj5kxS94+V4TlWWcevTDAUfz9ieE3FQKR/1YuzGmKyM+IxKDeJDdRmJ55qKEdkj6Hb2SixIZ2a1p0HN66G+i0EimJi2rrnhTU+UMWrUu/O7Y85MmsHNtvfj+anY4HcHHc6VwRFIuQ6yHlsj541lrwO8VjtLj/b8wWklGeuxYaICtjQ3qpvCmgHExeKuuWnS3fPrbC4t7EW+kUV7CyyRlENU5UoNN4N1QEZDEqDj/sU2nkWGfrKv87rBDBpdXfszGBO5lto2npATQ/T7Ub/5mcg36+qyCgQfPDN4IxbwnBlu/fULCri+GfV0kvCMc9k1xZuWhHoblPI8KEQGSBG8mF1c6Kc/BOILv+jyqz3pxo6EEjHOHr0/Uws1Lo7O69tmCVfCZuHOH41s4eTlv+Dk1reV6Vhe0OlvSsw6Mk/GszId1SKkvzIFhgXgNs9yJfqpevEe63dpxDypVm1BqZBZTK7OAZa+c2mZVdbH1ewUnkv/uXz7hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(66946007)(66556008)(316002)(4326008)(66476007)(8936002)(41300700001)(6512007)(8676002)(6506007)(53546011)(26005)(6916009)(186003)(2616005)(54906003)(6666004)(6486002)(2906002)(5660300002)(478600001)(38100700002)(31696002)(31686004)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG93YURoNE9IRmkxa2IwaThNM2pnMStobDAwTTJDdHNRSVZ6ZzI1SU4rSW5B?=
 =?utf-8?B?VE9weDU2N25mYXhLa0daY0lwVlFkYW8zOWowMTJvVGtsTnVNVzJnQVpiTHI0?=
 =?utf-8?B?YTk4aHIzQlZCR3Q5enpGRUNSbkhFTVFpVFN1UzlLekhPakJNNktabWUzSGJC?=
 =?utf-8?B?NE5vdkRuN1B3QW9yMnZQOVZnRVAyQ0hXZ2VoS2h1NXc5cXZXT1FWcFllcmY3?=
 =?utf-8?B?RVg2aDBPY0lYMHBuUUNYYWhGcDd6QVVWdU41bW0vSzljV0hhNXJPclp2LzVw?=
 =?utf-8?B?WnJmdGNwREZsMFRvR0JuaXB6ZmorK3ZyUkU1TlJuc0srcGtFT0xid2FZeUI5?=
 =?utf-8?B?WUx1S05rdmNpVlYyTFk1dEM4Qzd4VU9UajU4Qkt4NTlCaXJESzFXbXlDamxQ?=
 =?utf-8?B?cG5obE5VdlBhTFNhaVI0Z0N1SmcyZGZ6czlqK0t1M2h4SDQ3blFwdUpDMmlP?=
 =?utf-8?B?YTA1eDZwNkI4UFNXOXVMOC9DcXpqbFhVcVhtVk5oTklNeDl1T2lHNE0zdkVS?=
 =?utf-8?B?aVQ2NXpkMWdCWUZRVHBQVzhNUVVBaC9PdFFsNTJpbDJCRnNXMlZ1d0prQ3l0?=
 =?utf-8?B?eGxYcjA0d2Z4SnhjWGUzeE1MNVlmRk14ZTlseW1jUEFBeTQvNXJNaGh4RkVv?=
 =?utf-8?B?V0o4WnF5S04vRWVLbk54dm5mWEVHQzFQK3pyVm5uYnFNcm95UmEwL2ExWUxH?=
 =?utf-8?B?cm5SYzYxQnM1cGVETDlVSjBTRTM4Wkt6QlZFWk0zNUJ1ZUNjaVQ1aTNuamMz?=
 =?utf-8?B?S25Rd0lqV29HdTBSRGRZNVBvaW83MUhNeEIyOUpRMjFDNjNYRmtiR1ZMdi81?=
 =?utf-8?B?NkhobEN3QTZ6K0tiZktxNG9jRkVrOWc4c083a1lSeHBaeHZ0eGxvTmhsVGg1?=
 =?utf-8?B?OFkzV1hyVkcvc1VYaWh3d21ySnRuVnpMSGduNWRJaE5lMlozRTZEQUxzWU92?=
 =?utf-8?B?TFNVcFdTUzc2dDhFckIwNVBRRXNDejdOaTlGVDY5bFVZYU9UVDBPZHBXYkFw?=
 =?utf-8?B?emw1M1o5TG12b2FBaGhlT0FxeXVHc1puSURkRjQ1Wk1tK1RTQzFxT2o4ZmdV?=
 =?utf-8?B?akM5U0l0Sjl1by9iUHVSWWk4aXloVDJienRMaHJnT04wNloveTZCYmx6MTlC?=
 =?utf-8?B?ZkpvRXorUm1qUVcreE11N0I0eExoTEg0TGxMYU9WWWFudkpuaGZxU2E2c0cr?=
 =?utf-8?B?QjNhOGhNdkV1LzZkS3V4d0ZYc1hjRVZEc3MrZ2dKekFHbUR6U0ZybGtKbE43?=
 =?utf-8?B?SDlnNGN1L041ck5kbVBtT1hOZTNWeUtBM0FmTENWRS9qaXliTWtkS25teTFi?=
 =?utf-8?B?djB3aFlsQzNFb0VNOTNxQnB2QlpsQnVDdHQwWVpEbEw3a0FQc2swbHhKQnFl?=
 =?utf-8?B?RzVxRUdqRTdkQytrUFlMSXBnNisrVzhQQTlpcnBSKzR6ajk4L2U4eG1ZUWsw?=
 =?utf-8?B?M1pUckdZODVQTWZtQkptYUVDL1U4am9UTWRHOTVvdG1iZk1iMFk1WXBWd2hq?=
 =?utf-8?B?eStNODVQdmZjTlFIQVZsSUpsaDkyWEtkYW5NRi90OU50Z0RZUUtPeG5Gdzg2?=
 =?utf-8?B?ekt5OGMrM0pIdDd1MFVpTTNaUUhGVFBmNUxBa0IzNTZuZVgxRWNLcGlNWE81?=
 =?utf-8?B?RVY2TlpBODAwTVNNdmdiQUF1WUp1YjlocmZlR1I1Tk9lYjk1cDBndGlhOWxh?=
 =?utf-8?B?U0k1U3NqU0lYbkFpcTZiWDlwUDhodVpBWnJPK0dZN09JTGw0d3ZvYUJ1Z1Fm?=
 =?utf-8?B?R1hDS2tNb0VTQUk0TUNxazJKZUZMaUxqSi9BV3AxeXM2NEhDSmFxSGVDak5X?=
 =?utf-8?B?MHpxZHEzMERNUU9xOGo1MDRPSjkwMDFZWDF2dGE2dVk2ZXJWYi9yZXBMZVVD?=
 =?utf-8?B?WjVZbDhBc1ZUbkZFQksyVlNsSmMxSVI2SEZJWGpWWk9WbE1QaGFMaHRQZjJI?=
 =?utf-8?B?NFBTaWdxZjBKVjRyNWFnY0NKL2NDWlJhbUhQd04zeVVmN3RLZUxjb01MSGpN?=
 =?utf-8?B?QktTeGhnNDdadFFuWmEzY3piZnNuNVhvTEpHVE9zbWNjcENyZzQ4TkdEWEFu?=
 =?utf-8?B?TFVGcmxYL21hQkR4bHhnMjExeVlQYmJnOC9Cc3UzYStSaHZTRWRsbklBZmVa?=
 =?utf-8?Q?UvYAE/flAKrVHlK1SKfX6OszD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef9805e-b468-48ff-4807-08db7271a6de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:07:46.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2HLofTsY4sDkhrGVvhflCM4NmC53Y/mMvpqM3G8JvSPS3yZumIa3CBjhRSWgn10F1extRHJlDNaYfc7dy++Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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



On 6/21/2023 6:24 PM, Mika Westerberg wrote:
> On Wed, Jun 21, 2023 at 05:48:21PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 6/21/2023 4:45 PM, Mika Westerberg wrote:
>>> On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
>>>> From: Sanath S <Sanath.S@amd.com>
>>>>
>>>> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
>>>> Ridge, explicit enabling or disabling of TMU is not required.
>>>>
>>>> However, the current implementation of enabling or disabling TMU based
>>>> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
>>>> enabled by default, such as AMD Yellow Carp and Pink Sardine.
>>>>
>>>> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
>>>> implemented to skip the enabling or disabling of TMU for SOCs where it
>>>> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
>>>
>>> If it is enabled by default "enabling" it again should not be a problem.
>>> Can you elaborate this more?
>>
>> Although that is correct, Mika, we are facing an issue of display
>> flickering on Alpine Ridge and older device routers, from the second
>> hotplug onwards. This issue arises as the TMU is enabled and disabled
>> for each plug and unplug.
> 
> Okay thanks for clarifying.
> 
>> Upon reviewing the old code, it appears that this issue was already
>> addressed with the following code block:
>>
>> /*
>>  * No need to enable TMU on devices that don't support CLx since on
>>  * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
>>  * bi-directional is enabled by default.
>>  */
>> if (!tb_switch_is_clx_supported(sw))
>>         return 0;
>>
>>
>> However, it seems that this code has been removed in recent changes, as
>> the CLX-related code has been moved to a different file.
> 
> Yes, I removed it because TMU code should not really be calling CLx
> functions.
> 
> However, we have in tb_enable_tmu() this:
> 
> 	/* If it is already enabled in correct mode, don't touch it */
> 	if (tb_switch_tmu_is_enabled(sw))
> 		return 0;
> 
> and tb_switch_tmu_init() reads the hardware state so this code should
> basically leave TMU enabling untouched on Alpine Ridge for instance. I
> wonder if you can try with the latest "next" branch and see if it works
> there or you are already doing so?
> 
Yes Mika, we have already verified with the latest thunderbolt/next
branch. This patch is built on top of next branch.

>> Canonical has also reported this issue and has tested this patch that
>> appears to resolve the issue..
> 
> Right, however let's figure out if the problem is already solved with
> the recent code as above or if not why it does not work as expected. I
> don't really think we want to add any quirks for this because even in
> the USB4 spec the TMU of TBT3 devices is expected to be enabled already
> so this is expected functionality and the driver should be doing the
> right thing here.

Agree. we will have to see what is going wrong in this case.
