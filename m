Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B83F3E1537
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239384AbhHENAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 09:00:06 -0400
Received: from mail-bn8nam12on2058.outbound.protection.outlook.com ([40.107.237.58]:12521
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238277AbhHENAF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 09:00:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBZQV+W3ANO8tyX2haonfDhquAqqcs3ECEumfeF84Z3qFouLJ1dG9oqHFOHI17R9jvAJAk7pamKUOPKdbFu6/If+t+22H/wpvJCJQtHnneskDtMTDcLFTvRm7BvSLcspekowuLRKo7VmnGGHINQNS8O2V8yrba4Mmm+VLu0RJ5V19dKDdiDdR5a2+l/Q1xxSDvcDgOz2vAMQn6GpcGSGSfJp/9Iosl6f8oL2XA3jWaU+rOauKbYLAdvHGh1WHv/UAlak7FfLwdqlXV9nwRvTeUvAMGYNtnV+VBfYzfBeKcPOBwnI6NzIrvkXH+gIEdtiRBW10oUtOPQYvlzlkBrnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0HWC2CHQwjyGo25KeBdypTIOf8Oio0LeQe87vJOAIs=;
 b=iKkLu0yek90vlEZpAtrBMbGhyLs21XPfah8HDeLs9wWZP8LflkJpjO/Nw6Ly17+uJZDBQWc0mAHJVnqbTlTnEFJBvb8umNsmIJD8WnSBq/xqgqG5skZQAsGeb7CMq5VANj60Qb13DsO1Bz6moqq9avwRqOl5WMHjkXWXn/uHGqt45H//BATdUo0rWEP119L/OyOZuViKRWZpWMfwTidomBbxnWNmq0ySVizMVtKWm8JwtyIbsjhedy7VNJtdTb5y2QhPsZNbjTtiqFkZ4bQs4C4h0G9LICkxHorgrr8p3prbDQN595kD7ocBVxHLnTChQvSMqCB/NdEs0pDs25uxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0HWC2CHQwjyGo25KeBdypTIOf8Oio0LeQe87vJOAIs=;
 b=gJ1DrtQjWF2uU+J1uYBI2uy1yZXLkyuAlZRcL98fuKIy0fDnjj1pRGUlDtFPqv4qmUVnor9w2WpMzDi648z2M37Lw9DsDLLaWfLpiFNr1X+I7WyOTkmY3sviXUqm4puWfsJUjatlK3zKmlyp9TQZb7/neh+Upd2Mf9ZnJEmYMVM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13)
 by DM4PR12MB5119.namprd12.prod.outlook.com (2603:10b6:5:392::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Thu, 5 Aug
 2021 12:59:49 +0000
Received: from DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984]) by DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984%3]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 12:59:49 +0000
Subject: Re: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading intr
 status
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
 <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
 <YQq21heIOiSeHqJ1@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <36665ca4-a999-39c2-2401-8dab282145fa@amd.com>
Date:   Thu, 5 Aug 2021 18:29:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQq21heIOiSeHqJ1@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To DM4PR12MB5103.namprd12.prod.outlook.com
 (2603:10b6:5:392::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.44.125] (165.204.157.251) by MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 12:59:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd3204b-359c-471d-1027-08d95810e873
X-MS-TrafficTypeDiagnostic: DM4PR12MB5119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB511990CB9138E94E75C5B6EBE5F29@DM4PR12MB5119.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jaGMcQ7vy04Rrm9VxOoPtouqt84gVsZhMgbqCs88fIgJaB08CGUYtWbtaAtyrImZb0ZW0fGRzYaQ59G8oE0aAAKq9V1dM47WJ3dTrNOIEMHQcAPt/3H+oE6YbU5tYQIOJ5jEBxqEPadhHSpBLsw62zOcOQwfHoyX/JjFqGrgXjx0DLULv0xvP0C7PwZMf2D+njNkxw6ZONWwl1WJGVLgRpDKEiP8RTh44WwpvG+gS8P9ktCJ9GGZMiU/JlpO6cWPXdnLNlh6ChPokx8rK2poNTVl78zhUWCyI74hoV8SYkx9j6n0byWwvMR366CAYWiEVyNdHyYeqi7YBJXmDDH+uNNspRiV5to89raO6YT7JLZl0yLAgoYJpqrFMhn8mE2MtG9I9Db5iOM69iqnxw5Hfj2AT8TvXH80sby7IWielkxJ7VjNqundsdAcI5CkNcFyqMjVqqJPiiXeKzGPoZNRICsWt86sZ1IzBBN9B6RrYsDT4IBZK9EyMwTsuuqIxjTOu3ySnv6VuycuhnIDc0JI5jMN0Mlbvuy0mY1I448coY/p4XJ7OGO3nBfrsWqJ9K6WxuOuRnJV46zqHI3C6vVZcX+sSMKvNncwDjFqEjMMt8A6pppYAMtUINaKIybSpCE5Uh2+8wh7FL2GL/ZWaM/Z3iqDsVv6KiTvsoq4D9Yge3ALGhVXS9bNJVcWRU3kA7XvFV1ISg9sWETQiijD7PiSD0deOHxx5mEr9i6tS2iTSdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5103.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(66946007)(8676002)(5660300002)(2616005)(956004)(478600001)(66556008)(66476007)(31686004)(4326008)(2906002)(6666004)(53546011)(6486002)(31696002)(38100700002)(36756003)(8936002)(16576012)(6636002)(316002)(186003)(110136005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRES1JXcHkrY0dOR0U5bUF0Q3ZSOGRaYVZZdE1EQU9iUCszMTJpUjM2U081?=
 =?utf-8?B?Yll0ZlJwZUZIOW5Ea0pFWHEzQXlIN1h1NG9yaWR2Q1ZwN3JIbTc1MVB2R01C?=
 =?utf-8?B?RHRXeFJVVGwyK3dnRTZjSm42ZmwzdU5uRHNYMjZuZkV5Wng2MFN0NXRkc0ZR?=
 =?utf-8?B?alc0K2NiVVNGQzdhUG5zN3ZiQUhBdTcyZmhMRHZ0TkNNYVVrZmxVRFdCZzlB?=
 =?utf-8?B?UmIrdHFIallaTE1RS3h2Mjl4dkE2bUpVamJiTzh4Rm5NcG1DUkx1U2I0WDll?=
 =?utf-8?B?T1lsU083NENuL3NNZWZ3aGtVT21ydWZVbUUzVUFUTjlGTmJDWXpMdS9obEZl?=
 =?utf-8?B?QXZSSWtXejh3STQ5YVF2ZEl3MjkzeXRFZHlSbzFycnU0MzVKbUJkZzBRYkxW?=
 =?utf-8?B?YzVKZjhnM3oybTA4RmlFUmt5NXRYNy92NEdOZ3dEU0Z2d1RpRENVZDZJSVRV?=
 =?utf-8?B?Yy8zUW55YmpuemlQY3RlMjhBWmFuS2habWNxVFlGQ1FuKzFMN3RPLzJTSzBl?=
 =?utf-8?B?S3QxeDFnVjMxK3psc1N5bjJnMUMrMk5KOGxLOWpBQjFTRmxvYUwvRnBvazF5?=
 =?utf-8?B?SWY4T0pKRnl6aDJQZEVFY0RiTGh3cWNYTmtaZXRweERDYzdLZ1JDNnlqQ3Q3?=
 =?utf-8?B?dFE2aWltODBrQTZiRzYyMVlYNWxTVXN4MlE5SnNYeEkyMDFDL2hJWG5IZ0ti?=
 =?utf-8?B?NW4ySkU3MCs0cDJweVRJMmJlTm5qYmZzbmtNYXMzckFVRGppcG5OUTJKbHVw?=
 =?utf-8?B?Nkh0eFl5VWphRCszcDZIcm96YWhncnpyNzFNNERmdTVhTnZpS0duS0tCNHVC?=
 =?utf-8?B?a1V6WU1QZUxyczBqWHZISEFVeGtDaGhtKytXOTlyb0FkdXd4dkxOQVpzYWlx?=
 =?utf-8?B?NllxUkZuVFc3R2hmNEdzRk9PSkVSbm5TdUNtbEpiNTNNenB1c0x1Wktjdm5K?=
 =?utf-8?B?UlI2ellQUyt4YWsxTmZCWWZ1OWJldEZhMFdoNFJMZE1WUW50UnhpeHltOGkw?=
 =?utf-8?B?YUNyaFpRN1p5WTB2Z1pMU2Jrc0ZVaG5JcW1oakpoaW4zREpiYUp0MjRydkwr?=
 =?utf-8?B?UmFtbmErNDJKZVRVbDN3MzF3aC9lZjhVWno2eGd0ek9yU1Y2TTh1NDZ0OGE0?=
 =?utf-8?B?UTVjSW96TTlMMFdJaUpKcmlSRVdjOEVNcnE1ZHBncnVEalRDTGFZRkZsQnJo?=
 =?utf-8?B?eWVSU2tTcXptR25XSjNOQVYvQkZDOGQ2VjlhVkhJV09WckczUGFiMTA1eTd4?=
 =?utf-8?B?RkxMTnpMWkdma1ExOG51MkNRVVIydm1wY1RRcGF0cm0xZnVvaHMzTzNtN0pz?=
 =?utf-8?B?dTBXbjJQemV6WGtvQ3N5WDJ0azNnRGpSODc3bTdMZklKVkk1N01lclFweHBt?=
 =?utf-8?B?MkhtNGV0c1U3OUpOOGFOQVNacHdMSVpMOG9oY0MwZGplMzdvWVl6TTAzdkpY?=
 =?utf-8?B?QVhpZHpPMUpMUUxyYzBuTmNiaW5uRUxWejZyZjZ5NElWbWszRnh6NW9wZTBo?=
 =?utf-8?B?MGhEVEhkaDAzTDRRZHBTWFd6OVBwdGcranJ0Y3Q2QjZoVnpVVWw0L1gvS3dj?=
 =?utf-8?B?eVVpY3Z5Wm0raTV0RXdqUVZ6QUhGTUVLbk9iS29lMzFvT0dFY20rMTNFanBq?=
 =?utf-8?B?SkJQMmp6UEloOGtLTUE2WmlsNEpQdmY1L3BRRDJQaXF4TzNqZ2U0RUN5b1hM?=
 =?utf-8?B?SUlyNllhM2lFSkFtbDdxWXl3UGNobllnNms5Y0diRC9UUEMxUTNjNnc2VEJ3?=
 =?utf-8?Q?JOnNh14NkpKKCeWpOL87Svugr9ViOnKaV+I0idS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd3204b-359c-471d-1027-08d95810e873
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5103.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 12:59:49.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+qX55a2t4VK+yshdGMYiAu73csLHD99LOMQlhfWF3eEwzYjFUqhvwYeljPOzSx3vRME3Qs8gsoAl3/9NB9zkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5119
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/4/2021 9:18 PM, Mika Westerberg wrote:
> [CAUTION: External Email]
> 
> Hi,
> 
> On Tue, Aug 03, 2021 at 07:34:54AM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
>> and the Tx/Rx ring interrupt status is needs to be cleared.
>>
>> Hence handling it by reading the "Interrupt status" register in the ISR.
>>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> ---
>>  drivers/thunderbolt/nhi.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index ef01aa6..7ad2202 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
>>  }
>>  EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
>>
>> +static void check_and_clear_intr_status(struct tb_ring *ring)
>> +{
>> +     if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
>> +             if (ring->is_tx)
>> +                     ioread32(ring->nhi->iobase
>> +                              + REG_RING_NOTIFY_BASE);
>> +             else
>> +                     ioread32(ring->nhi->iobase
>> +                              + REG_RING_NOTIFY_BASE
>> +                              + 4 * (ring->nhi->hop_count / 32));
>> +     }
>> +}
> 
> I'm now playing with this series on Intel hardware. I wanted to check
> from you whether the AMD controller implements the Auto-Clear feature? I
> mean if we always clear bit 17 of the Host Interface Control register do
> you still need to call the above or it is cleared automatically?
> 
Yes, AMD implements Auto-Clear and a read operation is required to clear
the interrupt status.

It is explicitly described in the Spec, Section "12.6.3.4.1 -> "Table
12-27. Interrupt Status" as below

"If the Disable ISR Auto-Clear bit is set to 0b, then a read operation
returns the current value and then clears the register to 0."


> I'm hoping that we could make this work on all controllers without too
> many special cases ;-)

Will it be good idea to have a separate variable in "struct tb_nhi" as
"nhi->is_intr_autoclr" so that we can set in the
"quirk_enable_intr_auto_clr()" as required which can be used in above
check_and_clear_intr_status() function instead of vendor check.

> 

