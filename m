Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9C74BCE54
	for <lists+linux-usb@lfdr.de>; Sun, 20 Feb 2022 12:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241526AbiBTL6Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Feb 2022 06:58:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237539AbiBTL6Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Feb 2022 06:58:24 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932742DE2
        for <linux-usb@vger.kernel.org>; Sun, 20 Feb 2022 03:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl6tX25S1U49jO/qO87hLgvsV2SVYcQLjDCGydPTKOIbKZpirzxYgdwrvV4r9+ie/x97Vx+qSmSw48F4rqDXmWgVXpCLphMshu15/2YXwE1XnVkoNJDCOrzgkSTHhnb0bnXYRKfAjF2V9cRYMuwLkP9w2m1XsalcZVFSzGUDdzO1GUlaxDji+K9WZWC0ArXC85dfcSHTHAtmGB5dwh4rtG7v9yh5PDwRsRTZT8MZg7v+2UB65zEsm2mikSxPGzLuCbTZenbGm/9IbG4ZHed3Z1XnMhCuXrxHU5OVlhrfu6iU64iclqrbubLoFGRx9LIQUkfDlVRGhIeYhyVZ7nKHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWWjERW/+IFhss9/M8yUkM8Of3nC7ZdTUfKJbdxJJt4=;
 b=aHsAqX7KQOg/5dadC4FvR56j5re/UTEMDSb9tZpbE2ZJSVBApoa0tekoEWO2o27XufSrQUAVZo23UYJGa8NYKGPBs62RQ6sMSaEpz7ftlNekbr5Fa/DsM59+1UE4aOKmVRrDg7Pv1VKiaAcmr5NrWr2DAmDAwqI7Co9LFBbyg/6Z+MJFR2XkYnm/ry0V5xO3Gn2JAiiZPyG2mum1ij+1XKS8ARWAB8fVUIgP/7dx1K1jutecUhACVrcmYzA11SAdmbjyO32tDFad+ox9GtSINBJaFByXgHM2xBgUVxp9fEMcJeOjwG0L/qJ/xegdPLXuZaMVPL8ECevIoGFA0mr+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWWjERW/+IFhss9/M8yUkM8Of3nC7ZdTUfKJbdxJJt4=;
 b=tyiGe2VwOkzpgt6z5ZXsTWCuFsfrUuc47dcjXRo/d8C89hCcJ4rCrCfXxja/jhNAHv4hUKVDU3ZYfATFeNTkHmnoI7KwzGlkqse5f0LJ05XwbBU9CMiZPFE2T4UelRtCRj7s2tNMI6lnrBDfLBGhz3liowvIrdZNrd/Q7pbyle4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) by
 BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sun, 20 Feb
 2022 11:58:01 +0000
Received: from DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::6c1a:2b5b:535d:cbfb]) by DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::6c1a:2b5b:535d:cbfb%9]) with mapi id 15.20.4995.026; Sun, 20 Feb 2022
 11:58:01 +0000
Subject: Re: [PATCH] thunderbolt: Retain host router DP IN resources during
 suspend
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, jagadish.hadimani@amd.com,
        sachinkumar.butte@amd.com, linux-usb@vger.kernel.org
References: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
 <Yg9/YWrk4qMhoEut@lahna> <ac90de2a-2d13-ed0f-2d75-8cc3e5a882f1@amd.com>
 <Yg+sXedW1RFa65SE@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <db25ec12-33db-224d-b575-44a9a3b332c9@amd.com>
Date:   Sun, 20 Feb 2022 17:27:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Yg+sXedW1RFa65SE@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::32) To DM5PR12MB1242.namprd12.prod.outlook.com
 (2603:10b6:3:6d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65ff90ce-b35a-4002-898e-08d9f4683e32
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5356E6AF159BEB920FFC0963E5399@BN9PR12MB5356.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXh6hGpLVHwQOlB2zTNzu0A01MB+r0kK2WZkLtOaoNTu0fzzNUB97PhH+lQHfAKcm2moly1hz8jDrCPYmfb4GhWSVDQn3Tg2Q3t0Lp54BICKF1z+tE+61pX5el1vMug/8sMGDyGhAtpqmt30WXn4AQ+fInIbgd2soTChsu9GUo+hwYDZ4O/1wQGMW1FVNtGttlkaoJx5BCV5zIoEt3Ms7csWf9MTZdfedrgSq/T8+oxY9Y10f/wQh/3tkbpaT+BeaJKMjr2yYNUDZpKQNq37eaaFmv3VZnXStsLsGbzdu2T138vNznrhkW5bnbljlwXuDY9cUNpmmNRkBHu4MPISBi747s6GtA5MAeOYtVZyu3fmxmndh+pRetuo8FE4KOwVobCJ6sCwB47pfidAQvSJft6ktUurimaXFCVjqHyOachwwMxEaVKmY7GU0WOlQTz2ffctDvauRVZTpLPyizKz2K4Wdw/oIfEV294qb178v6MFSYG0kYqWpEvomIAVzoijOJOfOKxTMEkZu7rqsFIz1D28KUi/ZYzLOhsZGlp+WpwcnW0VvUgfMQ4Qmpu8L6+PYMvPFV2uIFfWKkD5G1vS5Cl7PGQGi/wZk24JgK9FlG7RiJLWGGgyXvMy3T7f2lf4ZoCf/pGfe+MK4T4QEYhrtBS8IIwKDUz7kXXNreMYcNe4OIxTELkXdWsoW6RN0PJ9quUO8iqZ/T6jwhhgdqWE9Ds6j3zpMEmF7zPYzXxRfAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1242.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(31686004)(6486002)(36756003)(66574015)(26005)(186003)(8936002)(6916009)(66556008)(38100700002)(66476007)(8676002)(5660300002)(6512007)(15650500001)(53546011)(2616005)(6666004)(31696002)(6506007)(66946007)(4326008)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekw1VktKczEvc2UwOVdUMzBLYlV4Zyt6Rm5mUWdScUlPbG9ZTm5JQ0R0aG02?=
 =?utf-8?B?SGkvU2habDR1cnBoSWhSYzRvcFEyWVFDNXV5eEVMVWZiVytEOUZQclpPd1Fy?=
 =?utf-8?B?ZEdmdVloRkE1bndsd015V1Y3Rm5weDJSeDZtazRoOGRUeU1jVU5KYmphdkVY?=
 =?utf-8?B?Wi9Jb1I0UjlDazJsVjhVUXJFWkFjR0VSR1ZNTjBZcmIxWmVxSllid3dvSzNX?=
 =?utf-8?B?YkJmd2M2Y25MNnhEN0I2UGdRN0p4TEk3UmtZTEJmL1NLUEZONWpMNzJhNDJB?=
 =?utf-8?B?S3MycDNra0hmUG5iUmN6LzVYRmdSd2R5Nk1mTE5tRzFBMGVTd2I1b1E1aEI4?=
 =?utf-8?B?TkJjVm83TXhlM1QvVVY4eWJiRDJFZjlOYmt0TEZmZWxLRHYvRTM2ZDhkZXVq?=
 =?utf-8?B?WXBmSU83dHdZVjkxWVhUWkprODd1blRPR3QyRFBSRVkvcmp3TXpBOGt6d3dT?=
 =?utf-8?B?RU8rWnM3VGR3RUhlMjJOeUJUOG5vbFNRSUJnZTJBUGRhbEJMcWdNY2dBVWN5?=
 =?utf-8?B?eW9CUThBVHZsdXJNT05TV1JIWXJ5T2twWkJvcXYzMGxoQ0l0RmRHRHBIbkUw?=
 =?utf-8?B?UWhxVjdQTnF0bXY0L3lvQk83VXFlNlBmd1pMTFhIZTlLUnZJaGxiQUlKYjha?=
 =?utf-8?B?ZlpPSi9QYUc0azdHeEVoZ3RNWE5HTjFEMjRyMFFmUVA0QXI5cWJIcjVncEJz?=
 =?utf-8?B?OTdQZVhFOEpHWldRRzRTb0F5WXVJZjZvdW1XT05TRnZFdzNkUXd6cDRsT0tG?=
 =?utf-8?B?VGdDRDZ5MjdobkcydVZ6YzNEN1hOdS8vNE5xM3dRRS9wWjhWV1JwK0E2c0E1?=
 =?utf-8?B?V1RGbTU5MS9RME5iZ0VUUW0zMnI2MmFndVVGQlMyVWU3NXRPQVJFaER0aTRm?=
 =?utf-8?B?YnQvVlNLaG1BdENoK3RQZHU0UzhwSC9jVzhNVWplNVBjakM0b1J4Q2hQQ2Y0?=
 =?utf-8?B?aHNuaU05OWVRM3Q4UTc4MFN5N2Z4WHVuSFFqOWRLMjBjbFhBa3cwNzFobGR4?=
 =?utf-8?B?bERKTlBSZ1dKYWRkbzJubVBRd0NLUEdzcnBoaVB3QThod1IwK1FFQ2h4OXFM?=
 =?utf-8?B?UnJNYVFhdVNPeHg1bERJYVpxVVIwZlNLNmFwV0pKOXI1WGNvWmpkMThzQWhp?=
 =?utf-8?B?c01pa24ycDFHYmFBUGVvVTFNRlpKM0Z5UVNNcFVwa3JHeUFaNm53SnpiUW1Q?=
 =?utf-8?B?eFBPaWEzV1JhaXM1cW1MMXFDN21mZ3BES2U3VUZSREVtbUlPaGtBVk5SVk9a?=
 =?utf-8?B?QmcyeVVidlBwUkxUeVo0ckhFVllMV2U3VGd4REpWQ2hvRmJUV0E3OEpMeTIz?=
 =?utf-8?B?VDdISTZYV3JrcHlkb1dQa01FVGNSZy9ldVJ4M0dHVmpZcmY2UFVlZDhoTkVM?=
 =?utf-8?B?RUM3TlJSSFdmbzBVc2hHM1dhbnNjUnlua2xCMDNCdlA2T0ZUclhSQ3ZDSVBP?=
 =?utf-8?B?SkVmbXRXQzRnOTVDeDQ4clhBT0QvTStjTXdXSWNUTndJVlY1TDFkUCszdTQr?=
 =?utf-8?B?Z0wxcGxXNXBoc0JYYlBLeVRjMTZ4d1MvY214S205K0ZaK2VXMUVIdUQxaXYy?=
 =?utf-8?B?LzRIM0tMdGxqWVY5ZlVhMmdwdjhPM1czU1NKVlFTRDdlNVNoN0ptaUtGV0lN?=
 =?utf-8?B?dXBYb0RtVzFIS0tSQTNUd2xicGRXUHVmLzBUTWh0NjdRRTFvSEd0Yzk1b256?=
 =?utf-8?B?ZS85dHJsZEoxenN1bmVDeHZtODRNOFZ1aFpxRHRsUUt6YzVtT1FTYkpLbzZx?=
 =?utf-8?B?MWlaRFVwSGV5c2tJWExydmNDTmhDSUgzYUx6RXp0Z1dRS1VwQTRsaWozRjF3?=
 =?utf-8?B?ZEdDeDRVb2VRQWVrc0VjamZQWllhWElSMEJIanFkQ2JJaXJhQ3h3V0djcFJK?=
 =?utf-8?B?UUkzcW1LVTdQMWdZQ09xeGwyeW5QdzdMRlVVWjY5Q0E5MDlpVHhsMVRsbUNh?=
 =?utf-8?B?VmlvUTczQWJPYWNMREUvYmk5a0M2a3g5VUM4MXZ6Z1h1RHpocUs5cjBWRmFz?=
 =?utf-8?B?UnpnLzZlUDBTRFE5d2kzMzF4cytYMi9EZkJabFBHVUFOZG1nZEhJWWpkSmlZ?=
 =?utf-8?B?M1Z0UHdrakt0QnhwRklxWUNtYmd3cjBqRUJ2YUErK1hIa1Z4c09uN0FEcmd3?=
 =?utf-8?B?bkhFQ25lL1g0Mms1bnRodXlOeENPenJERk9YdWZKR1pvdmVBSXhQOGszMy9m?=
 =?utf-8?Q?SOznV+JQkZZHcndCkfBmrUY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ff90ce-b35a-4002-898e-08d9f4683e32
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1242.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2022 11:58:00.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Yn2j/tNW1OLGIAlplwvmWUDi0fKLILDQKE3SuDpqZPH7SGA0YWQo9xa/LaWR+srjZxaC0J3n0F/zjBpLK8Qbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5356
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/18/2022 7:55 PM, Mika Westerberg wrote:
> On Fri, Feb 18, 2022 at 07:38:23PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 2/18/2022 4:43 PM, Mika Westerberg wrote:
>>> Hi Sanjay,
>>>
>>> On Fri, Feb 18, 2022 at 01:11:25AM -0600, Sanjay R Mehta wrote:
>>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>
>>>> All DP resources are released during suspend and while
>>>> resuming back DP IN resource is not available, therefore
>>>> unable to find DP pair to re-establish the DP tunnel.
>>>
>>> It should get plug event for the DP IN adapters once the router comes
>>> back from sleep. Is that not happening here?
>>
>> Yes, plug event is not happening for the DP IN adapter after resume.
>>
>> The DP In resources are put into tcm->dp_resources list as part  of host
>> router enumeration. But when it resumes from sleep, there is no plug
>> event happening for DP IN, hence DP IN resource will not be in
>> tcm->dp_resources list.
> 
> Right but if I understand the spec correctly you should get a new
> hotplug event for the DP IN adapters once the host router is moved back
> to "enumerated" state. This is how Intel hardware works at least (and
> this is the understanding I have from the USB4 spec too). Do you see
> anything in the log wrt. this when you resume the domain?

Thanks Mika. I'll re-look at this scenario on our system and will check
if anything needs to be taken care of.

Thank you for the valuable input :).

> 
