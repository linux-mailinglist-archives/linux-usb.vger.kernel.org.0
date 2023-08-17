Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94377F1F5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 10:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348792AbjHQITy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 04:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346272AbjHQITw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 04:19:52 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDB52D57
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 01:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvXcynMsMQB75OdyeaBSglUUBEZOmfREsQCli9V5TfxOqcRmyPi68btDFqKJpBRTk7k840jGB1Lh16oD47LMO7+rtwaGe4j8zTkcv2zQBmAtxi/1Ldt3Cq6u8atqrTxth6HZnBUZpbnnlKZc7FMNI8sd0Wnw9wH9KqisgbnqwW+O2Mzes/cEUdPETON2VMWY9y800rawcKLla/bhMaqeFzwgtMKMk+BiELQIbwavIdbB5snvknGC6mDAMP00xttTIOf4ESQmrG5zLSqX0NNeRLL4u4vVNHWdWWxletlh5e+yDUgzUgo8PrBE/6J7G6uIkgAA3anhOwsPNFBjC3hifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h58tEdkbR75w+0AqXl8l5yD6u4OzvHb8mY8XFftz+AQ=;
 b=dLhh+X1gpEbtFkx7u6FYtV4P4As+PfyFceUajwlCWzWJ36bX+q1v4V8UK9Nc+/9UVrfdKhyyo/u+q6AoqSxBnAa6B2ZHOtrtgtsUg09p4S4R8leHjx0SyroJMy25qbD/wryMDse2LKe0eHVaqZJ3N9V81M261AzwOtYoqgwEUo3FlvZeKHv+nq9hc8bVA67MXKWbHQApCn4KDxULUBNw+RrR4XPjJceD6iBoW5/ST6LINxoxbA8gHjQU0FyDQ/wczmuvTLXkr7bQqKCWheOjKEHW0I2MwXByC4gTOZSGUTIg+WcbnZXnFK9jWtwpUjAoJ9SybHnKddUullzYWdTzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h58tEdkbR75w+0AqXl8l5yD6u4OzvHb8mY8XFftz+AQ=;
 b=RORo+cxSWog/BY3u/uV6BjrchIlnekTkDpMVhqPO2/23ilzmGkq/aRZyO2SJOlSF7g9OWz8YWi2XhJnokZk0SfmV7uNzkySHvG/ddcd0LhqdmV3DA0h5M78sT0JHZk6gfHJIN4pYg3pvVjmv7BsVGyqkza2shL6954Xpy91ZhLqTYlkqmJThs0fPVmwPwChp2WUHC7rtrOUuNkmM8XwzUdUKOhYa9ovUpCOoHr4EehD7PUDref0aH9pEU/YOWvvs05w0MaKRXa1QSbmkjgj2DA+fFbcEbgOvfKJ/U4OcHXZK215gVZRiR0hHpGUhKldSr1WTDgKLlbamwPBPXmldmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAWPR04MB9815.eurprd04.prod.outlook.com (2603:10a6:102:381::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 08:19:46 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 08:19:46 +0000
Message-ID: <82f96997-3390-0fce-0103-418092bab89e@suse.com>
Date:   Thu, 17 Aug 2023 10:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: cdc-acm: move ldisc dcd notification outside of
 acm's read lock
To:     Dan Drown <dan-netdev@drown.org>, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org
References: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
 <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
 <ZNzaYJ7CC/G280ct@vps3.drown.org>
 <1eb2b49d-52c9-c113-7c60-81634edfd646@suse.com>
 <ZN1zV/zjPgpGlHXo@vps3.drown.org>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZN1zV/zjPgpGlHXo@vps3.drown.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: ace366c9-b2bf-4147-0f74-08db9efab744
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Alg0P5Y/RTnkoqUu5TToZIyE1dNLXWSTnj79LNCyHAvYORfxWDsmKewKBFqekZmDIG5jY1PU30oe1TYLuxhMKQq7B/TUpSaRoFTzQvs8PCzCHlOkfvuu90oFn9Ii5Dx2yMmCIDeY9OrXJaWOwsXhgrXdY/0ufEOGk/IqsvvjVgq54PPbZVKfWJwNmP41/aam4MRH05P6qX7wcSskisvIszIaIhDjrgzdCCsoPq7fhoEf7d5XhfaDTFGltIK23Co4710pIEhMDtaoJQNuG9FVubl8H/EwoR3JzeRsWBrZNgAbgwIhZvX+sVapMici1lyYmJRd8ModIIraK8f7T3FbdsZZzb4wJqGqsD2+3eUShn+ldRiwTEMKJ8pNik2y7KN8yEEo3y1xJporH368klbczSrKQJOUWE3fqT0SSr0bMgXXDnBOQ/w3hoT6r7fUvTdTfE6gHnY/HmsunWEBW+mii09tb0Ew3MOlfc7xuQHRtTQsXSES08yh76SNzqhaZs0T9dfR6Yp144ZYb16vQC+ObMlnDP8+TgfUOlxsyS44w3jgI+egplSgJh7m/jDUok0Aljfcde25VOWAeXay37aYFx99kcgAVjPe1k+wsgbg7SX9D/ssMyjkRkITlbfWgitpPJq/o1dafBgRdy83yEwvCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(1800799009)(451199024)(186009)(316002)(66476007)(110136005)(66946007)(66556008)(31686004)(5660300002)(41300700001)(38100700002)(8936002)(8676002)(2906002)(15650500001)(31696002)(83380400001)(478600001)(86362001)(558084003)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRKVUQ3eWxzbWUwVTQ4clErOTRtK01GeWxENHZQbGM3TzllOGpaeGNYaEZK?=
 =?utf-8?B?VFYzVVhic2U4QVIzdVlLTmtqeVVpTzhkR1BlN2l0UHdDazFwWWNHVTF3NHJ2?=
 =?utf-8?B?NllwVzNWM2E2eDVTdnArM3UrSWdWbWhTekJaNXJwZlVnVk9saVdtZkhFaUhK?=
 =?utf-8?B?alFFWEhleStGVzdEQklxdEFzYzgvZjUzclBzdXlhc3YwSVUyUm9UM09JRlpo?=
 =?utf-8?B?SVAxajEzckxVMVhCeW04Wk0rYmF4cm5Dc2R0UWhHY3NHOWJmRkpJV1d1UXF4?=
 =?utf-8?B?dnpDcHRMUXg0SzVuU2lDOVRXdkRWV3ZXT1BKM2JYbTJmYjAwd3NnSnNGTm9S?=
 =?utf-8?B?bXZsSHRmclFWTFd1QmNpWXpSS1pMOWo3RWRjVjFlZmhnZEtaajQ2T21zZFhF?=
 =?utf-8?B?a1hUN0RYVXd5Vy9PQitLZStLV1EyeEg5WEFVdG5IMThNTWZqOUZHc2IrWVZ3?=
 =?utf-8?B?VnZWRW9nYktxZGJRT0tNNWRJVmxjMFdwcWJua1FPQlo1U3N5alk5VW04dTVj?=
 =?utf-8?B?Q3I2NUdXMzR4T3pKNzZtd0ErdEo1a1F6ZmdJRnhRZW1mdWVCc3BVWEZZMjdB?=
 =?utf-8?B?MHMwU21jT1RqUmFsV0w4UHZCeUVBTnYvM2NKd1VZMnl4NVhMNUpVMVdqMUN6?=
 =?utf-8?B?OGZyL0xuQjYwUTZhdXNjV21zSElzOFN6NUNPK3RDV1B1anp2TW93OUN1dFlj?=
 =?utf-8?B?cU5JcFFIMkl0N2RieSs3ZnlzVlZxNGNpVEQzRkJpaXhPdXVQa3QxR012K3Rx?=
 =?utf-8?B?cHJQOUd2WUlkQ0tWalljaU8yV2N0TnplRmJERU5oRXZGMy9MVnNibldrN2tm?=
 =?utf-8?B?MkhmREFYTFUxVkJieHRmTitVRXB5cWs3d2tLbHBjUHdYK3htOGRzL0lEdTBV?=
 =?utf-8?B?Q3Ruang1UGhURExIYkxXVTVIZ2RxdHpLQnh2d2MvSVVoc3FKdW5sVDZMWWhs?=
 =?utf-8?B?Uk9UL2k1emp0dUVDNnAveVAxaHMwd205TXRQYjV3NVpVcUVEUk1Gb0Z3YzhG?=
 =?utf-8?B?bHpONDFxanlJY2VWbVdWazVUWkc4ckRibDcwMVliMkV0SFZtS0psYXBkK05J?=
 =?utf-8?B?Wm9mNHQ5c0NKMU1qWk9VWnZnV29OUWZrV1k0ZzZ3NVVjbWV2a1VLQXJZUHRP?=
 =?utf-8?B?aUJBZVRSNDZIY0grY2dLanNjc1ZTVXJUWGlkUlFYb3kxdEhFbldIV1A0K0Zh?=
 =?utf-8?B?dEpDRnJRQ0Z6QUtTSFRWb01PZFpYRVF1MUtacTUvNEhDUFlONVNFNDdSMzZU?=
 =?utf-8?B?OVNhT1k4azMyMDJ3OXlQYUFRUnNuUlBJRkZFUi95Q3NycENnbUdZNUJ0UzNB?=
 =?utf-8?B?R2g3Qy9sUGZjeWZIQ1J3d3BvekdOc0QxN1NNTkxBN1AvTWVadWxNSW5CSW91?=
 =?utf-8?B?THlwa21oYk8rZXZCN3BTbDdocTM0a0tKc2F2aWdqNnlhNFpGYnNLOHEweXpK?=
 =?utf-8?B?UUNBUFBDa251aU9LUWJLREIwV3JzamJkWGovOXBYS2kzMmhCZHlRWFZvOXo0?=
 =?utf-8?B?dlNEUFJXRHdyYk0vUThoZ1JlcEdIdjRvckluU3J4cXliektUQkpzaGd5UFZx?=
 =?utf-8?B?ZUUyMGpIRGY2ZEdjcWdUdDIzUUZGM0NPWGl5MDB2WE1CQTQ1UTlKZXBUYWhF?=
 =?utf-8?B?SWxjRzFHT2E4OUJ6dXd6MjJLZU9EMzJBeHRzTmNzYjJIQisyei9Nd1FhZzJk?=
 =?utf-8?B?UG9Uc29adVZMeHF5ZkppS0tzOG05a2hwRU9uSHB0RjdiRy9Vc3JEeU1vYkJa?=
 =?utf-8?B?ay9RakMwZXZPWk9YRkJlUmdMeVpTZ0pSMDRVRkdJV3Y5anJXeUNhL0FBK3o3?=
 =?utf-8?B?QnRtSFpXVlRsbllMVGVzWWk1QU9td2kvQkhLTEJ5Y3kvaDNEMnhkQW85RDQ2?=
 =?utf-8?B?V3FjVUdHQ1l6b3dWVnUzL2dFcGJ5OXpWSjE3MW1HQlAvV0hqMVI4UGJ4eC81?=
 =?utf-8?B?UmJwK3BmV3UzVGl4bDNZOWtlWE1USjNBWTJ6SUQzdXNJeFA1alhTeGdtS2hP?=
 =?utf-8?B?b0VpUnB3ci84TFF4elBGRHFwZHVCSUhhckZwUG1FdG1ZVFp1MnE2bkw4UHhh?=
 =?utf-8?B?ZUZqVUVhTnlydjM3UFZTWWJVS01xTXFXWGt1U2JWdDFXOVU2RFVoNnJaUEY2?=
 =?utf-8?B?SjFKTWFzVldqZWVBL2R0S0NnWWhxaUN4RERhV0lSdXNweCtCZklPTHV0M0hN?=
 =?utf-8?Q?e3eB9PruJoJMVQKaP84YwFffikwe2AwkQgm1EXHg/Yns?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace366c9-b2bf-4147-0f74-08db9efab744
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 08:19:46.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIcks/nsnr6VywG7BI09RPiwJktKM7ovurr0Vd+Ju2ytXyANZVCBV5547MdTAPJEXNeb8qgEShgygWSld7tgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 17.08.23 03:09, Dan Drown wrote:
> dcd_change notification call moved outside of the acm->read_lock
> to protect any future tty ldisc that calls wait_serial_change()
> 
> Signed-off-by: Dan Drown <dan-netdev@drown.org>
Acked-by: Oliver Neukum <oneukum@suse.com>
