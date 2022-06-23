Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CA95576CF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 11:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiFWJj5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiFWJj4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 05:39:56 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400B849909
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 02:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T254mxvwqVxTjvVzbgV5Mgz0SrQLnkAbwCuWRKyOwDl+4f2soNzkV4fUZZ8Up8jgQ5uunLEf652BojsvWMYvg11eNZTxJ5Qa+T+k1JAC/khJZwY2d3ysNnOfPFiSnWRcnaXuAcKZ0Ik30HlUr0IasMVV+U5aIwbnlz+7KL4ENhIQJpETZvJ0WodC++wnrMOnKmx8L+rhYb+lIAmsrQYLQOaF7lWpuN0uBNtXucsvzv6bf0WdNyQnBH0OtITZRS08J1V016wU7SMhzTzOZofBHUl2ozUVoFjkM2vQj/Ewf8dmLdy3gMOSeoNZdzu9iIrLhuXNW7TwEhF7Za/J/3I3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6xDKytBOY6U3pYtdiZxCvI+PooD2HzidejueVm4BKc=;
 b=IPl7n2/8wiLqvovAwa11H6U+wCSPCVMZW/rltls+kw7QDXxI/V4KFI6uDiY2Pv5hYuohd2jVhIX3qe+dktcpqrLopYcAbBFcIQWC3X4PthVWGCTvsEczjsyY6LGrtfC3wYB0CI/WHaEXoatLpmYDYX54rMlGAIJqDxC8tvPDtch+5VRQhGqdDvaUL3uUaXgyo6nOxRwbGE/fAiynGIBpQ8zcp3airiUH19pMiyqy/f+AIfnru5bzIIRhjWj6ZQwQsZ/gNBCFhueHWUJ2BaA5MDH0h8ouQnxU0LJpGXZPiAfU0gqoT67QfR2lN0Vf48MND6Hm6T+dYrfkrJXXLkQZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6xDKytBOY6U3pYtdiZxCvI+PooD2HzidejueVm4BKc=;
 b=zT/Zy5ovvHgb0ZaKtvice57F/IyUUgvScoHwx+iAUrVmKWnSHaOMPXEWbm/5/fmrltCtslTLf/SkOInajVovgHEV9dBAcFq7hquas9McDQXErpvzBAX3sp/KrkvqNPEdxYR15dto8oT8vsoJ8sRK1RtLSNdIx8AbqE34a7qbr0FjYccWpZ4TtGxpsAGSEgY0/oi+2owqovHK4JVflcQ0uMAsB3YgZKuyugasawsNV9D1YHthEYYko12RGBM27TJSswNXNWcYiZLLB/yb1aPd1QrC+Orud7ycq71WDiboFO0rn9baOWtWAHXyVmRBcIEmVQpLkJAlpPhZhhnYoMJ1qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR0402MB3475.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 09:39:52 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5353.022; Thu, 23 Jun
 2022 09:39:52 +0000
Message-ID: <68fffa09-1522-bef0-f76e-610e2345a70c@suse.com>
Date:   Thu, 23 Jun 2022 11:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Content-Language: en-US
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
 <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ebcc13-dd03-4456-25dd-08da54fc5297
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3475:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3475537EF7175FF5DB21D9D5C7B59@AM0PR0402MB3475.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuBU3vRFc/PDlyLqx8ECta0ubSnwAFMZek1UTk+YIcwU3z4QNGcsOKcQlyF/YljQJSw+03jfqmRji25yM0hPIQ7hIeC+kKYo1M+qpZLf9yT1qFaqGLVqyP0tiUpYfLgrkbcGt5hbAL2zgDPWW6c1OpfLbBNIDS1QBPcJINdZVjUELSWbb8AwmTYJDmGuQx8khXglkAYnO5/teGaaizDdBAjHFcidAoj26eTwN2MPEuXUiXcD/PXSVRuLiR3itOhvdfDfbQ2O3b1mKpBQhCszOk3r8nOQNeTHv1vOZflacuOP+rI9Icgk/SiQhdUrB7WBcngSgbHQ70GXX25jHBIUvZa3D7MD7ShorptMEbANPz1+5zYjgGYqNLIAMf2ngjPmX2ge6Z4tto9o0H83VTjdchwFGr5lHP8NotfFKaRTFS5SQVoO4VN7ILBbY4zIePql0WSex4NucM3qFRS/WU83RcuV9uFw00zWbrvIJT5TogscE6hZfHajGshglV13PaNPYM9daeVkVkNTakHt4McNhsm+l0n474+F4N1Qwy1mqIbuNo5MGvu593TGeFflPTMhttwTPED4fgI11sECApzzeSptGevtPkJ7lQHt3p489KMxjCZdCsfpDHY6rxT5fb6R8xnR5cjq2zWKOfv2iOC8hwpb0EQRPjzcSbBzneY+nVvtavX00r2fI+nnrYY5m2yVPWloBUBErr0G+vCGVCQGGbpYL2D0J1TEKo5uDRkOz2CV2FP+FK1COYJVorH/uVGM4w5/F1OwTjPEMipiKZZwNAU7nWAP2fqF1WE16ejh1Ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(346002)(136003)(376002)(6506007)(4744005)(316002)(53546011)(2616005)(5660300002)(41300700001)(31686004)(86362001)(36756003)(6512007)(38100700002)(2906002)(8936002)(66476007)(6486002)(8676002)(478600001)(31696002)(186003)(110136005)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTlEbGQzYVZpVzFWSUNRWHdHT1VlNTBtMGo0a1gvL3JVbkt5NTZDQUdpS1Rl?=
 =?utf-8?B?Nmk4K2xVak1nS2JhNGxwU3ZKODNleW0wNHpreUUxenQ0VHNoL1ExUWlrVmpZ?=
 =?utf-8?B?cTNHOUVsaWQzR0lFd3MyM0tDT01EYklrSGRTZ2N6WVJKeStKSUp4WlJ3Ym1x?=
 =?utf-8?B?SU03czNXSnJuekROSDExQytEdG5sR291MjZ6am1CWkVXbWczUmhTZHExa091?=
 =?utf-8?B?cHNaRDJPODIvckt4WC9VQUJmTnhqZ2JnZ0lVN2d6dlpQdFZYM0FvOGhBTTVn?=
 =?utf-8?B?YWZYOE85TTRuWXhxdEVvNTRERWc0RlVIWlZ4eUo0T2c2NXpLVFNFTkZhQkNP?=
 =?utf-8?B?SnZFdnlGSjJjM29UbXRqaWZmMXRqcW8zcDc0UkFEbmpIcUt6Z3BWaUMrVWk2?=
 =?utf-8?B?T3k3eFowcFErZHFFekJsRGlMc1RyQjhKeVlWQmkrUFNyYUpGMURVRGZSRkc0?=
 =?utf-8?B?MWd5TW50eGdOVENxUzNFTXo2c1NVMFpBYjRWa2J6UU9wYytmamNRVm1IRWtJ?=
 =?utf-8?B?TWxtSkNCOTUrMW5xa1JkcVRXMy9HVEo3d3ZoaDdFTE5oRmlLTXYwa1FacU1N?=
 =?utf-8?B?ZTdOQi9ZOHFwb2hjTGUrZmtzN2kvUGQyYlQ0ZFRyS2R3Qk9WVnE0OVAwU241?=
 =?utf-8?B?bFlqVHFaa0FLNTQyZkhKK0h3QU91cFIwTnJMbTFSODFReWhnMzJCSHB4UzVM?=
 =?utf-8?B?eFp6V0Q0ZUcwcGtMaC94N29CaUVnOGFpSVByVGVSeU14eVhZV1k2N3d4NVVG?=
 =?utf-8?B?Wk1xUU1DdlJQSWZUd3QvT3JSTXNOSVFqbi9XL3VCamsrU25ReE52eklySVFj?=
 =?utf-8?B?N2RURzJKYTluak1KM3BGY2paUDlyRzFsVFZaOCs3SzdZSmpCc0hQRktwazVk?=
 =?utf-8?B?TlFLRWg5Z2xYRTNTM3NYK011cHpteHNDNEVKcWhGTmlhU24vWXJURC95NXB5?=
 =?utf-8?B?NGg3NVM1V1MzTDJhSDJUbG9sQ1grQTVUQ1dMTlFBUnNKVDFoZjNQcmtlekhh?=
 =?utf-8?B?SVN0UU5iL01ONlZINnQ4c2VrSGJTN0YvempOY0REVG11c0R6eUtiWUhmcWVC?=
 =?utf-8?B?QU51WlZWeWJSTnFDU3hwSGw4N205bEl4anorM1M1QnMvaWp1emEwWGxKTTVV?=
 =?utf-8?B?MHdlYXdjbXlxOW5aOWhOeVJWSDZMcGhLRWtTQTNudyswelZjL1JSRlMyZjdK?=
 =?utf-8?B?c1RteURiY2tmK1plR1diS1FNTTVqVUhqNFR3ZldyZlhjbEF6NFhuekEzYTJB?=
 =?utf-8?B?N0JGcDZMc2FzN3FrR1J1NkVUS2RLbnp1TkQ4WGpuUjJJSzE2MnliTUE0ZkRi?=
 =?utf-8?B?TWhXb2tOMHIxdUl2NVI2M1RVZEtDWFpyL0g3MnVqR0JpUVhWTUhveGIrYTVq?=
 =?utf-8?B?cEU0VHNqNlNlRlFyc3gwZU9rL2Q0RzFuWjFvTmlZUEFUWDAvTm40OGlvUHRv?=
 =?utf-8?B?ZEZoQ21WMEhvYTloQzhIYm1aVDBNMXBGUEs0enRxTE9yblFTamVmeXVmNitj?=
 =?utf-8?B?dzA4aDBjZzYwNWxwSGtJOUprbncrVWJzRGdpL0lnTVVtTXRXdjVBcWN5Z3h6?=
 =?utf-8?B?NGhBYWlPTnFwU2IrdFdINnkzSlpFQ0grTGhWWldFTWpYYkY1VHNmSWNpSENz?=
 =?utf-8?B?R1lwQlJWRFliL1FHNHBCMWM1bzBsb2c3aVdKLzFJMzFZV0VNK1pQS2JpWXk5?=
 =?utf-8?B?a0l5MmozejU3VmlSa25ENG5hZWlvS3ZFLzdCOGR2YzRwMC9vVHJ3RytsZjVF?=
 =?utf-8?B?QjJmYzFiRkZaM3FyeUhiNG5oUVMvSnoyMVhRUTl4am9iNzNnS0xQTk94RjQx?=
 =?utf-8?B?TiszbWFoQ2tlOTBtSXBGYWlLbmxDN3NRM1o4YUFBMXNLMXdJNWNyVDhtS280?=
 =?utf-8?B?anJqR1pXdGpNTnJBc0p5QmUwenVBb1VSbTdiek8ySlM0OUY4Z0lDbmVuWkpw?=
 =?utf-8?B?STR6clgrWTZBYlRXVjFJeGVLK3BLdWR3djJEd3JJTW0yTXdRdFltSnl0TlA4?=
 =?utf-8?B?NDBNQ1RsVkQ3OTQ4Vlk5Z2lRWkswWWxjMG5VYllwL0tac0hndzZ6OUFqcGtP?=
 =?utf-8?B?bWJNNUg3Y015b1J2WXI3dXJrVEZ0eVZmWVJ1UVhLU05ycjZhekMzMEF5dEgy?=
 =?utf-8?B?OVJRVllvY3pmUlVCL01CRFU3a014UkJHSnI2c3RLNHlDRkFjZVJ4MGJwcjhQ?=
 =?utf-8?Q?U81G7oTwwV9+CpmSBOIHNjERU+8ojwIgTFPHmVE3cTSP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ebcc13-dd03-4456-25dd-08da54fc5297
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:39:52.2506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFfOw7ZYazUpwvSJtO9kM8Ibftn1x4dS6mZGzn9Xlje1nQXwNbCEp5effIQN+kjUjjIiqQYLc4yCqrfr3HoQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3475
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23.06.22 10:55, Chris Ruehl wrote:
> 
> 
> On 23/6/2022 4:44 pm, Chris Ruehl wrote:
>>
>> On 23/6/2022 4:28 pm, Oliver Neukum wrote:

>>> if you absolutely want it to be driven from CDC-ACM, try this
>>> new attached patch.
>>> In your original patch you used NO_UNION_NORMAL. That will allow
>>> a device to work without a union descriptor but with the normal
>>> two interfaces. This devices has what in terms of ACM is a collapsed
>>> interface without a union descriptor.
>>> The driver provides for that but then it checks for the exact
>>> number of required endpoints, which is three. Your device has
>>> four endpoints.
>>> The patch ignores a fourth endpoint.
>>
> Apply the patch ,
> still no /dev/ttyACM0 comes up.

Hi,

please send me dmesg. This should not happen.

	Regards
		Oliver

