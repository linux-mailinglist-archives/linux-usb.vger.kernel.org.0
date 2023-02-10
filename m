Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE056925DD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 19:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbjBJS6J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 13:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjBJS6I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 13:58:08 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAE37A7FC
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 10:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDMZckydpgk+HIA/XiXpHTtiTi+/jwcCz+BZc5GjcgqaziKroZfBbDlzudbwLUhP/tqnJsGqHmwoGzW4w3e6b364tnXgVhsseffnY44S9SuvP2U97H6sfejlC36vkxQxoUtKJI2FTMSr4CXr5OcMdudMYiBLWZgcIpSe3RV6gikhnI2p6ZhMzHk+vsHujeNf9ti3LqXGyV5pt90IJL5V27J65j5Hme7PkOcX+yLmXtwErEK1qmWJnS44yg4MfnyjGkpiF7TGXgOZSt7MRxDExK7lzunicy1OCJC9/ftA5hZXuUexE4kXwuJWGw8LAfQi2rdnzC6Dyx9sPd+Rdiz3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHyyc8m5Gi7KcCP+21R0FQhx652KQ4H7sD33uQhQBTY=;
 b=JyiGi2jM+znoY+fXqIOooeG4V7PuDCaKE77U4JoG3OrBRK2vmfx9uHDMDb2gHq8fIlhDYmAIQHq1nYjjTzwqSrvKsh+UgMliV4A6YTUOFgaoV0xlII+hLEzRvXm918ErKxDG6AC8JXkWZjYns31q8VGxB8WWOwpkInZVeeZ5UCCvJvCaXOimXry3EjeeM1MCEyjNw4X3Kwe181t8tBZS1Wau3mLoO6OXWiu2YcRsxirEuq4Aj9yzRZBFdOPtqPiCJXgosiwAjBFpUB9ofSU5K7KWV1N1FEOj5sUQUpZeKXjJAbrW5jZYDqnQbkhL2GL/93cBPVchdPt7wkAzQ1omHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHyyc8m5Gi7KcCP+21R0FQhx652KQ4H7sD33uQhQBTY=;
 b=ZCkkulma0scCxPiABb3bV1AKU61JV9G9c5KSjUTa9qjB+vEDvrQbiuUp6Ud9INfylWa+JemDsAZTnuOwhaKFdeGe87XfMxf9S/uwDXnfbvx2n0koDDXqyXUEikFD9Pt837QDTVAiUPVkxcjqg7TcykzKd8Oi5wow5lzc5v1vz7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Fri, 10 Feb 2023 18:58:04 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8%9]) with mapi id 15.20.6064.034; Fri, 10 Feb 2023
 18:58:03 +0000
Message-ID: <bd57f10a-8a2a-fd1a-f11c-88e62dfbd050@amd.com>
Date:   Sat, 11 Feb 2023 00:27:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com
Cc:     Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
References: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
 <6fdcb077-1ef6-6bc5-5bbc-81daee988c23@amd.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <6fdcb077-1ef6-6bc5-5bbc-81daee988c23@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::11) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf09664-181d-45a5-9a70-08db0b98bcdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xDiPZVeSmQqNUSweigJ4tA1sqlJ71c40FcnbvMbpQzUa4XosoraXcfzCe70xGtMM6sURuhsC+9oZjfxf7L9/3jof+kmnt3s0msZrQRElSaQzkiJtJQzm876+ckBkQEb0k5jzjRYkFMfRUS8Q/zAtb0nH9KPF269LE6G75Pp8t9lASERG8PLmiHkNvH6dql0TtCTcJdSIVKkXgWmCUYOaTIq0AOl53iUx5+s6et55t1WzwpOfG91Q+g7gpmB0ktHZUqF31P8X3szsVOFPoFn5jpBkjmHzZQQG2p3eQJBUJGnEcEQUTMPCSThYg5s7Ha3HzBkm5wJ6um4pTAXR2HK1V49fi4AtfIHiPOnRkSePn84krCWsv1XJY9HoDb2ozq31gn+bWYz/XV5n+vqm++EKE2UVngHnhvGBiyYcqO8WbtePlIs1Fff7Co1BefS2wn4kqEjryyqZyOIq0K1enQBY58Bj+S6WJxcry9Kew92xEzAGaQG5UejQ2r7FcIIQ1kiCRT2osb4NnbXq0ZDcEMLQE1gX4u9vO4MkBxw+rC1vt//NfJ+fRwKt6TALBrb4E/s43sdxscMLMmIn04c6jctnHfvIETfrZp+KB2xZKYoe2q/yAswylV8Ed+E38lmZjAJZcChpYa30fCAsp8KYKGD8rv/8yH5P9uG3/QejPWYcdQswjdiwEyc93OzSCJQ9W7K2bnQlKJW2vxe/mqJetTExsamT8tVDxS+cHFL96o2MDyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199018)(2616005)(8676002)(66556008)(66476007)(316002)(66946007)(41300700001)(6666004)(8936002)(5660300002)(4326008)(478600001)(53546011)(6506007)(6512007)(31696002)(26005)(6486002)(110136005)(186003)(83380400001)(36756003)(38100700002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTdheWtjMXVvaU5xd0dEVnF6R0lxb0JUWitaRmpNRERucHc3SnZpeWllUE5y?=
 =?utf-8?B?QW5pNkUxeFFkOU1GSTN1NzBBazJaZy9sR3JoZkI5VTc3WERldmtKQ1RaamRy?=
 =?utf-8?B?TVRVc3RMVk41YkNsZTVSd2JHSmJCeW5xa01tZEVkK3locVVnM0ZvNExRVTVa?=
 =?utf-8?B?U0NTbGVSRWxRNFA1UlFSMWZJRDZtY29aOHJiT085aDNWU3cyWVdZZFM3YlZv?=
 =?utf-8?B?WStNNmFpejFPZEIrc3R0WGs4TmsvakwvMi96cVVwVld0RXJHVXBWVGhnOVBS?=
 =?utf-8?B?c2FwK3pEdithWDFIdWtMMWg1QVVZdC9ieEV2a2Jka2pkWTdlUE1hYnVkLzdL?=
 =?utf-8?B?UzVIRkhwdDlvZXNPNitXMXBEbFlwa2xMUkNrdkI3ekp0UmZNR2ZnbE9aZWph?=
 =?utf-8?B?RFZqY09JMk9xQXZpUHY2Z3BWaG5Qa2pWZUFoRGFFMWxTbW1UK3phZEJURnV5?=
 =?utf-8?B?Mi9DTlVHaThCSlpaTEJjU2lhTk5HS1JZUTlmZkorRDRhNWZONG96a0xsTTFM?=
 =?utf-8?B?V0VFRlBtWkNmNVduZFl0SW5nM3Y1VDRXNHZERW1wenRWbEVzR2dHdnNIR1Y4?=
 =?utf-8?B?U1pwZzA3YzVuTHVoOUFia2xRWlMwaVZWNTRXVUd1ak1md01jY09wODBOOXJq?=
 =?utf-8?B?RVRJUlg4a3R3RHdMYnZuZEVzNmtJVW9uQU44U0Y4SVJwS2tSeitDZUtJS25S?=
 =?utf-8?B?WHhUR3Z3VHBxbU1mRHBSWGFPTlhyaXg3dlBlNE1rc0tvUkdaMXZzS1g5dlZl?=
 =?utf-8?B?S2lxYklLZXp3Z2tYVnQ2am90azdVQXBOYW1XeWp1U214WkxpbWtLYXdNOXE2?=
 =?utf-8?B?aElNSmgxQ3F5clRwdEVzNHMrZWJvUHk2ajV4RGdUWXlscktVTGhRaUlLR3lr?=
 =?utf-8?B?Nzc4aGZTTDB5MWZXdW8wRVp4d3RVTWRBQkgvSjhlU1p1QUlxQ2UrK00rVGVn?=
 =?utf-8?B?RGlocXdIY3MvNEw5cEphOStKY1VwUm9id2pZSCs3SldrdUhhUks4c2dWR2hj?=
 =?utf-8?B?YlJuM0JIQUNVcWVaRUtwUFlpQTJlV1duNXFMb3hDQ2pTZzAvdzBydTZ1VnpC?=
 =?utf-8?B?SEIyeXdzb2tKZ2VIWUQzV1dxL0E3T2hmN3o2bkYwZVNwMVZpcUtNaTRFRm5V?=
 =?utf-8?B?TUI2eXo1TGFGRWlYL2dxRzh1clZpeE40MW5EUkRYQ3hGU3Y2KzRkclRHMHlr?=
 =?utf-8?B?STJTSHlKRW1pTUlTd2YzZVlSKzM3UkQyM3I4NVIvY3QwbEpkSFBsNFluWitQ?=
 =?utf-8?B?TTE2ZmFtVUJ1SnFlZWsxL2pZRVVwTmdIeUVnN2pXT1dnRENUTzF1bk5xeDlq?=
 =?utf-8?B?MHRMRzAwMUdZUUtPS3U1N2Y1QmFHLzVMQmJaTzlYazFkaGc5Q3V6THNSSk9p?=
 =?utf-8?B?MmZhT0xOSS9TdUE1OHBHUXY2NjFEZDc5YTdQbVo0WE1ROFg0N2JQVEhLZkxK?=
 =?utf-8?B?OE50aUU2Y1UxU3l5L08xbkVNcldablNCUE5mMXVvSXAwODlWVkdYTVJTa2l6?=
 =?utf-8?B?M3FjelNHN05FUy9YVDVFM3haWnBpSS9yd1JFZFgrSUdiRzYxcmcvMXU0MUlt?=
 =?utf-8?B?YUk5c0lXdi9sYkNWdkRDK09KeGNGVmpyVk5odGxPb1BzWGp6c0EwYi85NE5Y?=
 =?utf-8?B?REVGeERuQ3JUSkdKL3lFaFQ0MUNpRU5ZYms4YnZQRTV0U2sySnY3VUFoMS84?=
 =?utf-8?B?L2JRMkJyaFFKaUdOUDNtNXoxcnpPSlFuRlo2WENrK1BtM1c3OVBHbEdlSUpQ?=
 =?utf-8?B?U0svdHVtSkdqMEE5MXJNOTcrRFNWYlVCZnhIaUNqdlZ6MHZSSzVyWU1XSkk5?=
 =?utf-8?B?cEpKQzhHY1JKSHlLMmdnRXlmNGVVY3FIek1RcExnUHFKc3YvbXU1UHM1bkFW?=
 =?utf-8?B?emVhY0VXYXNKWEZJSjVnQzFCS2NCRS9EOVNqc29XRjk1ZG84Q0NRbU5nZXdN?=
 =?utf-8?B?dTBFbXZWRjBWY3RJRkxhbk5ab0h5K3BUTXJzL1BoSnNyL3RNUGUxWWhHMFBp?=
 =?utf-8?B?aTlzVlJwRzV6WkVjTjI3WkRidWlSSDR3ZU91OG9pRXVRdUJ4U1hFMmFyNVZl?=
 =?utf-8?B?STNuTVJidFBjRktHR1NoOGIyd1FDMEFoR1BZamxKVlJwSGxUQzBUTjR1c0x1?=
 =?utf-8?Q?K07w1/6bxFX5APxsaCSR3Os45?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf09664-181d-45a5-9a70-08db0b98bcdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 18:58:03.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldq2YVdMnGX7I0IUUbkQMxggpjhfmv0Wgq2yNrl4WQ6Ht0VXS4LXdZaoRKMuPG/mkC71BuAe0W+iYUOYyTYWCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/10/2023 10:43 PM, Limonciello, Mario wrote:
> On 2/10/2023 09:34, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> AMD Yellow Carp and Pink Sardine don't support CLx state,
>> hence disabling it.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/thunderbolt/nhi.h    |  6 ++++++
>>   drivers/thunderbolt/quirks.c |  6 ++++++
>>   drivers/thunderbolt/tb.h     | 35 ++++++++++++++++++++++++++++++++---
>>   3 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
>> index b071802..3d8cfaf 100644
>> --- a/drivers/thunderbolt/nhi.h
>> +++ b/drivers/thunderbolt/nhi.h
>> @@ -87,6 +87,12 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>>   #define PCI_DEVICE_ID_INTEL_RPL_NHI0            0xa73e
>>   #define PCI_DEVICE_ID_INTEL_RPL_NHI1            0xa76d
>>   +/* PCI IDs for AMD USB4 controllers */
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0        0x162e
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1        0x162f
>> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0        0x1668
>> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1        0x1669
>> +
>>   #define PCI_CLASS_SERIAL_USB_USB4            0x0c0340
>>     #endif
>> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
>> index b5f2ec7..f38db02 100644
>> --- a/drivers/thunderbolt/quirks.c
>> +++ b/drivers/thunderbolt/quirks.c
>> @@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)
>>             q->hook(sw);
>>       }
>> +
>> +    /*
>> +     * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine
>> platforms.
>> +     */
>> +    if (tb_switch_is_yellow_carp(sw->tb->nhi) ||
>> tb_switch_is_pink_sardine(sw->tb->nhi))
>> +        sw->quirks |= QUIRK_NO_CLX;
> 
> Any particular reason not to use the 'q->hook' approach like the rest of
> the quirks do?
> 
Sure will make this change.
>>   }
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index f978697..d7988ad 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -23,6 +23,11 @@
>>   #define NVM_MAX_SIZE        SZ_512K
>>   #define NVM_DATA_DWORDS        16
>>   +/* Keep link controller awake during update */
>> +#define QUIRK_FORCE_POWER_LINK_CONTROLLER        BIT(0)
>> +/* Disable CLx if not supported */
>> +#define QUIRK_NO_CLX                    BIT(1)
>> +
>>   /**
>>    * struct tb_nvm - Structure holding NVM information
>>    * @dev: Owner of the NVM
>> @@ -905,6 +910,30 @@ static inline bool tb_switch_is_tiger_lake(const
>> struct tb_switch *sw)
>>       return false;
>>   }
>>   +static inline bool tb_switch_is_yellow_carp(const struct tb_nhi *nhi)
>> +{
>> +    if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
>> +        switch (nhi->pdev->device) {
>> +        case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0:
>> +        case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1:
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +static inline bool tb_switch_is_pink_sardine(const struct tb_nhi *nhi)
>> +{
>> +    if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
>> +        switch (nhi->pdev->device) {
>> +        case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0:
>> +        case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1:
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>>   /**
>>    * tb_switch_is_usb4() - Is the switch USB4 compliant
>>    * @sw: Switch to check
>> @@ -997,6 +1026,9 @@ static inline bool tb_switch_is_clx_enabled(const
>> struct tb_switch *sw,
>>    */
>>   static inline bool tb_switch_is_clx_supported(const struct tb_switch
>> *sw)
>>   {
>> +    if (sw->quirks & QUIRK_NO_CLX)
>> +        return false;
>> +
>>       return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
>>   }
>>   @@ -1254,9 +1286,6 @@ struct usb4_port *usb4_port_device_add(struct
>> tb_port *port);
>>   void usb4_port_device_remove(struct usb4_port *usb4);
>>   int usb4_port_device_resume(struct usb4_port *usb4);
>>   -/* Keep link controller awake during update */
>> -#define QUIRK_FORCE_POWER_LINK_CONTROLLER        BIT(0)
>> -
>>   void tb_check_quirks(struct tb_switch *sw);
>>     #ifdef CONFIG_ACPI
>>
> 
