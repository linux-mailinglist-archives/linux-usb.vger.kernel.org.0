Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B4A9D09E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 15:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbfHZNcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 09:32:21 -0400
Received: from mga02.intel.com ([134.134.136.20]:34339 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfHZNcV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 09:32:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 06:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; 
   d="scan'208";a="204579834"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 06:32:19 -0700
Subject: Re: Ryzen7 3700U xhci fails on resume from sleep
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Drake <drake@endlessm.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Endless Linux Upstreaming Team <linux@endlessm.com>
References: <CAD8Lp47Vh69gQjROYG69=waJgL7hs1PwnLonL9+27S_TcRhixA@mail.gmail.com>
 <CAJZ5v0g4T_0VD_oYMF_BF1VM-d1bg-BD8h8=STDrhVBgouPOPg@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <01cf6be6-9175-87ca-f3ad-78c06b666893@linux.intel.com>
Date:   Mon, 26 Aug 2019 16:34:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0g4T_0VD_oYMF_BF1VM-d1bg-BD8h8=STDrhVBgouPOPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.8.2019 12.29, Rafael J. Wysocki wrote:
> On Mon, Aug 26, 2019 at 11:11 AM Daniel Drake <drake@endlessm.com> wrote:
>>
>> Hi,
>>
>> Working with a new consumer laptop based on AMD Ryzen 7 3700U, all USB
>> functionality goes dead upon suspend/resume (s2idle). Reproduced on
>> linus master from today.
> 
> I wonder if you can reproduce this with the pm-s2idle-rework branch
> from linux-pm.git merged in.
> 

Root cause looks similar to:
https://bugzilla.kernel.org/show_bug.cgi?id=203885

Mika wrote a fix for that:
https://lore.kernel.org/linux-pci/20190821124519.71594-1-mika.westerberg@linux.intel.com/

-Mathias
  
>> <<<suspend>>>
>> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
>> <<<wake up happens here>>>
>> xhci_hcd 0000:03:00.3: Refused to change power state, currently in D3
>> xhci_hcd 0000:03:00.4: Refused to change power state, currently in D3
>> WARNING: CPU: 0 PID: 1980 at kernel/irq/chip.c:210 irq_startup+0xda/0xe0
>> Modules linked in:
>> CPU: 0 PID: 1980 Comm: bash Not tainted 5.3.0-rc6+ #265
>> Hardware name: ASUSTeK COMPUTER INC. ZenBook UX434DA_UX434DA/UX434DA,
>> BIOS UX434DA_UX434DA.301-C03 08/20/2019
>> RIP: 0010:irq_startup+0xda/0xe0
>> Code: ef e8 fa 2b 00 00 85 c0 0f 85 04 09 00 00 48 89 ee 31 d2 4c 89
>> ef e8 d5 d3 ff ff 48 89 df e8 cd fe ff ff 89 c5 e9 53 ff ff ff <0f> 0b
>> eb b5 66 90 55 48 89 fd 53 48 8b 47 38 89 f3 8b 00 a9 00 00
>> RSP: 0018:ffffa045407cfd68 EFLAGS: 00010002
>> RAX: 0000000000000040 RBX: ffff98058e968800 RCX: 0000000000000040
>> RDX: 0000000000000000 RSI: ffffffffa2b6d1f8 RDI: ffff98058e968818
>> RBP: ffff98058e968818 R08: 0000000000000000 R09: ffff98058ec00650
>> R10: 0000000000000000 R11: ffffffffa2a49568 R12: 0000000000000001
>> R13: 0000000000000001 R14: 0000000000000246 R15: ffffa045407cfde0
>> FS:  00007f2d54054740(0000) GS:ffff980590c00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000562df2f3c976 CR3: 000000040ea00000 CR4: 00000000003406f0
>> Call Trace:
>>   resume_irqs+0x9e/0xd0
>>   dpm_noirq_end+0x5/0x10
>>   suspend_devices_and_enter+0x587/0x780
>>   pm_suspend.cold.7+0x309/0x35f
>>   state_store+0x7b/0xe0
>>   kernfs_fop_write+0x100/0x180
>>   vfs_write+0xa0/0x1a0
>>   ksys_write+0x54/0xd0
>>   do_syscall_64+0x3d/0x110
>>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> RIP: 0033:0x7f2d54141804
>> Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00
>> 00 48 8d 05 f9 5e 0d 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d
>> 00 f0 ff ff 77 54 c3 0f 1f 00 41 54 49 89 d4 55 48 89 f5 53
>> RSP: 002b:00007ffce602cb28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f2d54141804
>> RDX: 0000000000000004 RSI: 000055764b26faa0 RDI: 0000000000000001
>> RBP: 000055764b26faa0 R08: 000000000000000a R09: 0000000000000077
>> R10: 000000000000000a R11: 0000000000000246 R12: 00007f2d54213760
>> R13: 0000000000000004 R14: 00007f2d5420e760 R15: 0000000000000004
>> ---[ end trace 68323bdeb91ed863 ]---
>> xhci_hcd 0000:03:00.4: enabling device (0000 -> 0002)
>> xhci_hcd 0000:03:00.3: enabling device (0000 -> 0002)
>> xhci_hcd 0000:03:00.4: WARN: xHC restore state timeout
>> xhci_hcd 0000:03:00.4: PCI post-resume error -110!
>> xhci_hcd 0000:03:00.4: HC died; cleaning up
>> xhci_hcd 0000:03:00.3: WARN: xHC restore state timeout
>> PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -110
>> xhci_hcd 0000:03:00.3: PCI post-resume error -110!
>> PM: Device 0000:03:00.4 failed to resume async: error -110
>> xhci_hcd 0000:03:00.3: HC died; cleaning up
>> PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -110
>> PM: Device 0000:03:00.3 failed to resume async: error -110
>> Restarting tasks ...
>> usb 1-3: USB disconnect, device number 2
>> usb 3-1: USB disconnect, device number 2
>> asix 1-3:1.0 enx001c490105e9: unregister 'asix' usb-0000:03:00.3-3,
>> ASIX AX88772 USB 2.0 Ethernet
>> done.
>> PM: suspend exit
>> xhci_hcd 0000:03:00.4: xHCI host controller not responding, assume dead
>> xhci_hcd 0000:03:00.4: HC died; cleaning up
>> xhci_hcd 0000:03:00.4: Timeout while waiting for configure endpoint command
>> xhci_hcd 0000:03:00.3: xHCI host controller not responding, assume dead
>> xhci_hcd 0000:03:00.3: HC died; cleaning up
>> xhci_hcd 0000:03:00.3: Timeout while waiting for configure endpoint command
>> usb 3-2: USB disconnect, device number 3
>> usb 1-4: USB disconnect, device number 3
>>
>> I think the irq_startup() warning is unrelated - anyway the logs
>> already start complaining about xhci_hcd above that:
>>
>> xhci_hcd 0000:03:00.3: Refused to change power state, currently in D3
>> xhci_hcd 0000:03:00.4: Refused to change power state, currently in D3
>>
>> These messages indicate that Linux tried to power on the device again,
>> but the PCI power management registers indicate that it ignored the
>> request and remains in D3.
>>
>> I tried a few things like making it try D3hot instead of D3cold (which
>> is what it's aiming for even though it's not mentioned in the logs
>> above), and disabling the suspend/resume actions taken by
>> drivers/pci/pci-acpi.c without any improvement.
>>
>> Trying to sanity check other basic details I observe that this simple
>> routine (to put it in D3 then D0) also fails:
>>
>> # cd /sys/bus/pci/drivers/xhci_hcd
>> # echo -n 0000:00:03.0 > unbind
>> # setpci -s 00:00.3 CAP_PM+4.b=3
>> # setpci -s 00:00.3 CAP_PM+4.b=0
>> # echo -n 0000:00:03.0 > bind
>>
>> bind then fails with:
>>    xhci_hcd 0000:03:00.3: enabling device (0000 -> 0002)
>>    xhci_hcd 0000:03:00.3: xHCI Host Controller
>>    xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 1
>>    xhci_hcd 0000:03:00.3: Host halt failed, -19
>>    xhci_hcd 0000:03:00.3: can't setup: -19
>>    xhci_hcd 0000:03:00.3: USB bus 1 deregistered
>>    xhci_hcd 0000:03:00.3: init 0000:03:00.3 fail, -19
>>
>> As another test I was wondering if I could get Linux to put it into D3
>> and then go back into D0 without having to go through the whole
>> suspend procedure, but even when I unbind it from xhci_hcd and set
>> power/control to "auto" in /sys/bus/pci/devices/0000:03:00.3,
>> runtime_status is "suspended" but Linux still leaves the device in D0
>> - is that expected?
>>
>> Any debugging pointers much appreciated.
>>
>> acpidump:
>> https://gist.github.com/dsd/ff3dfc0f63cdd9eba4a0fbd9e776e8be
>>
>> lspci:
>> https://gist.github.com/dsd/bd9370b35defdf43680b81ecb34381d5
>>
>> Thanks
>> Daniel

