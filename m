Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B404D0142
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243210AbiCGOcA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbiCGOb7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:31:59 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5FF79384
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeeMiAOOIXgO7Pzl6l6VM50xnZ020Cdnls9gEiEn17l0iWvO9JfvWtNJXFs6m6cQko+e0KTW65NoBQgqZ7X97Hxtys8EU9qppPfDugej/6UHkOwNahh/lte99lYyR7M9ajrPNH2/Nag951+0V3aetNaceFLaP2d83pZvy858J//xBMS9nZPZyppA2I8XV/4rSDvPLZCEsqhsG8Cj5cf4PEY+iiRnuP2UMl9PPwqYkWD//eAzn3v2l7GZ6iZQERMbOUk3w1tiulQRLDszbsv4fGfLuw60KzSuK+Y89Py8xMuyNPyhygOH0JxbdaxEKLd2kIyOQlVy6Pn6cTYGSm2t8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9daUcwe+NYejQpgUwkCkTjH3VPLoCD3vnitbDrVFpBY=;
 b=iJpn5W7YZegCVobu+kVWQA744I9fegqiD8ZDKOWUbt5Flwog9eLxofXv3paBaop7Gj36k3QFJ9tmTiA8agaySyxPK1PzpWeyMlEl54jcd55QP2HBZr4CV0DQLygCoupkWVkTcW3Le91okePORtpP6QyTm5WSQ7+JQn0+I31hoeB+WCsA3oOU2d1eTy+WZUE8K+Sy5gVfiuPG9nfEOxOMLXvIqDqrNGXKPz6C82iKtybPVqhMD0nOc9b2okbuJSZ8WyABRK7qJNZvk53YvfJesp+ezO3FlcNKkbzzgrmKYcivTtBJIj5ao1KdoO75KWfMsvhgB+RXjhtoA/1+Ahrm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9daUcwe+NYejQpgUwkCkTjH3VPLoCD3vnitbDrVFpBY=;
 b=Wgbo3hX7knvs4bFCQTOEfuuFt7a3snp+/cQmYISklnogXsJOXLz33YHFzd9F8cCcKVForg7o+u6tcrRavTJvHOciC0vR8Wt+LZr5ocBtoNG98CiCfxsSCFIjUn5ZlvdwCNwXlVSPJj2n0hr58Pydl3qT4SIssdVXbgd1KEbXLUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) by
 DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Mon, 7 Mar 2022 14:31:02 +0000
Received: from DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::6c1a:2b5b:535d:cbfb]) by DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::6c1a:2b5b:535d:cbfb%9]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:31:02 +0000
Message-ID: <ade3f693-118b-369d-8dcb-8cc9c78fa39c@amd.com>
Date:   Mon, 7 Mar 2022 20:00:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: handle runtime pm for tunnelled pci root
 port
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <1646658319-59532-1-git-send-email-Sanju.Mehta@amd.com>
 <YiYKBe7ogL5uacWt@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YiYKBe7ogL5uacWt@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::26)
 To DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e173e5-8b71-4734-ca82-08da00471ac7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5818:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB58188619E6C03AEE51444D67E5089@DM4PR12MB5818.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5kb+8TM8mA2lTXV3Quv8H38IVHCPq3ZRob0vRjSJ87CEj4Gdfbe7UzvMW1RVfxIeMPnac/shHCZyC5ZSrV0Dgtwmaz4uEBcrj33Nv8wuwzwmCqs1GO+O3dLJ5DBY3QqjlTsbL0ARPxMI97IPHLT46Iap0qhXahwpTNjZINdk3n+YfyiMWPluD4Uo3JPB63tHe5uT6FvUQrmUeU9IlpqivehH4OlcaL21oUWwFP+BOiZ+BYrhUthE81mPNFXNZTUuu1NYH26EWp0m1+hY316nMn6ATAhqQ2OiWxK5ec4JXtf1xElqZJJVxBC61n2NujSqhJyxLqWvaFylpYPT4Of1kk3FvLOHtytutUq5yk2uoJipXjhsCEjNojCgr9wZ9t+mMoM9al0sK425IOwImThWw01HRcTVc7PAZ1wKszoyR/L04DrauV0J9G3tTuc0BWxg5C1dMKnEWPTcR0wrfR5VMl6ZCBi97LZZTpR2CFi4cwfbV3KEvR9u8bEOAvhELinvsFjhlJ/xX/6AZePY/Y4QspWZqSkQg6y2CNUqt/y8eHaGStkFSBDHIvLMNc6PBiIaZ1pnkjrM9jHhdfUtrJ3RoTcypDJPQ47fTCYgiotIRlcDCgmNR+OTqgjCb2halAwbvDo+6TtUzavTExZ/TEHzN97AzfFvfW5ywmd87+6UFJxnk3E04aDwpFtGp1foBDbly92/lx9ErPBDedY26QEayPDjrba0Cu+hLBwquzl3qqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1242.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(31686004)(36756003)(6506007)(53546011)(2906002)(31696002)(8936002)(66946007)(5660300002)(2616005)(26005)(4744005)(186003)(6636002)(6486002)(508600001)(38100700002)(4326008)(6666004)(66556008)(66476007)(8676002)(110136005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJYcmNDaS85RzhpbU8rcHRGVitlQ1ZyeGZnY2JCRkJQNkRHRkM4c3ptT0wx?=
 =?utf-8?B?R0o4ZTZMZlBWUlFMQ3JSTzdncXZ3d2owYVpYckFQYWc5ajhSc2dQcktYWXBh?=
 =?utf-8?B?TTA5MjVTc2NpMCsvUFNxY3ViclFnSU4ya2ZIcUI3R3ZUbm1NZDh0cFZQdGd4?=
 =?utf-8?B?S09NaHV0dGZwUTgyQU4zYm4vUWpLN3k4ckxYR1NXd1hWcXhmYVN4c0cyYS9X?=
 =?utf-8?B?elVlRlVuNk9yQTVJT20veEdtR2tGdmN3MWxQc0lQM1RGeUptdjJ3QzFFSUdP?=
 =?utf-8?B?YzJNazNFWldFR1c0RUxyelkvNXQxczEvMUsvWXJvSGxtRTJ5dkJxU05ySUNo?=
 =?utf-8?B?QVRqTkg4MUpMSFBFWk9NMlRwRzdGUU1aTzVxTTRmbXBqM0hoVk56c3lsMGFG?=
 =?utf-8?B?aDNCMmpGSmYvU2xtV0lSanZDK1FhSFI0WEYwdkVIMTZoQnNaTmJRWktra1cy?=
 =?utf-8?B?eTIrTHNWOEMyWkt3OHVPTVZFYnRJTTQyN2JWZ0M5a1VPaC9oUVVZS3gxSXFv?=
 =?utf-8?B?K0thbG0yZnJNRUE5dFRrRDdtNVhvWSt5N1ZERDV0VDk1K1I0ZHhSS1NyNkYr?=
 =?utf-8?B?N3lERkJ4dDFiRFhUOG9MNlhHM3hKakF5WlpnM29Vem4zUkxWWjJuS1JBTnE1?=
 =?utf-8?B?L0d6MEY4QXEzeVdhNlQxMWcwcXhHejVrZUpJUVE5T2xYY296M3BadVAwekJ3?=
 =?utf-8?B?TWZvSnJtQzlWdVh2STVETjRrN01KZWVRd0s1TFBRTlNDWGFjMHRsTmpvWEFm?=
 =?utf-8?B?M3FsU0F1bStiOFJHMnE1WmpVMnoza1ExajRzMnVpdTdkd3RPMk9nd3VEeGI2?=
 =?utf-8?B?R3FjbWZOL1hSRWtVUVBwQkZ4OUIxbjVoS09OT3JoeWh6ajIrU2oyZm9RcUE1?=
 =?utf-8?B?eERtWVRtcnh6cnJSUmFWeW5DRk5GaHE5cDkrZWlWeFpGM3oyUXUzYUF5aU1j?=
 =?utf-8?B?M05UbERsYXF0V1M3STk3Rkx6ZGxIU09vUXJoWEFNM1RMU0xQU016MENsZ3J1?=
 =?utf-8?B?Z3VpUVlMdVZxbENwOWw0Ym9jTFNvVkFJZ3hNcUd0RnhRdTJoaWVwV3daQjJW?=
 =?utf-8?B?amFtSW1HYzV2TUtFekNsT0VERm1vei83ZDdPbk9qd0dwTkhDY3c4dklqMHhS?=
 =?utf-8?B?Wi9lU0NGR2g2cVJzWGpxVkpSUG5NaVpWUDZpODBCTVE3YXhzenZzcVRxZ0dL?=
 =?utf-8?B?bzhmbHZXUXF5aVlpeWpjSzNSc3pFQnd6ZTloRXlORG50c2w3OXhqMWlyT09i?=
 =?utf-8?B?YXJJZVgzOTFrV2dlUEpMNUFlZVlkOEsybG9mM1NtVTNka3RoV25oanRtbVNY?=
 =?utf-8?B?NzFodGo1WjZvNW5LQkpDeFRyUXdzSXUxT3d0TjdqUWRmbDhBWlVCR3BjQkZJ?=
 =?utf-8?B?ZER1endKckJhb01PTi9GTEcxRGtydTV0aE5tb0dyYVFOWTMxR3FkV2xrY0oy?=
 =?utf-8?B?eVQxdEluS3VSVXR4MmNZWWpWT3EyQTkyRjVaYmNWMEZ3eStlTDhLa29COEFp?=
 =?utf-8?B?L21rMThXWVNkQnpDVXYwN3F1UzAvSHArZTJPTmNPTVhMVmZjUEozQUo4TTY5?=
 =?utf-8?B?UjNHK3hZVDJmajNIVDZpaUd1UVJlWnZVK25oR2F3RWlrL3NHaGdMa1FSZkti?=
 =?utf-8?B?bjE0ejJrbys1TlZRKzBSNUFMc2FNSWNORkxpanhyNVErTmxCeHczc0hpY0sy?=
 =?utf-8?B?dGpURzFWZzdyelJmT3VPcVFwL0JJdUVNaUZkYkFBTTgvdEJDaE5FZFYyWGNH?=
 =?utf-8?B?Mk83TjlVL0JDdUVSZXpLd09TUlpSYVE0NGgzYlFiRllRTHVJci9WRGQ1TE52?=
 =?utf-8?B?R2toSVNuTDNOZ2xFdURNSXRVTHYrdDJoYnRISHh3QjF2blppV2Fob1d0M2FU?=
 =?utf-8?B?UzV5WkxOZHc3aSt2c0h3ZnpEYnEybFhUcFdIYkZrQ2l5UjEwUmdUOVhpVVls?=
 =?utf-8?B?K01JME9JUUdZM2xaalhUeEk5SHZFK2xFS0JyeTF5Q3k2dlUrOWErSmJYUXp3?=
 =?utf-8?B?N0Y3NTQwU1J6Y3ZVbnliRFVlZjNsMXJlcmlLb1NiRFpUSlRjVERuTzdZT1hG?=
 =?utf-8?B?TnAwZE5QMmYyMDNnbHJsN21BY2lxbk4xMWNvL0xlM1NIbDVnanJjVnBuZ0dR?=
 =?utf-8?B?SzZIZGFuRHV2SFdlcGMzU3pGMEJoWkJQbHo2MFlmNXMyZlhub3hlRktCeVo5?=
 =?utf-8?Q?ZffYGPMaMjFklOY028Wt/0o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e173e5-8b71-4734-ca82-08da00471ac7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1242.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:31:02.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asXa0aqv0znGj+a8ZoatOyxX7jJu1NpChnZmGItflsvCzinguI+wTm5ZwVX6z9Y7oai7GeTSw6jaWZDPkMG22Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 3/7/2022 7:05 PM, Mika Westerberg wrote:
> Hi Sanjay,
> 
> On Mon, Mar 07, 2022 at 07:05:19AM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> Carry out runtime-resume of PCI tunnelled root port to handle
>> hotplug interrupts synchronously.
> 
> What problem does this solve?
> 
> Typically the root ports should be able to wake from D3 when the PCIe
> tunnel gets established. Is it not the case here?

Yes Mika, its not waking from D3 in this case on our hardware.

Hence I have kept a check to execute this code only if root port still
in D3 after PCIe tunnel is setup.

Do you think should this patch go as a quirk?


