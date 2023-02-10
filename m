Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E481069211F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 15:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjBJOrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 09:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbjBJOrG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 09:47:06 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B441938B6A
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 06:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Epg43rMEjdJlTmsaKg4WM2FpNJR9S99QinoeWUv8JAvCcbHCQiejzmeuyz8EatxuAwegUHgV/8S91XUgiO5qr6TOyyQCBTCLUKRLQwY760lHzYHJG0GQ3vZjbxWql7VP7ZDOMaaOfR0LLySeeuXy8jQborDhLpVXeI24UhxN9BxkmfhvdZfPVALT+zawIv6K57OBAfmnVIlNXwblkYF2Kq0BH1ahZYT0/Gl5tcibKYpRfKILBOfOAXehRBcc9bUoq3XNyzAYjeZRIdU+8wOY9VIElnoHD8dDWh9xmHBmGxTEYplDHDKUc1NbvMsCE2owCO16x7TJ3LewLQ75akd0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibnt0gQltq9acz8K+mSxE3Gqk4eO9Qpu4rYt9AnpJrE=;
 b=ceo1piSxkezK8CNdA3blP90h39Gqv9kI2HQp29eeBuzAuHT9GNLwyJWEORS+rRdnyjD03l4YGBGKn3ibBx61veDFR7MrlkGCgO3XTd7IL9JMDL5u0lApIGDUrVkyC2UAVmS7+PDAn8ODzaIgokLrDUIZCpZ4mB94dcT4J/xwsM+nMX1DvLLiTux0y3ZmZKJAUsgkZ+0gPHqyBH9hJ5Odvee6O/Hjt7l0IDAQT/2FSzDjVDZZSWOc1ol25VKbjWvhJOhCUz4M5kKRjFoJbujWxp/9UObP/Vji3z883oQdZCEEjVEJZRD+E9ufFCVArcpnPvwPB+5uuVHQ+akHC37iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibnt0gQltq9acz8K+mSxE3Gqk4eO9Qpu4rYt9AnpJrE=;
 b=pQW29kaI6V6VEEkT7UeAF4FprSmpTONQF6gySWM/LJj9DVKsvWfzBJ3z4/CcR2sTRJBVNU1y35G28Onv70mR7gS5GdkxhKHd6Ck5xtc83ex56rdnUaA41xOpuIfMTaprFC0OY4c0ix9CwlTOLBcO9zlYD/y7gCs30Hj2bFPSn0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19; Fri, 10 Feb 2023 14:47:01 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8%9]) with mapi id 15.20.6064.034; Fri, 10 Feb 2023
 14:47:01 +0000
Message-ID: <077f39f2-9fac-c743-1c97-eecf4512b1dc@amd.com>
Date:   Fri, 10 Feb 2023 20:16:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
References: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
 <a52cd0cf-e72e-d324-98bd-f5a38d7b775f@amd.com>
 <Y+ZSDqjl9Am+a9dz@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Y+ZSDqjl9Am+a9dz@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::9) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: c587ade5-1d35-48ac-8313-08db0b75aaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5v4URQrTCqCJ3wqmwPqyecgfDiN7uby5EipHPx34KfFDVvidv1MfuRxjkzQ4SpUoCLy3poPvBMr+nDjV3DFMBIZL8Es8Mb7AuIGKTmHw3WSsshrQn0nq9WVdUJA+SokfZcX75WyrT896yTKT4ILD4fbA4gZyyJBj5SNrS25y3VL+UIJX1m1FcQWGzj2NXvCW4Gng+8oQLrJ3sun/ShTumooR8s1wYH8Yu2Db7w6LCul274jmAv6zPKr+k5x4iw89Gr3AtDnyHmOE0fnA470HZ6VY/TAA4yHdRMRPOhtgD3YiUTMfJmjEE/71eQXusp2S5irb0drom/KReI1i5B5mHibF/6vd5KpkM8P5aEgoeEQARRuOt2I/XqKm9QypNLNtf2EaU5jCHrXEWCTeZyrIpMbQhPCE5tVhI33vRWoocqfsiZ7d6FmtzqmSGSJaooJVQl6gILvOdpNZHoTtRXnf7ZulVHK3FlhFOfMbzJGK0Mzm20bBtzH/oYx3wWMZM8MFgkcdlk5o4rTgiwYXs1l3Oy5moUeBBb4LxMjrvrO/M28aUw5oQ8wrClVmqDy1s+h9AfX9w7zrLj4+VFJ18ZaoXgRNCjnwCdJrv9/G4Ki8hat+vgAcO+RovQdtiL2upxNsdMXpOuxLkllGw7blHvemdfaXFFH9NU51k45+P7YJboF259uNcECyE9VCut2XFPd3g8CWIa3jetQjQudCrfyB7VzcEGsciYCV5SK/Y7O31sU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199018)(31686004)(6512007)(26005)(31696002)(36756003)(186003)(53546011)(38100700002)(66556008)(66946007)(4326008)(8936002)(5660300002)(478600001)(8676002)(66476007)(6666004)(41300700001)(6486002)(2616005)(6916009)(6506007)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtFS0hKZjFtbm5DNDR4SlVRNXVNMmdWUndxNTREMThZb3hncGQzR085RFJR?=
 =?utf-8?B?VmxVK1dLSGdCWnViSUxTSDYzMlRqUjF6SHZWWHBpRlhXUXBZM0dHSVRqc3ZB?=
 =?utf-8?B?R0RtVkw0UU9tUVpTUUZmVWY0TU5WNXBRcFpGWXAxNklRczUxeFVBYWVjV0ZZ?=
 =?utf-8?B?R1AyTWRKcXF1TXcvM1ZlWGtiYzE4bHM0WTd0N1R3L2QwUUNkR2hsOFVUYktI?=
 =?utf-8?B?cldUZTlyb2xYSGt2SnpVU09aOHVFTVdxaG5tU3QvRzVrN09pTURYRWVSWnBJ?=
 =?utf-8?B?dGFRWWUvcXllTzVzVnZmWWNaQmZ0bGhnQ25zL1Q4N2VablpmaWhLYytUMmll?=
 =?utf-8?B?OWVHOHFRNkhhb05kYnBCYjVZU0lkZ2Jyc3VZT3h3NlV1YnZ2RllibTc5cER4?=
 =?utf-8?B?dUtqMUdqSk1GRUdWQ1NWWE53MnRKMjZPci90Q2Z5VThncWZqSVRpMnlvVEdk?=
 =?utf-8?B?VjdENU5neDVUZmtuakdPM0hvbWNNM2llOFgyM1M5a25mZEF1M0xqUER0UG84?=
 =?utf-8?B?NWxCbnIwV0RpSTZaZTNsNU9LaGIycG1pK09DM2JzTEpVWjdGOURxeFoyeG5D?=
 =?utf-8?B?Vzg0czZJZFc2TGlwa0ZMaTYxbzEyTGNmREE0VDM1ZHhKMHhtS1dyTExIVzdh?=
 =?utf-8?B?c1d1MnVJM3g2Z2wwUnI2R0dhUGdtVjdJcHg5cEhuZG5oYjFjR2l2SzRpaEpo?=
 =?utf-8?B?ZDZVdlZxaElNbVNudkxzSVVoNHViNDFZenp1SHM0bkpaMTZsRWMveXgrUnVw?=
 =?utf-8?B?SXo3ZTZ1dURkTjVlam5EUXJ5aUFCZmhBVTVGRW9STERhNFNtR3B1cUk2Wlo5?=
 =?utf-8?B?dmVad1JHdGlZQ1BOeTR5U0xzdTdZeW1ESWpOUW4zNy9mR1dQbDhjYURUUEg5?=
 =?utf-8?B?THZuZVNoTW9lSFJqNzJzakRHTXJIR1FiSmlWWWdJaWFoQ2FiVU5NNC93azJz?=
 =?utf-8?B?MDh0d09wQ1RNVDdlZWF4c3FLMkdWUXJMbVMwRXRnY2hlY29FRVlvYWl5aXNk?=
 =?utf-8?B?VFcvUkJTbzJ2M2toSHkrdTRYRFNsdFJXM2M5S25WdExqZEkvNGc5anZ3S2k5?=
 =?utf-8?B?bjJHdklabU4zNkp0ZXg1eHl0a2Q2Z3FLRWx0MEFBNE9ySHRZMzRGdEwwakpm?=
 =?utf-8?B?ZzA2M1k5V3luK0hnb0p5S1Z1VUJRUXdSNGkrSnlVKzByaEg3L1lZQlYxcTEz?=
 =?utf-8?B?RlRJZ1hkNVYzR3ZZWjlVZ0R5bnhRWHJqSThKbi9nNnNtTGtaeGhpZ0h5R0JT?=
 =?utf-8?B?UmE0Mlhham5GMGtjSTJxRW9Eb3FmUTdxdEYwZXRCYUJKZjZoNWpubTRjMnhM?=
 =?utf-8?B?dlhkaFhWYTR4Rk9VUnhmd1NXeURlbG9VMGsydjNXTG1NOGxPcE5ObGVaQkRa?=
 =?utf-8?B?aWpRTml5TE5UU1Nzdy9TdktpSWVySFZ0cWdqbFYydVZXZVMzQkMzVnM4QWY4?=
 =?utf-8?B?L3ZCZFd0MGhoYVhMU3lVZ2NtT2RDZmd6ejBURGI4VDcyN2o1ZUovOWpsMTJF?=
 =?utf-8?B?cXVGR2dlRzhJd0pGWGJtdiszOGNQMnAxNVlrU010akNsdW9oSHlnUUptcW5k?=
 =?utf-8?B?cHhlejd1NzMxeENoa3hrQmlBbTcwWHdWUUI2d1F0SGtJVk02ZjJSSFMzNy9k?=
 =?utf-8?B?TnZmUEorbVFqWXorWHRTeUUreTk1bURMZ1ZjTU1OeXRhcUgwRVcycDNKUFl1?=
 =?utf-8?B?eFlFR2xBWkc2S2FmeTBFemEyZTVHUGd1ckl1ZmFCL1kzTU9kYXpjTEhqY1Np?=
 =?utf-8?B?TVJkeXpRSkVQbktiZ0lXL09BZlpVaE1RMDlnN0lFVVVESmJQSWxGYVp5S1dL?=
 =?utf-8?B?QmUvd1BrVkxPdC9adEhBaWh1WmRCRVlzS1hUeXRwdWxGU0w5dEZkMUxZR0pt?=
 =?utf-8?B?bWlvWE0xNGxadGhYZ2NOY0Zpa2FlMTBwQ1g5bDVhODU1cWp6ZCtjRUh4cVN5?=
 =?utf-8?B?YlZXVlB3MjhGeWg5cmFjNmQ3SXo2THlZcjVUNStIQmcwcVNJSFFHd2FCdGIz?=
 =?utf-8?B?WWpGRi9aREgyeU9JaFk2eVNVUnYyWGM3M0FGVWI0OE1rUTVmTTNpMWQ4MmZk?=
 =?utf-8?B?S243VUxFQm5SZ3dzb2dNRFVIemxZWlhXTHNBWmFqY0UrbDEzTDJIRHZUYUk4?=
 =?utf-8?Q?wzzmM/z0ob6/JGUdXpUTxioMp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c587ade5-1d35-48ac-8313-08db0b75aaff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 14:47:01.4757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMUtGyD4KbTyn6FzVszF/jNNJ4zG9Z39jvx4ws9j+F4Q7V+iu7UN51+pbvvGVzSqeq3D4MN+ujhr0sTBy5gEwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/10/2023 7:47 PM, Mika Westerberg wrote:
> On Fri, Feb 10, 2023 at 07:32:13PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 2/10/2023 7:25 PM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Fri, Feb 10, 2023 at 07:32:23AM -0600, Sanjay R Mehta wrote:
>>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>>
>>>> AMD Yellow Carp and Pink Sardine don't support CLx state,
>>>> hence disabling it.
>>>
>>> The lane adapters are supposed to announce whether CL-states are
>>> supported or not. Is that not the case with the AMD hardware?
>>
>> Yes Mika. it doesn't work for AMD hardware.
> 
> :-(
> 
> Okay can you then add a quirk for this to quirks.c?

Did you meant like below, is this fine?

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index b071802..138c649 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -49,6 +49,7 @@ struct tb_nhi_ops {
 };

 extern const struct tb_nhi_ops icl_nhi_ops;
+extern bool clx_enabled;

......
......

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index b5f2ec7..9ceef7c 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)

                q->hook(sw);
        }
+
+       /*
+        * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine
platforms.
+        */
+       if (tb_switch_is_yellow_carp(sw->tb->nhi) ||
tb_switch_is_pink_sardine(sw->tb->nhi))
+               clx_enabled = false;
 }
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 363d712..d4492b5 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -26,7 +26,7 @@ struct nvm_auth_status {
        u32 status;
 };

-static bool clx_enabled = true;
+bool clx_enabled = true;
 module_param_named(clx, clx_enabled, bool, 0444);
 MODULE_PARM_DESC(clx, "allow low power states on the high-speed lanes
(default: true)");

........
........
