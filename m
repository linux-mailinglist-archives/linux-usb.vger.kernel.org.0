Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0983073838A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjFUMSt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 08:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbjFUMSk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 08:18:40 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2851712
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 05:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaIw6wfvZpwsqY2ixIJ9kjJsmSYTeZiD8YJ+haUVwi3Mlv+TBfpwSJCgR6B0r5kUH8WcaHZQhAQzmdO9afZl9BxkblibL3ZQVHaFdBq9ITwqiJI6mgP3FbLGOdkwbvzD/oob7VuyQFaOkno8Xg32Xe8qAjB+hyEt5twlDdzMBH3zZE2G39iY3Fv/QmduIsLOrgVZU0T7w9WnwBQNu0kwLmokfOeFyuYZzp7sb7mTcweoGLeg0cNaLIhJa/RMUDINx4RwVpGw2N0mccxwb9HbirpCaUzW5Tyuk+M0Pgwu2tp9nYgL7iEuc/Ug+CMvm28A0gIdWFGnHXdWrDmwvhPWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9TV7a5zU0AD9bugDz8FxXEnC9CvkQbi5o4i2MJur74=;
 b=KjJ4If11N0tcFHLup22zNvxB7kQUn9qjt0wXT/TwQ/VQwucoEqtFMIqQzi2KCU7LG9EzJxl6LuVYCMRy3R98B3cLPXqN0DHPivGMjjXnzE6qV59KOpfQ9avyd99PZVYen3A3786peDsRBxtbJ7kxpay+pm0GODNc0ahYZlvEjVuhuW7EZxiQDfVnPrkR1FjPpkqg2EDrbzC+vsJnpMCghUf2SEi2Rb614HL+kJBv0OFxLAYB4T4Pzf03kAyvsgudrR8ELA7+6y1vr2uM6BDovvSDfJ75laE+0rkQ99nQvOm1xrUHSLv2b3P759HzMpbgqV0NghhHHY5hfnDT85RstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9TV7a5zU0AD9bugDz8FxXEnC9CvkQbi5o4i2MJur74=;
 b=y6KoamdzIT8q0X+L9lA4KLKVE7kJMeO6oWOTji7qLniO3q244MA6pU6C6WL2bqqM/tlT8LYvWD9fwtJkKfdduWnTEGGS8Pw9KhJ4fhc0jOGqbCQMR0HWjK0lEZeZ2+Me2UU4f2zi01vBXeyCl4Fx5PlYcXmhPu/+gsLR35I8oI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 12:18:36 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::1544:d17d:615e:bc59%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 12:18:36 +0000
Message-ID: <5fe10a65-4538-cdbd-a0a6-827f9445cee4@amd.com>
Date:   Wed, 21 Jun 2023 17:48:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU based
 on CLx
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        Sanath S <Sanath.S@amd.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <20230621111525.GL45886@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <20230621111525.GL45886@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::12) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|BL1PR12MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 371c9c67-a10c-4768-d673-08db7251a322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RTLwEOQJBioviXMoh5ZCeLxhNcsQaX7+xn2BCvhQ1P3U1EmEL7D/A4Pq04UbJv/HnA9r63u3CpsC0rVz+9/w4xTFxhLjFA3OlTqZuSb3gsjToJAnw8J9Hb29rItWToTgxpkhBGCMa1099FZAMkt5lmvPznksIvuWmOBR4ptccR65a9hsqu2HI9VZFUoA2wGEfNQe45zK4ENCvM/4W3F3yHJ8z7nqCC9BBXYJKDoxZrIOWRFWa+ihZV2FUNetv+4RciRTY7OyU35mhPo9kNDFVYaebyUKOnKdSBzkrOq2gouosrXhV/QS1uY0YIhHZqgACwzQAhAHGV0fH/phAnK8S0Cvn2shc31BL0QCfzHjY+QJc+9OAm3ENkMI4/CIa1YzkHxoFqnIHjK1G7awJVHGwUGp0WR1vUf2RN2hG4x+Xzk2j8x+9Ya4rgjnuctKjNehHKOY+0MZA4qrjVQ1ZbIaeyu2mm3tRl2W3mQWtu4P4N9fhB4MFBVFGYUjrXfaxF2eD/kfXQPkmnIQBqf+3T1C8cTZ7Ens12Uum1V/dh4FHi3jCMTH7VvvANMDibE+FnqE53fRLqG/AtXuIM97yfg/Ef9PLdYVTYowfxN6UUFfCzSrqLvZT7hXcxpBb5wllTpQhLFtWdDiP90HIhGeHsF4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(31686004)(36756003)(66476007)(5660300002)(8936002)(8676002)(41300700001)(66556008)(31696002)(4326008)(316002)(38100700002)(6636002)(66946007)(6486002)(2906002)(6512007)(186003)(26005)(53546011)(6506007)(2616005)(110136005)(83380400001)(478600001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWJoODNsYkUyRWRoVHRXcFo5U3F2SnhXUUMydXl0ZDFLRCsvYUVLZ1hScFZz?=
 =?utf-8?B?M3JZSzFZU3Y5bjlxVGFOYU92Umpia0c4RVE0MFJKaDQvdEVmQVRVVHFvUXQx?=
 =?utf-8?B?eGtYQU5acHRoellLK3BUbTJDRm9KR3Z4c2VxcDBHZWZ3TzZFTGxNUUlTV21j?=
 =?utf-8?B?NE94N2dDUHdpMWlLQnpZZWFtblRRWWFmTnMrWjl5ZGxuRnN6RXk1Q3Nkc2pF?=
 =?utf-8?B?dlBKVmk1Vm93UEo0OXExai9yZFFTVnI0cEZjZWtnbmxJajFIQS9qb2lubVFs?=
 =?utf-8?B?Wno1aHdMKzlBR0NpM3JWem9nNVBuYjlpRktyM2pucGRIclFBYnljWko5cXBW?=
 =?utf-8?B?QzhrbzZDQitUQjJSYm81WXAzdVc1c29WM1h2aERrSzFkdU51ZGpMZG5CWmQx?=
 =?utf-8?B?SHQyZEZCOEROQTM2NmUxbmZJZ0laUS8xNEYweVMydjNJcjJ4UU1URGE2aWdZ?=
 =?utf-8?B?YW9kOHU5am14czU3azZCRHc3bjk3UFlrK0hpanhBMXlJek9WVVREQ2ZmbmZv?=
 =?utf-8?B?WFF4WDBxQWVMcEM3Y2Nab0ZEN3ozNGVHanJUS2pNQjA2TnFVOXZ0ZEdjaURs?=
 =?utf-8?B?UTUydWxwZGFpZnovb2ZWWkJtUEkzQTRGNi9sQVRkbm8xeUcwaXp5aXZ5V3pz?=
 =?utf-8?B?K1FRKzh1d25LampFZEt0eFNRWG94L0NzMW5LeCt2NXhQbDdheXYrUGNyZ2hI?=
 =?utf-8?B?bVZkWm0yNTZLNHJkbDdVZzdrT1psRGJsaFFjcHNiZWhhWURqSXZmbmZ3MU9W?=
 =?utf-8?B?dWxvUnh6emY1NHc2U1E1ZW9kVTBzaG9PQXEwUHpJQ01lUnBrUnZSY2Z4TEZz?=
 =?utf-8?B?eTl4dnhRRXVmVG5FSTN2L2l3V0Z5eG5JSGYyVjNFRzRkMzVkWGZLSXRQNkNp?=
 =?utf-8?B?eGtmNVE1bGpobU1senBYdnFSdmVVUzBjU0dXK3FmeTJhQnVEL2RuNXBuSDAr?=
 =?utf-8?B?UCtQc24zRXRDRzhXRW45cVkwNjhiNmZiM1F1d20rbzZIVURWUTNVTDVyNGlh?=
 =?utf-8?B?UzZhaUR1VnBqZGVlNWJUdDIzaUNrL1Q3bnRUd2NoeGlZeithc0xOZUZvYStL?=
 =?utf-8?B?b1M0Q2lWOHJrMXNmNkhsM1JmaVdsVEFycUQ4YmhMdHl3QUNZbllHZ3crUCt0?=
 =?utf-8?B?bFVCbGRMb1NJVm9Tdkk4MXA0T2pkaExNNmdwUVpDVjdtRjFQR3VDT29FU3Ra?=
 =?utf-8?B?UkVJWjQ4VXh4SHpWYzN1STNuUDB0Vm4xTDU1ckdUVEJqTlFUL2cwRHRPUG00?=
 =?utf-8?B?Y21GRWdCY0xHL0lFaVJIUnFMNS96WktvbjVRNms2MytpS2dlbXlLL3VEajVm?=
 =?utf-8?B?VnVkY3l0SFEvSU9KMTQ1aHFTVFJMb1BiUHBFNkt0eVRubndWREh2a255am9q?=
 =?utf-8?B?RFZqQVoxN01Bdm4rOEFFV1hRbGFwVHZNczhEK3NoY29BeGlmT2RYQ3VSSmZ2?=
 =?utf-8?B?NnBDVTYyMnIrRHhPcG5qZnJ2M1lwQStZNitqUnAyazh4aTdQR3hGSk1Ic2la?=
 =?utf-8?B?enVBS2YxK0ZuMGprdVYxQ20waHo3bUhueWhPZkhXc1UxWlJSS1NkMEUzNVpu?=
 =?utf-8?B?UzM5d3ZtbkxuOTV0RXV0NDhaRVFWQ1I2ZjZaMFhMN243OXc2K0xhUzhiVDNl?=
 =?utf-8?B?NGd4ZWUxUDV3RHRTWXdpeWNpaVRId0IyRXhzT1ZiYllvZ3lNTEYrL1lwbDk0?=
 =?utf-8?B?SmZ5RUFZQTZzY29DcHJwK0p4MlFjeEZwVTkyTzZONHdHci9kdXJBQThrRWli?=
 =?utf-8?B?azd0N2t6WWlPU2VWR3MxdjloSHBESS9TTUdsby9VUFZCQXJnVU1QMkFJbDd5?=
 =?utf-8?B?YkcwVzcvdXl3Mm5uVjRobURBMzh5TTMxUGVuZFlSZzh2Uytzc0NCNEVFWVlQ?=
 =?utf-8?B?dk9EeWp6NXFsYkhqSG5SL2RtODBCUW5DZTdBUU50SXNneWk3YWFabnA5SWpa?=
 =?utf-8?B?cTBnZ2IzOThzWVYrSm8wdDE0K3RJUW1jV0lzYkQ3Yk9zVVBtRWR4MWtjTWJR?=
 =?utf-8?B?M3ZnN2ViNEloRjlaOGVtR2poQldrMHdFa0ZuSFN6UEVadmR3OW1zRkJwNks4?=
 =?utf-8?B?WnI2bTlrbUp2MEtteWxmRHRWYlY3Ti8vK1Z0UnlzckNvdDJndmhSSEo5cExw?=
 =?utf-8?Q?FmwjkjxYWSP04mKHiJKRkkDyc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371c9c67-a10c-4768-d673-08db7251a322
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 12:18:36.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkzRXbbfSFEmILUaXv4MxWyMV66AFB01eqydyhGdhKE0Fff7P8tCjgVq1NIZ/mlqewnJufB5C2Vjooo0h3bC3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/21/2023 4:45 PM, Mika Westerberg wrote:
> On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
>> From: Sanath S <Sanath.S@amd.com>
>>
>> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
>> Ridge, explicit enabling or disabling of TMU is not required.
>>
>> However, the current implementation of enabling or disabling TMU based
>> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
>> enabled by default, such as AMD Yellow Carp and Pink Sardine.
>>
>> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
>> implemented to skip the enabling or disabling of TMU for SOCs where it
>> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
> 
> If it is enabled by default "enabling" it again should not be a problem.
> Can you elaborate this more?

Although that is correct, Mika, we are facing an issue of display
flickering on Alpine Ridge and older device routers, from the second
hotplug onwards. This issue arises as the TMU is enabled and disabled
for each plug and unplug.

Upon reviewing the old code, it appears that this issue was already
addressed with the following code block:

/*
 * No need to enable TMU on devices that don't support CLx since on
 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
 * bi-directional is enabled by default.
 */
if (!tb_switch_is_clx_supported(sw))
        return 0;


However, it seems that this code has been removed in recent changes, as
the CLX-related code has been moved to a different file.

Canonical has also reported this issue and has tested this patch that
appears to resolve the issue..

If you agree, I will send the V2 patch which will address the comments
from Greg.
