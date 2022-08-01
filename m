Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6AB586800
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 13:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiHALSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 07:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiHALSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 07:18:13 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD4227B32
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 04:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvB7dbwBwQjwT9S3hLdTy6VJ7Ehd9hKrJvZKi6y8iScZoOQH/6odfs9epXvqLmrx5VtecoH1VCbgAtnd+IjwEYa+RHKLU3qPBXtrmHImx8ufQDyz0K+9rjsV9XRgsU9LlxwaYrkMJ6HPtXxT/qdEa4zilxhfBd8WpeHEwnHWhFaHqvsqqhb3Xr8Z+Y7VW51NezrCPJgcVhoXQN2I9LpXl3x17ulxoAondSQwrw7OxDiGB2mTb7kAHFyy/rU6ZpNDrGxL7uaM68ubj3Iv1JrYCVRk0XK8lYKfJdtn5MLGNw7nwsUbeAUuyGhbiQM71wisJTy/EksEStwOLZsrOp3EdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRLciTTmBw+dzpaVv0oynzyVbLspz4i2oK5OfaqOzaY=;
 b=OzBovIFyfOgsz3cYcde62FTEtKpGzxrYuX49ohkMN8bJOgxANiwbhEwQZxTDlPKiUAPVnOvRu0hqtD5tamBj+GXQHR6BbSf+aUuxbs43MkS19Qa5jAm3SD4UX1QH5Y98HWq67ZRjUDF23RTutU3w+RQQ5Sj7KBk9/gLE9m8wx8Q8PxyxyDYUvONJ8ptk4aIlpO2ZUMdIjQcgLCHLtqROUeC1EaclZdHjoE8dj98pdwDDIooq9BbnQ//VsPPtoMf8KYmti1BCaOrmanbEq+QEvFFuIhQpYQSi6fumI1Nnad6cK4NdkzyOgp1YBHo9VJl0dyCHxmk7XN25QzzrqhoDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRLciTTmBw+dzpaVv0oynzyVbLspz4i2oK5OfaqOzaY=;
 b=X6kU+Ef50kAjHqlZn83l1d5sK6IophhgRzuJq/vJGa0Jt1SK56foLU8SndHYxNykh0knE7DnWAaTZFO6f2r6IVH0Jl20N1ceuY2iWdH7jOhUCY5q2O0qdj066c7USwS2TsdIRm7lH3bn8hhxwwfCYnhPsCmrh6epI9sG73FSCho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 BN6PR12MB1828.namprd12.prod.outlook.com (2603:10b6:404:108::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Mon, 1 Aug 2022 11:18:10 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733%8]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 11:18:10 +0000
Message-ID: <9a87289d-51f1-6e22-1998-9feba7d4dd29@amd.com>
Date:   Mon, 1 Aug 2022 16:47:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 RESEND] thunderbolt: Add DP out resource when DP tunnel
 is discovered.
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <1657215088-6185-1-git-send-email-Sanju.Mehta@amd.com>
 <Yuely4dKR6Xy5Mdk@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Yuely4dKR6Xy5Mdk@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::31) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4a3d5f-a89b-484f-845c-08da73af841c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1828:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnWCCeMiS1Od6R2NvwZsMjsr4qk/yhUNHkMns+5jYwX2+PNc4TH+nicF+FrPzDk0Zr8PVKdB+cOgQc2ifI+jd2vzAT7aGMeQDfDDQARBBLfIst1DAcH9434Qfot6No1i167EzGTUM9noK3pT4qZ1mjTb5ZfcepmYllVBwAKoJhNGZxpjsSZHXj2U26x5nTXAK1aTzYMunhGUaWJDVaYXGsCbYybIGfPCQ8BgBvhcWnS1VkW6hQA2qzsDJJ84g8J/wompPomAOOfq0qNnxid8NTbR3Xc1pddcxoptD7REqbqXv0fnKztTAYcVwQiUFdcn5ZRrO22jmJR8WEnGCT4zXJS/TenGMB6cjMdIIdYe34XvG5BvBmp3caBkX9DcjrgrFZZEIV014oH1mP9ylZO4C+xxS+UAD3Jzb2tt7j5RhgQ3JENFqFj7HvHBQuYpNl9mXwdqYFYALHGJQGUZqZdeKgxAY8BcFmwsDoDdNs2EJmwShh/H/uSfO+aSkgWF9WZe8AiEZ8xQA1ymOl18eH9JbXozyxxSIpf9qfMMNFuHMo5NKVuzFr17+V/DQmailegAWiuNKydAsHxT5afFvi70J11Ot91QkAZajaeQgbz+3QXq2tPvXq1hM8SidfCGCyPRBmm8L6oCyrTK8B6FNWahVt6J0oRcxY0+aNF6bDS0WEUkESURY9AelOoNLZG1dWlzE1g9y8W3vNFWLgibs+fd92Vehq2L8464CjB9XCgjpk2zCytFOvIJNIDW41KrU9Hu3vzzxbmEqJeG9JILXLK7opGtqBqymU4/lHkaIu3//NhAVPAo6YXpfFTR4kkI9RraY2cDOaQ7TyKQGT5jNet+nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(8676002)(36756003)(2906002)(478600001)(66476007)(31686004)(4326008)(66556008)(66946007)(110136005)(6636002)(316002)(6486002)(31696002)(2616005)(83380400001)(6512007)(38100700002)(6666004)(41300700001)(186003)(6506007)(53546011)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNNNlJVYkh6a0F5V1RtbjZTbFhxWXIzVjRmS1VEWEtkT1lpdHNSMWwycTFV?=
 =?utf-8?B?ZnYxaExKSGJ3R2plMEpSWFF2ZXBNcVFsOHR3NHByakhHeDBKZUtsVm5MNHBS?=
 =?utf-8?B?aS8yUnVXTkNiU1FleUM5Wk9CUEVmMzd2bUhMRllTQ2NXV3lid09UNThENWNI?=
 =?utf-8?B?clJFMVFiZ0I5NWlrTkFjN2pkLzErOHJHc3FMbGhHZUd3WDBISkJkN0tuUzhp?=
 =?utf-8?B?L3hRcDk1T2J6UHZ3YlJVdWdIckZIMHRsNm5LT2NuZW1NWFVYQXZxUTA1TG5I?=
 =?utf-8?B?M2ZaallEWFNlUWxzZXV6YTVPbjQ4Y3RhSEhwcll4N3l5MVhiQVJPVFFTaGt5?=
 =?utf-8?B?ai8xaUEvSHVaSTZ6N2p6WndzS3ZmallSclpibUFpR294UkoySWRVSHkwWHcy?=
 =?utf-8?B?Ry9iMGMrdlN6U2QzWmZOVHdRd0pXb2xzcGNRMS95MmRoZUFGaDVTN3Yvb3pG?=
 =?utf-8?B?elZUS2FjWi9zRDk2ZGpESWk0dW54b1RjVmZBWnpYUmxsbkh2UERTOG1RYmVO?=
 =?utf-8?B?WG9CNUNhdTZyUkRKTU5QZkR4QSsweUN6WEJTU3laL2NiMi9VTXJuTmVFODdX?=
 =?utf-8?B?ak1ab3d0dUxYQWk0dXV6eGY2amhYVGZ2S0lJOFNhL0xGN0xaODJ0Q3M4aDlN?=
 =?utf-8?B?cjg1WHNtaDN2OEtmREVCWTc3bWRaRlZkNmdFblBsVWphT1htOWdXOVc1QlMr?=
 =?utf-8?B?TkdxSDBKVUk2VStGVmV2SkxRcm1PeTJHeTd0Ukt1Vy93czJEb0s4VnkrQWxT?=
 =?utf-8?B?eDVsanRVaHl5MllNMkZiMUJuMVV6OFp3UC9qYmpITWg4b2tCZC8wYU44N3hT?=
 =?utf-8?B?cys2ZXB1elVDUG43UGh4TVBKNzJWVWVYQm8rdlp1bHFRcGgzTjNUangrdERT?=
 =?utf-8?B?bEVYSCtpSVJ4SXREaVJ1WlkyRTdkRVZYQzBjdk1oTkVoUWNBWGJkMDF2M1NH?=
 =?utf-8?B?c21iTFZTSVJDM0hNejlxRmVZK2FDNmxPZjloV1ZNNktpSU9iZGFFYnZ6SDBX?=
 =?utf-8?B?RE5icC9mbjdzSmh5NFlmc1V4emVkQURQUGJVdkIwTU5MTGxEQW5SaUJMdHFF?=
 =?utf-8?B?K1ZDZ3JNRzhtbUR6N0wwc2RkNGttTXBDdWRWK2RMcTZxNDVUL3JNY2tIdEEr?=
 =?utf-8?B?Mld2SUJmeEdlQ3RQZktiWGdOWEl0Mm5WcWVwN3gydFFReXRqZjNNNHV4Nncv?=
 =?utf-8?B?WGpMaStLem9NeXB6WUtHcFp5UE4vNTR2dUE1ckY2eGlJbWpYbU1NWlk5RnJ2?=
 =?utf-8?B?c0hBcFlKVVR1bGFlSVdJTnRPa1h2cUdxTlFRYXFrQU83WUo4UkJPTlh0dmVl?=
 =?utf-8?B?TldjZGx0U0g1WGhCV3VOU3lnZnl1eEw0Z1RrNXFWZDF1ZmNKTFozdGpGRlh5?=
 =?utf-8?B?NXZxR0kySm1QNEFkTXV3d2oyMWdGdUlPVmg4Z3JKSTN5c3VkU2ZNMXlQSnhU?=
 =?utf-8?B?U3owWTg0WndkbVUyS1ZXSXRaZkdweEdHNHlOWUlxaVdXR0hNbHd3RnRDTHNS?=
 =?utf-8?B?L1hUYk55eHBxWHVCWkNTNFlXWStRVXZFUDFGejM0ZTFOanlneDRBSFU2YXVN?=
 =?utf-8?B?M2JkTXZOR25JMStrS3F2OWVMK29EdzBrNS9yWUNOY3A2SEJRMFE2VFNuUE8v?=
 =?utf-8?B?S2xKOVJkU3kyRUVEOUw2NC9YY1ZVaEo0Uks1NWd2cHNmVnJKT1F6eXFvZ28z?=
 =?utf-8?B?OGNFbDlNNzM2SmJzaGxvd1J6Z0NkTmUzdlpScEY1UWlGTnNtelNxS01SNXN6?=
 =?utf-8?B?ZU1rL0pwSytlbkRpZStPWUM4ZWVHaHRDVU11SjYzMUxLSGtlb3Y2bzhsNm5h?=
 =?utf-8?B?dG9TemJYYkdDY09vajVQQmNsZEdoeTNFZHQybU5vTWdEQUVpQ1BLSkI2dng4?=
 =?utf-8?B?R1NsQ0lJY09hbGU4RXdKdjBmWnRFaGd2UG91cTYvWGphMys1Mzc0K1JVSXFh?=
 =?utf-8?B?cGk1M01ZVG1RQ0ZUeTdhcVNXZmtFaUs3TkhIbWZxbmxySEQ4UXBvVjBvcCtu?=
 =?utf-8?B?RzdabXVVSWowOUNkSnpxQUtBM1ZmQWlXZ1hIbFkyS043Zm1DQlo0Z1VvdEF5?=
 =?utf-8?B?MGFUY2ZIc1BJSlBPbmpZMGlDbHRFTFduby9WazVLbG9sOWhnVFdQVGhuV2xM?=
 =?utf-8?B?QXZoaENEcHZXOFNhcEQ4azh2OFV6UDJhZkFaall2Q3h4K2MzNHZNNHBvbEpH?=
 =?utf-8?Q?1UMsGIiKXhQc8JW5Sjjf17CJ3nAn54P9Iavoj4XwUc6s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4a3d5f-a89b-484f-845c-08da73af841c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 11:18:10.2728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa3PXzPmCgPPKoX5AoYXotz4+NMwosyo1cNpeLYHyBsGwIaXF7FtD93dT27lCPLwC+TOZHU3KUwcnpUeAEugHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1828
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/1/2022 3:37 PM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Jul 07, 2022 at 12:31:28PM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> If the boot firmware implements a connection manager of its
>> own it may create a DP tunnel and will be handed off to Linux
>> CM, but the DP out resource is not saved in the dp_resource
>> list.
>>
>> This patch adds tunnelled DP out port to the dp_resource list
>> once the DP tunnel is discovered.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>
>> ---
>> v2: Re-ordering the function declaration as per Greg's comment.
>>
>> ---
>>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>>  drivers/thunderbolt/tb.h     |  1 +
>>  drivers/thunderbolt/tunnel.c |  2 ++
>>  3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index 9a3214f..dcd0c3e 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>>  	tb_tunnel_dp(tb);
>>  }
>>  
>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
> 
> Please call this tb_discover_dp_resources() make it static and call it
> right after tb_discover_tunnels() in tb_start() or in
> tb_discover_tunnels().
> 
Thanks Mika. Sure, I'll address this & will send you the v3.


> Thanks!
