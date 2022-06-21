Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2BC0552F76
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 12:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345821AbiFUKJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 06:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbiFUKJf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 06:09:35 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2862666
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 03:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AP+WhFV10humPg2hpL8XEXoVnhV+XyfmviLM0baLJSdqmbgY4/V02w46i63S/l3ClI5ds7q0P/lJTOhIrpUeyAc8fZoWR80nG5dhwyPco6/5IomP15Q3ndIHeHtSxwBKUEYtz4XGkXMeBaysS8eXD1MezwYvDxSUSvfXzAhm7MRr/4bzJDtgow4J35egU4gElUWYBCSNJGp7GU3esoKo19IZFFNrcVRldY8J6Ia/R8023tdFaTM/dJbe/PslQ9D8hoNnjwlJEQ9QeTY1TpmwSEjoWtsLpvt8aXDAWf0F/ZXUhTexjFKwbz7bGD9kwk+nkwub/30y0JchsjD12UmjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdXPDra5sjiHBx5pMWjsAHy4RII/lNRbvd65AP2aixg=;
 b=Go0HUmeqUZjOO2i4wGd+plZB5UoJxCbvzXPIG+KV7ERj1GelqOj23b8oPrg/F/yVMyRreMunpX2CuYPDS9DU0IKiMliLrgu+GFTgm9t0M/lGXnZN7XPScSwQODZNmTqRQafOtFl55QKJyZq5rynODuTr/xbXzo24O6UYcihQ8CQaHawZ2/QwzvoCrMCLZ1okYksHXJa64RSNBmn+qJ8BSyAXwTvgg4/pzc8fFySGG4No/QxUMtfpaAJts3DVCAKjktpu23jLPEtMkZtWuRBE+iCkUGYgtUniEPJ0CX0NHc4Ie+5U5Ku+Vux31EWVZPH837H9Mn7YR5t6YP+TwDyg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdXPDra5sjiHBx5pMWjsAHy4RII/lNRbvd65AP2aixg=;
 b=TJmRGVmItreBB8+9LbSsULobwvlCOhp5GY4016CZpyV51JCq4FQHHq4YywwWjifCPABM6p8leadUBh9x7ne5E2hO2bjDIEHipnytfy+JUDi505ScQ373+TzA/mfqFGtYZJeNm7ne663tIezJNGUk7cAdC+0RV8bd6ptHiqvhkCPa9CC3wE9QoYnbvVnQyCGfkYUaX7Ykq6u/0PDkzkXBjqc41LPkJLQzWBFERMiOfeLUSx0DFMaE8VqbkEPtsQ174Ap/i4EaCxk1r9GzL1G8+5U5J2YmaZZFs/xWfuItgqTnyT0APT1co6LojVC3dTk0XjTSIfv8rhhusGE0jLKGpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM5PR0401MB2643.eurprd04.prod.outlook.com
 (2603:10a6:203:34::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 21 Jun
 2022 10:09:30 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5353.022; Tue, 21 Jun
 2022 10:09:30 +0000
Content-Type: multipart/mixed; boundary="------------rPoTtU8VIkQE07KyKq5UZdhy"
Message-ID: <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
Date:   Tue, 21 Jun 2022 12:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Content-Language: en-US
To:     "michael.lee@omron.com" <michael.lee@omron.com>,
        Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
X-ClientProxiedBy: AS9PR06CA0387.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::16) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfe3341-1468-4406-2347-08da536e2181
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2643:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2643B1CC417ACACC836C4735C7B39@AM5PR0401MB2643.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/V1jmXyB+cMhTBXFocZPJOxnsLfhQhnuFPzel9nGCx9xQgOYxMeu0wntiXhO0NunakGPek55xQJXA/vqMBLjHXIcNuAxx6X2PsTdZgsFk3+VKjr9fUKvubIWzXn/ugnMyuq551AIngOplrGcG20BMvBJ3bXg/u9DNgiPtEik/t3UXsezDUeZ9o/+JmrvkpF6oCeaF6DQQ/OVfm1AjuJLu/+Js9RUPHEBbCNaNns5jKSTy1JIOt75cAwmzL6YwHNFpWpVPsz+WEufK8KJHQNH9xua1fV2AdaRezIZRRtP3U6iRZEkoVKzk8OTL/iT0ElCyCpHJKwnpeoHF3TIvL0aJNmVMbAoifpWxsdEWDRpQrN6JHjbZIbwkrdtd60/XIUyoD5TAM7MBTqec1iHA5TpjH87vOUxmFflPRgL6fkjzhcH7JDa4CRRL148dRxBhmjJZ+Rovzd/Jglrc9GpHWUeyFXEdlVcH15wKTnv6tsaeL8IzeG1Jw9duqSrmASU2Aa7yN6hW1MrxgAxsTlVy8ZS8Wks2yB7sZS/lJPGU/7Zr5J5zR0EMBoTevc+x1u3613SlRvy9CH9irkS4cygSOomadqsp7ggBJ3DN6i2DGLQfYN/c11gDrQMZ7VgkPXdCsfFg05nBuJ8ipqMd1RRmnv/PFmHFs8hFmO+K7t+vA4WjSUqe6vTAJXnJYeSrRPPePMVwfufwVxSuBKiIvE6lVpFVymwWvmXuOD+vRhoOL32uQ7uw8P7EK/9HNh+k2b9f6Mj1HQzEu2sNFxUcWVE2ToXUQz+qrTuNnxzY6DN+Qz8wuuZ/KZ+0mN4JR5imy+Rq36
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(396003)(346002)(966005)(6486002)(83380400001)(8676002)(2906002)(66556008)(4326008)(478600001)(66946007)(66476007)(36756003)(316002)(31686004)(110136005)(5660300002)(235185007)(53546011)(33964004)(6506007)(107886003)(2616005)(41300700001)(186003)(31696002)(86362001)(8936002)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhDKzdncTdCaHcrS3FCNWNXRFRFVUFkcHlvQWpkWXhsemZYamF0V1RFN3Nx?=
 =?utf-8?B?cDFaNnZnUW1ld0h3NjVKY25MQW56ZlhYcXdtRFB3QnpxTEpaYmowekZZOUl6?=
 =?utf-8?B?NmYrelVSTzY4cU5zd0VuM1hTb0tMWmNiS0hEVlQycElBYlAxMGkyb3dIMzNF?=
 =?utf-8?B?N01PR0llRVdLRHBhL1NFTnFRY3hWVUREQ05Ua2F1UWZ0OG5BRUlEeUJ3bmxm?=
 =?utf-8?B?a0JYSGlFMDBWRGhuNWFXVUpxZldBTEp4M3JkZE9SNU5ONGxhdGZGcWVvaFUv?=
 =?utf-8?B?L3hHWWdPN0Z5ckJhdVJNVVFIdkJJaDhrR1NPQUZWdHFKckRKc1FObHJ2V2Rw?=
 =?utf-8?B?Tk0xNnlLRW83cVpOemtHWTBvTzVjZWNTT1VMMWZtVG8wSExQT1BRRXZQM3FT?=
 =?utf-8?B?b0ZPdVoxczJoeGdybU9Ka3dHNWt0WnJKVkYra3J0eFhSVW1uYmpiYkViVjh4?=
 =?utf-8?B?Y3hvb1B2ZDRxaW8yU3QzTkkrZTRDOWoxazhreWxLb1l3alV5ZG1hM1cyUnB0?=
 =?utf-8?B?enl3Zy9NakFwNnpYTHh5ZXVPcis0cXA2R3hvMDRya2JCUTBQQkJ4eDZzcjJk?=
 =?utf-8?B?MGg2L0QweDFDU0FlQnZhTHFKamhkMU90ekhqSkhPbUFKYVo3a0c0VnZpaURQ?=
 =?utf-8?B?Z1hMcXdsOTZtVXBnUk1RTDNoRFNHWFRFN1RBdkRqMk9kd3RyR1E3N2xBL2dB?=
 =?utf-8?B?bHVmQllDRmxrSUlxNFZCTlRkMGtsMkxheVZPbmt3anIrUU9jRUY2WGV6dlNz?=
 =?utf-8?B?Q29PSlI0bllTRmlpZXpaOUxXQzJjRHBxK2tuNjhtTmlCcDl0ZmRGZ0V3eGlX?=
 =?utf-8?B?cVdVQ3lScmN0VTZjci8xQndKdGtzejJUTTdRNzJlSmJEOGVCdmZoVTJucCs4?=
 =?utf-8?B?dXRiOUZHRUJ4bTlJZXFhRUdNcnN1bzEzd0o5cjFBM0p2RHdPTjdCTGQ0cENz?=
 =?utf-8?B?S2FsYjBtTHM0Rkd4dUxaOEhiWTZZSkdhTjNVK0NwR3ZrcysvY0NpbXArTzFh?=
 =?utf-8?B?alJJZ3R6YmFBcC8rcXI3N3VBQ3ZBZnBlTXp0S0lybksyQ0Q1TmhQK0JVc1R6?=
 =?utf-8?B?ekQ5cDg5ZkpHS0I0T3kva3Y0cjlpUURBUk8vckh0eE8rc3pYYzBDWUtZRTk3?=
 =?utf-8?B?QkJpZVhzaC80ZTZOWmVjMXdYRThsRkNiZ1pmTDFHc3lNU1JaUFNRRzIybits?=
 =?utf-8?B?RHI3N0tmaHlLM3ErV3FSUGgrWXlOSm9VN0szOEhxcGJXOFRNWmV1ZnEydzVo?=
 =?utf-8?B?RXNMdmdLaTdXZU9LZlRiRk1YRXE5QWZnRC8wK1hPQndHakhBVlVIZlVwQVBG?=
 =?utf-8?B?YzNuL2M5bURCcG9OcjJZU2ozUmxmT1ZmWjhqRVVlQVdtd25GL1k5eEErYlJM?=
 =?utf-8?B?c3kraVNGT3hwMXMvcWlhTks2bTNIbklaMUFhK2VNUytKS1BwNEZlUllCdjVk?=
 =?utf-8?B?TVMzcksrMVh5c0l5anNUMnBERHdJN1dHN09wbWl6WGdjNWk0QkEwOGlMc2p3?=
 =?utf-8?B?Wnc4em1tcGtuRHYzQnFEVmtwcDNRMVhpbEhxeituY0NuS0JGZTBhZnAzZVJk?=
 =?utf-8?B?UEVOYXJwUkl2eERkZWRxZDZLWDNPc3lRRE9hcVkrV25lM2pvNnF5eDBUWmNi?=
 =?utf-8?B?MHVma3Z1dTB5RVQwemttQjY0N3dhM1hSL29Ddlo0RmlXeTFCNGhCVEU4bUlv?=
 =?utf-8?B?THV5U1dSZzY3R1p6dmV5Qmd4aVJDQk9vQXJCR1hOeFR4TGx0N09PaTVpMjRm?=
 =?utf-8?B?L0EvTzJ3R0VKZDdqVlg5aTRNRjNtYmZxZ3haOGtod0M4WDBCZmRCTW00UGVJ?=
 =?utf-8?B?MWZPUGhpc3ZSTW9GcjBmKzZFelBKOG8wOE05S0E4VjNlZVdtRjdZVGFGS3F2?=
 =?utf-8?B?Z3dBaExJd0UwdVlYN0c2c1cxQndNZmNqbEpDWEhZS1BwYjhWVERyekhUdGNE?=
 =?utf-8?B?R3A2RGtMbEZISllNZXdDTXhnMEh3T1lWVmY4N2t0em9BR0wyUEN1V1pVRW55?=
 =?utf-8?B?c1JFWENSTU05RFIyTk9rMm1PSjVFdUFYZDdQVDNqbFhMMmxLR3UrR094d3Fz?=
 =?utf-8?B?MVVJdW5QSEQvL3VQV2RjU3RHdEs4Mm5XNDZINU1tSDlZUjkrZVhVNWcrSUdj?=
 =?utf-8?B?WjI0NXE4SlJnSGFlMnFSOXFScExzRGlvU0dXTlh5SVUyU1NDK0hUUHZPdWRG?=
 =?utf-8?B?WmJpWTFLRUtNb0FzU2FsNDVmUmhEVXlGMEpZa1ZGRkQzMTU3cE1Bd2ZJZG9C?=
 =?utf-8?B?TDV1dkg5dVprTzNXRFlQZzVpTlA4SDFOWFNOQWJ2OGtCemhnR3c2M01Bd2th?=
 =?utf-8?B?SzJPU3paMFV2T1VlcWRDSHdyTjVmS290MSt0bnZLVXF2UW9BQVI4T1l6K0F0?=
 =?utf-8?Q?79YrdT3plMgzYKzzqPjSsFLfLUAsuaohrwhpG+1PzFFEO?=
X-MS-Exchange-AntiSpam-MessageData-1: 4ejBfkDn04bglA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfe3341-1468-4406-2347-08da536e2181
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 10:09:30.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66qNmEld8D/FLOEK86DUs1Mnctu8auPa+8ba+2YwrhdY6wxuYoVjpqclOKFO8hb621pO7OENn+VAi5U1rlYZCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2643
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------rPoTtU8VIkQE07KyKq5UZdhy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.22 02:38, michael.lee@omron.com wrote:
> Dear Chris,
> 
> The below is the reply from Japan.
> 
> Dose they do the below commnad after connect B5L to USB?
> 
> sudo modprobe usbserial vendor=0x0590 product=0x00ca
> sudo chmod o+wr /dev/ttyUSB0
> 
> For linux environment ,this commnad is needed to connect B5L to USB.
> We preapre the below sh file with c++ sample codes.
> connect_tof.sh
> https://github.com/omron-devhub/b5l_TOFsensor_Sample_cpp
> 

Hi,

this is not nice. But in any case this thing is not an ACM
device. This patch should remove it from the driver it is
abusing to where it belongs. Could you please test it?

	Regards
		Oliver
--------------rPoTtU8VIkQE07KyKq5UZdhy
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-move-OMRON-B5L-from-ACM-to-sgeneric-serial.patch"
Content-Disposition: attachment;
 filename="0001-move-OMRON-B5L-from-ACM-to-sgeneric-serial.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZjAxYTM2NjYxMDRiNGE0ZjVjMmI2MWMxZGYwZDBlMDk0NDMyYjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUdWUsIDIxIEp1biAyMDIyIDEyOjA1OjA0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gbW92ZSBP
TVJPTiBCNUwgZnJvbSBBQ00gdG8gc2dlbmVyaWMgc2VyaWFsCgpUaGlzIHRoaW5nIGlzIG5vIEFD
TSwgd2hhdGV2ZXIgdGhlIGRlc2NyaXB0b3IgbWF5IHNheS4KQmxhY2tsaXN0IGFuZCBhZGQgaXRz
IElEIHRvIHNlcmlhbCBJRHMKClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1A
c3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jICAgICAgICAgICAgfCA0
ICsrKysKIGRyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBsZS5jIHwgNyArKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9jbGFzcy9jZGMtYWNtLmMgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKaW5kZXgg
OWI5YWVhMjRkNThjLi4xZTFiN2YxMDQ2OTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy1hY20uYworKysgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKQEAgLTE5MjgsNiAr
MTkyOCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgYWNtX2lkc1tdID0g
ewogCXsgVVNCX0RFVklDRSgweDA1OGIsIDB4MDA0MSksCiAJLmRyaXZlcl9pbmZvID0gSUdOT1JF
X0RFVklDRSwKIAl9LAorCS8qIE9NUk9OIEI1TCBUb0YgKi8KKwl7IFVTQl9ERVZJQ0UoMHgwNTkw
LCAweDAwY2EpLAorCS5kcml2ZXJfaW5mbyA9IElHTk9SRV9ERVZJQ0UsCisJfSwKIAogCS8qIEV4
Y2x1ZGUgRVRBUyBFUzU4eCAqLwogCXsgVVNCX0RFVklDRSgweDEwOGMsIDB4MDE1OSksIC8qIEVT
NTgxLjQgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBs
ZS5jIGIvZHJpdmVycy91c2Ivc2VyaWFsL3VzYi1zZXJpYWwtc2ltcGxlLmMKaW5kZXggNGM2NzQ3
ODg5YTE5Li41MDQwZjg0NTI4ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3NlcmlhbC91c2It
c2VyaWFsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBs
ZS5jCkBAIC05Niw2ICs5NiwxMSBAQCBERVZJQ0UobW90b3JvbGFfdGV0cmEsIE1PVE9ST0xBX1RF
VFJBX0lEUyk7CiAJeyBVU0JfREVWSUNFKDB4MDQyMSwgMHgwNjlhKSB9CS8qIE5va2lhIDEzMCAo
Uk0tMTAzNSkgKi8KIERFVklDRShub2tpYSwgTk9LSUFfSURTKTsKIAorLyogT01ST04gKi8KKyNk
ZWZpbmUgT01ST05fSURTKCkgXAorCXsgVVNCX0RFVklDRSgweDA1OTAsIDB4MDBjYSkgfSAgLyog
T01ST04gQjVMIFRvRiAqLworREVWSUNFKG9tcm9uLCBPTVJPTl9JRFMpOworCiAvKiBOb3ZhdGVs
IFdpcmVsZXNzIEdQUyBkcml2ZXIgKi8KICNkZWZpbmUgTk9WQVRFTF9JRFMoKQkJCVwKIAl7IFVT
Ql9ERVZJQ0UoMHgwOWQ3LCAweDAxMDApIH0JLyogTm92QXRlbCBGbGV4UGFjayBHUFMgKi8KQEAg
LTEzMCw2ICsxMzUsNyBAQCBzdGF0aWMgc3RydWN0IHVzYl9zZXJpYWxfZHJpdmVyICogY29uc3Qg
c2VyaWFsX2RyaXZlcnNbXSA9IHsKIAkmbW90b3JvbGFfdGV0cmFfZGV2aWNlLAogCSZub2tpYV9k
ZXZpY2UsCiAJJm5vdmF0ZWxfZ3BzX2RldmljZSwKKwkmb21yb25fZGV2aWNlLAogCSZocDR4X2Rl
dmljZSwKIAkmc3V1bnRvX2RldmljZSwKIAkmc2llbWVuc19tcGlfZGV2aWNlLApAQCAtMTQ4LDYg
KzE1NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBpZF90YWJsZVtdID0g
ewogCU1PVE9ST0xBX1RFVFJBX0lEUygpLAogCU5PS0lBX0lEUygpLAogCU5PVkFURUxfSURTKCks
CisJT01ST05fSURTKCksCiAJSFA0WF9JRFMoKSwKIAlTVVVOVE9fSURTKCksCiAJU0lFTUVOU19J
RFMoKSwKLS0gCjIuMzUuMwoK

--------------rPoTtU8VIkQE07KyKq5UZdhy--
