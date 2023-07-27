Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3975E765BDE
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 21:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjG0TGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 15:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjG0TGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 15:06:34 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887652113
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jcr1rf5+xhq9CVyD9NWgW17SvzYFtiICziVIWDJrJBPB6PSGf2WpAIaHSiptvZhIYyrzRMMVedgmKtu6OMoWjoQ2hq3+G5Yy6a+nJaqRDMH+uUcNXkeUOaerml3iTrKHGqm5zQTGRvi9dmwLO5+k5tA8AFTOlvFvwJMlT1bSHCTV7KSdIozqCxHYL8sPKHsrcEEihdcCdzGX4s3kv3ziqZ94Cd/vKBMGGynafNHW7WAAOVKl8iErg3PlYgWUwzh5DkXL0Rkwq6IoE9BpK6yi9gnZSaiA1QkIQ/85vsK6uKxztqXHBpmVNNcfgdd0FA31DojgDKdXbTF7p21XJqPOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1pXJUnT/E8jQyl3SWHyvD7v1ZKFPYC3MJEPc5gka2Q=;
 b=Y4iyXeJ1Wxb19dgt42DfiNXtzoHBsGI2G/9+nybGwznSSj/c5udOMkJor5gnJjld/HgQKdHyBDhW7IqBw2E5LbDTqozt2DXrdQc3hll26F5nsHsBmkLsCkG0ow5L7WpLWw234OwTkpAWc0qE20n16qorgLNAjgzF4c2uAQydFsEgCUxYD13y5OB0chcvQBIu4Qa4IjlHXKjnTsDholAkeaVPN1h6S7uyAX3AC0aQYD4o3bpbHeK7Y5ufDX+ZB7BCTeAsU+OMAnL3jfozmtzQApBAljwWC3HDOB38P5e5zM7AZDW5+lHYi6BWz0V/G69pp0Rdd9XIobcCjwufnKUOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1pXJUnT/E8jQyl3SWHyvD7v1ZKFPYC3MJEPc5gka2Q=;
 b=EAy8t8ygk1XoqyhKxHHSJxqL0fIInutbO6Njr9ECi/GYpYO2Xw1vkvzBqv/I4+IcYYi+OO4HLP7xo+L8oZNsbMpLy59CfNIZeAPzo8qOPSfoEgV8++zIxnxJUMopYq0zs4FCYbfLa5ayVdegNI87PsVyk9xM06qOmA/RTqRSsUtkqIQmtB6e888ehg2kvaHX7Tf6JZ5MLdIzIZcquJ/0JzNxuvLqjCpdV/eHsA8HvjgpX4pwirwVHyOH0D1pJ0iLj/UZwe4k4I0WzzpdFGWG/AiZhudWm43SKou+wCvJdIFSkplgenWOd6a2CvNxsGtcItlIPxjqzx6fV1ulkI9PYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 19:06:30 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 19:06:30 +0000
Message-ID: <0294d6ea-5690-ba62-01b1-90e8a821061a@suse.com>
Date:   Thu, 27 Jul 2023 21:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Something is really broken for Logitech webcams
To:     marco@zatta.me, Oliver Neukum <oneukum@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
 <42deca715b9860e7dfa5d9a78befcd01bd122910@zatta.me>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <42deca715b9860e7dfa5d9a78befcd01bd122910@zatta.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7f0939-2e32-41dd-c854-08db8ed495b9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4jZ4LBYvfEg8WMYMQ+A2ns2GHlwMRiPq5M2DvS616PaVoJ0QAfBS1emHRLsOjG+CbCVdpkvzLwJXBoXwIRYzXk8jz5Us6KtOtLp6ZYjDiLG3kk628YbWik8Cj+J7lrtzoOgAoJH9uRX9Y6uksRGlIG6UsTmsfwtcoGX8vUK2pPsNLIaQPywyTLCwbxe4T1MgMYrwEUcM9zdaEfr4mTswnA6oM5b8fiDgg527N3XiUV0DoAdX+i6NhjUGk0iKBmy6rAVp7cJsEC8Ue1K6gz2nxcpvu9lUjC57fGa8bqMU+U1IfK5HAZU3sRZusr//c1a0OBzFbobiZDeYSKKyyqCQ5/N8na6ND8kG1wwZeUczA7IwFPJqDhLMNyd2J9BzY2GBW5TSHpnmU3oxIpt/rNNQIB6Fv00n+T77aS6yP3F3X6H0KZ1l27g8o8T3WsNv+vcySo2NQsqjQ1Cb5BXcRSuSNPS6T8w2k/kE3SFP+Id3sk+7nbydDiFdF10PfOiKqnI3AY4x4DcsqILjalIToNI6kbF+EhpRZufvmOZWLz/uNnFvmmo9inRbBPN3oAXhhG+pj9CrgvqK78KF2asHt7orbZpSIzrvFwLfxVPFNhj3ov2y0ozSIO2Xtt8/3JBj1Wm1teCJ0nDJz8JKTmTCQS0fKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(6506007)(53546011)(478600001)(6666004)(6512007)(6486002)(8936002)(83380400001)(66574015)(8676002)(5660300002)(2906002)(4744005)(2616005)(41300700001)(316002)(86362001)(31696002)(31686004)(38100700002)(36756003)(186003)(110136005)(66556008)(66946007)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRkcUhmN3dRK25oWkd4ZUtURGJvUnBLdEFDNEl5cVRlblM0SDdpSVNWRld3?=
 =?utf-8?B?V1Y3UlhQMTdIY0VCTjI3ZjBvai9TVVVHYmFrK2hqY1g4TUNvUmY2Nzl5YTJy?=
 =?utf-8?B?cDdVOW80Q2t2ZDdnZDdkUjFmVUNtV1ZSMDhQdG8rWmlKUDhLbWtnQmY5UEE5?=
 =?utf-8?B?YUNVai9aR3lubGcxdkNYb1NlazVGdnZLZlA5dWsxc1FuREtTTkl4Nk5NNGg1?=
 =?utf-8?B?Y2FaaDNkY0xkUDZMQjJ3ZkhhYm0yK3FSQUJMUGJIK2VFSTlGcThrd0xVUFNP?=
 =?utf-8?B?Y3ZaVnlrNnNGU08ySis5UituSkN4bW9uSXJiZ0kyc1ZEbDBLQzJydWFEeUNK?=
 =?utf-8?B?dWtQQXJxUVREakJyOUUzRmljR2lpVlJWeVRqN1JrOEVGSUlvWVJ1bG81QW9K?=
 =?utf-8?B?NWo5M2FjVDFseHNKcjhXSzFKblQrekk4dVExOGpGazR5ZlZ1N3RybkhhTDhh?=
 =?utf-8?B?cllNZ0tINm9RbSsvTmUwZyt3a2V5SjZlSXNFTWcwZGk2REtQUU1ndnBrWUh3?=
 =?utf-8?B?VTJGVlR5MlBDcjRtelNDTkZhZU9RYm1KdkZmT2E5Y05TMXhBMVFnYVZTWCtT?=
 =?utf-8?B?S3owSVhDbnRhYkpwSnQ3NGxiWEVmaU94byt0aUVCdUt5YzNLZkFWZ2p6b3ll?=
 =?utf-8?B?cHgrR29xQnFGOWJuV2ZmSVNDd0hTakNwVHZja0pjMDdsdkN4Z1RjZ0N4dFlk?=
 =?utf-8?B?bVNIb01lNk5WQkRPb3RvSVBOTE41VmxpMkRCZVQrbU5OSXFreHRpZjlhS1RK?=
 =?utf-8?B?eHhEZUc5VGM3VkJXdW4vaFZCZ2hSYVNCbzJMbzBoUWhPaVBWdzBXRTh2eTRL?=
 =?utf-8?B?UXNiUG45UktHSDkrelNocHZLRXJ6dzlRWWxnWi9UYTRSblR0QnVWVFg0aUxX?=
 =?utf-8?B?ZVdsbEwwQWJzVHRtZk1mdFVYWkdGS0o2S1VpcEd5L1FnQUtaR2FVNEJ5QVU5?=
 =?utf-8?B?UWszVUFQNlFrME5SR1JmNHVoLzNhZG1jbHl3RDFRejlIUHMwNHYrTnl1Ym9r?=
 =?utf-8?B?UWRoQStneXdpOEptbjZyWlAvOVJHVXNEVTE0VFRydDZzSzZCSHJiOTN0UlZB?=
 =?utf-8?B?RUI0K2E2cW5QNTBmblRKV1FiM1RCNWNMdnNWWEVzcnRhTEoxZlBVOHBKTVBI?=
 =?utf-8?B?bjJZRHhERmZZNVJPbkRjU3ZsRzNVZTJmNStyT0g2Qk1WSGpnT3BaMjRhOExp?=
 =?utf-8?B?aEJNM0lScVRRc1pnWm5sRERNdFJpN1YxbXVLRDR2d1VtdHV5ZEhUL1MwM0R5?=
 =?utf-8?B?N05rbTNCUUhPZlhYVFdkaExMbGFQc1lYOE0yYTBSU0xlMnQvdGlNOE1qQk1W?=
 =?utf-8?B?ZFcvSi8rMUFIZVpnMTIxZ3h1TGdhRENlSXZqVnRxUDNjMzhoT1pNWXlHSWhF?=
 =?utf-8?B?L3YwMFFXVncxOEt5eTRyQkI0VlRQczBzZWVVQmJvVXVIVXlTQ1Z1REFTeFBC?=
 =?utf-8?B?YTVWZ0pMTGxyU28zTDd0NloxWXUwNnAvYThqc0ZpYXhEWCtmV1NycG9VTGQy?=
 =?utf-8?B?bTB3TE5rVlViOVdmMU83MEFIWXo3ZEV0STJnRDg5cDcrQW9Ib2EwQkNoNjlF?=
 =?utf-8?B?MjJtMnBURkR0ZXFIdXVhSkNjaUtTWlUzU1Q1RDhHd3hYQTJTVkNpMFl0K2pK?=
 =?utf-8?B?MHBuT05tSjVlMkdHUUZZclBJVmtkSGFVOXdUUjhINEUyaGorUmJGY0FnWW12?=
 =?utf-8?B?Rmo5VXdpR2l2WVJCcStiOU9uZHFyeUIrQnRZblNJaThnSVN3aEFMamhYUENS?=
 =?utf-8?B?UUI0c2E0SjFPY1JpT2sybU0zUzdnN2ozakJyMU9kVjZ3V2FseUdoTG5PeHZ6?=
 =?utf-8?B?Z3hBbkVtR0M2aDFtOWJvZGRBMm1UZFVSemdIYlRyanVRTkZGNFdOZEtuenp6?=
 =?utf-8?B?Ync3VXZJT2V2aERzQlc2ZS9uei93YVlYMzdGOTZncEFXbDBGOFVlSm5hTW0r?=
 =?utf-8?B?a3pQeEp6dUQyS2tPZFBJNEZvVXVHOHRuYVJlTnBxWEh1OGZEZjlHakg4S01k?=
 =?utf-8?B?amI0R2c0V09uNjR1M3Bzc1J6dVBRa250ZG9pakxIQy9rWmZYWnYxMDNPbVBp?=
 =?utf-8?B?WDE0RThOOUI1VU5wdzJEU0FibTBZSXdEUUpNcDNCS1ltRW5jU0hiVlIza1Y5?=
 =?utf-8?B?UXdkaGl3ejRFQmI0c3EzZk95RnFPUWRrU0c3SjJsYzZEZldxL2d5N2lFSGNV?=
 =?utf-8?Q?AO+s5moQboWYUkOrVUeQqjE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f0939-2e32-41dd-c854-08db8ed495b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 19:06:30.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR2Qv89Z1muOws+Lp0W3lWcr+p99dHQJX3gFInrpCikPNnb8WlhvBL+5Ik38GYiiE+SmzIWUf5vGrE2Z5Lj24g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 27.07.23 19:40, marco@zatta.me wrote:
> July 27, 2023 at 1:48 PM, "Oliver Neukum" <oneukum@suse.com> wrote:
> 
> 
>>
>> And Marco specifically, did you make your patch based on a bisection?
>>
> 
> No, I just reverted an old commit that removed that webcam from the quirks list.

But you have good evidence that this has fixed the issue?
That is the problem was not so rare they extreme luck may have
been the explanation?

I am asking because something here really does not make sense.

	Regards
		Oliver

