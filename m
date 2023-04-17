Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1B16E4477
	for <lists+linux-usb@lfdr.de>; Mon, 17 Apr 2023 11:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjDQJzx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Apr 2023 05:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjDQJzu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Apr 2023 05:55:50 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2356F10C6
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 02:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL3tpk68SIebEjE567OAyJLXYSOk9DReiZ3bFa+jSStz/xM+AQs39mCTSNLmCNenQNIbeHlY1AA3BVgRlq3SckcceIVuAGiclVz7c8adfpz8cS/OT7o69Y7nkqr5UoBU2z9G/GSPYKxcDj+DUSN++hMbnpFf2KFQuWIMTllmiFZqTJDsnlmaKqkY0AAxYXsCgE/TfQ3OyvW2LQdrRecIzRMka0WlDzS6YDncRmIQ+2DcjaZeB/8QpgnlPFp1Zk6gh88t8YqH9wCXBHslO5lkavvOwHx+n4GtrVKRKpQF9K/VE+UlvuqPLQ3mQkIh92BrpxzVVL8/TBJMDNLYrZJgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBwTbsS/MFDfb/r5n4rNEczHYa5XQB3nNUQqx9SpwGE=;
 b=n/KlhzvNc0DDRhguwfY2sxk1HXaaba79HXDT1CTQE52Bs6LJwsxj529fDYUpjBcwq7FnCgCZw7qnYIQiDx/ruIEP5cb7xu3aRGguAs6q5yGJmG5q/9c8r71+DOO0jIg0Mbcv9lOiv2qnpSuJl8NITwTMtsxO3S7ACDoV+RMUlzos+zixHqPfIiXUqxqcmmtt0nrGVCPbzethdhLDlU/5JHmVKup+x7ow7Q1HVaCkv02ROfAlZC8u0HPnbqcdXOhtZ/Vocn+Jp3RsVh8pIG9yIJGIi15CN+YzOI191I/7sDV+Jie+3+b1oCaYIMzQzdffRd78wVThIEhwxtju3Y7lCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBwTbsS/MFDfb/r5n4rNEczHYa5XQB3nNUQqx9SpwGE=;
 b=YfME9ybgG6VzGvK6J4+tbflQ70fXnptSqzCVxkDjTaYP2XvXdSPPUZc+NYk/7hRfn6XjOjc4DTW6mF0CMduV0qhwvcgAwGBph/d34sMJKqP82mEjT7EVY8yJts1VWhFeT5/ifpMWPLWAUaDL2bPhkazkGlbTGfPYyWHXw1RSe5+snasx2Ng7CRYuxWp0rboj5krCl5SOsdQlPdXYorRaVtRcoMsIS+jW/nPNNjQ6IK/n9138yiCrTWttkzldHEwJhk2Y3F9zmklMPcWm+B6d8JxiMrhv9zS1flnYo1hMD9fIv7zRk8RheteGmVDlzO6FITto9IM0B60+B+4SVHeN4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:50:42 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%8]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:50:36 +0000
Message-ID: <a0226d7b-c03a-5e45-4ecb-2748c25126a2@suse.com>
Date:   Mon, 17 Apr 2023 11:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] drivers: usb: wwan: treat any error as a fatal error
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, qianfanguijin@163.com
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, Alan Stern <stern@rowland.harvard.edu>
References: <20230414055306.8805-1-qianfanguijin@163.com>
 <ZDj6Vhv6XHUADSFQ@hovoldconsulting.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZDj6Vhv6XHUADSFQ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB8PR04MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b904943-6470-493c-8979-08db3f2931b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDgKNauLNQ7IsKWjwJ9tHAz6agqdgY1gtBITekPaaIA5RSEzZD/OzNpekn62/Owz07+B0839QkIij5cL20ZRcNN/GBSEQT1wso34pEeEH1U9XeW6z5WC7eraB37/k6ij+ZTQVwHVHRZ+CxLwbZZ4wygDzXgrGpcyPzTmFF3Ef6w5LTYfzSSUTMAdegUoBEHVs3FZ8R3pjAT9K2VbMqia/bFtE4bYO6zJjI5F3sC5gUDHNkkJAyH/+deo5yZrHBLwvFcbt0icllLrK7B+JzY0z80Ig/dV/FMt/VGgS8WSetDZcazYzT1xXNF9RbIfeGkKj70dW58CyEZib0+IT0syarYEuC4oSfoSM8qkxtUyvL25nMjewulMLIT+B6ekJslpEmsdoN9xn3dt8O95idgVFyXSx83sAYIXklxU2ZqcNu9BK2gktfmGhx4yKJmNHeekvHcOmXhiVI4z/aBU3YBoYVAYT5A9oABgBS3kJKg1xO3eEcUshvd09gB3wMwsDnHAB3kntCZ6iglb7I76mDdJFLN/37+3XIq6qdutv8kukTaVyNxOjZ34D8YMnv7tZi+jVZvWjULgwQIOOLvoXWToCVYsJ/3Av/GpjdZQi+7VvBP6QSObs27lYhmm+cFLKFE2NptbHT5S64BWZaKJZfZy6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(6506007)(186003)(53546011)(6512007)(38100700002)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnM0M1JwR3l0Wjl4SFBxY1RsN1YxdXg1UlE5MHk0cXB1N3JkeVp1VkV2N3F2?=
 =?utf-8?B?RmRvYW9yYStGSmR4V0lQV1RIZnROVUxvN2h2cWpVV3dZOHVES0lrTFFZdzF3?=
 =?utf-8?B?ZnNWYTVyMitWWmVxME5EK3RwSnBBT3RkblhzNXBJRXgvQXlXMDlqVW1mNzZr?=
 =?utf-8?B?Q2xrcEtMVzdiMHc3Ukt1aCtRcjQvb0paRk4ycHZsYzgxYXJYMXNTUW1wbTc0?=
 =?utf-8?B?WXBERVFsbmxteU5Id1dibHZ1Y0E3TlNKUnJzMytYbXdYMlJ5V1hSWXNMRnRU?=
 =?utf-8?B?VHJzeDRtWDhvVWRDandvTWVKekg3RmxpdTlPT0Z3bHY3ZEhMd1VVeTR1NjhC?=
 =?utf-8?B?K1dQNnJXWVMyeGtLakgrWWc2aWVONVZ4MkE0VFI0WlFUQ3VsZmFpZ3Q2QStH?=
 =?utf-8?B?ak81ZWNrWW1JR1hkRjBtbDNSSEhzNnhvSGRvT0ZWUDVzeWJLSkd4dndDM3ov?=
 =?utf-8?B?aENFekVtN2hmQlljQnFaNDVBMVMxUFJ5OXFsbG9GZThEcHlYQXUwYm5jcytj?=
 =?utf-8?B?QXY1VVBJNk4zcU1GS2g1ZUtDTTFBWFVsWTkrejU4cFRxaUxQaURCRWpqb3VR?=
 =?utf-8?B?Q2Z1eldLVDI2YzFaZkF1aXVMb1Q2aDh5M2ZCMng4R2pjNHQzZVFRZjROdUdS?=
 =?utf-8?B?dU8xYU81aUZVVW0xVk9HZStqcUNsZlJwalcyTERONk9vcXk5WmIvamV6QUN0?=
 =?utf-8?B?V0g4QVpVNTc1NllUM3lmRUVJVW1rNnBpUEhLaFRLM28vd3M2OXlhT2x3NXdm?=
 =?utf-8?B?OTl3UFBBeHc0Y1J6ZDBIK1gxSTVENjhqK2EwSk9ydG5YUmtBNG02clNwWEU0?=
 =?utf-8?B?OWc2ek0wK2VrTi9IaWlsUmdXZWpRUmk5MHkvbXVXWHBsT1pXNmN1WDVvYkJl?=
 =?utf-8?B?V1RESTdQMk9XeUVnam5Db3ljRG1iSFQ2Slh4V0xmeHZKMitrVXFPdzR2WXJr?=
 =?utf-8?B?TVRiSVlZd2VJbkRvNGZwajBIYmNsaGpPNEdhZE5nSGJ5Y29BVVJSR1JlVnBn?=
 =?utf-8?B?SXZRdDdUMzFYT0Z3S1pOeWF1MVdDSmVmRVFlRjRCbDZtQXo5aHVtZjVRRXNp?=
 =?utf-8?B?ZGRGNGZHSE1USWJDdEU5YWwza0hvUUF4cXRPZVVPb3p4enJOUkN5UitLL0ZY?=
 =?utf-8?B?SVF2SFhEZWVMeUg0dCsyL2ZlckhiNmdRVlROU1daWVJ3TXRXaGg5enpXWU03?=
 =?utf-8?B?SEV0QnVWcjFOcGJvelJhWW9JbEg0Y1VUSEl6bjFPZEZxZk1sSGlFblEvOU5s?=
 =?utf-8?B?MnM1MnJYVlptYXcvc1RlTitsWnhqc3lycHlReVBLLzFoZm5GMFFpR29PVjR5?=
 =?utf-8?B?VHJ0N3pnT3NySFYyczBvcjJlY0FER01DL3RXUTQrNURiL2JCZzNjUm12YUp4?=
 =?utf-8?B?ODlMa09XSTVEbndLc0I3Q0dRL0RZSzFaMW5KZ1BtaUlWcjlYVkpIcmIzOTJT?=
 =?utf-8?B?Uk9ENGlmbFdJb0szTXBCSG4xTnREYnlXbnBKdnA1MWlFMU8vTGVidXVJTEs5?=
 =?utf-8?B?YnJsWHlEeml5YkU0dWRkRnJFRkhqSHVaZ1FaMVNONElJWWRmaE82ckJHNHQ0?=
 =?utf-8?B?MDFYOTlQemYvaVBEbFh2QW41dUlPcUh5bVI1Y1AyRzJrRzFTWWt4dWtWVjVn?=
 =?utf-8?B?a0xqQzNGbFlWQVR2NjVVVGh6bzliOFI5OVU5WENJWnRuOFV2UDBQcGdVZ0hR?=
 =?utf-8?B?N0hSaEhmQjlrMG1UN2VoWkRReGg3MlFDa3FFTTRHcFJoN21QU2lkYUYxYXA3?=
 =?utf-8?B?SDk0UlVpRE84UlVwcVhLaEVuSG9YeGVySmFRY2RvS2FKRlVkTWtPZnQzSEVV?=
 =?utf-8?B?akZWNEUrZmR0dzlTYmhSWGRzVlFwZk9JbFh4Qmx1bEVYWno3cFMyc2N5L2pu?=
 =?utf-8?B?U1VWU1dQTUoxcVlZM3FYZ3VjaDF6ZTJXYlVSSThPdzFKR2EvSjh1RGo5VDVw?=
 =?utf-8?B?dlEwM1UvS0xLUTNaelN2Z1M4cjFpOVF3RTIxSTg2V2d4cHFRaXBGMDkwOTkv?=
 =?utf-8?B?bEU5aXdEMVFndEg2YWJOclBxS2ZsMXZpS0hrT2RuamFhMk9UZDJhclJpV213?=
 =?utf-8?B?N3A5MGVQTk1LMFYyaFJXMW9xY1YvN0RxN2NUbVFOdEdEdG40WTlFYXROdlBQ?=
 =?utf-8?B?KzRYV2I4OG5mNXkzMkNkeHZONjQ0UVJMZFdqaEZVa0lWd1BGejEyVHVGbGZn?=
 =?utf-8?Q?naFMkZIe1ha/cOGxtm8IJ4aQnZ41IXMcn+P5tQvTpzNY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b904943-6470-493c-8979-08db3f2931b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:50:36.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pifj9dgBoSPoVEbXpnUfzecKakROirKZ2SJW8eHHX0LwAn71IZ3zWnwzka2o17yItQJYw+nf37Va3zJz0fTwXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 14.04.23 09:01, Johan Hovold wrote:
> On Fri, Apr 14, 2023 at 01:53:06PM +0800, qianfanguijin@163.com wrote:
>> From: qianfan Zhao <qianfanguijin@163.com>
>>
>> Kernel print such flood message when the modem dead (the device is not
>> disconnected but it doesn't response anything):
>>
>> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
>> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
>> ...
>>
>> So treat any error that doesn't recognized as a fatal error and do not
>> resubmit again.
> 
> This could potentially break setups that are currently able to recover
> from intermittent errors.

Yes. The basic issue is that a physically disconnected device
produces the same errors as an intermittent failure for a short
time before the disconnection is detected.

Hence the correct way to handle this would be like usbhid does
with hid_io_error(), that is a delay before resubmitting
and eventually a device reset.

> Try adding the missing known fatal ones as you suggested in your other
> thread first.
> 
> There could still be an issue with -EPROTO (-71) error that would
> require some kind of back-off or limit, but that would need to be
> implemented in a more central place rather than in each and every usb
> driver (as has been discussed in the past).

Exactly. How would that look like conceptually?
A centralized work with a pool of URBs to be retried after a delay
and eventually a device reset?

Handling unbinding a driver would be tough, though.

	Regards
		Oliver
