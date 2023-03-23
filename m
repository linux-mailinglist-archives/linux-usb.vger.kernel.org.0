Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519546C6A05
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 14:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjCWNyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 09:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbjCWNxr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 09:53:47 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DC43754D
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eveOmZbPyWt4WN/n9+a5hiPECxNEJIIgC9okGKfhK++nRfVne353Nnqh+tAeQ5n1s7Ch8rlHBdrUVuMtr8kFCsem4Cso0n58DTRnthZ9ONPqwHCfeVGxjScffRvOdfZXayV0SH9XF5q430EPEQl0v52GRfCwb6ivyhCHRaLgI4cWKt08WUIajbqmMzgnP4KHDwvN9FQySxl6iRlkAN1qW1ejzPRuCGzbuj2cuyQL3p9lObuQuG5fnolvCmEOKbksZ0GP4Z856xWW23xlwSlOMquzcRniYb0O2sPuogh5ZcZvWwbdReTUYeEENBgbVSOoMAsVOKdzlLZf53FdHvf39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO7TyqbAOfpG6qdMw2WnZsXMYVJzXcCH6HD/tzv9v/c=;
 b=bsBh3ai9A4HFSOmCKUjKp3EHQOjqSawVLxQsk5aiaZ3nlfYBb0OfbkDOh3EGNQkpG4FkJAiqu2zwyBjfhzBjmQTSIE1Qp6N9xUEbBmVkNNPEv6T9Rjg5pKK1/pVMc+m4wDCLl17ICdiOYNHGpGLox0LMrviMmvYrsTlNq5zx/6yY2azA7zL+sPPYyxBmH8KY7luT8BoGSilIrdMRi4qVJvuTfeoV0Jg2i+D6q0R9dWdZJp+jL0r4QXQD6F7jl/287ZS+vR45zrU85sEGchM1bcE7AxikLIxxxit4wwmJfSwUZUrEEn8p4nWFaT+Wgv7ETT3n23Zd6zM5kLpGVGDcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO7TyqbAOfpG6qdMw2WnZsXMYVJzXcCH6HD/tzv9v/c=;
 b=KovP2LEd/LTkm0UB1y6H4Z2yzxmF+kCAhEuzkIyHv8q9o5P8o0IBienenHrc90+Y6qiVinC5WiHvBaLBG+RJ1sBI3rlVis83eN0ob6guh92byFS2d5tL4EhS6qLnfJb/ZrVgZVm2R4lJpzHrqsD9LMXIc9tXbI+NSA8i0Lhv570Be4ZjCTwBK9LPmdc8GY35n4/f4A0E2XZWXAU84zubEL6YKRjtuNgjSto2BrKLAA1jzBquVge9m1FTxVKhWh5injEXEcKrP9t/pznzVBOSHLt+EPlrk1kLNstXbhFy1eZTdYa+YscOnBVV5r1h6pwsLWxDTPV81c6OFn1UPOkZZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:53:24 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.038; Thu, 23 Mar 2023 13:53:24 +0000
Message-ID: <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
Date:   Thu, 23 Mar 2023 14:53:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
Content-Language: en-US
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 898bf21d-6ff1-465b-b859-08db2ba5f845
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9/vcqIOiD/mn27lkVOjNig+ZjzOKHzcObqTk9iD2EaKmUb0kyhnu3EUiLVzOid+WI9SKFivKFUgFRCAgvx69OiqCb1TRG0zj4iho0mkwSIE/gw+Ojjcukl2r/7BskW7Vtblj6hHy0XfWNuRCj/9fIoqCJzvTO3KXo+0xe8UUKZ4vtS7ach8BXkFcYvQDS94+BflgJCp64ZZ4isbkZO6aUkhbT7xMImVK16bEEDDVEmfC1i3guLySsFiKh3rC7c6iVrLbHSUFADIF+0QwbRyhtR1PQHu50eWomCdvaL2CwNJtbRnN0BakImME/606NMlW28T7l/QD+dg4DsaKW2ebWRo+puF+hyrXl7ls2pJdhKjsigl72VI+YOx+uuDZMp25o3y1NXaabr7c82DZJeDHBMBKbglMYZJdTwfJy5GUaOEnPVKSvMwBHUMB+p3OL183MIvHgc7OlBjmEk2h/BWEyAI5LOkC6FaEE3OGhbLopOIxOjgEhJObetuvnP6cV/wVRyHoq43Gd6de2UdP7V1NRVM2S0ayLq0h8wl/h2+cp9rPK+79WNWjJiTCDrjWtQKnFFUvbh1TRVzQyHwlTgSEeH81WCiWB7Fq3nIiv+wPtssJkR+AnBGq7IDA69rK9qyzbHZ/jJc2aDusPDjDDioUdTiGUMgOXtZ/hM/tl2LV2dgUvEwPfqAX+dGcDNogl7/VYroqw2Sxr1y7kkzUn7kSb/ywM7aOXhOk6WuD2rRSww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199018)(31686004)(38100700002)(2906002)(478600001)(83380400001)(6486002)(2616005)(186003)(31696002)(86362001)(36756003)(316002)(110136005)(66946007)(66556008)(66476007)(8676002)(8936002)(6666004)(53546011)(6512007)(6506007)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGk4Y2xjN0QwemRQbzZ1cEVGWmdUMlp6aVU0N2JDOVM2cWFMMG55RUc4eFN4?=
 =?utf-8?B?UmswUVVSZGhXRC9kN2V1THZESzZFRHZyZzBXMUVUK2pPanNVcEpmRnFNWkFL?=
 =?utf-8?B?YS9LcVVmSHNTWldxdWxNbnp0NGxVZFVHcnZmdW5rVDFGdCtCNUFUVGwxQTIv?=
 =?utf-8?B?bWs2NU1oVC91aTB3SWdpamJLVlR5Q0lwRXZNVHNBeGl6ektvMlF6aC8vanFx?=
 =?utf-8?B?and0NW03M1Q4N283OUJsdDhwVzBIbE5GZ0NONE9JS2IzcXk3MVZEcDlqY3Rq?=
 =?utf-8?B?V0N2ZXJpZWNnL0NmTWt0OVgwOUZrY2V5czhUeGIrUTdOTWFwZllvbWpONzgv?=
 =?utf-8?B?VWUra1RsQWcwVjNlcWw2SDNVenM3ejVoMnpiTjQwdVJielc1bEdmNE4zdjd2?=
 =?utf-8?B?eFFiUlBvNEMydmcwR0JoK2x6bVNNWFRoS0JkSGQ5MTYxQlkyYWE4Y2FZWmRO?=
 =?utf-8?B?QUcyd1AxUnJGTkthU3pKT0F2M0txY0Z4NFVzY2YxZTk1THd0M3dDV2JYYnRj?=
 =?utf-8?B?cjJNbUkxbW1CWWhQSndjcUxLM1BPdWhOTE41Ky9BRU82SllnKzRLcmJtaTRV?=
 =?utf-8?B?ZUY2Z3MyWUxIdlQxeWVRbUh1R2Z5VkZIQnRRbGNuMnEzZURnN3NMWEZudUNv?=
 =?utf-8?B?OTRmQmxmZUJEWnpMemVOcDN4dER4NHh1Z1hpYUpTRjNVT1V4VGx6ZFhRWWtW?=
 =?utf-8?B?SmN0bjF6SkQwWmdvRUs5aUI5M3lYRHlQOUFoWHFlS1lvVzQyUjZwL2tER05p?=
 =?utf-8?B?cnhxeSs0c3dBUzdqNzZyUUhORjB4Nk5jbmI1RGdRVU5WWHVNTTRZMWFEWm4w?=
 =?utf-8?B?YWpaRHBzV05kaFFsMkJOVWFMcXFWcjQ4ZVZEaDJkWXBqSDlCTnRwczFnYmg0?=
 =?utf-8?B?cjhXR2trd01iVGxTV2pTbmRFZFZJU0pYdXBvK09naFJXMnVsc0llOHE3UjBl?=
 =?utf-8?B?L2lCMzlpQkovODdXZkdNWEc2MWs3bndEWldNNmJ4OExjTDVMYWFScHVuRUd0?=
 =?utf-8?B?RVBhVDFEeXdRODNCSzZPR2FUNm9sQjRTNzBDbG1UdVg3SGM5Z3ZVeGNXTnZ2?=
 =?utf-8?B?aFBhQ0tlNTJMWmNJNDBIT1NVaVdhSmhYSHR1cUxHVElvNEFQWXNHZGxVUGV3?=
 =?utf-8?B?SzJGM0ZYSk9EYmNRRTdEM3o3aStiU2tNWHp6ZXg0MTRYRG1ZMDY1cFo2WHQ1?=
 =?utf-8?B?NlB6ZDJGcUdBRWo3Tk1vOHdDRS9Gd0JwTXozM092ZUdITHl2Wk9PZXI2U2c4?=
 =?utf-8?B?T0NSZWxQT045dzdYOGV4NjkyMXlnelRKaFVuMHhMYUswTzdlYkdGS1dFaHVT?=
 =?utf-8?B?VlZhdlMvWkVjcjlRSUFIU2NqZHN1S1pMb012STJRWHhrWE5tMk9iR1U4allT?=
 =?utf-8?B?MENtNXVWTW1FdWx2TUxaamFrQUkyeFJRaXVkTEk3NWpsNWRMMHFMNGdoOXRK?=
 =?utf-8?B?NjJFa2V3Y0Z2NkRvQnRkMlhZTGNWNlRPK09rSEJEckNGSmV4MmVjYTdDNXNM?=
 =?utf-8?B?czdwVUdJVWhYM2NTWDFDQjB2VzdBdjlkajlKYnpJU3NETmk3QytBaW1hYlFP?=
 =?utf-8?B?Vmh6cEc0NUZSSXBieVFMZ3BJNDg2TmxuZFltMFVZYUJQOE5NMmk1UWwrL1F0?=
 =?utf-8?B?RTkvTjBmdkRlSHp3ajc1dUpKYnJaQlRNY3Z1Y1AraGpGZHpER1hUWWpXU0Za?=
 =?utf-8?B?QnhZU0ZxYlZiUkNsRFB6VU9sT3JHQ1psM1l4blFTYk9XbkhvS2dOcHJ6RXF2?=
 =?utf-8?B?NktEdldhdTlSYVBUbEtsaWMvNEgrYkgzaG1pclV6QkZzVTNFaTNyQ3A2M0pQ?=
 =?utf-8?B?QmtlSXpRalFYb1pSbXNpSzF4N1dOOHJoRGpZS0hiK0VpTHJWY05jbjd5VUh4?=
 =?utf-8?B?aExpRHdwTWcvcnZTc29hbklVOFBqeUVPSElYd3FlbUVMUUg3TTNHOE44TW5x?=
 =?utf-8?B?QjFzVXNadENnQndTT1RmYk1mTzJMNm1VY2xiRHZkc1RRWWFleW1oeEVuUzFG?=
 =?utf-8?B?dTRlZFo3L2NnUFd0ZndobkZXemZQTnd0SSthbERRZVRvdDIvTkNXd2E2SHpK?=
 =?utf-8?B?OEw3RXdIVER4M0tlT3pSa1FMd0dpMHoyTlN1WEpQanBLOGFRSHJXbXdDNkNF?=
 =?utf-8?B?UVFuZTd4dzI2QVcvSGozTWw3Ri9SZERpSmVBdDNXTCtCMEZsOXl5clQwNDcy?=
 =?utf-8?Q?Co9LaJJhGkxsCXrxS/p3Vuo7GxqdjaKoPJ2a0BFMHkE3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898bf21d-6ff1-465b-b859-08db2ba5f845
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:53:24.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCzm+1jRhspNX2cLue53UVbWQJYWPNFl/8wjFWp1gAJDM1WyyqrFJ1r2MlJgtnBzyUj7hBFxs92j/4YhUlKDyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23.03.23 13:52, Michael Laß wrote:
> Hi,
> 
> Am Donnerstag, dem 23.03.2023 um 10:51 +0100 schrieb Oliver Neukum:
>> On 18.03.23 13:09, Michael Laß wrote:
>>>     --> no more communication
>>
>> Just to be clear, the device is generating data, isn't it?
>> So you would have expected data from a suspended device?
> 
> Yes, the remote device is programmed to print "Hello World" every three
> seconds. Nothing should have stopped it from doing that.

I am asking because the device says that it is bus powered.
That is, are we putting the device into some sleep state?

> That's my impression as well. I had a look at the available USB device
> quirks. Would USB_QUIRK_RESET_RESUME be the correct one in this case?
> Booting with "usbcore.quirks=04b4:0008:b" fixes the issue because
> autosuspend is disabled when this quirk is set. The description of that
> quirk ("device can't resume correctly so reset it instead") does
> however not really match the issue at hand and suggests that the device
> would still be put to sleep but reset on every wakeup. Is there a
> better fitting quirk available?

No. Theoretically we should make a new quirk for systems that keep
power across STR.

	Regards
		Oliver

