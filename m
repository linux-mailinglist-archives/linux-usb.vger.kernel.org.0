Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F58274FEB5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 07:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjGLFbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 01:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjGLFby (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 01:31:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EE119B
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 22:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwgtZx/Gn+yBelCxXO3bfm8ouT+5Ze15BUj2Dd40gFEA6sazK5TsadGJKb5qug8YBrF5o2gkB5K+g0lKx/SRYNAVtbAbgP9nMfjLlT1tMLkJpUkadZ+nN6leghjrdvHt+n0o2mf4+j27R3NrKrmIhwoAu8cIJlG87lcfY5YiuAI4Dt3FGnotF9D1M8h9QuAlSXB6CUB/ngsvp0JMxeaw3KCDedKfV1UMvulhnBF3hz219o5fZa+GAmj11ZHEe9nPhtBo+60mX8GtadEVSErjlq61bPNvD0lc78m+Syy75vCdKF0Za+YdV6aU3M9Bi4uvQZctSG3Hk1EZrE1PxP1Upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clU1er4+uIpKjccjliO7K60n8RkCyITIHnSp515UlO0=;
 b=UhEev4BSDl4xJE+O4kIlN5YyhqOjCXvaXqcPjIHTqUzU1F2rkyoX/eoHc6XUdUYaKd0AhGkPrSoc0kGkKZXkKwFL4EF/dwx+O2jNLZCuf43AQjCjFp4g90EkLiDfi4x8NmJE1igpj1cMAiTbXbOMVwG/qXe6QLZzDvsH/0ioP1A3YNT0hZ5iljlPJHcXwFrpmbuDh1/CEQ+v7l0AhUFMkZWfo44Jc60ibzPKpJF5pJ+BujUWO67a91HKl78Bf+6FRqMXsitzU0fNA8qlUqV+N0CUvDyophWDYwBsK60zi2BL6mJGhNyvZfTNb6yLm2NBsShxLuzH4+k/jqOltny0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clU1er4+uIpKjccjliO7K60n8RkCyITIHnSp515UlO0=;
 b=kiavY3RCwG9PTyEwfd/U7+p0H6jhB8F5/5E+ljTEj8KrvRBoHJa+7MgDnt3FsNHPu0KuRFYZou9haT7Dn/qMHdp8a6j0JTftov9ysFLNWBHzjfOzRaF99xf/v82VMiD51n/ZAxzYRd/e36l1+lPPasOvp/dXcQIJbLaZIi3Ulsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 DM4PR12MB5055.namprd12.prod.outlook.com (2603:10b6:5:39a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Wed, 12 Jul 2023 05:31:50 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::61f9:705f:96bb:2305%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 05:31:49 +0000
Message-ID: <bf08a057-d8e0-35cd-aaae-a82fd4ce4926@amd.com>
Date:   Wed, 12 Jul 2023 11:01:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Fix Thunderbolt 3 display flickering issue
 on 2nd hot plug onwards
Content-Language: en-US
To:     Greg KH <greg@kroah.com>, Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1689060470-88947-1-git-send-email-Sanju.Mehta@amd.com>
 <2023071115-makeshift-babbling-530a@gregkh>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <2023071115-makeshift-babbling-530a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|DM4PR12MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d3d5d8-6b62-427c-6761-08db82994a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx/DO1ubXrOhDpaUyu7lkCQJfrOnVH5/0Jehl5SzKnZWjdb1dmRFYrDa/Bv2b/yDLukcEwLAQpeWOp4AfOlAZY8O2cw3FreeIjo4NJAgcLIAqm3b1pHdPqtnXYn4fq/5iWsrS/JQeUFg6Mosjz0F59hGNtYFMMB4zsdefHMcgm+RZ6KgLNXL1Kf8y8i65/bDcpWnqQk6KexQuxQQ66CW8lTw76jJI0oovUlLwloZKSlqyvzQ+z24MKb8iqXSPQtIXsU4JnU2lBSfOHHHibnKuq9mFktHf2R1wbl8kdZAeQLJuDr0EIa9/ZeyVKPB3G8MwFmOccQAwl3GMCdJjsXq4IRfWmlDEZXssH7aWYM91ornVA8/Cx9HQV9UQWgGWExbNl4KfMRRQsSsNqB566i16rwb5V7qXbZbQT9q+GEouUTcQJz8OFxCyHi23dRyQ4vETZQAGnj15zuofhVhxmWRtgNvqG5Kekg47vG4W/dIU/OYwYWDNuwj4N669lucwB1Zo8cPSdv1k0YFx6X5W/pVjMs0sc1GhFdrKOeAaUqpDIA4MdFt7ulzY4FuqFuv4vjlboGRx5Hu0moVcAP/jJfbD0t4jMSlqcKp8FI5w3soZwlp7SkNDmzrgEDPDFcQJ8TKKETsMAz5HKMedjKL0sE+RQHAO+PRha3eehre3J7DLD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(83380400001)(41300700001)(2616005)(66574015)(8936002)(4326008)(66556008)(8676002)(316002)(66476007)(6506007)(53546011)(38100700002)(5660300002)(26005)(6512007)(478600001)(6636002)(6486002)(6666004)(31696002)(66946007)(186003)(36756003)(2906002)(110136005)(31686004)(87944012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFlNTU1CdTF1bjBqS2MrREhVZGpxb1RZVm1PM2V1Z285OTJvbEZ1SUp1U2pa?=
 =?utf-8?B?d0FlNDQ1MGRaSmdiV3k5d1ZQMEMwOGFSWmJuR2Y3RStqdms2NWwya2hkdHZl?=
 =?utf-8?B?cU9HTmxEdEFRNmtJaW94MndjTlR1YXdiU3VhUUVXOW9JbjVqWFQ2VVRiRElD?=
 =?utf-8?B?Zko4NEpSSmVuOVk3OXFqSlJNbmh4WVhuWTlBVW5ObnhJRUNhcURqREtwMjQ1?=
 =?utf-8?B?elFHakxUR1RydzQ2QmY0UjQyQWtkWjJ4ZDE3bzlxcTM0aVZjNTRabHZzbzlE?=
 =?utf-8?B?bEU2Y0F1ZDFJVUZpVHhkMS9OSE8vRTE1bkJWUnRQUVdGNG5BQjNYVnpIQy9r?=
 =?utf-8?B?ZS9WT0s1VVlhQmk1L3lINkdUNGJyVC9FNzhpRFlHdlVBUUo1V012aHJoaVFM?=
 =?utf-8?B?elpBSHFYSEpqOWpXMlU4a0FWOUM5K2M4V08vbXBEWFVkbGl0Nlg5VUdmQWla?=
 =?utf-8?B?cVB5VHI0Y0NxS0JROUY5Uzd6eXVzWWloUENNVnh2K2x3Nit2ejVhUlUvZjNx?=
 =?utf-8?B?enJPZ0Z3WCtTZCtocUMzVFFkQ2ErZFRtRW8yVWpacHdNR0d0c3hjK2Q4T0ZT?=
 =?utf-8?B?Z3Z4QmtxRUdZdzZ2S3RlZUtQRTFNUlhzR1NPV0ZoRzNhZ2VjVzQ5L2JtMU8r?=
 =?utf-8?B?UHR5VDJsbkUyU2Q1RWh4QUpuRHlUU2NZTmQ2akY5V1FXWnlUTEZrTWhxM000?=
 =?utf-8?B?cVJjTDk4bWVCMmxLY21zY1d5S3VTdjZSNU95Y0VRWkhQVFdzRUI4TjZaUWpp?=
 =?utf-8?B?TmpxbTlhUlVoeGpGNnVYaUNHQnViS3BuRHRvekdFRXJUaWZIZlNDQ1c0dTBm?=
 =?utf-8?B?VkxWeTl4dlRodHR5MFdVakJXemhZVlN5MXEwcTdka3hwM2N5OUQ2NzZnSUtC?=
 =?utf-8?B?QmJEeS92b0xaT2lnKzJvbXREWWpKVjMydHExbml1VmQ4OHh4Qm1yN0pPdWx5?=
 =?utf-8?B?NXNOK1hFaXNrRk9Md1dPcFpDamlFeXRQN3lDSjlnRHUzNlVPUSs5cEVmOW1p?=
 =?utf-8?B?dC8yMHpBc0ovbTNPSEExZEFoTUpQYU9QMEFtTUN5Z1A1alovMFU4YzlTbms5?=
 =?utf-8?B?RW9pV3k3ZVk5UzJocGFobUVQT0NBOUpXMHZnYlltMitnbkhpcmllYmlvay9J?=
 =?utf-8?B?aVJIVnlsZi9zUXN0QlorZnhOTTk2RVRreHBwOTZScG9hT2RUdlV4SENJZGRI?=
 =?utf-8?B?WlIzbmtSS0tVTGhtUmpTOG45MzBOZUc4OWRDLzA0VEI4b0wzd1lEN2tUOE9S?=
 =?utf-8?B?anRnRlhYUkhwdnFya2c4Rm9iVnJISlNsUWVPMlJjUWJzT1VyU25xNHc3Zk9Z?=
 =?utf-8?B?WkhFUlcxUnJyQ0kxK0FDREVpM0ZxVkpMelJTM2VvemtQcXFPeFZsWVZseTFO?=
 =?utf-8?B?UE1zYkM5bWJCZWpIQkNVTEd3ZHR2bDNCdG9QRko0QUtILytJOVlsSXdGdTNW?=
 =?utf-8?B?WXovWkFIMGNHRDdQR0EyY1RjZ0tnWldqRDN6eHpDSGdhUmVLYmt0WXF6MWNz?=
 =?utf-8?B?d0RoakdzWGtpUS9BUXV6ZUdSd0JLYXFEcHcyTUloU1lyM25IZVZJM2lyejhh?=
 =?utf-8?B?SG1DL3JORHFDYnFzRmR6V0RTT3VrZEg3Tmh1NnNjNHptMWpVN3ZDaXZIajM3?=
 =?utf-8?B?emRBWVAzVElkU1h5UXFZYk9FK2R2S0Y3Mmo0cGxlK0V6ZmxtSU5tS3BNeDlM?=
 =?utf-8?B?Uk9GdjdFYjlqeTU5ZkVnQW9pRlNpdkpvMjhORzdiSjE3VTIzdW8yMmZubysx?=
 =?utf-8?B?Mmx1M2xXY2lKL28zOXNvU3Y0MEFmOGc2ZGNtbG4vVGxKRlNiVXpkQ25WdGhF?=
 =?utf-8?B?NzNSL3lPRS9RWk1vUHBUQ2R5NUtQRXRSdS9UVFd0cUZLRGJyUGludWw1cDFa?=
 =?utf-8?B?VVh6cDFadlZPdHBqUC92Zm4rLzZyYlgyR1d2ZlRDY0ZZMHBmOU1MRm5RNDF6?=
 =?utf-8?B?cGVRdmxjTldyRVlibS9FNXgxd1R1dVRyVVM5SWplTmVuTE5XNkNtWklESTV5?=
 =?utf-8?B?K3puYVJwSVpPZ2pwTWpFcnFOamJENXY2dEt1SWlJU0hKUGE5c0ZEMWpKV2h0?=
 =?utf-8?B?cUZ4cWFsS1ZhR2Y0TDdkNGxyMlgzM2JOdVd1Y1k5b3BNUHBrTzQ0L1ZCZTN3?=
 =?utf-8?Q?oe5CZOf0RlxnjyPb1rnd+AJ3o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d3d5d8-6b62-427c-6761-08db82994a32
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 05:31:49.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LBbVziaVv7Fg5fV8bmaJQzcE/OTPb2IoLanVFQni9FHU7VZdfbPgORoGycEOxH5CkQxPAIhop8e40Ypsm33DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5055
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/11/2023 7:36 PM, Greg KH wrote:
> On Tue, Jul 11, 2023 at 02:27:50AM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> Previously, on unplug events, the TMU mode was disabled first
>> followed by the Time Synchronization Handshake, irrespective of
>> whether the tb_switch_tmu_rate_write() API was successful or not.
>>
>> However, this caused a problem with Thunderbolt 3 (TBT3)
>> devices, as the TSPacketInterval bits were always enabled by default,
>> leading the host router to assume that the device router's TMU was
>> already enabled and preventing it from initiating the Time
>> Synchronization Handshake. As a result, TBT3 monitors experienced
>> display flickering from the second hot plug onwards.
>>
>> To address this issue, we have modified the code to only disable the
>> Time Synchronization Handshake during TMU disable if the
>> tb_switch_tmu_rate_write() function is successful. This ensures that
>> the TBT3 devices function correctly and eliminates the display
>> flickering issue.
>>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> If "Sanath S" authored this patch, then the From: line is incorrect.
> 
> If they did not, then the ordering here is incorrect.
> 
> Either way, this isn't correct at all, please fix.
> 
> thanks,
> 
Sure Greg. my bad. I'll fix and resend this patch.
> greg k-h
