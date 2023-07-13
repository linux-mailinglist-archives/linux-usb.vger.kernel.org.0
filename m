Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CFB751F18
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 12:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbjGMKjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jul 2023 06:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234008AbjGMKjR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 06:39:17 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51DC1FC0
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 03:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iah6JTBSMlbMLHaQbe+IwFY1CR6BJi8UaFfTfa2NxXhosd7YXA0Op6qp0IB80J9sAbeTVUiW+wwYMDEUbZfPiAQa8uFEgpO5xov9XcD2B0Lw2HW7E/vnlcvgtR6sl+GaG3qI1Vr8RzhnV+9JW4hffsCfoGZSZCZSYKUoPBSihoyXZOTzhaatKscHHZRkY39TZNKWGf8LOYx5IX+LzezAnC4ySyqIUdsVOGy3Ea0K8WjUECgIkh9E7iJu7btTD5qThdKuEpKDu++kN6GrG5TIz83EpuUb8CBk8As+zNx5tjn5MSj1KjjmestSJ9vPZnpYC/bCHwrzrHWjOMD48YUHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZZ6EQkNSlYvLriYXQxvxEoNqUQfCnyKiVfsQoiEGUo=;
 b=a1T3NMRLjNsTLA5DRTKb3quYQ6Xx1Ldl/Gp+Y/Tumr7nyPq0Pe3qWVr4MY/Kb7IDXm61LP2nDgEnkWMLmhADOf73tU0Jc2KC3AcwAOc6uh+CWaqVhNLiCdnwhtmoeX24H3ZJoyzMWc2h0wGd5vUzbDA8EcBH7moTjNAACJ1p3oQbKAWOklJt9RbB03v0mCVJs2VJNwMhLfvDEPRd+my+zDzPD/LZ+KtqEZWYi6BTRUwM+r90oO3lPNnvYkYw2DlupwBdYHTJQ65lLKfRUMZYZSdI7G8eGhXviC2kYjuXb4q4IrkC/a0SLRMy0mZEwmPvtAxTfe79BO+VwtuppZf4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZZ6EQkNSlYvLriYXQxvxEoNqUQfCnyKiVfsQoiEGUo=;
 b=dzLUiexZsBadeW1PPQFFH8wurQ/QBVaxQRzxoWTCHjM2ASSmDwea3zbhX2ejDr6GPYmLmrZMD5avTPur/UfPrK4I2eylEayKsaeu1e+R63QV6t/BKTwIzIhyu4RHQtE0k0CkFV90k2juaUvWY6WvcvHq3wTRQyhCJbKJC0U0pSN/+dJ/rDHJmxMLclpCWu9fHfMzZujNV2LfYcfPGFmgXItYvpFrqDeYcgH1bIeLIaGtHgQJLwxSyNlvpt8uRZU+qlY5PuAEFx5/YGX01UaCRSGKvUZpOQDqDsPmZAgI10+QkL40nbb9rknSL9XKpvPGC9og3BFZVmiIk2qyZLdPwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9843.eurprd04.prod.outlook.com (2603:10a6:10:4c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 10:39:11 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%7]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 10:39:11 +0000
Message-ID: <dfb234d2-9ee0-313f-d1a2-16c3767ccab6@suse.com>
Date:   Thu, 13 Jul 2023 12:39:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: question on uapi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9843:EE_
X-MS-Office365-Filtering-Correlation-Id: 253b5804-dca5-4d0b-99e5-08db838d6513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSYeNr7OILD8fZcFKgnv9TIlDKcADJIfec00VYsb7zBmUU5WCi035iTzuJ5XYp/332egXuP5MTqY/VwSivk5fDAxMRrS2nh3UC5UJcjIYv/6gMRZxELTpX5C3uaHQk65BJnrW55emajU6jTXin0tHIZZ/Buc0sOTfKccQ4T/aVi5fo44examtIwSg+sO07CVQhQbxqV3tcbEVNDOVFlEYKgxC2MS9HwrNTRFz//4MBWCU9u+D33XlGO1Bs9fiLscbH1nigJkYgHiCOIi+eRzKt+BsEydYwHHhcKf7pAsiM3fZWxj55T4EP9k0ShzyI2T6p6sv0V+YzPf9dPYU0WQCo+0hW0MTzNYW09ski3/iXb7VUFi6kUO5Ti0aD/o0KAepObumGhN1TJujoZSZsY9LBup6UKsQ15EEe36NC/rKkT+mgGZHxCV5Zo8I8E+INJ28ktrkbnbxOBxR1mT/lkT/l1WnEbpr6kBJqAbeUOavH1rrCGtK/3EB3JoDDhGE/MD1CvSVXuMoQbI/MSaupUE5BOIyFFSPQh/YrJpdqxKp1pKpS7ToriZaIn6FgftEUNI2OyJfp+EtCUa2N83D/re7xf9KZxL0+cESrc6ZdekDbp1oU70moTbfW8wG6GldSJXaeunTtMHo0uhkRWtyVinDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(6486002)(38100700002)(6512007)(186003)(2906002)(31686004)(6506007)(41300700001)(478600001)(36756003)(316002)(2616005)(86362001)(66556008)(66946007)(66476007)(558084003)(5660300002)(3480700007)(6916009)(8936002)(7116003)(31696002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmMwVjN0a1lPalNrdDEvTnRFRWR6WUFxKzRZR0NSeHpkMGhtRVNqN00rTmIw?=
 =?utf-8?B?eWFqdWZxbHNPLzBoeS9zeWl1Z1BFNk9pNzZxdURqby9kdVNZdTBsSHQwdng1?=
 =?utf-8?B?TFNsdnZlMHVWczNJRVVPM2lGcStFcmFTbnErWU1oaDlaL0VPcmFDUnFnaXEv?=
 =?utf-8?B?eStXZkEyS0dvV1hURFFxZVVjVVExVDBKa0daT0VtQmxVL2tXSGRheUN6NWxs?=
 =?utf-8?B?V0N1VGVNR2NhOXd2MGQ3T2M2Mkt1bFlZcVlmMnlnS2tCVCtvd09WQTRjckJa?=
 =?utf-8?B?ZTZ0aVRVSVRoYXZJRmhLSGE5RmgvM1dtdUxwbTFkVEZvUUdyQkJpdXZxd0sw?=
 =?utf-8?B?QmFYb3J4MWljajJISFIwbkd6MytRSXRGa05QbzU3N0ZjSFRCVmxXVnpPaXFM?=
 =?utf-8?B?ZGZzVVljSzZJRDBCQUFwTVcrbUNFTHVITEV6S05EQ2g0MENpL0NrRVZ4TGdt?=
 =?utf-8?B?UXc2ZjhaYmJyOTdlVFdRd3pRMDk5b2V6YlFXZFFlMlNHN0pVYTRjYURwd3Jx?=
 =?utf-8?B?bWdhR0x5eGpJUTRHSHNqWnN2enFrWG13N0VSRm5xdHZueGw3eWFiVm5HNnBq?=
 =?utf-8?B?SUhQMFhGQnBmSXZYcytHeldwOTZuVFBGVVV6emlKM3M4eHZoVXhzeTM5eTBG?=
 =?utf-8?B?ZEdCaHBXVkt0alQxK0FHVXpwRytFcDVwcUtVaHBseERoM3ZVR2NCM25jS3JG?=
 =?utf-8?B?eERPa0hLSUlTR2lRT1pUbFBDSXVlekhpckJPSnhLcVdxMUJHb0dnekxzMDAw?=
 =?utf-8?B?cVdlTE4xelEra3J1REswM3BNTThSMDN0S1FCdE53SUtROWdnb05EQldLUE41?=
 =?utf-8?B?UnQyQ1dSNEJjR2Y2aHY5Zmg3WEh6SDBBT0huaW5vQWpLOTYzQ0hwZjVLUkZh?=
 =?utf-8?B?ZWppaEJLcGVXcElhY0hQVFVYc0hTNk9VWnZvbU5udFhtSS9vTzNZUnVZaGty?=
 =?utf-8?B?Y0taQkFxQTlXUnRSbG1yWWhSTnJYYUdyWFJlai9SRGdzZEN1WEd1WDdmcWZ0?=
 =?utf-8?B?N2FGQzAxZnplenZMSHFFQlIvOGFiWFpTZkZuZE02Y05DK2RNbDBXYTFpd1hB?=
 =?utf-8?B?dnlqdEt5TDVVRHRENGtkeDRhZ0toTVFMUVF2OGVvMnJaaEEzZEtnZHJGbGdk?=
 =?utf-8?B?UWg5TVREUjhHQVRHSFY3enp0ZXBJQkZVaXk2Y1VMS2tmc0k1N2RHaDYxL0lZ?=
 =?utf-8?B?UlFLdDgxcHZuZXQvZnhkc0Z6b3phSnZoYzhzUEYxL1hGZjZ6WG5yRXIycFVS?=
 =?utf-8?B?amxUOFdOeDJ3VnRSRjF5alFRcEpPcXR4QzRsQ2tpTnFqT3RBZDZVWE9CZkdr?=
 =?utf-8?B?SW5RV2NJYVBicXpmbGZ4WFBQUTVySTBqKy9wZUtPYWtud09JdFlFN1Y2VnY5?=
 =?utf-8?B?Z1BmWFdsWE1XNGVXOXR6VVErc1RKcWR1dGJVU0ZseUV0ZFVCbm9TZmwrQlJp?=
 =?utf-8?B?TVVHcWlKQ3ZGVWlHS1FmTWNXdFBEU1JBSWFsOFZQMEM2SUtmWWZ6MXBORXBW?=
 =?utf-8?B?OWxtQ0hldGtFcWJHSm0vSW4vdWl5dHp0emFaQ2FWY0dXK3JCOUJkT0pKSHA3?=
 =?utf-8?B?b0dCdk1wdXV1ZTJsZUVEZDVGZFpOazRsaEZDTXpWNFhJdHhhZWEyaFhRd0ZC?=
 =?utf-8?B?K3FFS0w0VnVVVHpnWWV0UmxLWlJoT0dqU0hMbjZ6QS9RZ1NIbHF6ampKVThr?=
 =?utf-8?B?TEU5TkVUTGViTHEvNWljb2ZiVEpVZjRuZ2VTK1E2NmVQQVBHd1hWVkN0S0Zt?=
 =?utf-8?B?ZlRSL0hybThwNEx1QVVpR3JxaVRsalRlVTJuekdLQmtjcDVLL2VpRzgwem1z?=
 =?utf-8?B?MTRsdFFXNDlrZ0s5NGxzelozR09JMkJtWTQ3QTUwSllvOHZYS0pXSWFPZWRv?=
 =?utf-8?B?bWlnUDhyR2srTTR6UmtPZjlPSHJDVDN0QlBpTFlVQXJINTB0TytYWmh1Qm5r?=
 =?utf-8?B?WDVmdjIxUm1vWU05ckljRFZyR3VnWDZTb2p3SllrUGViYU9hQlBtVEFLck1Z?=
 =?utf-8?B?QlR2Tlhsb1NHYXowTm85R2l6YUQvbUhBOGFxejJERHFwZm54N1JYWUNoTlNF?=
 =?utf-8?B?TGxWdmVkYUs3WU92VE9hbGxDeENIbU05K21ib1BaNlhOOFJqMVBmLzAyd3J4?=
 =?utf-8?B?NVhBVHVBNTVKV28vZGtLYzg2SThKL1FmRzdHMytCQS9hMXpvNktVTzZ0ZnFU?=
 =?utf-8?Q?zjAqIY66u4lWvCgnM1XQHEo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253b5804-dca5-4d0b-99e5-08db838d6513
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:39:11.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3V/AuW9E4PCvTN8upteAN4tpkofa1FtIqmOmvel/bmoywv3UdLEEYB4OFxt3w+9Sb4PiBQnFfC4oLNhdNb5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9843
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

what is the policy on uapi. It being for user space means
that it should be as complete as possible, even if the kernel does not need stuff,
should it not?

	Regards
		Oliver
