Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A329E3E1AEB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 20:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbhHESDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 14:03:53 -0400
Received: from mail-dm6nam11on2065.outbound.protection.outlook.com ([40.107.223.65]:52321
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233016AbhHESDh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 14:03:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToN3xTMp0WvOZMi+9SvEUd4wzjaO0by3iXBBWPPbadPJIRzxwvK/LkFj88lrWU/Yl2JeplxZNScHgQx29UQL39mhj7G1O4K/vsBcsA05hR5fvvKHR4g1Q63kcFWR/3UV95748mQr1hE5CE998/JRDvp6aeHsaTQv6MCmYXyMP3SfawrpPTWAfLpfHgglreCMQoi/gUYDpigje3st9WaCH9zXKocfMTHg8VSA7KPGanUVaw0RwZJ6ELgLWBEKEiMj888GpbEWxVZ0738mHjYknD5z4RGBtHGng4lHvZtImaCHO9ZvM5azVTBXbjGG68P8ZiG5LAd1FGv5LASw2Tz0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7GWQwT76iM96LsFNJZPi+W0MH9HnAcBDOjOr7GBDSo=;
 b=fH0u2I+UwwrKjCqA01HQJyHvybR7wUJ0qjiMGO3qixZNyTMPHYwDpqmLz5Qi/SMpxn5XyEile3+oIi55o+fBFjGmkqt97PKVntkwQB8xGhgSKsRNQppZvBBXqyB9JJJz6wLjw4epNp2DqXcs2wKvQ2BXYGnTTkROYaLgVZ4RBn5St3LNDaXm/DZGryY+FySGDNh8OE9JY2SGh0manzmmBS8Z9eFSdYhvgs377YWm6KSmYV+A+lElU2jUeJD/M1aO407szDXF3aJhdVvmrtC230ix18LC7yRIwpPqAGtpXRRRDZ2Pi3FmqvQkzhVVQcJ8cYvPeGxdNF1GYsEX+BUhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7GWQwT76iM96LsFNJZPi+W0MH9HnAcBDOjOr7GBDSo=;
 b=PQEhogF+xUEjAeDkSa5N0uxZOHt+lnMN6RMJg849O2PJfKZPA6TkQw0pcPzRPKHfw/nnE3kl6ehWEY7Np8kb/viqbPhYDzxfTVb1LhtX4LN1xYkk1ySz9ydh4WwLklRn4ZP3W1HG1U1rqgEhgDqqMSdIjwbg4eNGhnhI+3pm8Uc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Thu, 5 Aug
 2021 18:03:22 +0000
Received: from DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984]) by DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984%3]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 18:03:22 +0000
Subject: Re: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading intr
 status
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
 <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
 <YQq21heIOiSeHqJ1@lahna> <36665ca4-a999-39c2-2401-8dab282145fa@amd.com>
 <YQvzdkXzOwUcLnBd@lahna> <YQv5t3OlaMxT/w0o@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <a1a30df7-3218-985c-d379-b8d042d8c9c8@amd.com>
Date:   Thu, 5 Aug 2021 23:33:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQv5t3OlaMxT/w0o@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To DM4PR12MB5103.namprd12.prod.outlook.com
 (2603:10b6:5:392::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.6] (171.61.80.116) by MAXPR01CA0093.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 18:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13ed572e-a21d-4523-43d9-08d9583b500c
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5230E6E9A1304BD76FEBF56BE5F29@DM4PR12MB5230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTmJfW+ghQiRD1pPuidGeYBR6yhmrsMdvTkPZOKQF2YhR/HR7oN3daK7w4qcNG0HKZRg9F+uMVbxe4+D8VY3gWoOkou4oKSD6CLAy+JAGln94k3PX4RotNtYpmDEJpE7MwCdHPwgrifSN0wfsfwYgE4XnjBPKhNp6rZmRgneFpz4wmx2wy5n+P6bU8WR8yImouEA290iUkBzX41w7inm7eW/seZpfXwxFxCPSikY0V2UPrYIvvBXkfcUOARGyxc1m2s+Nyfi1q1/Mkw/H64oNLcxXbs+C8fjcDa7wCeTcOooITv5P8ZGE8pVc3qROlx83JGiY7eQVBgn0jhTx26h9cMd/3b7eoD7DG9FFjHbEz4Ik7VRFhLyYTD/k9KoLFt+5skDGv6Tq5O1kwuxkQdlqadAlsizRp/Z5I/UBa5nCT7UdRCNifADKQ+6wtK2hN8u1KdC63/HuVogDhnLn8LwDnxwdHBoB96a/dGhmQ5aGsSsmIuNYr8+1hZXesAQmg6WTPOOx+z1Z360QWtwYEwO1QLRkuHRiT9fnPkISpCgb8QuPeuIgJ6npOmxjdQc//FmIPn78dfD+NQiQOhpq556xKzVM8mKuyx9YYqMhU+LZu05+G3Bkg8nt+KmX5qunSI0QBrLvNTPaqOcvEMX3XyYL1cVIeSHjSWz0GsJHkrUopbb1eZC+cqZ2B3IFDqha8JRaCNozf0Zwwl025Yau2+0xlAc9xsf4LdW05zmiGC4wXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5103.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(8676002)(8936002)(54906003)(38100700002)(26005)(66946007)(31686004)(83380400001)(16576012)(316002)(6486002)(66476007)(478600001)(53546011)(5660300002)(66556008)(36756003)(186003)(6916009)(6666004)(4326008)(956004)(2616005)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tBN3hRa2tzQTdIS3QxWlE1Tzg4RURZWi9DOTlqRk1BQzVLSlY4QXY5bjlN?=
 =?utf-8?B?QUdITUI0Y0dNbnNZR2xMa05vRXJYMFhrVm1hNy9MVUZ0QWluSHlxUzlYd2Zx?=
 =?utf-8?B?Z2NqSnFSZTQ5bEVwYUFOMXRnRmN6UU9DSGZvdm1HR3hEam9LY08wa0NkeWtj?=
 =?utf-8?B?Zi9GOFdQdmFIQlliMmR2S0R4Vm4rQ1YybUdQK0FQdjVDMlpMMXMyQkl2bW5k?=
 =?utf-8?B?R2tvdGNONVdaK0JsQmlaZkVvQVBWclRJOVFMZVFlL2RYMFdvc3Jvd3ByTzFM?=
 =?utf-8?B?V1JIRzZXUHp6ck40TitrRWVESlBSUEpJa0VrR2FQaE1vZUphdmsxKzU0S3dL?=
 =?utf-8?B?eHZWcm9zU005ajVERlJZTEdqYVdPWnlOVTM5Ynp6bytvSWJkbVBsSHpOSnBH?=
 =?utf-8?B?RkNNNlU1Ky9nZXdOUG1MdkwyZldLTTJFTnV5TXhtUFVUK2dNcWVFOVRaSm9z?=
 =?utf-8?B?bVpkSDI4UzdOakI1L054c3QrKzZUT1B4d0VZVFpyOUhWb0daQXdhZUtLQVhi?=
 =?utf-8?B?OFUyVUNYUENHK1NJUnkzZ3ppTlhVQUVJZmIrNUxyYUFUYm9WLzNQS29jbEsv?=
 =?utf-8?B?ZitHaTNkTFNpRlBnWjk1Nnl1bHorTXQxeWc5MVVpVFJ0Umo2d0xBVDRVS3Yx?=
 =?utf-8?B?UGF6TW1FdmxGSlk4K21YODBVMjdrZ3ZSVFZuTFQwdThZb1IvSDdLM2htbkJt?=
 =?utf-8?B?b0E1aXZTbFhSZzl1ZXJ2ZkwyYlFtazdMUGRCRjVXQXZJdWNYcXNOcTdTT1Nj?=
 =?utf-8?B?Y1VHRUVLS2M1NkFUeGN4QUFnUndKZ2lubEUycXYyVS90d2RVQlJ4Z3MzN0Zl?=
 =?utf-8?B?WTVyQmRIVHRCQmswRlp1OTZzbXBnb2RvbUdiUlRzSjQrMzNEM1JrRGttTk05?=
 =?utf-8?B?ajJCZXA5cWhsYWZ3andwUFM5MWtGRjlRN1JCWks3MTZWalQyQUZMUnE2MThl?=
 =?utf-8?B?NzdHNUJSbUFNQjY0ZVdZN0ExZ0tESklpa0pVNXhNcW4rR1FIa0NuZEZDLzFG?=
 =?utf-8?B?RUNNWkxZNE0rcFA2eWpXTU5pWmZoYjZHNnhBeG5GQzI2S1l1a2RUclpRTVZa?=
 =?utf-8?B?Tmp4akJoYSt6SllDNlZoNVk0ejRGVTl2T2YyWFp6R3hvTmpTTnRVbEUxRTJQ?=
 =?utf-8?B?YUNFZmdYL2M2MGhKQU0rMFEvUE11dFhGdU95aThCSWtuZHZuTktlNGhBeEl4?=
 =?utf-8?B?N3A2N0cyd3czYWpVT2ZKVFFoRG5NZy9tUzZvVDVoUG9KZlNKWmJ1WDB1VzYw?=
 =?utf-8?B?ckQwNS9wSXBueCtzaW1PTHFHaVpBUnM2WTI0Z1pmM1dpZm0vbnl1Wk0xM1h4?=
 =?utf-8?B?NlRQUG9idGdYSGJ1b3d4cHkzeUI4NmV4Rlo1YjNqMVhpVXNaUGV2Yk5QTWFm?=
 =?utf-8?B?ZWh6WFUvV2ZsNEhYQ2Iwc2NqaVJ0UVZVYVFSZklsZmx5dzZSTm5kbGprVVRz?=
 =?utf-8?B?VmRBV1VSb0hZMk16UGttaWVteVkyRE9YOUlEajB3UHdYVmlhMzVxRlNvSmp3?=
 =?utf-8?B?N2NtblA2bE5vVzhGajdUSENIRk1qNDA3SEtpTHRSUUlWR2VGaTQ0azcyT1ox?=
 =?utf-8?B?VkVhS1pOUHNab3IzTVRUMHVYUFVjYWh0bjUyLzdzcDJHam0xSmMraU0xTnE4?=
 =?utf-8?B?UjEwQWI2SnRBZ0p4NkF6ZXIwTHI4NkpvTE5KQlVwdFZvditBMUVlazVULzdj?=
 =?utf-8?B?NXpzTFZOVUMwRWxzZUR5QXBjMVBvVUZpdzY2TDNlYjRvTjl4K3dGNWZFbEFN?=
 =?utf-8?Q?MquNJ07ldaNWH1NkTUEoJ0iGdd/51ku4+SMlD8+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ed572e-a21d-4523-43d9-08d9583b500c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5103.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 18:03:22.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U06YnJAn/bUF/1ObTXaD4Vr5rAVue3s99kwED1TfvAq14gO2rFMaualiYIj5IbiW/LWWwiLAk/c44d4Yvvxzpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/5/2021 8:16 PM, Mika Westerberg wrote:
> [CAUTION: External Email]
> 
> On Thu, Aug 05, 2021 at 05:19:39PM +0300, Mika Westerberg wrote:
>> On Thu, Aug 05, 2021 at 06:29:36PM +0530, Sanjay R Mehta wrote:
>>>
>>>
>>> On 8/4/2021 9:18 PM, Mika Westerberg wrote:
>>>> [CAUTION: External Email]
>>>>
>>>> Hi,
>>>>
>>>> On Tue, Aug 03, 2021 at 07:34:54AM -0500, Sanjay R Mehta wrote:
>>>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>>
>>>>> As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
>>>>> and the Tx/Rx ring interrupt status is needs to be cleared.
>>>>>
>>>>> Hence handling it by reading the "Interrupt status" register in the ISR.
>>>>>
>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>> ---
>>>>>  drivers/thunderbolt/nhi.c | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>>>>> index ef01aa6..7ad2202 100644
>>>>> --- a/drivers/thunderbolt/nhi.c
>>>>> +++ b/drivers/thunderbolt/nhi.c
>>>>> @@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
>>>>>
>>>>> +static void check_and_clear_intr_status(struct tb_ring *ring)
>>>>> +{
>>>>> +     if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
>>>>> +             if (ring->is_tx)
>>>>> +                     ioread32(ring->nhi->iobase
>>>>> +                              + REG_RING_NOTIFY_BASE);
>>>>> +             else
>>>>> +                     ioread32(ring->nhi->iobase
>>>>> +                              + REG_RING_NOTIFY_BASE
>>>>> +                              + 4 * (ring->nhi->hop_count / 32));
>>>>> +     }
>>>>> +}
>>>>
>>>> I'm now playing with this series on Intel hardware. I wanted to check
>>>> from you whether the AMD controller implements the Auto-Clear feature? I
>>>> mean if we always clear bit 17 of the Host Interface Control register do
>>>> you still need to call the above or it is cleared automatically?
>>>>
>>> Yes, AMD implements Auto-Clear and a read operation is required to clear
>>> the interrupt status.
>>>
>>> It is explicitly described in the Spec, Section "12.6.3.4.1 -> "Table
>>> 12-27. Interrupt Status" as below
>>>
>>> "If the Disable ISR Auto-Clear bit is set to 0b, then a read operation
>>> returns the current value and then clears the register to 0."
>>
>> D'oh, right. It is about auto clear of the ISS register on read or not.
>> I misunderstood the whole bit.
>>
>>>
>>>> I'm hoping that we could make this work on all controllers without too
>>>> many special cases ;-)
>>>
>>> Will it be good idea to have a separate variable in "struct tb_nhi" as
>>> "nhi->is_intr_autoclr" so that we can set in the
>>> "quirk_enable_intr_auto_clr()" as required which can be used in above
>>> check_and_clear_intr_status() function instead of vendor check.
>>
>> Probably that would work better. Let me try to figure out if we can
>> somehow do the same in Intel controller too so we would only have single
>> path here.
> 
> Looks like we cannot get it working without quirk of some kind :( I
> think we can do this:
> 
>   1. Add nhi_check_quirks() to nhi.c and that one checks for
>      PCI_VENDOR_ID_INTEL and sets nhi->quirks |= DMA_MISC_INT_AUTO_CLEAR.
>   2. Then check it in both ring_interrupt_active() and in
>      ring_clear_msix(ring) and if set handle the case accordingly.
> 
> Let's add nhi->quirks directly now because I have a feeling that we may
> need additional flags in the future ;-)
> 
> Would you like to update this series with the above changes or you want
> me to do that?

Sounds good. Sure, I will update this series as per your suggestion.
Thank you :)
> 
