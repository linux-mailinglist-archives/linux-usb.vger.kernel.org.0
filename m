Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00C6DF457
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 13:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbjDLLzG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 07:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjDLLzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 07:55:04 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96C6765B8
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:
        Content-Type; bh=VY5vMpjnNlyF0O+wXC1YpqWkBwUifFQvtKyidMV5JjE=;
        b=pTFjd1EbJFPfdb72wG7wc67SbvlkrmfKP3FOBKf+sttRzDfBlv29TyNL9HdjBa
        4PMuKekwvBqPUhBEaO/IS61mmNuL9451GykXRG2BFzLnqZSfy2l+IPYpR15pS3FI
        L/euPmqe5wbB+J5PH5XTa8XjlxtoioyzMybKUrHp2G/uw=
Received: from [172.21.25.67] (unknown [218.201.129.19])
        by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wA3Kw3zmzZkGsEeBQ--.59479S2;
        Wed, 12 Apr 2023 19:54:28 +0800 (CST)
Message-ID: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
Date:   Wed, 12 Apr 2023 19:54:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
From:   qianfan <qianfanguijin@163.com>
Subject: BUG: linux 5.15.0 hang on usb_wwan_indat_callback
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3Kw3zmzZkGsEeBQ--.59479S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfZr18tF15WF4rCrWDXFWrXwb_yoW5JryxCo
        W5JF1UXa1kWrn8ta48C3WDt34rJw1vy3W7tF1jkw4UC3W7ZrWDtryjyr1rJa1rXa4UXFyY
        yr4UKwn5ua1fta97n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnrWFDUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBVP7VXl6OtLpgABs0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi:

The linux system maybe hang in usb_wwan_indat_callback when the usb modem
sudden disconnected. This problem has a very small probability and can not
make it repeat easy.

hardware: allwinner R40 with 4 cortex-a7
software: linux 5.15.0

Next is the log capture form usb serial console:

[   82.700600] option 4-1:1.0: GSM modem (1-port) converter detected
[   82.720622] usb 4-1: GSM modem (1-port) converter now attached to ttyUSB0
[   82.734545] option 4-1:1.1: GSM modem (1-port) converter detected
[   82.758139] usb 4-1: GSM modem (1-port) converter now attached to ttyUSB1
[   82.768024] option 4-1:1.2: GSM modem (1-port) converter detected
[   82.776918] usb 4-1: GSM modem (1-port) converter now attached to ttyUSB2
[   82.822713] cdc_ether 4-1:1.3 usb0: register 'cdc_ether' at 
usb-1c1c000.usb-1, CDC Ethernet Device, 02:0c:29:a3:9b:6d

[  113.950770] rcu: INFO: rcu_sched self-detected stall on CPU
[  113.958037] rcu:     0-....: (2590 ticks this GP) 
idle=89f/1/0x40000004 softirq=7864/7864 fqs=598
[  114.005867]     (t=2605 jiffies g=8609 q=1090)
[  114.011438] NMI backtrace for cpu 0
[  114.015988] CPU: 0 PID: 85 Comm: sugov:0 Tainted: G        W O      
5.15.0 #1
[  114.024477] Hardware name: Wisdom T3 based CCT Family
[  114.030640] [<c01100d4>] (unwind_backtrace) from [<c010bf60>] 
(show_stack+0x10/0x14)
[  114.040122] [<c010bf60>] (show_stack) from [<c0bcb940>] 
(dump_stack_lvl+0x58/0x70)
[  114.049245] [<c0bcb940>] (dump_stack_lvl) from [<c0662c8c>] 
(nmi_cpu_backtrace+0x120/0x140)
[  114.059144] [<c0662c8c>] (nmi_cpu_backtrace) from [<c0662dc8>] 
(nmi_trigger_cpumask_backtrace+0x11c/0x164)
[  114.070338] [<c0662dc8>] (nmi_trigger_cpumask_backtrace) from 
[<c0bc8b18>] (rcu_dump_cpu_stacks+0x128/0x20c)
[  114.081837] [<c0bc8b18>] (rcu_dump_cpu_stacks) from [<c01c89a0>] 
(rcu_sched_clock_irq+0xd14/0x1124)
[  114.092555] [<c01c89a0>] (rcu_sched_clock_irq) from [<c01d3a6c>] 
(update_process_times+0xa0/0xc8)
[  114.102921] [<c01d3a6c>] (update_process_times) from [<c01ea33c>] 
(tick_sched_timer+0x4c/0xb0)
[  114.113126] [<c01ea33c>] (tick_sched_timer) from [<c01d4ca0>] 
(__hrtimer_run_queues+0x2a0/0x5fc)
[  114.123513] [<c01d4ca0>] (__hrtimer_run_queues) from [<c01d5ff0>] 
(hrtimer_interrupt+0x114/0x2cc)
[  114.133894] [<c01d5ff0>] (hrtimer_interrupt) from [<c08b2284>] 
(arch_timer_handler_phys+0x28/0x30)
[  114.144411] [<c08b2284>] (arch_timer_handler_phys) from [<c01adba8>] 
(handle_percpu_devid_irq+0xd0/0x350)
[  114.155609] [<c01adba8>] (handle_percpu_devid_irq) from [<c01a7444>] 
(handle_domain_irq+0x5c/0x78)
[  114.166272] [<c01a7444>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  114.176097] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  114.185015] Exception stack(0xc27e9bb8 to 0xc27e9c00)
[  114.191219] 9ba0: c5fc0280 00000005
[  114.200654] 9bc0: c0428280 00000003 c5fc0280 00000a20 c5eff000 
00000002 00000000 c0c6540c
[  114.210116] 9be0: 00000200 ffffe000 00000200 c27e9c08 c0804c34 
c07da090 600e0113 ffffffff
[  114.219409] [<c0100b00>] (__irq_svc) from [<c07da090>] 
(usb_submit_urb+0x1dc/0x58c)
[  114.228726] [<c07da090>] (usb_submit_urb) from [<c0804c34>] 
(usb_wwan_indat_callback+0x30/0xa0)
[  114.239138] [<c0804c34>] (usb_wwan_indat_callback) from [<c07d7114>] 
(__usb_hcd_giveback_urb+0x54/0xdc)
[  114.250205] [<c07d7114>] (__usb_hcd_giveback_urb) from [<c07d7238>] 
(usb_giveback_urb_bh+0x9c/0xec)
[  114.260912] [<c07d7238>] (usb_giveback_urb_bh) from [<c012bdf0>] 
(tasklet_action_common.constprop.6+0xd0/0xec)
[  114.272561] [<c012bdf0>] (tasklet_action_common.constprop.6) from 
[<c0101320>] (__do_softirq+0x138/0x5c8)
[  114.283720] [<c0101320>] (__do_softirq) from [<c012ba60>] 
(irq_exit+0x194/0x1dc)
[  114.292613] [<c012ba60>] (irq_exit) from [<c01a7448>] 
(handle_domain_irq+0x60/0x78)
[  114.301896] [<c01a7448>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  114.311686] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  114.320589] Exception stack(0xc27e9d48 to 0xc27e9d90)
[  114.326904] 9d40:                   15962135 d888ee9e 00000001 
000276d9 a00e0013 c1215a34
[  114.336350] 9d60: 00000002 c27e9df0 c2517c50 00000000 c2517e58 
c122dbf0 2e63a000 c27e9d98
[  114.345677] 9d80: c0bd9a2c c0bd9a30 600e0013 ffffffff
[  114.351773] [<c0100b00>] (__irq_svc) from [<c0bd9a30>] 
(_raw_spin_unlock_irqrestore+0x30/0x4c)
[  114.362088] [<c0bd9a30>] (_raw_spin_unlock_irqrestore) from 
[<c06abbfc>] (ccu_gate_helper_enable+0x18/0x20)
[  114.373626] [<c06abbfc>] (ccu_gate_helper_enable) from [<c06ab1f4>] 
(ccu_pll_notifier_cb+0x28/0x5c)
[  114.384363] [<c06ab1f4>] (ccu_pll_notifier_cb) from [<c01501fc>] 
(srcu_notifier_call_chain+0x94/0x110)
[  114.395290] [<c01501fc>] (srcu_notifier_call_chain) from [<c069e88c>] 
(__clk_notify+0x80/0xac)
[  114.405476] [<c069e88c>] (__clk_notify) from [<c06a3ebc>] 
(clk_change_rate+0x238/0x770)
[  114.415144] [<c06a3ebc>] (clk_change_rate) from [<c06a4648>] 
(clk_core_set_rate_nolock+0x254/0x274)
[  114.425911] [<c06a4648>] (clk_core_set_rate_nolock) from [<c06a4698>] 
(clk_set_rate+0x30/0x64)
[  114.436228] [<c06a4698>] (clk_set_rate) from [<c08888d4>] 
(_set_opp+0x274/0x50c)
[  114.445312] [<c08888d4>] (_set_opp) from [<c0888c6c>] 
(dev_pm_opp_set_rate+0x100/0x15c)
[  114.454903] [<c0888c6c>] (dev_pm_opp_set_rate) from [<c088d9e0>] 
(__cpufreq_driver_target+0xf0/0x22c)
[  114.465688] [<c088d9e0>] (__cpufreq_driver_target) from [<c018c1c0>] 
(sugov_work+0x4c/0x58)
[  114.475572] [<c018c1c0>] (sugov_work) from [<c014cd24>] 
(kthread_worker_fn+0x118/0x3f0)
[  114.485193] [<c014cd24>] (kthread_worker_fn) from [<c014e93c>] 
(kthread+0x16c/0x18c)
[  114.494544] [<c014e93c>] (kthread) from [<c01000fc>] 
(ret_from_fork+0x14/0x38)
[  114.503259] Exception stack(0xc27e9fb0 to 0xc27e9ff8)
[  114.509477] 9fa0: 00000000 00000000 00000000 00000000
[  114.518884] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  114.528233] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

[  182.177926] sun4i-emac 1c0b000.ethernet FE0: Link is Down

[  192.570871] rcu: INFO: rcu_sched self-detected stall on CPU
[  192.578097] rcu:     0-....: (10394 ticks this GP) 
idle=89f/1/0x40000004 softirq=7864/7864 fqs=2202
[  192.588506]     (t=10463 jiffies g=8609 q=3618)
[  192.593986] NMI backtrace for cpu 0
[  192.598506] CPU: 0 PID: 85 Comm: sugov:0 Tainted: G        W O      
5.15.0 #1
[  192.606971] Hardware name: Wisdom T3 based CCT Family
[  192.613162] [<c01100d4>] (unwind_backtrace) from [<c010bf60>] 
(show_stack+0x10/0x14)
[  192.622647] [<c010bf60>] (show_stack) from [<c0bcb940>] 
(dump_stack_lvl+0x58/0x70)
[  192.631737] [<c0bcb940>] (dump_stack_lvl) from [<c0662c8c>] 
(nmi_cpu_backtrace+0x120/0x140)
[  192.641614] [<c0662c8c>] (nmi_cpu_backtrace) from [<c0662dc8>] 
(nmi_trigger_cpumask_backtrace+0x11c/0x164)
[  192.652791] [<c0662dc8>] (nmi_trigger_cpumask_backtrace) from 
[<c0bc8b18>] (rcu_dump_cpu_stacks+0x128/0x20c)
[  192.664294] [<c0bc8b18>] (rcu_dump_cpu_stacks) from [<c01c89a0>] 
(rcu_sched_clock_irq+0xd14/0x1124)
[  192.675012] [<c01c89a0>] (rcu_sched_clock_irq) from [<c01d3a6c>] 
(update_process_times+0xa0/0xc8)
[  192.685372] [<c01d3a6c>] (update_process_times) from [<c01ea33c>] 
(tick_sched_timer+0x4c/0xb0)
[  192.695580] [<c01ea33c>] (tick_sched_timer) from [<c01d4ca0>] 
(__hrtimer_run_queues+0x2a0/0x5fc)
[  192.705948] [<c01d4ca0>] (__hrtimer_run_queues) from [<c01d5ff0>] 
(hrtimer_interrupt+0x114/0x2cc)
[  192.716337] [<c01d5ff0>] (hrtimer_interrupt) from [<c08b2284>] 
(arch_timer_handler_phys+0x28/0x30)
[  192.726842] [<c08b2284>] (arch_timer_handler_phys) from [<c01adba8>] 
(handle_percpu_devid_irq+0xd0/0x350)
[  192.738039] [<c01adba8>] (handle_percpu_devid_irq) from [<c01a7444>] 
(handle_domain_irq+0x5c/0x78)
[  192.748701] [<c01a7444>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  192.758501] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  192.767439] Exception stack(0xc27e9bc0 to 0xc27e9c08)
[  192.773823] 9bc0: c1273940 d888ee9e 0000002c c0f3c500 c118cb18 
0000954c c118c900 c118cb18

[  192.783274] 9be0: c36739a4 c27e8000 00000101 ffffe000 2e63a000 
c27e9c10 c01d714c c08b2220
[  192.792546] 9c00: 600e0113 ffffffff
[  192.797092] [<c0100b00>] (__irq_svc) from [<c08b2220>] 
(arch_counter_read+0x8/0x10)
[  192.806240] [<c08b2220>] (arch_counter_read) from [<c01d714c>] 
(ktime_get_mono_fast_ns+0x44/0xc4)
[  192.816685] [<c01d714c>] (ktime_get_mono_fast_ns) from [<c0804c6c>] 
(usb_wwan_indat_callback+0x68/0xa0)
[  192.827707] [<c0804c6c>] (usb_wwan_indat_callback) from [<c07d7114>] 
(__usb_hcd_giveback_urb+0x54/0xdc)
[  192.838779] [<c07d7114>] (__usb_hcd_giveback_urb) from [<c07d7238>] 
(usb_giveback_urb_bh+0x9c/0xec)
[  192.849473] [<c07d7238>] (usb_giveback_urb_bh) from [<c012bdf0>] 
(tasklet_action_common.constprop.6+0xd0/0xec)
[  192.861113] [<c012bdf0>] (tasklet_action_common.constprop.6) from 
[<c0101320>] (__do_softirq+0x138/0x5c8)
[  192.872264] [<c0101320>] (__do_softirq) from [<c012ba60>] 
(irq_exit+0x194/0x1dc)
[  192.881152] [<c012ba60>] (irq_exit) from [<c01a7448>] 
(handle_domain_irq+0x60/0x78)
[  192.890430] [<c01a7448>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  192.900222] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  192.909124] Exception stack(0xc27e9d48 to 0xc27e9d90)
[  192.915429] 9d40:                   15962135 d888ee9e 00000001 
000276d9 a00e0013 c1215a34
[  192.924872] 9d60: 00000002 c27e9df0 c2517c50 00000000 c2517e58 
c122dbf0 2e63a000 c27e9d98
[  192.934208] 9d80: c0bd9a2c c0bd9a30 600e0013 ffffffff
[  192.940314] [<c0100b00>] (__irq_svc) from [<c0bd9a30>] 
(_raw_spin_unlock_irqrestore+0x30/0x4c)
[  192.950627] [<c0bd9a30>] (_raw_spin_unlock_irqrestore) from 
[<c06abbfc>] (ccu_gate_helper_enable+0x18/0x20)
[  192.962159] [<c06abbfc>] (ccu_gate_helper_enable) from [<c06ab1f4>] 
(ccu_pll_notifier_cb+0x28/0x5c)
[  192.972894] [<c06ab1f4>] (ccu_pll_notifier_cb) from [<c01501fc>] 
(srcu_notifier_call_chain+0x94/0x110)
[  192.983800] [<c01501fc>] (srcu_notifier_call_chain) from [<c069e88c>] 
(__clk_notify+0x80/0xac)
[ 192.993991] [<c069e88c>] (__clk_notify) from [<c06a3ebc>] 
(clk_change_rate+0x238/0x770)
[  193.003643] [<c06a3ebc>] (clk_change_rate) from [<c06a4648>] 
(clk_core_set_rate_nolock+0x254/0x274)
[  193.014411] [<c06a4648>] (clk_core_set_rate_nolock) from [<c06a4698>] 
(clk_set_rate+0x30/0x64)
[  193.024720] [<c06a4698>] (clk_set_rate) from [<c08888d4>] 
(_set_opp+0x274/0x50c)
[  193.033791] [<c08888d4>] (_set_opp) from [<c0888c6c>] 
(dev_pm_opp_set_rate+0x100/0x15c)
[  193.043368] [<c0888c6c>] (dev_pm_opp_set_rate) from [<c088d9e0>] 
(__cpufreq_driver_target+0xf0/0x22c)
[  193.054162] [<c088d9e0>] (__cpufreq_driver_target) from [<c018c1c0>] 
(sugov_work+0x4c/0x58)
[  193.064062] [<c018c1c0>] (sugov_work) from [<c014cd24>] 
(kthread_worker_fn+0x118/0x3f0)
[  193.073706] [<c014cd24>] (kthread_worker_fn) from [<c014e93c>] 
(kthread+0x16c/0x18c)
[  193.083070] [<c014e93c>] (kthread) from [<c01000fc>] 
(ret_from_fork+0x14/0x38)
[  193.091785] Exception stack(0xc27e9fb0 to 0xc27e9ff8)
[  193.098009] 9fa0: 00000000 00000000 00000000 00000000
[  193.107431] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  193.116794] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

[  208.495677] rcu: INFO: rcu_sched detected expedited stalls on 
CPUs/tasks: { 0-... } 2618 jiffies s: 605 root: 0x1/.
[  208.546254] rcu: blocking rcu_node structures (internal RCU debug):
[  208.557377] Task dump for CPU 0:
[  208.565683] task:sugov:0         state:R  running task stack:    0 
pid:   85 ppid:     2 flags:0x00000002
[  208.588368] [<c0bd0ba0>] (__schedule) from [<ffffe000>] (0xffffe000)

[  271.151219] rcu: INFO: rcu_sched self-detected stall on CPU
[  271.158481] rcu:     0-....: (18198 ticks this GP) 
idle=89f/1/0x40000004 softirq=7864/7864 fqs=4188
[  271.168918]     (t=18321 jiffies g=8609 q=5640)
[  271.174398] NMI backtrace for cpu 0
[  271.178919] CPU: 0 PID: 85 Comm: sugov:0 Tainted: G        W O      
5.15.0 #1
[  271.187379] Hardware name: Wisdom T3 based CCT Family
[  271.193549] [<c01100d4>] (unwind_backtrace) from [<c010bf60>] 
(show_stack+0x10/0x14)
[  271.203009] [<c010bf60>] (show_stack) from [<c0bcb940>] 
(dump_stack_lvl+0x58/0x70)
[  271.212136] [<c0bcb940>] (dump_stack_lvl) from [<c0662c8c>] 
(nmi_cpu_backtrace+0x120/0x140)
[  271.222044] [<c0662c8c>] (nmi_cpu_backtrace) from [<c0662dc8>] 
(nmi_trigger_cpumask_backtrace+0x11c/0x164)
[  271.233216] [<c0662dc8>] (nmi_trigger_cpumask_backtrace) from 
[<c0bc8b18>] (rcu_dump_cpu_stacks+0x128/0x20c)
[  271.244720] [<c0bc8b18>] (rcu_dump_cpu_stacks) from [<c01c89a0>] 
(rcu_sched_clock_irq+0xd14/0x1124)
[  271.255427] [<c01c89a0>] (rcu_sched_clock_irq) from [<c01d3a6c>] 
(update_process_times+0xa0/0xc8)
[  271.265802] [<c01d3a6c>] (update_process_times) from [<c01ea33c>] 
(tick_sched_timer+0x4c/0xb0)
[  271.275991] [<c01ea33c>] (tick_sched_timer) from [<c01d4ca0>] 
(__hrtimer_run_queues+0x2a0/0x5fc)
[  271.286358] [<c01d4ca0>] (__hrtimer_run_queues) from [<c01d5ff0>] 
(hrtimer_interrupt+0x114/0x2cc)
[  271.296739] [<c01d5ff0>] (hrtimer_interrupt) from [<c08b2284>] 
(arch_timer_handler_phys+0x28/0x30)
[  271.307240] [<c08b2284>] (arch_timer_handler_phys) from [<c01adba8>] 
(handle_percpu_devid_irq+0xd0/0x350)
[  271.318430] [<c01adba8>] (handle_percpu_devid_irq) from [<c01a7444>] 
(handle_domain_irq+0x5c/0x78)
[  271.329082] [<c01a7444>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  271.338886] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  271.347815] Exception stack(0xc27e9c08 to 0xc27e9c50)
[  271.354140] 9c00:                   15962135 d888ee9e 00000001 
00033808 c36739a4 c27e9c64
[  271.363581] 9c20: 00000000 c36739c8 c36739a4 c27e8000 00000101 
ffffe000 2e63a000 c27e9c58
[  271.372897] 9c40: c0bd99e0 c0bd99e4 600e0113 ffffffff
[  271.379002] [<c0100b00>] (__irq_svc) from [<c0bd99e4>] 
(_raw_spin_unlock_irq+0x24/0x40)
[  271.388681] [<c0bd99e4>] (_raw_spin_unlock_irq) from [<c07d7200>] 
(usb_giveback_urb_bh+0x64/0xec)
[  271.399304] [<c07d7200>] (usb_giveback_urb_bh) from [<c012bdf0>] 
(tasklet_action_common.constprop.6+0xd0/0xec)
[  271.411181] [<c012bdf0>] (tasklet_action_common.constprop.6) from 
[<c0101320>] (__do_softirq+0x138/0x5c8)
[  271.423075] [<c0101320>] (__do_softirq) from [<c012ba60>] 
(irq_exit+0x194/0x1dc)
[  271.432177] [<c012ba60>] (irq_exit) from [<c01a7448>] 
(handle_domain_irq+0x60/0x78)
[  271.441459] [<c01a7448>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  271.451240] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  271.460145] Exception stack(0xc27e9d48 to 0xc27e9d90)
[  271.466462] 9d40:                   15962135 d888ee9e 00000001 
000276d9 a00e0013 c1215a34
[  271.475901] 9d60: 00000002 c27e9df0 c2517c50 00000000 c2517e58 
c122dbf0 2e63a000 c27e9d98
[  271.485478] 9d80: c0bd9a2c c0bd9a30 600e0013 ffffffff
[  271.491874] [<c0100b00>] (__irq_svc) from [<c0bd9a30>] 
(_raw_spin_unlock_irqrestore+0x30/0x4c)
[  271.502909] [<c0bd9a30>] (_raw_spin_unlock_irqrestore) from 
[<c06abbfc>] (ccu_gate_helper_enable+0x18/0x20)
[  271.514616] [<c06abbfc>] (ccu_gate_helper_enable) from [<c06ab1f4>] 
(ccu_pll_notifier_cb+0x28/ 0x5c)
[  271.525361] [<c06ab1f4>] (ccu_pll_notifier_cb) from [<c01501fc>] 
(srcu_notifier_call_chain+0x94/0x110)
[  271.536285] [<c01501fc>] (srcu_notifier_call_chain) from [<c069e88c>] 
(__clk_notify+0x80/0xac)
[  271.546636] [<c069e88c>] (__clk_notify) from [<c06a3ebc>] 
(clk_change_rate+0x238/0x770)
[  271.556504] [<c06a3ebc>] (clk_change_rate) from [<c06a4648>] 
(clk_core_set_rate_nolock+0x254/0x274)
[  271.567264] [<c06a4648>] (clk_core_set_rate_nolock) from [<c06a4698>] 
(clk_set_rate+0x30/0x64)
[  271.577578] [<c06a4698>] (clk_set_rate) from [<c08888d4>] 
(_set_opp+0x274/0x50c)
[  271.586649] [<c08888d4>] (_set_opp) from [<c0888c6c>] 
(dev_pm_opp_set_rate+0x100/0x15c)
[  271.596237] [<c0888c6c>] (dev_pm_opp_set_rate) from [<c088d9e0>] 
(__cpufreq_driver_target+0xf0/0x22c)
[  271.607013] [<c088d9e0>] (__cpufreq_driver_target) from [<c018c1c0>] 
(sugov_work+0x4c/0x58)
[  271.616883] [<c018c1c0>] (sugov_work) from [<c014cd24>] 
(kthread_worker_fn+0x118/0x3f0)
[  271.626496] [<c014cd24>] (kthread_worker_fn) from [<c014e93c>] 
(kthread+0x16c/0x18c)
[  271.635849] [<c014e93c>] (kthread) from [<c01000fc>] 
(ret_from_fork+0x14/0x38)
[  271.644559] Exception stack(0xc27e9fb0 to 0xc27e9ff8)
[  271.650818] 9fa0: 00000000 00000000 00000000 00000000
[  271.660239] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  271.669599] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

[  289.784027] rcu: INFO: rcu_sched detected expedited stalls on 
CPUs/tasks: { 0-... } 10746 jiffies s: 605 root: 0x1/.
[  289.803250] rcu: blocking rcu_node structures (internal RCU debug):
[  289.815089] Task dump for CPU 0:
[  289.819607] task:sugov:0         state:R  running task stack:    0 
pid:   85 ppid:     2 flags:0x00000002
[  289.843571] [<c0bd0ba0>] (__schedule) from [<ffffe000>] (0xffffe000)

[  295.138141] sun4i-emac 1c0b000.ethernet FE0: Link is Up - 
100Mbps/Full - flow control off

[  349.270798] rcu: INFO: rcu_sched self-detected stall on CPU
[  349.278061] rcu:     0-....: (25957 ticks this GP) 
idle=89f/1/0x40000004 softirq=7864/7864 fqs=6201
[  349.288467]     (t=26133 jiffies g=8609 q=7632)
[  349.293951] NMI backtrace for cpu 0
[  349.298467] CPU: 0 PID: 85 Comm: sugov:0 Tainted: G        W O      
5.15.0 #1
[  349.306913] Hardware name: Wisdom T3 based CCT Family
[  349.313102] [<c01100d4>] (unwind_backtrace) from [<c010bf60>] 
(show_stack+0x10/0x14)
[  349.322561] [<c010bf60>] (show_stack) from [<c0bcb940>] 
(dump_stack_lvl+0x58/0x70)
[  349.331662] [<c0bcb940>] (dump_stack_lvl) from [<c0662c8c>] 
(nmi_cpu_backtrace+0x120/0x140)
[  349.341553] [<c0662c8c>] (nmi_cpu_backtrace) from [<c0662dc8>] 
(nmi_trigger_cpumask_backtrace+0x11c/0x164)
[  349.352731] [<c0662dc8>] (nmi_trigger_cpumask_backtrace) from 
[<c0bc8b18>] (rcu_dump_cpu_stacks+0x128/0x20c)
[  349.364229] [<c0bc8b18>] (rcu_dump_cpu_stacks) from [<c01c89a0>] 
(rcu_sched_clock_irq+0xd14/0x1124)
[  349.374933] [<c01c89a0>] (rcu_sched_clock_irq) from [<c01d3a6c>] 
(update_process_times+0xa0/0xc8)
[  349.385291] [<c01d3a6c>] (update_process_times) from [<c01ea33c>] 
(tick_sched_timer+0x4c/0xb0)
[  349.395487] [<c01ea33c>] (tick_sched_timer) from [<c01d4ca0>] 
(__hrtimer_run_queues+0x2a0/0x5fc)
[  349.405854] [<c01d4ca0>] (__hrtimer_run_queues) from [<c01d5ff0>] 
(hrtimer_interrupt+0x114/0x2cc)
[  349.416240] [<c01d5ff0>] (hrtimer_interrupt) from [<c08b2284>] 
(arch_timer_handler_phys+0x28/0x30)
[  349.426735] [<c08b2284>] (arch_timer_handler_phys) from [<c01adba8>] 
(handle_percpu_devid_irq+0xd0/0x350)
[  349.437915] [<c01adba8>] (handle_percpu_devid_irq) from [<c01a7444>] 
(handle_domain_irq+0x5c/0x78)
[  349.448576] [<c01a7444>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  349.458389] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  349.467306] Exception stack(0xc27e9c08 to 0xc27e9c50)
[  349.473628] 9c00:                   15962135 d888ee9e 00000001 
00038a2c c36739a4 c27e9c64
[  349.483087] 9c20: 00000000 c36739c8 c36739a4 c27e8000 00000101 
ffffe000 2e63a000 c27e9c58
[  349.492403] 9c40: c0bd99e0 c0bd99e4 600e0113 ffffffff
[  349.498522] [<c0100b00>] (__irq_svc) from [<c0bd99e4>] 
(_raw_spin_unlock_irq+0x24/0x40)
[  349.508204] [<c0bd99e4>] (_raw_spin_unlock_irq) from [<c07d7200>] 
(usb_giveback_urb_bh+0x64/0xec)
[  349.518828] [<c07d7200>] (usb_giveback_urb_bh) from [<c012bdf0>] 
(tasklet_action_common.constprop.6+0xd0/0xec)
[  349.530478] [<c012bdf0>] (tasklet_action_common.constprop.6) from 
[<c0101320>] (__do_softirq+0x138/0x5c8)
[  349.541617] [<c0101320>] (__do_softirq) from [<c012ba60>] 
(irq_exit+0x194/0x1dc)
[  349.550515] [<c012ba60>] (irq_exit) from [<c01a7448>] 
(handle_domain_irq+0x60/0x78)
[  349.559802] [<c01a7448>] (handle_domain_irq) from [<c0676bf4>] 
(gic_handle_irq+0x7c/0x90)
[  349.569583] [<c0676bf4>] (gic_handle_irq) from [<c0100b00>] 
(__irq_svc+0x60/0x80)
[  349.578502] Exception stack(0xc27e9d48 to 0xc27e9d90)
[  349.584814] 9d40:                   15962135 d888ee9e 00000001 
000276d9 a00e0013 c1215a34
[  349.594250] 9d60: 00000002 c27e9df0 c2517c50 00000000 c2517e58 
c122dbf0 2e63a000 c27e9d98
[  349.603576] 9d80: c0bd9a2c c0bd9a30 600e0013 ffffffff
[  349.609683] [<c0100b00>] (__irq_svc) from [<c0bd9a30>] 
(_raw_spin_unlock_irqrestore+0x30/0x4c)
[  349.619966] [<c0bd9a30>] (_raw_spin_unlock_irqrestore) from 
[<c06abbfc>] (ccu_gate_helper_enable+0x18/0x20)
[  349.631499] [<c06abbfc>] (ccu_gate_helper_enable) from [<c06ab1f4>] 
(ccu_pll_notifier_cb+0x28/ 0x5c)
[  349.642223] [<c06ab1f4>] (ccu_pll_notifier_cb) from [<c01501fc>] 
(srcu_notifier_call_chain+0x94/0x110)
[  349.653140] [<c01501fc>] (srcu_notifier_call_chain) from [<c069e88c>] 
(__clk_notify+0x80/0xac)
[  349.663310] [<c069e88c>] (__clk_notify) from [<c06a3ebc>] 
(clk_change_rate+0x238/0x770)
[  349.672977] [<c06a3ebc>] (clk_change_rate) from [<c06a4648>] 
(clk_core_set_rate_nolock+0x254/0x274)
[  349.683747] [<c06a4648>] (clk_core_set_rate_nolock) from [<c06a4698>] 
(clk_set_rate+0x30/0x64)
[  349.694061] [<c06a4698>] (clk_set_rate) from [<c08888d4>] 
(_set_opp+0x274/0x50c)
[  349.703143] [<c08888d4>] (_set_opp) from [<c0888c6c>] 
(dev_pm_opp_set_rate+0x100/0x15c)
[  349.712729] [<c0888c6c>] (dev_pm_opp_set_rate) from [<c088d9e0>] 
(__cpufreq_driver_target+0xf0/0x22c)
[  349.723503] [<c088d9e0>] (__cpufreq_driver_target) from [<c018c1c0>] 
(sugov_work+0x4c/0x58)
[  349.733396] [<c018c1c0>] (sugov_work) from [<c014cd24>] 
(kthread_worker_fn+0x118/0x3f0)
[  349.743021] [<c014cd24>] (kthread_worker_fn) from [<c014e93c>] 
(kthread+0x16c/0x18c)
[  349.752388] [<c014e93c>] (kthread) from [<c01000fc>] 
(ret_from_fork+0x14/0x38)
[  349.761111] Exception stack(0xc27e9fb0 to 0xc27e9ff8)
[  349.767328] 9fa0: 00000000 00000000 00000000 00000000
[  349.776733] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  349.786083] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

[  371.717054] rcu: INFO: rcu_sched detected expedited stalls on 
CPUs/tasks: { 0-... } 18939 jiffies s: 605 root: 0x1/.
[  371.734234] rcu: blocking rcu_node structures (internal RCU debug):
[  371.746559] Task dump for CPU 0:
[  371.755757] task:sugov:0         state:R  running task stack:    0 
pid:   85 ppid:     2 flags:0x00000002
[  371.775738] [<c0bd0ba0>] (__schedule) from [<ffffe000>] (0xffffe000)

Seems usb_wwan_indat_callback is not good. I had checked the other drivers,
"-ECONNRESET" is not handle in this function. I can't make sure this bug is
trigger by "-ECONNRESET", so send this email and hope that we can discuss
this question.

Thanks.

