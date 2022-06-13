Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7AD54890A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 18:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377326AbiFMN0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 09:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377280AbiFMNYu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 09:24:50 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008F16BFD8
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 04:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEuWLRkVWCk5aJ2VslVsGnOZWjqQ70RXcczxqUgB0XnlQyfnX16uSP/iGOoJaochmFK5guHymvQQRQIZ1X3S5WG3MiffPsrgke/4knsI/MRPklhRIg0k4ggxYdj3yZ5iku9XUVzKSP1Oe19mLIz4oL9ENzThS4rKHGS7AFvMvlY0wgt02I2QBblmJGL+G4Aw/y/0F8gotKeTfZ2s8smDKSWXph9PYL/YsPm5NOHJO2HWYeQVonLX5ytQ4L6inej8tqYgOUA+y5m+QL6rsbRkxFOtwc5JPn+0SLvKrMaa/eB1+1ZeUUdUkMfb+AG9/DfT1xUEaUok/0VjP542tL/qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFnaO492++ufhBMy4LCPdYtW+h5DiDYkw1Hbwng1oKo=;
 b=aQrqYBRckTWsuf+qXEcGnKf3hWvoVNbMb5KlCs6M5MjgA3LFMdYe4AkMdf+1r2HiAXYc7x+nC8Udmmm0PslHGGetzdDUPV138sqUYzsxl025F7+e5wJniHskgGoEK+ClbPSF7eR9p0ZAfW9QUghPszKxjxpH9AGXQkViEKb6er2TcmOQHc/EpaFJAS2pEMXaf2gmAuvYGjUPcaJ8/zvDvLG4HTpvGbTZ3qp/oaUQVbGfFNZWUU3CR/ZJKm7d1xdWMgyouQiaQk8tXjz2uDlLvW5ZM2tyR4ClLq5IE0378nhj/7dHH6vASVfj1VwoR5NjK/nPwB8D6bgmQJbDIYDg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFnaO492++ufhBMy4LCPdYtW+h5DiDYkw1Hbwng1oKo=;
 b=yGgMK73lZCUOgibKpkcPZHYPEST5AEi7KNViGOJwK/QWBGiH/NSifWB4kiswa0tq3TeQ8f74wbkXBdOqfSv/kKHiP9218dmbpU93u2ugSJhYU+lvBhwG+wwlwisKIgFVo9zGDAeT6zLM0dV439WqXiOznAhnsODk2QyFUK94BmDJ0JqmnYM2O+o049/gV3suZa6JrnMdo8k65ETRCGVLgYA38KHZRQJIkhpPyleDq+6u6gIPWMFHaWdS4h7z+p9/b/RQ49gan535C0ontz5hXIdcG+72qpOXVa5GJmXN5yAUUAhc2nvSu4i8GYdgFbnQCAdAEbM1mI9z/+BEiWRIsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by DB7PR04MB5995.eurprd04.prod.outlook.com
 (2603:10a6:10:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 11:23:55 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%11]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 11:23:54 +0000
Message-ID: <554b2f98-7fec-3b45-cf60-ce95cf82c88a@suse.com>
Date:   Mon, 13 Jun 2022 13:23:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: pps-ldisc support for cdc-acm
Content-Language: en-US
To:     Sylvain Munaut <246tnt@gmail.com>, linux-usb@vger.kernel.org
References: <CAHL+j08f4PJd64d5OQY730QH7AvJkf97HaCrJBF_vVR5-DmSjQ@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAHL+j08f4PJd64d5OQY730QH7AvJkf97HaCrJBF_vVR5-DmSjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::40) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9459bd62-dd13-4f77-b066-08da4d2f330b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5995:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB599587BEFD7B5AEB7BD40014C7AB9@DB7PR04MB5995.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: osV558E01Vw6BN0j8MaFGi2JmD3WrIZQR0R06Vr6vRj2wPY/zfjuPorkmoqCkh8uiogiUjR8NJzD4g5TVSB1jATHQuxxAeAy+2Hn+vUiic3IxpEMGdEZqbxObBrGHtHADA64u1ZqwHKJ6IgjBoRizfKiU8EM26K4sNpRLadEzVzufgtPFwGQG/DjOfcDEOoui62YABgw+HnLCul0XsT9pWgSX/eXV9/V8sXTCoqJmpjrJEaJQ6MBv6eobazXwYH+we78+Jlc0sqQJDJ3dRg0fQNUjD0R9aVr55Suoplo0xhkxdzYAyvqtDUhnuoamgpOFOBTGyDigec83kRo4DriOiQqo+geeMLI/ENz9WElv7Mf13Hdzv01pd7RBDQAOOlC4/M6QNJ1GCBSeXVZPKLbPv8zzJo3umj1DfuzHkrTWh4rAPPQwcyHHfER0VwVJ9izV0CyTI+NknJV23nlr9ZqUS5f5Vcf7jNM56Gz2RiiFVJp0R9MK9ccXrGVoBelAOlGsbecF2kgOINyHtZEwi60ddoKNRZ6cbVlxotbS8A9IXVIBO3EpZmC9acujAh3h857K+Qbn4IIAlvE780NiSUVickuJ4dYCWBWFWk/a4FHlsMmEMPV4i3t3MuxC9uVSgoN9Zdl5Q6LTtMyL0jvsatSgdCiUIBE88gzP9E3+M5wiGAjJxWGo2hTe64rrK8Vi2onQMOhHwHTG/Jr74XAPtWBHXMt/asOhoTYRA0LJLEZLHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31696002)(6512007)(6506007)(53546011)(66946007)(316002)(66476007)(2616005)(66556008)(6486002)(86362001)(508600001)(186003)(83380400001)(31686004)(8936002)(5660300002)(2906002)(8676002)(38100700002)(36756003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHlURXZtcWJwSnZra2QzdDUyKzVkRHFyd2ZkaWhNYTJzdHR1anI0cWlEUlRZ?=
 =?utf-8?B?V1d4VThjemFiUFJiRVMzT3hPbjNETUFqN2JoYkJUTnVFZk1RNWtCbThjSU1m?=
 =?utf-8?B?WTRERmJYeGsxMDZZTjR6N3p4NE9NSzBsV1hRR29IU2hwTjZ2cHFNWkN3TnJh?=
 =?utf-8?B?aDB2SEExQmt1c3YwYVpQVlZyeWg2T2REZ0lnUE15aDhVdEdPSFpVcFB1bzg5?=
 =?utf-8?B?NzNtYmd4ZVZiWGdVeklma1JKZTJjYUJacGxOUVVjVUVkelVqVmxCaTdDOHIr?=
 =?utf-8?B?T2kxZzIwdXFPd1F2UUg5ckkvRjg0Q3Z1a3ZxQnJYMjYveXpYenh2UlRzb1JB?=
 =?utf-8?B?bzhqa0hwVkJyWURINVJTR055aU5JMXZTTFhRMHVwNnVERmZYMUZPNSs2Q1hJ?=
 =?utf-8?B?SWdhWFFWQ3MzTHBOUXVlZWd1MlNGd3dsUnI5U3lLUjlQYjBiV2xrNUxEL0I2?=
 =?utf-8?B?Tm9xdEw1SzBOR29tRmx6TFliTXVRQkVvN0xNKzVtUU5FN1g5RWNXdnRNeWI1?=
 =?utf-8?B?eWdSQ0s5VCt4M1J2dFVvdThEb2Fyam5ZRXpCa000b291dnY4N1hzRUJ2eFVJ?=
 =?utf-8?B?MTlkaWVnNDZGMFBCTFRETzhGVW1iaW9FeUpZN2EyMU9BanJuQzgxYWtRbk5Q?=
 =?utf-8?B?MlhGc3ZyOEpzZ0plTXQ1aU0vWFZPa3B0OWRHRU5Wazc2blk1OE5SZ0dyZmYy?=
 =?utf-8?B?NURBQlVpN1NTN0JmZ2tpcDJVOGtLeGNUU3Rpa3VnOXZMZUpIRFRXTk5GTEpD?=
 =?utf-8?B?dWd6UFpYTnZ0VlQ1ZWY5TVE4dDlLbFRTT21YU3FLK2JZSEJ3THJRWXVOWDU5?=
 =?utf-8?B?bVpCc3duRE9XL2orL2V0K2NtUUhwMzhzMXJzRHhBclp2K2FQaVV5RHFBRWdr?=
 =?utf-8?B?TXZCQ2RCYkZveE10M3Z1amtHSWJsUjlWZlkxZ2ExbUxYN3VVZ1A3bkFhVWIw?=
 =?utf-8?B?dG4rTzVjSnFYZlVjcFBzaER0dWNiVE9MdkVhTGcvR2lQNHBYR3RydlpIeFcz?=
 =?utf-8?B?Q3lYWmcwQk9qS2pXaEI0UUR6T0RmSjVISG1HT01XTXJ1WGNpRU82amEwaUo3?=
 =?utf-8?B?NGZlZ0E2ZUhHNUJ5QmNlNkN2RGRKYUMybHlmcVdvbU5qTGZKa0ZyMTdPOVlm?=
 =?utf-8?B?bUNKSGhZa3VpblJSZ1NLSVpWYmF2c2JFZklwcnlVdkFwZjBQRlFqODI3TDZK?=
 =?utf-8?B?OFlqSUwxdDF3V3o2QklmdjNaOGNhWklJT1BRd0JING5sYUowTnhzbTlQQVg3?=
 =?utf-8?B?dkh5Q2ZMejJsN3JzbVd4OUVBdHVWZkpHdThibUxsU3B2U2ttWVRIaG1maFlm?=
 =?utf-8?B?TWdtTFZGd1EyNHBlaFdrK2I1SnN6TGZVd0dES08vdkVBVDFYU1lkclUxQ01B?=
 =?utf-8?B?V2w0QmtjUm5KNW9nUVRmOU85eEVNNk5INU1udG1EdGtKRHBVSktKa0JXRXZw?=
 =?utf-8?B?NHBZQ1ZWN1NMV2hNVVpOV2xVSUlsMTFWZmFCTE1GM2JhUzhHaEVsS2NaK2hh?=
 =?utf-8?B?T1hYRnhCM2RQZFozL3k1czZ3RkNJTkR2L0tZRVdDUVB4NjRyUk42TVgyZTlI?=
 =?utf-8?B?Q2o2TTNIVk9GU1NxOGc2MGwxVzBRcTlFa256NG5ncEtmVjBCK2Q1N3FaQXYv?=
 =?utf-8?B?U0hGUmJ3aVZWV1pyUlYrcFI4dGxPYXUycURGelo5SVVqSnRsM29WU0RYM2VN?=
 =?utf-8?B?cUM3T3l4TlNoUmxOOFpZWnNVdnNRNXl5dU9VQ3RYRFhRVkdvampDcEhianpy?=
 =?utf-8?B?c3JNZWdrYUlKOEc1c1ViMXJtQzkyRGNrdGtGaGpvaUdXT2tqWGZ2VkdocDFj?=
 =?utf-8?B?UTBiS0VSVFZqWTVVR243NkRwMTQrcnk3STYxMWpocDVmbkRjclJIR3luTWNm?=
 =?utf-8?B?Y01SQWJhT2NXSzM0cTd2VUttNW10UGZpRm85WEJIZmM2RElIekRhSnVGVVhR?=
 =?utf-8?B?cUUrOUxNbVR2YzVxeFJLVjFZclV3cXhpMFpqdlYwSGdiWXRUdDZvNFRreHJu?=
 =?utf-8?B?QUwrMUVMUEp4TktlSHBnZjhQaGRKdjhZR1U4K2tudEhpZU1RMjVnd3QvV1RY?=
 =?utf-8?B?aVJSQnJMNlR4S2xHUWU0Y1hsRlo1cFJaRzZOVnFLYkZTQVJ0QTV0eTNqMTdT?=
 =?utf-8?B?WUVRVXhqdTNkaG90NmF0Mm9LTHF3eVFiaHZYVWgxNXR1a3NoM3hiQzZaSTE4?=
 =?utf-8?B?VDhBVTY0UThuNGFLZUNDbXdBU2NSNGx2ZlRYY3NiWG1ubThPczBPb0lqZ29a?=
 =?utf-8?B?WkVHdW8rRkpnN21OcUREdEErVm92VEtQc09aZTFTdjFEdlBObzJkZnEwalVX?=
 =?utf-8?B?dU5sUVVqODQwUE1qdXNoTzVZZGVZQzAvTG1OQWl3UTQrMEtpQzVWMDFFUzQw?=
 =?utf-8?Q?ss3sRuKcvoyl6n+1s94b0eyPJ84pQ2EyGxdYUNI5vx6Ig?=
X-MS-Exchange-AntiSpam-MessageData-1: iWJLRCFHvczKMg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9459bd62-dd13-4f77-b066-08da4d2f330b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 11:23:54.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RP3IR4Arjff73wEslXn9X1rxcUqYYWoF7YwwFdpD//h/zkyan7tGMFObnnHkRTIg0wVaKQI/0TcYTvEGU8Hjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5995
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 10.06.22 21:32, Sylvain Munaut wrote:
> Hi,
> 
> AFAICT the pps-ldisc support is done for proprietary USB serial
> adapters (ch341/ftdi/pl2023/...) but is not supported for class

The standard disclaimer would be that there is no such thing
as a class for serial devices, so they are all proprietary.
CDC-ACM uses the serial layer because that is how modems are
traditionally attached to hosts, but basically it is a class
for modems not for serial devices. The support for DCD is optional.

> standard CDC-ACM devices ?

Yes, currently cdc-acm does not call usb_serial_handle_dcd_change()
if a DCD change message arrives.

> Is that correct ? Did I miss something ?

Well, technically you could attach the line disciplibe, but it would
do nothing. Do you have a CDC-ACm device that can be used for PPS
or is that a theoretical question?
The necessary change is not large.

	Regards
		Oliver
