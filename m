Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245BE561579
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiF3Izl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 04:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiF3Izj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 04:55:39 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11308427EE
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 01:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF2eKDfy2/3Pi9rfGV1GozcHy5xEZrl/skPGlVVo5IAnEB7/B8hhx1MfQMCs/Rl5k1TifaDiJQZK/j/778CvV/ROSDfc/yTTOjs2aGKbgeH5RSr8CqwZ1Tvriz/WQcByQsFP4+3qKYvVjjadWafMxTnoQamqhyb8639g/bcM/jlRRdRfQa6Uk61f9RB84S13AMECJA1NCMV3SBiTkq9IczFFJqdbnintYT5lHMxpqHOOeyVQ1uieoEaZWpMkZvwGYm6n6CZJiDAanRRaiJddLidtJAcYG3Btv9YNRaV+M4wyWC6AGTo3JqqTzA89Xs9j3FgbOuUIVuoGSDDTbg2ouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5tF4/I7KSqClHPQl7W94AFF9oLRuV3FjIciRcUvrok=;
 b=EDhuYgUizP+e5DbiLf64yZc+G+/HNAhMVj3+c1bYM4MtC/hpxZTiuv1w4ZQXqrAN81lSM596haBYMY4REMcFsJjyiojY8FCyJAR0G6DFrKneVDksmXjN0EcD94lJ+ftOKGEpDkDvjS3G7iPNG/cdK35neTEZg/+RbwnsKYYEqvRzU6PR+ui2QuHNZpbL+3UBuXKqAvW6MF+CU8EDhUAV00Ff2iTXRgCBo5+yQ4eoiQkW4v42JKJFMOnw9lB0Si7r6M8HN+D+RLU7lBQt49lCFwZJ4+gxhGApNQhwTSGdLYAiAQNjQgVQW5vzF1LmxTk4Bf41mVHKBDDiEXhrD0nI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5tF4/I7KSqClHPQl7W94AFF9oLRuV3FjIciRcUvrok=;
 b=vKWKZuHw8EeToQ6ZDccijIILuX6oA6htfEvgjqDsYtMGHAZxv/7jbP6KJMDBT+WeMaXp2sGAm8ng5GQizHlEYk8vKof981hVDBZOAiAUuesyKlauJL9K4DgppAi3uheixRAdCqgZsw5fSmGkMMzH5SfuVNdKxD5zkn2ZvUpujEg1Dk6t7MQ5aijjAG89dTP+zXojEDoCqzTphtb1mx/FY4f/8h7Iu/MLuXclj9AAzs8IWsvostm8HUtPErOV+E8OPpTBRoCYNRGomdjxRmH+HUMDqibRvrwzwpPEDwwtc4+3Bfw+pd0ZJxmnxGyHsiIaU3WPN1yxkfhX+BNHO8C84g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VE1PR04MB6526.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:55:36 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5395.014; Thu, 30 Jun
 2022 08:55:36 +0000
Message-ID: <ae3ccebe-79ef-5dda-ae35-b753869a8822@suse.com>
Date:   Thu, 30 Jun 2022 10:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: SATA/USB caddy - wrong device size reported
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     linux-usb@vger.kernel.org
References: <a1ac4690-4d46-4461-a90f-dfa4777dbf54@eyal.emu.id.au>
 <YrxiF/uE0/0Kw7rJ@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YrxiF/uE0/0Kw7rJ@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331aaa42-2cbe-4a3a-14a6-08da5a764c52
X-MS-TrafficTypeDiagnostic: VE1PR04MB6526:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBRzpTpStYsFDRhhDBaHhXhUZIHyyA652SXrzQCVjruduVyHbFlsNrNL7t+xx4zAN4qMfLgNDuTTy0VzH70JW9iYDeq+K+mAq62VSkVHITKFvJ4dB8rDZUkWDRQ1kjFjcNKfhUE1IiQALo+afbV5xKRDUiuFT2E7l6j8S6huvTM5QuC0+4+NZnVuXmalnuTLD79J91x7nCUtMdc7OWTEVl5Vr0289IguO8wOzWomUJBKSWHxb3w0zo6FwSQmrRodl9ZUwea/NlzEP1ygM/kq33wpF7oKs4bpVzPFrkGF4fTYzady8ClEPB2P5ah8BvskMxSgCaZwlK9hMVut9oz+pywVFcPAI3R416AXYzCcz0/OSRPRNyMZdSZiZI+EkOm2+eChZEwtCgHKWqHKZs0lSJUX9hSDmle+au4Do0W3fhYL2bOW8AfbRiB7L64R6BA8xQrhiHJ/uXKc1HTromMaQJ4Ac/jp/7fDQ6zf+rdDzvY8Cll7wqUFYAauiNjg1ef0ahHP7K7hWy/1yTz2OtgaxfFTBHxcp0LnSVX8RzxgEZ3JcuSOzDh4MT0ZZeAVp7Yee+yYG4EJOVnv91gqtSq91VswiiOtsp3QW3hnHL0KrEgoYemGxVzQAf1COGPVKMz6so7N0XbDUD9U7O7KnoG48MJkEri1LdKZYcmyURu9nFCSfQl+9YKnLPUzlcYL4g+y00N08Cw0gj6nAxgRnnBeZCY3y81ldbZpy1n2a+Jequ5wkIqBwlDUF5L8obgix/y8udKFoGu6hSbF8BCtesD9+Mhr22X7E5eUJkmgMcsUDy51bS73M5+hnjolP0Gzl1xbdgjQX+DV4/nsXkcx1AKHDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(8676002)(36756003)(2616005)(5660300002)(4744005)(316002)(8936002)(186003)(6512007)(31686004)(478600001)(83380400001)(4326008)(31696002)(110136005)(6506007)(2906002)(66556008)(38100700002)(53546011)(41300700001)(86362001)(66476007)(6486002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zko2OFNQZ1lWcDFVQ2JDRXZzMWtoZ2ZjVTdneXRrZEg0cHp6RzJVY3U2MUs1?=
 =?utf-8?B?dDdzQWVodG5jRlZEQTVjWXJrditSeDB0UGFCbXhJK3R3MFlYRldoNkFDTmw0?=
 =?utf-8?B?MjZQVHNrNXZHVFdockJmSzdNTFZWaE81bVBqQ3Bnc244UFZTZEtlRC8wdVly?=
 =?utf-8?B?bzdlQVZsZHBvb3dZN2dsdTZIQkpoMGJLbXIxdlhUREpFdjAwRU14QlJrbGZ3?=
 =?utf-8?B?d0VFQmU0OGlIRG12V0pwZjhScTlDcDFCVmFXbHdHVHVDanhqa0NOTGkwTmM5?=
 =?utf-8?B?ZHR1WE95ZmtJbnVhdDREbVhNeW12cmZtNTlsazIzU2JmbTAwTDhCUTgvSS9B?=
 =?utf-8?B?cThuWmtuZjBKQitzZUxIanMyOC8xeEQ2dlpTYXhOMnduSXQvMmRZSXNtbUpX?=
 =?utf-8?B?RDczUXdNTHdHM3lIQ2VBSUl0MEVaSDJJd1dlUSsvVWR3L1lpWUoxSFJ3ZW1m?=
 =?utf-8?B?UFE0ZE5XeWZPVFlSMlFab0lxdnlCWFFQc1pFMWg3cFJDTUNxdzJ5YkpqT0VI?=
 =?utf-8?B?QXFhQk13YU5sbGJrR1c4WmlqVDFocUpnbmpiTUZWNWo3OXhIZEhESklCL0lO?=
 =?utf-8?B?MXFmb0FMakJ5SEFXeStRMkt0OTVvSWFydVNRVmJ2akJHc0JqcEpHYW9GQlE1?=
 =?utf-8?B?UEh3dzNLc2hrd3lXNXQwVHlxUWtFd1F6L3pBZEZTYzBXYzlaRk11b2g5bkgx?=
 =?utf-8?B?VG43K2FVTDNVa2xzNXBBNjBBdC9qRVp4VTVnYmF4TDcxaW9CcWwwM0ZTWi80?=
 =?utf-8?B?U016czFBdzUrMS9vWEQxTTlYOGlpdXAxYXN0blZweGxYc3gvdi9vOUdWZ0Qx?=
 =?utf-8?B?eUdtbWdCeEJRalI2UTh5UDFMYUdnRS9MWnBwY1pRYzBteHZmRys3cEpKdkZV?=
 =?utf-8?B?YjNzcXVKcXpJM2t0ZEh0M00vckM0WVJ6cWg2VXl0TEVSM2hUSk1VZXI5REJi?=
 =?utf-8?B?Ympsb3QwYTMwQVpnOUx3RHhyYnFrUmdqVGtqbHNrL0RIbDNZaDNHTzNHMWdi?=
 =?utf-8?B?Y21UaW9kK21hZWlxWEFjOVZHRE82bjZrNm9jRFI2ZDZBQ2xNOFZZRW81Q1BB?=
 =?utf-8?B?Nkp0MXBkRVJsZ21VY2dpcDFvcnloajRsL0lOdzgvenJ2QUFWVkxoazVpUGU5?=
 =?utf-8?B?dVdFU2w3czhLYUlTT0pHa2xhN09MZlM5bFh4Wi9vOXZKeGxJOUJkUGltOStO?=
 =?utf-8?B?ZjhpVW1HM2lGQVdINHZKUTJxT0ZOUHozV2dzczZzZE5KVkhVL3BadDFHOVF2?=
 =?utf-8?B?L29GOXIvYlZWY1BBQW1jSjVTT1lqem5pL3FyQkhacHhKekQ4L21pSU1LRmhl?=
 =?utf-8?B?cXl6V2ttc28rZGVQTHBDY0FRR0szRzcza1V2T3B5anhJTVJESUxRQ0k5a0Ra?=
 =?utf-8?B?S3ZObVppOHhzMThDREVJM0RGcnp6R01nQkdRamZTNFZmR243SkVKVkMxT0M4?=
 =?utf-8?B?eDY0RlBFV3NzWFBsZjI1aGVzM1V5eVk2SWZ0QlhwUC83U0NBRDRsTGcvVFRN?=
 =?utf-8?B?bnlwNFFHcUlVdkl5M0pHeHIwZ2RUVi8zMGQ0YmI4OWNqR2IrM0FHQjgyamln?=
 =?utf-8?B?cWpuQXRKcnN5R0ErMkVhN05UYy9xQWdmckhUUVhCYWdUM1Y2c0pXRG9ZVUZK?=
 =?utf-8?B?SS9nU1Y3TWhDS0pIV3FJYktERlFPdHNPVlZuNVZDVnVSVnlxMGVWRFJTTjdL?=
 =?utf-8?B?cUhkbGhtZnlSK0tyVGkveDhLb05CMS8weTdMUFM3c3N1K0VTUUlxUks5WnVt?=
 =?utf-8?B?ckNFRTlKRC9vZ1IwRlB3Tk0wRjduQkIvUWJJcmYzOEV5ZnhxVXlRSFhBQm45?=
 =?utf-8?B?S25nMVh1MW9aRjBJcWVwa3J0K3ZaaWRKY2Vvc25CTEloZGZ3SGRxckxpcnR4?=
 =?utf-8?B?UUw3LzR2M1FXNEJRV2EwQS9UV2o1NmhoVU40Q2ExbFdPVW1QanZkeHB6eHhQ?=
 =?utf-8?B?U2NoSTVPNlRZaUNTVmRhVnl4YjZoZUhnZWhLcDlCT052R21PbFdwbGZCTkJM?=
 =?utf-8?B?WVJTT3FEQlUwaUpndThESXBYdkdjTnEyMmNXRWVSMVNxcFVQMWFxRU1sb1Fy?=
 =?utf-8?B?V1B1eGFVOHcwNGYycGQzVktrMkhrSzA4LzNCOFp3R3lUTXo0eW1KaWpiMVcr?=
 =?utf-8?B?eDVYZ1p3eitkZ2FmNVlWbk56ZFFOTTBPYlN3Tk1aY2RHdVNPVDE4RDZIRGF2?=
 =?utf-8?Q?hXKZm7Z7wVZaPnYQHTXCzVxJY3FfSPjn7+2NL178grm0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331aaa42-2cbe-4a3a-14a6-08da5a764c52
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:55:36.1153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+Nnm6gIzzzQ5igB/WQiKvIlpoCXxMqp4i3g1EENsIiOTYF+6QgekcU3YYrewI5s/cnRrEE2/Z86Qh/gw9rSUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6526
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 29.06.22 16:30, Alan Stern wrote:

> Historically the problem goes the other way: Lots of devices used to 
> report a total size that was one logical block _larger_ than their 
> actual capacity.  This was caused by the firmware authors 
> misunderstanding the READ CAPACITY command, which is supposed to return 
> the block number of the last logical block -- but instead they would 
> return the total number of logical blocks, which is one higher (since 
> the first block is number 0).
> 
> Nowadays most devices seem to sorted this out.  It looks like you found 
> one that makes the opposite mistake: The value it reports is one less 
> than the last block number.
> 
> It is definitely a bug in the caddy.  On the other hand, this bug 
> probably doesn't affect the rest of the caddy's operations.

Or alternatively, the caddy is marked as quirky by mistake.
In that case we need the descriptors of your device to compare it
to the list of quirky devices. Could you provide "lsusb -v"?

	Regards
		Oliver

