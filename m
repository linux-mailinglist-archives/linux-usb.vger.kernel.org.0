Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34562752431
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 15:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjGMNtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jul 2023 09:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjGMNtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 09:49:40 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::615])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B971995
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 06:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlvuKJKeIjAC/W2aj5/B2dERajApGRa7aFDscCVC2bSIzD/Lwa3WwQi9+Aqb7Bb4Uwpej8mJOXvRejBYkdnpYyY5iRDaZO9g581mjAl9P28VmXWVCwBEavpJqsXsCGKy0jGpZmCsh9MT2jXeY5fwaIlSroXZh11mWFB4gxB+i4wN7feDR/dT7eVjx/5ZbZfPEO4yUUPLxcz1+g2/Zw1lzXr30mpw9aP8ubU7yTdTdH5vDYXGuHtDyZAoGWyu2aJzDYsd8DWwrjYgg1wOG8yw1cFMekGV1WsqklHlphaCb/bCpAz1K1cK/dmtybJQA8rsps7WB7tI2QVW1FRGLcumtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHwBQNKZAI22aHg7XT8a1BkVq+LKiHb0T350XhkrBgM=;
 b=fYL3yA2WLrGiwVy1DhLRwIVN+gweBEkYHDG2xiRUsYdWdterqTzokqTJ3Ll+5i4T7r77M+6q7ayqZU2PxnU+zc9Mf7gcn0pAtH0KPttBb5gRtt65iwqGLf+QcT345RvpnoO4r6OFJnZ39nzpDzdyjSSkkvMA3IFVwtDr6oAy2izemgW0w7Ye0z0+IRG05HKyk57XuiDS9W190Lu1FWjx2WJHo4haEZvVDq+gdHHTIz52Bo6tsktGJU+u2+76P0B0B5B3dvLId24vLO3k1M1MjHJPHL0lbTjPDZ7+jfjrkwefImC7OQmEKImYOoi7JF41+nCKB40qPyPHR6QVIbT06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHwBQNKZAI22aHg7XT8a1BkVq+LKiHb0T350XhkrBgM=;
 b=EhNSFQSgL+CHayPkZ1jpNYtrEtr00l8tSU8M2LY04i7OyAaaGndOPGjYzUJS/5y5cESL9474DaiUw1JchORNPVkM74ESIOY6j812Xu27wtezhe9AlpJiVs/M8wa8RsbL5Tr9Gztgs3cEsWSxTDmOj/Lik+Nx4g5NK/Ab2JWgfa//izv3/1BuVedy1fyNpC6sU6I2PFRKUXMbOBDVQvpoUpvGgfTIuNeuWSetTQN6mKnaq5Rt4JhZmz62h38D0uPo4WCSB0LImMQyJt0LbHIz3ST8k+HT8n0MeKkV3OWTJ8p1upQItAKuWCzwSWApRDFGoiv0J4eOBoszMMFtxbfykA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 13:49:35 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%7]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 13:49:34 +0000
Message-ID: <50eeac98-f790-4532-d067-b9da6e925e30@suse.com>
Date:   Thu, 13 Jul 2023 15:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: question on uapi
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <dfb234d2-9ee0-313f-d1a2-16c3767ccab6@suse.com>
 <2023071349-lunar-slate-1339@gregkh>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2023071349-lunar-slate-1339@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc5cd3d-1592-407f-5f46-08db83a7fdce
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RB9PtJTjtEM3MZcoq/W8WrcOxZRPRAkiZBvIPV6d3YXadJqoNfedR1yDd5q82VQsbZQzvYJ5UJCmwMjKd6q+7+DFzt/WrwQHiCSS+nsQQJIDfqPVFaqkpKCnndIBylyFWDFlFXKLsk4XltJevkPbkrJiRYszWcG+izPSotTxoHIWkUXRHu5vYKKl45mmQbLA8pRuGuBbJ8Y83+MsQMGPMBCUu2xu4AwrfYPH8qis5z1kVTrlRvJdanBFSYeMyPu3Gokw8vOcxJJg9e6zoRYS1QJ0/KCOQcmUM+UFfPits8L2vgZq5pW+eTmRfv61czZfQy+CFUH2yF4SvvW1N4uMt/jQpesRD07JojU2olVbWMzPV6/AHMWK06zz8rOK33UAlkGVFkl3gO4subytOKXnAKYhWPRBtkItyKQpwH2fXQTEf4n5BRs1yOGDx1DHHU3GXZem/iOuIEjQGOnhgNuNgaZw5vAgerGo4J275VzME13EvdBeH6YVJTaUVR+R02kenaNOi3wlz/rWvB0LS0gmuDOOk58hi5Wzhe+/TjB54eZFhMmr5F/6dWtdAZ28hZdKoIO7UUuqz9k/nlD8k9KdwTS80eNwHYGVjYoPvv9zx4dyYPp7Oi+LrnHqjr8XGN9MpmSjZGQ8nvjUvZHyyh/Xow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(4326008)(66946007)(66476007)(66556008)(3480700007)(6512007)(6486002)(110136005)(478600001)(36756003)(186003)(2616005)(86362001)(6506007)(53546011)(31696002)(38100700002)(4744005)(41300700001)(31686004)(5660300002)(7116003)(8936002)(316002)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJmS2RJOTVSbWFnNStYNHBoSWlWWDFNSjYyOVV2VWVWR1l2VTJWTXg4THZi?=
 =?utf-8?B?ODBFN2JCdGVpY1E5Zzg1MDdKTkttaDdZMjRySjY2NnVZT0tnQnRtQkVFa0o1?=
 =?utf-8?B?MkIyQlV6eG9neVZZbXNPd2hQN1FRTDZPT2lvbm9Pd1Aza3FyWEJsRXRHSk02?=
 =?utf-8?B?VFN4UXR0WHh5bnZPVGJBdkFtYnQxNEVabG4yL3pYWmNZUkNCWVJWUVpXcnMw?=
 =?utf-8?B?b0xPazNzcGxpTVc3WnpkeWxsdnhUd1ZOWWkzalVRZXoxR0swWFdLM2liSDNQ?=
 =?utf-8?B?aUxjWUhZRFhwbi9qbWdmYVpyYkplRjQ1QXdxcC9qUVpFOERnR1dsZ01XVXh3?=
 =?utf-8?B?T3JtRDNDMUk5K3ZDMFZXSnplSEVhSE0zZ3hocFZ0MXVZczhUT3JqeTZaU0Ja?=
 =?utf-8?B?c0hVMjlHdU55YU90YlRldThYbjZzY0pncXF5dkZ5YUxqb3luREJTMHJoU0tv?=
 =?utf-8?B?K0JqN3VPSlRzRnJwZTRNemw3L2xvQ0ZEMkxXR1BESTBaNyszNzd0RlNETkRV?=
 =?utf-8?B?d3E5dGZBUnllajMzclZRQmxxa2R1QzlLY01FZDBFVXlNWWMrUkpqWUlnbWtF?=
 =?utf-8?B?WkxNQnVWdEw3bktCL012eEhXU3YvRmtEZVhIK3B2SXpFSmsyVWFGRmR0dTBV?=
 =?utf-8?B?Ung3MVA1WGZjTG03TnNqS3ZmbDQ3N1JlRCt2TWNTTTljTldhS0pROFVjTmR6?=
 =?utf-8?B?UndFLzVJeExlTTViME9qanhqaDVjejR6bnR1N0lPNXE1MGV5K0hZYUorTVE5?=
 =?utf-8?B?R2Fma3UydkRlMy80V3QxTmVXUzBWa0ZLOEJNYVZ2YysvMk4xa08xajV3ZjFj?=
 =?utf-8?B?dWllOU9Sek5mM1RwV1lwdk9rVnYxRmZWbnhTRlJKcW12bDN0eHlEeE9Cbm55?=
 =?utf-8?B?Rlh5NzhpUXNMNTFGUUdBMnYwRHYrcGQrN2I4RGNHV0p0Y01qUXcrOE0zWkRr?=
 =?utf-8?B?TGdXSVE0S3JGc3kzQ0lpWmlKekxYS2pSZWRqNWxYaE12MVRYNlBER0JkeWRn?=
 =?utf-8?B?UDZVS0JGSElaOHZoQ0hucTJ6V3lWYkdSUEU1eHpaUEpKMGpETVpKaVR2SjJB?=
 =?utf-8?B?K3lqUHIrZHVkSkxxL3l3eEZ1TjJ3eENrU1NNbjMxMXlUbWY2ZnQ0TTlYYklW?=
 =?utf-8?B?NWUrd3hWNHVXV3czaTBaYVFOSWpMVHhxVkdlK0xaUTBHTEUrQ3BuM09hSWpT?=
 =?utf-8?B?UENHWi9DUFhNVk0vV0s4N2xZUmt3ZU5ybGptUzEyR25wNFcwMm5pT2FrY0ww?=
 =?utf-8?B?Vk1BTDhYMG5zcWZ2VysvYWo5amhzYzY0dWQwdEFLb2dBczFMaXdnL25SLy9I?=
 =?utf-8?B?OHY0UVA2RGw4V2dudUdsZWcwcUltYVJSWGhCZGE3a1QzL3BtWEtqdHNzYUwz?=
 =?utf-8?B?R0hPaUN0WXVZZzVKV1hEVmF5Wm9iQjNESVJ3YzlnRTFTM3MxdDlFa0ZZWW92?=
 =?utf-8?B?WlJRUzBwZUkwaFBpT0xBRUNKSmhXam9uUEp6Kzc1anlSNVFnZytFK3hmTk9l?=
 =?utf-8?B?dWw0dTRCRGc4SjU2eTRYTjd0NHNqOUdZRm5vSGpHbU5lR3NOMk9RSkExZ3Ix?=
 =?utf-8?B?K3p0WE1Sdy92ZUV6M0o1MGk1NEdmODV4c0pFRjdFYVU4cnRlZWhBZGRtbmFM?=
 =?utf-8?B?bCtuZ3ZyZTBPUUs5VEdDNXA3WHc3amc4ZEp2NkhDbjdPazQrVFUvTDEraWpv?=
 =?utf-8?B?cGxjNkY5YVVpVld5eEQ5SE1oWjFZTklFTGUvWmRpSFd6eit3amFWc0hDcWJn?=
 =?utf-8?B?cWR0OXJsMXdJQ0JSQTN5NlRBSll3QVNpT3dmNmQ0UG0yYjNReXlqRzV3SHUy?=
 =?utf-8?B?YmdDb1NlT2lNRDdsNTBUbVpObG9NaVFzK3A3aUJLNDJ1dzV0RC9PSTQ0RXhu?=
 =?utf-8?B?ZkIrZDN0cytyY0FHTDhTQVhCWnlSNHBpT3JNYjhiVTBGMklTNHZqVXpQejNQ?=
 =?utf-8?B?amdUeFcwK1l3ZDBLK0ZRR1YrcW1Mc0p2NkNrelEvQk9ab3ZtaGlkN2ZMbGJO?=
 =?utf-8?B?S00xcDI1VEtzUkMrOFl0OWI2QjZFS3VETnkwNHMraHRnUlcvQW1Ma3Z1Mktn?=
 =?utf-8?B?eXltWEFQdUw3ZUpTbGR6azF1RzZQQVhQWWxlUDdKbzZ0OTQvN2FiMzRMMXcz?=
 =?utf-8?B?dnpjUnl2UDRKdFpVcG5hbjVpREl4dWhnS2NzczVWOGhkWCtIMFBCbnIwL3gw?=
 =?utf-8?Q?DYRJrMar2Zr0lvSny24+9YE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc5cd3d-1592-407f-5f46-08db83a7fdce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:49:34.6076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLoQFGY6Kaalh3Nn/DKOght3n19085kyfSoJ31xWnTpu6o4/8REFhtRQFJVoU7/RZHCt5YOvN+MpSfjP7s7teg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 13.07.23 15:22, Greg KH wrote:
> On Thu, Jul 13, 2023 at 12:39:09PM +0200, Oliver Neukum wrote:
>> Hi,
>>
>> what is the policy on uapi. It being for user space means
>> that it should be as complete as possible, even if the kernel does not need stuff,
>> should it not?
> 
> If the kernel does not need it, why add it to a uapi .h file as there is
> nothing that userspace could do with it, right?
> 
> Or are you talking about USB protocols/structures that userspace can use
> by talking to a USB device directly?
> 
> Specifics would be great to have, thanks.

Hi,

I wanted to get this clarified in principle.

In this particular case I found that we are lacking definitions
in uapi for authentication descriptors. User space can definitely
see them.

	Regards
		Oliver

