Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 192136DF454
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 13:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjDLLyq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 07:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjDLLyo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 07:54:44 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EB38682
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 04:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obOcaV4w3/wofSpqsI4B092nUo5/VGfkF9mOWqcKdG/MZus1Od0bOh1pTtBTQOLlRDkT/Z3vqjTyh6EiMAVuwFlf7eDlifwxMSSpcVb2ckYel3lYbhzEZ1Hv7M8Mcbo7G46pIW28SVAZKKENVJ9wl5gzsK/bOHg5D8WVC8hwExmWgbhtSpj7/mxqBTfhe6Sl47yqHy35gHQzk0ae0AHFzKBK+5AmVQ0kFpKgtyTW7z7MARwZLb7flv5f3Kf02etu3RgOVUrJA97ICtu0KOdZthGN9EefE6Xz6dsE+AOuC+5/qB/SLMMFpKDc8vqLxiRuAlBJ7whO3LhdmQi8VQivFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6LmLpe9xkqejj10Z89hDLeWyy33jhhv23/ahtSxGMc=;
 b=cNXv3aJ8F3xa/UacuZjFrL7uCBoZbXKLxSvqDX4kFmm/swE7mLszSVm6iCmP/kuoYVaSNAhSOGFaDzk5uCZro3DD2SBefxCU+5m/7lcibEDBtuuxc8VphpUjuXGgpXM9q7CA/9BTs6oAaxYo0Y5IFJb0TSSdoTUgZM3e/d0xHgn7qr/ypxqQczNoG9a11LfpiGRDdx15Ztk6B7PNYleWmbhMsDVlf8O1k4ZfQNPJfRMZzVNsNUHDf8HAL1D9rxZUTO9liY0YFneDZ0fM3ZmoWUiJlhFTrgm6MqvFfCCMsCWKXGKxXl7CkmsI8BEzgSs21bcLQi0lqM6nwd5lhyrMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6LmLpe9xkqejj10Z89hDLeWyy33jhhv23/ahtSxGMc=;
 b=CutAxK8kAyESezRFBLxdcl8YSHIwjSwsKr+RTkogskYKw7pmL3zCvVqdGiRDXlGiwsUTrsivsbm7BkiKGtDLbci8Gt7x3ZQRTJQ+2XL0zWg2nz2YTf0PNLmtpS4RkU9jDR90qAsXx5Q/9eOT4dXeUMvUBPIs4V0pWBhRlahB9XI1dumO48VTtHq46uDHGWNOpXVrFPYy0Zef0Gtfan1f+IbWY5bm3oFOaw+TqInpsw0lJ+xbwklRFOw28eHER12A/+kiuauI2WKyBJrtjh0FY0FrPEYYA/aQALa0joAG2OvGgE6DBCaX7tipgWBAM8fsswmF288RxSCh4U1jPjVAFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 11:54:15 +0000
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::ad2b:14a0:1f4f:b497]) by DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::ad2b:14a0:1f4f:b497%4]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 11:54:15 +0000
Message-ID: <f45ab17e-d66a-f64b-5dfa-ec292d311f52@suse.com>
Date:   Wed, 12 Apr 2023 13:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] USB: core: Add routines for endpoint checks in old
 drivers
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To DB8PR04MB7097.eurprd04.prod.outlook.com
 (2603:10a6:10:12a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7097:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 338dd1ad-c6cd-4ded-b343-08db3b4ca378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiqSYxFWHEEXEE+EbEWlaqqNGfxArTofhmIA4nN5jTlN2W0/fVn8aZtotz5FPR82sDtuavfWE2kPM0anbz23ZAqnvtIlm+/ISj4BqAj8aDY6AFylPAaVF8wTLl5AFRS6RSDo1Yu4JvSyqyzfHCIU0znzU9sgb9cM9B0DiffZ/F7GmXk4rkx7ocE8m77SgLRJI81Y4++1cdwHuwbbDQsvB5DQFM6UBeAvW+AFguZnCBpjjyac4N3OpR+To1cX8NHeJp8077Lw90ljZ1bKkiZpFkTk2KeHziiJGPjdXYUkTEA4xdktg1TOP6dJTFt1gIKUat9kdOJg7I/QnYX4DdZUlZoIyciyIYGg+/ChmPABTTG258fz13+3KSfGtBb9mKFV8KQnXD/KNuBiTHhxCunmlGAdyDuvzwLzP/K0qIMsDvwjqn2nOLBnL/Jsd1uC4ib/ESnn/v/bkhmppj527f7zziQpdgonk5EPCCHAcvMVaab9wW6AyVCLWb0P/oKHwNf6bfPR7m9FyHwmf57rPJPgi8VXwYYcV0C44pCmtGh+vJEuh7DnKogse6uDQ/UI5RBisA0y9dFkuf/3X9k2ZKlT4oCnLy7gv74WwP7FG2sAgL6WGAyUre+5GVDHk67txDUckGhJjFDGU1HeMCTpkIYyew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7097.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(110136005)(86362001)(478600001)(316002)(41300700001)(38100700002)(8676002)(8936002)(5660300002)(4326008)(66946007)(66476007)(66556008)(31696002)(53546011)(36756003)(6506007)(6512007)(31686004)(186003)(6666004)(2906002)(83380400001)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRHYXJtd0lXMEh3SjRGNU11dTFpVnNXdHpxeEdXUldXY1orQURWVFgzbnJ0?=
 =?utf-8?B?STEvdXVteHJ1aEh3bGJtbGNuQjZ2Zi9aZE1WZWl4Tmp3TTVRb2NUYVExUlpK?=
 =?utf-8?B?ekh5T1c1cUxrNUJmZE00MGR4ZG9LNStFb1lUamtZVnEwYnYvYkU3YTUxcnhO?=
 =?utf-8?B?R1ZLbVdRYUgvNy9HTExjemtQWEIrOFRXaG1UY2F0S3dhK0xRSjkrUGpoNEtR?=
 =?utf-8?B?WFRuVVFJS3QrWU4rN24zVVhTWFd6dmlkOTEwRFNRSTJmNS9OU2ROVUlPT05Y?=
 =?utf-8?B?bk9aT0tGMDdmTmNDNFNwRTk2c0dPWVJ0azdBMkFKdWx1UHp6M0o4ZDVzMTFq?=
 =?utf-8?B?V0c3T0l6M0lXRndWOXlxYU5wVXI3dGorQWJBRXdWanpsMkFhNVowcUNqeXkz?=
 =?utf-8?B?aHl1MFA4WFgxZTJHa0Nncm16U3k3SjllVk1KOGVqTW5aTTlFOEdSZXhCaFF1?=
 =?utf-8?B?Z3ZNbWRQVXdqb0xsZXFDY0IxU2FZVnpNMzY0K3g1bkE3MDJ6S0xDSzVXWTlq?=
 =?utf-8?B?eVVLT29OK3Q3akc5MFpBSFFuNE85UkxWSjM5WHRtRkY1UU9TUkVNWFV4enRN?=
 =?utf-8?B?a0QrQko1MU5WeU5VakhyTlZERmY4OXVPdXg0bjRZN0ZjWXVScDd0TmloWjhZ?=
 =?utf-8?B?VE8rZWpZTGVEUEc4dkI5Z3lZQlBxaHRybkFzYVF3TVJSWEVqdnpCNUd3Ynl6?=
 =?utf-8?B?TkdueXlOa3VaTTMzd0d3anR1dmhTbjhCQUQ3cDVqeUN6YzhEUWNYVWlWdEpE?=
 =?utf-8?B?N3BJaUVYQ0dSakpUcXplbUxncVRSSjQ2VDArK09hemcrUjdWeXpKMFl0c0g4?=
 =?utf-8?B?NjNjTkFGUkk4Nmg1dCtEb0hTVFBZQmF3MDB5ZnhyYllwb2hXSFJpUytPSDNh?=
 =?utf-8?B?bnM5eHVuYS8xS1YwN3Z2VWxsc3NxeHhPdXVHalhXTUJ6SUhDZWJsYk41OUpu?=
 =?utf-8?B?eXdoRVpGd1dnK295M3ZPemdMVFQwMDZBLy9DUnJoWE9yWHFqb2JBYUoxSGR5?=
 =?utf-8?B?ZmR2c1ZvT2wycmt6WHlWbHhxOUQ4dG5MTWY1MGMvd2xmS2I3T0w4SlllWlJ5?=
 =?utf-8?B?ZHJ6dHJ4RTZoUWxoZExoRzdUYVVud0dEdFNrMVRnYjhjZG11OHJRa296MUVW?=
 =?utf-8?B?bjFjUEVhb0hHVHhZME9CdjFSN2U1REo2R2VrbTJrSTdVaE5pQTdPb1NObWFB?=
 =?utf-8?B?eEUzWVJqNEE3NGtzbEdpRFBYa3ZBM3Fybjdrd0hnRG1KVlVOYWl3TkdxU2Jj?=
 =?utf-8?B?aVowUGkxemc0SHVzdUxtM2xuV1JFT2ZvcG95MGdGMkFaN2lMZjNVd2NDS3Bl?=
 =?utf-8?B?NEM2cGNKbFVVMzZyb2FtTjl1LzNERXg3blVMa2p2VGVUeHlkYUFzaUV5NENm?=
 =?utf-8?B?SXI0RjcraTQwL0YvZnc0K3hXVkZ5V3Z6R1pKeld5SnZSWHkwMFpUVG8wMThi?=
 =?utf-8?B?c2NJWWtXcFRKTWUvM0V5WTdkZ0IxN05Mb1NFd2daaE9BTm05d1hzTENrZWJr?=
 =?utf-8?B?ZHRHYjVlMU56Q3FseEpUTjRvNG96VWlGYk9JdkZFUjFFazF6TlFkMm9kTzhr?=
 =?utf-8?B?bXZOTXFHVGh5dWg2Mk9hZ05SVjlXZDNZcW54SWJXbGxmdkFmUE5kYWprb1BL?=
 =?utf-8?B?QWVLM3VDS25KSTBodzlHQ2pISnZPKzZEakdHZHFxVjdrYXdMd0ZBZ0JVOTFu?=
 =?utf-8?B?TTZHOHpTLzB1dEVRaTVsdlZrNHR1eDNYS1FMNEZwOFZyejN4QktoME94eldH?=
 =?utf-8?B?MUhrRDBSWHhFYVkvdldLUm96NXhidlBzVUVtcEF2eTc3c24vWFhBcnZRcGpQ?=
 =?utf-8?B?NkIyKzBhUWxoTmpBNU0ydTZEU0dSSEFUdm95NlUxUGhYSjQ2RjgrK2RUNmpU?=
 =?utf-8?B?bjNneGNqVlE0blZZMytiV0VleTl4MUVRbHBvMXFQTE5PRllNaTArdzY4ZWdy?=
 =?utf-8?B?bi9wTDVNMU9MUjFsWVVmeHlZT2V4WHF3SEQ3V2p2TGt0WWNrUEZ5aWk1cFcy?=
 =?utf-8?B?bXpXUUJjZ0s0ak5FYmNZcTA2bTdUMFdZTjNLbkQ3SkVxYStPbm5hR1JiYlIy?=
 =?utf-8?B?d05tZ3kzVlZ1bzExeU4xeFREb05CRkVYblBNa01hRWtmaENEdUFENFI1VElM?=
 =?utf-8?B?d2dXVHhZeGVOd2VnTmJ0N1hFT2NOOTU3eVJIRHdVQnFERFFSVnBXbkowNFpJ?=
 =?utf-8?Q?UnDjjoh2AYflJtjnO/G5mb4uqZASLkWy7Kg/hq457Gg7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338dd1ad-c6cd-4ded-b343-08db3b4ca378
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7097.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:54:15.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HY5rv6NLZCfl5ZX8LMFgliyKzsiofk72Vg/sV3ldUy8aESzNI6x1cCnMhKcVY3WEnbCzp1xpzoPeu8rB7lCa3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.04.23 21:37, Alan Stern wrote:

Hi,
  
> To make this checking as simple as possible, we now add a couple of
> utility routines to the USB core.  usb_check_bulk_endpoints() and
> usb_check_int_endpoints() take an interface pointer together with a
> list of endpoint addresses (numbers and directions).  They check that
> the interface's current alternate setting includes endpoints with
> those addresses and that each of these endpoints has the right type:
> bulk or interrupt, respectively.
> 
> Although we already have usb_find_common_endpoints() and related
> routines meant for a similar purpose, they are not well suited for
> this kind of checking.  Those routines find endpoints of various
> kinds, but only one (either the first or the last) of each kind, and
> they don't verify that the endpoints' addresses agree with what the
> caller expects.

these will do the job. Yet this strikes me as unelegant. That is
if you define a data structure to match against, why not
add a pointer to it to struct usb_device_id and use that?

Basically the table of endpoints you are creating is a description of
a device. Why add code for checking it to each probe() method
that needs it?

	Regards
		Oliver
