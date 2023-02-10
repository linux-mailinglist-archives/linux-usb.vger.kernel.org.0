Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC0D692066
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 15:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbjBJOCe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 09:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjBJOCd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 09:02:33 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6ED6A707
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 06:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFmiunlMVgwVMpN1fLD9uDCq6A4BUl5hcv3+Y+MY1Q5lNLY0/hruF/vZ6NmXpLKKqg6lPYMkOpmarWNrgVrIA7zzPzb4JC3wRS7wF2AdtxED1WcqD9IL4T16mKd5/p3ESxsjvu6WEc6gxjBaYLeqmNyO0y54B8a+0Xucm+TLW/5DwsvOQP/nlN8ER5OX3XLD4+0R93h29xFiRm3XwkvJESCc7epBiUTIUaKdaW3wGj08Pm8PbvYz49iTZuBXkcjwFNVNWozU73+jc/WU29mwz6Rpm36TFU0YyOy+OU2U9IhdRc7N+9v3AuhEzWlbJFrrJoQmWcVnEr94aSPY2S1b1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YIwMz5xf5o4KBN7kKZfUiJPMpxZcui/nFMPjk6IKFg=;
 b=m0iZGIoQLA+9tFKIQ4L05zpfqdu7F+S8QoUD595aZZa965iS3jFksPbuk3NefFfzitbPNMoJz4Tlpgtv013k4gdweG5MlLQi7vIrVdhUKMnuR3bd8sv8Uv+7cWN1RkQ6Ymh2g31/Jwd0KNXIrebgALU//0cs1uly9vKVMTHfzBWeQDBjNfh4cDdqkDIM3FIj5p0TRPsG/dXb35fyc4lEaW6hRuwzYIC8EIYHrHwdxFdoZiwH9frkYZvo1LMGYZSdLUI0l5XKO+a2FCdwP8HprREU5o9w06oJhD7K6HYJNZhliQN66f5+KOYwGb/aoEc53LeqJpLelFFaXftR7LkqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YIwMz5xf5o4KBN7kKZfUiJPMpxZcui/nFMPjk6IKFg=;
 b=magPF4GbqmmuqWYmvi/4oM66egs4EUwe+YaOsPmDbN1rP1fAGdLPCTyZPbGH8txCbYsIE+C4H1pfDlNO0zphXSLwk/C2Yro/2+7CkobKGVTdLYrzeOPYtznzeqhk020hgtTXfW/9I8U4/Mgdk0Sh2s5hrONkuQSu0kzxkBg1ZpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 14:02:26 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8%9]) with mapi id 15.20.6064.034; Fri, 10 Feb 2023
 14:02:26 +0000
Message-ID: <a52cd0cf-e72e-d324-98bd-f5a38d7b775f@amd.com>
Date:   Fri, 10 Feb 2023 19:32:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: d488fdd7-59eb-4356-56e7-08db0b6f705d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hVAQzUmMCFLJyCiEJcy1vESLqnXA9N1tpItimUQBFkLudVVsHfVyxCFLdrOLyat30veukRNNeRRdBtI3qhQWX55MtTMmhM9yZxbBQTAZ41c2wJopOCZqDC3WaFpMkJM/snYkFNBCE3kntfs1gqS/OQDpOCa8yGpjamREbjD65heJ+6rcy0VRnCkkxYU1E3t2JA9MQYeFJgyhxXgma4WaZyf3SCCrNXveTifzU6ZWXEb6UKQ+EGprm11LWBmml8NlMDeFLQhAnq5dhzWjfpX/963+BPkqvXF0d/3y4M5vDh5N0y/KY3TaJXxI+ACjP4LvfyytN52kEA6ie7BxZjvgSQJlhzIbc2M9SD+9lEaSM0PwACjj4Uy4BDKYyXpVFFwdj1wuSOWicfjRWg1YA6cWQb12rDWD0szCzKk++yazqi+JnsR6foFbUCRfKTgdLcDdS9sCDE0sxyObnEJc7XGGqnU2tPrKzTYXXTrkQOA1Ehgfph6Ex59r0HFsiA1XJ/pqxsuUJk4CY6M+X8UsefAbYC/8uDVpXrFZzh9cyPE2U1P24z3+p2MKJBAqzglWsSz/6po3/YSkbgW+CR1ezrpp4pFDcd80bHQgRncF00PfLAA9gq12wwq4wdWwjcvu/cAZTam24eOw6Ak6EYh94R2+EWHH5ppr8xzGm6S10tFvAdok+YQPlaQAwRTHDhmj6ZhkG/ZV2s95HDX4mTEktXjStwK2olmmN20IsZvhkSZDJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199018)(38100700002)(6636002)(2906002)(316002)(8936002)(4744005)(66476007)(4326008)(66556008)(66946007)(5660300002)(8676002)(110136005)(41300700001)(36756003)(478600001)(6486002)(31696002)(186003)(26005)(2616005)(31686004)(53546011)(6506007)(6512007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVBJcHNiVGdmcm1DZTF5U25ZOWlnOGErdzZFeGt5UHFWbXdXRnA4NXcrYmc4?=
 =?utf-8?B?Y1lrc3BrSjVsQTl0Q0ZzcHlJSDR0N1c2NkIrRUhkc1lmazRxOEZDSi9IOFBJ?=
 =?utf-8?B?OE50UWpvN1NEZTJDMldxNTBMTUFXREJmR3k2aEgzbXJKdXNaU290UkM3cmlt?=
 =?utf-8?B?b3UzRGVaTjhydTdYR0RJL1FtTDJmMzg5K1RSSDhqMjFyZ1BJNUdmRHNTWWNx?=
 =?utf-8?B?Ykh2MklVRFdNR0xwb2hTckhGbmdNTEhjcnUyeldmY2RnSyt3Z0Y0Q0VEamgr?=
 =?utf-8?B?NDl2eEVkSHpKcGN5T1F3L3NjNGJXd3orVy9lR2RJaVQwWExESEh5dk85SEwx?=
 =?utf-8?B?clkvcFZDbDhGV2p1VUNNaHRCTDc3aEVEK1VGakd1QlhkdCtzTGNMQmNPcUEw?=
 =?utf-8?B?TzlrdXVQSS85ZUE2dEg0cXEzZ0xGdUpDWUIxNVNiczEraXNDTFZQNjk3MEc4?=
 =?utf-8?B?ZXVXZ2ZjQm9JZkhUQ3FCQm4vVnBXMitvS2pleG1sZi82ZU9UcmdzNS95R3Vy?=
 =?utf-8?B?OEV2NFh2UFE1Y3BCVmxHVUhzdTRLRU5wRW1vOGFtK2ZMWTgxd1F0ZjRyYnBm?=
 =?utf-8?B?NXlzUCtpOFVRaTdyeGJVeVpBZFJaQUhrTjA5WXlQdUtqRXhrZnc5bHhCZHlL?=
 =?utf-8?B?WFBUSzBhZndPQVZyR2hqZkt6aGU2aXlld29IMXZpNHBkdlVtUlQ5U3ZsZnk4?=
 =?utf-8?B?NDhrU1Y5RE9TTmZ3MmZDaC9LWi9LNTV0ZjBDbHhXTU1DSGNEU3UrOHdlZ3Fv?=
 =?utf-8?B?NE9lSklGMit0KzlBc2tYd1lrV3FWOUZ3Rjd3cnU0WllqYjVWTHl1Y1lScUZy?=
 =?utf-8?B?N3djbUpEdXNiblVaWEdjRFlNbmg4bVFablhObVFrYnFLQWV4ako3dGtUOGpu?=
 =?utf-8?B?YlNJOWdISmgwdlhvekJqNW4wbjR0bmdpOUJ4czJtaGFtMTYrUThFZnNNY0Nz?=
 =?utf-8?B?b2pUakJHOVdYYVcxSWxmOXdhWHg3QW5NMGhYaGt6cXdoY2tYa0hpZjl5dDRq?=
 =?utf-8?B?VVN3ckNrYlZaL1FGZnRBeTVUU1VUMEhyVWFyb0phYk5razFLbEIrbUQwSXhu?=
 =?utf-8?B?cjZXR2ZXYTJ3RVBSc3E2UCtUbCtEcGJ6S0k3eVpzbWcxUzI3Ym5jRmhvN1RS?=
 =?utf-8?B?N2ZCZmtJVXVMenc5VFBPZHdvQ2p4RVVJTlNzMTNHUVorU2VXOHVtWmtGV1dU?=
 =?utf-8?B?SjZmbnBlRDk1N24xNzdGNXU3QlB3cU5Rdy8vaGVtQVlrRkRYSHY4UytPQWlx?=
 =?utf-8?B?aHl1QmRLZmM4ME1CTFY0TExNeXhJSThuRmhTWmc3bklCeDZ4VzBFa2hLRXMr?=
 =?utf-8?B?UDU5WHdzbU12ak5IVnk4UjkrNWtuYjN4Tm5YL1JRbklEZ05hODQ4WWdrN2ta?=
 =?utf-8?B?UTNDbGJ1dTRFajJDblJqMnhwWldJRzMwWHRSbnF0UStzNlU3RXAxTTQrV1dF?=
 =?utf-8?B?bUxJNmVYeXB5R3BaL0hCTk5PWll5bG9Jd0VhUnIzazVkaEFvS3lVcE9XNmps?=
 =?utf-8?B?SG5lUUJKQTNTWjc0dFZPcnEydDlRKzcvRlBQaTNwZ1FpSDhlVVo3UWlPWEJN?=
 =?utf-8?B?VE90c1RuaVZmMGZhSlpDSk5BenNUZkJQODNuMXA5MUplSUlvUVVzdXNjODJy?=
 =?utf-8?B?c2s1bkwwM1BzeER0SHhaWUxreDdBWlJTS2hIWnZpSlhEQ2I0b1c2TWVOS0o5?=
 =?utf-8?B?QklYVy9EeS9PczAzck9UNFAwR3RIL0xvM3Z3TFY1ZlVKZEFNZzFlaDhuZis1?=
 =?utf-8?B?TkliMy9qSVpqZ3Vjb3U2c1pqNU1QcEkwalRtYkdOd2ZiWEZnNlBrcXFVeVZk?=
 =?utf-8?B?Rjh3QmFqdnR5dmVrNGpWdm1TbzRhcmY1VXhpRkNEUmVseXlQcDNmbTMvTi9h?=
 =?utf-8?B?bXkxTkdKci82YlhkbmhVVS9EWkhXVjZsSFhKOGpmOEhmVWdJZnlhV3FIb3li?=
 =?utf-8?B?UTJkN2tqb3JmZE5jdDljUlYyMytZeEZkUWI0d2RyVTVVZUhwUWF0N3JvRjht?=
 =?utf-8?B?bzM3OEhiMlJCQWVSTVdwbVN2dE5rank4dUdqM0RJTlR1cDl2U1kzS3B3Mnk4?=
 =?utf-8?B?MmtLd1NON1l5YkQ0VlpWVGtqMzM2dHpERE0vNDQxOUZLMmp0VFRmVGZLSEI0?=
 =?utf-8?Q?nZz4sN2sajKRWWIDXr2fO3nSt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488fdd7-59eb-4356-56e7-08db0b6f705d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 14:02:26.1871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3Oe4RrQspVfgAiTn4qCN7Y/WUr6QyecDRjUTNqtrAROICBxh3B6FX5qLtEV2vKYEqXfftU9IcrojRmhTUdxhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/10/2023 7:25 PM, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Feb 10, 2023 at 07:32:23AM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> AMD Yellow Carp and Pink Sardine don't support CLx state,
>> hence disabling it.
> 
> The lane adapters are supposed to announce whether CL-states are
> supported or not. Is that not the case with the AMD hardware?

Yes Mika. it doesn't work for AMD hardware.

- Sanjay
