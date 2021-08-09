Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F23E4599
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 14:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhHIM24 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 08:28:56 -0400
Received: from mail-dm6nam11on2081.outbound.protection.outlook.com ([40.107.223.81]:56225
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235133AbhHIM2y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 08:28:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Et0EZltcBd6M44op59nhfT2NzgSTQN6RoaxLFdWsHoXDXqQOICH3yQAiPGhTi9MkcqoZtR4GPr4VLlrpkyGYbPQly/HFRXDiuuafqSLerSMBtMLwY0n6yeg73AlnYTTexN0KjHDSWaNrVFbxM2ns3vzD3AqqxT54+P+jDd9pq1x8reylVlM+h/3ZYDg/MnZM7jizUHFc1R3bMGQpgZ5VbZayp+DmTjZPnFUq/gj2sgwy8cdnlGhW2OCkMfWCgNIOpEYxiN/7zvXZgo7fOL8oBgDcvBKdoe8otDY//2dhQ793dbLsnq4RZ24tvhrm5HII86xFARgwlZqs+SjHdSYDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P+n/uK7Dys84rBOpPd5C/9fp9Ug0y/DOmN7eJoyB1U=;
 b=n3zV9/nFCVd60fCf1j6uWO42Rby4Zs1bh/Xy9UhuPofV9h71ilEPO1CsUNDpFChLSgsuBhEikvmY3V7ONRj0PMjDzCfexP0p2yVet5MLGNIPHlDPPf1Mpg+anuECi8woLMTSTVr8zKmJgs0ByfAxumW4HccBZp8N/MtjeCMRTEeI+JyA2GQx0DbWvbOpW/sdKKbZ9EspE2LD9Fwgtb9CUo8P9Vy3aLM+hFTepWfzTPUnioGRXVCzsPencTd/FHYGZoCx0qjuxPZ5xU0IHrhG3HH0T2PZ1U16FkWWkeIwJsBnH0iSw5E6udeTwpkheLAzDhWllhFxiYgg5VH9SsSkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P+n/uK7Dys84rBOpPd5C/9fp9Ug0y/DOmN7eJoyB1U=;
 b=o6Wvi6HJOPZIZQ+75Wrm7h4gFteDpUSpPphe8LTXXhzFvmwmuPaTpJ6976gFl/n7WPQsNBUs6cH7hRe/8vXDT1703U+weeXWPs+GRTi1PMLjTDikrT3rV4sIyVQVnrKpJmW/M5IAubAymMzUkwm7q0sfhRSF9LBFMl//FGKAuZU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13)
 by DM4PR12MB5232.namprd12.prod.outlook.com (2603:10b6:5:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Mon, 9 Aug
 2021 12:28:31 +0000
Received: from DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984]) by DM4PR12MB5103.namprd12.prod.outlook.com
 ([fe80::d1b7:9fe6:834d:5984%3]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 12:28:31 +0000
Subject: Re: [PATCH v3 0/4] Added some bug fixes for USB4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com,
        linux-usb@vger.kernel.org
References: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
 <YREaPR3xyxOkm3iL@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <0a2a4b97-1c9e-b570-f848-9fafce348aeb@amd.com>
Date:   Mon, 9 Aug 2021 17:58:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YREaPR3xyxOkm3iL@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To DM4PR12MB5103.namprd12.prod.outlook.com
 (2603:10b6:5:392::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2401:4900:1702:8db1:1051:4e6f:6e82:da] (2401:4900:1702:8db1:1051:4e6f:6e82:da) by BM1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 12:28:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d95ab7b-8a54-4cd8-ca8f-08d95b3132b2
X-MS-TrafficTypeDiagnostic: DM4PR12MB5232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB52329198C742F1A4E2E8B7F6E5F69@DM4PR12MB5232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40dn8JZAY/UbF9099ZKZkLHk7C99roZOe9ZS91gKeITvZ+wBbhNlJzimuYhA+BTggE5glsSo9MuV0YwGbWl3UKE0N4vawmB7xQCF2Tf315x3LYznqPuvIrc0MkkwKDlxOoVGHSZPwhRj2qCD18J293LhKkLN2Ztu7U0sB8Rw/3jYTWRWo34qAyXuEi/m+ijGxsQUizoeYX83ae63TtDNCR8mbM6gnT4/imVm73dZ5kL0icReTPdH9i0fD1OxLbi9wvlbQOY4sCt2LYkLD2/cYIu4TaHvwSmQsMGLpeo+s33QYSawRFYx7lpbbz3jMxYVUdw8u/FjJ9omE8ziXWwUzCZPDcWmxXbN8e9rQD0Q84NcsQ4jbJUyeICk3//oALX/szCDqAGFkv7guI6AVmaF0iKDyULsD6CBU0Ve/6Y1ltLzH5HynExFJnhsoSxEmUrSkt+g2AV8mQL9Tr1ySz7DlwEUP/GhmZ13+PqfQcSyXSWkQzv3pI1O/3g2wW5AxzStyTgdWAwkE8nD7d4WOZGVnabRAUgGNyan8zaUHuK6LXY8aGetDw1nYj37CyovwLQ6ZP01Mcz3uecpLiNjQZh8pzN2umAxu2ujQEd6FL8gvGCIm2qGY87nzx0IhHefuBVgZa39/S76urLOe1Z8yxWT8PrlgZ+EvCp+i00LjK2Bd3sTVAQblMhDM9qdt2uEx3UYDRP7izV9ALvRbuWifntLlxhGUoFZSZM+b/1B/11cipBKmF7HJVjcZcvI7vjO5tnj/C6IodhQBPTqU09+oR6llgidGUbui4W6u1aEqBBgHca3RONj+73GedjDJeKWkgtk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5103.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6636002)(66476007)(66946007)(36756003)(508600001)(8676002)(316002)(8936002)(4326008)(5660300002)(2616005)(66556008)(6666004)(2906002)(110136005)(38100700002)(186003)(31696002)(6486002)(31686004)(53546011)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHM2WlBtTFNsRU9nL0RsdmMrQWk5MHZFenZiZlZaSDB4V1A0N1VvYjlBajJt?=
 =?utf-8?B?SjhjQUZjaHB2WGtpNkx0VWM3b3Y0ZGEvY2V3eTVObGJuMDF5WkR3emZtd0I3?=
 =?utf-8?B?RVRPZkhMVWxuMmhRYVdRQkFHRVBUTWprVDdFZm1CVVhEVlc1WGVkUWdnL2hl?=
 =?utf-8?B?TmtCMUZXeTBBR3BuNkh6U0MxWU1iZWoxY0RBUlZVMGlhQkxaRXF0bjE0R2J5?=
 =?utf-8?B?NFVhOUdUclJtUXg0VWUyM2lkbHVqcjc1SHZyaUl3VTRYQ2gzbnJRK0dxeTBU?=
 =?utf-8?B?c01qbWJYRVJJb2hYdlRWbTNMa2JUbm83VXlFS3h2MHhDc3pMbnpSWUtTQTBJ?=
 =?utf-8?B?REM3ZlhUU3U5RGtuZFZmSk9IVC90MkFIaTRvNXlZN21OU3dtMHUyUGZQZmlm?=
 =?utf-8?B?NmJxWWRkN0V5WTBUMHlXMU80QWsxanoyNzRSL0lXM2UyUWx3cElFVUYybmhJ?=
 =?utf-8?B?NnMwYkh2ZUZvN0RiS1ZTV0RwU0ZDTEtkcisya3hGc0laR0VueXdUN2JaOGxk?=
 =?utf-8?B?ek1teFJzQUEycmFhY0lOL0t5cFZFVGRVU3pTcXBNdFVjZFNQZld1RkFhS29u?=
 =?utf-8?B?NkFSbC9CU3hGZjZMOFBzY2psbVQrYi9qblEyYlJndW5iZGFkU3p5aDlwOC80?=
 =?utf-8?B?dlNDM09POVFEQXNDZlNFVlVUa3hhV1lHOVRQUmJHNm96Rkxuamc4c3h4MjNQ?=
 =?utf-8?B?VDEvZzdvbVdJSXN1QlZnMXgxR2svaVZwTU52YTNVQTN2TU56b2pBS1BCYVZ5?=
 =?utf-8?B?YklYYlVKYTBodFFub2N3SlZjUHR4cjgzUHdicHNRdXJIVFhVdERRZjJUT0N0?=
 =?utf-8?B?VWhScGN4Z0F4TXlUandCek4xVGZ3OTcrWDF1QlZEdTZIbHQzMjJLTHBSMDYr?=
 =?utf-8?B?WkpnWk8yL3dJeUtmdmxaT3hVN1lWZFdSalRVRmVRT1ZNZVNGZk9iQzNxM3Fk?=
 =?utf-8?B?REtkeDMrMXFGZ2RrYlI3R3hNNGxLaDZjcGJYV2Z6dThyQmRRWXdDaGFBYXF1?=
 =?utf-8?B?RjYzdzBTWFpXQ1lUK0c2bUluZDlkUTFDaW9tbklWUDJ1K3gybzE5dW9VemxW?=
 =?utf-8?B?TEN3UTMzNGR6M21iVnI0dkVObUNhYVpXMHNXaGQ0aGdHZmJzemY0N2dTZ2tE?=
 =?utf-8?B?NnhVZWpSVVpZWHRmZkQ1MGNkRE82c282VVpnVTJEMzBNTTNQMGJrLzIzNVh2?=
 =?utf-8?B?eUdNK05VSHdmOEl3WW9Gek45UlpyZk0rTC83Ykk5ZkVkbStWVlVQVkp2Q3pG?=
 =?utf-8?B?aElvV200RzYxZUN3SlprUzBLUHc0RzgybjdqczVWaW1wNXBwUjI1TVdVekVE?=
 =?utf-8?B?K0NiRjZWdk9GempqdGhibENYUVZnb1FUUjNsbWNmbmNhZVkwTGh6UnA4eWxM?=
 =?utf-8?B?aFp6YlNCZDQxUGpOeCs0N1JJV1ZPbkgrRTM1Si8ra29XQUdhdkhzY3JHZkI3?=
 =?utf-8?B?a3JrV0tLSzgyblNrdW5IZmtHTktaZ25XRzFJdFZxK1NidTJVVldObHdlenF0?=
 =?utf-8?B?MlFCRXlKL0N4TC82ZEZjS01sSnY5RDVIY0l0NWFwRjRPMitOOTgxT3FFV1dX?=
 =?utf-8?B?TVh1YTJnQlh3SjJTazNzWG96UFBHOXFWTEFaNXJ1TUJoN1VnUUVtK0k0b1d0?=
 =?utf-8?B?V1lJcFhScmdJMFk4TktrSEFiaGZRenRZK050MHl3TElteHluOVc1OVdJS0Vi?=
 =?utf-8?B?M1lYTkpocFpDWlZKWU9TcmsvbkM2bXc0L1NMclg0UVp5M3ZiSVo5dFVGMVI3?=
 =?utf-8?B?eERRbHdSWlZEdUE3K25vdzRMSkxpaUNSTEhnKzVxV1hNNTNMWDc1QllsMDd2?=
 =?utf-8?B?dTZjcVYxWVFNUkN5T2xaTWpBVVZISmh4NHRQMVZTMGlRQlY2YmxEVm42OWky?=
 =?utf-8?Q?r16FYhuGT9VJR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d95ab7b-8a54-4cd8-ca8f-08d95b3132b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5103.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 12:28:31.7573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8kpV5TqoqiLnusTDvSh+h1eQpw8mmh/H+JyKABUQMqZygGZqlebA78tqwMdrSYtgzhGHc47vXHuaP89eEGyzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5232
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/9/2021 5:36 PM, Mika Westerberg wrote:
> [CAUTION: External Email]
> 
> Hi,
> 
> On Fri, Aug 06, 2021 at 11:59:04AM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> This series adds some general USB4 bug fixes as per USB4 Spec.
>>
>> v2:
>>       - Added quirk to handle any vendor specific quirks.
>> v1:
>>       - removed PCI-IDs as AMD USB4 controller exposes USB4 class ID.
>>       - removed clearing of interrupt using interrupt status clear register.
>>       - skip port Adapter(0) initialisation for both host router & device router.
>>
>> Sanjay R Mehta (4):
>>   thunderbolt: Add quirk to support vendor specific implementation
>>   thunderbolt: Handle ring interrupt by reading intr status
>>   thunderbolt: Skip port init for control adapter(0)
>>   thunderbolt: Fix port linking by checking all adapters
> 
> I did some minor tweaks and removed the "Fixes" lines since these are
> actually not fixes per se more like improvements :) Then applied all to
> thunderbolt.git/next. Please check that they still work on AMD hardware
> and make sense in general.
> 

Thanks a lot Mika :). This should work for AMD.

> Thanks!
> 
