Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CBC52EABD
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 13:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348484AbiETLZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 07:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbiETLZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 07:25:19 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8131FB82ED
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 04:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7Hn51x+KzWkSO2oS3mq7a59+QpvEAPR+et0DOquGwGI+amB1Ui9WCK8fk0poM3kJx7AvyS30V193Eq6WBrD/acnAquaASdb7mg/zz8hHLCGx5qX9mRmBoQ3r9V1l6ZMJ78aHlw4ET7xpzD9xh8OYLdr1pRUZ3PfhQuvPMAGqjVP+K+45hVWnZu9xKKS7lue/outNWqfDeWV47hrOwjj1DyGWsiPnWVvxSZHBl6N7o6h4vF1oSfsa6LlsxefZZ52ZthhzyTo+lPjG2V3+B/aOqn2+j2WPqWsaGkZXKMFr2wDAubBIXestuMUzRj6A5DcDPnkZ0YJMO4i/7K/A5NlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWISMNCBzkBwhx1oSGbh7EVqCVRdO/rLpLntSPBgUbE=;
 b=i+NBbwftcn5p9hNMOwTFOBZE7s4Bk/8yRsSc72riofERFSRjagN2d5EvBCUfV8nYTyQ+S3K+AxVu7iAMoVDHoo1BFxAeermW96fdVqAcV5Thm+b8cgSfjzi1cro37bEERZwhoSCq9zZfS12vWr1R65nnjP7tfYqn3k6vAJRqZChtm2DPvqpRRz58fm6VCBSxa/NZcOgoIIjSiEmoMGmbOmFozfFzPKgiQnq0Mn2+XiVGIk/Qi6b/0/GDQESbkbLpBzrVZ1CinJ8dPIr9GNpf4Zju7VgdkVkcTMMnY/k0iCzA3SnStmJr9dhb7QOZiU4Av+pkfq4HAs6myQb4fM+92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWISMNCBzkBwhx1oSGbh7EVqCVRdO/rLpLntSPBgUbE=;
 b=gWCx5B3caAFVdU3J65kjb+w/MDzb0br4GDzdEKm0alAPlBsmDR1NNfh2/ui4Q5IGEP6H6RzdXFZgvi/CkEVbdSrRXzMFfRAKuYA0lWwbwoa4OVrrLbuaUidb8LNK97DGP7wjRne+nc59Gd2uIGUChSBqzAxv9mPhD+jPHGzLXQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 11:25:15 +0000
Received: from MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::b089:97d5:82b2:9ae9]) by MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::b089:97d5:82b2:9ae9%3]) with mapi id 15.20.5273.016; Fri, 20 May 2022
 11:25:15 +0000
Message-ID: <ec0e678c-98e0-0492-dfd3-b0565ac68cdb@amd.com>
Date:   Fri, 20 May 2022 16:55:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
References: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
 <20220510052437.3212186-3-Sanket.Goswami@amd.com>
 <Ynts6+QeiWT7tL3I@kuha.fi.intel.com> <YntugjJfM2FiYNgQ@kuha.fi.intel.com>
 <9dee017e-eedf-4bbd-7c60-33587b1b523f@amd.com>
 <Yn4sJER+AXFru92X@kuha.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
In-Reply-To: <Yn4sJER+AXFru92X@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::18) To MN0PR12MB6102.namprd12.prod.outlook.com
 (2603:10b6:208:3ca::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d66899-c927-4a61-cf62-08da3a536924
X-MS-TrafficTypeDiagnostic: CY5PR12MB6204:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6204D6AC6984679C152929929CD39@CY5PR12MB6204.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlUsOby3l2z5ue+Yk94Wlf1FMwWp5dqxQeSh8E51PzfcL+FLDVefqMS0Rv5wAdIxFLSkApTGSh5X6GLflfDEOas++96ZxdKcFMuokOakaW5lZEY7Q8f91vfZ/avk8pgwbiqnDJc7sgExEuS7Zluxy2gZF27flkd1Ot2cR57l7u9LZ/1X8T6nFWzM0ub1G2j4hj/4AQz5zn4fOMV7/SB4kxucTPNhuHuzDGbRvkOZMHz86ovMA8YDVlQ/aXeTo86D2FJrbsoeHuIeeI1p5yJN6E1VMd86w98AfmiQaWCCBo3weo8abEozyc2l3j6ruuVRs+nJ4qYteOsDhKsNWM4xF+YSV5dTxYi79OHYqKJNr4gsOa8lQXOduAjQOL0eTflJEf7JyYf7m1f/PPtYQK/L8EAFGnHsxWLxS0KXedLcB5/IjojabilvZA8H0bjByS9KOwm5DF4pRIcXUDfExxnxE0/vifEJDbsK41RuqQttct7k4w5yGnGLgSXT5nQ8WWuhFH7QmUYSxsX31TWf50vXCJ9EgUcHKfV7eXKVTmMMPiU6See6KlayG6F1DsH6/bPgA9goSK+5GDetfPfowK7AW2LRkK6r2QPzRpaQ2RnpJ6Z9ec4kmzv0jlS3r0orA7HFLg9D580EPFXJqhFTK7/MllIPiq4NZ+0Kz3FXHs2ugTIz1CiUmY7GKT+Rtq2YnRYmNarLqne0BGzljz8O8gvdedpV4Vu6JQE46iXw46wrgJ2glo/KJS7luST9NhM4wQWX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6102.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(8936002)(6486002)(6512007)(26005)(83380400001)(186003)(2616005)(86362001)(6506007)(316002)(6666004)(2906002)(8676002)(4326008)(31696002)(53546011)(66946007)(66556008)(66476007)(31686004)(36756003)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVvV1d6enFpSjFUUlBhQldYek1ibk5kc2xBdW42ai9yTCtPTzdKbVVCRTlt?=
 =?utf-8?B?QWE4bzVvN1ZNQ0RjL0JCamJwcTBOVXhGRkZLbml4ek11UHpZN0dSM3ZRc2Jo?=
 =?utf-8?B?VEw4ZExjdnhkWnBUS0YrN1F4STZld1I5WDdxeG5FeHFIbmIvTFlrcGpsRTBV?=
 =?utf-8?B?cFgwOGpYMW92eWNETHR1TFJRWFp5ajhONldocW96cGdDWG1jOGRXZ1A3eDcr?=
 =?utf-8?B?M2lXUWgvTjd5S3FTY25hRGN4OFpabTIwaHFTd1cwVldsbktXeW5SNFlQVHRI?=
 =?utf-8?B?c3pkMCtjdDVHNUtVS1ZnMEMwbU1kMFdaMlRzS012V2ZUd2V2TExYbkdzMzVo?=
 =?utf-8?B?TVpZK2VZWk9YQUc5V2dKYzMrTXh6dzlJVndTSUZvZGQxQTdwUXZtS3laV2p6?=
 =?utf-8?B?c0lza05yNFk1S0JLYWxnWDJHSVc5M3BFeHhpcjZ4Wm05eFdtOURQRkJRUi9B?=
 =?utf-8?B?Mk04VUR3OWIvcGtPWUplWG1iUXRNR3U0NjB5czM2ZHd3SXhldDZhWHhlODlR?=
 =?utf-8?B?NGNGWFJ2aFdKdXlkYTBLaG16d1dGMDVSaGsyeklmZDYyTUU3UkVoMjVLckFM?=
 =?utf-8?B?dUNVd2V4SVE3NUoyZU51M3NRNWxHZVpnbjB5VmxtSFU5QVhmcnY3dm1tUHRK?=
 =?utf-8?B?ckoyQWVkV0REVDdITWN6MnM4NkExSWRHODhYZmc5cGIrMlBoZ0tURHZHNVFH?=
 =?utf-8?B?ZFBxb01KRWhYamJNOEVCSTFINldBWnlVQnRqMWVsK2VpY1M0aVo0T2d0bCtY?=
 =?utf-8?B?bDNvTGNLeXkwaW5ZVGRwL3pUSzk1VFNTRFhib01Cd0FRc2ljbUNYVUV2Y0dR?=
 =?utf-8?B?S0phMXYvYVl5aGVVMTdFdisxZUFpYmxQaWlJYm9hU1RPdisvL0xBdTY4dUlY?=
 =?utf-8?B?ZnduU1hJR3U4T3VSSEVPR1Z0NGswY0NycDZkWDM2V29McWNsR2llTmk4MHFi?=
 =?utf-8?B?Qmcwc0xzM0g1SEFjUzBnUWJIODhNMUNXb2EwYXBBZDlkQlZ6SGcvWmhkbHRN?=
 =?utf-8?B?WXRTTlNKNDNXN0o2cWs3ekk3aFRHYXJ6RGI1eDJzWmwzRWYyRkk3dDZwUGNB?=
 =?utf-8?B?TEsxQVRlaE5rVFhlNWVWYW9Cdkw1MzRrS0ROeE9BbkhzeHNIenVGNXIwVEpP?=
 =?utf-8?B?Y2xjQndqczczOUJpWmdnOXdYandGcUdUUEdjblNJWVJZcG5BVGRDSU9XcGxF?=
 =?utf-8?B?bXFvNllHMlI0T3g5WWxvKzYxVWNiZzZoeFNPSWplNU1UaWtTL2UraFhCTitJ?=
 =?utf-8?B?VndXTGRTL0puMFc1UzhDOVBnQTNDOXdnY0dvckdmOVIxdXNJd242dEhLb2NV?=
 =?utf-8?B?OHZybERudVZiS0lCSTZ6em55ZUFlcFdUZmJMRTdZMzVsT3ZiSUtwVWJSdHRX?=
 =?utf-8?B?R3J4alpSUm5odWZKMS9oNEFsdTdPbkF0YkJZYjN5UTBibVZJN25jbDd1U0hW?=
 =?utf-8?B?QlRKZFpxYjJlaU5DU2ZMeXJxcUhJbUdlaU51RXFNYVZiaUxzeDBTd2huQkUy?=
 =?utf-8?B?V3NYemt4WTdXUnp2UkpYYmFvMWZmZDZlUFNYaXNNTURMdmNMZDNTdTVyeWtZ?=
 =?utf-8?B?RUNHaWQ1aHhmajVlOVJMSGliVmJWMVBBdm5uMjQzTzZ1a2M5Z1BFd20vWmlO?=
 =?utf-8?B?VFcyQ24yalY4RWcyWFBxR3Q1YnV6V3YwaGNTckZuS1o3ckdtMjZqSGhCNUM0?=
 =?utf-8?B?WHdXd2hiOHNmQ1I5VFZnWjBBZUpCMFFIK0Z6b0dnTlF5SmhRY3BpUy82Qkoy?=
 =?utf-8?B?em4vaCt2amZPRW15Yk1JR1RYNXBYNG4vcy9saTRPZDdPQ0VaL0ZOOFRjeVRv?=
 =?utf-8?B?ejI4K2NMMC8vNjBNc1RTbzVYZXVheHQyVDVXY3lsa3FhbjBOU1B0WDVrbUFJ?=
 =?utf-8?B?WE1WcUxFM3M0VFNmTHBFa2NZV3N0b0U5d2kxanBTQ0lWMHQwU29iMmx6aklZ?=
 =?utf-8?B?QVl2dHUrSEkwT21YdWxwMTlkL0srWXRLdTVuRmlpMW9BSi9oUFFyakhaWDlS?=
 =?utf-8?B?VWlrRFUyOFo3Y08rWFd1Z0FySjM1dys2NGdyKzN6SW5rZkRVMDRGY2o2Uy91?=
 =?utf-8?B?NVk4THlFc2V5MTI2Zk8ydno2ZExmM3hOd3Yzd0NIRDZLK2I1a0FMTmJlRDR3?=
 =?utf-8?B?T3dkK3o1MDdvMHVncGJmZ05aNzRyc1ZlOGRCd0ZCLzBRbVJ3RTBnUi8wcjBk?=
 =?utf-8?B?R3lSaTNiZlU1cFFXK0liYlBWUGlPbEVBeElBSk5XdVVXVXhKcndwL2w5eG9B?=
 =?utf-8?B?QnFiZGxJbDJHVlk2Z3ZpN2x6MHRyT1VQeDZKYVFCY2x4R2JWOE0xRnpDL1ha?=
 =?utf-8?B?L21DTlZvcDVlU3RCOENQN044anJkNHE2S1JHdHY3bUFMOUwvekRRQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d66899-c927-4a61-cf62-08da3a536924
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6102.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:25:15.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNOZd4GPYwIi0Wv40KLKypS7cCNMeS/pF3MLhp1UYwWtVR/uGzteqwudtoJYiSc4+dq/CvhyRZpm9x8PEdDiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 13-May-22 15:30, Heikki Krogerus wrote:
> On Thu, May 12, 2022 at 10:53:25PM +0530, Goswami, Sanket wrote:
>> Hi Heikki,
>>
>> On 11-May-22 13:36, Heikki Krogerus wrote:
>>> On Wed, May 11, 2022 at 10:59:42AM +0300, Heikki Krogerus wrote:
>>>> On Tue, May 10, 2022 at 10:54:37AM +0530, Sanket Goswami wrote:
>>>>> The current implementation supports only Level trigger with ACTIVE HIGH.
>>>>> Some of the AMD platforms have different PD firmware implementation which
>>>>> needs different polarity. This patch checks the polarity and type based
>>>>> on the device properties set and registers the interrupt handler
>>>>> accordingly.
>>>>>
>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>> ---
>>>>>  drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
>>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>>> index 7585599bacfd..0db935bd8473 100644
>>>>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>>> @@ -20,6 +20,7 @@
>>>>>  
>>>>>  #include <asm/unaligned.h>
>>>>>  #include "ucsi.h"
>>>>> +#define INTR_POL_TYPE	BIT(0)
>>>>>  
>>>>>  enum enum_fw_mode {
>>>>>  	BOOT,   /* bootloader */
>>>>> @@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>>>>>  	struct device *dev = &client->dev;
>>>>>  	struct ucsi_ccg *uc;
>>>>>  	int status;
>>>>> +	/* Keep the IRQ type and polarity default as Level trigger Active High */
>>>>> +	int irqtype = IRQF_TRIGGER_HIGH;
>>>>>  
>>>>>  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>>>>>  	if (!uc)
>>>>> @@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>>>>>  
>>>>>  	ucsi_set_drvdata(uc->ucsi, uc);
>>>>>  
>>>>> +	status = (uintptr_t)device_get_match_data(dev);
>>>>> +	if (status & INTR_POL_TYPE)
>>>>> +		irqtype = IRQF_TRIGGER_FALLING;
>>>>> +
>>>>>  	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
>>>>> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>>>>> +				      IRQF_ONESHOT | irqtype,
>>>>>  				      dev_name(dev), uc);
>>>>
>>>> Please note that you would need to update ccg_restart() as well, but
>>>> there is something else wrong here...
>>>>
>>>>>  	if (status < 0) {
>>>>>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
>>>>> @@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
>>>>>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
>>>>>  
>>>>>  static const struct acpi_device_id amd_i2c_ucsi_match[] = {
>>>>> -	{"AMDI0042"},
>>>>> +	{"AMDI0042", INTR_POL_TYPE},
>>>>>  	{}
>>>>>  };
>>>>
>>>> This should not be necessary. That information comes from the ACPI
>>>> tables.
>>>>
>>>> I don't think that you need to set the polarity/level flags at all in
>>>> case of ACPI. I'll double check that, but if that is the case, then you
>>>> need to make the case where the device is not ACPI enumerated the
>>>> special case instead.
>>>
>>> Actually, can you just test if this works for you:
>>>
>>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> index 6db7c8ddd51cd..f13c10e815d7d 100644
>>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> @@ -1251,8 +1251,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
>>>         }
>>>  
>>>         status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
>>> -                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>>> -                                     dev_name(dev), uc);
>>> +                                     IRQF_ONESHOT, dev_name(dev), uc);
>>
>> For AMD platforms, this change is not require as we are not doing firmware
>> download using driver.
> 
> It really does not matter if your platform does not require this -
> other platforms still need it.
> 
> Add a function where you handle the irq request, for example
> ccg_request_irq(), and then just call that function in both places.

Apologize for delay, I will re-spin the v2 based on this changes shortly.

Thanks,
Sanket
