Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13833E154A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 15:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240281AbhHENGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 09:06:48 -0400
Received: from mail-bn8nam11on2054.outbound.protection.outlook.com ([40.107.236.54]:37755
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232931AbhHENGr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 09:06:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew34EbPeZOEhpuT2yU4DudtQr4i9tzSRUFv5zCNM2Dx4vy27wk8JTyH6kC6VmxnVjuGysSmrDkaSAIVGRScGz4SolbhlcVWZMrP8w5uXpDX1vI/I0gfO4BI2PZHofgH1Aw3WVXEIPn0yo+SJStH2TbizNLpmJ1M/6vRgQ0XicoXCJn32994+rZ3PrKJC6pvRUUPcyioRE1PrtSa7gxBjNdeT1vkrHydjAX7a9N2gFO3yR5MM4wV9G3us+r54cOnYo6vqcPJQNPEvlXN69/7pVYNDB0FCd3qyq//o9VCwuD7BoQ2svBMxv3borUjY/9dPGnr3uVnNB5Lcl1K3xyrGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVcYGJPV8gA9KQkremonr30a1xVoDPDDPtAv+ZsT1iQ=;
 b=EHbIfoL8+MEp/h2x2eXc0+W3OjEwcc1OnrkaGofqdJdGiZK0Wgc0p4EpbA+X5OetHaMUmDcJkWmpdwihLJ52P5xzf7CLHVHPPbzCyD7gQNBgs26wvM6C1qwv0nxvFsFrUsWeF38p8IDo7gStVdMnvgif3KddE3bKClno3oJp4kYCyWRzfqnVeiGtvNbdUut4yhD8r+CfYcXOl2pIoPGU+0CnqP70FyLnEAdlSDnpiZ+eJSsuSCwdHd/aKZwBLMHlD+hlEikkQVooUMmTQjWToFwsvzZjaP7WdUquZo3XRnWYjROtqCMvZKH7Ug5uivCTvRBxJ+tXjNOcPJLFX3y1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVcYGJPV8gA9KQkremonr30a1xVoDPDDPtAv+ZsT1iQ=;
 b=li86jQA6tZJ6fditXRs5cJb0vbjqjFeDyqnZR574VvyYnG5ptQixCv8lu21bECjFmoCtRy3at8A7DCW9evvSb++KieFI8u0xNIGJASixiq40DAhRg5u8IkZMThYDel+cyx2uX3TG2lu2udNVEv6RTqy+KegzKIV8qoTq2VCpW+0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13)
 by DM4PR12MB5343.namprd12.prod.outlook.com (2603:10b6:5:39f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 13:06:31 +0000
Received: from DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984]) by DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984%3]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 13:06:30 +0000
Subject: Re: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading intr
 status
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
 <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
 <YQq21heIOiSeHqJ1@lahna> <YQvgD/4OA9enELwm@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <27bbe268-fd1f-8a72-7ba2-76eb82d3185e@amd.com>
Date:   Thu, 5 Aug 2021 18:36:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQvgD/4OA9enELwm@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::18) To DM4PR12MB5103.namprd12.prod.outlook.com
 (2603:10b6:5:392::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.44.125] (165.204.157.251) by MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 13:06:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c8e88c-ea55-4e7f-2d01-08d95811d78d
X-MS-TrafficTypeDiagnostic: DM4PR12MB5343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB53431D9BA781670EF074A353E5F29@DM4PR12MB5343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYQLROS01VkQEKLIliS6YI9yKWKcsekmx91sMOZd0cIvi0HOkxIe246dxlgP4Zu+aGdygg9cqJUYWy9GBBxyggqFdraJMYOnmPQf66S/IvYwGoQcP7CE+em2WIKRZjvEMSpZ3F4xO1MzmKgPohIAvRFT+mH55ylbUxX81hXVIps2NobVTJL1KWZSMBGWfX1fOnTbEEw3rKrPFL4TyvEITySj/6JeGB3D6iuZovcY0G+qn0fSFzbumssoblUcZwc4o6ppklXEYxBrgArfPJq+XJ7n8V3aiexSbW01g7EI6SSngfyaVsPF5qArb0eZtr3z3JDNIUFK9Fn4CJ1bnN6nHb82bU6PEMD4HC82cLFHsJ/0OzmeUUvC98WuWW+Ytp+cEYZeYgxpy4d1qqahSXmyHCSsYwfNLQXJXTy2AvpYLtd9mR3RVI3GfKV+/iWhqLpyNNAS2EmjVwxN2QAljiK/z0arNBsR4HhDlOM0tsMKL26yw4Wtubo/XejtRD0YB0jY2bbX8DTU47EFuNXlMwo2gcEYeTYSvPjkt2crEf9xTPYPWOv+62Hec3BAyoIZzzsZ0q9Wh1x9KjHpht3aE6wIFi88ovg6O7egzhJqX711skjOS3tcy0tt5ISgONYseOWpPkiWpMrn6Bu1nnHHze+i8kEefCm1njJdNVG6Kc/NXOM640/RpBv1N5EG+hfrlFb7vB9MOjEgzfaEpx7RCSsyIVn+EksFh9dgFfXxrj+Kep0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5103.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(53546011)(16576012)(110136005)(31686004)(6486002)(38100700002)(956004)(2616005)(66476007)(66946007)(5660300002)(36756003)(6666004)(66556008)(2906002)(478600001)(316002)(31696002)(4326008)(8676002)(8936002)(186003)(6636002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxtMm5ZaFNVYlFZQlBYcWQvZUxLV3F0WDdiOHBSc2lDeFlvWnJIbFlteG85?=
 =?utf-8?B?akg0ajZwN3UvS2xwSzhOMjFVYUdYN2x0UTA5bHBxZ1ZreVhHdGZ0LzhMTTlk?=
 =?utf-8?B?WEx4UVpud3NmaFJTeHVCZjMyNmFSZVpoQXMxdFFPYkFiVFBtYzNpSmpjZXg0?=
 =?utf-8?B?Uy84UEJLU0pYVnZwUzdMNm5wR2NsNDNjWXV0OUtJZUs4VGZHanFPZUQ0eW9T?=
 =?utf-8?B?VzcvSU90Y0U1NEE2VXVIblRWY1JUdVRaN1lleWdHV1dZYVlKdWpYd2Zud3kr?=
 =?utf-8?B?TS8xRExwVzA5bnY0ZCtJa2dmcE9JZXV1d0hsek1ESjVKK1JvU2tVRDhBNFZV?=
 =?utf-8?B?bDByTnpVM09peDh5dEtLdlY5dWFyS29GWjF5MU5lcUJoRUZnZ0RqTzVhSU42?=
 =?utf-8?B?b2lucE1kR1dXY3VHQUNxdWRRQXNzckpEaHpqVU83ZkdBdElLa2o3RE9xR0xl?=
 =?utf-8?B?M3lYNERKSzkreVZCRnBzQmZCMjVRNWhwWEhrV3QzbldGYWlDWVZXR3kyT3lE?=
 =?utf-8?B?MkFuRWFCdEtvTCtXdmJpamJCMXhWUXQvd2Q4ellES29BVHlaekZaNWRnTFVK?=
 =?utf-8?B?ZWN3R0FHY2pkbjBvdzZ1TVZ0bWJ0VUo1WjJGNnZ1SkJPN21tbnpkQkFnUHRR?=
 =?utf-8?B?ODJheE1hMGVTdjhodDQwbytVckdKUzBabzIxeTRNamNxeTR1RjRlNTVyc1pp?=
 =?utf-8?B?NDl6MGxWVGhDbHJjTTljZ0RLdHNURXp5Z1hCTWxHV25peDNBMTlud0JDM0Rh?=
 =?utf-8?B?ajk5NTFUdlJDV0NBSTkzUGNIbURsV3hJQ2R3RjJkOFpFWmsvNytuYlVaenZU?=
 =?utf-8?B?MHcxaHdkUXBwaWJsSS9DZVZrSHRTUmNOYnovSHlsbGxkUXd3WVZra0toQnVP?=
 =?utf-8?B?b2syWnlLUnNFOE1FT2xMV1dUeXE1K1o1a1JCQzNZRVlKSGVnd0xjdFNFQTVn?=
 =?utf-8?B?cVhJS29Bcks5ZnlmMDdDakNTZFVKWnlLT1ZXU3lDSW5OSGd1bStUdFhUWWJ6?=
 =?utf-8?B?TUUzWWU5UVc1bXNieVpsZitDSkpNNDg2aTl0eTM1Vm9HZDNlWE9zaldZTFBG?=
 =?utf-8?B?QTVKN3dDOUJHKzBjZW5lQnA3Uk5pNVByRTRXQ09aejROdmw5cmZBQkNhUENX?=
 =?utf-8?B?UVNkd2xJdURiY1NTTDVuMU1LaVlLVUJwRHNGY0RSZ1JMS1ovWmZzaUVMdGdo?=
 =?utf-8?B?amhpS281MjZMS2RJZ3VjcmpQUFNwa01tNW15UktIaWFWSnBVWmdIV3RldjVv?=
 =?utf-8?B?YWRpM3pzUExNZFhoZW1JdE9ncGxiSGhwMHpuUnJNZ2JSWGFWWFhBd005S21Y?=
 =?utf-8?B?WmtkZFJ6VWpVMWN6aVYwaHA4RjV6aWJJS3g2a0JtMERSVFZ6ejA5SVpIZDVD?=
 =?utf-8?B?VlFJUmVJeFJQN0NPamxUNzg1MG5XNzRIS1BtU2UyWTJpMmRaR3crQUd2bmhs?=
 =?utf-8?B?RUpMSE1RSW5CTkp4NkFNOVU3UmIwN2xDQUhXQmhodkRpYXRVOExwNXpOZzZC?=
 =?utf-8?B?eXdXTHlaRVIyU0w0cUNwRXU5UGJ3OGFRYzdCMkphMTB1eDNlVnZjcVRBME5S?=
 =?utf-8?B?eHBwVEhsRFNCeVJUVjlxOHBOZ0Fvd3A2OTlzbmZYeDM2azhWVjZkS0xPQi9T?=
 =?utf-8?B?Mm1QSWdORnN3UFd0THduTUlPNndQZ044M05HOUpKL2hkQlQzMjU5T1N4blov?=
 =?utf-8?B?NWNzRVRaNVNZaTErandvRU81MDNva0p0QVFHNzNNMEQvS2NjYkJIVlp4djg1?=
 =?utf-8?Q?LfKbc1mJJqIg5TbMe8pdHeyBQFTVQNVSG7CG1yN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c8e88c-ea55-4e7f-2d01-08d95811d78d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5103.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:06:30.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgpfX0rvdupAIbJ75GBrmJcQVDehQbfkore7nCI//Q21SjvavhiN0YlQsdhUGKY5gm5aHJwb2JqTcGwRnW3A7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5343
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/5/2021 6:26 PM, Mika Westerberg wrote:
> [CAUTION: External Email]
> 
> On Wed, Aug 04, 2021 at 06:48:45PM +0300, Mika Westerberg wrote:
>> Hi,
>>
>> On Tue, Aug 03, 2021 at 07:34:54AM -0500, Sanjay R Mehta wrote:
>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>
>>> As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
>>> and the Tx/Rx ring interrupt status is needs to be cleared.
>>>
>>> Hence handling it by reading the "Interrupt status" register in the ISR.
>>>
>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>> ---
>>>  drivers/thunderbolt/nhi.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>>> index ef01aa6..7ad2202 100644
>>> --- a/drivers/thunderbolt/nhi.c
>>> +++ b/drivers/thunderbolt/nhi.c
>>> @@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
>>>  }
>>>  EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
>>>
>>> +static void check_and_clear_intr_status(struct tb_ring *ring)
>>> +{
>>> +   if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
>>> +           if (ring->is_tx)
>>> +                   ioread32(ring->nhi->iobase
>>> +                            + REG_RING_NOTIFY_BASE);
>>> +           else
>>> +                   ioread32(ring->nhi->iobase
>>> +                            + REG_RING_NOTIFY_BASE
>>> +                            + 4 * (ring->nhi->hop_count / 32));
>>> +   }
>>> +}
>>
>> I'm now playing with this series on Intel hardware. I wanted to check
>> from you whether the AMD controller implements the Auto-Clear feature? I
>> mean if we always clear bit 17 of the Host Interface Control register do
>> you still need to call the above or it is cleared automatically?
>>
>> I'm hoping that we could make this work on all controllers without too
>> many special cases ;-)
> 
> I mean if you replace patches 1 and 2 in this series with the below,
> does it work with the AMD controller too?
> 
Actually, it wont work on AMD controller because explicit read operation
of interrupt status is required to clear it.

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index fa44332845a1..8a5656fb956f 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -71,10 +71,14 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
>                  * since we already know which interrupt was triggered.
>                  */
>                 misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
> -               if (!(misc & REG_DMA_MISC_INT_AUTO_CLEAR)) {
> +               /* Special bit for Intel */
> +               if (ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL &&
> +                   !(misc & REG_DMA_MISC_INT_AUTO_CLEAR))
>                         misc |= REG_DMA_MISC_INT_AUTO_CLEAR;
> -                       iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
> -               }
> +               /* USB4 clear the disable auto-clear bit */
> +               if (misc & BIT(17))
> +                       misc &= ~BIT(17);
> +               iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
> 
>                 ivr_base = ring->nhi->iobase + REG_INT_VEC_ALLOC_BASE;
>                 step = index / REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
> 
