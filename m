Return-Path: <linux-usb+bounces-382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F97A65A9
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 15:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C376528205A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 13:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A1B374D4;
	Tue, 19 Sep 2023 13:48:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FB3C07
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 13:48:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9135183
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjUtysDnvESdyvJCUbYPpCqgqYf3hpPDSfwZwZ5GTPlWmpabh8pEjnGEwXI1ilPG3yR990ZDb6TntvINPIm6d8gbd6ShEZ7+y4Vq1h3q5BlSPhIfy/+qhg3C4mV343R8SeGaAQwoeXtguhBG85H3BoGgJPqOiuX8XHEiruFXSxKpC6hWHuG0oXzOlU3sDYF7aXxyb06MvbI/zZ0Piakr+ggZGVQqo6grfR7ow+ZHTSj7HjjIzta1Iisin9LRbQLqOJL/SunsfXy6g6C2rhOWvHaH3HU2G2lWpKJDhf1p8+VRa/6QnJtw/dw81X/6VTaEMbRNyQprRJzUoGEVJ0VwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z3Fc0WzP9zLpWt3PzDkpIvf3j5qPB3wAUgdpZ4/BS0=;
 b=hOsjO6pgqmjJWw8EB8dMlaJiVaE9vi+5iNFKDNW8SAevYUtZi+wWHiWE/7byD8e2EOSvGMYm5po/W/K+i3kZGf83n3vsVoa9tghpAvB0TCW8l+FXLvhOYakYSrlkGfXTpDOAqLM6hjaeSGaj0/9ODAGe784CHRmmHO+9mSA0zA2hUA/Vs4tMRyUVnZjq7NTLZkkRXrxeD3e5/wwcE/QG6CMbv+e1H6HcJRGea0FhMPzQCjoiDeT4UOdnF4d3s8GoEcgZF1gWLozVgDD5zl0a48+gQGDATM5XS3OxL8ungYWHlKKOqLE/cw2n8PxCfoVYQew1tqFczZUYy/PiEIEPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z3Fc0WzP9zLpWt3PzDkpIvf3j5qPB3wAUgdpZ4/BS0=;
 b=KJ1a5WG04J4n2eVdtRUSdB3y7bwWSCEumMwyq/3Jq/PDM9coD91Pueh6CDf/uyDuNxomy4hO14rI1s4vuughGe1JCwbiqyQGHMnmZy9YxZ97GpyGkkiPXNzNtb6o7tvS0T8zZHOG1/PQ5w8EgGBtH3pkS8VIKGMhUnD3hC+cWf8K61JBioaPQNnrUNK+Uit9zHzoKVM9eXmaoEPZTwoBeGvlimDoNbrbYqeYMhSzoVChFDFrps3h7M8WLxfKzZQyw6SfsEE8xorQbsIDCdF4/F5R1FoAn8l5nqGv6sgegvJfhYqOygjkLnzYnxPd7mQqDLAUjvV2xji6BUHtYt1a3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 13:47:59 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::527e:f98b:e8c5:2562]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::527e:f98b:e8c5:2562%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:47:59 +0000
Message-ID: <d910b948-7448-46d3-ba98-42bc6e644626@suse.com>
Date: Tue, 19 Sep 2023 15:47:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: SanDisk Extreme Pro 55AF and UAS
Content-Language: en-US
To: burcheri.massimo+linux-usb@gmail.com,
 linux-usb <linux-usb@vger.kernel.org>
References: <8d8df33f29e9abc0c20909c028863e3b9674921d.camel@gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8d8df33f29e9abc0c20909c028863e3b9674921d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PA4PR04MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ef1397-5e06-481f-45ca-08dbb91708dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y9RJRVymXxkwJrm3BwDYp/BmrPeKF+hO+6F9KyZ7RRWhaowQAamrZvaqXbyB0bVqPKCt8P2eyo6iZjgm2rgKn2UpNZZArywPDD8Pru0y9qanpLVJ8DKATcVKXASoo9X8iRJa10cs8OJtqRIphoHz1LUV/G4zSATJGx3XpDoP7TPLsUON+0n5pUcAenAApwy0vjJR44iQNpC2KiK9wzz3qzWHEWxbcxxPJAQTa1jG6v3TXhFzXfUlUE7Ch+dt9sz5KieGmyRoiiPah01XW7fpnPpG59T8wkL4OVIJvw3Wl4CcKCEeZgPG+KGATN794Wo8YdRnNBKuMAPeOD8mlkR9O9dgP+uslMkUlz7Qy4Fy1Wdf++HYVUwHIU89KUiIXSgh4qQGhHP6IPQ78yGrVElELmHl0rTrx9zeIRU5o0airaKOkWNdjpvsMAMS9wu9o6ekQkZ7uWaW2/7LcyGgE/D1Yl2xXcJmDtSuewegysKMmGXbqUdfHlHlWw2e13YQkJ0MMfOKQTKxpR7g4PN13E9gG6MEDUX7MByY92nDjA8Nu+2REf+owm4EGbdPXuMEy1pu+GXLrlWWnaxScY0fZt7EtLXJq32OAJ5BFHRx1B48mTefSM32diiysLrYMaZ7Rf3FojyHbBpBVWl82FpElB4j6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(1800799009)(186009)(451199024)(6506007)(5660300002)(6512007)(83380400001)(2616005)(41300700001)(316002)(6916009)(4744005)(66946007)(66476007)(8936002)(8676002)(2906002)(6666004)(66556008)(53546011)(478600001)(6486002)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNLRDcyWktxbklFaEU2eWxTRTExbk1qUk5jT1JZK3J4S0hDMVAyWmNvU1c0?=
 =?utf-8?B?S1BSa25HUnMwbG9VQlk1VWZHR01yNTljQlo3SnlVWmx6Q1BaVmo0K3V2Y040?=
 =?utf-8?B?aFhZN1ZUSTQrMkNsVkxRNkh4NzhNVmF1WTQzQndVNzIya3NBTmNGejRLWGlp?=
 =?utf-8?B?anRlWUE2eERwNmxhdzl2M3ljN2JTRGpsM0ROazJxVkJVa1lwdk1MLy9ySTZD?=
 =?utf-8?B?SnFJY2xzSWVTUHl6ajUzYklEemRBMXhEM0JHZ29va1JDeU9EWm1xWDZaeHhN?=
 =?utf-8?B?cVZrRDZUYzJQaVVCRElla3pSNXYrdGsyd1YyTzJhRXRBWXpLWXA2aXJ6NGlo?=
 =?utf-8?B?am9yK2o5Uk9TVEUzUzY0czlyazliRTZNV1dsVlo5S2xoN3FKVmMycDVrdU14?=
 =?utf-8?B?Tk1NaWd1ZkwxdHR6QU5YNjNwUkVUM2RLTFY0UmV5RTU2WU1sN1JXUG9mNXZv?=
 =?utf-8?B?eUxmWWlvWWliSjlRNlQvRjVKbDQvMXM4MmZYMndlUVFZWlZBWUg3VnV0T3hm?=
 =?utf-8?B?Mkt2ZTBxMGFjdDdQNE1LdWU5dHJIeGkxVmE3ZVE0dEt1aFNSeXR2MmRlSENR?=
 =?utf-8?B?N1RwenJyQlYvcStFVEdRTXMxdEVBUlVIbGtpZDQzb2NZNE4vZVd3N0gycmVX?=
 =?utf-8?B?WWxRVk1BcDFOYmFGUWRTOVpBRFFzMVJBeDQ3bnBuMXZnb2pQVTlDRktWNVBl?=
 =?utf-8?B?eFFqM2FCR05nMjZaZ2xiS2JNZlBWRTlFb2FNMDhIYmF1WlFqdzlWTGUxQWlG?=
 =?utf-8?B?WDUyVmZkd2habDdpMVhpbFdISlF0YzRFVW5jV2h5NEIzRDlyVEZBb01lWkNr?=
 =?utf-8?B?RnovQVhjL3pHUVFRaFdrZ1NaNWhza0w0MmlKOExVeXBVMURmRUN1TnRXOVd0?=
 =?utf-8?B?NkxBU3loVXU3OUhaNVJqMGZBb1lLTjFjNFhQaWV0TGJZZ1k0ZmcwdWlHYlZm?=
 =?utf-8?B?aGZNc1QzaHBMb0lpanJtaFRUdXQvWUxsTHlyOGpTalFsUEJMbVdjeHNJMlVn?=
 =?utf-8?B?NEYvcDQ1S2RINVJJSDE4bFBRTXFnRW4vZTdtbVVobDczQUptY213VTV5Y2pW?=
 =?utf-8?B?TDVxZU9XZ2h3bWlpcTVEalg0eUQ5MndBODNBa3Y3THZRcDBkQkpEcFRLN2VK?=
 =?utf-8?B?NkQ4bng5bUZPQTY1aU9jeVNXTjYzalMzdHBHbHJkMSt6R0xkNnRsajNpM1Yv?=
 =?utf-8?B?b2FzZW9tbTBua3lJcFp5cEFTcVFXNFluSGdYM25TRS9QQjNMSW9tSkN2QmF2?=
 =?utf-8?B?c1BGdldqSmdFUVlaUzE4WU1TTVFTNWRYSUowRVowdVVubnllcU9MWGlPdDdN?=
 =?utf-8?B?TmJHUkxRaGNwNEZTcmlQbmIrbWRpaHM4eUtEZmlnM2JVWXEwQytKazFBUmg1?=
 =?utf-8?B?eFZNa3VrK1JGNStQQk0vZXdYcW1YazVhdjJ4dzhyZzJKWGxsVFZWUWw5bndJ?=
 =?utf-8?B?RlMzYWd4R3ZubW1Kd012enJXU2lxMkNHYko5VnhpaXBDTFlITEo2UEVZNVRk?=
 =?utf-8?B?bytpeHluTWdSSTVNMkZseFU2VzE4TnRpR0lVKzBBWlgrNmNVb1YydU5rdGpr?=
 =?utf-8?B?a1NNQ0ZrOXdQWkgzRUFvRnhSMVc4N2J1YmZKa2UrckZsb0FLMnFhV0NHSHB6?=
 =?utf-8?B?NEpUOEI5OUN6QWlySmNrdStDY0FFS2ZFcnBsbGpGOTlTZWR2YXVJY1FscGZw?=
 =?utf-8?B?RjVIN0tjRjNLaGdKekIvNzBHNXlVcVZ4ZkFzNFp2YnhodE9kaTBIdXJzcmNK?=
 =?utf-8?B?eHR0WVpWZG5wM1FPak9hQy9KenB3ZEZCUC9CQWNZWHM2SHM2SERiZWQvMkIw?=
 =?utf-8?B?eUJhSldGV2xqc1BmcmVRTTJFTnVwRy9BWXB1WUxoSTRibFlaUWtER290dXNQ?=
 =?utf-8?B?SDFzVHlkK3lFRVp1bUFDUktNMENVc2RkK0ROdjZjRFAvNHlEM1J3VmVDZE13?=
 =?utf-8?B?UFVYNUUzamNZbEwzampiOEN3U0hBL1FFVkF1QWN3ei9PcldUQ1Z1d0ZJbEE3?=
 =?utf-8?B?SmI3dDVyZ0F0NndKcWNvWFVENStBZEFKMGVZV2ZMbjcwVW9YU3RKWlk1MzMr?=
 =?utf-8?B?cHJyZVUyQkpoZG5PWjIvTXpxNmI4Tkt4b2F4MFppajlyd1ZaYlhHQ2cwbkY2?=
 =?utf-8?B?VzIyUzNiUmlqMWgvTDhSVWpHK2Y3OGpxbTNCZTVLSUdUMzRBYkRvWVlqZ2Rj?=
 =?utf-8?Q?1FGypAO8Qcc68GqpSAYgmlXpe8Dar5RetUqEEMUgrOxb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ef1397-5e06-481f-45ca-08dbb91708dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:47:59.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdmHfT0psO8wIt7j49Z5gSjwsuBKCcgzwQKHFfqaWJV6HMwiWVcsbzJCvnJ2VQro3lnalgsAqNnqV4g7nloS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7630
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 19.09.23 15:34, Massimo Burcheri wrote:
  
> Searching the web for these error messages I found I needed to disable UAS and continue with usb-storage:
> options usb-storage quirks=0781:55af:u
> That works, but reduces the performance a lot. What is broken?

Probably your device. Are you using bus powered devices?

	Regards
		Oliver


