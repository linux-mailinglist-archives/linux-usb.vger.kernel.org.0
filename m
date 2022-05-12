Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1B525380
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 19:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348108AbiELRXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 13:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347039AbiELRXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 13:23:38 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D75A6668D
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 10:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA3HslN2z/cJQUTaI234zOEZ1nLvJupEf/+oHbF3Phqeev/4Oy8YHemfWxcAubEIzBwCoTDC3jovkF8Nxx1+mb35F4ir150F9sidcp8qUdc99WKyxlqQ4S0lWaUt8hytWrg/6ii+17tkF4Ak4C4KAtF8YH7fCyf6KGgsmc/dvC6b5r4jVH9osCdz47sgSreO6k61khuD+2ThWFx+dEdFwm0+8puKbtblkSts8a0DxFYAdkU0x5dsHWomXyYKvzB84wzOd7fvmXwXrX/By79PPfgMhSwighD6Z9JLOVFgZgA50+6dCArjpPhLRBMZAk5gQ2CKpdLbIAULHUKCjCiNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGD4hUc+A7SsXhszPdvO82vLVwlLykQ2vy9eTTRFHKU=;
 b=nzI/nVnmqnH+TF9nGaXXnUR/G4BcIZiWK6P5FFh3ek43hST5zbsp3VPllcdF7F+3gvSowOeaRkV/yYw7hcZvVskidem6KV/FU/gyONKBukhteDTztTVkLS0dqoQNZM/myTTBEwGjcrbFs5h0BhestRcbDq1x9FZb17QyetDaW1tiwfa+LHDXFrVLiLVm4mlHU8ytr6KX8avwt64ujEu5f5RjDlWPtJqJtT8Gr7xDNnjK/c8+xrCmUeABjLZTUiE/ix8h++3zhrHxRjB0XYLP0Q6fJXMXEkUPMDeKbx8N1Z3LGAtrMoMltZ+i0POxZqYQ9tQkNmrp8aH7l/4OMlSG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGD4hUc+A7SsXhszPdvO82vLVwlLykQ2vy9eTTRFHKU=;
 b=XfGGoM2kY0xNvG+GhUQ6SreU0ZrQUvZRUDfHc98KG4iSPa2fBHBjcdoHa8OUlC11vQXo/Emd8PeL3fJTjDcO6bccWVZwyq0Toc9lwxZ8TZMUfc7GC7DGuzUEdS9Pzl5ZOdV/WMJu2NbDb3o0IynbOQc5LRwYdqiIfZ4esavjKvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 by BYAPR12MB3544.namprd12.prod.outlook.com (2603:10b6:a03:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Thu, 12 May
 2022 17:23:35 +0000
Received: from MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::b089:97d5:82b2:9ae9]) by MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::b089:97d5:82b2:9ae9%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 17:23:34 +0000
Message-ID: <9dee017e-eedf-4bbd-7c60-33587b1b523f@amd.com>
Date:   Thu, 12 May 2022 22:53:25 +0530
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
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
In-Reply-To: <YntugjJfM2FiYNgQ@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::29) To MN0PR12MB6102.namprd12.prod.outlook.com
 (2603:10b6:208:3ca::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600cc84c-4b58-48de-090d-08da343c24ba
X-MS-TrafficTypeDiagnostic: BYAPR12MB3544:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB35440A4B0047A619239F345F9CCB9@BYAPR12MB3544.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yR2rPYP0nnAsDqleVY0g/pzX4q1jbkycFFXtPS8xS6gKSz6geDnpFlsxJ95rrypMa+O6aiCdc9Fh6+wPB9OKJ4K3aEcbCenqFgKCDqyz+eAA8CVpH8lj5nVFoTmGarrdhir0mmx7V5BGs10hIp0+S3r56e3LfVXJjpzgVfhNEgVwKqgh7PnHZTOGdG1AIpDjoOZ23mtAScX55F5XWgqwUhkkge+iWl6AxlXLex72QqGSQdDraiE3jkF6J2g4O+tyXJY3MZwy3IDZfk2UiqVV+IwnQlx8WQONOokBnf3YFVtlw96Q/N+d+Zicv9hGkwonQltxl/0e+gzSer0KOnEAvjH69+eJ4nakEdHFe3tjUXO+LlCZiaCPYgI7jrEp9yLrok/yon+3f/gagjcvtHwoKO2iWZTSrSuIBHz/3pdQuAnptFTJ+q3O0jExGILf7ucJAIZI1nmPTWtOj31HrPGs3L3BuEovVY4JK/zdVFOVOvY7KSAp1L49DCDnHBfujAWMe2iQdASXbSwPhrVmNHA2yZDcfvcUahMMz1IoJHg2eqlQ+UDaJsZQc965DjFOwDncKweVIcCLT/pqUM/HnmXAEEp93ewqZtBiS50gJRWJXlLNmP6hjGsR30GSroTtWMiYAogd0Dsjp4fyJZH5Jizb7oepIGNfegbxXYYIjmXdV8qGu31ygGZxH3IN7EW/dA30jDI6236kPvz2cqQc8VGjh9ye1j0y63tWgOuilfxvPYCIZihubwsvYv1vSH2tAHCi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6102.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(2616005)(186003)(66476007)(53546011)(6486002)(4326008)(83380400001)(8676002)(36756003)(31686004)(38100700002)(2906002)(5660300002)(316002)(26005)(6916009)(8936002)(31696002)(6512007)(6666004)(6506007)(508600001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkltZGJhWnRpZldtNUppWmRjZm5YWlJ2UVFzaVh1Vys2ZjBWaGIxK29vcXBB?=
 =?utf-8?B?eWtYc05hM0pjTGMxNzQvZVAxY2VHSThmT1ZMbDl5ZkhGcmpabTJ2NmJCUTFN?=
 =?utf-8?B?d0lka3pYRS9mcXI4c0FYcVpBdTJlbTRWT2plREdkR0FvUndMZGRFaDAxYWNF?=
 =?utf-8?B?S0J1dlFWWXhEYXdadmNaMmFqUVdmNUJnOWVKelJuMWdkTmgzWmx5RlBiVVpZ?=
 =?utf-8?B?enpwakxPdWE5cnlUZGJMRllzQUo2VE1qT1I1ZXRST09WY25RSGNPb0tjYzY0?=
 =?utf-8?B?em9UTHY3ZTRVb2hPeDFVamZvVkxFNHFkaG0vc0tnT1BrcVBtdHRjampVMXBo?=
 =?utf-8?B?cUlSZ2pVZkFTTDBEMTB4c1haZ0xPZUg2YlFudWVpVDhBaVQ1a0dFVGYreTBs?=
 =?utf-8?B?S2RwVW9oSVIyZ0VQOVlzZCs0QXh1YTZyd215Z1ZxWEd3SXo1amcyRHZITVZi?=
 =?utf-8?B?b29pSzNrZEZybGJNejR3ajJDU2R0Y0k3Vmc5RzZHemJYL3p2cUpaOG5Ndkw5?=
 =?utf-8?B?Syt0L3BiZFhWd2c3Z2VxNmpUV3NCS2Jsd0VsMnJ2K0dXUkJLNmZRWnRpaGNm?=
 =?utf-8?B?NlJOWUltaDdKVm80elkwVDlxeGRFUEVVdzBBb004cGJ3Z0hmbm5GVTR4ZHJS?=
 =?utf-8?B?RWticXVNL2w2WmtVUmgwMUlPZUo0elBJM1c0RXZHdXhZOG1IU2NDVWpzbEg0?=
 =?utf-8?B?S0VPM0xleHQyQlVGSGlrQkFLSXlyWHYvNXJ2YmlhSHI5Y1RzNWlzQXZoTUZG?=
 =?utf-8?B?RGxQOWtpNit3cWVmRmNLekhsOWVhVWxiZXlyWjR0eUxHZTNUM0NIMW1OSDRn?=
 =?utf-8?B?ajBlR0lKWWVQV2JpZzA4Snh4ZnlTenRYdnZ3RmNwZnlBTUFTZ2kxdzh1cWx2?=
 =?utf-8?B?NmNpblh0YnUvVEpnc29sQlJEQnZ3Q2c1SlFxcTJaNkViYmdFSTBOcjRkZ1M3?=
 =?utf-8?B?ZzFqL3BCMXRWVjhRd1JHL2ZFMkw4VS8xZWI5bm1yZElLMXhuelJacHRkcEsr?=
 =?utf-8?B?ZnhqUGJiL1dER050NFUyVk0wa0VKUEl2UTBabEU2NnF1ZUE2ay8rRnQ0Rmhn?=
 =?utf-8?B?VmpEYnhWcVUwb1pxYnJPRjFIOWJwR1FvVDZZUzhCM1RPQ3hKZkJuQzRrRmU3?=
 =?utf-8?B?RUR6WDRnbytUclZMcUsybGV3NnhxcmdPaEdCWGptWnlDMUZoNS9KcjlZM2tt?=
 =?utf-8?B?WnNwSHZVRWRqUERaYlNZazQxZUJaU2xLNDRWZitDempOS3pkdzBDWHFOVnVq?=
 =?utf-8?B?UzhQcUhHTUdrSkcyNG1mbG5GZkxKV2pjVm5FMit1VGxoRDFmTWtlNEZpTzgw?=
 =?utf-8?B?UVBPZURvcnJqZ3kyMVUxYWZtK3llRkgzeHJxYitiVkJWbUh5QzQ5dFB6aVRC?=
 =?utf-8?B?SkRnaWZncHRnbWZUMmZjTFJoMnVHV2EyVXdDTEZZR0JQdWMvWENtMExYWHJq?=
 =?utf-8?B?Z3crVm1HeitrdUUvNjdiVHlRQ2VhdXJkVktuMDJKdCs3WnhkNUp5Ni9sSk1Y?=
 =?utf-8?B?VUlKYzlzM2YzMGZtdUh1TVhKZkxJdlkrVDk2U0tzdG1Gb0hTRHpVWWRER21r?=
 =?utf-8?B?emhrUFdqTnlWS2NCMU9JSjNpSExrN21VTkRNMWw3QXpwUEoxMFV1Rml4eFdj?=
 =?utf-8?B?NnFadjJhRnlpbUtiMzF1aU9WT0FkQWxTY09WUWpRWmw0Z2tTRm82Z2I1dnM1?=
 =?utf-8?B?cHMxQjNoaWp4KzBEM2ZiZGZDNTl3c0N5OXM5OGFYZzNHVUd3WFRFakJjdXph?=
 =?utf-8?B?MWpkeTkxUDVNdGtFSGIyWTZWSnVtd1ZJUEV4ZFZOeG1PYTVBUWcyYkxzRXQy?=
 =?utf-8?B?STZ1Mk5oS1pqenZNM1lidlZ4cnRKOURvV3U1MFc0RmdnenZhbzZKQm03bG52?=
 =?utf-8?B?ZU5ocUFXOXFMWnVPc1hpcWxuSVMzUVpNaTZWNWpOcTUvZU5kcjFNSnN1aEs3?=
 =?utf-8?B?U0crOWtuUUZiQXptWWdpUUQ2dHFTMUxiL3FncXNJb0lLR0VRVkp3SERtRWk5?=
 =?utf-8?B?NThDc2NYcGFmWmZUWTBIZG4rY1A0dmU2VUdVZElSNis4SHZ5cnZIT0N0YXJC?=
 =?utf-8?B?M2lCMjFFbUQ5UVcwZjFaMmtab3ptMGtnZDJCVU53UGdPNzRrV1V0TTAxWmdK?=
 =?utf-8?B?UzB0NFJnL2ZVTDB6bVFsekgxaXhGTVBkRHVaMnZTeFNSVk04dHRkRHRwYTJw?=
 =?utf-8?B?Vy9DZnJBajdDeERsOU5XbldrUmNaZWZFNkJYZVliYWpTUkRCSWhyUHFHdDdI?=
 =?utf-8?B?dHRndjNiVjFWUWRZekRZcUNyNTFud3IrTDhZTnh4NFVMeXZ1emtQc3VMNnJ5?=
 =?utf-8?B?K2d6RFN4cDd6RTVFdkFCd3RYU2lDL3FaRklMVFcyL2lJZ1Jhck1rZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600cc84c-4b58-48de-090d-08da343c24ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6102.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 17:23:34.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxbSnoTf829L9DTGvzFnJxI64TeyCDjn/8eSROxFcXXxBCBWh7EBGU+GyMY9xyehlKPKowJFfsyyoSHf7EUxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3544
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 11-May-22 13:36, Heikki Krogerus wrote:
> On Wed, May 11, 2022 at 10:59:42AM +0300, Heikki Krogerus wrote:
>> On Tue, May 10, 2022 at 10:54:37AM +0530, Sanket Goswami wrote:
>>> The current implementation supports only Level trigger with ACTIVE HIGH.
>>> Some of the AMD platforms have different PD firmware implementation which
>>> needs different polarity. This patch checks the polarity and type based
>>> on the device properties set and registers the interrupt handler
>>> accordingly.
>>>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> ---
>>>  drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> index 7585599bacfd..0db935bd8473 100644
>>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>> @@ -20,6 +20,7 @@
>>>  
>>>  #include <asm/unaligned.h>
>>>  #include "ucsi.h"
>>> +#define INTR_POL_TYPE	BIT(0)
>>>  
>>>  enum enum_fw_mode {
>>>  	BOOT,   /* bootloader */
>>> @@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>>>  	struct device *dev = &client->dev;
>>>  	struct ucsi_ccg *uc;
>>>  	int status;
>>> +	/* Keep the IRQ type and polarity default as Level trigger Active High */
>>> +	int irqtype = IRQF_TRIGGER_HIGH;
>>>  
>>>  	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>>>  	if (!uc)
>>> @@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>>>  
>>>  	ucsi_set_drvdata(uc->ucsi, uc);
>>>  
>>> +	status = (uintptr_t)device_get_match_data(dev);
>>> +	if (status & INTR_POL_TYPE)
>>> +		irqtype = IRQF_TRIGGER_FALLING;
>>> +
>>>  	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
>>> -				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>>> +				      IRQF_ONESHOT | irqtype,
>>>  				      dev_name(dev), uc);
>>
>> Please note that you would need to update ccg_restart() as well, but
>> there is something else wrong here...
>>
>>>  	if (status < 0) {
>>>  		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
>>> @@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
>>>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
>>>  
>>>  static const struct acpi_device_id amd_i2c_ucsi_match[] = {
>>> -	{"AMDI0042"},
>>> +	{"AMDI0042", INTR_POL_TYPE},
>>>  	{}
>>>  };
>>
>> This should not be necessary. That information comes from the ACPI
>> tables.
>>
>> I don't think that you need to set the polarity/level flags at all in
>> case of ACPI. I'll double check that, but if that is the case, then you
>> need to make the case where the device is not ACPI enumerated the
>> special case instead.
> 
> Actually, can you just test if this works for you:
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 6db7c8ddd51cd..f13c10e815d7d 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1251,8 +1251,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
>         }
>  
>         status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
> -                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -                                     dev_name(dev), uc);
> +                                     IRQF_ONESHOT, dev_name(dev), uc);

For AMD platforms, this change is not require as we are not doing firmware
download using driver.

>         if (status < 0) {
>                 dev_err(dev, "request_threaded_irq failed - %d\n", status);
>                 return status;
> @@ -1367,8 +1366,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>         ucsi_set_drvdata(uc->ucsi, uc);
>  
>         status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
> -                                     IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -                                     dev_name(dev), uc);
> +                                     IRQF_ONESHOT, dev_name(dev), uc);

Thanks for this suggestion, I have validated the same on AMD platforms and it is
functional. Will re-spin the new patch series with this change.

>         if (status < 0) {
>                 dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
>                 goto out_ucsi_destroy;
> 
> thanks,
> 

Thanks,
Sanket
