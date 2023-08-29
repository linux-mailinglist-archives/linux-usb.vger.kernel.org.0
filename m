Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C9478CEEC
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 23:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbjH2Vmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 17:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241128AbjH2VmW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 17:42:22 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C39CE2
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 14:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxAdnCju4ArwRQZD9GykAoa7MQ68f/FpVXM4i04X22BWNn1azG5qIKzyDfBEyKZcDgGhN6tS+cwx4KdGeTnLec8ifnARGw9NO//ic+mp9/42X9kTG+qoyQGswRu588ZpjJfTtN75EiP4F4o+jevtrMg0w/0+7+LAyv9o1wGRoH0fnUJK5ivruMTP9wI1VW52HtyO9PeMoPk0AXFcYcnxKxHyuTWfVAwq7YN3Vz2/aPqKL4I4QfiGRIrzMTwosR/Ikz4YtfkfBhZskBIMknsMnQByNwtFjkbjFnXKmTkWpKRnwxnwj5aGhjIp9sQYMvJOM27Qd09AG6Srp0HdlIVHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmXVYgk9HsBuL5rLJPpCH1XaYTd5cp+wttmKP7fYybE=;
 b=S2Bl36eHbUYgMwXMpNk7GKR1/IUiZKGj8+b47QmfZaGFKVCmKp9mXWbDwcAAV27F9jr6FFivQ9bArI86WXAzwq8y13KLZI2n4J38zGDmltWUScC8ami1JmIMLONbeNm6R95U/TustDUTNNOOjMnrFOoPqMvAQ8sygJYT4AASAw5XAFzgbJEANJPfdMH+6whLyBmBeku2lTCfsODHhNxDCOr9BGCTE+fPc19WuQHTBD2apyIARqr3i5dVdxF/3HzkDPxttTGFOqRXgxummL8/s6/YG5KtUKFsGhWnI8IvkucsZmu80J6WagfS1NnqTKfAedUXFrA01uuitK/f0TrlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmXVYgk9HsBuL5rLJPpCH1XaYTd5cp+wttmKP7fYybE=;
 b=PaekXPsgBzGe+wuh5MtpW5ajRDm3T5PXBP9NnNvkNhtokxacMSm33wAb+MRkccIbbwrIMq9H8czrYJHBsLajwRyJidKjlUdLaFQh1Km5FWqvoC9MQLbXlDpICvIiYkeLF/v9U9MnfrE7iSE52Aiv0Rpt+6WhHargl7T4VrivCk8MJ6+2kepfexnAaQK+4NmAR2sMvQNjpJDlCE03JI6XHaMc+OsUoKatOZAUw8iI2XyMR2GXPHhLiOBL02diXyl+AYYW/v40QkIoLK08fJ3gfHdJH3G856U9oqwCqN8u5SjbeBMR5R+QxKapEMuSeqjPy0Ssbk6XphFRJNxsl4KqSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 21:42:09 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6699.027; Tue, 29 Aug 2023
 21:42:09 +0000
Message-ID: <16964970-5f7a-c80c-ad30-0a09fef9dc2f@suse.com>
Date:   Tue, 29 Aug 2023 23:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: alauda_check_media() doubts
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
 <001562e9-bc84-498f-a15a-8b4a01f172a7@rowland.harvard.edu>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <001562e9-bc84-498f-a15a-8b4a01f172a7@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 67390865-3d39-4457-40bd-08dba8d8cbe2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUUAw2JRq6g8MthKgLJNgZalhkIWKyqEd8qcLyf52GX3HFTzGp2zXIwGZyaUuVUIS/z+/KZhJw2dcMEob0B3xeV/tIrpQL++NILxZqk7ZPglsvBFcx7pc5wuor0N95ME87t5m8UYtFfeT2p2WLK7VUYgcwcVUvjZPO15a4GTD6kEuTrxgDrDGMX5G0GCGBIvnJqMxm/d3u3fq0nBsrc77MiCN8Wp0SweGONFxxKNn0atJI5vvaNU9llJMozrw9Wa3mk62UDzU7X6YWIbG38+OZC9jB/iPYBL9CvEB0k1fYKjL1pNjMob3HP9EvfAraNV6+C+Zdm1tKAlOUyPyOvCfJ+oWXdR3kmew4BJ0k1pUle3+2cJcGCZO/fGfN5K0CccMspPnHJuGx8VBrM8ROOSpkTZgOHVVIiQIUegEIe/Z6ST1d19ruQtl7QaaDuGqiuCUUVrsrBXbijy/d82ru0TZfxuElTkZMRfrGiIE0/cKBsLftYoTGxqs9HGJ7CN4g82J/Q/y8mCS/O/VsEyzcwupt+FGq4zXlNogOmCGlM3UNu7MVFSP0qeIwVcSGRr574bn+9uYh9aGbxMC/mnGX0b0y7AVuWcWK0SBEPmPNkeCHjjxpflV+pKiPBMT5gBBp4SWgcblIqHJj/I/yUkNw8CwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(186009)(1800799009)(451199024)(31686004)(6506007)(6512007)(6486002)(38100700002)(36756003)(86362001)(31696002)(2906002)(83380400001)(53546011)(110136005)(478600001)(66556008)(8936002)(4326008)(41300700001)(5660300002)(2616005)(8676002)(66946007)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXgyMElEOENkYnkzUnpFcE5rUlRtSWFxTnYxWXNlZ3BDOHZ1aFJWTjNHSDl1?=
 =?utf-8?B?NU5jbkRPcDBqK0p6V0Z6YUpWVEhKcXVGUGVqNm0rNU9oSitxK05TRmo0Z2Nl?=
 =?utf-8?B?ZE9mVG1XdkI3aEIrakdKUU0vS09Ia3lTRzVaYlhuK2ZtcFFoKytnOElzKzZi?=
 =?utf-8?B?aUY0R0xTa1FvdWM5Q2dybHAyMEJsVVRnQUY5VjdWNlRPdGVCZFRMSk91VEQy?=
 =?utf-8?B?NmZmQjBNSGE5eTNuVldXTTF6SE1ob3dGUzdCckxMem9IU2Z1bU9UKzhQQTBM?=
 =?utf-8?B?aHZxTzJXa0FnRzRoMU95OUdBV3g3Q0NNdkFHNVdXK3JodW9RMk5Tako5aEJO?=
 =?utf-8?B?aVF1WGNTLzRDVHJFckMrOHdyN01zTzNjbkZhMnpraVBIc3RtWDVUTWVmNGht?=
 =?utf-8?B?dndkY0FFWjAyc0d0a3NTeXk1RnFhVHBwQjc3NzRQWDRGZmw5Tk5IYkRITURh?=
 =?utf-8?B?N3pxK1E2OFkzbUVEWGlyNXZ5T2p0NENydGdIKy8zcGZRMi9XYTZLcHNRRkla?=
 =?utf-8?B?bzVCd1dPSGxPRjB5YWhyZURONXc5MG1wczFKYUEzOXlpbElSaWtMcklpdGFR?=
 =?utf-8?B?SHluWmFvdTVoVC9kNnF1eG4rcSswTlNNY3N5Sm1BelFJUGNEOWhjV2U2c25B?=
 =?utf-8?B?bjhlWnYyM0JPM1RaS2hWcWlZVm5hL2h5VFF6c0wzTGo2MGI0Q2plVFh3TEhj?=
 =?utf-8?B?dlBYbC81MGZ5cXRrSE5yUFpVa0Y5Q3I1UlNrNXN6dE5jaVFUeHNBTXkreHhQ?=
 =?utf-8?B?emRNYlNOWEtZOW5pTlNEcGs1d0VOcEVsb0lkTU80QlJITTJDUExINEI0Y0Vt?=
 =?utf-8?B?SjVkb0J4NzVGdWVvSDY4UC9RZDRRZVYzaTEwdXZmNGZaTE9JT1hJYmFXVFV6?=
 =?utf-8?B?WTNvV2VLQ0lWa1IyN2RXbjFpVHR3YnpmYmU2QUpJNVcrWk00MjYxLzBPb3dG?=
 =?utf-8?B?WXZ3dDZxU2NLUXROUmRlZFZtMUxJbk9BT2RPeng5dTduUC85ZVBnN25JYnhw?=
 =?utf-8?B?cUFORjNoM1BHTjFlS0ZEeHF5TGw3NmdqcFBtRmZIYmFmSXBvRDNTOEJ1dzda?=
 =?utf-8?B?ci84WXFPb2MzOUh1bG9hckRlUXFPTFR6TlhMYTFrMnovZ3ZLVVBPaVMzT0t6?=
 =?utf-8?B?RTI5clQzS3NiZ1pqNFVMNU9aT2FTV3htMUlzM1JzSkd1YkFwTzRRN2IrR1Uv?=
 =?utf-8?B?Z0lnaFJGUlZwOFQwbmQzZjBTalcvUVM1OTNyNno2VlhSYS9pZnpSVC9DS01p?=
 =?utf-8?B?ZFVWaXFQWk1MMXhVYzYvdHpNdnIwVlB0VlUrRDA5K29pUUZBcTkxa3JwY25s?=
 =?utf-8?B?YlFXUXhjV3VEN0d0S2Z2eTlWUUlreHlRUjVRZmY3OXVGTm1JQ0tCWnBoNTFX?=
 =?utf-8?B?bDZqWVhBcjI3UjZ2a2RXM1M1TGhsNCtMSU50UU56YktleWViZVJqUnVWTUdS?=
 =?utf-8?B?QmxQTGhWNkZmWTZKc2lvNnhzc2JnWFhWYmNFYjlWbnhFSDF3QnEramJBSHdU?=
 =?utf-8?B?aFR6dnNYdVRUcE93Y01QeE1vM0dwemNuMDlhbURPZVVxUWFqTFhkaHYza0VG?=
 =?utf-8?B?T2xIQzg5Yk9EOEp6S1ZaUGxkbTNUbEE3M2w3RHIzSC85czd6d0xleHZtRWtW?=
 =?utf-8?B?ZUNQUnorellud2pYS0k3ZjdzWmpUVHZHUGJJR1IzWTQzQ1M1Zmk2V3JsaGU2?=
 =?utf-8?B?WGJPOTJaNGh3ZlAxVXJnaEVGbjd5OUlCMEFvM1p0aythTm1kRnhmRTlTRDhI?=
 =?utf-8?B?QkZIc2RJOUxoQWtaL0ZBWi9aVUhra0JwNHF3dEpXUDRyQ1N3QjIrZ0srWFZK?=
 =?utf-8?B?UHJGSXI0TDRQYmJEeGtwaGtiL1dGdjRoT1lkM1ArREt5K1hLR1p4c0g4SjZv?=
 =?utf-8?B?cUtQMzFrM3NiVGFqcnE4SDNwcE55czVoSXUyKzNQKzdTWFd5MUxvVzE1VHhG?=
 =?utf-8?B?SGJ2dHNZMGFjSkI5UDRJTnRKc0lxTEdmeTFZRXp4TGhTbnFRT3lrV2NMeE85?=
 =?utf-8?B?R1ljTFRObnNyOVIrK3ZBTmpSUjEyRzlnOTJNV0J5MjJKOGw4ZGFOOWNZQjdO?=
 =?utf-8?B?MmtSR2FMZFJvU3JsQk9KZ3dENjVSWUpoVVYwT05BU05ZZFk3RHN2Mnd5MmtU?=
 =?utf-8?B?Z2VnUTk5SWNkaWdEVWcycDN4NzlSWmlROUR5VGVFTmdwSDVmVG1ZT21hNnEz?=
 =?utf-8?Q?3zolJnndM94uW8O0zvSn7gDpI2z8wNK4IK4l1xlBOtIj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67390865-3d39-4457-40bd-08dba8d8cbe2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 21:42:09.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GKDGj+I+C/flBR8deWDe7BsNs6a9v1eBONXszUTPoYgXP3YOfiKehZwbEWWO0P1F82Vc1MRxjDEQYb76y1nsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 29.08.23 20:49, Alan Stern wrote:
> On Tue, Aug 29, 2023 at 08:14:05PM +0200, Oliver Neukum wrote:
>> Hi Alan,
>>
>> as you did something on this driver, doesn't
>> this condition:
>>
>> (status[0] & 0x80) ||
>>                  ((status[0] & 0x1F) == 0x10) || ((status[1] & 0x01) == 0)
>>
>> look odd to you? Especially the parentheses?
> 
> (The actual text in my copy of the file is:

Yes, I rearranged it by the parantheses.

> 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
> 		|| ((status[1] & 0x01) == 0)) {
> 
> This probably doesn't affect your point...)
> 
> Certainly the layout is a little peculiar, and the extra parentheses
> don't help any.  But they don't really hurt, either, and the meaning is
> clear.  It doesn't look obviously wrong.

Ok, then this is just me. THe parantheses would make perfect sense
if the actual intent were:

(status[0] & 0x80) ||
		((status[0] & 0x1F) == 0x10) && ((status[1] & 0x01) == 0)
> 
> Those two lines go back to the original version of the driver, added in
> 2005 by commit e80b0fade09e ("[PATCH] USB Storage: add alauda support"),
> written by Daniel Drake and edited by Matt Dharm.  So it's been around
> for quite a while and there may not be many devices left that need this
> driver.

Yes, I know. Hence my question.

> Did you want to change it?

Nope. I just looked through the log and saw your patch for the
failure of the transfer and the subsequent test looked
messed up.

	Regards
		Oliver

