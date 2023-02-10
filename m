Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF8E6925E4
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 19:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbjBJS6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 13:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbjBJS6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 13:58:42 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BAD7BFD3
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 10:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCoeQcCqeJd2Ed0eGFc3fxznoaipqIqSWfY1HW7bnIrhPV454rCXIIPy30zKYYypF/rez1nJ2cwJaRZ075YPUmLBdynDxr7Kashe3dPm7JDxwQv3dTGzrRodhF34fQYFa8iTjXePKM2oVX4Ecrn1Z/2DxzYQwF99izJWOiItcO7S7+xU1lFcuya/RtukpTWNUq3GWaRqRD0gUCmwHRkRyhglfii8X1Dy8Tz+CoOBg6aXwQO3kTjES9SzfeiF9bZ/A9366Xykmt3gAouDA+TFOhAyCwQO/ALlb/2c/KKCY9I10DPDPnMWXveuT+XBgv3xl81q3z4Ukj//XuerdT/8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtWvJvoPJHWgxC62K1g4/Ncd95tKp8rHYKDW8YDSHa0=;
 b=L5GSqRlJcgoiNhrwWuFjiY/F9IzwNI2sWNsIhXDpoaiGlIvIenoy5QT4IqGqszwCcEZs+Vv5zKw0OfD5q+/bruJiCmOqWkvZa/Ij08OlZSk878f3WU/7rPfXNnIMJ3oTvWQ8ATCq06oPvgtiCXrR806lTh5EYbQUbZ5RNRZ0/c8OwKpMBdZuJgUWp6i6VzYwR/fre78qha/fRXFC3TBeM5dYyjQ0iBitNWQjcNvPJbhZlzYc3R2Ao7jyKz59B6FzeaXW29D16cDRIqjX7ClRgWV5odph4P6XnEmnzKdXNqzDoMRZS2yy9DndWOzEaaF+EnQRqKnZ5vLRH/MQB+k6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtWvJvoPJHWgxC62K1g4/Ncd95tKp8rHYKDW8YDSHa0=;
 b=J1H7dOcTVQTeWP8VMtE9rxQwDcbPjU+72CL0EJ3IHuR0YqI/CiQpLLe02lcJR4UCQlv/7RrbAz5UYBHJdQA2MTLbUPaZp1ctuBcVayNzZGvZTcUk/n6u2i9iuy/eQHs1ONp+yTBC2yd4A33HnK0FMzF6T5j+hk+ge3IZhczZ+1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 18:58:37 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8%9]) with mapi id 15.20.6064.034; Fri, 10 Feb 2023
 18:58:37 +0000
Message-ID: <109382e6-210b-1612-2e16-0a2b8ce211be@amd.com>
Date:   Sat, 11 Feb 2023 00:28:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+Z72ytOTag5b9mX@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Y+Z72ytOTag5b9mX@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::30) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: c27331d9-02d0-4833-07b4-08db0b98d0c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hw8TJYrsXneJkNhkjSvuZcUgInBoXgZLjXZRBN7wxT2UW4itNe5sXVk8Rp+xAwtDtbvxvpSaACxKmeB5DIyuRUXVeSZHup/ManQxIwKBXDLZs7DityU+Yjj2eJcStdVd+wA5EMLekuL2y5EZsVszDrl5P2UiRoQaMrVU7eWuNUH5YygsBibXEtwWArPBNZ9Gf0Nq/e1VbdWXFffGo73W//9Gg1JdMPnwIho165/blpMRj0QVuZWKFHg502EuGhjhwR/1zbjBozqkl9Fp9/8tfeY+uDLM/JI+WxyvGO00dt1bFL/BurBzUeRsXuK0sbaqOUHaqQFqm9OLFu0kzy9DTfqpYYEVQa8E/GAd7elepgGfh5Tm7p39QZF3JxGcLvxIOJYvpb10pdBn3IBy8HhsCSwK1o1r2YZvo7ZGsi7xEfvFmIZwxZCuvN4eruveRHQr/975plqyqE2ELjHGupB4avxr4Emrw69dQlPogePZTDjnkvOCtA59gnB/ZPcIcXkgitSlnzPoQ6zPRDmmA72HFMygqrWzSKTXe44b13Tj3ncAJ7S8kWP+pigWRVsNWxocQLltmj2kD97FLffkq3lF2o/fZA53eFYvHxRgkBomG0g8TX+0OIgPg2WWgS6itWBDcXJtjkaL5q5XmD9Ozm2o/YamVdJbIQIgieXlLqxg2rrTUSJvEB6uMe8PiRSmNu9txPpThrK9lEVFXZ08HHaYkOSHg8CrEDQH7Erbt7UOqTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(36756003)(5660300002)(2906002)(83380400001)(66476007)(6512007)(6486002)(110136005)(2616005)(4326008)(8676002)(38100700002)(66946007)(6636002)(8936002)(6666004)(66556008)(186003)(6506007)(41300700001)(478600001)(26005)(31696002)(316002)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRlL20wSWZHZU14Z1hXWFhYUnJFOGFyZHVtaTk4dkhSYjN5aTVXa0NEWXJ5?=
 =?utf-8?B?Yk1jUWpZRUErNmg0MTlXM2RCcXJhRWJLbjdqVnVaY3ZNNjE4M3lhYzI2WHN5?=
 =?utf-8?B?MXZIb3JaTHRsQ1dtZCtKcUk1YzN2Z3ArTVdQMEVMZlJzRWR6QytoK3BLMHZX?=
 =?utf-8?B?RnJFNlVWeUwxL3doVzV4Mi9VOXMxKzdKeHhQQkN3c0FlNDN4dmExeW9oR05k?=
 =?utf-8?B?aXU4MFRyRVJzZUNwMExtVGl4QVRFTmQ1allvK3pzT1F3R1orUWE5T3pOZ0I5?=
 =?utf-8?B?UlBqZnlIc3Y1NG42aWgyZGQrNm1uemJnMUJiRXUrT0swRzJKTWJ4Q2FHSlRC?=
 =?utf-8?B?Tm5BTXRmcnRZaXRiUXduMy9XWlZHNkd3K1BSZnR0WlI2QUk3bG5hMEVBb2Q2?=
 =?utf-8?B?TE5hTC9leUlQaTlCWENQdEgzSGVJa0NLSXErWjAzVDRVWG13dDZSdnN1bmZ4?=
 =?utf-8?B?TWhqb3RzVmtPVmV6ZmtId09UN0l2THlJTEEraGF1OUtYdXFwK05UMHhLQ0Nw?=
 =?utf-8?B?dmNBRW5rMytoUmJaeVVvaDBPZG1RVTVnUVEzMHBGWjM4K1FIQ09zZUx0UkVq?=
 =?utf-8?B?d1FHVXUzckt3LzBjcUljRGd0NUlDei9WaUdreUZHRFllM0lSdDNiQVY4Z1Qx?=
 =?utf-8?B?VHJPZ2pNZkgxQ3pONS90VnFhY1JtMkRvVzhDaUhhSWk5RERtRkdnTytrWG04?=
 =?utf-8?B?Vmk5dkJRNUc5eGRoQWpCSGlmRE5MWUNadHkyaXh0VnZWZjYxM1ZYTGtnVTll?=
 =?utf-8?B?QWk3YTd5Z0N6T21lL3J2UUtLZlVkS0ZPT2piczRxdWp0RXR4R29VMTlPWTJO?=
 =?utf-8?B?cWQrcSt1WURiV0l0VTdRdXBEZncreVJ4UTRKdGJWV1Q3UWwwTW43ak5GSFl0?=
 =?utf-8?B?YVNXOGdTOStBVm5HMXFzblJwMnVjTlBVem41QlJqSFZSWG9kRDUxWXVHUGxS?=
 =?utf-8?B?a3F1NzYxMWlLNmVxOFM0dU04alJFbVUzKy9TV3EvaFFFb05mR0VFRkpBaVd2?=
 =?utf-8?B?Q3dnMVY0b2NJVzdLS0JHRWp6TzI4b0x1UWFKUVNvcFlObXR5Y0ZicGxhNDdo?=
 =?utf-8?B?YlNFa2g4MXpaU0tjL05CVW1PY0NrM1BtZlJiQ0x3dmRjL05TZ2RCM2ZUbEtp?=
 =?utf-8?B?bFFjV3F4c2ZBSUp5ZW5RT0NETVRMcU03ZmNLZ0ZFajJsNzF4Mkg1N3RYdC9I?=
 =?utf-8?B?QTVXajdKejY1akJ3Y3AxNm1rdURtaHg2WW9hTURwdmF6c0kyK0tKRzNpR0Vq?=
 =?utf-8?B?RURqaVZ2aExRakp3Zzh6OERTd2RrMGRoQ1M5ZnVzQlRjaE1wOUx0cFNWekpV?=
 =?utf-8?B?dDIxdzNtek95cFVFbDJhTGxzRlVpNTRYSFBQV2J6NHBYRWREU3JNUWZNVEw3?=
 =?utf-8?B?MXdZVlZxVmt1QmoxS0NJUGxWdlRDamJHdi92SGsrZ3NmaFFzNVE5amttWWVj?=
 =?utf-8?B?UVFGdEtFT0wyUmhSei9SVUQ4VXMvVnI1OS84M1JTRDIyOXJWR1JXMGtwNWcz?=
 =?utf-8?B?OGhOeHpob3ZIVHVpRUNCcGN3TTJHMldSeFVMb1BNNmZQNUVPSU5meWNxTnZh?=
 =?utf-8?B?akl3RTBFS3p3aTBXMVcyNFVRVjk5ZkgyRTI4TkhPQ2hCRSthaGFidTRDeFE4?=
 =?utf-8?B?ZFlTWFhUTENGTUlTdHhMbzdhR3daYUlkTEZiRlZSWm9uZnltRkdueXNhU1JG?=
 =?utf-8?B?bzBlRENRWmtrZVhUOVhUTko4OE0ydDVkc3NnbkhRWFo2WXlvZ0dwWW9ZMzYw?=
 =?utf-8?B?TGNlSXJwTTN0c3VqN3FOZGhIcmcvSVVQb2x4aW5Xa2hjZWlaNEh5OUZIYnh1?=
 =?utf-8?B?VkN0ZXpDems4eGludU1CMVB3by9WZTFaeitNZFZqV0VQOS9TaDFOMWlYV1JZ?=
 =?utf-8?B?NHhVZmFMeWFJeVljQUlsb3p0UDFNcGs2cGFBblVOUFJVYktsbUFUQmxwV2Ni?=
 =?utf-8?B?SEVVQTRxWi8zRmVqYUF4OUtlTWZTUlduaXlBTUU3TTR1OVJhcFE4QW0zMlJQ?=
 =?utf-8?B?RUF4UlgwWk5wVEVPK00xN3plb0ZvVVdMQlllcG5xZW1HcmgyOVo1WkJjWnZR?=
 =?utf-8?B?bjJNbWlsQzNIVUFVVGEycmF6MGJHYWFOTzVCaitVa1ZnblJPd0xIS1RkSGlk?=
 =?utf-8?Q?AvugQBDOxJQCDB5IIsu0+9rwc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27331d9-02d0-4833-07b4-08db0b98d0c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 18:58:37.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3+0KcWs6TDQckr/dvcd6bUJ4Xn1M0M/9y0eqdQIPiSUc2/VWIDOM8V1wAGx2qUPG41GanJtLdLK2CVhxZplPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/10/2023 10:46 PM, Mika Westerberg wrote:
> On Fri, Feb 10, 2023 at 09:34:47AM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> AMD Yellow Carp and Pink Sardine don't support CLx state,
>> hence disabling it.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>  drivers/thunderbolt/nhi.h    |  6 ++++++
>>  drivers/thunderbolt/quirks.c |  6 ++++++
>>  drivers/thunderbolt/tb.h     | 35 ++++++++++++++++++++++++++++++++---
>>  3 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
>> index b071802..3d8cfaf 100644
>> --- a/drivers/thunderbolt/nhi.h
>> +++ b/drivers/thunderbolt/nhi.h
>> @@ -87,6 +87,12 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>>  #define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
>>  #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
>>  
>> +/* PCI IDs for AMD USB4 controllers */
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0		0x162e
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1		0x162f
>> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0		0x1668
>> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1		0x1669
>> +
>>  #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
>>  
>>  #endif
>> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
>> index b5f2ec7..f38db02 100644
>> --- a/drivers/thunderbolt/quirks.c
>> +++ b/drivers/thunderbolt/quirks.c
>> @@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)
>>  
>>  		q->hook(sw);
>>  	}
>> +
>> +	/*
>> +	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
>> +	 */
>> +	if (tb_switch_is_yellow_carp(sw->tb->nhi) || tb_switch_is_pink_sardine(sw->tb->nhi))
> 
> Instead of these, please add them to the tb_quirks[] array.
> 

Sure will make this change.

>> +		sw->quirks |= QUIRK_NO_CLX;
>>  }
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index f978697..d7988ad 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -23,6 +23,11 @@
>>  #define NVM_MAX_SIZE		SZ_512K
>>  #define NVM_DATA_DWORDS		16
>>  
>> +/* Keep link controller awake during update */
>> +#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
>> +/* Disable CLx if not supported */
>> +#define QUIRK_NO_CLX					BIT(1)
>> +
>>  /**
>>   * struct tb_nvm - Structure holding NVM information
>>   * @dev: Owner of the NVM
>> @@ -905,6 +910,30 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
>>  	return false;
>>  }
>>  
>> +static inline bool tb_switch_is_yellow_carp(const struct tb_nhi *nhi)
>> +{
>> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
>> +		switch (nhi->pdev->device) {
>> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0:
>> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1:
>> +			return true;
>> +		}
>> +	}
>> +	return false;
>> +}
>> +
>> +static inline bool tb_switch_is_pink_sardine(const struct tb_nhi *nhi)
>> +{
>> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
>> +		switch (nhi->pdev->device) {
>> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0:
>> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1:
>> +			return true;
>> +		}
>> +	}
>> +	return false;
>> +}
>> +
>>  /**
>>   * tb_switch_is_usb4() - Is the switch USB4 compliant
>>   * @sw: Switch to check
>> @@ -997,6 +1026,9 @@ static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
>>   */
>>  static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
>>  {
>> +	if (sw->quirks & QUIRK_NO_CLX)
>> +		return false;
>> +
>>  	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
>>  }
>>  
>> @@ -1254,9 +1286,6 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>>  void usb4_port_device_remove(struct usb4_port *usb4);
>>  int usb4_port_device_resume(struct usb4_port *usb4);
>>  
>> -/* Keep link controller awake during update */
>> -#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
>> -
>>  void tb_check_quirks(struct tb_switch *sw);
>>  
>>  #ifdef CONFIG_ACPI
>> -- 
>> 2.7.4
