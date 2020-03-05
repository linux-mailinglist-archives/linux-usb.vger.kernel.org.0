Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DC417AEEE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 20:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgCET01 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 5 Mar 2020 14:26:27 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:41598 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbgCET01 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 14:26:27 -0500
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id BB42B15F0E; Thu,  5 Mar 2020 19:26:25 +0000 (GMT)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     linux-usb@vger.kernel.org
Subject: Crash while capturing with usbmon
Date:   Thu, 05 Mar 2020 19:26:25 +0000
Message-ID: <yw1xblpak3ha.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While trying to capture some USB traffic, this happened:

8<--- cut here ---
Unable to handle kernel paging request at virtual address ffeff000
pgd = e14505c9
[ffeff000] *pgd=6ffce861, *pte=00000000, *ppte=00000000
Internal error: Oops: 37 [#1] SMP ARM
Modules linked in: sd_mod usb_storage scsi_mod ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_filter ip6_tables xt_conntrack nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 iptable_filter ip_tables x_tables hci_uart btbcm sun4i_can edt_ft5x06 victron_cerbogx_adc can_dev victron_gxdisp_bl brcmfmac bluetooth ecdh_generic ecc cfg80211 rfkill brcmutil pwm_sun4i sun4i_emac mdio_sun4i evdev pwm_beeper
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200304-venus-1 #1
Hardware name: Allwinner sun7i (A20) Family
PC is at memcpy+0x48/0x330
LR is at 0x21564032
pc : [<c069e0a8>]    lr : [<21564032>]    psr: 20070193
sp : c0b01ba4  ip : a2cb45df  fp : ed64b180
r10: c0b04e88  r9 : 00000043  r8 : f5b57f8b
r7 : 393670c0  r6 : 08e2dffb  r5 : abb694bc  r4 : 44843523
r3 : 907b4c7f  r2 : 00000480  r1 : ffeff000  r0 : ed661b00
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 6f09806a  DAC: 00000051
Process swapper/0 (pid: 0, stack limit = 0x0bca7ef1)
Stack: (0xc0b01ba4 to 0xc0b02000)
1ba0:          00001000 00001000 ffefee00 ed4fd080 ed661900 00000700 c050c88c
1bc0: ed4fd080 ed6618c0 00001000 ed4fd200 00001040 c050cd2c 00000000 00000900
1be0: 00070193 00000000 00000000 00000080 00001000 00000000 00001000 00000000
1c00: 5e6004b0 00000000 2ab0f539 0b751234 0b7512c8 10961743 c0b04e88 ed4fd0c0
1c20: ee92996c 00000000 ed4fd200 ee929948 a0070193 00000001 ed4fd200 c050ade4
1c40: ed4fd200 00000000 00000000 00000000 ef026040 ef0266c4 00000001 c050ae1c
1c60: ed4fd200 ee932c00 00000000 c04f6788 ef026040 ef027040 ed4fd200 00000000
1c80: ef026040 c05216f0 ed4fd400 00000000 00000080 ef0266c4 ef026040 c0522624
1ca0: f08f8080 00000203 ed4fd200 00000000 c0b04e88 ef026040 ef027040 00000000
1cc0: 00000004 c0b04e88 c0b01cf8 ef026330 0000005d c051fbd8 ee3ebf00 ee3ebf00
1ce0: ed60f210 c0b38d80 c0b04e88 c0619098 00000000 00000000 00000010 10961743
1d00: ee4b1240 ef026040 000002ee a0070193 c0b01d70 00000022 c0b3ecfa c0880f9c
1d20: c0880f74 c05259b0 ee929780 ef14d468 00000000 c0178ed4 ed41a168 10961743
1d40: 00000000 ef14d400 ee4b1240 c0b04e88 ef14d468 ef14d400 00000001 ef00cc00
1d60: c0b00000 c0b01e4c 2eceb000 c0178fd0 00000000 10961743 ef14d400 ef14d468
1d80: c0b01f18 c0179064 ef14d400 c0b052b4 c0b01f18 c017d448 c0ab0c10 00000000
1da0: c0b01f18 c0178140 c0ab0c10 c017872c c0b052b4 f080200c f0802000 c0b01de0
1dc0: f0803000 c03c8fb4 c05a6014 60070113 ffffffff c0b01e14 ef79c940 c0101acc
1de0: 00000002 00000000 10961743 10961743 ef79c9f0 00000002 00000040 c0ab1940
1e00: ef79c940 0000012a c0b01e4c 2eceb000 00000003 c0b01e30 c05a6000 c05a6014
1e20: 60070113 ffffffff 00000051 bf000000 c0b04e88 ef79c940 c0ab1940 c0b3efcc
1e40: c08d9ff8 c08df484 00000008 c0b01e4c c0b01e4c c0b01e54 c0b01e54 10961743
1e60: c0ab03e8 00000000 00000003 c0b0308c ffffe000 00000100 c0b03080 40000003
1e80: c0b03080 c01022c8 c0b04e88 00000001 ef14dd00 c0aaa340 c0ab0c40 0000000a
1ea0: c087c59c c0aaa2cc 000092f6 c0b03d00 c0701aa0 00200002 00000000 ffffe000
1ec0: 00000000 00000000 00000001 ef00cc00 c0b00000 c0ab03e8 00000000 c0131bfc
1ee0: c0ab0c10 c0178730 c0b052b4 f080200c f0802000 c0b01f18 f0803000 c03c8fb4
1f00: c0108a68 60070013 ffffffff c0b01f4c 00000000 c0101acc 00000000 00129634
1f20: ef79c830 c0119aa0 ffffe000 c0b04ea8 c0b04eec 00000001 00000000 c0b04e88
1f40: c0ab03e8 00000000 c0b04f64 c0b01f68 c0108a64 c0108a68 60070013 ffffffff
1f60: 00000051 00000000 ffffe000 c01576ec 000000d1 c0b43a4c c0b43a00 c0b3ecd3
1f80: 00000000 10961743 effffc40 000000d1 c0b43a4c c0b43a00 c0a3aa3c 00000000
1fa0: c0a3aa3c effffc40 00000000 c01579e8 c0b04e88 c0a00d3c ffffffff ffffffff
1fc0: 00000000 c0a0059c 00000000 c0a3aa3c 10931143 00000000 c0a00330 00000051
1fe0: 10c0387d 100010bb 49ff5000 410fc074 10c5387d 00000000 00000000 00000000
[<c069e0a8>] (memcpy) from [<c050c88c>] (mon_copy_to_buff+0x4c/0x6c)
[<c050c88c>] (mon_copy_to_buff) from [<c050cd2c>] (mon_bin_event+0x480/0x7b8)
[<c050cd2c>] (mon_bin_event) from [<c050ade4>] (mon_bus_complete+0x50/0x6c)
[<c050ade4>] (mon_bus_complete) from [<c050ae1c>] (mon_complete+0x1c/0x34)
[<c050ae1c>] (mon_complete) from [<c04f6788>] (__usb_hcd_giveback_urb+0x64/0x10c)
[<c04f6788>] (__usb_hcd_giveback_urb) from [<c05216f0>] (musb_giveback+0x44/0x50)
[<c05216f0>] (musb_giveback) from [<c0522624>] (musb_advance_schedule+0xb4/0x278)
[<c0522624>] (musb_advance_schedule) from [<c051fbd8>] (musb_interrupt+0x128/0xcd4)
[<c051fbd8>] (musb_interrupt) from [<c05259b0>] (sunxi_musb_interrupt+0x98/0x120)
[<c05259b0>] (sunxi_musb_interrupt) from [<c0178ed4>] (__handle_irq_event_percpu+0x50/0x120)
[<c0178ed4>] (__handle_irq_event_percpu) from [<c0178fd0>] (handle_irq_event_percpu+0x2c/0x7c)
[<c0178fd0>] (handle_irq_event_percpu) from [<c0179064>] (handle_irq_event+0x44/0x68)
[<c0179064>] (handle_irq_event) from [<c017d448>] (handle_fasteoi_irq+0xa8/0x18c)
[<c017d448>] (handle_fasteoi_irq) from [<c0178140>] (generic_handle_irq+0x24/0x34)
[<c0178140>] (generic_handle_irq) from [<c017872c>] (__handle_domain_irq+0x5c/0xb4)
[<c017872c>] (__handle_domain_irq) from [<c03c8fb4>] (gic_handle_irq+0x3c/0x78)
[<c03c8fb4>] (gic_handle_irq) from [<c0101acc>] (__irq_svc+0x6c/0x90)
Exception stack(0xc0b01de0 to 0xc0b01e28)
1de0: 00000002 00000000 10961743 10961743 ef79c9f0 00000002 00000040 c0ab1940
1e00: ef79c940 0000012a c0b01e4c 2eceb000 00000003 c0b01e30 c05a6000 c05a6014
1e20: 60070113 ffffffff
[<c0101acc>] (__irq_svc) from [<c05a6014>] (net_rx_action+0x228/0x38c)
[<c05a6014>] (net_rx_action) from [<c01022c8>] (__do_softirq+0x120/0x2b0)
[<c01022c8>] (__do_softirq) from [<c0131bfc>] (irq_exit+0xcc/0xd8)
[<c0131bfc>] (irq_exit) from [<c0178730>] (__handle_domain_irq+0x60/0xb4)
[<c0178730>] (__handle_domain_irq) from [<c03c8fb4>] (gic_handle_irq+0x3c/0x78)
[<c03c8fb4>] (gic_handle_irq) from [<c0101acc>] (__irq_svc+0x6c/0x90)
Exception stack(0xc0b01f18 to 0xc0b01f60)
1f00:                                                       00000000 00129634
1f20: ef79c830 c0119aa0 ffffe000 c0b04ea8 c0b04eec 00000001 00000000 c0b04e88
1f40: c0ab03e8 00000000 c0b04f64 c0b01f68 c0108a64 c0108a68 60070013 ffffffff
[<c0101acc>] (__irq_svc) from [<c0108a68>] (arch_cpu_idle+0x38/0x3c)
[<c0108a68>] (arch_cpu_idle) from [<c01576ec>] (do_idle+0x224/0x260)
[<c01576ec>] (do_idle) from [<c01579e8>] (cpu_startup_entry+0x18/0x1c)
[<c01579e8>] (cpu_startup_entry) from [<c0a00d3c>] (start_kernel+0x3fc/0x420)
Code: ba000002 f5d1f03c f5d1f05c f5d1f07c (e8b151f8) 
---[ end trace acd3bf978189eeca ]---

It is easily reproducible.  What can I do to narrow down the cause?

-- 
Måns Rullgård
