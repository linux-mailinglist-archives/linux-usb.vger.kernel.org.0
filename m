Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC294518182
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 11:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbiECJpr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 05:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbiECJpd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 05:45:33 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10095.outbound.protection.outlook.com [40.107.1.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E78338D92;
        Tue,  3 May 2022 02:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOicHrma9LV1Virn3drTVbh1pG89o4QYPIEciWUmA4zbcfr2CXftOWNmjL1VmPZRRuwjt0qPfykH25UfzQjDbO/vk6cm4Q3nUOLNg/ujE0CuaIVdi6jm/Sz7LsYprYppqWLCLLdZms2oMdOLTenr7Mhe56BUwliLFyhSvlOXmdvt/cMto9TGGKmQxMcBPJutUQS1NRWPPQYUZ1ZQl5DdPssOVjPjASw6rsTsRIVeDZwPvuOAqb56I+vrdWEy9/Ug+4+OYCnZcc5fIb+W3eXHKo37uaXbUd8F+/HYm9uRSYCDXy7uoznN7HFeRca7gL8dCm3LG8BMhHiJUNcELAqyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dx3wOSLVpNxiVo4YXsOfwBatMwuNFriOL/LsmopYPY=;
 b=AJV8NWgyx5pBO1mvjEvwlaQffh18pfrke4ambffKSUADuXc9GOb4BxMjLU936anlB6htvGLi+/yEudg356r1HC2Si4sLHj2uFyUGG5PU4yHy1S4EObwqf95DRVnOHDwySEQftUEr3X3Qlk8PmRKir6rhnrI49fGdN8wb9hkLjsoxeJxL1uMSHlEAfb+xmi02aQbb6pSxrVfHgjoLbOhlHeBsoiQ79XguJJziC29gKWPSbtVru/PtLwVGBMhb03V6YfzkUA1lYkDtOZGPVLS7p1dZ5L64qJJ0NXpZWTZi5jv4PZ8DiTJaRYcZLbnxarJPZ5WAzW/JPGtQcrounrzlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dx3wOSLVpNxiVo4YXsOfwBatMwuNFriOL/LsmopYPY=;
 b=PMeya/JhXgGqUY/SzG0Ej4YqWtqmaAOykVsX3iLt12FBFasbhZXf/H0zz6ugFc2SWj3It90/K1/j2hdE5Or5A0sy253kxKIHE16GZ12w+JaXLACqF5AsJmeZqa4kPlHkxTnBZXFHaYtN0x5hnGvPW/Qsu3z8mimdHmXUVdU36yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com (2603:10a6:10:3ed::8)
 by PR3PR02MB6473.eurprd02.prod.outlook.com (2603:10a6:102:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:41:20 +0000
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::4d02:9bdf:8002:af7a]) by DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::4d02:9bdf:8002:af7a%6]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 09:41:20 +0000
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
To:     Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se> <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
 <75ed6e33-0d67-c50f-4d3a-7345d5f058b4@axentia.se> <YnDz/q7hqlTbRqYR@ltleri2>
From:   Daniels Umanovskis <du@axentia.se>
Message-ID: <fb7a499f-2abb-d84e-c8d5-4d15e7fb6d3d@axentia.se>
Date:   Tue, 3 May 2022 11:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <YnDz/q7hqlTbRqYR@ltleri2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: GV3P280CA0077.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::33) To DU0PR02MB8737.eurprd02.prod.outlook.com
 (2603:10a6:10:3ed::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c7043f-f938-467b-9f05-08da2ce913d0
X-MS-TrafficTypeDiagnostic: PR3PR02MB6473:EE_
X-Microsoft-Antispam-PRVS: <PR3PR02MB64732E74144B9E40E85706C2BDC09@PR3PR02MB6473.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ce88xKcal6K/Cb6UywQ1T/+Ml8+Ho1EZNLCSXENMOxncjNEWzoHFFrFsQKShJ5mtLf1HeycjKX9wsH2/tA9BOrmJpZTUjEFy0MqrnuecndgPsSJSfD6bPcn5YQAjYzROJjvjq3Bkp35H4mhSW611w4hraxsYt1BNulgivqiaFxpUSm9NsmzqDG5nhTtUz9cKx2z6WfjY3h0cg/rJmEYJ7AA1mRdIXUg2WEnOzCIDN2Pj33HiK+QtwdsXQlOWs6SZnNQfgZwReuHEFoxA88iJTwWohMlK3kKNdyCMItoyMuMLYOlOE5pMN3kiTCA0ix1kH/FWF3jCuqIQHSJ+ojRxqTY59kKVgaaMgdPBB7Z5g/2XpJ5H+ZX+V6wyPYTlrwzbkpF3UR2FUOo9R0QARsaoQnUbWgBfTxdYJ4V/1kXl6eRgKJKo/1NedI1qeyF8zP7KRur0l8TURp5zSNoZ2SPr7n1CKJkRPgFA79JT4xD+OxWwTc0Lez7D0HmHT0yPBBurUhBgzWavKUFRlzvtPN40DM67yAFl2DWNO8QTsG0ny97tO5iZqyRX+hMDNnVmihnBjBOXuvZkL1BAczmAOHqq4pa9N+XL1u+w8fmGRc1F0v6RoHzb4VpGTEGy3exjdx62Appr2w4VGYufVHTxcx/+xwBxN5GrHYCzTsfIlS2HGBioskOKCgjY9EF1Bv+DS1MEngOwjLOTdCQg2k6Rqz7NIEwOJnV80IbzRxiYDqrEokQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8737.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(376002)(39840400004)(346002)(366004)(396003)(2616005)(186003)(53546011)(8676002)(36756003)(31686004)(4744005)(8936002)(5660300002)(2906002)(4326008)(38100700002)(66946007)(66556008)(6916009)(86362001)(26005)(66476007)(6512007)(6666004)(6506007)(31696002)(316002)(508600001)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG8ydUFmdmxtallOZkdZdGZKN2pqQVpoMDFmeDJHNjNZc3VoZ1ZJelhhcm8w?=
 =?utf-8?B?Yms4Q2x1NE5Dcmc1TVJNMkFkM0JUR0dtMmpPWjYrRkdpWWJLQVlLakgrc2xh?=
 =?utf-8?B?Q2djOE9qWjR0YVdsQmgxWXV5T0FZT0RZaG0zR1hhdjNRekV6aGFUQXlsQkUx?=
 =?utf-8?B?VXhnbTV3NEhoZ2NnUEJlTXFRcW9xZlZ3b1JjcjhHT3pwaWNnMTVFNEUrYnRn?=
 =?utf-8?B?eFc4ZTlwRG5pdXB5V0Fmc3VPcmRqemtudkN0cE5oK25FdWRJeUh3enROUnFh?=
 =?utf-8?B?ZVpNZDhLNHZzNm1nL0R4Uks4azhXbFA5MXlGcGxFOUc1SkFhMHZRWnROR3J3?=
 =?utf-8?B?d1ZqOFNVZGswZ2I2ZUdFbnpGaktOUHhWWFlQcFpEVEpTazBhS3AzYTE2YWRp?=
 =?utf-8?B?ZGVETnVXejRTenpoMnRDZThPUjd4RXNvMTQ1Q0gxTUFvQlhab00rd2pYcXRz?=
 =?utf-8?B?QXBXeEU5Qkh1OFRDVzdoMm8xYURHZXhNMDh6cXI1UXBpb0lvMWRKSWdQdnpk?=
 =?utf-8?B?Qm1JVkpUd2Zyd3NoaWZIck5mS0Fqd0w1VWU5N2RDR0xXVjlYTmdEWmxaZFpl?=
 =?utf-8?B?bVBmRzU0UHg4Z3Zueit4RTN4TVg3V1JKUmozaTlPWU9XbnpCajVYbFp5Tjdm?=
 =?utf-8?B?blFucmpBSGpKM1FoUFRnVXhrcnJaNnNIdE55Um1DTlp1UGJiRlZZVFdVbm9w?=
 =?utf-8?B?YkVhbWFzY2NtMXB2WnMwTEl4bTRJeFplb1BQcG5JS0wrS1c3N1ZEN0daY1Y3?=
 =?utf-8?B?eFBxaG1iOVhCWk5XaWVWUDNlOVorTXl1V0lEMXEwdXFkd0VBU0c5K0p6M09j?=
 =?utf-8?B?d0JoZ2IzL1pLN3ZVSXFGUW1XMVZOaVQ4b0xIMjNFUFpwT3VkeXNtcVNGVXo5?=
 =?utf-8?B?K1YzMExZckhyN3hIZHB6dldQeU0wSjVTQjFkUTZnNnZuZGhJeGV2SzNSejRK?=
 =?utf-8?B?eWFJOWg1YlorTzZkbTg4QXM3NEdPNUo3THJQTkJKeVdOd2JrRjhpM1RnMmV5?=
 =?utf-8?B?SGdVS2xjVFdCSy9FdnkrVFZwcFkzYWt3bm1FakpQeFRuaG1LaUQzVXArR2hm?=
 =?utf-8?B?bkpqWFZ1eS9TRlhvVW9SKzIxWUVlZjl2ZzZEblJIeHFORGUxd0pUWnYxTi9N?=
 =?utf-8?B?Rm5sbWVUa2NGdkR0dmZEbklkcUJlZzVERFNJQ0ZLNlQrZ2pMVTlGVHhSMUV4?=
 =?utf-8?B?eHZGYjFYeEdFcWN2SHV4YlRZQk1RTklENGxJRnhzQzJRb1crRHZNTTg4SGtL?=
 =?utf-8?B?Y2d4VldVbkFTbHprUUpKZUpOcktPN1RVbGhKclF2TnQraklkU3BrZG92ZE03?=
 =?utf-8?B?eXl2U2EydnpQYzNhbER0MGY1QzNqTVNkMEg1cEJ6ekI0Lyt2aDlQYnVPTjl4?=
 =?utf-8?B?SnVnUUszZkRKMjJBeXc1bkxBT3JaUkU3bTl5dmhsM3p4NnNwb3NWU2doZFVh?=
 =?utf-8?B?cThmZkVRZmRDVy9Xakp1R2pCc3Z2Ym01V3E0TUhLcWhNVncxWHVzeFlsbS94?=
 =?utf-8?B?SyttbE1RdGNsK2V0Nnkwakt6Qk1hU1ltcitxSDljbTg4SjhrSjBHYU5jZlhR?=
 =?utf-8?B?ZGhNUkpsczBySWhGbFBRd2oxbFc0TjQ4VFpGVEpMWDg2KzlIUlc0SjBXczQ1?=
 =?utf-8?B?UlZpVENUSEtuQXRxcnlFUERQOWNGcmNhUDhRcjRtNUh5K1VwZTdEV1FUUzAy?=
 =?utf-8?B?Nm91d2hhTVlsb0lXOWVhZ2QvY1JEK3NNZG1YMFZPQ292U1pmWGc4cjlMemdM?=
 =?utf-8?B?eGErbWJ0NkM4RnFlZ1RNSFg0ZTFEY3pKUUxQeDVyVlBvWHdzSzJZVmFXR2pG?=
 =?utf-8?B?Vk0reUpJbWhEYmdNK2gxbjZEYkZ2bEF5STZROHYwTHdSOU52NFozMTU4RVhj?=
 =?utf-8?B?TVdqYUpna3lGYXR6K0hreW9Td1FwaDhKMHlhVmY2OW1FNVNWL2tkaXRGY2Ez?=
 =?utf-8?B?ZitQbXdSczdnUnpGTXdHeE5oVEZ1WTE3cDZZYmVKK3VqSVQvZ0JFTEx4eTBl?=
 =?utf-8?B?emtmZHp6eTRGcFFQb09NV1h5Zmp1cWx2ZnlTMHFZMWpScDE0ei94WDVCb05q?=
 =?utf-8?B?V1NPWkxOclpVOVc5SkhGRHNZYUxIa1NqYlE0N3FrSDl1Ny9mbUFNMXNRMEJD?=
 =?utf-8?B?d1JOa0owWCsvS01nZ0prbitXL2E4ZE9Pb1IySUJNNmRpb3hyR2pMZHNqdkRz?=
 =?utf-8?B?cDR3eXovSzc5NjlxaGEyVkhTUllnMkhMMERra2tOazREakxueVdkd0RQdjYw?=
 =?utf-8?B?VzUvMUdWMElLNHFLTndsVGI2TlJsVitoY0pkYkc3SkFEZElYaHdQZXdVOGpu?=
 =?utf-8?Q?YWP8N5oNJ5Rhlhm7kc?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c7043f-f938-467b-9f05-08da2ce913d0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:41:19.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLVfFX/X4Ts7Gx4m9w2lmzoLIA8rRt5q8xX0PnoEQEOgV9sCTyuOL3FTqj1HI2vR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6473
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/3/22 11:21 AM, Richard Leitner - SKIDATA wrote:
> What's the maximum timeout you've observed?
>
> I guess it would be the simpler and "better" approach to just increase
> the timeout in the driver (if it's not too much above the 500µs).

I saw 800-820 us at most, and my initial fix internally was just to 
increase the sleep duration in the driver. But it's an increase of over 
50% and I don't feel it makes sense to change the driver's behavior for 
thousands of users with properly working chips, hence the configurable 
timeout for out-of-spec batches like the one we had here. I expect more 
users to run across such batches in the coming months.

In an ideal world, we'd just trash these hubs that should have surely 
failed factory QA, but with today's component shortage that's an 
unimaginable luxury...

/Daniels

