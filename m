Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657436DFE0A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 20:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjDLSw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjDLSwz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 14:52:55 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E014EEC
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 11:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jx8tKXyHyuC9zwhkesing7/TVOuRGZdbmVRQAIsE+Id8ccyiz2j/z8G5WGwsGWQ6GnGR/FfX6v26UmOcc7Z44X4D+gBXU98YR3m3VTeL9lFz5VfiEjTdPireURhxxzGjunWKjA7EP4Vjm2r08dXHQ529U2Yyp1NxCbyUtTryEOTI+7mgZBT9b/hlzqppT6sRtElNZBMIXplhGQC9t9NvnB5IVyoxscsWjFgT7f5eUhgYp8ONPVXGD/MlAFpJDyLfOjJOam4Ql2NBf7n5QLV0tX6+jlwpRDNrLqlXcZ8NpQEDvfk51GhkgcHY4sGhKhOKafP3MI7NNC8pD4OvXeRK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvCy7aRNKOMeWMd8OjM5LJQEL1BUPVt7uPSZs4UJjQU=;
 b=fonMewNJN7Pf1w6VFetsI0KKQhDVRvTjli2i+WUsXUhFi22/EPu2lMcITez9Bm+b0oDOZR1GonM1to86VzV59wPWyfsMXF2L6E9q2AfJSmZdLsrj893JJZJ0gK8Ff0b6vCe33jKqCbVBLdpMNpPmsKZF9fbVIo+o2773pGjC/kxzb6XLugXZEOQNNNqg5FXzJJjMt/9NBuEiwNo5BGuX1sSVIjU3yoqHcGjIAgtPQsuhU+BQGMs7OAC5xa0u+2NJEKeEbYLanCmjKSYpjMjNXcUaU7cijkgPGJFpDQBkm+zBPyeXg6qbd7LoQuZLWZaUVlWSR6INVkSVbiipynEpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvCy7aRNKOMeWMd8OjM5LJQEL1BUPVt7uPSZs4UJjQU=;
 b=z7tCJVtDOd0qmMcqg9Q2FObkMmZqGVNVP7SffqRdZIYBld6PifZ9ncPA5MX3KqITUFO0u1Ghy44n3aemvlCE2CXtuwBijBsfEpOOGrWG8EJPcgXtlFqQz8yP1G+YmhKZ4fYSZjjRzx8Xn/QFBZIcqxsUFcnQuWfrXU/fSyElK5XGhMKsNmzQJWY543Z8ebqgBdY7vxT71Fal7t6iL1Ka8c9z7aqX31jvWCeoW2rda8IQ6rd/4craLXbzw+wq4Qx1eoBWw5fx441AxDrDZZpeSmgCHDrLxDs5EW6FlxREwcn4ZCIVC8nZVOqqAA/P19B0bzdK+fK+bcKzAas0BbRRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB7602.eurprd04.prod.outlook.com (2603:10a6:20b:2db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 18:52:49 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%8]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 18:52:48 +0000
Message-ID: <b62ca617-3684-0b59-953e-24aaa5de2978@suse.com>
Date:   Wed, 12 Apr 2023 20:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] USB: core: Add routines for endpoint checks in old
 drivers
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
 <f45ab17e-d66a-f64b-5dfa-ec292d311f52@suse.com>
 <847a4775-f900-44e7-871e-eddb850b0aab@rowland.harvard.edu>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <847a4775-f900-44e7-871e-eddb850b0aab@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abdc008-19b8-45c0-b7bc-08db3b871bda
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGHC0Y2P2THNVfTYK/w3H68w1I2twwM/wALuXznwWwZfpVX/Lq+RUaIwJjUHyzl3boOseHueer12QhiMXDCsHBEaJJOiMvm8jkiMUqACuwudiZCzJvBhZysiQ2ppCESuBO9xCnUJYddmGgAbKTg/YcYd2DSn+zKqJDiDhVeAdTWSOXm5GHsN6LKdB7Ufv10Tc/wlj5uoUoDZ7PHKaeGLqED26PxNUJbVKg0SMpw/FPqCsBMlXQZ4THDx6E6HL02ZQJ/NGvTkOE2e372s9MYGte4eCYY36ejhKk2aWxoktMbZ3OaXbR+02upIggNfFU7587s86AtNrFfRatw7lAQeN5O+i7w0aXFHChE17hg+54Bi6B7yXvGeiEuUkjsM8muvcEM/cl1QMEQMfXZdJs+RJAKF008oQZ5bvXsm946VnyMPD9MfZ4wlOOoChwed8W8e2hua1h+YiXSONgYjyqc/X4PzAPnSDkb/UxgaTLsYQR/aYUHhKC0SKV7HqiYYqAlbQChGNz5oV54+JdPtIrd8+TZ6i3UhFNR8VVibQ6HkxUae8FS8NGH5HjotgqPhc8RUpXqXIyS8U8A8Z5I4BQGI6kS9ZxZPGtr8byqrayZZvd0LEYH+6e7+SbPMpW3vdqaUcoNKxjc1AbJ8Qstecp1KsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(31686004)(186003)(38100700002)(31696002)(36756003)(66476007)(66556008)(4326008)(6666004)(316002)(110136005)(54906003)(6486002)(86362001)(478600001)(66946007)(41300700001)(8936002)(53546011)(6506007)(6512007)(5660300002)(8676002)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2h1ZkkySElhRjBYdzBoSGpRQ0JheUR4RWo4K2ljYWp4dFRjbnFQTW1rWGRY?=
 =?utf-8?B?ZVY0RlVRNU04eXVxZEpHNGkwVE1ZdEpaYzlzeEdvSzFra1R1a2JUQ0dpRmlO?=
 =?utf-8?B?QlUvbVV4S1FEb2UxMlhwUjFGcDJzN1NjZGVpcnVabm9LajR0ak4wbEVKbkFz?=
 =?utf-8?B?NkdhZXVxVHNUMFMya2J0dUFpQTloQlVBT1NnWUxIdWtjOUl6K2IxTU80Q0s0?=
 =?utf-8?B?enF4QXFwODUwc3RVeU5takw2VVhFc2JvYVp1YmlFVEszblVIbEEyTmJuZ1RJ?=
 =?utf-8?B?cUh3RjBISHZTQ1lYNE5CNnlWS3BwK0NNOEZSaG95Mk5vVmxyTmlUV1RsZUVu?=
 =?utf-8?B?M2ptY3crSTZ5UlBBaVRtZExrVldHdXNtVHJJL0t6djRZcE1oMHM3eCtZVkdo?=
 =?utf-8?B?Snl0UHNVeUhJRXhlMXQ2K0xiMDVMMDI2V0VWRjVYKzVQd2llS3FTK0U1WGF4?=
 =?utf-8?B?WEtHN1JwMERsSTFVWVJKcTlNbzJrWDB1MzBUNUdpZVEwbitEZDk5eSs2SW8v?=
 =?utf-8?B?bW56WHBrT1RtZzAzbVRoOGgxMG01emkwUjU3UXBzTHlJcFkxZjMzVEdZaDRw?=
 =?utf-8?B?M3RQOUsyeFJES0VSdE0vWExaa2JnNjIzbGlnTTdwUzE1TTJ4dzFsbnRJcUk3?=
 =?utf-8?B?cUxBSEZ1MU5Xd0tHbURCWWgrRHk3SFVoNWovdVR5WXNBOTJzeVYrUTFhamdT?=
 =?utf-8?B?Z1BvakowR3o2MHZmUlNEL0d1WUYzZExWR3ZuNXp5cG9GMVNkVjFFWG1mMW9H?=
 =?utf-8?B?SmVXd0phWnhLaTErb01LdHdNclVXazlIUlFpelNYcVk4RytHOWs0VmVmQVR3?=
 =?utf-8?B?alhSN0tVbGNxRkRpMEZ2THpQUm5acmM5ODhrTXdXKzlzUFBodXM5SkZhbmpP?=
 =?utf-8?B?aE5mdVI1ZlZCSkNPV09mU2hIYVQ3WjJ6NGg2bGxHZXd4OFpsZkRXZU5IbG4w?=
 =?utf-8?B?KzFlL09hOFZtY2t4dFJpbmRYMmYyQTJETENaRGxDTmozWUxvWHFnN28xaUwz?=
 =?utf-8?B?Z1ZVZ0RUaTJyTmZERXZ3eFZKU3VBNlMyMEhWVVJnMlN2SHZnSStCNXM5ZW8w?=
 =?utf-8?B?eHNjb3Z2NHIrWTV5cUF4cWZEMXM0Um9nTFhRZ0w3L0Z1eE5wV3QvSDZ2VHhN?=
 =?utf-8?B?QUk5cGFhVFQ0dWxyNGNoYXQ0Y01Zd2ZnTzhCZU42M0F3MWNIeXdNd20zMlJ2?=
 =?utf-8?B?WEtQSUM1WDJMRUVrSWxERU1YRFc4enAxTXR1QlU5REhVU0E4OUlDQmg3b3A3?=
 =?utf-8?B?dTBabXp4MXBuUEk3aGxycUFXT2I1Z1dBei9nZjNsWWtrWnZiSitJbERNNzMv?=
 =?utf-8?B?eEMyRVladWxEZzJ0c3NjdUlMTjVtU24zSDE5eGpmTXZmV3dBNFQxdlI4MTlJ?=
 =?utf-8?B?Wnlld25tZ21BT2NnblJLMkcwdUhoUTZLRUJGd1pHNy8vMnB0ejNxeHM1Qm1E?=
 =?utf-8?B?T1BJMnNuclJjMHUrVmZMVWNLMGdWWXZ0VjFsNUxoT29ZQXdENWdVYTFxVk0x?=
 =?utf-8?B?YUF4R2o4YS90MXNPM3ZmdVZxMDlCc2luWldzOXhqZU1Ec3Q4dXZCZnFJL3JY?=
 =?utf-8?B?NEtLREJQSUU0TElVZkpjbk54eWlJQmIzNTNaaHdkcCtUZFNDWExNSDJpcUtE?=
 =?utf-8?B?d2cweUpwamQreitrd2lrNlE5VEl4UlZZWERUUk5yd2FYc05vSzVOZWpBaUdM?=
 =?utf-8?B?ajJDNFlXaVkycTM5bmhvcXg3Rkd5dUJpOGQ4VVVGODNqdHVpQmlOUXJuNHg4?=
 =?utf-8?B?eVBoQ0xVR3dxaThUM0wyRE51MXJUbXVkSk54RGMvVWZ3LzBSY1NFcldyMEFk?=
 =?utf-8?B?aHVQN3V2Q1VkRTJQZVRTMExsUVJDSXlQTVJVSU5LK3NpWXVUVGNhaGhDeG43?=
 =?utf-8?B?WjJydEVlcG1GanFDSndjQ1o4QUJCZ21YTE1VMG1NcnZGdXl6OG81YW5BdmRS?=
 =?utf-8?B?UjVZWTNJSkRHblBiT2xDa2x5SmRCRGRJMkQ2UXhsUmpzZi83NkdubEE0d1Aw?=
 =?utf-8?B?VzV6ZUJvS0pvNkhaK1dvMENqVWM4Y0Zjc1UyWkoxcVY4RVlpUVF4OGl5bFdB?=
 =?utf-8?B?WUJXZmVBYi9rdkZPU004b0lwWU10YmIvckNRZm8vWTVEZ3dNN0E4SnhzUXlw?=
 =?utf-8?B?OHJpZkx4MTg1ZWp4ZXRiTWNLYWJaN1hJVEdYK3NuUEl2T2JXb3dZbkw3NkJ4?=
 =?utf-8?Q?S5zs3KT3g7YCcgH/0nR8SPGZ0rmLco7ZaqdH/Cnuak5D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abdc008-19b8-45c0-b7bc-08db3b871bda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 18:52:48.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGpPgYWPeB/H7ToU7tPvZigCPBZvdcBCQUplNcCFSb24iZi+s+jRpKSOUSGvlPGrbl9/ZPomf/MS7GUZ76HVKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7602
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12.04.23 17:08, Alan Stern wrote:
> On Wed, Apr 12, 2023 at 01:54:12PM +0200, Oliver Neukum wrote:

>> these will do the job. Yet this strikes me as unelegant. That is
>> if you define a data structure to match against, why not
>> add a pointer to it to struct usb_device_id and use that?
> 
> Struct usb_device_id doesn't seem like the right place.  Struct

Conceptually it belongs there. It describes a device, not a driver.
I would say that the name is not well chosen, but it is the right place.

> usb_driver would be more appropriate.  The drivers that need this have
> only one entry in their match table, which means that drivers with large

Why would that be the case? As far as I can see everything that is not
a class driver will need this or an equivalent and many of them
support multiple types of devices.

> match tables (which would require a lot of extra space for the new
> pointers) don't need it.

A few dozen bytes.

> True, the checks could be centralized in usb_probe_interface().  What do
> you think about doing it that way?

That really is the best place to put the code for checking.
And you might put into a comment that the way USB works the endpoint
number includes the direction. It is not obvious to a casual reader.

	Regards
		Oliver

