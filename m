Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897511ECA7C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 09:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgFCH0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 03:26:12 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:56446 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725275AbgFCH0L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 03:26:11 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 5E79B6052F;
        Wed,  3 Jun 2020 09:26:09 +0200 (CEST)
Date:   Wed, 3 Jun 2020 09:26:07 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200603072607.GA2456@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
 <20200525191624.GA28647@math.uni-bielefeld.de>
 <1590491586.2838.38.camel@suse.com>
 <20200526195750.GA10336@math.uni-bielefeld.de>
 <1590569589.2838.50.camel@suse.com>
 <20200528085133.GA17192@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528085133.GA17192@math.uni-bielefeld.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Jean Rene Dawin wrote on Thu 28/05/20 10:51:
> Oliver Neukum wrote on Wed 27/05/20 10:53:
> > OK, we have two possibilities here. Either
> > a4e7279cd1d19f48f0af2a10ed020febaa9ac092 or
> > 0afccd7601514c4b83d8cc58c740089cc447051d
> 
> Then I tested a4e7279cd1d19f48f0af2a10ed020febaa9ac092 with your patch
> applied and it still showed the symptom

Hi,

more testing shows the crash can be triggered by 

- romving the battery the first time (but only sometimes)
- re-insertiing battery and turning on the phone (after some interval)

The trace when crashing looks like this:

[  122.890637] Call Trace:
[  122.890640]  <IRQ>
[  122.890645]  queue_work_on+0x36/0x40
[  122.890650]  __usb_hcd_giveback_urb+0x6f/0x120
[  122.890653]  usb_giveback_urb_bh+0xa6/0x100
[  122.890657]  tasklet_action_common.isra.0+0x5f/0x130
[  122.890661]  __do_softirq+0x111/0x34d
[  122.890665]  irq_exit+0xac/0xd0
[  122.890667]  do_IRQ+0x89/0x140
[  122.890670]  common_interrupt+0xf/0xf
[  122.890672]  </IRQ>

Doing a function_graph ftrace on usb_giveback_urb_bh shows a difference
between working and crashshing behaviour:

Working:
# remove battery
 2802.875749 |   3)   0.331 us    |      usb_anchor_suspend_wakeups();
 2802.875749 |   3)   0.283 us    |      usb_unanchor_urb();
 2802.875750 |   3)   0.283 us    |      hub_irq();

# insert battery
 2818.992447 |   3)   0.265 us    |      usb_anchor_suspend_wakeups();
 2818.992448 |   3)   0.279 us    |      usb_unanchor_urb();
 2818.992448 |   3)   0.277 us    |      hub_irq();

# turn on phone
 2829.835833 |   3)   0.262 us    |      usb_anchor_suspend_wakeups();
 2829.835834 |   3)   0.273 us    |      usb_unanchor_urb();
 2829.835834 |   3)   0.294 us    |      hub_irq();


Crashing:

# from dmesg
[ 1537.742750] WARNING: CPU: 3 PID: 0 at kernel/workqueue.c:1473 __queue_work+0x38a/0x430

# remove battery / turn on phone
 1536.448472 |   3)   0.373 us    |      usb_anchor_suspend_wakeups();
 1536.448473 |   3)   0.280 us    |      usb_unanchor_urb();
 1536.448473 |   3)               |      acm_read_bulk_callback [cdc_acm]() {
 1536.448474 |   3)   0.306 us    |        ktime_get_mono_fast_ns();
[...]                                                                

 1536.748347 |   3)   0.279 us    |      usb_anchor_suspend_wakeups();
 1536.748348 |   3)   0.289 us    |      usb_unanchor_urb();          
 1536.748348 |   3)               |      acm_write_bulk [cdc_acm]() { 
 1536.748349 |   3)               |        _raw_spin_lock_irqsave() {
[...]                                                                
                                                                     
 1537.749348 |   3)   0.292 us    |      usb_anchor_suspend_wakeups();
 1537.749348 |   3)   0.298 us    |      usb_unanchor_urb();          
 1537.749349 |   3)               |      acm_write_bulk [cdc_acm]() { 
 1537.749349 |   3)               |        _raw_spin_lock_irqsave() {
[...]                                                                
                                                                     
 1537.749370 |   3)               |        queue_work_on() {
 1537.749370 |   3)               |          __queue_work() {
 1537.749370 |   3)   0.273 us    |            __rcu_read_lock();
 1537.749371 |   3)   0.451 us    |            get_work_pool();  
 1537.749372 |   3)               |            _raw_spin_lock() {
 1537.749372 |   3)   0.270 us    |              preempt_count_add();
 1537.749373 |   3)   0.836 us    |            }                     
 1537.749373 |   3)               |            do_invalid_op() {     
 1537.749374 |   3)   0.364 us    |              uprobe_get_trap_addr();
 1537.749374 |   3)               |              do_error_trap() {      
 1537.749375 |   3)               |                is_valid_bugaddr() { 
 1537.749375 |   3)               |                  __probe_kernel_read() {
 1537.749376 |   3)               |                    __check_object_size() {
 1537.749376 |   3)   0.292 us    |                      check_stack_object();
 1537.749377 |   3)   0.397 us    |                      __virt_addr_valid(); 


To me it looks like the problem arises when urb->complete(urb) is called
in 

static void __usb_hcd_giveback_urb(struct urb *urb)

from drivers/usb/core/hcd.c:

1641    usb_anchor_suspend_wakeups(anchor);
1642    usb_unanchor_urb(urb);
1643    if (likely(status == 0))
1644            usb_led_activity(USB_LED_EVENT_HOST);
1645
1646    /* pass ownership to the completion handler */
1647    urb->status = status;
1648    urb->complete(urb);

If the "wrong" function is set in urb->complete I see the crash.
In the normal case hub_irq() seems to be set. 
In the crashing case something like acm_write_bulk.
May this be the cause?

Regards,
Jean Rene
