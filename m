Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904BE56A0FC
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 13:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbiGGLSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 07:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiGGLSO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 07:18:14 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2048.outbound.protection.outlook.com [40.107.96.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFAB2C125
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 04:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcFdr/wouzl6XTwZ9gZnzCIQ+xMbwlViZozG3a+1u7MwvBkZKQ1yOy0wMT9Y6dH1NogUlEodlVdHFNxCsuaWvtNPL+QdAxQ6B36RlmMLllbaxQDx1DG9hvn72qRLmI9B8UTgmwtM3VgsId93wARrKqGyWCYoHRzv9qmc8iX/z60tWyEX9cia7JCstmM9Fp2e0D8TLlIc7ZqBikm0/xKRYWvV/o9aJ9PIjSTOAaz85vsCkzjM2F879PhsUhP6ZgRM23U9t3WexQ5TM4p6eaxYSeUEy3A7NyCKfqRLYm3zq7BHHTPrxW9yWxr0MQVyd7imqu//4zvTifjmS7NNDGnKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3spRmdiczSd5Mbh6qKzDzY2EmrI8iccffAhOhFzd42Q=;
 b=Um56zpQ+AW3iaOX0eoxnrSIklcTzlTmNGRGLoLzA/xhWpFQ4HHvF4oc529Igk+eHaqZu3IvDEhe0j0O8DcIaaAoLSP6E4u5auEg0oD9U3uyNtfv8dfufgmeGUw9HjLngkiJNAor7Yl5LUApWX48eh0EP0chVNzAS0HI5nc6rBM5X1uufihCM7EMsfDOh6L/7LkDRV66OfXRpkM2ycVHyuHKT/X2WmrzS6v1WCEyU2wCVqWLuPxbNIBCfNiruJZMlWZijiw8WrkRl/C+2ziVW8GKBs9cO4M0tYUYDSA7awQVlHUzgirqHLB2orcDcHmcyRgv1OCL17eDqfJGhDQrEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3spRmdiczSd5Mbh6qKzDzY2EmrI8iccffAhOhFzd42Q=;
 b=q5WbkIP21cgSUiZISuKm5TmlUEK+IFhA12BErT7RHKO0POptZ8CxTdF0Muf/eMWwjU1n1X5OF2QkEXYj4+Kz/WgM/UbNoStmQPwMpRbJmRD1Md6EVHusXb2kIsiEBuoM2XdIahS92YDLn23bBkSUiP0iIJ55MpxlWIlspclV4F0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 11:18:11 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1%5]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 11:18:11 +0000
Message-ID: <3e0fe43b-cba8-015f-06db-ac49977993d7@amd.com>
Date:   Thu, 7 Jul 2022 16:48:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
References: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
 <YsUq80qWepLR2mZ9@kroah.com> <8c913bc1-1ebc-d536-433e-bf3e2cc1f9c1@amd.com>
 <0b9f2b04-7734-4d05-f027-cd3d7f49064e@amd.com> <YsbAL5HS9yEXJXh3@kroah.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YsbAL5HS9yEXJXh3@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8cec540-1ba0-4412-3453-08da600a607b
X-MS-TrafficTypeDiagnostic: BYAPR12MB2853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytoGASSfjOj8C29DAPZ29uztVmlWCNwWA5fw2qztIZxK2SoyOL4L2hBtIpjg5RwET8TRXrGaHccUDsk9MnHC0DWUygmHka51/nmolopHl1QPiMqrrFfI+BrPIkjNWuUq7UJbee6Q60QRh6u3xaN0uPYfCJECYihgBvVrx4rUkD3T3+9U7/HgetUq8FOd1uoDVjvxvQJmF+i25EqtKsNPSebrwmCe+LQz0f94tc1NvpxHC51hrS/wqJORH3euVyCbxjlxjo/aERvqaCYrD+t55Qg6nIQCw53Cu6Jbv6kmdu/2Q2WZhRW6bYh6V8mGsPqfo/kzEvHyKHl+JBgxh728oCRP6IcWOPL2smvEq6Zk90+XGqVfLprKj2tRd6y6h0FWTQrFwNST8WxZfYRSqqXd6gv4XvXq7NrWJRoPDfOGlv8V2ii00XYlOVhp/HoMLhVM7ujURyN6dgUYMfDQrPDOdsDYKZnVEwcjROIDbJObs3vZah1u26nANQq4H83j89n2ahyEQsZzQsFRgx2M9QP2SzDD236MOJHfutn+jUrh/GuZr36qGkeDVZqgJ4VLKuwUjZEvU+JKwM0Eh/LRvmMhb2D/8VzG5PS6Zc9KlAK9V2YZGgJZebYLKNbSe8j82EZihJt2ShBrAiNzSvocgQswnlG6qoVS0Cf+O/HYn0l2KnxmFgDxYwuAguEar9NIqRyiUhVL0gUs1BgV/ChdRtttb9O8oyxAWZV2mOMaVI/8MW6RUDBApUhVzERvoxUJGnVHp0q1PFsCPM0MOUab0ek4C9NyVfYl7O8TzPMkKLkEGuwWrCDC+ZZysWL8xedO1gBJjIosdl9iCz441tAOB/wTeEEv6Sk19ecEf96CmoIPKcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(38100700002)(31696002)(5660300002)(8936002)(6486002)(2906002)(41300700001)(6666004)(478600001)(316002)(6916009)(4326008)(8676002)(66476007)(66556008)(66946007)(186003)(83380400001)(6506007)(6512007)(53546011)(26005)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklqczB0K20xQS9UWkpPZzlEMnBsallIMWtSZ0VpZm1jM2xFZy92WERDamwv?=
 =?utf-8?B?WU5KZG04MUp2Z0IzbDJFT01tWkUvQ3NJOHhhaHFjeFZUQmFVVG1mZXlpK0No?=
 =?utf-8?B?cFFhV3RxeU9VdzdSazEwRlZIUGFzaU1YTFcxa25LcitiZms0dFhLdW1FSW9q?=
 =?utf-8?B?UHNDMHFIZ3FkeXZ2RUdNdVJQRHRJVUFxaVlKeHF3bFpJRjJ4NjhNQ09ZVUdY?=
 =?utf-8?B?K1VxczgreWs2MzRqcjZxMVFHV1laZjN6TWFOTVYvcHgxRUYyUnNlZzJ6UXJW?=
 =?utf-8?B?TFY2SXVjdkErSGhCRXFhbWlIcURVTlVaQmdwdlprSnF6NUVoenFRT3EvcFhB?=
 =?utf-8?B?eThsMVF1Z3FLbFVuZFExbUVvQjlRbnhJQzdjM1ZzM1FkWStWeHVrV244akl6?=
 =?utf-8?B?R2JDdUgwaFgzYkFmdHpoeFpmYWtSYjU4QW0xcmRsMmdRdGkraFh3S2dOc0Zu?=
 =?utf-8?B?akxDQ25wenR4SXpVTytWZC9obzNQQWh1SWZRaHZBVmNycCs2VlNQSFJybDRh?=
 =?utf-8?B?WDI4eWhIZHFYWTNaT2RsWmZycjAzdEZKa1lzUnZ1QWJXNU41WVZQYUwveGdw?=
 =?utf-8?B?U3ZnYlBFeVdFSm5PN0ZNWkFha2JQb2cyU3c4c0ZtZnh5WEpQWThUQ0p5dXhS?=
 =?utf-8?B?SmZ4MVhFandaK3hCREZsVm82Rk9ROUg4YldUb2Y5ZE1Lb3RYOEFPTXRFb0li?=
 =?utf-8?B?R05KRU54VVkyL0wxQjVhY1ZUME5JTjVFaXhyeFhVMjFDOWxza0U4ZFBvWTRR?=
 =?utf-8?B?MytwSk01OUIyNXg0WmxaVnRZMWN6YkFzOFRvYXFjektHRVhJdVBqUnQ5cStz?=
 =?utf-8?B?TFZRaFhMMTJNb0ZJaVZUOWNoZGtDNlRtWXNlVS9NcisvVmJVVEJrekNMTHFN?=
 =?utf-8?B?d3FzQVVRcUZJcERYa3I3ZU42TTJLaFVWU05RczhFcG5jS0hCMHRxQU5yc1JP?=
 =?utf-8?B?UjEzeEMwTUdDOUlPaHp2U0RTL0xOdXN5Sk4vV2g3TUs3bnNoYnBHTmJKcy9i?=
 =?utf-8?B?cmFsUzlvRnNpOGZ5eWJUOHFCbHNQdFVubXZLczJwM2xyUkU5c2thczM5TW9z?=
 =?utf-8?B?YmQwWTFzWTVxL2FwQXMvb00zR3lSczlnU0drVTBFazhMMWtOZmJobHVndUtJ?=
 =?utf-8?B?Q1dNRFdZNVVxek5MKzkyMExXSFlwczlVV3JuTWVTamZiQndVbVlwMG94QlRr?=
 =?utf-8?B?UmI5MVhhN1dkeDNseXB1R2RvQlJYVGVpUDV1cG5BaDBYbkYyempWVWFuZWNl?=
 =?utf-8?B?Z0k4ck9lWUczSE44UUcxQ2hoNVU4a2MwOW0rSHFOUVBIemIzUEpHdVJpRk9N?=
 =?utf-8?B?N1kwWW8xeW5Ka3RSTUtQWmpBYnRpV0szUktMU2RlTVlMQ082b1FGYWdPZ0ho?=
 =?utf-8?B?ZXlwbnRUWDE5QmVsTXBRTDVnZC8ybkJMNEJ6ODNqZjN2SEJxSlY2ajM5L09T?=
 =?utf-8?B?cjVYOFlzNXp0cm1pamhScU9lWWMyWExwQVAyWmpnNzg1K1ArY1prQ3FkY3ZW?=
 =?utf-8?B?Z1FrSStsMmE5UnI4ZDBaUFBabk9wd2pxZEorMnRNeDh3d3NnNThKL2tjajE5?=
 =?utf-8?B?QWw0RG5OdTJ0U3VES2RvKzhLUjlnRmhFRTZBRFdOMUt0aEhlUG91bnNOdU1U?=
 =?utf-8?B?Nlhvc25qem5Mc2JZdHhwUElLZkl4djdOR2xTM2p2OERCbVZsNXYyaFdpTkhO?=
 =?utf-8?B?T0NKdmhVaVRJalNlVUVQOFkxRUIvNkJxR2w5eUVzdGU4ZWpGV3VxRzdLdUx2?=
 =?utf-8?B?UG12aitDZ2lYeTVzYi9QN0ZlUnBuakNXb25mVlRocFRCaU5NVVA3M0FkdzRl?=
 =?utf-8?B?WUxUcU01T3dpSmtSZk1lSjB5UHhhemVGcEYzdlQ5UXd6dzdVTVpDdm1POFNz?=
 =?utf-8?B?azJPK3llSyt5WmxqbWFiNFQxRllzQnB6ZXhpajJsWDZZbGJHdXhmSkw3a0Rp?=
 =?utf-8?B?dkNSaHlSbm5YRUNXeXFsSHp2cmZLbEdFaVUxS1pSYWQ5REQ4V0ZHcFVWb1pp?=
 =?utf-8?B?NitFV3NoMFhMWUQ0cklLdXFTUmNtT3BtajEyd3ptczVOeUE4c0ZaK1lZRWRR?=
 =?utf-8?B?Nmc3dnovZW9IYU5nMEFHTUJkTCtYdTRTa3YremhXb3pzbnBTVGREd3pvSXVF?=
 =?utf-8?Q?pvA874uoirV/MbtGXw4KAedCY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cec540-1ba0-4412-3453-08da600a607b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:18:11.4266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRYmyBj4YS+G9tz1EMxhnHLmgQbkBfJFSdqY9OqHKxPqyhk/T91m/eCUkGeDT26+p1clPb1c2Cmuglu5NiU0zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/7/2022 4:44 PM, Greg KH wrote:
> On Thu, Jul 07, 2022 at 04:01:12PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 7/6/2022 5:30 PM, Sanjay R Mehta wrote:
>>>
>>>
>>> On 7/6/2022 11:55 AM, Greg KH wrote:
>>>> On Wed, Jul 06, 2022 at 12:39:38AM -0500, Sanjay R Mehta wrote:
>>>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>>
>>>>> If the boot firmware implements a connection manager of its
>>>>> own it may create a DP tunnel and will be handed off to Linux
>>>>> CM, but the DP out resource is not saved in the dp_resource
>>>>> list.
>>>>>
>>>>> This patch adds tunnelled DP out port to the dp_resource list
>>>>> once the DP tunnel is discovered.
>>>>>
>>>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>> ---
>>>>>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>>>>>  drivers/thunderbolt/tb.h     |  1 +
>>>>>  drivers/thunderbolt/tunnel.c |  2 ++
>>>>>  3 files changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>>>>> index 9a3214f..dcd0c3e 100644
>>>>> --- a/drivers/thunderbolt/tb.c
>>>>> +++ b/drivers/thunderbolt/tb.c
>>>>> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>>>>>  	tb_tunnel_dp(tb);
>>>>>  }
>>>>>  
>>>>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
>>>>> +{
>>>>> +	struct tb_cm *tcm = tb_priv(tb);
>>>>> +	struct tb_port *p;
>>>>> +
>>>>> +	list_for_each_entry(p, &tcm->dp_resources, list) {
>>>>> +		if (p == port)
>>>>> +			return;
>>>>> +	}
>>>>> +
>>>>> +	tb_port_dbg(port, "DP %s resource available discovered\n",
>>>>> +		    tb_port_is_dpin(port) ? "IN" : "OUT");
>>>>> +	list_add_tail(&port->list, &tcm->dp_resources);
>>>>> +}
>>>>> +
>>>>>  static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
>>>>>  {
>>>>>  	struct tb_cm *tcm = tb_priv(tb);
>>>>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>>>>> index 4602c69..cef2fe3 100644
>>>>> --- a/drivers/thunderbolt/tb.h
>>>>> +++ b/drivers/thunderbolt/tb.h
>>>>> @@ -1222,6 +1222,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>>>>>  void usb4_port_device_remove(struct usb4_port *usb4);
>>>>>  int usb4_port_device_resume(struct usb4_port *usb4);
>>>>>  
>>>>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
>>>>
>>>> Why not put this in the .h file next to the other tb_* calls?
>>>>
>>>
>> Hi Greg,
>>
>> I forgot to explain that in this function, I have used a structure
>> "struct tb_cm" which is defined and used only in tb.c file. Hence have
>> to keep this function in tb.c file.
> 
> To be more specific, I mean why not put it below the line:
> 	int tb_dp_port_enable(struct tb_port *port, bool enable);
> in this .h file in an attempt to keep things orderly.
> 

I get it now. My bad :).

Will send the change.

> thanks,
> 
> greg k-h
