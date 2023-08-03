Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397C776E099
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 08:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbjHCG5T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 02:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjHCG5S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 02:57:18 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E736630F4
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 23:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsJA8zCEwWfSq6/G7P2OqwzVYlYxiFk+RhETe+1YNMvq3W8Y4n0OlhwTy5j4kY9/gMB2W/GQIjhMcTW5pwXnY0TkXP/Pc0S7JVqeFrhcFNIGZyVjtSzWyMIqtD1kKAIwhE0bJ27E32qlCeEwQJ0oydx6NOVgVbj/7+seGPECS7kX1EZoUQVFIhbzhGu0gYu6FRgyeA0xcG2oVHR2C20tAUgVVRWL567HzlvwNIpnEG/zXlzTa+HSNK0xP6dysCXh5SxtS+25nzJD3CgysBn97BrxyyH1WD7oZsfHang+vJuisnjIfsRp9HIRSRLYkwV0+TDavCbH0xgHQQfSRenCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odPlM4ctbQc9ZJzJaSUlBQi57m4NmS0hxijhuWqApTo=;
 b=Fnw6JzmWFjKJTQF/xTZSqXJFUnjRVDKuzsTVQyJUQp7UI9E6io7tYNw4Wxc1y6yYaXreFOA6NILNdl5KXLvqcWFi3vCCZ7BB+ZJq73/FJ0ZuwON6fnofurWylwuq51Lt/2nZE2sY+pyQkTIgBPX5C6rNUcVnaBfKguYsqOKrqFTG5KOOtNy+WLiuSX8wTXBfgCT1NirV0vjY7LyglqqB9m19vU8cjPtgTYRI+MrmO6gMp8Ussgn0wymINNudnvrxRYrA3zL7fyasawZltuNlIPpP2C5dLHWRm5tECdYYAzJoyFJxkqtLFGN8ILV3/h/AQyN9+CxtvSmDdsIGcA69Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odPlM4ctbQc9ZJzJaSUlBQi57m4NmS0hxijhuWqApTo=;
 b=m7vPCVoMDUOpOR1nBVHPBeXTAWcmE4Dqrrh7YEFFUZofkAxuXOWIvGdQUkQ5zQR+JrKFqFh8SmdHoZLbC84MCJDIaKIaJ6n6Jum1hMWgz8kjREJc2lJdKmPCgY7b7zPfebQhPfFiU/5gKfd156Q+TSo5GjJQLIZZ+kWGxfel3jxB4naDPrnCR37I48KIg7dbjnKJ910PKmMKs/Y0OHW13gPXoHgG+Whe4BkgrKHhu5TZHzmzSCrm8xLyTEc6Oz81/+K1sUjVGxX6d8wKlzCl1uRuUZWQIid0BjV57gVqq+ywuvexOT72p2dae+sSacUT0IU/11vBKbe6vCIqdET+OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 by AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 06:57:01 +0000
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::2037:511b:fbac:8bcb]) by DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::2037:511b:fbac:8bcb%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:57:01 +0000
Message-ID: <f89a3953-ec40-61a6-1061-1c5653de6c0b@suse.com>
Date:   Thu, 3 Aug 2023 08:56:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] usb: gadget: f_ecm: fix ecm_bitrate() for SuperSpeed
 and above
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
 <20230803051810.2974-2-quic_linyyuan@quicinc.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230803051810.2974-2-quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To DB8PR04MB7097.eurprd04.prod.outlook.com
 (2603:10a6:10:12a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7097:EE_|AM8PR04MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd7f416-102e-49d9-e94c-08db93eed61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eAySnxCXtVKrSQIUUFvjNQgBRZlQhEECV0rLAdJgqZLA5CMbIo6v0v8GSFHQEh2OIeHLGy/W8xcqagdXMbvskXRDIFtxNph2YxOKgFtRNC+vjXLJQhIqi/ZpKqOAlGwa421HkBbUeHDvrNWshAMpXUFUS/f/BXg2lmsoVeh/VKRpOZ0mDYuflXR/yhiaoOk/IIIdfPHXR6iB+bj1ORBH3pJKYOVKs7nUOMWt/gjBJ7VRwM+OQkT2E3+AuE7s3ErTVsD1gFHvftSGSqjGN6HAiLMoG9jOel/kLKxMBSGw8FJz5OSwgy+eEsmiBs54UGU9bWbm8R1LDhymPnlmQD8YPafaOsdvGwvvr9TydWSR0IFcHtcdicC/9/VfOwg6hyWsE9l6NMT9OeM9nfeQSs+uTmtY0Nfe6yt1AmJ+d63qZe2SKNbAfM0yBRGm9PCgkvAAXcKsITkI2x3jouOaThoEhYRjVtUjbu1wOZjifYDDCwvpp+q0GrT/W/pJsFkP+V2L9mE4sc2nJenthnNJn+KzRD7VnH/iIrjV6jh2/0/BMWw97Fr+lpeJ2IHrv153ET6RNgrJmMqnWFIY10MGn+HH3/3bzoC5lMBL4HFWiyTsISEveHlrIbsG+SLq0GkiUu27D92wAWEaLStaAvTEz49tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7097.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(31696002)(86362001)(36756003)(31686004)(478600001)(110136005)(38100700002)(2616005)(186003)(6506007)(53546011)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(4744005)(66476007)(66556008)(5660300002)(4326008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5ib3VlTEI1MDJqNW5uMlIrVzZNVVBKU3d2TjZoMHJrbEMyTEovcEdjMTFo?=
 =?utf-8?B?NVpaZWRnRllkbkV0L28wdkdqdnBVOVRJdkhiUDlpUGpEcVpBdUUvVkFoTGFl?=
 =?utf-8?B?S3NWWHR2MUdaY0paWFNVM2x4cm16R000RkN1bCtXQ3B6alY0VDIzV2xpdlZB?=
 =?utf-8?B?WklUMVVFV3MzTE1KZ3hlSEwyZkJELzZlZHRyNTU3bkl1SkVsYXUyVnJPSE0z?=
 =?utf-8?B?N09Ib01UMFNQenJ1Zm1SNTNueDNYblpkMnJITDBIcjBFN3Nla0s2SlN4MzVY?=
 =?utf-8?B?a2FwNUdPM3ZMRE51VmFtS2l5UEpMYWl2a2pLM2ZrN2RkZ3ZTWHl1NzRTditP?=
 =?utf-8?B?MEtzTWpjVWY0bkpXWjFuTlBnaEw3dHU2ODlycnlKKy9vNlN5T2RMMk5vMXFS?=
 =?utf-8?B?VGtqcTAzUFM5ckp1MkxTTExvZjJQUWFYMU9nMy9NSzgydllpQmZOVnYzeHc3?=
 =?utf-8?B?U0pWTmN3bDZiVkpEQUVOMHdBZkhLKzh2RHl0YU1MdGN5Z2RrVTB3VXJMVS9I?=
 =?utf-8?B?OVZWa0hoUW13QkV0Z3RkdWRtYWNKNVFaRWZ2cFdwOHI5YW9qVjRBaDVoVTUw?=
 =?utf-8?B?a1U4a3NMaDc0Q2ErbWcyT1plVnhBeU1EUEtaMi9ZaWc1RE8xSVlxRE1pN1pW?=
 =?utf-8?B?ejE2VlkySU5KMGp6eW1hT3VrNW4wWktpemFyUmRKL3p5Y1psaWU1RTMxaEl4?=
 =?utf-8?B?RkpJQ3FFcGVSSWE5L2ZmWDlYZWR3QjhydStXL1BPandxN2E4Z010dk9PU2tJ?=
 =?utf-8?B?emszMU5iUzhvelNyYUZ1TWNLTFVzb0VvSTNMWXRDYVk1UTVMOEsvQWdEeExY?=
 =?utf-8?B?VUh3QmpvSERldkJMelpKK2RJRlJuY2hkdUlieVllR2xkelViYituaTVHSVN3?=
 =?utf-8?B?d04wQmd6ekkxZGVCSjJPWWVFOU9CaUdoRXZiNTl2dTZlRHpuZ0lFcUdrU0tj?=
 =?utf-8?B?Z3hvVlV1TUN6UnFKcTJ5TkJ1ZG9XNG10WlFNYWgxbGxFOHVFeG1sVWFJUlFQ?=
 =?utf-8?B?MHp4QWdDd3ZhcnAxSy9tWXdoRC9oemdLRG1YVHpJSmV6a0xySStBQnFRVHIr?=
 =?utf-8?B?OGtKRmNvOFhnVTFSbVJycks0TWFXR2FPM1lySmIvUm5qZG4wdzVXQnhaU1RN?=
 =?utf-8?B?S3IzSFZwc1VHdzQrMmdCUmF6M3RvSVZvWVlxWDJWMFdOTjlzd0E5V1hscUdP?=
 =?utf-8?B?a01PMWoyWFAvZkh5U09OYWVUbXBzdEIzd3paUG5POVRqVHNLUE81ZE1JMVpG?=
 =?utf-8?B?dVRmVGV1RmZ3aU5NeFFNY1F2ODc4aHRrKzFWMllMMVFzeUxMK1V1MlJURitz?=
 =?utf-8?B?b09sRHUwTG9MUzBGb1Q5d0pOMkdTK3BObFd5SHhDcGQraVFjU3JYYVhOZUd4?=
 =?utf-8?B?WDNxSnhZcmJpRC8ydVhIM284RXJXYkJXZkpPSmNzL1hMR0RWUE9hOVNBN2NP?=
 =?utf-8?B?ZE5idStJY29QNGMydkJ4TndsNUU2dXloME5NQk1uWjV5S01pM1hyVWwwNWgz?=
 =?utf-8?B?R2FsSGdVTVIzbmIwVjhiYXVmcEFJa3QwSm83L1R2ZjZCbENFb2VXQ2RDeUNK?=
 =?utf-8?B?N3pFOTFRY2hhVE5IUzRaQmFueklUR2dEYllwa0Y1UWY3dWZkb0hOOTFMay9r?=
 =?utf-8?B?TFhrdmR3cXNQU2RpMzhMbEg0aWlaWmRzU25Xa0FYVm9QdEh5MHRMUk5pSEFt?=
 =?utf-8?B?S3c2b05wMU9lMnFsdEdVWDVEZ3pZeW4xeHZhZDJiNitlTFJYUFRSVmZZek5v?=
 =?utf-8?B?UzUwZCtkSXRNeDIwSElzY3h2enhzQXRxMW9PSWZ0M3JnNXdURzBWdFRPaXg1?=
 =?utf-8?B?NWpHMFhCRkdTTjNyN3lRaUs1Y2NMekErQnE1ZE5WeUcydHFDRndWNFpQWlpM?=
 =?utf-8?B?Y2F6ZjZlR0FIMi9aejFqbTR4YWpnNnVXTHU0WTh4RnBraytBQ2hsd0FRQldE?=
 =?utf-8?B?Q1VsajhWKzdhNXVYZVhtVEFSOHYxRDJtd0RYbWs0SDRMVlpPU0dRbStuRWxU?=
 =?utf-8?B?NE9VUjhBcWQrNDB3QVNLdWJmdTdpd285eHROVTNkZFdxOFRjSWcxeWlENlVJ?=
 =?utf-8?B?UURObmNZK3ZTSTZ1MlNuZmo5dnV5eXBjMnFrcXB5L25jaUpud2NkUytsNUhQ?=
 =?utf-8?B?akN1RWw1QTdSNGN4OGpNeERJTFp2OEF2cDJDRmVNM05vdTE4RXVFL3FESDJZ?=
 =?utf-8?Q?nrTABIX1RDYKUX1hEmMOxh4y/A7p5+jiIRXluQ7B790p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd7f416-102e-49d9-e94c-08db93eed61d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7097.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 06:57:01.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye5PFnqg7HCWyJzNe3yO7jdAdb/NBbNdV/UaSoxT4Vd2o/m3KX818iup+17J6YZrpp6Yop+u/+brWYJ7lbZCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7300
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 03.08.23 07:18, Linyu Yuan wrote:
> In function ecm_bitrate(), it is not good to report same speed as
> super speed when gadget work at super speed plus.
> 
> Change report speed same as commit 986499b1569a ("usb: gadget: f_ncm:
> fix ncm_bitrate for SuperSpeed and above.").

this is very well, but it raises two questions.

1. What is the relation to decreasing the usage of gadget_is_*
This patch increases it. And why? Why not use raw speed?

2. Code like this is used in multiple gadget drivers.
Couldn't this be unified into a macro or something?

	Regards
		Oliver

