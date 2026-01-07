Return-Path: <linux-usb+bounces-31984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0CCFD15B
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 11:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AB73306C3E8
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 10:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BFD2FCC01;
	Wed,  7 Jan 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="NsqFaXEy";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="pYy8w43y"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AB2D23A5
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780168; cv=none; b=nboRqCFSbwIIo0+JwyvsiJ0+Awkp2Te08C4pHDr5vCwNq2pKf0hVeB5G9RGODSCuXIX5PeHKxJdsAzy9jYK1NB4SbhXlvKHm0rtcMYER6V6cXoLHUJ3+L3yDWAA/YbmAgE8cLa8q0EhfQMwaBMQzC8QKFirzUGU/c6qD9NbgP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780168; c=relaxed/simple;
	bh=unOkiWMdyJyXVHOJIEnvasFjPbLABH8zZ1wYzh9cJW0=;
	h=From:Message-ID:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=T3IOeFe52QHj9aJnF320fyFY5OKHRK/1wcQISGTO4M7noRTNnxIiMoxnmMK5ZW8ETSfLj3FxyEl0dFddwFND964ZxYzJl6mQOYomdwZHUellq80ko/xXkNVJUNnUJjbx4G/s478wcCvfXVDyFmZDUfUJEHVe5wZ4tMGYMgfzJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=NsqFaXEy; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=pYy8w43y; arc=none smtp.client-ip=54.240.27.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1767780165;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:In-Reply-To:Cc:To:References;
	bh=unOkiWMdyJyXVHOJIEnvasFjPbLABH8zZ1wYzh9cJW0=;
	b=NsqFaXEy6X0R5ju1nBTBdeeg81Rv5M96+TdLGbSsSRmHOSbXVdoU6xdBqPPfFQJe
	gDqyJ4NBUJvqA/4OuqBzfOvGYgvdvbk+R2VanRQFbIF8/2dfVPAxDUTpw7CRPnRCLQc
	Ou2couuBeCtFOEUth/z4dCyyHsRHLyiqsFvAgiR0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767780165;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:In-Reply-To:Cc:To:References:Feedback-ID;
	bh=unOkiWMdyJyXVHOJIEnvasFjPbLABH8zZ1wYzh9cJW0=;
	b=pYy8w43yfHubxElV2Y11SrED0Sz6aqPqd+T7QDfLhNRaWH90HZ8bvuH2MiRQlYKQ
	0Xi4C1ACqY1MOIT/rwgmpMQF9bJjbVuoMVv9kLXmNJPG5img+EZgZeaMadgjp+6nxXH
	rQfskQtZxHxzrZ82jbmGDzPl9j0+SDg03tjXZCf0=
From: =?utf-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
Message-ID: <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_79122B66-0ED8-4AF0-8D66-5B372581311F"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
Date: Wed, 7 Jan 2026 10:02:45 +0000
In-Reply-To: <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org, 
	i@zenithal.me
To: Shuah Khan <skhan@linuxfoundation.org>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.07-54.240.27.45


--Apple-Mail=_79122B66-0ED8-4AF0-8D66-5B372581311F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Dear Shuah,

Thank you for your quick response, find enclosed responses to your =
questions:

> Can you elaborate on this "sharing the two devices" part.

I=E2=80=99m sorry, =E2=80=9CSharing" might not be the right term. =
English is not my maiden language so let me apologise.

In my infrastructure, I=E2=80=99ve one Raspberry PI acting as =E2=80=9Cusb=
 host" "server=E2=80=9D =E2=80=9Cexporting USB devices=E2=80=9D the host =
name is =E2=80=9Coraculo". At this time it is exporting 3 devices.

1. Zigbee dongle (domotics at home) connected to port 1-1.3
2. UPS 1 (MGE UPS Systems UPS) connected to port 1-1.2
2. UPS 2 (MGE UPS Systems UPS) connected to port 1-1.4

In the same local network, there are 5 servers of which 4 are running =
Proxmox and hosting several virtual machines.

One (and only one) of the virtual machines is running =E2=80=9Cnut=E2=80=9D=
 software in =E2=80=9Cnetserver=E2=80=9D mode so, that VM (called =
=E2=80=9Cnut=E2=80=9D) is acting as the =E2=80=9Cvirtual host =
controller=E2=80=9D =E2=80=9Cclient=E2=80=9D =E2=80=9Cimporting the two =
UPS systems=E2=80=9D.

Full dmesg.log file obtained from the =E2=80=9Cusb host=E2=80=9D =
=E2=80=9Cserver=E2=80=9D is attached to the end of this email. It is =
43kb of text, I=E2=80=99m not sure it it will be filtered, in that case =
I can publish on one of my web servers for you.

In order to obtain the logs I=E2=80=99d to reboot =E2=80=9Coraculo" and =
wait for =E2=80=9Cnut=E2=80=9D to reconnect.

At second 25, the Zigbee dongle is obtained from the VM running =
Zigbee2mqtt (domotics at home)
At second 404 the first UPS is obtained from the =E2=80=9Cnut=E2=80=9D =
server.
At second 423 the second UPS is onbtained from the =E2=80=9Cnut=E2=80=9D =
server and 7 seconds later the infinite loop of log messages start.

Note, the =E2=80=9Cnut=E2=80=9D service is running and apparently OK.

> I need more information to be able to figure out what's going on.

Both UPS have the same VID=3D0463 and PID=3Dffff.

Hope you have all the information required. Don=E2=80=99t hesitate to =
contact me if you need additional information including tcpdumps etc.

Regards
Ignacio


--Apple-Mail=_79122B66-0ED8-4AF0-8D66-5B372581311F
Content-Disposition: attachment;
	filename=dmesg.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="dmesg.log"
Content-Transfer-Encoding: 7bit

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 6.12.47+rpt-rpi-v8 (serge@raspberrypi.com) (aarch64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT Debian 1:6.12.47-1+rpt1 (2025-09-16)
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.1
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x000000000e000000, size 512 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x000000000e000000..0x000000002dffffff (524288 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x000000003ef73340..0x000000003ef7372b (0 KiB) nomap non-reusable nvram@0
[    0.000000] OF: reserved mem: 0x000000003ef73100..0x000000003ef732ff (0 KiB) nomap non-reusable nvram@1
[    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x00000000fbffffff]
[    0.000000] Faking node 0 at [mem 0x0000000000000000-0x000000007fffffff] (2048MB)
[    0.000000] Faking node 1 at [mem 0x0000000080000000-0x00000000fbffffff] (1984MB)
[    0.000000] NUMA: Initialized distance table, cnt=2
[    0.000000] NODE_DATA(0) allocated [mem 0x7fffd300-0x7fffffff]
[    0.000000] NODE_DATA(1) allocated [mem 0xfb7fa300-0xfb7fcfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000003b3fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000]   node   1: [mem 0x0000000080000000-0x00000000fbffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] Initmem setup node 1 [mem 0x0000000080000000-0x00000000fbffffff]
[    0.000000] On node 0, zone DMA32: 19456 pages in unavailable ranges
[    0.000000] On node 1, zone DMA32: 16384 pages in unavailable ranges
[    0.000000] percpu: Embedded 33 pages/cpu s95256 r8192 d31720 u135168
[    0.000000] pcpu-alloc: s95256 r8192 d31720 u135168 alloc=33*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 1742098
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_headphones=0 cgroup_disable=memory numa_policy=interleave nvme.max_host_mem_size_mb=0 snd_bcm2835.enable_headphones=1 snd_bcm2835.enable_hdmi=1 snd_bcm2835.enable_hdmi=0  numa=fake=2 system_heap.max_order=0 smsc95xx.macaddr=DC:A6:32:22:C1:1C vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  console=ttyAMA0,115200 console=tty1 root=PARTUUID=68d99647-02 rootfstype=ext4 fsck.repair=yes rootwait cfg80211.ieee80211_regdom=ES
[    0.000000] cgroup: Disabling memory control group subsystem
[    0.000000] mempolicy: NUMA default policy overridden to 'interleave:0-1'
[    0.000000] Fallback order for Node 0: 0 1 
[    0.000000] Fallback order for Node 1: 1 0 
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 1012736
[    0.000000] Policy zone: DMA32
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x0000000037400000-0x000000003b400000] (64MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=2
[    0.000000] ftrace: allocating 45279 entries in 177 pages
[    0.000000] ftrace: allocated 177 pages with 4 groups
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000164] Console: colour dummy device 80x25
[    0.000173] printk: legacy console [tty1] enabled
[    0.000503] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=216000)
[    0.000519] pid_max: default: 32768 minimum: 301
[    0.000579] LSM: initializing lsm=capability
[    0.001952] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc hugepage)
[    0.002835] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, vmalloc)
[    0.002903] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, vmalloc)
[    0.002940] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, vmalloc)
[    0.004545] rcu: Hierarchical SRCU implementation.
[    0.004567] rcu: 	Max phase no-delay instances is 1000.
[    0.004708] Timer migration: 2 hierarchy levels; 8 children per group; 1 crossnode level
[    0.005406] EFI services will not be available.
[    0.005585] smp: Bringing up secondary CPUs ...
[    0.005913] Detected PIPT I-cache on CPU1
[    0.005984] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.006336] Detected PIPT I-cache on CPU2
[    0.006375] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.006774] Detected PIPT I-cache on CPU3
[    0.006818] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.006874] smp: Brought up 2 nodes, 4 CPUs
[    0.006909] SMP: Total of 4 processors activated.
[    0.006915] CPU: All CPU(s) started at EL2
[    0.006930] CPU features: detected: 32-bit EL0 Support
[    0.006936] CPU features: detected: 32-bit EL1 Support
[    0.006944] CPU features: detected: CRC32 instructions
[    0.006979] alternatives: applying system-wide alternatives
[    0.007886] Memory: 3328124K/4050944K available (14336K kernel code, 2406K rwdata, 4824K rodata, 2048K init, 577K bss, 180768K reserved, 524288K cma-reserved)
[    0.008368] devtmpfs: initialized
[    0.012857] Enabled cp15_barrier support
[    0.012890] Enabled setend support
[    0.012975] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.012997] futex hash table entries: 1024 (order: 4, 65536 bytes, vmalloc)
[    0.022088] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
[    0.022130] 0 pages in range for non-PLT usage
[    0.022133] 518176 pages in range for PLT usage
[    0.022316] pinctrl core: initialized pinctrl subsystem
[    0.022739] DMI not present or invalid.
[    0.025341] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.026036] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
[    0.026150] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.026323] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.026360] audit: initializing netlink subsys (disabled)
[    0.026503] audit: type=2000 audit(0.024:1): state=initialized audit_enabled=0 res=1
[    0.026760] thermal_sys: Registered thermal governor 'step_wise'
[    0.026785] cpuidle: using governor menu
[    0.026899] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.026964] ASID allocator initialised with 32768 entries
[    0.027413] Serial: AMBA PL011 UART driver
[    0.030098] /soc/interrupt-controller@40041000: Fixed dependency cycle(s) with /soc/interrupt-controller@40041000
[    0.030555] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    0.040110] raspberrypi-firmware soc:firmware: Attached to firmware from 2025-08-20T17:02:31, variant start
[    0.044113] raspberrypi-firmware soc:firmware: Firmware hash is cd866525580337c0aee4b25880e1f5f9f674fb24
[    0.049575] /scb/pcie@7d500000: Fixed dependency cycle(s) with /scb/pcie@7d500000
[    0.049693] /scb/pcie@7d500000: Fixed dependency cycle(s) with /scb/pcie@7d500000
[    0.053002] bcm2835-dma fe007000.dma-controller: DMA legacy API manager, dmachans=0x1
[    0.053757] iommu: Default domain type: Translated
[    0.053769] iommu: DMA domain TLB invalidation policy: strict mode
[    0.054651] SCSI subsystem initialized
[    0.054747] usbcore: registered new interface driver usbfs
[    0.054774] usbcore: registered new interface driver hub
[    0.054796] usbcore: registered new device driver usb
[    0.054993] pps_core: LinuxPPS API ver. 1 registered
[    0.055001] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.055015] PTP clock support registered
[    0.055606] vgaarb: loaded
[    0.055865] clocksource: Switched to clocksource arch_sys_counter
[    0.056092] VFS: Disk quotas dquot_6.6.0
[    0.056110] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.062126] NET: Registered PF_INET protocol family
[    0.062444] IP idents hash table entries: 65536 (order: 7, 524288 bytes, vmalloc)
[    0.064354] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, vmalloc)
[    0.064413] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, vmalloc)
[    0.064441] TCP established hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
[    0.064651] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, vmalloc)
[    0.065205] TCP: Hash tables configured (established 32768 bind 32768)
[    0.065475] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes, vmalloc)
[    0.065591] UDP hash table entries: 2048 (order: 4, 65536 bytes, vmalloc)
[    0.065628] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, vmalloc)
[    0.065748] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.066129] RPC: Registered named UNIX socket transport module.
[    0.066140] RPC: Registered udp transport module.
[    0.066147] RPC: Registered tcp transport module.
[    0.066153] RPC: Registered tcp-with-tls transport module.
[    0.066159] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.066173] PCI: CLS 0 bytes, default 64
[    0.066593] Trying to unpack rootfs image as initramfs...
[    0.068998] kvm [1]: nv: 554 coarse grained trap handlers
[    0.069255] kvm [1]: IPA Size Limit: 44 bits
[    0.069933] kvm [1]: vgic interrupt IRQ9
[    0.069971] kvm [1]: Hyp nVHE mode initialized successfully
[    0.316201] Freeing initrd memory: 15636K
[    0.486359] Initialise system trusted keyrings
[    0.486671] workingset: timestamp_bits=42 max_order=20 bucket_order=0
[    0.487138] NFS: Registering the id_resolver key type
[    0.487162] Key type id_resolver registered
[    0.487169] Key type id_legacy registered
[    0.487185] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.487194] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.487566] Key type asymmetric registered
[    0.487578] Asymmetric key parser 'x509' registered
[    0.487616] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
[    0.487712] io scheduler mq-deadline registered
[    0.487721] io scheduler kyber registered
[    0.487746] io scheduler bfq registered
[    0.488261] irq_brcmstb_l2: registered L2 intc (/soc/interrupt-controller@7ef00100, parent irq: 23)
[    0.489431] pinctrl-bcm2835 fe200000.gpio: GPIO_OUT persistence: yes
[    0.498066] ledtrig-cpu: registered to indicate activity on CPUs
[    0.498915] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.498941] brcm-pcie fd500000.pcie:   No bus range found for /scb/pcie@7d500000, using [bus 00-ff]
[    0.498965] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x063fffffff -> 0x00c0000000
[    0.498987] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x00bfffffff -> 0x0400000000
[    0.500029] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.500068] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.500082] pci_bus 0000:00: root bus resource [mem 0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
[    0.500159] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400 PCIe Root Port
[    0.500183] pci 0000:00:00.0: PCI bridge to [bus 00]
[    0.500195] pci 0000:00:00.0:   bridge window [mem 0x80000000-0xbfffffff]
[    0.500249] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.501956] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    0.502072] pci_bus 0000:01: supply vpcie3v3 not found, using dummy regulator
[    0.502166] pci_bus 0000:01: supply vpcie3v3aux not found, using dummy regulator
[    0.502198] pci_bus 0000:01: supply vpcie12v not found, using dummy regulator
[    0.603884] brcm-pcie fd500000.pcie: clkreq-mode set to default
[    0.605959] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
[    0.606095] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330 PCIe Endpoint
[    0.606154] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.606247] pci 0000:01:00.0: ASPM: VL805 fixup applied
[    0.606335] pci 0000:01:00.0: PME# supported from D0 D3cold
[    0.611926] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.611952] pci 0000:00:00.0: bridge window [mem 0x600000000-0x6000fffff]: assigned
[    0.611965] pci 0000:01:00.0: BAR 0 [mem 0x600000000-0x600000fff 64bit]: assigned
[    0.612012] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.612021] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.612033] pci_bus 0000:00: resource 4 [mem 0x600000000-0x63fffffff]
[    0.612042] pci_bus 0000:01: resource 1 [mem 0x600000000-0x6000fffff]
[    0.612182] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.612260] pcieport 0000:00:00.0: PME: Signaling with IRQ 27
[    0.612431] pcieport 0000:00:00.0: AER: enabled with IRQ 27
[    0.616046] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    0.616961] iproc-rng200 fe104000.rng: hwrng registered
[    0.617063] vc-mem: phys_addr:0x00000000 mem_base=0x3ec00000 mem_size:0x40000000(1024 MiB)
[    0.621745] brd: module loaded
[    0.624415] loop: module loaded
[    0.624775] Loading iSCSI transport class v2.0-870.
[    0.626693] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
[    0.823904] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
[    0.824474] usbcore: registered new interface driver lan78xx
[    0.824503] usbcore: registered new interface driver smsc95xx
[    0.825361] xhci_hcd 0000:01:00.0: enabling device (0000 -> 0002)
[    0.825455] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    0.825476] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
[    0.826704] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0300240000000890
[    0.827251] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    0.827264] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    0.827277] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[    0.827407] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.12
[    0.827420] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.827430] usb usb1: Product: xHCI Host Controller
[    0.827437] usb usb1: Manufacturer: Linux 6.12.47+rpt-rpi-v8 xhci-hcd
[    0.827445] usb usb1: SerialNumber: 0000:01:00.0
[    0.827730] hub 1-0:1.0: USB hub found
[    0.827783] hub 1-0:1.0: 1 port detected
[    0.828148] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.12
[    0.828161] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.828170] usb usb2: Product: xHCI Host Controller
[    0.828178] usb usb2: Manufacturer: Linux 6.12.47+rpt-rpi-v8 xhci-hcd
[    0.828185] usb usb2: SerialNumber: 0000:01:00.0
[    0.828387] hub 2-0:1.0: USB hub found
[    0.828428] hub 2-0:1.0: 4 ports detected
[    0.828882] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    0.828933] dwc_otg: FIQ enabled
[    0.828937] dwc_otg: NAK holdoff enabled
[    0.828939] dwc_otg: FIQ split-transaction FSM enabled
[    0.828943] Module dwc_common_port init
[    0.829468] usbcore: registered new interface driver uas
[    0.829510] usbcore: registered new interface driver usb-storage
[    0.829757] mousedev: PS/2 mouse device common for all mice
[    0.831211] sdhci: Secure Digital Host Controller Interface driver
[    0.831229] sdhci: Copyright(c) Pierre Ossman
[    0.831315] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.831483] hid: raw HID events driver (C) Jiri Kosina
[    0.831553] usbcore: registered new interface driver usbhid
[    0.831561] usbhid: USB HID core driver
[    0.835275] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 (0,8000003f) counters available
[    0.835942] NET: Registered PF_PACKET protocol family
[    0.835997] Key type dns_resolver registered
[    0.846915] registered taskstats version 1
[    0.847072] Loading compiled-in X.509 certificates
[    0.850989] Demotion targets for Node 0: null
[    0.851009] Demotion targets for Node 1: null
[    0.851491] Key type .fscrypt registered
[    0.851502] Key type fscrypt-provisioning registered
[    0.856562] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    0.856922] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
[    0.857080] uart-pl011 fe201000.serial: there is not valid maps for state default
[    0.857325] uart-pl011 fe201000.serial: cts_event_workaround enabled
[    0.857520] fe201000.serial: ttyAMA0 at MMIO 0xfe201000 (irq = 39, base_baud = 0) is a PL011 rev3
[    0.857554] printk: legacy console [ttyAMA0] enabled
[    2.489111] of_cfs_init
[    2.491754] of_cfs_init: OK
[    2.494832] clk: Disabling unused clocks
[    2.498948] PM: genpd: Disabling unused power domains
[    2.528495] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] using ADMA
[    2.538560] Freeing unused kernel memory: 2048K
[    2.543260] Run /init as init process
[    2.546975]   with arguments:
[    2.546979]     /init
[    2.546982]   with environment:
[    2.546985]     HOME=/
[    2.546987]     TERM=linux
[    2.607906] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    2.652071] mmc0: new ultra high speed DDR50 SDXC card at address aaaa
[    2.659262] mmcblk0: mmc0:aaaa SC64G 59.5 GiB
[    2.672049]  mmcblk0: p1 p2
[    2.676140] mmcblk0: mmc0:aaaa SC64G 59.5 GiB (quirks 0x0000c000)
[    2.754533] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.21
[    2.762842] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    2.770016] usb 1-1: Product: USB2.0 Hub
[    2.775918] hub 1-1:1.0: USB hub found
[    2.779952] hub 1-1:1.0: 4 ports detected
[    2.862809] brcmstb-i2c fef04500.i2c:  @97500hz registered in polling mode
[    2.871706] brcmstb-i2c fef09500.i2c:  @97500hz registered in polling mode
[    3.071949] usb 1-1.2: new full-speed USB device number 3 using xhci_hcd
[    3.279461] EXT4-fs (mmcblk0p2): orphan cleanup on readonly fs
[    3.285882] EXT4-fs (mmcblk0p2): mounted filesystem 21724cc6-e5a3-48a1-8643-7917dba3a9fb ro with ordered data mode. Quota mode: none.
[    3.759464] systemd[1]: System time advanced to timestamp on /var/lib/systemd/timesync/clock: Wed 2026-01-07 10:12:09 CET
[    3.855039] usb 1-1.2: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 1.00
[    3.863446] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=4
[    3.870773] usb 1-1.2: Product: Ellipse PRO
[    3.874976] usb 1-1.2: Manufacturer: EATON
[    3.879090] usb 1-1.2: SerialNumber: G364T25069
[    3.895067] NET: Registered PF_INET6 protocol family
[    3.900787] Segment Routing with IPv6
[    3.904491] In-situ OAM (IOAM) with IPv6
[    3.970958] systemd[1]: systemd 257.9-1~deb13u1 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[    4.005274] systemd[1]: Detected architecture arm64.
[    4.026079] systemd[1]: Hostname set to <oraculo>.
[    4.240060] systemd[1]: bpf-restrict-fs: BPF LSM hook not enabled in the kernel, BPF LSM not supported.
[    4.249832] systemd[1]: Using hardware watchdog 'Broadcom BCM2835 Watchdog timer', version 0, device /dev/watchdog0
[    4.260296] systemd[1]: Watchdog running with a hardware timeout of 1min.
[    4.402005] zram_generator::config[220]: zram0: system has too much memory (3796MB), limit is 0MB, ignoring.
[    5.345434] systemd[1]: Queued start job for default target multi-user.target.
[    5.406078] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    5.414509] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[    5.423254] systemd[1]: Created slice system-rpi\x2dsetup\x2dloop.slice - Slice /system/rpi-setup-loop.
[    5.433556] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[    5.443212] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    5.452884] systemd[1]: Created slice system-systemd\x2djournald.slice - Slice /system/systemd-journald.
[    5.463231] systemd[1]: Created slice system-systemd\x2djournald\x2dsync.slice - Slice /system/systemd-journald-sync.
[    5.474734] systemd[1]: Created slice system-systemd\x2djournald\x2dvarlink.slice - Slice /system/systemd-journald-varlink.
[    5.486730] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
[    5.497384] systemd[1]: Created slice user.slice - User and Session Slice.
[    5.504547] systemd[1]: Started systemd-ask-password-console.path - Dispatch Password Requests to Console Directory Watch.
[    5.515810] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    5.526770] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    5.539467] systemd[1]: Expecting device dev-disk-by\x2dpartuuid-68d99647\x2d01.device - /dev/disk/by-partuuid/68d99647-01...
[    5.550878] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
[    5.558115] systemd[1]: Expecting device dev-zram0.device - /dev/zram0...
[    5.565075] systemd[1]: Reached target paths.target - Path Units.
[    5.571295] systemd[1]: Reached target remote-fs.target - Remote File Systems.
[    5.578632] systemd[1]: Reached target slices.target - Slice Units.
[    5.589168] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    5.598057] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    5.607063] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    5.616297] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    5.623876] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    5.637672] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    5.651380] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    5.659725] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    5.668039] systemd[1]: dev-hugepages.mount - Huge Pages File System was skipped because of an unmet condition check (ConditionPathExists=/sys/kernel/mm/hugepages).
[    5.687025] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    5.697677] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[    5.708113] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    5.744306] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    5.755566] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[    5.767088] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    5.779140] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    5.790503] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    5.804369] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    5.819496] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    5.827709] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    5.844117] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    5.869192] fuse: init (API version 7.41)
[    5.870472] systemd[1]: Starting systemd-journald.service - Journal Service...
[    5.892369] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    5.900659] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    5.918562] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    5.928234] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    5.948098] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    5.971368] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    5.984872] zram: Added device: zram0
[    5.986213] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    5.999588] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[    6.007853] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    6.015389] systemd-journald[305]: Collecting audit messages is disabled.
[    6.022957] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    6.026231] EXT4-fs (mmcblk0p2): re-mounted 21724cc6-e5a3-48a1-8643-7917dba3a9fb r/w.
[    6.041417] systemd[1]: Finished keyboard-setup.service - Set the console keyboard layout.
[    6.050956] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    6.060775] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    6.068333] systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[    6.080665] systemd[1]: Started systemd-journald.service - Journal Service.
[    6.194022] systemd-journald[305]: Received client request to flush runtime journal.
[    6.511341] loop0: detected capacity change from 0 to 4194304
[    6.836115] zram: setup backing device /dev/disk/by-backingfile/var-swap
[    6.851529] zram0: detected capacity change from 0 to 4194304
[    7.122209] Adding 2097148k swap on /dev/zram0.  Priority:100 extents:1 across:2097148k SS
[    7.232009] mc: Linux media interface: v0.10
[    7.280646] rpi-gpiomem fe200000.gpiomem: window base 0xfe200000 size 0x00001000
[    7.281151] rpi-gpiomem fe200000.gpiomem: initialised 1 regions as /dev/gpiomem
[    7.289980] videodev: Linux video capture interface: v2.00
[    7.309835] snd_bcm2835: module is from the staging directory, the quality is unknown, you have been warned.
[    7.360296] bcm2835-audio bcm2835-audio: card created with 8 channels
[    7.410303] vc_sm_cma: module is from the staging directory, the quality is unknown, you have been warned.
[    7.464199] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
[    7.464218] [vc_sm_connected_init]: start
[    7.476045] [vc_sm_connected_init]: installed successfully
[    7.490860] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[    7.502638] bcm2835_codec: module is from the staging directory, the quality is unknown, you have been warned.
[    7.508182] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
[    7.508216] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
[    7.515703] bcm2835_isp: module is from the staging directory, the quality is unknown, you have been warned.
[    7.515856] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
[    7.518248] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
[    7.527840] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
[    7.528229] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
[    7.530487] rpi-hevc-dec feb00000.codec: Device registered as /dev/video19
[    7.530847] bcm2835_v4l2: module is from the staging directory, the quality is unknown, you have been warned.
[    7.532814] bcm2835-isp bcm2835-isp: Device node output[0] registered as /dev/video13
[    7.533349] bcm2835-codec bcm2835-codec: Device registered as /dev/video18
[    7.533388] bcm2835-codec bcm2835-codec: Loaded V4L2 image_fx
[    7.533479] bcm2835-isp bcm2835-isp: Device node capture[0] registered as /dev/video14
[    7.534901] bcm2835-isp bcm2835-isp: Device node capture[1] registered as /dev/video15
[    7.536495] bcm2835-isp bcm2835-isp: Device node stats[2] registered as /dev/video16
[    7.536524] bcm2835-isp bcm2835-isp: Register output node 0 with media controller
[    7.536534] bcm2835-isp bcm2835-isp: Register capture node 1 with media controller
[    7.536541] bcm2835-isp bcm2835-isp: Register capture node 2 with media controller
[    7.536546] bcm2835-isp bcm2835-isp: Register capture node 3 with media controller
[    7.538737] bcm2835-codec bcm2835-codec: Device registered as /dev/video31
[    7.538789] bcm2835-codec bcm2835-codec: Loaded V4L2 encode_image
[    7.548786] bcm2835-isp bcm2835-isp: Device node output[0] registered as /dev/video20
[    7.550845] bcm2835-isp bcm2835-isp: Device node capture[0] registered as /dev/video21
[    7.551557] bcm2835-isp bcm2835-isp: Device node capture[1] registered as /dev/video22
[    7.551757] bcm2835-isp bcm2835-isp: Device node stats[2] registered as /dev/video23
[    7.551775] bcm2835-isp bcm2835-isp: Register output node 0 with media controller
[    7.551788] bcm2835-isp bcm2835-isp: Register capture node 1 with media controller
[    7.551801] bcm2835-isp bcm2835-isp: Register capture node 2 with media controller
[    7.551807] bcm2835-isp bcm2835-isp: Register capture node 3 with media controller
[    7.551974] bcm2835-isp bcm2835-isp: Loaded V4L2 bcm2835-isp
[    7.552912] v3d fec00000.v3d: [drm] Transparent Hugepage support is recommended for optimal performance on this platform!
[    7.553881] [drm] Initialized v3d 1.0.0 for fec00000.v3d on minor 0
[    7.607128] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
[    7.619367] Registered IR keymap rc-cec
[    7.619495] rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
[    7.619607] input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input0
[    7.764144] hid-generic 0003:0463:FFFF.0001: hiddev96,hidraw0: USB HID v1.10 Device [EATON Ellipse PRO] on usb-0000:01:00.0-1.2/input0
[    7.772137] input: vc4-hdmi-0 HDMI Jack as /devices/platform/soc/fef00700.hdmi/sound/card1/input1
[    7.772441] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
[    7.776427] Registered IR keymap rc-cec
[    7.776531] rc rc1: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc/rc1
[    7.776655] input: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc/rc1/input2
[    7.788733] input: vc4-hdmi-1 HDMI Jack as /devices/platform/soc/fef05700.hdmi/sound/card2/input3
[    7.789085] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
[    7.789829] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
[    7.790087] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
[    7.790323] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
[    7.790539] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
[    7.790670] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
[    7.790892] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
[    7.798168] [drm] Initialized vc4 0.0.0 for gpu on minor 1
[    7.798535] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    7.802269] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    7.802360] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    7.840433] usb 1-1.3: new full-speed USB device number 4 using xhci_hcd
[    7.954711] usb 1-1.3: New USB device found, idVendor=1a86, idProduct=55d4, bcdDevice= 4.42
[    7.954737] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    7.954744] usb 1-1.3: Product: SONOFF Zigbee 3.0 USB Dongle Plus V2
[    7.954750] usb 1-1.3: Manufacturer: ITEAD
[    7.954755] usb 1-1.3: SerialNumber: 20230508092111
[    8.039907] usb 1-1.4: new full-speed USB device number 5 using xhci_hcd
[    9.947645] usb 1-1.4: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 1.00
[    9.947667] usb 1-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=4
[    9.947673] usb 1-1.4: Product: Ellipse ECO
[    9.947679] usb 1-1.4: Manufacturer: EATON
[    9.947683] usb 1-1.4: SerialNumber: 000000000
[   12.630119] bcmgenet fd580000.ethernet: configuring instance for external RGMII (RX delay)
[   12.633350] bcmgenet fd580000.ethernet eth0: Link is Down
[   13.234105] hid-generic 0003:0463:FFFF.0002: hiddev97,hidraw1: USB HID v10.10 Device [EATON Ellipse ECO] on usb-0000:01:00.0-1.4/input0
[   13.330679] cdc_acm 1-1.3:1.0: ttyACM0: USB ACM device
[   13.330815] usbcore: registered new interface driver cdc_acm
[   13.330822] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[   16.708409] bcmgenet fd580000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
[   17.102047] usbcore: registered new device driver usbip-host
[   17.170368] usbip-host 1-1.3: usbip-host: register new device (bus 1 dev 4)
[   17.186686] usbip-host 1-1.2: usbip-host: register new device (bus 1 dev 3)
[   17.189936] usbip-host 1-1.4: usbip-host: register new device (bus 1 dev 5)
[   25.816176] usbip-host 1-1.3: stub up
[   77.780820] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.783744] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.784812] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.787354] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.788313] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.791369] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.792217] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.795259] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.795994] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.796613] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.800416] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.801106] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.801731] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.802333] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.802923] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.803537] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[   77.804231] usbip-host 1-1.3: unlinked by a call to usb_unlink_urb()
[  404.079400] usbip-host 1-1.2: stub up
[  423.274817] usbip-host 1-1.4: stub up
[  423.858510] usbip-host 1-1.4: endpoint 0 is stalled
[  423.859753] usbip-host 1-1.4: endpoint 0 is stalled
[  423.860989] usbip-host 1-1.4: endpoint 0 is stalled
[  430.031190] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  430.921802] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  432.922766] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  434.835170] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  434.924193] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  435.586580] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  436.925315] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  437.588010] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  438.926746] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  439.589470] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  440.927179] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  441.590782] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  442.928404] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  443.591830] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  444.929854] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  445.592772] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  446.930998] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  447.594052] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  448.932474] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  449.595514] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  450.932924] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  451.596631] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  452.934594] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  453.597826] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  454.935767] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  455.599493] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  456.937148] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  457.600392] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  458.938464] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  459.601733] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  460.940002] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  461.603034] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  462.940932] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  463.604357] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  464.942277] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  465.605652] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  466.943682] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  467.606777] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  468.944012] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  469.607849] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  470.944960] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  471.609180] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  472.946384] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  473.610477] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  474.947607] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  475.611537] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  476.949187] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  477.613018] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  478.950224] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  479.614492] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  480.951842] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  481.615663] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  482.952837] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  483.616701] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  484.954091] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  485.618130] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  486.955583] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  487.619093] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  488.957070] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  489.620661] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  490.958395] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  491.621951] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  492.959956] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  493.622976] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  494.961100] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  495.624476] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  496.962121] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  497.625201] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  498.963357] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  499.626979] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  500.964816] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  501.627997] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  502.966020] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  503.629398] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  504.967284] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  505.630627] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  506.968752] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  507.631710] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  508.970375] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  509.633201] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  510.971422] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  511.634518] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  512.972814] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[  513.635612] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[  514.974024] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()

--Apple-Mail=_79122B66-0ED8-4AF0-8D66-5B372581311F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> El 6 ene 2026, a las 22:17, Shuah Khan <skhan@linuxfoundation.org> =
escribi=C3=B3:
>=20
> On 1/6/26 03:44, Ignacio Hernandez-Ros wrote:
>> Hello maintainers,
>> I would like to submit a bug report related to the usbip-host module. =
Here is the context:
>> 1. I=E2=80=99ve two equal UPS devices attached to a single Raspberry =
PI. The Raspberry run Debian trixie and is sharing the two devices with =
same VID and PID but different serial number and port attached (one is =
at 1-1.2 and the other is at 1-1.4)
>=20
> Can you elaborate on this "sharing the two devices" part.
>=20
>> 2. Launching =E2=80=98dmesg=E2=80=99 in the host shows this result:
>=20
> Please send the full demsg and also how the devices are
> attached?
>> =E2=80=A6
>> [63386.686712] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>> [63387.003578] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>> [63388.688086] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>> [63389.004953] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>> [63390.689275] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>> [63391.006049] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>> =E2=80=A6
>> Every second or so, there is a new line in the log.
>> 3. Looking at the possible reasons for this problem I dig into =
https://github.com/torvalds/linux/blob/7f98ab9da046865d57c102fd3ca9669a298=
45f67/drivers/usb/usbip/stub_rx.c#L635
>> And the source of the issue (Note: I=E2=80=99m not 100% sure about =
this statement ) might be related to the flag =E2=80=9Cis_tweaked=E2=80=9D=
 that is not distinct per device but common to all num_urbs.
>=20
> I need more information to be able to figure out what's going on.
>=20
> thanks,
> -- Shuah


--Apple-Mail=_79122B66-0ED8-4AF0-8D66-5B372581311F--

