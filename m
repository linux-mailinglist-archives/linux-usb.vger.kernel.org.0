Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28F6309D9D
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jan 2021 16:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhAaPgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jan 2021 10:36:51 -0500
Received: from wrqvxvhd.outbound-mail.sendgrid.net ([149.72.168.13]:59316 "EHLO
        wrqvxvhd.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232058AbhAaM6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Jan 2021 07:58:40 -0500
X-Greylist: delayed 850 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 Jan 2021 07:58:39 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northcode.ch;
        h=subject:references:from:mime-version:in-reply-to:content-type:
        content-transfer-encoding:to;
        s=s1; bh=DxlszFhaG6w5KrJW9EoSsk6b/vkeiXZoT0jZNIAwdYo=;
        b=MMGouxI+jtoWIakk/Xxc9WemQosXSLRmPMhfCRNGN1ZP5fW1b8JNSAqiySXvxLTiVEJv
        8JTWEBsrywmjNwbw/cjvnFAL8K5RElRVznhDSJkd/iXZ8G8fbmmvtoinzs4FG18/3s1toJ
        fMYPAKeUaxPQkUwGlgZ17cNM/i6YSY5+E=
Received: by filterdrecv-p3las1-598b7f99cd-47dqx with SMTP id filterdrecv-p3las1-598b7f99cd-47dqx-17-6016A5C1-1A
        2021-01-31 12:42:41.74888329 +0000 UTC m=+220142.635623173
Received: from mail.northcode.ch (unknown)
        by ismtpd0006p1lon1.sendgrid.net (SG) with ESMTP id v2MCd-ASSP-7lIqvsTVpkg
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 12:42:41.475 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F44F160B14F
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 13:42:37 +0100 (CET)
Subject: Re: RTL8153 1G USB ethernet kernel hang bug
References: <87129afc5fa1c2dc84a480118b54cb925eefc2f7.camel () suse ! com>
From:   Jens Vogler <jens@northcode.ch>
Message-ID: <1e1653c4-b369-8f62-ac6c-a3aed9acef02@northcode.ch>
Date:   Sun, 31 Jan 2021 12:42:41 +0000 (UTC)
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87129afc5fa1c2dc84a480118b54cb925eefc2f7.camel () suse ! com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-SG-EID: =?us-ascii?Q?TT7ouWc0A6VlI77LueNn6f8Q31yyUtpn3u2ArTjkz8ybCfYwnQPFPrFnUv8b=2FN?=
 =?us-ascii?Q?8gKzMVpbvfHmkjcngk7p0HY0ub4HLz8FIm2z63y?=
 =?us-ascii?Q?KskrAHecBoyc2l8tLXY09f1yk=2F2JOzvBklpdMsQ?=
 =?us-ascii?Q?A9GEYx=2FzslqeQ2SbvhDyfXVUJ1D0nEntAgO36Y5?=
 =?us-ascii?Q?3tHKTWYS3ZUZqLT=2Fg5qr7PpCXMJVAcH29=2FKZLVM?=
 =?us-ascii?Q?26itgABK9bbgs+8Gfh0xuRlo3UHJAqMsKuYRrOX?=
 =?us-ascii?Q?u1uDg15IYsQU7Cg1t1sPg=3D=3D?=
To:     linux-usb@vger.kernel.org
X-Entity-ID: B8811fCAJqtwkWDxFRzHzA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I seem to have the same issue with the following hardware configuration:

Laptop: Lenovo E15
Dock: Lenovo ThinkPad Dock Hub

lsusb output:

Bus 002 Device 003: ID 17ef:1020 Lenovo ThinkPad Dock Hub
Bus 002 Device 004: ID 17ef:3062 Lenovo ThinkPad Dock Ethernet [Realtek 
RTL8153B]
If relevant, the bus? for the Ethernet controller is 2-2.1

lsusb -v output: https://u14356439.ct.sendgrid.net/ls/click?upn=pRar9pMC1vFolratsg1s0-2FeInVZDGg-2FcACqM0tswpz99pOjf8bjPgCtR36QcejtFKB-z_6pwKHJ8Ph1XTyv7ONZlOBKhPm-2FqdBrDnSeervB5zzLfRVCpDK7IOLV34dv2avSKDAPt09SLlnol1PqxfBoNSymegnVS7pppyfglTAlk6PoO1qLqLGYQk0eV16iRFuLK-2BwnDTfejC7ZkDtSsoaoe8Pb0FGWMsSBioN-2B6xT6-2FBNG5JAuY7hXR4uDklIN6bxBuq1Xo-2FtwtGVcLNliC9cT6N1EeikQmBTRlm4guTmwMNJb8-3D (includes Hub and Ethernet)

I ran the following commands to get diagnostic data:

echo 1 > /proc/sys/kernel/hung_task_timeout_secs
echo 'module usbcore +p' > /sys/kernel/debug/dynamic_debug/control

I had powertop running in the background and it seems that it hung first 
which lead to the blocked message in the log output. I have another log 
dump without the dynamic debug in usbcore enabled where it was a kworker 
that hung first. Nevertheless the resulting behaviour was the same. Any 
Network interaction failed and NetworkManager hangs as soon as you try 
to interact with it. Sudo also doesn't work for some reason.

Logs:

https://u14356439.ct.sendgrid.net/ls/click?upn=pRar9pMC1vFolratsg1s0x4KSE-2Fo2YdO9l2KR3HCLpCRdjZt57cJtY2NQ5SiDek-2FTWaW_6pwKHJ8Ph1XTyv7ONZlOBKhPm-2FqdBrDnSeervB5zzLfRVCpDK7IOLV34dv2avSKDAPt09SLlnol1PqxfBoNSyogNiezvm3FEJUgy9DUxVqgpZ6bwuOmPxRLIeXrTbjBNLLLEteqYswBQtVlzBHsMIU-2FPTYtaTCxCnhyNjgwonvn-2BkEt1oLE9PDdzH0iaT-2FAiPK7T2NpPyya0dB6BOLmbegtJtE9KSJU-2Fh46y-2FRDDdg8-3D - dmesg with hung task timeout and usbcore 
debug
https://u14356439.ct.sendgrid.net/ls/click?upn=pRar9pMC1vFolratsg1s00lIbb-2FALqvmpxsiExeL0irFXX-2FEjJW8koJnO1i5Jc6iKmYx_6pwKHJ8Ph1XTyv7ONZlOBKhPm-2FqdBrDnSeervB5zzLfRVCpDK7IOLV34dv2avSKDAPt09SLlnol1PqxfBoNSyiI5VX-2BEDYLOFtThYKb1qk10-2FiHAjngVAqyPGWwVLPCeZThfftfsck68iBEYgAiqJllOTabe-2FsBTEDzZTAJYYxx3nZ9Zqn7Fmu0y2Q4DEF-2BvNhNvqfQysRMa8qCQtqXn-2FWY2lezTZ4Cay3nD5J-2FMOXg-3D - journalctl dump, (pretty much the same 
as the dmesg)
https://u14356439.ct.sendgrid.net/ls/click?upn=pRar9pMC1vFolratsg1s02I42YHBdpzG3piI7nftF04n2ZUwZCHVT8DTqfh8jiWpxg_g_6pwKHJ8Ph1XTyv7ONZlOBKhPm-2FqdBrDnSeervB5zzLfRVCpDK7IOLV34dv2avSKDAPt09SLlnol1PqxfBoNSyvJB5o8cncMKMT9DPEfqCFfqZkBWg8nJcp7IoHSZOJsRb-2BTP5pzLgtA7fafGGu-2Bc-2B2goZuA9uW8PEvXb3GP58MSQhvcZCg5ZMBXdLEvImO4x7EEJooe5fHc0NGJQXJxo8esdpKkbUnjoosUZF-2FrvEbU-3D - dmesg without usbcore debug. kworker hangs

Possibly relevant log snippet: (right before first hung task)

[19314.449661] usb 2-2.1: usb wakeup-resume
[19314.449723] usb 2-2.1: Waited 0ms for CONNECT
[19314.449727] usb 2-2.1: finish resume
[19314.451065] usb 2-2-port1: resume, status 0
[19314.451067] usb 2-2-port1: status 0203, change 0000, 5.0 Gb/s
[19314.451222] hub 2-2:1.0: state 7 ports 4 chg 0000 evt 0000
[19314.451226] usb usb2-port2: resume, status 0
[19325.748497] usb 2-2.1: usb auto-suspend, wakeup 1
[19325.763258] hub 2-2:1.0: hub_suspend
[19325.769936] usb 2-2: usb auto-suspend, wakeup 1
[19325.786584] hub 2-0:1.0: hub_suspend
[19325.786613] usb usb2: bus auto-suspend, wakeup 1
[19328.126642] usb usb2: usb wakeup-resume
[19328.126654] usb usb2: usb auto-resume
[19328.126682] hub 2-0:1.0: hub_resume
[19328.126763] usb usb2-port2: status 0263 change 0000
[19328.126861] hub 2-0:1.0: state 7 ports 6 chg 0000 evt 0000
[19328.127773] hub 2-0:1.0: state 7 ports 6 chg 0000 evt 0000
[19328.127826] hub 2-2:1.0: state 8 ports 4 chg 0000 evt 0000
[19328.143038] usb 2-2: Waited 0ms for CONNECT
[19328.143040] usb 2-2: finish resume
[19328.143177] hub 2-2:1.0: hub_resume
[19328.143266] usb 2-2-port1: status 0203 change 0000
[19328.143423] usb 2-2-port4: status 0263 change 0000
[19328.159669] usb 2-2.1: usb wakeup-resume
[19328.159729] usb 2-2.1: Waited 0ms for CONNECT
[19328.159734] usb 2-2.1: finish resume
[19328.162261] usb 2-2-port1: resume, status 0
[19328.162270] usb 2-2-port1: status 0203, change 0000, 5.0 Gb/s
[19328.162503] hub 2-2:1.0: state 7 ports 4 chg 0000 evt 0000
[19328.162522] usb usb2-port2: resume, status 0
[19342.890265] INFO: task powertop:6156 blocked for more than 1 seconds.
[19342.890278]       Not tainted 5.10.7-3-MANJARO #1
[19342.890282] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[19342.890289] task:powertop        state:D stack:    0 pid: 6156 ppid:  
6121 flags:0x00000080
[19342.890300] Call Trace:
[19342.890322]  __schedule+0x295/0x810
[19342.890334]  schedule+0x5b/0xc0
[19342.890343]  rpm_resume+0x18c/0x810
[19342.890354]  ? wait_woken+0x80/0x80
[19342.890361]  rpm_resume+0x308/0x810
[19342.890369]  __pm_runtime_resume+0x3b/0x60
[19342.890379]  usb_autopm_get_interface+0x18/0x50
[19342.890395]  rtl8152_get_link_ksettings+0x27/0x80 [r8152]
[19342.890408]  ethtool_get_settings+0xa7/0x1e0
[19342.890421]  dev_ethtool+0x10fe/0x2ac0
[19342.890432]  ? page_counter_try_charge+0x2f/0xb0
[19342.890440]  ? inet_ioctl+0xdd/0x210
[19342.890453]  ? netdev_name_node_lookup_rcu+0x68/0x80
[19342.890461]  dev_ioctl+0x304/0x580
[19342.890468]  sock_do_ioctl+0xe3/0x180
[19342.890477]  sock_ioctl+0x272/0x3e0
[19342.890487]  __x64_sys_ioctl+0x83/0xb0
[19342.890498]  do_syscall_64+0x33/0x40
[19342.890506]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[19342.890515] RIP: 0033:0x7f4a6222cf6b
[19342.890520] RSP: 002b:00007ffdbfcc64d8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
[19342.890528] RAX: ffffffffffffffda RBX: 00005578f9b00e60 RCX: 
00007f4a6222cf6b
[19342.890532] RDX: 00007ffdbfcc6520 RSI: 0000000000008946 RDI: 
000000000000007b
[19342.890536] RBP: 00007ffdbfcc65a0 R08: 0000000000000001 R09: 
0031753275306630
[19342.890540] R10: 000000000044c736 R11: 0000000000000246 R12: 
000000000000007b
[19342.890543] R13: 00005578f9b03eb0 R14: 00007ffdbfcc6520 R15: 
0000000000000005


I'm happy to provide more info, it does take some time to reproduce 
though and I'm testing workarounds (e.g. disabling power management). 
Plus I have no idea about the usb stack so I need some guidance to 
collect diagnostics.

Regards Jens


On 07.01.21 10:38, Oliver Neukum wrote:
> Am Mittwoch, den 06.01.2021, 17:13 +0000 schrieb David Mytton:
>> I'd like to report a bug in the Realtek driver for a RTL8153 10/100/1000
>> Ethernet adapter built-in to a USB-C connected Philips 272B7QUPBEB 27" QHD LCD
>> Monitor. It is not limited to the monitor as I have seen other similar reports of
>> USB Ethernet adapters with the same issue using the same driver.
>>
>> I have reproduced this on Kernel 5.10.2 and 5.9.11, both Manjaro, but have seen
>> reports across multiple distros.
>>
>> Symptoms:
>>
>> - After a period of time following a reboot, ethernet connectivity suddenly
>>    drops. Wi-Fi might take over, but not reliably.
>> - There is a kernel trace in the journalctl output (see below).
> The trace indicates that runtime power management is waiting for
> something, but not for what.
>
>> - Attempting to do anything related to the network causes a hang e.g. running
>>    inxi hangs after CPU output.
>> - The only way to recover is to hard reset. reboot command also hangs.
> The processes are in state D (uninterruptible wait)
>
>> - Set usbcore.autosuspend=-1 pci_aspm=off kernel params. This has solved the
>>    issue for me; the system has been stable with several days of uptime.
> That switches off runtime PM.
>
> The unsolved question is what the kernel is waiting for. Or whether we
> have a deadlock. Have you tried a kernel with lockdep enabled?
> Could you try to get a lock with dynamic debugging enabled for
> the module usbcore?
>
> In this case I don't think a usbmon trace is going to help much, as
> the kernel is stuck.
>
> 	Regards
> 		Oliver
