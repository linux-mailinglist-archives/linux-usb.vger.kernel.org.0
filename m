Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000CD54B32F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 16:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245755AbiFNO3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 10:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244280AbiFNO3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 10:29:47 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4467437A95
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 07:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB/IqArYGuC/Et8V/q8VVHYvJYijaE72sTuxrNL1BN2O3V22JOg6x2/LD4X8kHe3YoxKozfNHZPsDIPloigh4lfANyNgb0+nbWV3D62Ece2c6PvbA1hZTJVt84Svec4Qdc/rHZ4SvUBuXLvVRvQ6RPRXotowHJmXaebwnKN7jh2MApQmsdGxb1QzafxY7/z1TlN1x093Fur3254dg2yUbJNK3JJPKQ5hkYipM1m4olAQ5bUqRr3/W/EdmhEvvUV1Wf99XwEksvpqJFdj0tEw8XA1+lxtXKUVnmIq5+QF4UwXhqQM2fbYXENGFXO3OmN0Fx0tqAcKELrZbJAGuAC/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF+7aia9xzEiD4E6vYRAAOmZYb6kotn4I3Wz60m7DcM=;
 b=Q1BjpuWH6LTEtFmA8tTcADzOAwab/+M5SLHuyDQ07meiyoAMZeU5ukS6Va0uy7fECpBDH0QxXIcnhICVKuGQ4NAfD/AF4deYpLClNq4hw0+5fZULsqX2wqYLtLUvvDW4q9UmeSrRsnHvi+u6EeZJxfZJSyr5hiy4YBtV+RZRITgp9V3doeiPHC2NhRo0nNsum4OpiJNPH8hIQShhNKnm3x6tUHIWJpTdJvJC6wktJWLEu2ir2F+3Q6kcgsDUvE9cqbVgbIo73yIuPqzmf2XRBRx4TZ+iQsWqo3BjFnEdIv/K6/fmjoUJ87MHK22OrXDlQYarqJ9+J1Zn5Y5+JRjc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pF+7aia9xzEiD4E6vYRAAOmZYb6kotn4I3Wz60m7DcM=;
 b=TNUO2HIhEbas7S6fg1nE7hGSmweVXCFLF42nkE1KtJFZwLFICGM1Me0jUa++2ElC951QwQAoqWAeiCQVj7rly7T/Z1sJkem2LYfWMRcF04xJHptNehOADCzYBLIY+DdXMKyNtr7l5iPjYBQx3UX4WHZJkRqqpaYHSi45jHxo66XmbFjHsZpeQ6ADNCDWkJbBBGWCkmQ+eEebtF2VmBIzkSTbuGAOiRsiHkyBAZV4CEvAltYD53DBqPpu/aQCXaGcTyebXOY+gtkbx9gS4ICdzUesNIGF63hj67mvMSaXnOWKDONmPimYRBwbmESTOTuxYDBumitMtB6eP/cgYfS3Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM5PR0401MB2515.eurprd04.prod.outlook.com
 (2603:10a6:203:36::19) by AM5PR0402MB2818.eurprd04.prod.outlook.com
 (2603:10a6:203:98::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.21; Tue, 14 Jun
 2022 14:29:41 +0000
Received: from AM5PR0401MB2515.eurprd04.prod.outlook.com
 ([fe80::1dcc:ddb9:5198:5891]) by AM5PR0401MB2515.eurprd04.prod.outlook.com
 ([fe80::1dcc:ddb9:5198:5891%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:29:41 +0000
Message-ID: <34305c4b-5973-f690-d3b3-e1b09ce1ce95@suse.com>
Date:   Tue, 14 Jun 2022 16:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To:     Johan Hovold <johan@kernel.org>
Content-Language: en-US
Cc:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: question on when to call usb_serial_handle_dcd_change()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::30) To AM5PR0401MB2515.eurprd04.prod.outlook.com
 (2603:10a6:203:36::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f891a25c-09d7-430f-b8b2-08da4e1251eb
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2818:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0402MB28181B9A6CCFE5790C75E598C7AA9@AM5PR0402MB2818.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfA5t6g0+90Kgr3X/M8qVJNQpOBEc5lec18dJz1mdltVq5MjqAt2onta8o2JTALoZlox4xZvYv0bSf6L3p+U5IWpmnLRXGfBSxYBl/aBIXBacEwMGl3A2VTfodOsuJrNLZYIdaHIhXYlFk7MT38CYMHmPUsO3QY5E9DzYy1sgleiHTmbFs2o2kXWxyuUxuIxIOy79j4TcgKO/HhAsjEGOfkC7NsVXyoWLVMNO2yxoLi0Df/hTxFIARaGIsOpIt7F7UdNkwYLXP66ltBGC6W/V/EsDDujHL4H+xC45mG/Xw4bjkR65NVJzjHMfKTlSR3TxPmCPVHGgIg4B6BvPP9jSYs4IhRtGwucEvVf7EsBrHjDjmkdkqLgnL11+a8l7Re0WYhPU4Av2Z452sJgQrGmRP3+AiCmps583dHSg6Gg8I8nRoM3SqNT0b0cYapYq4fCvAwCYgRZq66M9gkDs8swE4wDWB2P3Q5w/3VTgcFFgwRJXcNC3orMGEkuYd7m2sxFde8XI1+2gwigO1WIhmR6/z/900KdyO2MdzAMNtVAwbQIbLikrgvx5l+6UZCZObwPhxpGfHR58UntyoRUNcrp60ANm1zT307DQJ6fzZZvKPCYfREJ59fbnbh5VVtB8GbDd5DXGHfynZNVwNZQnpK3hUdoFGdgc3+sES/vH71x6NaQWGvMmB3LXukJMI9//T7DXJpWnHr/yFeIRXQtKYGRCWrmNGgzHeL8bFLlcS0y+Y0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0401MB2515.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(558084003)(38100700002)(31696002)(31686004)(316002)(36756003)(2616005)(6916009)(6512007)(186003)(86362001)(6506007)(8676002)(2906002)(8936002)(6486002)(66476007)(66556008)(4326008)(83380400001)(5660300002)(508600001)(4270600006)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0xCQTBzTHhWcXA0bDBjaXJaS3ZpKzBiUWJ1aHFWbEt2WnJkNlI1Z2RSSUVl?=
 =?utf-8?B?a0EycTZEUzN6Z1FWZUNMSXdoTVNSbDg1YUV6MEl0cVZpaGtjbnFVVlNraklK?=
 =?utf-8?B?ak05WmFnVTVEYU5Mdm5hYWNqUXhWcUxUaXplSVM4UUtoV29sSXpWV2FGQWZ3?=
 =?utf-8?B?V3JPMzZwblJYNnNHcGFEMExMV1ErVXFPWThRNVBMTlJaNkFyNWRDS2VwUDVV?=
 =?utf-8?B?Vko2MmtyTGNSWDZBS3cwMW92WWphVVkvbytSdVZrZUN0WFRPUVFiUVNNZUVZ?=
 =?utf-8?B?K0s0M1JQTTdqb3VHdU1ucExqQzNDbjV1OW9hMjdpOG5UcUF6bkp2QUV5ODh5?=
 =?utf-8?B?TzB5ZFRVR2JIa2dnMHBnRFIxVVpHaTV2a1FSVHFpVThQWkZtWVV4SlpnbTJV?=
 =?utf-8?B?MHRJTjVpVHRkMThWMTZPVzdpNHlUK0hjbUFpWU13YU1VSStyRndwTWFlaTd3?=
 =?utf-8?B?VHlESnNkRldwUkZaZjFsS1pMUDl5Sy8xajBMUjJSUkFvajg0K2lTVkdxL3ha?=
 =?utf-8?B?OXNvSGlnNGltblVQd0ZOS3FvY2xpUXVWc1Q2WS9WR2pGYVZsY3BkUTg5UEhE?=
 =?utf-8?B?OGtjclYzR3hEaDRudTc0cEZVQzExNmlaWmgxWG1SVjRPajFvVVozZ0h2RTNQ?=
 =?utf-8?B?c0lqbkZ0eWV4T3RQdTBHSlMxOXJRc2hWTDBOL3JpWlhKc3V5bEFxczRuNTV2?=
 =?utf-8?B?ai9rRlp1OVduQnA3blVCcUtkOGluek5jMnZmTUMvWEEzeWFQVUdPOWtxNzNn?=
 =?utf-8?B?bWsyUHRHL1psS01DQVZIZ2M3elpjWGJ5Zi9DMlRCNGlKNUhBWUNUemtmb3Ji?=
 =?utf-8?B?YVRyQk5XeGxicWhmaUlKYWd4YlA5ZUlkNy8zaDdkaXVFNFZYUXpyWDdqcFZY?=
 =?utf-8?B?NnBwT1NuQWVGL3FsL2lSSktHa2lLaXBLYXF2ZCtkSXJnUWpEelVhNExuZ1dQ?=
 =?utf-8?B?bEtBSVRwaE9SZmVZd0RCWHp0c1Iva2RvRmxNRUtnMzBNUXFNaEFEMklrRDJp?=
 =?utf-8?B?Y2pGM0lYR3B5UkVkbW9hSlYzMklRQ2tzR0cwcHk1bXM0TmJkNktEQjJwd3RV?=
 =?utf-8?B?dm5hVS9mcjlIR3RrZ285dG5XT0pnUE1CaGRva3p5NUZ2alRtcnlyZ0NPMVdJ?=
 =?utf-8?B?MHVCRlJTVlBjdE52YVZtNkZtV21neE5XTUg2OVl2VjVNR3g3SlVGWkhXN00z?=
 =?utf-8?B?MXFNVy9PTlBodnlNRkk1V2MrNEYrOE1OYWpjTnUveDBqKy83YVQ5a01GRW15?=
 =?utf-8?B?dm5DaTFuVXpCMWlZZFl2Z1hnY0JYTkg1MGJ0aHdiMStIWW5MWE1IYzdkMUxX?=
 =?utf-8?B?WDhlSWQwcXFwQ21ESkw1MEdDSDBLOHo5WnJaNFBZcWdSVjlqWDdWdjVLKzdl?=
 =?utf-8?B?cFBtQUlpU2RHNjd3R2pMQXlack1pVzF6UkJLYnoyZnR6K1R3dVE0cTBUY3J1?=
 =?utf-8?B?Mm85Sk0vRVF5R2FNNG5ieWE4STJtSUNpdlI2aE5HQ3p2N2REYm8yckI2QVNW?=
 =?utf-8?B?Y0hvMFBNbjR6NytlbDJpMFY4T1Q1aEZOMTNLVk5tQmY1cW1iVno3N1lVRmZq?=
 =?utf-8?B?UFNwRWRBbURodWsvTVNuWlQ5RHpzNUlEeFJPeWZZTmhYdXdPeE9YaGpYaC9G?=
 =?utf-8?B?MEMzQVEvNGM2SGswQUN1RmdIejNEdXBZUUphQitGcG8raGRJZ0lrNWF0MUsr?=
 =?utf-8?B?NEN0OGt6OS94VlBPUFl2dEYxRlp5R3BkMnpMekZmN1ROUkRpeXl2cjJiY1RR?=
 =?utf-8?B?ZkVDWk5UK2tmb3dRYkQ0UEpwRm81bUJ4MUJHZ3ZUVDdRRmxGK0tIb3hTU2V1?=
 =?utf-8?B?d1FZSnpyOTNOZHVueU9mdUsxamxkeDJuWHIzZXdNWnVQV0xIRXorU283cXJ0?=
 =?utf-8?B?UkU2b0NtZHdJQVM4OGRKRlJRYTh2bTJrOFE0Ni81cEtXV0FrQUxEVTZWQWVp?=
 =?utf-8?B?MWY4dXlTNVhBWmc0RmZaR1c0Z2lpeE9RRXhVZTFKaVhtcjg5WEEwNWg3emwy?=
 =?utf-8?B?dytkSXpTY1lBYUtEL1VITFhCbnhaditQSVNFb3NDTEJXMnJEa1lZZURRcHhH?=
 =?utf-8?B?cmJjSG9SK1pNczhJZHRsMS82b01OZW0rWWttVkNaaUNKR21wTStBT0pJcjBo?=
 =?utf-8?B?VXR5WkgyZkJvNlhUTnFqT3BnUDJCNGRIOUpFUCtRbWRjMUhyTjVzZFdqMzlT?=
 =?utf-8?B?VEYvYVBPVWdaNEdkZ1l5cXNHaSswdTJyRXFmazVNTzJwSXhwcnNhcjVlUWNj?=
 =?utf-8?B?azFBQmxiRjhXbTg5YkxQNTV6aFJxc3RZb3IxRnRxeWtnb2JwSTVNVlhGTXpa?=
 =?utf-8?B?Mm8yTGdUdDNXZFpCdm9yRFlYWUxxa2FKZnl3UG5ZNzlTMnRGSmRYQ3hKdUph?=
 =?utf-8?Q?CCKNTg2XV1lpV1n5Q/xNlnTkUMkRV/55kYpOjkiqp4YMj?=
X-MS-Exchange-AntiSpam-MessageData-1: Lf5SvkX25Mcf3g==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f891a25c-09d7-430f-b8b2-08da4e1251eb
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0401MB2515.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 14:29:41.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l04eop/6rh6aT+EUmckSCaUUp1P9GRl57ivEdJ0zSjWzqGXsAv909WNQ4fJ8G/VcOCbXHfpIBkJPRvsAYsz7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2818
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

can this be called unconditionally, that is even for a closed tty?

	Regards
		Oliver
