Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C46F6F18FC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 15:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjD1NLi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 09:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345945AbjD1NLd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 09:11:33 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D036F6195
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 06:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwOEI7UldJnpELIQCSpcESoSC+62mWs1HL3asVgnUTgWOiZP9Egb+uhi/LnAco/lqGkQMhhzbcBiywBeXa3tjf90zHg+Eps0Zc5cyTEHhM+4H035v4qv9J2PaBJt1rPvP1SCUkIr62Ms7rIeOQh/EgGFRDRBRpLgjqwslV0nte6oAeYB3f1GBmHpvxcAe6LyfbAkIPDjrKDYIeOY8mtXOW9AVC3U8yn9oCPiUqNh214jvG6mmejrQCnpYE6gy0wlqlxcUnoaij2OOZTv42NiLVjnETw6AyR44f/eWtlKwb+yPHNoBTv+/ruF1HLgCu1KrZzbb/gaS6E1lg9vEYP38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4PkoYhdp0Pc5EiDGUu9wndmMg8ixrocEtlcyjuvbzc=;
 b=f6/0KQSHC4I87uMsqQei094Oc1MBDW21Tb2bEvIcB5EsDBNk7sLgAX2FYpIqT4poNVbvnoPspTo3v/07TCqsxYk9+zRtncm2gJrpO1XHPKy+pND2bPoaDSwFM2YSzI/A5NJvq8pwx/2nQ+blL9+qq3meNqHKvVsCEgvWobcSJhq+mUazSC29rhZO654f+XE/3wj/mWDM5SgyvIpMpXUOQzF60MPOcOEdIse/TPcuN6dp8hEesUfD92bwB+2h+KNaozYZxNn8cePHMk8rwAcrsg/eDopDpWS4Ia6lrDHdiI4I8sbMQWZBl0Ab9q5G4IR5MXnJWHjfSYhpOnRv9+cS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4PkoYhdp0Pc5EiDGUu9wndmMg8ixrocEtlcyjuvbzc=;
 b=fRGdkiJpT67Ky2zHNtn8gM3NFnYCBGO2r9qvtTts+8rjB/lzoGiKbq/eIE4q9qiv6e2gEYLEZ6GswXJLWFoI+Rq+jQuN5uCaAVBjKTBCrLiODVyJJOVRsXpdInrXy1kJTUr0cpQt1U/IKtWS+cYy6wkMXTHvzIKgvdn0LHqwyiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Fri, 28 Apr
 2023 13:10:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%4]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 13:10:41 +0000
Message-ID: <f02f613c-5d21-82f9-abf6-89b1378c3545@amd.com>
Date:   Fri, 28 Apr 2023 18:40:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] USB: Extend pci resume function to handle PM
 events
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
 <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
 <f0cebcd5-1bad-7123-241c-bedbe49d0e93@linux.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <f0cebcd5-1bad-7123-241c-bedbe49d0e93@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c791ec3-7d1b-4af5-0331-08db47e9f777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImbW4/5sxcy7fZXNZCHdPW0+JEax3ceypf+n9tcY1A95VAHAwslWPzmWdyCjk1F26q1NnbRlkv0a/1xRr2OiFjsCIfricWx8CNodU0+qOO+Djm47q5cNfDwXMl1hDTQsL+cpuSAc7TiEex9rJgyfIx57rXYgTXU0af9c4volvm0J1+MZDIwe84ViqY5Yj9BdEblNUe9wWyeKxrSny/w8UpgrkZjbm9rpa9B5D+Tve4TYfuROlnTAOcwNaRXlHTZG2stHj4o2wvjiUvGkuJqry/5DGTAj0jw2y64t3GfxgeKU36caAAlMiMu3uz3A/ZK3ntEH51C4/stCdSBFZJyn9O239OC+7202dRCucWONQ/6IvicMzh8LdUwfYDZ/Xrh0iID/vebWqzAmArFAETlMmRVDhMEpZUQX23HzcbwxV2CpEoMiggv2e5geelKjIlLoW29T+cInCd4HeaVYanMmf4exHkor2FCEf+a7e/MOdPmaxodbBEs1mBiFAUYlsd2OmfRUJ3urIYCkgiDfZ5yhv/xP+MFmVMH+08Eb9te3fBD3zLPldoDpJQlDEZ17+Dajy6/b+xgQXy+YBpDI7d3MjTp2P7CtGTw3K/yEYgTqOr4TtuMltw3UOR+a8r0oM1JgKC7JAeBMl+Tb7gJO9ocXtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(110136005)(66946007)(478600001)(66556008)(66476007)(8936002)(316002)(8676002)(38100700002)(41300700001)(5660300002)(83380400001)(53546011)(2616005)(6486002)(6512007)(186003)(26005)(6666004)(6506007)(36756003)(31696002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHYvb3poVHNvdEpjbXRZZC93cjk5V1NUNWJrRHEwUGQzNy9RTHRXZkpFbkM2?=
 =?utf-8?B?bTRDY1haeTUxY00rclRxZmN4MkRJWUFHek9naG1tRElhaDhsSFFIMnRvTGdP?=
 =?utf-8?B?bC9kVUh2U3RmUEZyQklUSk84OXlReEM4UTZXNlhnNDNrKzlIRFZEZzBmZmIr?=
 =?utf-8?B?cGJYMGVNSm5UbGRZOVlYWlIzUVV1SE81d1Q0Y0R5RjUzQ2hyQ0RIa3poSFAx?=
 =?utf-8?B?NytZTldoeWJpV3lSSU11V2xHUDdvcll6cnBXK1crRmp6QmVBR3BvdXh0dTFX?=
 =?utf-8?B?b0tLa285ZUVBempkenVQaU5WWW92L1ArQVZDcVJZOHFTbk1neXRwdSs2bFZ4?=
 =?utf-8?B?c0JUQTk0TEQwZmRZVzRUcmlVMXA5TmFXQll1QldGVVdhMUxaWTRVR0pNb2M5?=
 =?utf-8?B?cEdCQ3VLUW5ROTNEbE9hbFJmOWZ6c3NXY0FlOUhXQkdYQStoWG1KVTFrMk04?=
 =?utf-8?B?SDVFNDNqMXp2OEJFWWdRa0hCam0vM2N6WDlzZ09sRExSVTJxTnBkcm16SXNi?=
 =?utf-8?B?QmZ5VjAvcUdBcTg1VHNSRFVlamRwTFJSN095b3lVREFLWmZKS0tXb29pNGVs?=
 =?utf-8?B?eC93bjhZaTM4SFdEbHhqY21vREFSK3hGcHlnYjIvKyt0aGxFbjRLNTJLeXZv?=
 =?utf-8?B?NFZjZ2tzQzlFakl0WjNGWk12clB6STNRVitHdGNPVXVDRTlJanZxUVJ4bnVM?=
 =?utf-8?B?ZEdOTlZtQ2dJZ0hVSjVVa1ZNVXB4TzAzS01hR3BFeWZaZWcvSy9GRU5xbThO?=
 =?utf-8?B?TDdwZC9obytFR0lFS1JtMEZ2ek1QbXNvbWc4ampZcDdqV1lFZzhHMUJETE9O?=
 =?utf-8?B?Zy91eUJKaU1IQ3Z3Njk3bExUNFRkQjlSMEhsQkFYdFZOM0QyTFNNdGYvcWgv?=
 =?utf-8?B?VU1qMFRhdml0VWo1ajhmRDRXNHBhcTZ0RWdNMnBSSjZkQW1ocTlBejdHS3VP?=
 =?utf-8?B?a1F5U2Z3MThDUk9zeWJiOXVTM0NxbjVzM2FNeHE0SlhSRG5pSXF2dFRvNTJM?=
 =?utf-8?B?enJpK2gxaXYvM013UEI2V2JrTU5ZVzVnbVVUUlBvSEx2bmlSK3kxaU55WGhs?=
 =?utf-8?B?WkYwek9GWFpsOXV1VjZSUm5JVnlEbUZEN1ZKQlRNTzV4eVVuMWVDZUNmMm1S?=
 =?utf-8?B?YlJ3ekdVR29CV3p2U2VhcGtKVEZ2M0g5anRXVGdncFBQZnZERU1EMEhCTUJ1?=
 =?utf-8?B?Ym54LzE1RkpqSzc0Z2NCbmZ4elptdkNIak1zbVRDeVBmalRIbTQzMWN2UUNj?=
 =?utf-8?B?M0hSNkZiL2thcXF1cHlYZ0dwNVBqeENMRWhnNFpSd1gwWG5uUG5yZml4T2JB?=
 =?utf-8?B?Nzhtb3NSRFBzL1VvaWlwUGEvTWRROWNGL3crWTFwZ011Q2hUNldLaldYb2Q4?=
 =?utf-8?B?Qy9aM0tDc3YxclJUQ1VSWXphakRUNGlVdWhhakhZREZ0MHhieENNUUsrTi9q?=
 =?utf-8?B?NXcvYTVFcFFkZy9WdFN5TUtjMWxkNEtsMG5pK2hUVlV1SldORDhoTVYxdFdl?=
 =?utf-8?B?c1lmZmhKMGI1ZmNid2tKSFBtWlIwcDkxUzNiLzNsdW1BOXUrQmtmSFoxbEVH?=
 =?utf-8?B?dHplUHRYblE1eFNhYzNJdDFwcWN0Z0F4K3VCZ2ZLUjZDaXlBZVA1Vm9qVzAy?=
 =?utf-8?B?cDJZUzhqQVlKdCtkN1NPMElxMXIzRm1CZndDSDhjOUJ2UlBvSnkrTmZ0djBL?=
 =?utf-8?B?RHR3a05QZFdSQllKU3F6V2dlMU0wdk0yOHlwWEE1cXhVNHpOc1N1UUt0Tzh1?=
 =?utf-8?B?UjNlakVyVHhyVnc2NFFIbzdtZjFLZjRoL0NXU3dhV3ROU2hSOHdMUS9WTzdC?=
 =?utf-8?B?bjdENGJINWkzbXUwUk13YnJjdlhBa1Y3MzhGelJhc2Y4cmViQVpqSE5iTFYv?=
 =?utf-8?B?SkJTZjJ6SEtNOGtMdGtybGlaNHlWUmNpdXcyeUFtN3A3KzR0UjlSOGJTZDJz?=
 =?utf-8?B?SUp3RnFwaHRBNWFhT2dtTXZkKzZoR3R2cHZHRGF1aWNqcVFEUkNWUUMzOFRz?=
 =?utf-8?B?R2svcDJMR0UxNFRQRDBDOTFCekFpdWpxZktqdXQ4M0grK3ZKeUVKb2RhdDhT?=
 =?utf-8?B?Vk1TMVU5QmdORk04TEVFU3h3QkFWQlFzYXZNMmpCd3g1TUlCb0s1UXpXeHZY?=
 =?utf-8?Q?efYKPqBAt/5Av0fbvOcG9o6nr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c791ec3-7d1b-4af5-0331-08db47e9f777
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 13:10:41.1849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Iz94m9HnY/mcJkxBBVHnsGNnMMCSLCzhiA5P7sKKLuX4+aqPRnBYNDmmejo8GuqqRnbpuYKST3bExsGBMRKTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/28/2023 5:45 PM, Mathias Nyman wrote:
> On 27.4.2023 20.42, Basavaraj Natikar wrote:
>> Currently, the pci_resume method has only a flag indicating whether the
>> system is resuming from hibernation. In order to handle all PM events
>> like
>> AUTO_RESUME (runtime resume from device in D3), RESUME (system resume
>> from
>> s2idle, S3 or S4 states) etc change the pci_resume method to handle
>> all PM
>> events.
>>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/usb/core/hcd-pci.c    | 24 +++++++++++++-----------
>>   drivers/usb/host/ehci-pci.c   |  3 ++-
>>   drivers/usb/host/ohci-pci.c   |  8 +++++++-
>>   drivers/usb/host/uhci-pci.c   |  7 ++++---
>>   drivers/usb/host/xhci-histb.c |  2 +-
>>   drivers/usb/host/xhci-pci.c   |  4 ++--
>>   drivers/usb/host/xhci-plat.c  |  4 ++--
>>   drivers/usb/host/xhci-tegra.c |  2 +-
>>   drivers/usb/host/xhci.c       |  3 ++-
>>   drivers/usb/host/xhci.h       |  2 +-
>>   include/linux/usb/hcd.h       |  2 +-
>>   11 files changed, 36 insertions(+), 25 deletions(-)
>>
>
> ...
>
>>   diff --git a/drivers/usb/host/xhci-plat.c
>> b/drivers/usb/host/xhci-plat.c
>> index b9f9625467d6..727e771d4d5f 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -465,7 +465,7 @@ static int __maybe_unused xhci_plat_resume(struct
>> device *dev)
>>       if (ret)
>>           return ret;
>>   -    ret = xhci_resume(xhci, 0);
>> +    ret = xhci_resume(xhci, PMSG_ON);
>
> Maybe PMSG_RESUME, not that it has any bigger impact.

Sure will change it to PMSG_RESUME

>
>>       if (ret)
>>           return ret;
>>   @@ -494,7 +494,7 @@ static int __maybe_unused
>> xhci_plat_runtime_resume(struct device *dev)
>>       struct usb_hcd  *hcd = dev_get_drvdata(dev);
>>       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>   -    return xhci_resume(xhci, 0);
>> +    return xhci_resume(xhci, PMSG_ON);
>
> This should be PMSG_AUTO_RESUME, otherwise we will skip the 120ms port
> event check that needs
> to be done for runtime resume cases
>
yes correct will change to PMSG_AUTO_RESUME

>>   }
>>     const struct dev_pm_ops xhci_plat_pm_ops = {
>> diff --git a/drivers/usb/host/xhci-tegra.c
>> b/drivers/usb/host/xhci-tegra.c
>> index a88c39e525c2..665f5c20f551 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -2275,7 +2275,7 @@ static int tegra_xusb_exit_elpg(struct
>> tegra_xusb *tegra, bool runtime)
>>       if (wakeup)
>>           tegra_xhci_disable_phy_sleepwalk(tegra);
>>   -    err = xhci_resume(xhci, 0);
>> +    err = xhci_resume(xhci, PMSG_ON);
>
> Same here,  runtime ? PMSG_AUTO_RESUME : PMSG_RESUME

yes will change accordingly.

Thanks,
--
Basavaraj


