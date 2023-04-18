Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A1C6E6D27
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 21:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjDRTzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 15:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjDRTzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 15:55:20 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E199776
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 12:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns4PKG5mZQC6m1+zxUh4C/xdtCKissM6RHQDbpvu76NBPds987HgqRX0vPnDnromfsibeOQ/A3hWQclkdXpj1q4tHWXThCCCOpSA9cHo1I+a6XuLPKggkx0lzK51vOzz7N14i7wHi66cVdeQzBerFO/Qf6r/U7/mPm0OlNip015B6YRxJkddHavoJZdW+ZdjJXlZXKfh4kV12QhYQCBR3X12fdwC7zQ5v6a79zIr573UoXsLmD1JqSijmaRZIwSW7xjsNv2PScS+O74NP9FjDLZW6uQLhmfuIunslUtEaBqhhW3qzzUV3ZTMJthzwDpnKQOaQuvS2NCGZopXmoVSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7xP5/inpV2jopVY60vFzyEa6gGU/FGALjCnSgBN+y0=;
 b=T9aXGfIvy6YXU9PcRuFGEnGhL8AYXLveo2Bo/O6cI2bDhxhtzH/2HR6LyOCYlVOQcM4HAztahzVa2DVP8w19OtG3SIW0LRS2DCL4Dgj/UW+shvm4NPLJLc2i7xuebp1MmihmhhCmPspTFHD+I8TUo2BdK0Od88NTCEveJ/cXd5KHoSAdaeZxPrsATRL4BMpS7qgpGZGL2vR5UW851Tr5ZCIgYEgsUu+U0w35bnblmUAy/FIxbxnHOkHgEhKHB3lb2f/Kr7kaWhhqiA0g3vhBl9YGNnIPRIHkq1BEkqavgImzyZyfwhPyHrO4ryS0/b+b3ANjSvE6w3oyBoX3srKPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7xP5/inpV2jopVY60vFzyEa6gGU/FGALjCnSgBN+y0=;
 b=dYUX5KRPPhgKjyZir2CtSG9aLW/tuqWfr1ZwsijTwPIn/Ltynn15+fHmOB39f4xd5W3gNH45igbPmTrkRHWqvUYZF0qqF+nGDSU7XOuvnSegz4iaFUoyGll6L/q10M15ONQzOmt+LutqhRbdL9/nBSq4dcr1REitpZEgI4hafIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SJ0PR12MB5421.namprd12.prod.outlook.com (2603:10b6:a03:3bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 19:55:16 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 19:55:16 +0000
Message-ID: <2116ba2b-b30a-67cb-364e-0931cff7f47c@amd.com>
Date:   Wed, 19 Apr 2023 01:25:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] USB: Extend pci resume function to handle PM events
To:     Alan Stern <stern@rowland.harvard.edu>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
 <3f486c11-0824-451f-94d6-792f846889f1@rowland.harvard.edu>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <3f486c11-0824-451f-94d6-792f846889f1@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::29) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SJ0PR12MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b93898-427c-4640-256e-08db4046d4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drMGq3v+/mu7JcEVOwIGtWZkncH3+iiWLl86WoVb9BzPQ3fqO9hjDZ44lINtWNgDLEf6ZNMU/R6q46k5JWtWVpDCEH0F/Kl1YnPuB2PAzVF6Nbi9jUeijpfxE5tvTj9a7WSGal3vh4uYs/u8f33UL9NymT6+PC9KP91PFb7CxFxxKDzcBOWq7iosLFiBdM7GLK1jwMBZXjrlIGefCtRYU0LL09cRVmwRCwHq1kRZ1pYwUB5u7aKKXPDZbSSkg+rzN9EYvXuJhdrX3QPIoecUwGVVWd9Uiqd4fC5POmvQ8KHAifVSvLeCG7Kjch/KpsLRRjqK1aSQin5SQaZlUxdlOdU5o/oSSiKJRzkx8lIb59eUqpEHZEV/FG9xAD4C+c7Snv93qDBvvMDClSsYCqYCjUDNrLUulQ7DsPw7t/Jt4lOQOqYzsGMZEw6VzCZwdc3AYzherOWyiJB4zRF/RCyIrSylM6x5JUdeum2x9iAN7rH/Aw+eLqcZoyn9BNAYvmGwsEkOb/vceWrNkTqikKmAbOC4s3sn0NvfdKb1EAkRcs80YU8yKPQwJGBHcrESzHxRLJ6RYFP3VnfWg+vgcojDaVA8XOcGp40Gs/470mJ8MCevA6IqO/Wr9N/R7CmltvA6359BPz8Xqse+vfLMwudekg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(8936002)(38100700002)(36756003)(8676002)(2906002)(31696002)(5660300002)(478600001)(6486002)(6666004)(6636002)(110136005)(31686004)(186003)(2616005)(53546011)(66946007)(6506007)(66476007)(6512007)(26005)(41300700001)(316002)(83380400001)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3oxMjJXQzB0SUY3T3QzWWxWeEp1YXVJMEE2elFrYXJOckdUb3IwQ1M0OGNT?=
 =?utf-8?B?b0lKQW56SnVGWDV3dnpxRSt2YWFVRVRwYVdtdnkzeTBjc3lPMEYvc3h0c2lU?=
 =?utf-8?B?aTRzU21tWFQxU1EvNy9ZN2ZhQnBiSytKaCt5NnFLd2luTTRESkxwMHljbzJv?=
 =?utf-8?B?eFdZZ25DM3lpM0MvdVdRMmZsNG9uc1NYcVVHdFU4cE9XaEVyd1hSS2lsWVFa?=
 =?utf-8?B?TTMyVTRQeFpOZ1NzNmVWYUVERkthamlmUnI0QVRwZXJFaDh5TWNqbkVBTHd0?=
 =?utf-8?B?azRaUWt3aElwdkNzV2hwTVVjLzE2clQrMm14QXVMKzlWbm1IZ3BnM3pxTDRj?=
 =?utf-8?B?S3pjYTViNXJnSG1FRmhxekFtSFp1QmVkdnpSYkR5T0Y3MjdoQjBxdUtpY004?=
 =?utf-8?B?cWxIVTkxMXF5L01tRG5UY2hqY1NNOEQzK3REUHNoRVBTanNUZ1BXL2d1RmR0?=
 =?utf-8?B?OXBBTnBTaXNHZ29HS2JGNlE4WXBrNXZqaWpUMlJEMUp1Nyt2VmhiMTd1YWFx?=
 =?utf-8?B?WWJjWHQ3aHJHSlhXSzVWdDUrbzB1NHpFZlN6M0oxVnJNUGR1YkhTZGJZN3c5?=
 =?utf-8?B?OEp4c0ZWRlpTaXFhbUxvRHJaSWdBQzZiWi9NeFNYcDkxWkFKVVNtRFhGSGRl?=
 =?utf-8?B?R0tGd1dZeHZlTDJjN2R4ZUJKdm03ZGRxTHo0SmRicXUvV2NVMVl2dFljbjNT?=
 =?utf-8?B?bHdjN2d2NGFoenpNdHFTZXEyOFpJMnhYTlZYTVN2SzBmNHJRc0Q4TFBsenhr?=
 =?utf-8?B?UmxUb2pPbnRRQytFckhJd0pLMGFmaWtGMTdSOVQ0eU1EbzB1OHMwVmxkSjFI?=
 =?utf-8?B?SVYxUW5FZlk5SmFTTTkzdDE0UUxIa251cjVsb25tZWpXcTRaeDczMDBtNU1D?=
 =?utf-8?B?ODVhS25nTzBBVDR4d29VekdrTXBKS3hTRVNWOWRJbEpGU2dYMlZQbzFHdklV?=
 =?utf-8?B?TDlCcjNPZFB6TDBrYW16eUVxMm5abnJHOWw2V1ErTk5lbVNkbWxrc2RuUkRO?=
 =?utf-8?B?Ull2RVNCNDBHQ2kvaytQcDN6bi9VTU00Uy9oZjlUT2E4M3BiQTl5MXkwNWVv?=
 =?utf-8?B?YnNyc2l1R0Q2WG9GS3duWEdtRndwTHVsM3N4elVra2pOYXQwV1g2UFFjYjhR?=
 =?utf-8?B?Q1RTRFNITWRaNEIvdFhJdnZrTVZvLzZqQTlIUUprbGFWN01ZQmQ4dytlNkZK?=
 =?utf-8?B?YXdCUzF6ZkhpVnBVcGxNcFo1dnc1UjVGekVOR0NiblRXME94TkZBV0R5cUJJ?=
 =?utf-8?B?RFpSVlY2OE5YQU9DdTNtRjJqaUdMT2dHZ3BZbGNjZTVBWGV1S20veThCQWNP?=
 =?utf-8?B?eERnZjlPSHpVWFR6d2dRRWpLV2hJSEJ6VWp5eEVYdG4xUkwybTh0MDN5Z1hp?=
 =?utf-8?B?c1NiR1hqWDBBK1pBcVJRNlNSYk84dzBMN1k2b1dqTk5ZK01OV2lmU3EzY2cv?=
 =?utf-8?B?NDRoZzRWS3BpOWw3TmRnWFM1eWJJRGl3akpSQW5MY3ZOUnJOdTRUSEwrayt5?=
 =?utf-8?B?OHZQYXFXVndvbUJwMUFrMG02cDJJQzRmcHh1VERLRzZzUUhSYmt2bzgrQ3hD?=
 =?utf-8?B?VVlMZzYzZnY1WlBtakRyeGphRXJXUWdGK2hNQ2Y3YzMxV3BqMzhHUVZNakpo?=
 =?utf-8?B?VWZLUVE3Z0FGSEQ0bWtzZ2R4TnF3a3hQb2NwTGNSNzlIVzRqeWlLSHZMSDRL?=
 =?utf-8?B?dzN5UFY0ejAvZ2liUXIyM294aW1JVksyL1JCaUZJZFkrczV1NFdOaUZhd3R3?=
 =?utf-8?B?Z3JialhzRlFTSE1sREFuRW5IMkZvSDZpdG14bWVrKzlHVXdweEV3SUowUjhz?=
 =?utf-8?B?VE5lK2I3dkdqVzVLVTZ2QVB0UzFQZFo1MVpycmZHblJFZE1Nakg1RnpsNTV3?=
 =?utf-8?B?YU93ejErZk1BNnlHNTRKOGhyNjFVWGMzM3Q2Z09HdUdjSmJxcmJEeWQ5U3l0?=
 =?utf-8?B?OUZtZGNDRDdHU3F3ME9jaGtIYlljYU1EbDdqNWtpTEEzOTZWdzJlczE2djRO?=
 =?utf-8?B?bEh1alF1WDYzZTlzR0FUQ1l2VDc1WHVHWFlLRjhmdlkxN1NrS2s2d3VJcUYv?=
 =?utf-8?B?SzlSa3Z5dlQ1VjNpZnVBOVlJNndPeTVEVVoyaE9tZEdveDlJSSs0U2NaK2Vq?=
 =?utf-8?Q?sO/KrArpDntwreCJD3bcvT/xY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b93898-427c-4640-256e-08db4046d4c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 19:55:16.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogcJi0RvvJGYbtnJC1EJozsvpmGS6lekQ+ShPaA10yJqz8UTG09EGHZffk14T1RZBkgUFK3qQKuPGReF/s6VUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5421
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/18/2023 8:36 PM, Alan Stern wrote:
> On Tue, Apr 18, 2023 at 07:38:16PM +0530, Basavaraj Natikar wrote:
>> Currently, the pci_resume method has only a flag indicating whether the
>> system is resuming from hibernation. In order to handle all PM events like
>> AUTO_RESUME, SUSPEND etc change the pci_resume method to handle all PM
>> events.
> You might want to make a different kind of distinction between the 
> various sorts of resume.  For example, a resume from runtime suspend 
> can occur either because of a request from the system (it needs to start 
> using the device) or a remote wakeup request from an attached device.  
> The different sorts of resume might have different requirements.

yes correct.

>
>> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
>> index 4b148fe5e43b..1145c6e7fae5 100644
>> --- a/drivers/usb/host/ehci-pci.c
>> +++ b/drivers/usb/host/ehci-pci.c
>> @@ -354,10 +354,11 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>>   * Also they depend on separate root hub suspend/resume.
>>   */
>>  
>> -static int ehci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>> +static int ehci_pci_resume(struct usb_hcd *hcd, int event)
>>  {
>>  	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
>>  	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
>> +	bool hibernated = event == PM_EVENT_RESTORE;
> Please use the same indentation style as the surrounding code.  Also, 
> when a boolean expression is used in an assignment, I prefer to put it 
> in parentheses to help set it off from the assignment operator:
>
> 	bool			hibernated = (event == PM_EVENT_RESTORE);

Sure will change it accordingly.

>
>> diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
>> index 3592f757fe05..9b90c3221bd8 100644
>> --- a/drivers/usb/host/uhci-pci.c
>> +++ b/drivers/usb/host/uhci-pci.c
>> @@ -167,7 +167,7 @@ static void uhci_shutdown(struct pci_dev *pdev)
>>  
>>  #ifdef CONFIG_PM
>>  
>> -static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated);
>> +static int uhci_resume(struct usb_hcd *hcd, bool hibernated);
> There's no need to change the function's name.  After all, it is static.

sure will keep same function name.

>
>>  
>>  static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>>  {
>> @@ -202,13 +202,13 @@ static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>>  
>>  	/* Check for race with a wakeup request */
>>  	if (do_wakeup && HCD_WAKEUP_PENDING(hcd)) {
>> -		uhci_pci_resume(hcd, false);
>> +		uhci_resume(hcd, false);
>>  		rc = -EBUSY;
>>  	}
>>  	return rc;
>>  }
>>  
>> -static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>> +static int uhci_resume(struct usb_hcd *hcd, bool hibernated)
>>  {
>>  	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
>>  
>> @@ -252,6 +252,10 @@ static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>>  	return 0;
>>  }
>>  
>> +static int uhci_pci_resume(struct usb_hcd *hcd, int event)
>> +{
>> +	return uhci_resume(hcd, event == PM_EVENT_RESTORE);
>> +}
> Again, try to avoid this wrapper.

Sure will avoid this change. 

Thanks,
--
Basavaraj

>
> Alan Stern

