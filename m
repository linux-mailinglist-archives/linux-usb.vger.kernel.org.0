Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A06D6E6D2F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 21:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjDRT5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 15:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDRT5T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 15:57:19 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAD055B9
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 12:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlVJcmp0Ub2P7Vig5XbfHQ4jj9cWXFlyvvuQbWksN6HgGnk9ka/uD+RmvbhzMktSizuestikzuDCMQdFj5Y0Af7p4k4JeB6VHCF4nJ4buM8VkxAGF8evDUGK7ENeTPOA1iVhPMOLHKhYxPD8T/0gsRVwCRojxo0MlPz37hahoKQ02eXqGTFCroV4vSLYekCAQF5mv8dBbq5TElAeu6xxLy9FFPmlDC4Y2YZ48EkoX37rO8BQcWlaUj0KHr+uZydvBB2TsxXB+qpE+rZz7vMypaclGzE+66E4V5XhW9Ergrx/OtEHhMTI55QwVb7ynjTXkeBl9qeSV+DJJTwrM37P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py1YEnS5JaECVPyPmu7oDGhcAJFTIQ2DU8wIlRlPRg4=;
 b=IsI00B5kTqtJen9Td4hYDtzJX+YpK32Z+hGjZbCqK0XJ0ccMwPNmBtQCVeLMyPrzQD6YwYsnofx0mwndToj7pYQdHL8AVkiVE6tzy97ybHqkrn7Q14fKWsZFE4QgKMs56pMUGvlLzJLHFQoPMKuOX8cp3640BZGjG6hu+P4TpUEFHCgOhoM64MbyPpmVLDMwrmgp74Y9h9L9neM8QU6rFqSw0KBu0iL9u0X9H8U6x4ZMDN/BySRbpsLO8gCWU5fOskFAyuNWIHQLMr3C01Ikqp99Nk6ZfQxUZeWsVd63ViC3EWQIZPEa1F9PMtMYMQVaGDsVFWJ/wsRh7SVmhcek1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py1YEnS5JaECVPyPmu7oDGhcAJFTIQ2DU8wIlRlPRg4=;
 b=wX9pnZbSVyb2Zp4KijGevG42XvJpTXHPLkJbmh8iBOLrYfK8sDjY/oF1suAMW7PtJ/V6tQQRY+fvXSMv03kGGmzaplOHbuf/IUjgk3hGuFRzTWIkXZO1slBSF3yOgsTzs6XmlzJfGNNsF0ocSgSgb5YarctgM3vCEXOwBssRqNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 19:57:15 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 19:57:15 +0000
Message-ID: <14b9212d-2679-c776-bc39-5d6bbd4b1f2b@amd.com>
Date:   Wed, 19 Apr 2023 01:27:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] USB: Extend pci resume function to handle PM events
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     stern@rowland.harvard.edu, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
 <2023041846-pang-cough-f739@gregkh>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <2023041846-pang-cough-f739@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|BN9PR12MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8d12c6-ac01-49a9-db62-08db40471b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHO8lV6kKpM3CgqwP70JffAGiJFV9FgAsqnJ11pg/ycp+vmfapO4n+TVACiR4mck7quh9xphH+9AgbN2S9QgP45PWeZQOwpu2vvbwU/dafAinkAqaAxpnOcEhwgQM2zDgvvz3Nsbkvbts1cP21QOFKnpXSeskPucWMgII+sK2D4l5l3HAo0i5Ps/WaNYva7YW59gUJypCaKXYxXUSaaQaWkeX/vKLojzzZzZqsV/cR1iWEfOkkiJjdAZJZUuztRvFJuRr04zaDhcIMGNGyJBXS7ZtjSRmQvLeDY77gQJXa0FetUBLP4MhAN42P94ctcvjCyqjiTY3oB8vU3noqt6HSByhDD2zNfmDc+IH7RszMyNSWWi1T/9NU32L7U7FlD/QD6vDFtQzjQb3xEYHG5JZ51ErBHztiOlgJw60pv/I2CE3p6XtVfhLgnuntKSwz4z3yOm30USWWUV40lBFbqJ/gq2ogX3rCZpRaZIgh68K/+qHoC883QyjTGXlDlRaExUCBI8FHbc3EDw49kZSenDR/vsvLl3EPD54r8hE3/tIuSDUtuHluF8TJ+tZFied6Q++PY9lYlO0t9z0A/PjtnKx5pNqhYLdWSHw0j1V/3io+4q8aLKJc2s3twPGattZb0NoTVtECHRyA0jCPSq0UKUiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(5660300002)(2616005)(6512007)(6636002)(31696002)(53546011)(83380400001)(26005)(186003)(6506007)(38100700002)(8676002)(8936002)(110136005)(478600001)(6486002)(6666004)(316002)(41300700001)(36756003)(66556008)(4326008)(66946007)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VFRVJ6dko5UHg1bXVWNzZsMDFuMGIzTFhNZEFqQUZTTjNnMlFWdGNnKzRi?=
 =?utf-8?B?dDhEK3RiV3E2Q1Bxc2tSN2FiM2Zza0lCWVovOEZrTENHeEYyOEtjK3I0T09E?=
 =?utf-8?B?SkY3T05uSFhPb3dsTkFyRlJBQm9yZ2V2TVNxcmpLM2N0NGxNYkhReVZWbWtT?=
 =?utf-8?B?b09QVWpUZEcrT2VRNEE3bWdlVCtSVFdyRFVWU3BaUld5dmlTcFVqUkFxY0o1?=
 =?utf-8?B?MGdGV25rdG4ra094ZktaaHBGenJYdkdDOTVhQjVlVVFoL0w0WVFKNnBKRys3?=
 =?utf-8?B?aDB1aVVWNS9JY1FPYjU5Y0dzdU5raU9halJlczh5a0tzb1NCU215WEhYTnJM?=
 =?utf-8?B?NGVYUXp5U2xhb29DeUJLd1N0WGh6S1kwc0Vtd204Q3ZOZmNIYnl5VzltRUVW?=
 =?utf-8?B?ZHJLbnFHckVGMlFObm1KU012UVV4Sy8wSUFRNDgvWFZZSDU1VzFDSVEyWWFm?=
 =?utf-8?B?dHhaWFZ1cVB4U2YybGx2YWc4NEdMdWRTRVZpejBQR1ZpVVpScVlRSlRvZXBp?=
 =?utf-8?B?S3AwQmt5NGdIQXZNaHZXYVBub2FtYUpOOG93MmR3dDFJZTFhK0VWVFJrQ1pD?=
 =?utf-8?B?NlAvNWxWZTlkUjZYSWRYa2dmWGYvRW8yd1pXblJPbzdOcUswNlIrdGpxbFAz?=
 =?utf-8?B?dVRxZ0JyY1ltTmJPMEhEOW44TzBnN1U1ZUMvcVprSS84bGZ3Zy9uSFhxRE1M?=
 =?utf-8?B?RTVVMUM3K0hRZExCcTllN1hGU2llZFhDOUdHbmpHbEIyVkFZMkZCcEdQc3dH?=
 =?utf-8?B?SytZbTEyM2lKSGI1VzRoN0RDMlRQb2swM2ZtQllKeTNQVHFkUUtFRU0va2dn?=
 =?utf-8?B?c3VSWkVYSnJhTzR2NjFxTzA1WHVNY1J3Yjg2SVh5ODN2YzhMdnRmdTlHQVpn?=
 =?utf-8?B?ck8vMzhoc2k4UURaVXpjaDhxTWNmVnF5c2F3Wkl0UENkVFF1NkZpYk5Tb1VZ?=
 =?utf-8?B?MDNyL1BHNUVXWGlZSndRenk0WFVLMTNFZXRGUktOajNtbGFOK2FtaDE1UWJJ?=
 =?utf-8?B?Ni9NNi9oRkpDVDdsL1FLcy9TVytZeFplWFp1WkxVanFkdTc3eEFaRXo5NEtO?=
 =?utf-8?B?dGJsc0JJR2t2MURYWFkwY0tWa3E2K0V0MFdxUy9ENEVRdzJlUFZYM3R6bTNj?=
 =?utf-8?B?dGZ6alVPRjFHd2crT0RUWVpBQTRuOVVOMHZlbkRmYmo1VkduSHNMc2g4enho?=
 =?utf-8?B?cy9mZmVIVllWN0k1UDFjc3BaUFIrbTNiM0Y1M1ZWQkJDcWEzOGxUaWJ2WFU4?=
 =?utf-8?B?aXJiSjBvdDdRLzJld0F3cDdjalJKd21ZaUxibjVLT1RPN29XaitPWjR3NjVm?=
 =?utf-8?B?NW9wblIvYUd3N1NrNXJtSGxGSE9ueHlDY3RDc0RaWnk0eWMyN3hzcThQSzdS?=
 =?utf-8?B?MVU5OW11YytNMWFMNENOMlI0MGd1NVN4ZmE5UTFSR3kxMHJoZXNUOG5HZkhP?=
 =?utf-8?B?RWFYMzk1WXZFbHFPVUhCNFRjaTl2V0RpRkFyaE1xUXpqdW9WREZUb0toN093?=
 =?utf-8?B?OTN0U2dpd1dqL0lBN1h3TVRwYmNoZXlMNmVzRUE3MWNGUGQ3SlBFdzAzRHph?=
 =?utf-8?B?ZW1ocHd5UFF5Y3VOQWl4MXE5NSt6NVAyMmxZUVlta05iNlFzc2pwYU44Z1Y5?=
 =?utf-8?B?NkZZNlpnQjI4ZEo4cStqWDZpY29VMmFHdWhQT29LSk53b0VPNUx6RXJnWXZH?=
 =?utf-8?B?UGpiWm1qVU5FWG1icTROSXRCaEl4T2xmZEQ5Z3NGa1ZqZExDWTVzUVMzWHBl?=
 =?utf-8?B?TDJ4NjBXZzNpMDBXMVFxdUpSdXJyZ2h4cWZKM09LcGR3ZEIxZTQ1MU1pV0Rn?=
 =?utf-8?B?OE5wcFRlVTRqUlN1NHdjYWZrekE1eVk0ak9ESHl1R2tBV2lWUFZ2YytBTys3?=
 =?utf-8?B?ZDFIV2tMWEx6bHB4MTUrc3pQWkV5QlFpcmFLT2pIZFg4YkNwZnRRQVhaZDBM?=
 =?utf-8?B?TEFmT3JnUlNQTnRsdzZZcUFadFNjVlZOT1RoV1F3RloyTlkxRmZsUzlXTldO?=
 =?utf-8?B?eDdxWllrL1d2VHFWWUM5V2pFeVd3c2tpaW5ZQWx3SUxEMVBPY2dhRlI1aXVq?=
 =?utf-8?B?elg2SjBXd1hSVXFJMW9uankvVEtzS08zKzFQQ1ozTnRSRU5USVdVZnMzUTMz?=
 =?utf-8?Q?TEVUWFdVZUzR8I4vwO0Kxdt1H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8d12c6-ac01-49a9-db62-08db40471b9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 19:57:15.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /x8xS62yMq0OtAfdvgh3p7ncZqoa21f8A/jQ3LMQt04e8V+BqxcGiVNmoPCjOxXdbSki74qINkVSJc08IGSwWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5129
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


On 4/18/2023 8:53 PM, Greg KH wrote:
> On Tue, Apr 18, 2023 at 07:38:16PM +0530, Basavaraj Natikar wrote:
>> Currently, the pci_resume method has only a flag indicating whether the
>> system is resuming from hibernation. In order to handle all PM events like
>> AUTO_RESUME, SUSPEND etc change the pci_resume method to handle all PM
>> events.
>>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>  drivers/usb/core/hcd-pci.c  | 14 ++++++++------
>>  drivers/usb/host/ehci-pci.c |  3 ++-
>>  drivers/usb/host/ohci-pci.c |  8 +++++++-
>>  drivers/usb/host/uhci-pci.c | 10 +++++++---
>>  drivers/usb/host/xhci-pci.c |  4 ++--
>>  drivers/usb/host/xhci.c     |  3 ++-
>>  drivers/usb/host/xhci.h     |  2 +-
>>  include/linux/usb/hcd.h     |  2 +-
>>  8 files changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
>> index ab2f3737764e..bef092da477a 100644
>> --- a/drivers/usb/core/hcd-pci.c
>> +++ b/drivers/usb/core/hcd-pci.c
>> @@ -415,12 +415,15 @@ static int check_root_hub_suspended(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int suspend_common(struct device *dev, bool do_wakeup)
>> +static int suspend_common(struct device *dev, int event)
> Shouldn't there be a PM_EVENT_* type for this so that we can properly
> type-check that it is being used properly everywhere?  Much like we can
> do for GFP_* flags?

yes correct , will change in all place accordingly by using pm_message_t type.

Thanks,
--
Basavaraj

> Not the fault of this patch, just a general comment...
>
> thanks,
>
> greg k-h

