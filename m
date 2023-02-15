Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBE269763D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 07:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjBOGXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 01:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBOGXd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 01:23:33 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921772B281
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 22:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRBMY/wd5OH1kJb5RDpb6PT253xpxuGl2aDNTVD4xUxbzgmPg6fmP0yqHR3xGvJnhlaxhI3qJBfcqStSb3uyiH/zKOdzbHjXbkJ3tk8C5ZaDZ7W4vlDmYZ8K/jL8t0jgLiuPOxe46Hc/sOuHwaJf6ChSes0hz9TPlJlkY8y61DqdqolC0YNEXlS4jNBN8srEzjJPcWFxMagn2yaF60knz3+eI/iC6oamE8rnImIdKWNtAPieApmWViGpGOworBB79ALFJoFBy79ht5U/FtVeI7FETpi4okbs0SsfbjLaG0/bMBugQVwNNfBWrhyvA/1/TanI4mKXkSFFd8b13M+mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0tMFwgRW0O2kkdRiCtDxd7AcArmdirQLLwBMZJ+nHo=;
 b=YlmXaLB6OU/7+/2MpqZTJoKk9446I1pzl3+kyMwAmJLIhZ2pcWwL3k7OX7UYivVl6RMTN4hkQ9hBycVGU1G+68WxBSmhov6wpTCCbNlTg+AcObf4LxyALzpaZeMsLoMAmtWl+Yjg+0R+/iPs3yO4GxmCrhqv4H7MpyEQUuSlkIyea4PiEGLihYHL2Qsf7FL1agLj7L+iiEhRNveZCt65pATvtTns/TOyg24Qpg0jD0bRZfM3uSAWzCHiXAM/gK7A6gSxugz1TG/f4Z4+2LTN3ipMOlU+bEBX1NITTNcFvKbt/J6GafoXzHs+6R0HZMt7kMThP0fTN73isM66pkSANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0tMFwgRW0O2kkdRiCtDxd7AcArmdirQLLwBMZJ+nHo=;
 b=xmX2i3d8W06XTEKtpk/CoBLsSPfdCmIF42Z1g+idKq98wyKV1vuZgQrS6kasCtr+ps6P02qxibYVbnKMrJ2jqKXE1yTFV4Qq+pPVFTvcYJuuAPOdPhLSG16Zipde0cQkcqrajPZIt4kRpSOC4WsuzfHABR01k/Fn58ESdgyojz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Wed, 15 Feb
 2023 06:23:29 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::40f4:29ea:fc74:a9c7]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::40f4:29ea:fc74:a9c7%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 06:23:29 +0000
Message-ID: <912af89c-32ee-7016-462b-4f045361fded@amd.com>
Date:   Wed, 15 Feb 2023 11:53:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5] thunderbolt: Add quirk to disable CLx
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
References: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+xyh44lGEzwuOj/@black.fi.intel.com>
 <a4601106-e41e-1991-9f63-b595243dc8bb@amd.com>
 <Y+x4xAwIuc+D4K7x@black.fi.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <Y+x4xAwIuc+D4K7x@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::31) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7423fc5c-e822-47be-a9e8-08db0f1d2751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sxdw7m4zHW+OzA51UhXnPxaHK3RT0kIKGKr51M2Y4V6sLJmVnyfVE5SJb+kVplB6fOgNZCmJJE8z0Wj1Y0wDxpeT1JdJpPkb4/tr4JZAHCSuBUA1nPZ5Ql6xj5SMrP/XX8EjUWl0c1eP5eQLNTXXhCmBK95S9GJxczEGxY8xPh48w3v1KYBC3IMp0S13rnJTu5aoonD8w/i4UgHFF/xFzj4oPjFY5HDEGU2DJLSMeqSlxwgSP3J8P7bT2BLFneL3l3QbKknGJqTwtu9q1i3Hh4tU5olwIqF8VPmv5FuO37SUddRGLIbZeedMh8qIF8J1ljpiDPH13/lhijz23dqG7Au2FITJnkE82hVWuVOAzoyRpRRFdnHAO4MSlNSctiMZ0R6uc3BwRM76KLyQJqdyBSrGaw5oIN/0j124s8I7qavfzxNhDkOuUtunq9zPgabWwZK/MdCD3Iq4aMAOrFDWY9pCT8iSJs08LYO3RTTh8tg7jaVx3BoxZihmePIrhjzU2+nHLFdfjvug96CytiIsED+/3eFlycyn9C1gGK+hRDqig94se4fJvjUq3yV4VxAfv06Fh98uFnVpOGwehwZfs1s78qWb857zR7SYp0oC5DQ2XijQtYC+u/WXjlK2GFYDtLfnXRHFNQiV1pcljSguQcd2UMxQuqQXtmninuQb1Wi/y3CBqUSK080qmMpSBcNPlFySZCnLCnSjA+8c3RwQUzdkNs6aaNqyawdB1jfcVFnUrFEbZW4e3J6nN4f7EnhwStkFtiNjsAB87x9mBqGqrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199018)(31696002)(38100700002)(4326008)(36756003)(66476007)(66946007)(66556008)(41300700001)(6916009)(316002)(8676002)(8936002)(2616005)(2906002)(66574015)(5660300002)(478600001)(966005)(6486002)(83380400001)(53546011)(6512007)(6506007)(6666004)(186003)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjJ1QnpUWTVVL2pDbEtzZy9vMjYycG85amhTWmZpVWlQZkgvOXZNSTVrTGxL?=
 =?utf-8?B?T1Z3ZlhkQmRaQ1E5L21RRlN4YisraFhLaFgzaHc4alF6dHhFZnp0cjFzVUxu?=
 =?utf-8?B?TGUrQjB4ZFc4Q3RiQUFjdFVzMEtENjdpU1cwbHI0TTI2cmlST1NLUjUrZzhJ?=
 =?utf-8?B?VEFGeTNiY1JoK1hucmRhTVEwUUpiSVg2eUdZMXVWMjhwTStLOEd3Ums0VnQ3?=
 =?utf-8?B?RWh3MDZ1MExkRFFncVJMbXZzOVVOaW5UbzluYWJNZjZOb05hNi9wTWl6d01W?=
 =?utf-8?B?REV6aHJDbWVyUnRlVXJlZzh6bUo2N0xkbE51Vk0yL0hvMUU3dFY2cUs1UWRX?=
 =?utf-8?B?Q2xtN2FDRStMRTdBZk1JTi94WXNHSktjUWh0L05lSUVJNjlnODVuU09VWmF5?=
 =?utf-8?B?eUgxc1BSWHRKSXdtcENiMzNJT3hmcUQ2endZcXB1aWZXb0dsZHBnQWVVdTkr?=
 =?utf-8?B?eVZDTkU0RnN0S1ZUQ21JMUZDWk5sU0Jwd0tZMDEvU2NnakhDMmJrdUUzLzRy?=
 =?utf-8?B?ZVZPSEhWKyttb3UxeXAydFNra3V5V3ZRT1N1NjIwZjRITERqM2dxZHRNVzRB?=
 =?utf-8?B?ZlFWeFJVaVdieUEzZnBTNndTWEZZSzIvYmVOaUxBWHhmOVB2QzJ6SnJjUzcv?=
 =?utf-8?B?aXJQQkdaVjh0aE5GUDh4dFZMV09YQXhjWTcvdTAwU2J4UFIrUnNxTGZvZFp3?=
 =?utf-8?B?NUxoMElsWnhUeWVDUHVYVzdPMnY1c0pIY21OMTZPNzRlZG9ueStIT2lpZDNs?=
 =?utf-8?B?WEM4R0lsK1JwQmpQMHpubHJnd1ZyT0ZCd2tIVW5IY29oVXo2UzFFc05EMC9D?=
 =?utf-8?B?RVdUZmMzeTNYSTZmZDBQQWYzYTA3NUhXVEJweFd2YzNHSnBLK0Z4TE05c1NW?=
 =?utf-8?B?R1pJU0VmR3ZObnVhNExJb2luc3ZHVnFzdjUvSVNyMDB0SjlhWmllK3poTEhz?=
 =?utf-8?B?Rm8rYlhZRjVlcno4RGRRckNhZ2gvQkJKRHVKMHZUV2puMlZmQlVZSEVZcS9H?=
 =?utf-8?B?VzNkdXBEcTVFeVB0dFVpWE8xUE5MVzlqcUQvczNmaUtQeGsxZnVOTnlwZFNZ?=
 =?utf-8?B?Q3JzN0hWYjdRcS92VGJRNHovNWdadFdvSDFnTnlDbFl5K1IwOTJrb2tKWlBl?=
 =?utf-8?B?MnJSek9zaC9PS0F0eU9aQ2pKNXpvZHBML3Y3RVRHNjlpNDhGcTZFNHdkN2R1?=
 =?utf-8?B?NVdMMmN6ektVd0w0RFZ0NnZWNU5GYUU5dkg2KzFaWUpaeEo2aHB2WEVrWW1a?=
 =?utf-8?B?cEpseitndDV3WHF1amlJSkVSVEdWdFFFWmt0bGVYUE8wT3hzZS9QekFPVm9x?=
 =?utf-8?B?VkZ0by92bFNiTkU0T1YrK2N5ZEJxZ3RVWjk4SWFCdGVybnk2Y24rbC9pSDNS?=
 =?utf-8?B?ZUE0T3AzdW90QUJ5NW80UXliUFFFbWNTUkc3UTJVR2ZZb2Znd3VEUmkrSGJG?=
 =?utf-8?B?UVZWNHZxUGZnYmZXb0FtK1lyRjRZRWNYN2QxUmcxWitrWVdkdEU0Q3kyeml6?=
 =?utf-8?B?RTZIcGtVSllHMlB3T0g2WGRLYks1aDJhQXY5cTBNdWxTclc3UENRZzlVNGgy?=
 =?utf-8?B?TVUvckM5VFh4SEZZVDBYTjBhVThobGZRU3FQVmpTV2pYdW84NVJxMVRteGZD?=
 =?utf-8?B?NmhEVUxLTXkyU3kxRlpISUFxZGpteFA3aW1kbHcxdFhUcFVHckYvdHc3c0xM?=
 =?utf-8?B?T1o1QlZIWDJPK0l3UXRmbStnbjNlOVFseFl4aGJuVEdwRHFFN3FKRFZQcjdK?=
 =?utf-8?B?Z2UwMjMwTzRoRnlGcFhWYVY2dDR1RTA2ZHRpM2QzbEJDWlljcjhNb2E2ZXJz?=
 =?utf-8?B?aEMwZEdWRWhwVEg0SkhqNjFKb3dqczN2R3B3M2hNQUQxaWhtelZQMFlCS1A2?=
 =?utf-8?B?dmJBNjlab0VlTHFnYnJPWk1ORE5WMGxPVGMxbllPVVZYWGQ0ZkVTay85K3du?=
 =?utf-8?B?UGYvU3hCSnRORTVxeDZDTHMrLzViRXU0SWN0M2ZPV2s1NUpZNE16ZkhtaDM1?=
 =?utf-8?B?QU5mSDd4N2MzUXdNbURoQXNQUkwva0FKK2pTWkkyT01CdW5nSm5zM2NTaFV3?=
 =?utf-8?B?eENqY052SVFOemJ4WGtEUlo2R2ppaUdEdjllTHZWR3ZabnBpMkwwdWpuV3BF?=
 =?utf-8?Q?ZMIuN1sxy45PyU6dCX2GCmdNq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7423fc5c-e822-47be-a9e8-08db0f1d2751
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 06:23:29.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fmEetXprRnq1m28RFhNe7L29NVtpFdKuGAZwUN2FYo//HKSM7BDIiWJg4I/t2GEgs4VoP48a98eKvGdXxxiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/15/2023 11:46 AM, Mika Westerberg wrote:
> On Wed, Feb 15, 2023 at 11:29:00AM +0530, Basavaraj Natikar wrote:
>> On 2/15/2023 11:19 AM, Mika Westerberg wrote:
>>> On Tue, Feb 14, 2023 at 02:01:52PM -0600, Sanjay R Mehta wrote:
>>>>  void tb_check_quirks(struct tb_switch *sw)
>>>>  {
>>>> +	struct tb_switch *root_sw = sw->tb->root_switch;
>>>>  	int i;
>>>>  
>>>>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
>>>>  		const struct tb_quirk *q = &tb_quirks[i];
>>>>  
>>>> -		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
>>>> +		if (q->hw_vendor_id && (q->hw_vendor_id != sw->config.vendor_id &&
>>>> +					q->hw_vendor_id != root_sw->config.vendor_id))
>>> Again, why you need to change this?
>>>
>>> If you have the AMD host router device ID in the list the quirk applies
>>> and that makes the driver skip enabling CL states for that link. It
>>> should not matter if we enable CL states in the deeper parts of the
>>> topology (even if we actually do not at the moment) because that's
>>> completely different link, right.
>> Thank you Mike for point it out then [PATCH v4] <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r> patch changes solves the purpose.
>>
>> [PATCH v4] thunderbolt: Add quirk to disable CLx <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r>
>> https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/
>>
>> Please review the changes
> Indeed v4 looks good. I just skipped it because there appeared several
> versions of the patch in my inbox overnight so picked the last one for
> review ;-)

Sorry for the confusion. Please apply [PATCH v4]
Thank you Mika for quick and timely review.

Thanks,
--
Basavaraj

