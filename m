Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D90B16A105
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 10:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgBXJI0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 04:08:26 -0500
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com ([40.107.93.61]:6228
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726452AbgBXJIZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Feb 2020 04:08:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H97hy8M+qNYyqX4D0SBRHxySMjRRPa9twJjCKV4mmXqwqd7BfF0WNWEcrYlShIH7kEnkkxE0a2KHlsuEP3ijORZk1zSv7oRVI0kCQJkyh0DdbuJ93N2ik45vaxvpYdGGEjVm931y+Oohfv7z6UNQTuBwigpZ6y8LkrnmQWp9421np/CNDiPnK7m4iLFBLnJA8I2zcNkd4RaOe7nW//mk1cooSsF8AbPJ6zRikARTDuIitATioBeacPDGZ6Qr03EbNUjOwg1ifg3D5oiweTCQk7NWQ5ijbcCWVREyl9qn55u+H7KBZwkJi8MBQBIgMRKBMSt650ocN7G12ETYESyz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjMAVTYObRhFJb4wpYj9cpoCXqbF27kMFrHhLuCPG88=;
 b=U5YKff1ZQcugBVvIyR49DUK5je4AwxbW+fTR9l9R0bahtggH9jHmF3unupxjVxbn1u7Vd7zsHLdMcv45S1y67ikIgP/7OECH7m06uuYzectuxuhJT4cpIZ6A+cIii/lro9TpStPTIvT31nYrOmBumxPQMOtXD/Huu/4x1UQs3IAdKQKIkKCmqoqtKk6esAH/SHKkqcK41lXuGynDynl1VE+nNxIop12++2ldvmIk4FydxMZy7gCKvjBnLIcBxhgvU64uPNl2GrE0i3U5oX55t9HgBe9+6brJX/WQIjIDWo03ro3ttJHz0LoOQi0d5NphR3mBbY4wO2StVyScuKmAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjMAVTYObRhFJb4wpYj9cpoCXqbF27kMFrHhLuCPG88=;
 b=qunSJT5GVaTn+qZHwfiw4l1aglRF/z2/t5w/xST2Lme1aaRctaTPI+0VlXYW+kVyIyEyADo3caAIwxUuLxv7Ik/YMMLGPJSoC+IT0N79ACoQ8+Oo7fACD84hYLed60k4yVaRvj9IkrmebaNpvxuAO4SUIMt9mGfE8tAspl9rcG4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SN1PR12MB2464.namprd12.prod.outlook.com (2603:10b6:802:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 09:08:22 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:08:22 +0000
Subject: Re: UCSI:CCG: AMD Platform
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
 <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
Message-ID: <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
Date:   Mon, 24 Feb 2020 14:38:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
Content-Type: multipart/mixed;
 boundary="------------5326BA2C83BF6F3389A26C3C"
Content-Language: en-US
X-ClientProxiedBy: MA1PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.133.81] (165.204.157.251) by MA1PR01CA0130.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Mon, 24 Feb 2020 09:08:20 +0000
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d1321c3-9a3a-4389-c1f5-08d7b90918ba
X-MS-TrafficTypeDiagnostic: SN1PR12MB2464:|SN1PR12MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24644C12B30FCCF33898BBDDA0EC0@SN1PR12MB2464.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(21480400003)(6636002)(6486002)(4326008)(31686004)(2906002)(86362001)(36756003)(478600001)(53546011)(31696002)(235185007)(33964004)(5660300002)(316002)(66946007)(110136005)(66556008)(66576008)(66476007)(2616005)(956004)(16576012)(186003)(16526019)(26005)(8936002)(8676002)(81166006)(81156014)(52116002)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2464;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pt+JQ/fA4xxWfdW+5SPjcyuUSTfqwY7W1Uau+pHSbr7ga8BWPi1raR8OctbWxTIQxmDdOrt/MGb+StWB4DS0lrA/VA4Q3Yy0jRjfRqqLgLMPe2HFSF8f7eZwxrLwAWV375GfpgnVzTSJfaHwfL6FlUyAKb0E9gKsueh1iLkEDm0b08gKwuInsR5zLDNXoprolDmKlnPO0E8SIYUFD44MT2iPTbPUrW74MY5hpfzUdigTZQNgdS+evTE5OumCc4A6Cfnev7eiQHQwwZEgMzFqzfffdxbgXfCaN7Ysl0Bf2UFWU22tfbrsc+QfFOzBseA/Jm0rW3/7cqYYY3uaztVZT6Q2VdkIRb+JVOIPVWs6OhEkuOgN8npKMOVzzMeLl3o8OzpoQXUUkkmPJQirqGmZ8cJxxCXWn+AU9e4KDEft0zFTaMQJbePah3bp464t3SCO
X-MS-Exchange-AntiSpam-MessageData: iJhPipcLyERAvbi/9hK4m6WCnYKf1EFHgfypcNi/+We2/HYVp8zfCme20xp6GkqkAiqu4NRM5sf9hIJMpP7MBP1I0v1XpYwtHyADLjFAUGR3+bmtYSbwpFigJnyzEmwsLIjZeElJLrKKKLDPRUZ6JQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1321c3-9a3a-4389-c1f5-08d7b90918ba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 09:08:22.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyI+wEiHd+yvZMyafDOh6fDDm2qWuhRB+NEfxQaWO/L+wcZb5kCPXJQ5pTyxSMa+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2464
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------5326BA2C83BF6F3389A26C3C
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi

On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
> Hi
>
> On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
>> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
>>>> I am using CCG based UCSI driver without any
>>>> modification.For I2C part i have written custom
>>>> driver.
>>>>
>>>> I have attached the trace out and dmesg crash log.
>>>>
>>>> Please have a look
>>> Thanks for the logs. Can you test the attached diff?
>> Actually, don't try that one. Try this one instead.
> Sure i will update on this on Monday.
>
>
> thanks
>
> Nehal

Patch is not solving the issue. I have attached both trace and dmesg output.

Thanks

Nehal



--------------5326BA2C83BF6F3389A26C3C
Content-Type: text/plain; charset=UTF-8;
 name="trace.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="trace.txt"

# tracer: nop
#
# entries-in-buffer/entries-written: 7/7   #P:8
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
     kworker/3:2-268   [003] ....   334.360355: ucsi_register_port: port0 status: change=0000, opmode=0, connected=0, sourcing=0, partner_flags=0, partner_type=0, request_data_obj=00000000, BC status=0
     kworker/3:2-268   [003] ....   334.410534: ucsi_register_port: port1 status: change=0000, opmode=0, connected=0, sourcing=0, partner_flags=0, partner_type=0, request_data_obj=00000000, BC status=0
     kworker/0:4-2368  [000] ....   344.162496: ucsi_connector_change: port0 status: change=4800, opmode=5, connected=1, sourcing=1, partner_flags=1, partner_type=2, request_data_obj=00000000, BC status=0
     kworker/0:4-2368  [000] ....   344.185817: ucsi_connector_change: port0 status: change=0040, opmode=3, connected=1, sourcing=1, partner_flags=1, partner_type=2, request_data_obj=1201685a, BC status=0
     kworker/0:4-2368  [000] ....   345.180458: ucsi_connector_change: port0 status: change=0100, opmode=3, connected=1, sourcing=1, partner_flags=1, partner_type=2, request_data_obj=1201685a, BC status=0
     kworker/0:4-2368  [000] ....   345.263533: ucsi_register_altmode: partner alt mode: svid ff01, mode 1 vdo 1405
     kworker/0:4-2368  [000] ....   345.281688: ucsi_connector_change: port0 status: change=0800, opmode=3, connected=1, sourcing=1, partner_flags=2, partner_type=2, request_data_obj=1201685a, BC status=0

--------------5326BA2C83BF6F3389A26C3C
Content-Type: text/plain; charset=UTF-8;
 name="demsg"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="demsg"

20614] FS:  0000000000000000(0000) GS:ffff8c6c38640000(0000) knlGS:0000000000000000
[  362.320616] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  362.320617] CR2: 0000000000000080 CR3: 00000001979d2000 CR4: 00000000003406e0
[  362.320618] Call Trace:
[  362.320622]  ucsi_unregister_altmodes+0x6c/0x89 [typec_ucsi]
[  362.320625]  ucsi_unregister_partner.part.0+0x17/0x2b [typec_ucsi]
[  362.320629]  ucsi_handle_connector_change.cold+0x62/0x6e [typec_ucsi]
[  362.320631]  process_one_work+0x1e9/0x3a0
[  362.320633]  worker_thread+0x4d/0x400
[  362.320636]  kthread+0x104/0x140
[  362.320638]  ? process_one_work+0x3a0/0x3a0
[  362.320640]  ? kthread_park+0x90/0x90
[  362.320642]  ret_from_fork+0x22/0x40
[  362.320644] Modules linked in: typec_displayport ucsi_ccg ucsi_pci_amd(OE) typec_ucsi typec nls_iso8859_1 amdgpu snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio input_leds snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec edac_mce_amd snd_hda_core kvm_amd snd_hwdep kvm gpu_sched snd_pcm ttm snd_seq_midi snd_seq_midi_event snd_rawmidi drm_kms_helper snd_seq drm snd_seq_device irqbypass snd_timer crct10dif_pclmul mac_hid snd crc32_pclmul i2c_algo_bit ghash_clmulni_intel fb_sys_fops aesni_intel syscopyarea crypto_simd soundcore sysfillrect sysimgblt wmi_bmof k10temp cryptd ccp glue_helper sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_generic usbhid hid tg3 sdhci_pci i2c_piix4 ptp cqhci ahci sdhci pps_core libahci wmi video gpio_amdpt gpio_generic
[  362.320679] CR2: 0000000000000080
[  362.320681] ---[ end trace ad3ed17854ca5182 ]---
[  362.320685] RIP: 0010:ucsi_displayport_remove_partner+0xe/0x20 [typec_ucsi]
[  362.320688] Code: 38 00 c7 43 28 00 00 00 00 48 83 c7 10 e8 0a fe b3 c7 5b 5d c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89 e5 48 85 ff 74 0f <48> 8b 47 78 48 c7 00 00 00 00 00 c6 40 3d 00 5d c3 90 0f 1f 44 00
[  362.320689] RSP: 0018:ffffac3c42aabdb8 EFLAGS: 00010202
[  362.320691] RAX: 0000000000000008 RBX: ffff8c6bf1526970 RCX: ffffac3c4006d000
[  362.320692] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
[  362.320693] RBP: ffffac3c42aabdb8 R08: 0000000000000000 R09: 0000000000000038
[  362.320694] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
[  362.320696] R13: 0000000000000001 R14: ffff8c6bf1526970 R15: ffff8c6bf1526800
[  362.320697] FS:  0000000000000000(0000) GS:ffff8c6c38640000(0000) knlGS:0000000000000000
[  362.320699] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  362.320700] CR2: 0000000000000080 CR3: 00000001979d2000 CR4: 00000000003406e0

--------------5326BA2C83BF6F3389A26C3C--
