Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3233D63608B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 14:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbiKWNy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 08:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbiKWNye (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 08:54:34 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2035.outbound.protection.outlook.com [40.92.107.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012AF83EA1
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 05:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3vT1JXZKTkcj9TcrYsg/xV0NLG8lwBPaD6vv68EzPIlcb+Qwf+j/PXVxroM6i6tgz2fAlDEJ1y30a0Eai1qffhg2RK3XTp/5p47GzjhQwm9etggmb6XkGVLikW6jOeExmqAysdqOnJfYq7pPfupUXVkEo+ZlKaK/tlf3zsfk91Ykyt+ZMjQOmjRTevCj/ont8QSwsUQtSIYlV0h0iwDbRJQR1HkKPzy3WMoy3Ns/Xl+bLvxFQAzLLKtJ58AOwnWbFjPrXm1oVBCbD79WMQPCgAwzwd3fnTioEW+NllcMQofyosXmcGIX+7RtgkdpmXcc6XM9p+/KvsDBhgoUkIEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RIudtpOolZW0wGVUhaRwsyCYyFliFqtoZ+5K2dRT+A=;
 b=YZujxu5G05DQPfBAgrhFZxRX7JyyOUz5yq3NmJIN4peehPXNl6WugZ7OFBuL7/2CHcdLStzZfXI0lmbybPBXKnDZ7G3GI8dOlXYg6ovxeMO7Pegf8H3tzqbO0ZYZY4kMb5V6KuJ6Fls1P7Tn9Hp3BgDFZrL85EhLKNjqTcjyr1L7doYGxEAm7Kn4PDBvk5BVVhl90mxyTnP3AL2i/dS+sPGXjOodBCALlbf1K9cX5+NSrDtG+6PafUkS6wVaRsqFoWjcw44srVCL9xJ9dQgSOpETgEuAtveOmxrypFdnGdoAplXThBws2cVOYEL7ob+OL+5pvkmKIfDLoTfxaFQJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RIudtpOolZW0wGVUhaRwsyCYyFliFqtoZ+5K2dRT+A=;
 b=rbPIzDVWGuGKftEq/d7kxLg0prBbVmE9+i0wBvgxjg5lgprXQLuS9G/FiN26qBtBbgjAuFxsH/6ywrXBY9aKqunuYmax67Hnl7Gdx0eNhtICgTJyD2ww7e5mbjqEdhbcjUOCs8InCGWqHd40WAWZIyXUFD2KZlGoGeXqPH+5ZHkbE3uDdzYIuW/ObIZSJZ+T8MRhIdeDbSoHEUUi2OdM4MmVB03b/RJDu4+2dt0X3npvGn3w5dFJrZQFnTYXZH4dlDR9FsRQw5yEyD6j/WOLjAV6MqqLjnNXuZILEqQwbpDQiYJlvzic8A7xBlVoDknA+vz+88VVRRihc3pgyj21hg==
Received: from SEZPR01MB4445.apcprd01.prod.exchangelabs.com
 (2603:1096:101:49::5) by TYZPR01MB4506.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1fb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 13:48:40 +0000
Received: from SEZPR01MB4445.apcprd01.prod.exchangelabs.com
 ([fe80::ad1d:da59:22a1:d30e]) by SEZPR01MB4445.apcprd01.prod.exchangelabs.com
 ([fe80::ad1d:da59:22a1:d30e%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 13:48:40 +0000
From:   Patricia Baker <patriciabaker20@outlook.com>
To:     linux-usb@vger.kernel.org
Subject: Re: Blockchain solutions
Message-ID: <SEZPR01MB44453C47C9B391A0556B5EACB40C9@SEZPR01MB4445.apcprd01.prod.exchangelabs.com>
Date:   Wed, 23 Nov 2022 19:18:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-TMN:  [JFI4DSbkyzut8ohcam86uvT07EwJ2AtF]
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To SEZPR01MB4445.apcprd01.prod.exchangelabs.com
 (2603:1096:101:49::5)
X-Microsoft-Original-Message-ID: <a6a66216-5efe-8b11-7287-93fce4b368bb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR01MB4445:EE_|TYZPR01MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0703b5-8f2e-41a5-85ee-08dacd596d2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hay4B12fESNCNplVnrKu/t15pfF5kBo35eweD/iNL1KDbvYdvfV5UklSsTm67WjoY/WefI682RgJ4IAL+5cWmm9GWvuZnLqjHZJlekkmEYxiwRo9Y6qCH+yKgZ8ebOgnd+Wybys52GbhbC0kICYIN08lH4UB0fz4jwiYepnfTf36B4a1ImTa9UoZ+8Z84G/AGaTfAvP4HsvPCHaSIScXvsB8gdj3XsuCV3avU2lYS7DjnF0H4AUqdEKZHuhWNR9vOTKWt3y7VF8KuQAx3Wu4ppKQlOPchX+6SWxn+JscDl51YAeWPCi1m9zSrqTOixUft/tijXMeibGJf/9AFLzhPQDS9xrCy2VsOGOtLkC0ZVh83hMz0rvn6lztT5nXkwGkVr8fHfD8zA0XGO74fxOOiU2T3z6Wdeq+sSnWBbmuiiuOnNcyNkY8FIJlsXEjfCYxroUD/trGN5A7z2hL6h2Tkc8Ss4CKoEvONyvfl+KjTd5YxIMIVWyNzwO5FLQk/XGH8jkqCHxRbPakXl3i8Po+OhKnXPI1U245BEnzc5GPBbRKoG/TBFQdJIEb9AjcUAL+PKiwuKgs2ZqgyTzNPyBN9w4qZ7HtF2WntuHz7C4T1LveEw4SOAx8ORQGgrZCtSmEAOm7vUFIBPsGxZcfz/mPdA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHhQNVkzamZuWVA2bGEwU2hUencrTXlaem5XV0laYWM4bVhzbWYzN0RPcXVB?=
 =?utf-8?B?aDZoYzlFZmlMUjUranVidkZyNEpOaVBzTFNqNDFhS0FXMHpGMS84Z0dPRERx?=
 =?utf-8?B?ekJvS1crejEzTlQwVDNnZ3pYaDJJT2xZR2hTdDZUQWdwTHhNMkpuOVpWUVFr?=
 =?utf-8?B?MzBucU1DSkZyaGdxcHAvakROOFp2bVlLTisvQ252UVFBMExWVDRJY2c2UFFw?=
 =?utf-8?B?RUJJeWkycnYrZmRLSnVrQ2FGQURaMHZKaEthSUJ3RDVlYXU4anNYMWhFL0xh?=
 =?utf-8?B?RDFIekhMN1JrWkpsYm1Pb2EvQ0ZISGtOcjc0TTRRd2NUQjhwSVU5TzZldVBJ?=
 =?utf-8?B?R2xobGxrZ1dQNUExak1OY0xEL0s1MHB2Skw5Ym9GKzBEMWFEVWQ4bUhac2E2?=
 =?utf-8?B?VExUTWdsS0lOeGdwVithZHZoLzA4ckt6dVBuTmxPTWMrZURsZEVPSWFlOVd1?=
 =?utf-8?B?UmhqUjRxOXRWV0JqYjhOem1PZ3FiNHJWV2ljTUVhaXFNTG1ockYzbHNoOWYr?=
 =?utf-8?B?ZUVMZnh3cURydUlDRjVYZktJSkVEeXFsME56TnlzeTRUbmtyb1hxQUdBUnJW?=
 =?utf-8?B?aFZSanVGZTI5UUN0eGtoUVdHODQ5T0N3TEUxUTJmZnRQYzZYMEtNU0hFZTFS?=
 =?utf-8?B?ZGpMYVhsS0FzeHEyUEdKNXhMMTF3L0E1V1VOZWpSTGM1NWt3bk9SbWNxS2NS?=
 =?utf-8?B?K040eG52cW5wVitqMGZCM2ZyOWNvYnRJVDlXT3JObVFJYkFtZlhaVzE2ZThX?=
 =?utf-8?B?ZVVUQUpOTVZQVHQyTmdMZGlITi9KemlEekxDWjVnWVMvdFJ5R3B4aGxMbTkx?=
 =?utf-8?B?Yy9WcE5PL1Y5SXlJY1RHSXVGOEtESmdnSVkxblBjelZLY0p2NFE2ZlNsY1pP?=
 =?utf-8?B?UU40b1ppNnZmcCt5dFZmdVNyZ1J4SlA5QTdWN0hXYWlJT1R3MDFIaGU4SGZ3?=
 =?utf-8?B?WE44ZmM2ZUU2QW1OWm4zMlFZY3U1TXVCRWRudDZXekRlSnpZY1oyVUVKTExv?=
 =?utf-8?B?b2ljVHZ0a2NnYWtJRVhxayt5SmdDRWFuY3hqYVBndk5HVGNSaHBlbkxRMEc1?=
 =?utf-8?B?N2dYS2RSWFRiRVRQSy9ZZm1mbXJ0cXhJU0RVa2tIQTVVb3ArbnIwQVJ6b0JO?=
 =?utf-8?B?Y2p5ck9IbUtkM2Z4YkdHUk1pVS9URzhBcHBtR3lNWWU0aGtvaXZtWm80bmlI?=
 =?utf-8?B?WDJIQzFnZms5djhQd0s1dmV1elVCM0hsTmIvL2RjY2hqM0xpMlc5K1ZLNEk4?=
 =?utf-8?B?ei9EbHQrWW9hKzN0WUlMK1RPaXBRTy9KeFczZkMzMjZnUXpyZ2ZjSFIwVFZT?=
 =?utf-8?B?RlVFdmZpMUZRbHNVd0MzYTFDbG5TZHd5cncrL09HV2t1MTFwZmlyd3RwNmlU?=
 =?utf-8?B?ZExHMjlRemNMRGIzMmw1TnArL0JLbmgvZWRMc2dVSjZRVTdWRWk0bHFlRFBB?=
 =?utf-8?B?R0tXZEluNlg0dEN3R285MmllNkIxcmZxNHZ1aUk0aXkyTUxnNEtjL3oyUk5h?=
 =?utf-8?B?U2JJYSs2cFlsS1BvQ2RqbjRFZEF3dEZGUi9ub3VtZnFqQjVWeEJabldsN1Fj?=
 =?utf-8?B?SUlNT3dRdkFsQkt0aGpsY0pka05rZk4wb3lrZ1hINkNhTlBOZzRMNEp3WUla?=
 =?utf-8?B?QUtyWFhXempVN2JaM1hlbkkzNUNRMWs3eDU1TUw2dzlZNjdpcTRBNDYyRnR2?=
 =?utf-8?B?K1Bhck5Jd1RJWG9aM0VyWVFneU5ESFNKRWQ1cXNjdzhROXdKUWlndVdoNEFJ?=
 =?utf-8?Q?8gMPJBU8wiNogCDJ7w=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0703b5-8f2e-41a5-85ee-08dacd596d2d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR01MB4445.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 13:48:40.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4506
X-Spam-Status: No, score=3.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hello,

I am writing to follow up on my email.

Can we get on a call on Friday (25th November) or Monday (28th November) 
so we can discuss this further?

Please suggest a day and time to connect and also share the best number 
to reach you.

Thank you?
Patricia Baker

On 8/8/2022 2:27 PM, Patricia Baker wrote:

Hello - Greetings,

We are a Software/IT development company. We build Digital Solutions 
using emerging technologies for Startups and Enterprises.

We can help you to become a game changer in your business segment, we 
deliver enterprise blockchain solutions that go beyond optimization of 
workflow and resources. Get a resilient ecosystem to privately 
communicate, accelerate critical processes, and continuously innovate.

What can you expect from blockchain?

     Automation
     Eliminates duplication of data
     Enhance data security
     Reduce risk

Solution we offer:

     Blockchain Smart contract development
     NFT Token and Marketplace development
     Crypto Wallet development
     Defi
     Crowdfunding
     File storage
     Protection of intellectual property
     Cryptocurrency Exchange Software and more

Can we have a free consultation call – we'll tell you how to revamp your 
existing system or hit the market with a new solution?

Please suggest a day/time and share the best number to reach you.

Thank you
Patricia Baker
