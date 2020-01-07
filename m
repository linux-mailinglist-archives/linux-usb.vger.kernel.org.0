Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5EC2132926
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgAGOo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 09:44:28 -0500
Received: from comms.puri.sm ([159.203.221.185]:59262 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgAGOo2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jan 2020 09:44:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 82A42E0415;
        Tue,  7 Jan 2020 06:44:25 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FUnWF97deTI6; Tue,  7 Jan 2020 06:44:24 -0800 (PST)
Subject: Fwd: [BUG REPORT] usb: dwc3: rmmod blocks (g_multi)
References: <24881744-76db-1c1f-1476-5bd68a21013b@puri.sm>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
Autocrypt: addr=martin.kepplinger@puri.sm; keydata=
 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
 ekMtxgNYb/8oDry09UFHbGHLsWn6oBo=
X-Forwarded-Message-Id: <24881744-76db-1c1f-1476-5bd68a21013b@puri.sm>
Message-ID: <743ee0c2-c02e-17fc-ecc5-66ce227735d3@puri.sm>
Date:   Tue, 7 Jan 2020 15:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <24881744-76db-1c1f-1476-5bd68a21013b@puri.sm>
Content-Type: multipart/mixed;
 boundary="------------32544C56779409E084D2D58C"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------32544C56779409E084D2D58C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

forwarding to linux-usb with traces in compressed tarball:


-------- Forwarded Message --------
Subject: [BUG REPORT] usb: dwc3: rmmod blocks (g_multi)
Date: Tue, 7 Jan 2020 14:43:39 +0100
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: Felipe Balbi <balbi@kernel.org>
CC: linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>

hi,

(for the record, I've written before:
https://lore.kernel.org/linux-usb/38edc05e-680b-d881-49fc-e8230a93b2c8@puri.sm/
and this is an updated version. the problems persist. let's focus on
rmmod only here)

I'm running this tree
https://source.puri.sm/martin.kepplinger/linux-next/tree/next-20200107/librem5
which is just next-20200107 with this defconfig:
https://source.puri.sm/martin.kepplinger/linux-next/blob/next-20200107/librem5/arch/arm64/configs/librem5_defconfig
on the librem5-devkit:

dwc3 dual mode is configured and I load g_multi with "options g_multi
file=/var/lib/mass_storage_dummy stall=0" during boot. Actually, rmmod
g_multi doesn't work either and results in similar hangs.

USB connected
-------------

root@pureos:/home/purism# rmmod dwc3
[ 2614.500026] dwc3 38100000.usb: request 000000000c87367b was not
queued to ep3in

[ 2780.136874] INFO: task rmmod:9031 blocked for more than 120 seconds.
[ 2780.143265]       Tainted: G        W
5.5.0-rc5-next-20200107-00013-gbf5ee18fb9e0 #58
[ 2780.151861] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.

the trace is appended. the messages around the error message timestamp
above are:

rmmod-9031  [002] d..1  2614.499798: dwc3_readl: addr 00000000d1c7e512
value 00050c08
           rmmod-9031  [002] d..1  2614.499800: dwc3_gadget_ep_cmd:
ep2in: cmd 'End Transfer' [50c08] params 00000000 00000000 00000000 -->
status: Timed Out
           rmmod-9031  [002] d..1  2614.499802: dwc3_readl: addr
00000000e118d0b0 value 40102400
           rmmod-9031  [002] d..1  2614.499803: dwc3_writel: addr
00000000e118d0b0 value 40102540
           rmmod-9031  [002] d..1  2614.499885: dwc3_readl: addr
000000004b6b2caf value 00000af3
           rmmod-9031  [002] d..1  2614.499887: dwc3_writel: addr
000000004b6b2caf value 00000ad3
           rmmod-9031  [002] ....  2614.499994: dwc3_free_request:
ep2in: req 000000009ec6ea8a length 8/8 zsI ==> 0
           rmmod-9031  [002] d..1  2614.500005: dwc3_ep_dequeue: ep3in:
req 000000000c87367b length 0/0 zsI ==> 0
           rmmod-9031  [002] d..1  2614.507353: dwc3_free_request:
ep3in: req 000000000c87367b length 0/0 zsI ==> 0
           rmmod-9031  [002] d..1  2614.507608: dwc3_gadget_ep_disable:
ep2out: mps 512/1024 streams 15 burst 0 ring 27/11 flags E:swBp:>
           rmmod-9031  [002] d..1  2614.507615: dwc3_readl: addr
00000000e118d0b0 value 40102540
           rmmod-9031  [002] d..1  2614.507618: dwc3_writel: addr
00000000e118d0b0 value 40102400
           rmmod-9031  [002] d..1  2614.507619: dwc3_writel: addr
00000000ee77d00b value 00000000

it doesn't hang the system, just the process.


USB disconnected
----------------

root@pureos:/home/purism# rmmod dwc3
[  242.655656] INFO: task rmmod:1024 blocked for more than 120 seconds.
[  242.662072]       Not tainted
5.5.0-rc5-next-20200107-00013-gbf5ee18fb9e0 #58
[  242.669254] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.

again, the (short) trace is appended. no error message is printed.

the latter case would be more interesting to me, but in any case: Do you
know what could go wrong here? Below some more tests:

g_zero / USB connected
-------------------------------
try to load/unload g_zero only:

root@pureos:/home/purism# modprobe g_zero
[  156.277956] dwc3 38100000.usb: failed to enable ep0out
root@pureos:/home/purism# rmmod g_zero
[  159.293698] dwc3 38100000.usb: timed out waiting for SETUP phase

and again, the trace "g_zero_usb_connected" is appended. rmmod does NOT
hang (but take a noticable amount of time < 1 sec though).

g_zero / USB disconnected
-------------------------
works. trace still appended. so there should be a problem with g_multi...

I'm happy for any hints or further questions!

thanks,

                                   martin




g_serial / USB connected
------------------------
lastly, I just modprobe and rmmod g_serial, which resulted in a kernal
panic and I couldn't copy the trace -.- (can easily reproduce this. the
second run went exactly like "g_zero", but I can't see a /dev/ttyACM
device on my host after modprobe...)

[   37.195773] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000160
[   37.195831] device: 'ttyGS0': device_unregister
[   37.204564] Mem abort info:
[   37.204567]   ESR = 0x96000004
[   37.204572]   EC = 0x25: DABT (current EL), IL = 32 bits
[   37.204575]   SET = 0, FnV = 0
[   37.204577]   EA = 0, S1PTW = 0
[   37.204579] Data abort info:
[   37.204582]   ISV = 0, ISS = 0x00000004

Message from syslogd@pureos at Jan  7 13:35:20 ...
 kernel:[   37.204602] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   37.204585]   CM = 0, WnR = 0
[   37.204590] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000e6d93000
[   37.204593] [0000000000000160] pgd=0000000000000000
[   37.204602] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   37.204606] Modules linked in: usb_f_acm u_serial g_serial(-)
libcomposite qmi_wwan cdc_wdm usbnet mii option usb_wwan usbserial
rfkill caam_jr mousedev caamhash_desc caamalg_desc aes_ce_blk
crypto_simd st_lsm6dsx_spi crct10dif_ce ghash_ce sha2_ce sha1_ce
gpio_vibra tcpci st_magn_spi st_sensors_spi tcpm roles st_magn_i2c
st_magn st_sensors_i2c st_sensors st_lsm6dsx_i2c st_lsm6dsx
industrialio_triggered_buffer goodix typec kfifo_buf bq25890_charger
caam imx2_wdt error imx_sdma watchdog virt_dma ip_tables x_tables ipv6
nf_defrag_ipv6 xhci_plat_hcd xhci_hcd usbcore clk_bd718x7 snvs_pwrkey
dwc3 ulpi udc_core usb_common phy_fsl_imx8mq_usb
[   37.209387] PM: Removing info for No Bus:ttyGS0
[   37.212024] CPU: 3 PID: 1 Comm: systemd Tainted: G        W
5.5.0-rc5-next-20200107-00014-gc2b528ade7a0 #59
[   37.335458] Hardware name: Purism Librem 5 devkit (DT)
[   37.340600] pstate: 80000085 (Nzcv daIf -PAN -UAO)
[   37.345402] pc : _raw_spin_unlock_irqrestore+0x230/0x298
[   37.350716] lr : _raw_spin_lock_irq+0x2c/0x80
[   37.355073] sp : ffff80001003b900
[   37.358388] x29: ffff80001003b900 x28: ffff00008177e000
[   37.363703] x27: ffff00008177e000 x26: ffff800010a21b08
[   37.369018] x25: 0000000000020902 x24: ffff0000a05d8b20
[   37.374332] x23: ffff000081649900 x22: ffff00008177e000
[   37.379647] x21: 0000000000000160 x20: ffff800010e987c8
[   37.384961] x19: 0000000000000160 x18: 0000000000000001
[   37.390275] x17: 0000000000000000 x16: 0000000000000000
[   37.395590] x15: ffffffffffffffff x14: ffff800010e987c8
[   37.400904] x13: ffff8000111df000 x12: ffff800010000000
[   37.406219] x11: ffff800010cd6000 x10: 0140000000000000
[   37.411533] x9 : ffff800010993cfc x8 : ffff8000113d8260
[   37.416847] x7 : ffff00008177e210 x6 : ffff80001003b8c0
[   37.422161] x5 : 0000000000000001 x4 : 0000000000000001
[   37.427475] x3 : 0000000000000001 x2 : 0000000000000001
[   37.432789] x1 : 0000000000000000 x0 : ffff800010993cfc
[   37.438104] Call trace:
[   37.440555]  _raw_spin_unlock_irqrestore+0x230/0x298
[   37.445530]  gs_close+0x48/0x248 [u_serial]
[   37.449718]  tty_release+0x110/0x5e0
[   37.453294]  tty_open+0x120/0x428
[   37.456614]  chrdev_open+0xac/0x1a8
[   37.460105]  do_dentry_open+0x118/0x3a8
[   37.463942]  vfs_open+0x30/0x38
[   37.467088]  path_openat+0x2e4/0x1258
[   37.470752]  do_filp_open+0x80/0xf8
[   37.474243]  do_sys_openat2+0x200/0x298
[   37.478080]  do_sys_open+0x64/0xa8
[   37.481483]  __arm64_sys_openat+0x28/0x30
[   37.485498]  el0_svc_common.constprop.3+0x98/0x170
[   37.490291]  el0_svc_handler+0x20/0x28
[   37.494044]  el0_sync_handler+0x134/0x1a0
[   37.498056]  el0_sync+0x140/0x180
[   37.501377] Code: 88037e62 35ffff83 17fffec8 f9800271 (885ffe60)
[   37.507474] ---[ end trace 38cceb5162e73ede ]---
[   37.512095] note: systemd[1] exited with preempt_count 1
[   37.517410] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[   37.525071] SMP: stopping secondary CPUs
[   37.529001] Kernel Offset: disabled
[   37.532492] CPU features: 0x00002,2000200c
[   37.536588] Memory Limit: none
[   37.539648] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---


--------------32544C56779409E084D2D58C
Content-Type: application/x-xz;
 name="traces.tar.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="traces.tar.xz"

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
IBuxxGf7AgAAAAAEWVo=
--------------32544C56779409E084D2D58C--
