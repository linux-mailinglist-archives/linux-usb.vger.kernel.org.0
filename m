Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E087674EF30
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 14:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjGKMm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 08:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbjGKMm2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 08:42:28 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D099E
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 05:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpOybKigF4sm1ARUfgBjmCHIQ8QrYOzowD/ZymRKpCsXv+VSBwSI95tXNqjB+DQXEfj8N4MfjiYX+QLZxwNIYkuBxuAty80ajRApXtNoyYFO2pGKJJUEooTB+ou33G4D3izIg7SyB6ZsnYa6/LaoR6zE7fGuCvQyHRP7kZdYCLlvnLar1Y3Xzoy/FbfV2tB5UdKfmDil3d07wGVLXfjLJUJGmvhVUNfMCyCWsORoqEmKKdNINFFCT4XS2+QFbgCi2JIQW6xSaCiA2BpQDuDxY3CuiwB/IOGCPAVas7entTOxO06h+EYgse/cRQSk+cbWMiMvvWTc5Q51dYAOGB6EfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkU8YZXucT+L7kCaeNSAI8CQvM9gHPLZEVRCy73czEE=;
 b=mzXyaIzjf1guuV+RX/eETCK6iU0QH4MK2tWdwpBIFwjQ4oSxD0pbYEQRGyWyfVhP6xjowqizS4BV3rQ9UtmEb83t8ZKK/lfDLHcv7GCXLvjxWBov4EINRGMOQKJz8oskCEASzej3Kk//QLsJXGwmL88LQAhHz39AmURf3C0NIyM2RA/eFRDP5r9cYT52uC3u2mhbt6+frh/I5h7OkMlISSxEtNYC0mjXRSD1pDFZBsD7rzKUmFtZyGX/BRdM6zfHfQ2R4RePh+ZwqwkNNEyY8wJhsz7Z5W/I9MPZtL+M5Iu0bfSJBPoTIF09pCENStbSFhust0tSwTLvENNMucZ2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkU8YZXucT+L7kCaeNSAI8CQvM9gHPLZEVRCy73czEE=;
 b=xlaEr9VpwEahi37iQNfHT4noeZWf4sHhGILzhB4Su0Hq5t1hinWvAcG52uX75qoNOKJichD+5oYptzt6cwkY3XmCp2L6IEP5S0tjfZ3u8naxcVz6SSjUctnyQ45bfGiHhfp2JdVY02AwrPSS06qix5waH9rBybYklbMPCYk1IhxyNj9TcAYanePgHtBSR8r4toUydme0Wrkk7452m7YfES2uJ0vNSjuMQwWIJRlpvyiYN3QAalr0DDxpbbViWFEInTQnjOw+KnXRuWg5YQmyd44U1pkrC3Q5okI2bUBeFmFtklG6ZZgmIBbK5UhRGHU8JsVUvnRTrM55HzJYm/xuCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 12:42:24 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 12:42:24 +0000
Message-ID: <413fb529-477c-7ac9-881e-550b4613d38c@suse.com>
Date:   Tue, 11 Jul 2023 14:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [syzbot] [usb?] WARNING in usbnet_start_xmit/usb_submit_urb
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
References: <000000000000a56e9105d0cec021@google.com>
 <000000000000e298cd05fecc07d4@google.com>
 <0f685f2f-06df-4cf2-9387-34f5e3c8b7b7@rowland.harvard.edu>
 <7330e6c0-eb73-499e-8699-dc1754d90cad@rowland.harvard.edu>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <7330e6c0-eb73-499e-8699-dc1754d90cad@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dfcdafa-74a1-4d7e-d02b-08db820c4648
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrR1JLLlrgqPgQ1W0eOZfcfJNtQuL+xEBn8w3pH7g40zad/+UEz8onWH9nNMdqXLw4rL3JjEtSKztYzlLc4x78K7BJVpdi6d395vVf3pEoYTPTQgphJfzaKKyOyxD8gtR4KIxMdWkQcoLTTJHWxUzdLjldxgu2JpQt+thuxqzo5mEfvSiXD61d5KxDuGcRjGZKfKl9CNKFxcDez6gASNFtkWTrzkpdA03/lwcUyJ9YGKp2z4HvKayc8KJoDdh8IbVtXcl4JQ8nFCljniDJPF024/+YGTxGItXXA2di+JyRWt4SfIHbB6LkqtEG5Q7j8CeTiWkr4gB+DA+dMSUQ6pDGw6JdUDY5qSaZFrMIolCOlzroDW/csDSVZS52R/xxOjOngwrq/we+h7C6BRGCBMXI/JXGXQidIimbm8dOhPcuRs5T4aFr0qOnXQVT7+2PjaO9bPwDPTER1Ldr+DJ3RujMX50uprCHg6dFqUQt7C0ChSunt5DC5fHrNlQqkL6VRI3UHpXvODRZn14QqnXG4CrYNi2gdEItp3tpbmuXxJIjl0JcLfvYG/QK0K1USPvQoWsnyOge2Q53GpU6NEejWXIKOqz60OV856ERELdlIfMs1dliKU5CF50NisR9vDA2Nzb7U4fsxziH94bKIes5ZrJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(5660300002)(8936002)(8676002)(83380400001)(2906002)(4744005)(36756003)(2616005)(38100700002)(31696002)(86362001)(53546011)(6506007)(186003)(316002)(110136005)(478600001)(66946007)(66476007)(66556008)(31686004)(6666004)(6486002)(4326008)(41300700001)(966005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC91TlZ4ZXI4VEV5OVZKYnh3ckNNbU4zS3R2alZISHZROHdDTTNCcGdGdDN4?=
 =?utf-8?B?b0k1TVdMcnBDUUo4a3JsY2RidDRqU05ad01heGFxTFZ1eFBZS2xYOXpXWnps?=
 =?utf-8?B?OE9NSHcydzF2aUdUemh4bWJISnFua3FFSjJEZmxISFR5SU12czNITENadmRV?=
 =?utf-8?B?cnl0K2J4ZkJqdFZOaUZMbUlKWDUrRlg1NVhYY2R5UmJham42eG1mK2FBRHNY?=
 =?utf-8?B?Y2NMQnVNU2VLZkJhejVibVVFc2t3RStUa3BicEo3cWt0a1p0amg4ckZYQzZp?=
 =?utf-8?B?TkZHZDhKWllVa2ZrY29Ja3cvTUNDR0VtdndZR0ZKNXA5WWxXYTRSSUJmQ2ly?=
 =?utf-8?B?Tzg5SmtYSmlLb1VRRmtFZVRlQ3hBWmVZeExsU1hKaG9nT21tZjZmZlg4VWZC?=
 =?utf-8?B?WUZEaktJMjBqZ0puazhTa05XMUc2NjVTZ0xpWENEN0Frd2g0Uzh1ZXh0VEM1?=
 =?utf-8?B?N2QweStZeHpzVUN6a2FGMEhEK3ZvTk4zNlp1UnBlTEhWZE5MY0czN3Q5a08v?=
 =?utf-8?B?T3dqWjNPUWtoMDRlaW1HWi9rRUs2N2lHOUhOVUpjV0JUT0hsWFlqTWlFOGZQ?=
 =?utf-8?B?TkhCYWQxaEd0S2ZMT3JBK3prREtjc29IWnVaeFd0QlFSSHBFclJWMnNaaURP?=
 =?utf-8?B?Wi93dUt5bGFFYit2VGZORWZUMWdNUElvTFhlRUsrRHlsN0ZhTkZUcFU4aU1O?=
 =?utf-8?B?QkYwb3hPOTBmNERsZ21pL251dHdCbDNaWVNVbWVXdml6bmRXWDY1dlY2eG4x?=
 =?utf-8?B?Z1kxb2FBWEtxVVl2VVM4M0lhNk5sMGtVYjBZYUhIYk5EdGRNTlJxRXQyQ1cw?=
 =?utf-8?B?L1dnQXUwcThNOXNVUUY0eURES2pJQlhydDY5VExoY3FuRW5yVWNadVd2R3VL?=
 =?utf-8?B?eVNKcmlocDk5OEd5bDJ1YVVZekIrVkxMbTdjb0M3RnlOVXkvQ1Z0VFR1TXk1?=
 =?utf-8?B?bkRlaXArRTZSUlJ0QWdyN1laK3lDeUI4d0t0YnR6MDdoYVBTenVCK1RYV3lj?=
 =?utf-8?B?Y1RHV0Q3eHRvWFFTNDdWcUFyNjV2bStHbkdReVNCSEpmanFOcDNRaXk2Zkov?=
 =?utf-8?B?UGJNVTkzb1FWT0hpZUxzS1RXeGtuWU4rd2Q4a05oM01ORGNoYnVJY2pUa0dC?=
 =?utf-8?B?NVNzNVNreVJtMVlwYXdsQ1ZSR0RQNkpVYmNpeUVVZFZWZkt4YmFWOGZGNFZh?=
 =?utf-8?B?cmYxb0Y0UlFZeUtmSmRDYzlOajhjaVdWc1FidnFuZXpWYnMyZUIxMVg3UVJB?=
 =?utf-8?B?c3lPRmJsQzhkWDVZbEdXYXZvczFWTXczbkl2VDdQRUNibGZpUE1ZZllRRG13?=
 =?utf-8?B?WGhMZk1Kdm5mOWRlcFkrR3hzV3l4WU9VbExZT3R4UXRxVWozOEZCNG9NRXlI?=
 =?utf-8?B?OTNKeE0vYlBkNUpWeEVmM3NzeXhxVFltanBDS0JIdVlGbEhoRDFWTTNvbjdD?=
 =?utf-8?B?MmI4ZkFlakQwVnpUVUR3dnJPUUt2eHZvcUVaSHBuMWhwZDNJbXZyZnBCYTI3?=
 =?utf-8?B?YmJJWTUzTFR6TGhqQ2IrSXpvUlhGbzY2MW9QTC9wQWt2b3hDczZNcGhrZW1w?=
 =?utf-8?B?VldXeXFVMzFPMEpqdUllZlVabTFXVklNNnIwN0N2U1Z4bXRQZ1FvNUhodDFF?=
 =?utf-8?B?Y0tMb2pnMkdrOVhyZFEzSFZ3dUI3bHFPWHowVUdmd0RtTW5XTDNEbXZpbk9y?=
 =?utf-8?B?MEZDU0k1b1hPRFB3QUNnc2xUR1I3QTFYOG42TEVPcmRQaXdZd2U5NWp1Nnpi?=
 =?utf-8?B?aTN1M0RnUVNqNzdsbUprdWJZd2RPbFZ1Y3QxTU51bktkZEpKZXdxbHcvTGxX?=
 =?utf-8?B?WmZlMTRub0VzdmFON1JsQldvSHZzK3RsZVlDa0xFZk1DMTZIb04vQzBudHhF?=
 =?utf-8?B?NldEWDV6Z1FIUFdRYVRJVTM2Y3dGQTBGcm9nS1lzN0QwT0FnNzAxZXQxN0l3?=
 =?utf-8?B?WXBob0xwZlY4aXRzZ2sxMHFiN09VbzdzblFMdndoVisvZnQ2VmNzK1BOQmZl?=
 =?utf-8?B?L28veldoT056dFowMkx1aDVWakxIVkIxblVHSko3bHVHVnNrNjdScC9GcDd1?=
 =?utf-8?B?RzRkZmwxSUNuZEhPdW01UEJIUE5hVXpXWDZLSmxUQSszRi9sMWRCS0NtajN3?=
 =?utf-8?B?VjZqTGV2R3VvcnVtK1lTTlhjN2RQbDE0a2tPRDJxSjJmMU5qNFVBUjBvVk9E?=
 =?utf-8?Q?L4d/heA0jKcHeylHSf4iQWk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfcdafa-74a1-4d7e-d02b-08db820c4648
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:42:23.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgZvEhCkhvY6dx91IZohdsiNjqLxK18u+CEMjcMk95fdhIAEyOsvNVNFPV5yt4GWnTn3W7uQyJGLS9ns5leWsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23.06.23 19:16, Alan Stern wrote:
> Oliver:
> 
> I just noticed you had posted a patch to fix this same problem:
> https://lore.kernel.org/linux-usb/291da1b9-9f71-0f99-45f4-a25a259c8d6d@suse.com/
> 
> Do you want to submit your patch or would you prefer that I submit the
> patch below?

Hi,

yours is more elegant. Please submit.

	Regards
		Oliver

