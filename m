Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0E250FE47
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 15:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350628AbiDZNJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 09:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350563AbiDZNJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 09:09:48 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2128.outbound.protection.outlook.com [40.107.21.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB760630E;
        Tue, 26 Apr 2022 06:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsP+a5cDGK+QvipVzcYHCzZY47wN3w7Dl6EvIsCk+K6/SSJHKxxNzg24kRwECdKBHd/KC+/JBDvb5OI16vbWA9N4nhWWs48QZo21bLhMh9+PvI0TeplSrxLKS2xn0K+j5q49F09R9XMbKD0QnBRJOFaKDwqcmApkg+GWIFDAlAyOquR9HP/JyzFAhRIUzb2KOACaLVWU4h5zBvbxScgkP5HXDDuJ4FQ4FhTlNBda94k7AaX81VLtei/4mTif6itPeiMFgQhYr+ieHiFfRdhULDc6OIDPAz5tUJb23A89ZsPjqPK2wUnLxcIUklNU7diPihZy2fHsoeoAW5KVccDLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDP2pv74fGTwg445akTQbC9oKsXEXwFJqPPlVk2DsxU=;
 b=QDEh0cck/vSJRearGToRHdtXp0MgKiqlPJbyrHq7iqKx3OKYj2OnHDJQqEDzQh0gBY8wpbGYDmBcTc5dZj/qxZgAWy5soHuf2+ZhWi4CQpHt3RvJeXmYI3gUYUPGAdB0FaHgA7+iTdbWNuexF6J1ZHFzmg0Lu8uFSjlL8GL0mNdTmX+AygKuGNJS29glcYS7uq83N7AbaPlwv7L0LUbH8wFkdnuuzhBilMQeDFoS4gE9i935I18WUNMhvLQDcuWDrkV1uOKRx3/jHJHQMXno+0YB53AD0Ll2gGvMy5AcNvQALPcN7WtgI6FhIi8QQW4F0EpLMM/Bxi3GwWs0LHqXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDP2pv74fGTwg445akTQbC9oKsXEXwFJqPPlVk2DsxU=;
 b=oD/J9PVfnEPOYnojW2q/ki5/1gcc8GtkrcOB6pWr25fcjm4Vmxu8ASM+vISaYOVSxJl7wvFaa69p9iDWdCxrVQJHRgr5VE4RGw5MIJ92rtzmih2FQJeqy2jdCbQZX5Ll6wiZjmbHK06pkDyCqriJsJlQkSYilsii59Xo8wOSWEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com (2603:10a6:10:3ed::8)
 by AS8PR02MB8736.eurprd02.prod.outlook.com (2603:10a6:20b:54f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 13:06:36 +0000
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::95e5:ffea:aa24:21f5]) by DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::95e5:ffea:aa24:21f5%2]) with mapi id 15.20.5186.014; Tue, 26 Apr 2022
 13:06:36 +0000
Subject: Re: [PATCH 2/2] usb: usb251xb: make power-up reset delay configurable
 in device tree
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-3-du@axentia.se> <YmfpmJfWQwjLGCSF@kroah.com>
From:   Daniels Umanovskis <du@axentia.se>
Message-ID: <f3db0547-571c-d765-359e-8e84d34bffed@axentia.se>
Date:   Tue, 26 Apr 2022 15:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <YmfpmJfWQwjLGCSF@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: GV3P280CA0082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::10) To DU0PR02MB8737.eurprd02.prod.outlook.com
 (2603:10a6:10:3ed::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3feca047-1de5-4ea5-5a70-08da278597ed
X-MS-TrafficTypeDiagnostic: AS8PR02MB8736:EE_
X-Microsoft-Antispam-PRVS: <AS8PR02MB873686943EF980D97E31AEE1BDFB9@AS8PR02MB8736.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rs2HR56uduQCZQGKkVupEBAUje2RBwVxfgqIFQLw1G3ZIUu94wj2FBuLIF7NmUNi24YXIyku6mI7Mr0y4YqCoELhU13lYsuyN9ujlaF5EvdDHnPObZWLrJxwnXy7yfMaXvByIz6FnoE7pghbArk70+b8b+3myPkI3vd0ys6VnVSSvG/+i7jMKYI4t14dVKj8NEcOJ4HyNkc0tgnTS6WYxZxTxHoy3+f5dBd8le5ptbtjtVDoXan+JxCBsyUi2BRZSHF+k4tEGb0slhM6SapoGuBiNDS7ZryU00KlSGdq0JHPYJyv8uGLLc/XOthBvb40kdZ81R21rVyaeCGa/F/WxDwKfpEsyt1s4smkoTWTunWIEW8341SoHRdBSzZ/NqUFUbGTCFL2aEzqmFaUhfB+PxePB7EbWZny4nB2Wke5oPQZK8lWB/gLn08baqVN1PVTGICLFnEmxwZ4FGlEVCndsexK1lo3HOWO3owikNubScJcDUSYUBYiMDOBVR0Fvi3QSMajBmEoPoRh5ss6MPGKONae6pmNIfJruwEwWQZ410d8FXSm6b8/wt7gTIoutgYIKG5BPnlwzmQG0GVw+NS6iv45bLnxADsTGMoscwUCSarpAooTvSs2d+6beygEkydc6yef+Z2rN+KmFso2uNxOlWTOTFD3UXGiBtaLnme9dStC9bsVrWYl7PV4Ce34cWy0pg9xk96ZG4u+qMgoinEVGRtI6Yrl6r4ICl6+1uR8sSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8737.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(39840400004)(396003)(346002)(136003)(376002)(2616005)(66476007)(66556008)(2906002)(38100700002)(4326008)(66946007)(8676002)(83380400001)(31696002)(86362001)(6506007)(6512007)(186003)(53546011)(26005)(36756003)(508600001)(6916009)(316002)(31686004)(5660300002)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VvYW9oT2FLamwzSDlRZVAvSjY3bkdOT2lScVFPSHRqWG1xSXZzd0hUY2Ux?=
 =?utf-8?B?MEtzcHVLeFRhNldrWnJib2xWZkZtY1RqYUNDUmJEdEE5WnBQMHFrQWIxR3F6?=
 =?utf-8?B?YktCREtuemozYW1hUWdSZTZzOE0wa3hSVWFLMmFHVUVCeWppeEVibFdIVlN2?=
 =?utf-8?B?Nit3bE1idm9tRmdBbFovM3pwRE1abmVLRnpHeVYxWmduOWNhdjJDOThjK3Jr?=
 =?utf-8?B?Qmc4VEUzQXFhRFNRaUxEaExWdWVEL1JVTWdBVzhmYXlCSGFCaVNvbDlTZGVx?=
 =?utf-8?B?WW1GMXE5alpRRUczQU4yL25HZm8vcWpReVRSY0JnRlhvS0hxZnBUa0ZyT1VY?=
 =?utf-8?B?TnQwQjVoVjF2cWJPNTJUWnBqNEdkS09kWTNqOHZPYmhvZGRkbDFiTUsyS3ZW?=
 =?utf-8?B?aUlQZXNleFNaZnJhZERxSEZuQlZJbldiQXNaRHdZL3FESVNyMnVnbm9OMGlB?=
 =?utf-8?B?azFlRUdiT2F3V1NDWGNIb2FqeTY0aGJkZXlLQ3ZFa0lUSWd6d3cvK05wQ0tO?=
 =?utf-8?B?M0R5U0R6QmNtVER6Mk9UOGFWT3VpYmlnTklOL0gxUnRaSEg3eWFodVRmdEZD?=
 =?utf-8?B?VndXMkF3VDVKV2NXUGg3OGk3bHozT1I4NENzdGFwbnIyS0dSL1I1ZlJnNW00?=
 =?utf-8?B?RjJDNGlsYUhNYWFWY3ljV0hmZjJrbFBOMG9TVkpDQVRBZzRMSXZUWEthMjQ3?=
 =?utf-8?B?SEtmUnNJdWNWb1BQdTZoRXhsc3BzZlhDOUNuVGp0TFltTlRGbUh3M0ozaElB?=
 =?utf-8?B?T0ZFL0oxZHZnMDIzMnFObVBkSkM2eHpnenU2RGhwNTc4SElsN3NHSXNQTklF?=
 =?utf-8?B?cEJveHZhT25rSFY4TkdvekhHYU0rYXBXZ2FuNkIyKytWY3NDUGJ2V0h4NkhC?=
 =?utf-8?B?U2NaY0crSTJLVXN0dS9ITEFqZXdvam5LMzhrZXBwbDhyd1lHM05yK2V0Vytl?=
 =?utf-8?B?clJucERDV2tKd3JKYjdYSDkrQURTZ2h5RERTRS9RRTFoNEwwcUF5ZUg3Qzhy?=
 =?utf-8?B?ZkJlallkNnBsc1NCdGMxRVVKdENGSlQrUnkra1lMM1BYTG13djBXWUt5em5h?=
 =?utf-8?B?NTEwSkhjYW5lV0ZnaEZHNjJrL0dTUStOclVKc05UL3dLd2N6b05PZEtuN2hQ?=
 =?utf-8?B?Q2JYWlV4bTdwYW9aeE51Mm9MUEk4bHI2encva0JudDI2QXRORTRMQWdmcVRQ?=
 =?utf-8?B?bzNqelI5cmlJMzhsMUxpWGcrMzZURjA2NWJzbllUYWprSGwrTVhmZEVUeGFD?=
 =?utf-8?B?cXdqNytmemFaalJYc0FOdzhVSWN5Tml2YkJVU3Y4NnhiZDZUZEZLOWk1YlN6?=
 =?utf-8?B?aGE3bUJEazZhVlVOSnFtSmZQeVZBRlMzVSt3cDdubWNnNW1KbFNLOXFpcEVp?=
 =?utf-8?B?OWhZd2NHYTlsTGtjTGZNRVlaSTRuMEJBZEt2RWxsN1VwSmttK3pYSldEKzBk?=
 =?utf-8?B?dmlDQXRsekZnVnZlTWZNU1RZc0I1MGlWUkR0MlRMeG5DSkRQUXlQcUpyRU9B?=
 =?utf-8?B?QnZJWTZIMnJaTWxzMmM0WTZCOGk4eER6VE5zWXBWNTBMM2pWZFlGY25IL1dl?=
 =?utf-8?B?TncrWFVicmhrOE5ka0g4U3hLaFB0dFBXQlpObUZpd2U3VVBZTVpFVTVsUlVh?=
 =?utf-8?B?SHFQRHA1UDE4M041dEw1ZXRBM2N6TUtMUkFHdjZWOW90ZzhKMmRHektEdE55?=
 =?utf-8?B?Y3dOU3ZOaStjbmpDdmtsTy95VzB0bDl0R3RNQjgvdy9JUEZ0NDdOWlhIR1pC?=
 =?utf-8?B?NFgyQ3BXSVN3eVVhZVRWUnBRZFpSc0tpbFNsNktPa2kvWHluVjcvYnpWUllQ?=
 =?utf-8?B?RzVTQ25JRW5JeTM3aU1taXZ4VUMyQlhlTUFNc28raVFVUlFmaWFGb3cvYzBP?=
 =?utf-8?B?c2pGd1pGOE9SVW4zK2ltdk1pcEpXMzdicXY2Z0tvTC96cnBnNXAxK24rbHJV?=
 =?utf-8?B?MHo2QkdybEtaZ1I4ZHk3OVNDWVlWZS95Q1RkOGVEbzRCejlncDJUd3MwTHNr?=
 =?utf-8?B?Z2I3TTVaV2t5Znl0UGc0QUVZWFVTdDJUNUZNcTBTUnZuTEo2N216N3IyTDFk?=
 =?utf-8?B?MEJGNGhwYkRPeVhEc2M2RERLWmtkWG9YemFQZzM4SUxpL2x3R0ppUXlGdFlL?=
 =?utf-8?B?TmNjbGl3eTB1Ujg0NVRYY08zdmxjR0UrVXA4T2h5dnFMOFBXSGQwQStiRnZk?=
 =?utf-8?B?cEM4TTZEMVlsOGkydXR5cVh4Z0Fkd2ZyZnM2Y2ptZ3FobUh3dW1OZ2pTbElW?=
 =?utf-8?B?QlhaRlBQQ0trRFRMZDF5K0pQS08yRzFaT2ZON050OHg2YUo2Wkp0UXcvbUMx?=
 =?utf-8?Q?QeZR9zfXIdjFeeOnlW?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feca047-1de5-4ea5-5a70-08da278597ed
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 13:06:36.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UTE+5AeuErbiEt4EfUTHG9SdZoXPsnEId4g2pZXBEvNZe/F3itT4NtJ86ELkF3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8736
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/26/22 2:46 PM, Greg KH wrote:
> On Tue, Apr 26, 2022 at 12:34:13PM +0000, Daniels Umanovskis wrote:
>> According to the datasheet, the hub should be operational 500us after
>> the reset has been deasserted. Some individual circuits have been
>> observed not to reset within the specified 500us and require a longer
>> wait for subsequent configuration to succeed.
>>
>> Signed-off-by: Daniels Umanovskis <du@axentia.se>
>> ---
>>   drivers/usb/misc/usb251xb.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
>> index 04c4e3fed094..e287e241ef96 100644
>> --- a/drivers/usb/misc/usb251xb.c
>> +++ b/drivers/usb/misc/usb251xb.c
>> @@ -115,6 +115,7 @@ struct usb251xb {
>>   	struct regulator *vdd;
>>   	u8 skip_config;
>>   	struct gpio_desc *gpio_reset;
>> +	u32 reset_delay_us;
>>   	u16 vendor_id;
>>   	u16 product_id;
>>   	u16 device_id;
>> @@ -278,7 +279,7 @@ static void usb251xb_reset(struct usb251xb *hub)
>>   	gpiod_set_value_cansleep(hub->gpio_reset, 0);
>>   
>>   	/* wait for hub recovery/stabilization */
>> -	usleep_range(500, 750);	/* >=500us after RESET_N deasserted */
>> +	fsleep(hub->reset_delay_us);
>>   
>>   	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
>>   }
>> @@ -424,6 +425,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>>   		return err;
>>   	}
>>   
>> +	if (of_property_read_u32(np, "reset-delay-us", &hub->reset_delay_us))
>> +		hub->reset_delay_us = 500;
> So if this fails the delay is 0?
of_property_read_u32 can fail with -EINVAL or -ENODATA, then delay is 
500, unless I'm missing something more obvious.
> And what commit id does this fix?
No Fixes: tag because this isn't a bug or regression, just a new 
workaround for a hardware issue nobody's (presumably) 
encountered/bothered with.
> And any reason why you didn't cc: the people you get when running
> scripts/get_maintainer.pl on the patch?
get_maintainer showed Richard as the maintainer. You showed as a 
supporter, if supporters should also be CCed by default then it's my bad 
- perhaps that should be clarified in submitting-patches.rst.
> thanks,
>
> greg k-h
/Daniels
