Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A1F6EE01A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 12:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjDYKUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 06:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbjDYKUh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 06:20:37 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C073C0A
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 03:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nj+ycO2IhC9K9cRDTSNIqYf+JB8NIHAVWXIRLPw8rGopQXsYrekGkQ3FKd9dRfnKuZOhwPOt9iElqvBiX6gqGBauJNZJWj84FgQnsvvVrqcanuusC+zJ1PsJykARw7Mjloiz1p07sEJ6CJZfVD7DmCeyLCECFMsNE6zaXwWJawG5bVfcx4J6JpRDi7mBfNK8UrMHGsUeTJ+bHN5gmqFN3vIIC6YarqWDCV00P/9Ff9i+PK6SJLQXZ6cJw5HM8xaNIVJucsz+HN66j/2yTiw/OTK/MQPlGnVl6l/0ewwxYQnQgvVCFCMSl4GYcZUL50GYBLm+Zt5fJcLKT7k4fDx8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oU+1EwXS1hWyu9P79klOBmZlbR2LJdelGJ8nvEz23c=;
 b=TrNeucAzENKxlDC2ICEi1zIcw4zkJJAgdF2Pg9s9kbR9c5MkQWRFurU2IZ9ynNX9Bdy09YRjY54Ajo7D+Rc8GRJ8oXQ3Li7CI1d84M/KFjqI9Osy3EJKXRxzOuL1/dQgHbYmHzwBj02tPQ0T6gCJ5maMf/nJSfaG9HFYVf2UfyEj1P4kJqtn1XR8SuMcAFAAK/btqmWFPBmJTxsktXyTh4ceBrWZ5S6YpWG70NbU7eX23YEINJ93UWz6BNuVPlL9e+0jQ4juebbBVHrVIccUTgVqt7C8OOU6KzsH0sQTbgO1xI01bznfdv4QsB1TOI7eHBvJBN1J/l4iUEcaBHXgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oU+1EwXS1hWyu9P79klOBmZlbR2LJdelGJ8nvEz23c=;
 b=Afc24B+1TcpZJJKGgxH1M5+5ivBzHHE2ofbf2OUfEGOPURsgNE9888847e0a2XbP1i2TS+J7dpynmbV9fw+RHvqZb8w8fNf7t6bcs3VkcbkIT/K3WidxNQOBKKTgIsDKNGN1vCSgbUi1qBATMFjv41B6nPfOUqwj8L81+mV2rKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Tue, 25 Apr
 2023 10:20:32 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 10:20:31 +0000
Message-ID: <94d73bdc-4518-8d4b-58ea-51df4739f941@amd.com>
Date:   Tue, 25 Apr 2023 15:50:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        basavaraj.natikar@amd.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <20230420170337.14110-1-markhas@chromium.org>
 <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
 <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 43161264-2cd2-49ea-f1d3-08db4576b2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgYmWu7Pe8BKC7Xe1CI0/I78Z1JD+sx9WP93pe4XrABkezwkDXUwRDUsqIMxKolAEot6EQMM3/YT7KUQElAdsky7ee9WopHgL59sKdWBrxT/I5okVFO4F9iwy3Q22Xj9gg+AENWmFMnyq6dfCP4kCiLF0IqXrgqBrEQ1NvDSOk/Uknf5NP9uiTsBhB+FcxUW2BmxHLPi12lligTDiX6YQm14q+25vWapbfIOmHBkEiIm+KugQw8+WP0LMN7D6HimcnPUea/VpVoOYRTYaCo5rnAV+VHaDF4u2MPLSywq6EEwmahkVVYPA8A4fyQ9qHA7YE+vzVNvDmkb+xnfdf3kKZJ6Jqmy5XPCiNK8wZ9pU1tuSGkUJoA64Ggpn5vtrBe9rVX9EZXyMwNWPVrUwK1vVBdx6taBAl3OmTX1hVNJfchYzw/PoBgWOtjRlC/RDz1v4kZUqDuiEGmZM8lhHGqMwkYAwl041yBIUYfddWebcNjgbWNDeYck5ENOa9fib6cD2O06O6rT9TuBFWO6ADqEYSt2u7IX5bqAokhSPuEpeYwoKd7R0bscaTSF6RniONVSFQvGAzh4pk+E9dRLBSRPup1Gkm/0lfda2pTQHks7xkMvSxMf+dVxPk2p1goZWjbkGkB4fCrxIodvBcN8dNaGeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(186003)(6506007)(26005)(6512007)(53546011)(6486002)(6666004)(66556008)(5660300002)(66946007)(2616005)(6636002)(38100700002)(41300700001)(4326008)(8676002)(8936002)(66476007)(110136005)(478600001)(2906002)(316002)(31696002)(83380400001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU5OUElxZ3lwYUNhTG9XMGQ0WFFacEl4WTJCaDRxQ0lHVW54L2FjbVRLSFlq?=
 =?utf-8?B?YWxPWEgzV200MzhjTU4zUHF3UHJJK2x4NEVIUkhZVVFURUZxSzV5OG5HR3Zp?=
 =?utf-8?B?Q2taMnFkNElHMk1vUG96c2VuaU9sRVpjaFl2Sk41bVROV3JWZldFUFRka1FX?=
 =?utf-8?B?Wm9vUFVBRm5rZytpWnovbXhRZndQRnJETXJ2VHFZRVpHOTRnK1djNlo2cUov?=
 =?utf-8?B?T2hmYnEvTWVZOFJmT2JML1ZBSjljeXI5bXptc3pQNkdQUTZlMjhzWmdGREJB?=
 =?utf-8?B?NFF0dVoySmV5aGlBSXdhbmZnUjBQZjFaeFAvOTB2UkIxR0l2R2lEeStEUEdT?=
 =?utf-8?B?R0ZDWnFjUWdtVjhtdEtNcjhuTmdCRWdHSmlXRzZFMXpzRit3ZjBXUEpBTHFp?=
 =?utf-8?B?cFNSMCtkbElESnQzdm1ZRkVhdFVMQy9XMXdjMkZIQjJ2Y0NGMmFqYVdaVTRk?=
 =?utf-8?B?RGp5cEExdjN4d3ZkRTNpK2hhM3Vpc3M3TjgrWU9GVHQwak43d0FYak9YMXlB?=
 =?utf-8?B?QXFpZEFMU1dLQTR5eVJrcjFEUENMcG5XQjN6TEtacXc4MHJvcnZZSHBYeEtO?=
 =?utf-8?B?emVZbWRlcDAzTXNlSjZESkhDZnd0VEhtZ0ZWeEwwUHhtYXhNS0ROR0s1alFV?=
 =?utf-8?B?cWtGYXV0TGl1OHVpZHB1bFFJRFpvWkQwVFZxQ21NdVUvWVdFL1N2VUxzaS94?=
 =?utf-8?B?VVI0VjhQemJobDk1NENjTC9IN2JXMDNZZ3FiOFJmVW1kTHp2QURpQTJxdlpQ?=
 =?utf-8?B?Q0cxU2s1MWU5N2p3RTFONVFSTEcwaUFkQ1dEYUlGa0MwTlVtSkxkQmJHeVhZ?=
 =?utf-8?B?aXlsSVI5QjFlMlB0b1NpVzBJVytwZlNURndvNjlwOHVtSXZTVE1Zb1A2TmNP?=
 =?utf-8?B?Wk1oSUxkOFlwWm1xL2kvSWMvZlZ1NWJkbGl6MTN2ZERDVDBtOG5jWWIyU2s1?=
 =?utf-8?B?UU1TSlJ6M29uRFg0Y3AwZC8ycTR3ZzdHaWZPQWpxcHFaSDArS1FBQUg4amxm?=
 =?utf-8?B?MGNjR0RxcVdCVWw1UkF3Mm5FK0d3QjBJdFVSUHpMTjBlbHZSVGE5R09ESFd4?=
 =?utf-8?B?ZVJVczNCdEk0OEtoZFJRTWhTUnE3a0JJZklESnk1YzJTc2szMHYyNGhPcXJh?=
 =?utf-8?B?UFdVU3JCZldhNHlhbnJ0MnZJRVVTamtaaU9tWUxSV0ZDZnpHRHBBV2hCd28x?=
 =?utf-8?B?N3IwSm43aEtLWWdUbWFHQW9kUndrWXJZT2Q4b2pBd3QrSWxxN1VSd0s2dk5J?=
 =?utf-8?B?aWhlNlduYW1ZeG9kYUVQSllEQXF4bGFhRHNlRmhzRExtWkVEUjNUVmh4MGha?=
 =?utf-8?B?SnBWZ3QyS0g5aDdwQmFBdVVldXhVV09qZDNKT1FvWElYbU5hNzFIM2ZSbHJH?=
 =?utf-8?B?ZVpTRUEwRXQxRkJZcjRkZStURThDRTRwc1ljUW9PZ2lCdngydzh4cDhzT2Fu?=
 =?utf-8?B?TTBpdUtRYVBTaWV3MjFsRG1GUmdxdElaUk5zUlBveGNwRm1mcVVYVVpwMnJI?=
 =?utf-8?B?ZDNkaS95alNxVzNhU0hhMldKSVZWUmZGaHExRHhnbE8zK0dnY0xVNUV0NzB4?=
 =?utf-8?B?eVgzajh4K25WTFFtcWVKMXdBNElWclRjM0lyNEIvUnlmaC9qLzFFbldQdjZn?=
 =?utf-8?B?c0tLeUsrMGpCZnJKMkJ2bVRyYjFTWUFGMGxUdStjTUhpZGxMYTR6bmIzTmdi?=
 =?utf-8?B?L2NHaHhYZno5QlcwdTNOV250bXR5TG5HcUZOcGxrT1ZzZ3dxTE9CdzBIZG43?=
 =?utf-8?B?VjN5dEc1K0xyUmk1dllXZGkxeVZaUUZ3MGhoeTFFMHNXdGlwRUhDUXNwUUpK?=
 =?utf-8?B?azcwL3dQempVeVdidEMwZ0JEOWtMelJhb011ZTlUZHR4dWsrU2t5SlE0a1oz?=
 =?utf-8?B?cE54eENhUjZoOXRuWWJGTTd5MStvaEZQSFJQS2xGV0kvU2NScktIb2NCUDJi?=
 =?utf-8?B?TzdNVEN1S3NjTUhMKzhHMVFkbm1HdGtWRE1rejB1T2ZTNTUvczJlYWVrQ0da?=
 =?utf-8?B?SlR5TldrT2xiQ2hZNUxTenkrbjd3WklCUlBsVnNsWDcwb09nM0Y1cVFUazZs?=
 =?utf-8?B?UDU0SXVEV1VGbUhlNFM1dVdKTVpTbGJyOEJuUjc0WXZDNCs4Q3I1SCtFUVBU?=
 =?utf-8?Q?hMhLavaEZlmhcJHNh9hobcJmR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43161264-2cd2-49ea-f1d3-08db4576b2db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 10:20:31.3871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9HtrxUIYxGlXKr2GkVW0vGf368cmB5sOE4shhp36tAro2e0yqDm6ggRsIU9fv3105CYsTKb1mfpwL8dDr1N9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/24/2023 8:35 PM, Mathias Nyman wrote:
> On 21.4.2023 7.58, Basavaraj Natikar wrote:
>>
>> On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>>>> It may be necessary to wait only for auto-resume cases.
>>> I find this comment misleading as the patch assumes that it's only
>>> necessary to
>>> wait for auto-resume cases. Are there any cases where the driver
>>> should wait
>>> during system-resume?
>>
>> Only in case of auto-resume (runtime resume).
>>
>> Rewording the commit message as follows.
>
> Thanks for fixing this extra system resume delay
>
> Maybe some kind of big picture explanation could be added to the
> commit message,
> such as:
>
> Avoid extra 120ms delay during system resume.
>
> xHC controller may signal wake up to 120ms before it shows which USB
> device
> caused the wake on the xHC port registers.
>
> The xhci driver therefore checks for port activity up to 120ms during
> resume,
> making sure that the hub driver can see the port change, and won't
> immediately
> runtime suspend back due to no port activity.
>
> This is however only needed for runtime resume as system resume will
> resume
> all child hubs and other child usb devices anyway.

Thanks for the explanation. I will change the commit message as stated above.

>
>>
>> Each XHCI controller while xhci_resumes by default takes 120 ms more if
>> there is no activity on the ports or no ports connected. Therefore, if
>> there are more USB controllers on the system, 120 ms more per controller
>> will add delay to system resume from suspended states like s2idle, S3 or
>> S4 states.
>>
>> Once the XHCI controller is in runtime suspended state (D3 state), on
>> USB
>> device hotplug controller will runtime resume (D0 state) and check for
>> pending port events if no events, wait for 120 ms to re-check for port
>> activity to handle missed wake signal.
>>
>> A delay of 120 ms more to re-check for port activity is needed only in
>> auto-resume (runtime resume) cases. Hence, add a check only for runtime
>> resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
>> other PM events (system resume from suspend states like s2idle, S3 or S4
>> states) so that the system resume time can be improved.
>>
>> Please let me know if any inputs.
>
> I can only think of one minor side-effect that would be runtime
> suspending back
> too early after system resume. This could happen when connecting the
> first
> usb device to a roothub on a (system) suspended setup?
>
> steps:
> 1. in system suspend, no usb devices connected, xhci in D3, can signal
> wake with PME#
> 2. connect first usb device, xHC signals PME# wake
> 3. system resumes, xhci resumes to D0, but no actity visible on xHC
> port registers
> 4. rootubs resumes, no other children on this bus.
> 5. roothubs sees no activity (due to 120ms max latency before visible
> on port registers)
> 6. roothubs runtime suspend
> 7. xhci runtime suspends
> 8. same device now causes xHC to PME# wake again,
> 9. runtime reusume xhci, do wait 120ms for port activity
> 10. see port activity, resume hub, enumerate device.
>
> It might be that this really isn't an issue due to the the graceperiod
> fix:
>
> 33e321586e37 xhci: Add grace period after xHC start to prevent
> premature runtime suspend.

Yes correct above changes helps to prevent premature runtime suspend.

Thanks,
--
Basavaraj 

>
> Thanks
> -Mathias
>
>

