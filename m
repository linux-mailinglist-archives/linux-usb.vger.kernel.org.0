Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21D5752433
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 15:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGMNvM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jul 2023 09:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjGMNvL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 09:51:11 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2051.outbound.protection.outlook.com [40.107.6.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5F11995
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 06:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJJuIFswLybhB6wlpPmH0Oc4LjdeFlCzfoXk/2MFP9xwVun48R8DHVE7JmcS6/pYvrcQimY4McC+eBhqP+Bh0Vlnw7FlWhgFl+2qFknGm/pNhQMn1FlFhwIdxXo8UEOeaFvsG34ghFgRdwYAse6W2/WHQGDcOOXaJJoR14I4dpMDDmBautl5T1dkmF1kb5h6xqmLfaVC5zZ13S8pKIB0BaGy7ulXbw78QMaLjOWn9ubpfrx8eLNrhjnWiP9BvmJVtE4GTcTAcIsoIxyDzJ/VVnYIqUpNYx+q88m5DtovF9COLdsBeCMLTLhjun0FDM35WFeoLYhShCq3vfSRBdQT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7yGm5MluHLR5BaMW/9ew1Ls+M5ZuISHilxNXWHXTB0=;
 b=aXKGLyRtcsqV2c/6xK/SJurV/OB7WDhEr+EUTZrgJvc1hlHarCAgtg8rSa4Ym+fv560nEIk/O091/dF9IksxvEtn8k6tyXiLRvayBHwc2MX8T4Vcveo9K6dZ+UKeHdJBqAu8LQt4sTHqW/Apaa1YSkt/w3IuhVmmUCl4mBAPHgOGTdRB6ogQxYuboezlgqGyuA7ONLy0yCDuoNGDYXIEKuKd06SwX4bAkq9XxjyykqIdgn/DFyAXvtw/GBf0NPySLeuzSL96DKVFLlRht3hBO+j+1XEle6nxXfvK8/Nh0kYP+9zjHHD1vq5Bi24Yg+semsgYzMvwbip6V7KNPvhm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7yGm5MluHLR5BaMW/9ew1Ls+M5ZuISHilxNXWHXTB0=;
 b=QZVLPZ5yG+PI94WkUQxWTy1HDs10vK4iJjII7zVeRi0M8+RoW1XhyOUsMOMhz2GEpWAf1cSvaEfGUk2m+8VW9thnM7W6QhEBnaf+ABtYT4L4YaHlBNNPQ5VQVq+wljrgjNf32gGDfwP8mpqFBfuDWSxTd7aJKrW77CtpUkP9ik8i2awdDniuTgWGvkq8HAIxCcijut2wv3+ClnwtVI7HUd5ujvTNdpJZYm+jVOgOVQ0Cy7oqsc3dohJtkjf/96UaAZkCpLhtxmrn7G44JZXrfkSusDTbkkDsw8Nr8+jY+xpDxwl4MGkDEBG9tZuZMz5L9GZm85TMg5tG9Gfny1jYmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 13:51:07 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%7]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 13:51:07 +0000
Message-ID: <3386b05b-92b3-0285-9d4f-a21b53716f0d@suse.com>
Date:   Thu, 13 Jul 2023 15:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Revert "xhci: add quirk for host controllers that don't
 update endpoint DCS"
Content-Language: en-US
To:     Jonathan Bell <jonathan@raspberrypi.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230713112830.21773-1-oneukum@suse.com>
 <CADQZjwcF14dme4yT39pkGE8Xg+0i5Tb2vz8apb8M1RoB42CQjg@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CADQZjwcF14dme4yT39pkGE8Xg+0i5Tb2vz8apb8M1RoB42CQjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f442d41-0ea5-4f68-37cb-08db83a83520
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtsdrghFlFLh49SGF23cRYoUHZxj325YdnncwByEYfLmCsk9ysVxKHLxpWQ0F7wnxvQqbNPitQCkizyUkLT/3RU0OhjW4Ezd2GCVbxnoiNdERYz8tjT4f0LjnjzlgCmnvtC6pzZmqOn1AUZozma6jLA0ll2R1Xdg4woxCE9uNMvdpI2BEVky4QU7/OPdmkOK/COOTxmOKDglmVCVzRrn1BBG+y0bIk85qLlne92lbZF9xgXAxtRxgw7MPO3YC3/ecdBdWu4Z+U/eIuvsyrpnW+MA/0K1ZzU6SGGezdzHaqGm1liMRwl+D1pny/adx0hM5eQTj4FgvNFWuhf+F9rnPvT3Pk7V7DPh2yuJdQnqEOEtJQo4gkD1tK5dqu/Fz+6rAuFrshjATODjbYWK0dPrVdxPs/vMHIP6D/6mlQYU7ycVbnrMhi6Fr6zoVhV9L5OqdywkdoKXBiFSdpABkvz1CUe9mCtZNLv9REM8akSMFNtchaaIwK0DKZMb6hOiwJuwhOltKlFT/88/IiIL63kCrdTvqs2PUa0WuKy+QmbT4rQrCjFtmC7oLANOK1mRoHHCBFMIObvxufBjq5JcURkd+GApIVOKk4rISWHhWaAo5AVe5SVs/qXfJ6Ff1f0hRT6ZjkfYialFWfjeY3PgqeKoKUAzui412wnDjsK2NBq/1BFsjcO8JuALuaz6wyLCfmQVhBlH2GG8MrNKKaBMs1Bx0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(4326008)(66946007)(66476007)(66556008)(6512007)(6486002)(110136005)(478600001)(36756003)(186003)(2616005)(86362001)(6506007)(53546011)(31696002)(38100700002)(4744005)(41300700001)(31686004)(5660300002)(8936002)(316002)(2906002)(8676002)(21314003)(45980500001)(43740500002)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFMdVdOZXVSUExsNVd5TE5tR2lNVHVXNSs2OVdwbm1PK21Cd1JrRlZNSktl?=
 =?utf-8?B?VENLdkZBL0dJR3FuS1hOVmtZcUxqRS82L0RDZ3V2U0Rrc3ZDU3hhbUxsZFM0?=
 =?utf-8?B?OEJFcFJkZDU1V2VjSVFPTEFOMDJkalNYNDJEc1R6Ly9lNmJJZDNZL2NzZkpS?=
 =?utf-8?B?TWoxT2hNS0o5Q3IvdEVrcXJzbHZWWGc5MkNxeno2d3F3QVVJeWZKN01ndEV2?=
 =?utf-8?B?eTFOVkViaGtGOGpMYm4yWk5hbmlIa2ViSTdiaEFNUlNCNjNYWldXZkZFNmxo?=
 =?utf-8?B?NHhEMXFWOVVMNTNwSi9LclV6VjJneWlYMmtHVHkrSVoyZzFBWjVZakNJUTFO?=
 =?utf-8?B?Nm80dlJTV0dsQVJ6dk8wRUp2ODMwOVhPKzQrSDUzL2w0NUdaWWpUYTU2ZE1m?=
 =?utf-8?B?ZjZxclVjcC8xaTRVRG11YXRqUCtyS21uZG13bmF2ZkRPR2YxYVJ0ZWhIVXZr?=
 =?utf-8?B?ZTRyR1V5UGw2cUtEaGQ2b1o0cE9xNTc3a1VxaGVkTVp2TWJGamtYYVViYUxm?=
 =?utf-8?B?YUZwQldYcktFMjVXVmdjUXJkV2N1Y01ONlNuZUEydk8wMksyU0hnT0dZcFdq?=
 =?utf-8?B?RU5CVXZPelpYQXpKR3V5QWhINlR6YWNORnFUeUF4dzFaSi9wSW1YN0w3V05M?=
 =?utf-8?B?TTJzbmJNdWtqZEpmQmhBMFR5dDM5U2hDT05GVDg0RU1tbW95V2oyQkJMdk1L?=
 =?utf-8?B?Rm5UZjZraWxGRVc5QWtPUDVwSkw0djA0MGdMRUZSbFQvSmlqSVVHWkYyajhP?=
 =?utf-8?B?UGdDOTl5VUh2RGF5STlKVysvSjVtMHI5dHNGWlZGcysyemZlclJROEd5VXZv?=
 =?utf-8?B?QjJaQnZyYnBvOC8wamFaaGJJaHg3cE5vMDRpQkdtdXRQRllFLzBPKzhQNW9X?=
 =?utf-8?B?eElEbnF1NlZCSWk0dWNVN3E2Zzl0V1ZGYlRTN0pMTzl6ODlRK0dodTRPcGxZ?=
 =?utf-8?B?bU9saDdJalVQMFp1UXhPMXg1Q0o5Qk1HTlVKR3E4TzlEbXlCMUNoR0tuWlhE?=
 =?utf-8?B?Q3c4ZmRkRjRDOWZ6Znk2TDBMTlBmZkkxY3Y3QkhXUW9XTHNmZmUzQVJDU01R?=
 =?utf-8?B?dTY1c3krekp6T1kzcVZxQUF4alNndnVZM3kyRWFwWVRoRGswUUxRTEluTkts?=
 =?utf-8?B?YlNRcEhZMTFNZFVLRWhQU25ZeWY4aWRXQWw4cFZkUU5VanR5Y011QVpTUmFC?=
 =?utf-8?B?eWIwZU1uRmFDQUU1N0trbklrL1FDcW0vc3FHamhKbGlqZjdDV21pOCswK2Jw?=
 =?utf-8?B?TnhmS0dnVGxnTW4rNUY1bkRGUXlERDY3TzBDNHVhMkxSYWFKS1ZkYWRkUFU2?=
 =?utf-8?B?RUJsK2FFNEs2M3hzc0FNN3FBbUJ6cEV2YlRvRGxTK2Nnd0NpaDlFS2twYnQ4?=
 =?utf-8?B?dTNSbitQSUVoR1ZpVGY4Q0JDZGhVMFJQdVpabUlSdks0OVZ1SU93bHdWdWpX?=
 =?utf-8?B?OVg2WTZxSzAyV2Z5c2srVmorR1FLVU5VOWtKQXVxY0xLdHh2R0JUNEE0d21U?=
 =?utf-8?B?eEt5QW1hWm1Yd1Zsbm9nOWIxZzVKZ1ZQTnRBTHcwT2U3WDBVZGp6SlBvcWdX?=
 =?utf-8?B?ZkZsRTdrZDFiQ3NyYVdPU3ZLSUd5THdFRDlMT3VQSjVLbmZGcTl6NmRucnRW?=
 =?utf-8?B?em9DR2t5bWFaL0UrRk9ZZks0ZE5qRTZoSEtkNmhTcG9UZnlnbnNQb0VCNTZr?=
 =?utf-8?B?WERIMzArWERkSk5OS25JL0d6N2pJRWI2d01wUlAvVXZObVVRN0ZzM1pyaXk4?=
 =?utf-8?B?Mm54VEZIaUcyQnhFY0xIVWVaUm1BVDdqOVd1MGg4Vk4yZXRLUFE1dFN1c2xV?=
 =?utf-8?B?b0M5Zm1sUjFvRlhZQ2VqTDR6aGxreWl0ZU53MEMxYjZLZFkxcUFxZjZoZVRz?=
 =?utf-8?B?NjlFM3ZqTXVOV0pFWU1PRDVpZVBFKzB3MzREUStxWlNHajd2OEJ1TVIxaEZs?=
 =?utf-8?B?aXY5NE9OWnUyWDJrdDFvZVhYZFYxZER6c2NzcStDNEhyakJFc1MzUnZ4U05k?=
 =?utf-8?B?aTZSMGNEMXZBM1dyTDc3REVsOXhwM1dtSXhYY2huTzl0OS8rTGZ6WlpKWmYy?=
 =?utf-8?B?S1lVam9ueXJ5QnUyNjJjdUhDQVZVZE90Q1o0YUxrcUFnQnliaVFuS2JkbS9s?=
 =?utf-8?B?akRjZGwvNm1jUWpZTlpRS1BMMktoenIweHhZUFd3Y3JqSHNnWUFLaTR2MTVq?=
 =?utf-8?Q?Rmg6P0336u02xTBiL53n2De+X63w+ApOnCc0VdPWLOKv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f442d41-0ea5-4f68-37cb-08db83a83520
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:51:07.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FTCLh0/pcG2viHWXovWXicvug9uR/M0+rcWbEQsQayEKx4dd2Xlui/LIWLAaxbzOrW03BHEYMfwS9UiP0njEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.07.23 14:27, Jonathan Bell wrote:

> Odd. There are many third party VLI cards in the field and this is the
> first I've heard of an incompatibility.
> Can you please report the output of
> lspci -s 0b:00.0 -xxx


0b:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
Controller (rev 01)
00: 06 11 83 34 07 04 10 00 01 30 03 0c 10 00 00 00
10: 04 00 40 fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 06 11 83 34
30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00

> and pastebin a dmesg trace with xhci debug printks (and the quirk) turned on?

dmesg coming up.

	Regards
		Oliver

