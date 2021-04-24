Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA3B36A117
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 14:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhDXMT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 08:19:26 -0400
Received: from exchange.tu-berlin.de ([130.149.7.70]:61184 "EHLO
        exchange.tu-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhDXMTY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 08:19:24 -0400
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Sat, 24 Apr 2021 08:19:23 EDT
Received: from SPMA-03.tubit.win.tu-berlin.de (localhost.localdomain [127.0.0.1])
        by localhost (Email Security Appliance) with SMTP id 9A25C6E646_840A4FB
        for <linux-usb@vger.kernel.org>; Sat, 24 Apr 2021 12:08:47 +0000 (GMT)
Received: from exchange.tu-berlin.de (exchange.tu-berlin.de [130.149.7.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "exchange.tu-berlin.de", Issuer "DFN-Verein Global Issuing CA" (verified OK))
        by SPMA-03.tubit.win.tu-berlin.de (Sophos Email Appliance) with ESMTPS id 288C572268_840A4FF
        for <linux-usb@vger.kernel.org>; Sat, 24 Apr 2021 12:08:47 +0000 (GMT)
Received: from [192.168.1.8] (91.64.210.191) by ex-01.tubit.win.tu-berlin.de
 (130.149.6.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Sat, 24 Apr 2021
 14:08:46 +0200
From:   Felicitas Hetzelt <file@sect.tu-berlin.de>
Subject: Null ptr deref in core/hub.c
To:     <linux-usb@vger.kernel.org>
Message-ID: <b0ba1c36-6ebd-49a9-38da-aa42d98271c0@sect.tu-berlin.de>
Date:   Sat, 24 Apr 2021 14:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="------------7FE8A0A93015DCFE68413880"
Content-Language: en-US
X-ClientProxiedBy: ex-06.tubit.win.tu-berlin.de (130.149.6.150) To
 ex-01.tubit.win.tu-berlin.de (130.149.6.151)
X-SASI-RCODE: 200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tu-berlin.de; h=from:subject:to:message-id:date:mime-version:content-type; s=dkim-tub; bh=YLMDg2cVYnjjPrgw3Lpxfm99Y93AaYThDcQ01PcLLPw=; b=KIrgt9pce2Gt/Gn+jD+H18levMkw4btI3E+1nZdhI7qlnWKdDl7z1iH9Zcs1WH39jxd5FLUPfgexeLmu6a89nwHXwEIuo4CkB3eOLq++bBtDrUQHb+jf5mXVziqIYPVmhZxJMfjQPiiF82wrSGyDYzo+kYHQaJFeJbF46ZiwgcA=
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------7FE8A0A93015DCFE68413880
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello,

I triggered a few potential npds in core/hub.c. The bugs trigger
reliably. Unfortunately I don't have a reproducer, though i tried my
best to root-cause the bugs. I'm using my own emulated xhci host
controller device and a slightly exotic kernel environment based on
kernel version 5.10.0-rc6, so it might be that the bug is not
trigger-able under normal conditions.

I was hoping you could maybe quickly determine whether this is a valid
issue.

usb_hub_to_struct can return zero if hdev->actconfig->interface[0]->dev
is NULL.

https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L124

https://elixir.bootlin.com/linux/v4.9/source/include/linux/usb.h#L194

This is the case when usb_probe_interface fails to probe the device
driver (called via usb_set_configuration -> device_add -> ...)

https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/driver.c#L372

Then e.g. on a new invocation of hub_port_connect, the function tries to
un-attach the previously attached devices (listed as port_dev->child)
and calls recursively_mark_NOTATTACHED (via usb_set_device_state(udev,
USB_STATE_NOTATTACHED), which in turn tries to get a pointer to the hub
via usb_hub_to_struct_hub, which is NULL which leads to the crash.

https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L4742

I feel like this should be caught in hub_port_connect (which would set
port_dev->child = NULL, avoiding the later invocation of
recursively_mark_NOTATTACHED), but the return value of usb_new_device is
always valid (in fact usb_set_configuration can only return 0 once it
gets to the calling add_device and probe).

https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/hub.c#L4891

https://elixir.bootlin.com/linux/v4.9/source/drivers/usb/core/message.c#L1931

To fix this one could check whether the interface is actually properly
setup instead of just checking status, or alternatively always check the
return value of usb_hub_to_struct_hub on later invocations.

I attached the kernel log, it is a bit messy though i marked the
relevant parts with 'XXNOTE'.

Let me know if you need any further information.


Greetings,

Felicitas


--------------7FE8A0A93015DCFE68413880
Content-Type: text/x-log; charset="UTF-8"; name="crash.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="crash.log"

<snip>
ADDING DEV
[    4.455065] usb_hcd_irq:2339 Enter
[    4.455088] xhci_irq:2844 Enter
[    4.455107] xhci_handle_event:2727 Enter
[    4.455131] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 16, portsc: 0x206e1
[    4.455146] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[    4.455155] usb_hcd_poll_rh_status:761
[    4.455169] usb_hcd_giveback_urb:1726 7f279ba7cf00
[    4.455180] softirq: __tasklet_schedule_common 7f279ba9c170
Add worker 7f279ba9c170, exst:795, total:1
[    4.455219] xhci_handle_event:2776 Exit
[    4.455228] xhci_handle_event:2727 Enter
[    4.455239] xhci_irq:2909 Exit
[    4.455247] usb_hcd_irq:2347 Exit
[    4.455259] softirq: tasklet_action_common start 7f279ba9c170
[    4.455268] usb_giveback_urb_bh:1678
[    4.455278] __usb_hcd_giveback_urb:1646 7f279ba7cf00
[    4.455288] __usb_hcd_giveback_urb:1663 calling complete
[    4.455297] hub_irq:731
[    4.455306] kick_hub_wq:660
[    4.455316] queue_work_on w 7f279baea9b0, wq 7f279abefe00
[    4.455324] __queue_work w 7f279baea9b0, wq 7f279abefe00
Add worker 7f279baea9b0, exst:840, total:2
[    4.455350] usb_submit_urb:376 7f279ba7cf00, interval 2048
[    4.455369] usb_hcd_submit_urb:1534 7f279ba7cf00, interval 2048
[    4.455378] usb_hcd_submit_urb:1553 7f279ba7cf00
[    4.455386] rh_urb_enqueue:846 7f279ba7cf00
[    4.455403] usb_submit_urb:619 7f279ba7cf00, interval 2048 submit done
[    4.455413] softirq: tasklet_action_common end 7f279ba9c170
Del worker 7f279ba9c170, exst:(____ptrval____), total:1
[    4.455443] usb_hcd_irq:2339 Enter
[    4.455451] xhci_irq:2844 Enter
[    4.455459] xhci_irq:2909 Exit
[    4.455467] usb_hcd_irq:2347 Exit
[    4.455545] process_one_work start 7f279baea9b0
[    4.455599] hub 1-0:1.0: state 7 ports 15 chg 0000 evt 0002
[    4.455618] usb_submit_urb:376 7f279bbb8700, interval 0
[    4.455632] usb_hcd_submit_urb:1534 7f279bbb8700, interval 0
[    4.455640] usb_hcd_submit_urb:1553 7f279bbb8700
[    4.455646] rh_urb_enqueue:846 7f279bbb8700
[    4.455652] rh_call_control:491 7f279bbb8700
[    4.455670] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x206e1, return 0x10101
[    4.455682] usb_hcd_giveback_urb:1726 7f279bbb8700
[    4.455688] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.455709] usb_submit_urb:619 7f279bbb8700, interval 0 submit done
[    4.455718] usb_start_wait_urb:63 waiting 7f279bbb8700
Add waiter 7f279588c5e0, exst:872, total:1
fuzz_trigger_wait_cond
[    4.455734] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.455783] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.455801] usb_giveback_urb_bh:1678
[    4.455809] __usb_hcd_giveback_urb:1646 7f279bbb8700
[    4.455816] __usb_hcd_giveback_urb:1663 calling complete
[    4.455826] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.455867] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c5e0, exst:(____ptrval____), total:0
[    4.455888] usb_start_wait_urb:77 done 7f279bbb8700
[    4.455898] usb_submit_urb:376 7f279bbb8800, interval 0
[    4.455907] usb_hcd_submit_urb:1534 7f279bbb8800, interval 0
[    4.455913] usb_hcd_submit_urb:1553 7f279bbb8800
[    4.455920] rh_urb_enqueue:846 7f279bbb8800
[    4.455925] rh_call_control:491 7f279bbb8800
[    4.455941] xhci-hcd xhci-hcd.0.auto: clear port1 connect change, portsc: 0x6e1
[    4.455950] usb_hcd_giveback_urb:1726 7f279bbb8800
[    4.455955] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.455970] usb_submit_urb:619 7f279bbb8800, interval 0 submit done
[    4.455976] usb_start_wait_urb:63 waiting 7f279bbb8800
Add waiter 7f279588c680, exst:777, total:1
fuzz_trigger_wait_cond
[    4.455990] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.456018] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.456034] usb_giveback_urb_bh:1678
[    4.456042] __usb_hcd_giveback_urb:1646 7f279bbb8800
[    4.456049] __usb_hcd_giveback_urb:1663 calling complete
[    4.456073] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.456112] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c680, exst:(____ptrval____), total:0
[    4.456131] usb_start_wait_urb:77 done 7f279bbb8800
[    4.456141] usb usb1-port1: status 0101, change 0001, 12 Mb/s
[    4.456149] hub_port_connect:5152 port 1
[    4.456158] usb_submit_urb:376 7f279bbb8900, interval 0
[    4.456166] usb_hcd_submit_urb:1534 7f279bbb8900, interval 0
[    4.456172] usb_hcd_submit_urb:1553 7f279bbb8900
[    4.456178] rh_urb_enqueue:846 7f279bbb8900
[    4.456183] rh_call_control:491 7f279bbb8900
[    4.456194] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x6e1, return 0x101
[    4.456202] usb_hcd_giveback_urb:1726 7f279bbb8900
[    4.456207] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.456226] usb_submit_urb:619 7f279bbb8900, interval 0 submit done
[    4.456233] usb_start_wait_urb:63 waiting 7f279bbb8900
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.456246] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.456274] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.456289] usb_giveback_urb_bh:1678
[    4.456297] __usb_hcd_giveback_urb:1646 7f279bbb8900
[    4.456304] __usb_hcd_giveback_urb:1663 calling complete
[    4.456315] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.456350] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.456369] usb_start_wait_urb:77 done 7f279bbb8900
[    4.456383] usb_submit_urb:376 7f279bbb8a00, interval 0
[    4.456390] usb_hcd_submit_urb:1534 7f279bbb8a00, interval 0
[    4.456395] usb_hcd_submit_urb:1553 7f279bbb8a00
[    4.456404] rh_urb_enqueue:846 7f279bbb8a00
[    4.456409] rh_call_control:491 7f279bbb8a00
[    4.456421] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x6e1, return 0x101
[    4.456429] usb_hcd_giveback_urb:1726 7f279bbb8a00
[    4.456435] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.456448] usb_submit_urb:619 7f279bbb8a00, interval 0 submit done
[    4.456454] usb_start_wait_urb:63 waiting 7f279bbb8a00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.456466] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.456494] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.456513] usb_giveback_urb_bh:1678
[    4.456520] __usb_hcd_giveback_urb:1646 7f279bbb8a00
[    4.456526] __usb_hcd_giveback_urb:1663 calling complete
[    4.456534] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.456571] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.456591] usb_start_wait_urb:77 done 7f279bbb8a00
[    4.456601] usb_submit_urb:376 7f279bbb8b00, interval 0
[    4.456609] usb_hcd_submit_urb:1534 7f279bbb8b00, interval 0
[    4.456616] usb_hcd_submit_urb:1553 7f279bbb8b00
[    4.456621] rh_urb_enqueue:846 7f279bbb8b00
[    4.456628] rh_call_control:491 7f279bbb8b00
[    4.456639] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x6e1, return 0x101
[    4.456646] usb_hcd_giveback_urb:1726 7f279bbb8b00
[    4.456652] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.456666] usb_submit_urb:619 7f279bbb8b00, interval 0 submit done
[    4.456672] usb_start_wait_urb:63 waiting 7f279bbb8b00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.456685] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.456711] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.456726] usb_giveback_urb_bh:1678
[    4.456733] __usb_hcd_giveback_urb:1646 7f279bbb8b00
[    4.456741] __usb_hcd_giveback_urb:1663 calling complete
[    4.456751] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.456786] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.456804] usb_start_wait_urb:77 done 7f279bbb8b00
[    4.456818] usb_submit_urb:376 7f279bbb8c00, interval 0
[    4.456827] usb_hcd_submit_urb:1534 7f279bbb8c00, interval 0
[    4.456834] usb_hcd_submit_urb:1553 7f279bbb8c00
[    4.456840] rh_urb_enqueue:846 7f279bbb8c00
[    4.456846] rh_call_control:491 7f279bbb8c00
[    4.456856] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x6e1, return 0x101
[    4.456864] usb_hcd_giveback_urb:1726 7f279bbb8c00
[    4.456871] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.456885] usb_submit_urb:619 7f279bbb8c00, interval 0 submit done
[    4.456891] usb_start_wait_urb:63 waiting 7f279bbb8c00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.456904] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.456930] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.456944] usb_giveback_urb_bh:1678
[    4.456951] __usb_hcd_giveback_urb:1646 7f279bbb8c00
[    4.456959] __usb_hcd_giveback_urb:1663 calling complete
[    4.456970] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.457005] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.457024] usb_start_wait_urb:77 done 7f279bbb8c00
[    4.457033] usb_submit_urb:376 7f279bbb8d00, interval 0
[    4.457041] usb_hcd_submit_urb:1534 7f279bbb8d00, interval 0
[    4.457049] usb_hcd_submit_urb:1553 7f279bbb8d00
[    4.457054] rh_urb_enqueue:846 7f279bbb8d00
[    4.457060] rh_call_control:491 7f279bbb8d00
[    4.457070] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x6e1, return 0x101
[    4.457078] usb_hcd_giveback_urb:1726 7f279bbb8d00
[    4.457084] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.457097] usb_submit_urb:619 7f279bbb8d00, interval 0 submit done
[    4.457104] usb_start_wait_urb:63 waiting 7f279bbb8d00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.457128] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.457157] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.457174] usb_giveback_urb_bh:1678
[    4.457180] __usb_hcd_giveback_urb:1646 7f279bbb8d00
[    4.457187] __usb_hcd_giveback_urb:1663 calling complete
[    4.457199] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.457233] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.457251] usb_start_wait_urb:77 done 7f279bbb8d00
[    4.457261] usb usb1-port1: debounce total 100ms stable 100ms status 0x101
[    4.457268] hub_port_connect:5212 port 1
[    4.457282] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.457291] queue_trb: 0 0 0 2401
[    4.457300] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.457312] usb_hcd_irq:2339 Enter
[    4.457320] xhci_irq:2844 Enter
[    4.457327] xhci_handle_event:2727 Enter
[    4.457336] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.457342] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.457358] xhci_handle_event:2776 Exit
[    4.457370] xhci_handle_event:2727 Enter
[    4.457378] xhci_irq:2909 Exit
[    4.457385] usb_hcd_irq:2347 Exit
[    4.457391] xhci_alloc_dev:3999 waiting
[    4.457393] usb_hcd_irq:2339 Enter
[    4.457402] xhci_irq:2844 Enter
[    4.457407] xhci_irq:2909 Exit
[    4.457412] usb_hcd_irq:2347 Exit
Add waiter 7f279babf400, exst:0, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf400, exst:(____ptrval____), total:0
[    4.457433] xhci_alloc_dev:4001 waiting done
[    4.457458] xhci-hcd xhci-hcd.0.auto: Slot 1 output ctx = 0x7f279bbb9000 (dma)
[    4.457472] xhci-hcd xhci-hcd.0.auto: Slot 1 input ctx = 0x7f279bbba000 (dma)
[    4.457492] xhci-hcd xhci-hcd.0.auto: Set slot id 1 dcbaa entry (____ptrval____) to 0x7f279bbb9000
[    4.457508] usb_set_device_state:2092
[    4.457515] usb_set_device_state:2125
[    4.457521] hub_port_connect:5239 port 1
[    4.457528] hub_port_init:4629 port 1
[    4.457537] usb_submit_urb:376 7f279bbb8e00, interval 0
[    4.457546] usb_hcd_submit_urb:1534 7f279bbb8e00, interval 0
[    4.457552] usb_hcd_submit_urb:1553 7f279bbb8e00
[    4.457557] rh_urb_enqueue:846 7f279bbb8e00
[    4.457564] rh_call_control:491 7f279bbb8e00
[    4.457577] xhci-hcd xhci-hcd.0.auto: set port reset, actual port 1-1 status  = 0x200603
[    4.457585] usb_hcd_irq:2339 Enter
[    4.457590] xhci_irq:2844 Enter
[    4.457597] xhci_handle_event:2727 Enter
[    4.457608] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 16, portsc: 0x200603
[    4.457618] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[    4.457625] usb_hcd_poll_rh_status:761
[    4.457633] xhci_handle_event:2776 Exit
[    4.457639] xhci_handle_event:2727 Enter
[    4.457645] xhci_irq:2909 Exit
[    4.457651] usb_hcd_irq:2347 Exit
[    4.457658] usb_hcd_irq:2339 Enter
[    4.457664] xhci_irq:2844 Enter
[    4.457669] xhci_irq:2909 Exit
[    4.457674] usb_hcd_irq:2347 Exit
[    4.457680] usb_hcd_giveback_urb:1726 7f279bbb8e00
[    4.457687] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.457701] usb_submit_urb:619 7f279bbb8e00, interval 0 submit done
[    4.457708] usb_start_wait_urb:63 waiting 7f279bbb8e00
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.457721] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.457744] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.457759] usb_giveback_urb_bh:1678
[    4.457767] __usb_hcd_giveback_urb:1646 7f279bbb8e00
[    4.457773] __usb_hcd_giveback_urb:1663 calling complete
[    4.457782] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.457819] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.457836] usb_start_wait_urb:77 done 7f279bbb8e00
[    4.457846] usb_submit_urb:376 7f279bbb8f00, interval 0
[    4.457853] usb_hcd_submit_urb:1534 7f279bbb8f00, interval 0
[    4.457859] usb_hcd_submit_urb:1553 7f279bbb8f00
[    4.457867] rh_urb_enqueue:846 7f279bbb8f00
[    4.457873] rh_call_control:491 7f279bbb8f00
[    4.457885] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x200603, return 0x100103
[    4.457893] usb_hcd_giveback_urb:1726 7f279bbb8f00
[    4.457900] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.457914] usb_submit_urb:619 7f279bbb8f00, interval 0 submit done
[    4.457921] usb_start_wait_urb:63 waiting 7f279bbb8f00
Add waiter 7f279588c2c0, exst:837, total:1
fuzz_trigger_wait_cond
[    4.457934] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.457956] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.457971] usb_giveback_urb_bh:1678
[    4.457978] __usb_hcd_giveback_urb:1646 7f279bbb8f00
[    4.457984] __usb_hcd_giveback_urb:1663 calling complete
[    4.457992] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.458020] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c2c0, exst:(____ptrval____), total:0
[    4.458045] usb_start_wait_urb:77 done 7f279bbb8f00
[    4.458062] usb_submit_urb:376 7f279bbbd000, interval 0
[    4.458070] usb_hcd_submit_urb:1534 7f279bbbd000, interval 0
[    4.458077] usb_hcd_submit_urb:1553 7f279bbbd000
[    4.458083] rh_urb_enqueue:846 7f279bbbd000
[    4.458089] rh_call_control:491 7f279bbbd000
[    4.458101] xhci-hcd xhci-hcd.0.auto: clear port1 reset change, portsc: 0x603
[    4.458109] usb_hcd_giveback_urb:1726 7f279bbbd000
[    4.458116] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.458130] usb_submit_urb:619 7f279bbbd000, interval 0 submit done
[    4.458137] usb_start_wait_urb:63 waiting 7f279bbbd000
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.458150] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.458172] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.458187] usb_giveback_urb_bh:1678
[    4.458194] __usb_hcd_giveback_urb:1646 7f279bbbd000
[    4.458200] __usb_hcd_giveback_urb:1663 calling complete
[    4.458208] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.458246] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.458263] usb_start_wait_urb:77 done 7f279bbbd000
[    4.458271] usb_set_device_state:2092
[    4.458279] usb_set_device_state:2125
[    4.458291] usb 1-1: new full-speed USB device number 2 using xhci-hcd
[    4.458303] xhci-hcd xhci-hcd.0.auto: Set root hub portnum to 16
[    4.458312] xhci-hcd xhci-hcd.0.auto: Set fake root hub portnum to 1
[    4.458320] xhci-hcd xhci-hcd.0.auto: udev->tt = (____ptrval____)
[    4.458329] xhci-hcd xhci-hcd.0.auto: udev->ttport = 0x1
[    4.458337] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.458346] queue_trb: 9bbba000 7f27 0 1002e01
[    4.458358] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.458390] usb_hcd_irq:2339 Enter
[    4.458398] xhci_irq:2844 Enter
[    4.458404] xhci_handle_event:2727 Enter
[    4.458411] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.458418] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.458432] xhci_handle_event:2776 Exit
[    4.458438] xhci_handle_event:2727 Enter
[    4.458446] xhci_irq:2909 Exit
[    4.458452] usb_hcd_irq:2347 Exit
[    4.458459] xhci_setup_device:4166 waiting
[    4.458473] usb_hcd_irq:2339 Enter
[    4.458485] xhci_irq:2844 Enter
[    4.458491] xhci_irq:2909 Exit
[    4.458496] usb_hcd_irq:2347 Exit
Add waiter 7f279babf4c0, exst:928, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf4c0, exst:(____ptrval____), total:0
[    4.458514] xhci_setup_device:4168 waiting done
[    4.458523] xhci-hcd xhci-hcd.0.auto: Successful setup context command
[    4.458533] xhci-hcd xhci-hcd.0.auto: Op regs DCBAA ptr = 0x007f279babd000
[    4.458541] xhci-hcd xhci-hcd.0.auto: Slot ID 1 dcbaa entry @(____ptrval____) = 0x007f279bbb9000
[    4.458551] xhci-hcd xhci-hcd.0.auto: Output Context DMA address = 0x7f279bbb9000
[    4.458559] xhci-hcd xhci-hcd.0.auto: Internal device address = 0
[    4.458570] usb_submit_urb:376 7f279bbbd100, interval 0
[    4.458578] usb_hcd_submit_urb:1534 7f279bbbd100, interval 0
[    4.458585] usb_hcd_submit_urb:1556 7f279bbbd100
[    4.458596] xhci_urb_enqueue:1472 7f279bbbd100, interval 0
[    4.458613] queue_trb: 1000680 400000 8 30840
[    4.458621] queue_trb: 9bae8b00 7f27 40 10c05
[    4.458627] queue_trb: 0 0 0 1021
fuzz_get_n: idx 0, rem 545, size 16, val 0
[    4.458707] usb_hcd_irq:2339 Enter
[    4.458715] xhci_irq:2844 Enter
[    4.458722] xhci_handle_event:2727 Enter
[    4.458733] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.458740] xhci_handle_event:2776 Exit
[    4.458745] xhci_handle_event:2727 Enter
[    4.458756] usb_hcd_giveback_urb:1726 7f279bbbd100
[    4.458763] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.458774] xhci_handle_event:2776 Exit
[    4.458779] xhci_handle_event:2727 Enter
[    4.458786] xhci_irq:2909 Exit
[    4.458793] usb_hcd_irq:2347 Exit
[    4.458799] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.458806] usb_giveback_urb_bh:1678
[    4.458812] __usb_hcd_giveback_urb:1646 7f279bbbd100
[    4.458822] __usb_hcd_giveback_urb:1663 calling complete
[    4.458829] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.458842] usb_submit_urb:619 7f279bbbd100, interval 0 submit done
[    4.458844] usb_hcd_irq:2339 Enter
[    4.458863] xhci_irq:2844 Enter
[    4.458870] xhci_irq:2909 Exit
[    4.458875] usb_hcd_irq:2347 Exit
[    4.458882] usb_start_wait_urb:63 waiting 7f279bbbd100
Add waiter 7f279588c540, exst:712, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c540, exst:(____ptrval____), total:0
[    4.458906] usb_start_wait_urb:77 done 7f279bbbd100
[    4.458916] usb_submit_urb:376 7f279bbbd200, interval 0
[    4.458924] usb_hcd_submit_urb:1534 7f279bbbd200, interval 0
[    4.458930] usb_hcd_submit_urb:1556 7f279bbbd200
[    4.458937] xhci_urb_enqueue:1472 7f279bbbd200, interval 0
[    4.458945] queue_trb: 1000680 400000 8 30840
[    4.458954] queue_trb: 9bae8b00 7f27 40 10c05
[    4.458961] queue_trb: 0 0 0 1021
fuzz_get_n: idx 16, rem 529, size 16, val 0
[    4.458980] usb_hcd_irq:2339 Enter
[    4.458987] xhci_irq:2844 Enter
[    4.458994] xhci_handle_event:2727 Enter
[    4.459003] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.459009] xhci_handle_event:2776 Exit
[    4.459014] xhci_handle_event:2727 Enter
[    4.459022] usb_hcd_giveback_urb:1726 7f279bbbd200
[    4.459029] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.459039] xhci_handle_event:2776 Exit
[    4.459044] xhci_handle_event:2727 Enter
[    4.459051] xhci_irq:2909 Exit
[    4.459056] usb_hcd_irq:2347 Exit
[    4.459063] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.459070] usb_giveback_urb_bh:1678
[    4.459075] __usb_hcd_giveback_urb:1646 7f279bbbd200
[    4.459082] __usb_hcd_giveback_urb:1663 calling complete
[    4.459087] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.459100] usb_submit_urb:619 7f279bbbd200, interval 0 submit done
[    4.459102] usb_hcd_irq:2339 Enter
[    4.459111] xhci_irq:2844 Enter
[    4.459116] xhci_irq:2909 Exit
[    4.459121] usb_hcd_irq:2347 Exit
[    4.459128] usb_start_wait_urb:63 waiting 7f279bbbd200
Add waiter 7f279588c540, exst:712, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c540, exst:(____ptrval____), total:0
[    4.459145] usb_start_wait_urb:77 done 7f279bbbd200
[    4.459153] usb_submit_urb:376 7f279bbbd300, interval 0
[    4.459161] usb_hcd_submit_urb:1534 7f279bbbd300, interval 0
[    4.459168] usb_hcd_submit_urb:1556 7f279bbbd300
[    4.459174] xhci_urb_enqueue:1472 7f279bbbd300, interval 0
[    4.459182] queue_trb: 1000680 400000 8 30840
[    4.459188] queue_trb: 9bae8b00 7f27 40 10c05
[    4.459194] queue_trb: 0 0 0 1021
fuzz_get_n: idx 32, rem 513, size 16, val 0
[    4.459212] usb_hcd_irq:2339 Enter
[    4.459219] xhci_irq:2844 Enter
[    4.459226] xhci_handle_event:2727 Enter
[    4.459241] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.459248] xhci_handle_event:2776 Exit
[    4.459253] xhci_handle_event:2727 Enter
[    4.459261] usb_hcd_giveback_urb:1726 7f279bbbd300
[    4.459267] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.459278] xhci_handle_event:2776 Exit
[    4.459283] xhci_handle_event:2727 Enter
[    4.459290] xhci_irq:2909 Exit
[    4.459297] usb_hcd_irq:2347 Exit
[    4.459303] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.459309] usb_giveback_urb_bh:1678
[    4.459315] __usb_hcd_giveback_urb:1646 7f279bbbd300
[    4.459321] __usb_hcd_giveback_urb:1663 calling complete
[    4.459327] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.459339] usb_submit_urb:619 7f279bbbd300, interval 0 submit done
[    4.459342] usb_hcd_irq:2339 Enter
[    4.459350] xhci_irq:2844 Enter
[    4.459355] xhci_irq:2909 Exit
[    4.459360] usb_hcd_irq:2347 Exit
[    4.459367] usb_start_wait_urb:63 waiting 7f279bbbd300
Add waiter 7f279588c540, exst:712, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c540, exst:(____ptrval____), total:0
[    4.459383] usb_start_wait_urb:77 done 7f279bbbd300
[    4.459392] usb_submit_urb:376 7f279bbbd400, interval 0
[    4.459400] usb_hcd_submit_urb:1534 7f279bbbd400, interval 0
[    4.459406] usb_hcd_submit_urb:1553 7f279bbbd400
[    4.459412] rh_urb_enqueue:846 7f279bbbd400
[    4.459417] rh_call_control:491 7f279bbbd400
[    4.459428] xhci-hcd xhci-hcd.0.auto: set port reset, actual port 1-1 status  = 0x200603
[    4.459436] usb_hcd_irq:2339 Enter
[    4.459441] xhci_irq:2844 Enter
[    4.459448] xhci_handle_event:2727 Enter
[    4.459457] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 16, portsc: 0x200603
[    4.459466] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[    4.459472] usb_hcd_poll_rh_status:761
[    4.459480] xhci_handle_event:2776 Exit
[    4.459485] xhci_handle_event:2727 Enter
[    4.459493] xhci_irq:2909 Exit
[    4.459498] usb_hcd_irq:2347 Exit
[    4.459504] usb_hcd_irq:2339 Enter
[    4.459510] xhci_irq:2844 Enter
[    4.459515] xhci_irq:2909 Exit
[    4.459520] usb_hcd_irq:2347 Exit
[    4.459528] usb_hcd_giveback_urb:1726 7f279bbbd400
[    4.459534] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.459547] usb_submit_urb:619 7f279bbbd400, interval 0 submit done
[    4.459554] usb_start_wait_urb:63 waiting 7f279bbbd400
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.459567] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.459595] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.459617] usb_giveback_urb_bh:1678
[    4.459624] __usb_hcd_giveback_urb:1646 7f279bbbd400
[    4.459630] __usb_hcd_giveback_urb:1663 calling complete
[    4.459642] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.459676] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.459694] usb_start_wait_urb:77 done 7f279bbbd400
[    4.459704] usb_submit_urb:376 7f279bbbd500, interval 0
[    4.459712] usb_hcd_submit_urb:1534 7f279bbbd500, interval 0
[    4.459719] usb_hcd_submit_urb:1553 7f279bbbd500
[    4.459724] rh_urb_enqueue:846 7f279bbbd500
[    4.459730] rh_call_control:491 7f279bbbd500
[    4.459741] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x200603, return 0x100103
[    4.459750] usb_hcd_giveback_urb:1726 7f279bbbd500
[    4.459755] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.459769] usb_submit_urb:619 7f279bbbd500, interval 0 submit done
[    4.459775] usb_start_wait_urb:63 waiting 7f279bbbd500
Add waiter 7f279588c2c0, exst:837, total:1
fuzz_trigger_wait_cond
[    4.459788] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.459812] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.459825] usb_giveback_urb_bh:1678
[    4.459832] __usb_hcd_giveback_urb:1646 7f279bbbd500
[    4.459837] __usb_hcd_giveback_urb:1663 calling complete
[    4.459845] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.459876] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c2c0, exst:(____ptrval____), total:0
[    4.459894] usb_start_wait_urb:77 done 7f279bbbd500
[    4.459903] usb_submit_urb:376 7f279bbbd600, interval 0
[    4.459910] usb_hcd_submit_urb:1534 7f279bbbd600, interval 0
[    4.459915] usb_hcd_submit_urb:1553 7f279bbbd600
[    4.459921] rh_urb_enqueue:846 7f279bbbd600
[    4.459926] rh_call_control:491 7f279bbbd600
[    4.459937] xhci-hcd xhci-hcd.0.auto: clear port1 reset change, portsc: 0x603
[    4.459945] usb_hcd_giveback_urb:1726 7f279bbbd600
[    4.459950] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.459964] usb_submit_urb:619 7f279bbbd600, interval 0 submit done
[    4.459970] usb_start_wait_urb:63 waiting 7f279bbbd600
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.459992] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.460016] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.460030] usb_giveback_urb_bh:1678
[    4.460036] __usb_hcd_giveback_urb:1646 7f279bbbd600
[    4.460041] __usb_hcd_giveback_urb:1663 calling complete
[    4.460049] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.460080] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.460098] usb_start_wait_urb:77 done 7f279bbbd600
[    4.460108] xhci-hcd xhci-hcd.0.auto: Resetting device with slot ID 1
[    4.460117] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.460124] queue_trb: 0 0 0 1004401
[    4.460132] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.460147] usb_hcd_irq:2339 Enter
[    4.460155] xhci_irq:2844 Enter
[    4.460162] xhci_handle_event:2727 Enter
[    4.460169] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.460174] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.460190] xhci-hcd xhci-hcd.0.auto: Completed reset device command.
[    4.460197] xhci_handle_event:2776 Exit
[    4.460203] xhci_handle_event:2727 Enter
[    4.460210] xhci_irq:2909 Exit
[    4.460216] usb_hcd_irq:2347 Exit
[    4.460223] xhci_discover_or_reset_device:3790 waiting
[    4.460225] usb_hcd_irq:2339 Enter
[    4.460234] xhci_irq:2844 Enter
[    4.460238] xhci_irq:2909 Exit
[    4.460243] usb_hcd_irq:2347 Exit
Add waiter 7f279babf500, exst:0, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf500, exst:(____ptrval____), total:0
[    4.460261] xhci_discover_or_reset_device:3792 waiting done
[    4.460269] xhci-hcd xhci-hcd.0.auto: Successful reset device command.
[    4.460277] usb_set_device_state:2092
[    4.460283] usb_set_device_state:2125
[    4.460291] usb 1-1: device descriptor read/64, error 18
[    4.460298] hub_port_init:4828 port 1 err
[    4.460306] xhci-hcd xhci-hcd.0.auto: Slot already in default state
[    4.460316] usb_submit_urb:376 7f279bbbd700, interval 0
[    4.460323] usb_hcd_submit_urb:1534 7f279bbbd700, interval 0
[    4.460330] usb_hcd_submit_urb:1556 7f279bbbd700
[    4.460337] xhci_urb_enqueue:1472 7f279bbbd700, interval 0
[    4.460346] queue_trb: 1000680 400000 8 30840
[    4.460353] queue_trb: 9bae8c00 7f27 40 10c05
[    4.460360] queue_trb: 0 0 0 1021
fuzz_get_n: idx 48, rem 497, size 16, val 0
[    4.460381] usb_hcd_irq:2339 Enter
[    4.460387] xhci_irq:2844 Enter
[    4.460393] xhci_handle_event:2727 Enter
[    4.460402] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.460408] xhci_handle_event:2776 Exit
[    4.460414] xhci_handle_event:2727 Enter
[    4.460422] usb_hcd_giveback_urb:1726 7f279bbbd700
[    4.460428] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.460439] xhci_handle_event:2776 Exit
[    4.460444] xhci_handle_event:2727 Enter
[    4.460451] xhci_irq:2909 Exit
[    4.460457] usb_hcd_irq:2347 Exit
[    4.460464] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.460470] usb_giveback_urb_bh:1678
[    4.460476] __usb_hcd_giveback_urb:1646 7f279bbbd700
[    4.460483] __usb_hcd_giveback_urb:1663 calling complete
[    4.460490] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.460503] usb_submit_urb:619 7f279bbbd700, interval 0 submit done
[    4.460511] usb_hcd_irq:2339 Enter
[    4.460520] xhci_irq:2844 Enter
[    4.460525] xhci_irq:2909 Exit
[    4.460530] usb_hcd_irq:2347 Exit
[    4.460539] usb_start_wait_urb:63 waiting 7f279bbbd700
Add waiter 7f279588c540, exst:712, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c540, exst:(____ptrval____), total:0
[    4.460555] usb_start_wait_urb:77 done 7f279bbbd700
[    4.460564] usb_submit_urb:376 7f279bbbd800, interval 0
[    4.460571] usb_hcd_submit_urb:1534 7f279bbbd800, interval 0
[    4.460579] usb_hcd_submit_urb:1553 7f279bbbd800
[    4.460584] rh_urb_enqueue:846 7f279bbbd800
[    4.460590] rh_call_control:491 7f279bbbd800
[    4.460602] xhci-hcd xhci-hcd.0.auto: set port reset, actual port 1-1 status  = 0x200603
[    4.460610] usb_hcd_irq:2339 Enter
[    4.460615] xhci_irq:2844 Enter
[    4.460622] xhci_handle_event:2727 Enter
[    4.460632] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 16, portsc: 0x200603
[    4.460641] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[    4.460647] usb_hcd_poll_rh_status:761
[    4.460654] xhci_handle_event:2776 Exit
[    4.460660] xhci_handle_event:2727 Enter
[    4.460666] xhci_irq:2909 Exit
[    4.460672] usb_hcd_irq:2347 Exit
[    4.460678] usb_hcd_irq:2339 Enter
[    4.460684] xhci_irq:2844 Enter
[    4.460689] xhci_irq:2909 Exit
[    4.460695] usb_hcd_irq:2347 Exit
[    4.460701] usb_hcd_giveback_urb:1726 7f279bbbd800
[    4.460707] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.460720] usb_submit_urb:619 7f279bbbd800, interval 0 submit done
[    4.460727] usb_start_wait_urb:63 waiting 7f279bbbd800
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.460740] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.460766] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.460780] usb_giveback_urb_bh:1678
[    4.460786] __usb_hcd_giveback_urb:1646 7f279bbbd800
[    4.460792] __usb_hcd_giveback_urb:1663 calling complete
[    4.460800] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.460833] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.460851] usb_start_wait_urb:77 done 7f279bbbd800
[    4.460859] usb_submit_urb:376 7f279bbbd900, interval 0
[    4.460867] usb_hcd_submit_urb:1534 7f279bbbd900, interval 0
[    4.460873] usb_hcd_submit_urb:1553 7f279bbbd900
[    4.460878] rh_urb_enqueue:846 7f279bbbd900
[    4.460885] rh_call_control:491 7f279bbbd900
[    4.460896] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x200603, return 0x100103
[    4.460905] usb_hcd_giveback_urb:1726 7f279bbbd900
[    4.460910] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.460931] usb_submit_urb:619 7f279bbbd900, interval 0 submit done
[    4.460939] usb_start_wait_urb:63 waiting 7f279bbbd900
Add waiter 7f279588c2c0, exst:837, total:1
fuzz_trigger_wait_cond
[    4.460951] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.460976] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.460990] usb_giveback_urb_bh:1678
[    4.460997] __usb_hcd_giveback_urb:1646 7f279bbbd900
[    4.461002] __usb_hcd_giveback_urb:1663 calling complete
[    4.461011] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.461044] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c2c0, exst:(____ptrval____), total:0
[    4.461061] usb_start_wait_urb:77 done 7f279bbbd900
[    4.461071] usb_submit_urb:376 7f279bbbda00, interval 0
[    4.461079] usb_hcd_submit_urb:1534 7f279bbbda00, interval 0
[    4.461087] usb_hcd_submit_urb:1553 7f279bbbda00
[    4.461093] rh_urb_enqueue:846 7f279bbbda00
[    4.461099] rh_call_control:491 7f279bbbda00
[    4.461111] xhci-hcd xhci-hcd.0.auto: clear port1 reset change, portsc: 0x603
[    4.461119] usb_hcd_giveback_urb:1726 7f279bbbda00
[    4.461125] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.461138] usb_submit_urb:619 7f279bbbda00, interval 0 submit done
[    4.461145] usb_start_wait_urb:63 waiting 7f279bbbda00
Add waiter 7f279588c360, exst:742, total:1
fuzz_trigger_wait_cond
[    4.461158] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.461184] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.461199] usb_giveback_urb_bh:1678
[    4.461206] __usb_hcd_giveback_urb:1646 7f279bbbda00
[    4.461214] __usb_hcd_giveback_urb:1663 calling complete
[    4.461224] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.461254] schedule_timeout:1894 expired: timeout 100, expires 4294937840
Del waiter 7f279588c360, exst:(____ptrval____), total:0
[    4.461272] usb_start_wait_urb:77 done 7f279bbbda00
[    4.461281] xhci-hcd xhci-hcd.0.auto: Resetting device with slot ID 1
[    4.461290] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461298] queue_trb: 0 0 0 1004401
[    4.461306] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.461315] usb_hcd_irq:2339 Enter
[    4.461321] xhci_irq:2844 Enter
[    4.461334] xhci_handle_event:2727 Enter
[    4.461341] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461348] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.461364] xhci-hcd xhci-hcd.0.auto: Completed reset device command.
[    4.461371] xhci_handle_event:2776 Exit
[    4.461376] xhci_handle_event:2727 Enter
[    4.461383] xhci_irq:2909 Exit
[    4.461389] usb_hcd_irq:2347 Exit
[    4.461395] xhci_discover_or_reset_device:3790 waiting
[    4.461398] usb_hcd_irq:2339 Enter
[    4.461406] xhci_irq:2844 Enter
[    4.461411] xhci_irq:2909 Exit
[    4.461416] usb_hcd_irq:2347 Exit
Add waiter 7f279babf540, exst:801, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf540, exst:(____ptrval____), total:0
[    4.461439] xhci_discover_or_reset_device:3792 waiting done
[    4.461447] xhci-hcd xhci-hcd.0.auto: Successful reset device command.
[    4.461455] usb_set_device_state:2092
[    4.461461] usb_set_device_state:2125
[    4.461470] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461478] queue_trb: 9bbba000 7f27 0 1002c01
[    4.461486] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.461503] usb_hcd_irq:2339 Enter
[    4.461510] xhci_irq:2844 Enter
[    4.461516] xhci_handle_event:2727 Enter
[    4.461523] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461528] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.461542] xhci_handle_event:2776 Exit
[    4.461547] xhci_handle_event:2727 Enter
[    4.461554] xhci_irq:2909 Exit
[    4.461558] usb_hcd_irq:2347 Exit
[    4.461565] xhci_setup_device:4166 waiting
[    4.461567] usb_hcd_irq:2339 Enter
[    4.461576] xhci_irq:2844 Enter
[    4.461581] xhci_irq:2909 Exit
[    4.461586] usb_hcd_irq:2347 Exit
Add waiter 7f279babf580, exst:865, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf580, exst:(____ptrval____), total:0
[    4.461603] xhci_setup_device:4168 waiting done
[    4.461612] xhci-hcd xhci-hcd.0.auto: Successful setup address command
[    4.461620] xhci-hcd xhci-hcd.0.auto: Op regs DCBAA ptr = 0x007f279babd000
[    4.461630] xhci-hcd xhci-hcd.0.auto: Slot ID 1 dcbaa entry @(____ptrval____) = 0x007f279bbb9000
[    4.461638] xhci-hcd xhci-hcd.0.auto: Output Context DMA address = 0x7f279bbb9000
[    4.461647] xhci-hcd xhci-hcd.0.auto: Internal device address = 1
[    4.461655] usb_set_device_state:2092
[    4.461660] usb_set_device_state:2125
[    4.461671] usb 1-1: ep0 maxpacket = 8
[    4.461680] usb_submit_urb:376 7f279bbbdb00, interval 0
[    4.461689] usb_hcd_submit_urb:1534 7f279bbbdb00, interval 0
[    4.461696] usb_hcd_submit_urb:1556 7f279bbbdb00
[    4.461703] xhci_urb_enqueue:1472 7f279bbbdb00, interval 0
[    4.461713] xhci-hcd xhci-hcd.0.auto: Max Packet Size for ep 0 changed.
[    4.461721] xhci-hcd xhci-hcd.0.auto: Max packet size in usb_device = 8
[    4.461729] xhci-hcd xhci-hcd.0.auto: Max packet size in xHCI HW = 64
[    4.461737] xhci-hcd xhci-hcd.0.auto: Issuing evaluate context command.
[    4.461747] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461754] queue_trb: 9bbba000 7f27 0 1003401
[    4.461763] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.461771] usb_hcd_irq:2339 Enter
[    4.461777] xhci_irq:2844 Enter
[    4.461783] xhci_handle_event:2727 Enter
[    4.461790] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.461795] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.461815] xhci_handle_event:2776 Exit
[    4.461821] xhci_handle_event:2727 Enter
[    4.461828] xhci_irq:2909 Exit
[    4.461833] usb_hcd_irq:2347 Exit
[    4.461840] xhci_configure_endpoint:2819 waiting
[    4.461842] usb_hcd_irq:2339 Enter
[    4.461850] xhci_irq:2844 Enter
[    4.461855] xhci_irq:2909 Exit
[    4.461861] usb_hcd_irq:2347 Exit
Add waiter 7f279babf600, exst:0, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf600, exst:(____ptrval____), total:0
[    4.461878] xhci_configure_endpoint:2821 waiting done
[    4.461893] xhci-hcd xhci-hcd.0.auto: Successful evaluate context command
[    4.461902] queue_trb: 1000680 120000 8 30840
[    4.461909] queue_trb: 9babf5c0 7f27 12 10c05
[    4.461915] queue_trb: 0 0 0 1021
fuzz_get_n: idx 64, rem 481, size 16, val 0
[    4.461934] usb_hcd_irq:2339 Enter
[    4.461941] xhci_irq:2844 Enter
[    4.461947] xhci_handle_event:2727 Enter
[    4.461956] usb_hcd_giveback_urb:1726 7f279bbbdb00
[    4.461963] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.461974] xhci_handle_event:2776 Exit
[    4.461979] xhci_handle_event:2727 Enter
[    4.461986] xhci_irq:2909 Exit
[    4.461991] usb_hcd_irq:2347 Exit
[    4.461998] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.462005] usb_giveback_urb_bh:1678
[    4.462010] __usb_hcd_giveback_urb:1646 7f279bbbdb00
[    4.462017] __usb_hcd_giveback_urb:1663 calling complete
[    4.462023] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.462035] usb_submit_urb:619 7f279bbbdb00, interval 0 submit done
[    4.462037] usb_hcd_irq:2339 Enter
[    4.462046] xhci_irq:2844 Enter
[    4.462051] xhci_irq:2909 Exit
[    4.462056] usb_hcd_irq:2347 Exit
[    4.462064] usb_start_wait_urb:63 waiting 7f279bbbdb00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
--------------------------------------------------------------------------------
XXNOTE new device is added
--------------------------------------------------------------------------------
[    4.462081] usb_start_wait_urb:77 done 7f279bbbdb00
[    4.462093] usb_hub_to_struct_hub:144 7f279baf0000
[    4.462099] usb_get_intfdata 7f279baf0000
[    4.462106] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.462113] hub_port_init:4969 port 1 OK
[    4.462118] hub_port_init:4971 port 1 FAIL
[    4.462124] hub_port_connect:5241 port 1
[    4.462130] hub_port_connect:5309 -----------------
[    4.462140] usb_submit_urb:376 7f279bbbdc00, interval 0
[    4.462146] usb_hcd_submit_urb:1534 7f279bbbdc00, interval 0
[    4.462153] usb_hcd_submit_urb:1556 7f279bbbdc00
[    4.462160] xhci_urb_enqueue:1472 7f279bbbdc00, interval 0
[    4.462167] queue_trb: 2000680 90000 8 30840
[    4.462180] queue_trb: 9bbb6540 7f27 9 10c05
[    4.462187] queue_trb: 0 0 0 1021
fuzz_get_n: idx 80, rem 465, size 7, val 0
fuzz_get_n: idx 87, rem 458, size 7, val 0
fuzz_get_n: idx 94, rem 451, size 7, val 0
fuzz_get_n: idx 101, rem 444, size 7, val 0
fuzz_get_n: idx 108, rem 437, size 7, val 0
fuzz_get_n: idx 115, rem 430, size 7, val 0
fuzz_get_n: idx 122, rem 423, size 7, val 0
fuzz_get_n: idx 129, rem 416, size 7, val 0
fuzz_get_n: idx 136, rem 409, size 7, val 0
fuzz_get_n: idx 143, rem 402, size 7, val 0
fuzz_get_n: idx 150, rem 395, size 7, val 0
fuzz_get_n: idx 157, rem 388, size 7, val 0
fuzz_get_n: idx 164, rem 381, size 7, val 0
fuzz_get_n: idx 171, rem 374, size 7, val 0
fuzz_get_n: idx 178, rem 367, size 7, val 0
fuzz_get_n: idx 185, rem 360, size 7, val 0
fuzz_get_n: idx 192, rem 353, size 7, val 0
fuzz_get_n: idx 199, rem 346, size 7, val 0
fuzz_get_n: idx 206, rem 339, size 7, val 0
fuzz_get_n: idx 213, rem 332, size 7, val 0
fuzz_get_n: idx 220, rem 325, size 7, val 0
fuzz_get_n: idx 227, rem 318, size 7, val 0
fuzz_get_n: idx 234, rem 311, size 7, val 0
[    4.462302] usb_hcd_irq:2339 Enter
[    4.462309] xhci_irq:2844 Enter
[    4.462315] xhci_handle_event:2727 Enter
[    4.462324] usb_hcd_giveback_urb:1726 7f279bbbdc00
[    4.462331] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.462340] xhci_handle_event:2776 Exit
[    4.462345] xhci_handle_event:2727 Enter
[    4.462351] xhci_irq:2909 Exit
[    4.462357] usb_hcd_irq:2347 Exit
[    4.462364] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.462370] usb_giveback_urb_bh:1678
[    4.462375] __usb_hcd_giveback_urb:1646 7f279bbbdc00
[    4.462382] __usb_hcd_giveback_urb:1663 calling complete
[    4.462388] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.462400] usb_submit_urb:619 7f279bbbdc00, interval 0 submit done
[    4.462402] usb_hcd_irq:2339 Enter
[    4.462410] xhci_irq:2844 Enter
[    4.462416] xhci_irq:2909 Exit
[    4.462420] usb_hcd_irq:2347 Exit
[    4.462428] usb_start_wait_urb:63 waiting 7f279bbbdc00
Add waiter 7f279588c280, exst:773, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c280, exst:(____ptrval____), total:0
[    4.462444] usb_start_wait_urb:77 done 7f279bbbdc00
[    4.462453] usb_submit_urb:376 7f279bbbde00, interval 0
[    4.462470] usb_hcd_submit_urb:1534 7f279bbbde00, interval 0
[    4.462479] usb_hcd_submit_urb:1556 7f279bbbde00
[    4.462486] xhci_urb_enqueue:1472 7f279bbbde00, interval 0
[    4.462494] queue_trb: 2000680 b10000 8 30840
[    4.462500] queue_trb: 9bbbdd00 7f27 b1 10c05
[    4.462505] queue_trb: 0 0 0 1021
fuzz_get_n: idx 241, rem 304, size 7, val 0
fuzz_get_n: idx 248, rem 297, size 7, val 0
fuzz_get_n: idx 255, rem 290, size 7, val 0
fuzz_get_n: idx 262, rem 283, size 7, val 0
fuzz_get_n: idx 269, rem 276, size 7, val 0
fuzz_get_n: idx 276, rem 269, size 7, val 0
fuzz_get_n: idx 283, rem 262, size 7, val 0
fuzz_get_n: idx 290, rem 255, size 7, val 0
fuzz_get_n: idx 297, rem 248, size 7, val 0
fuzz_get_n: idx 304, rem 241, size 7, val 0
fuzz_get_n: idx 311, rem 234, size 7, val 0
fuzz_get_n: idx 318, rem 227, size 7, val 0
fuzz_get_n: idx 325, rem 220, size 7, val 0
fuzz_get_n: idx 332, rem 213, size 7, val 0
fuzz_get_n: idx 339, rem 206, size 7, val 0
fuzz_get_n: idx 346, rem 199, size 7, val 0
fuzz_get_n: idx 353, rem 192, size 7, val 0
fuzz_get_n: idx 360, rem 185, size 7, val 0
fuzz_get_n: idx 367, rem 178, size 7, val 0
fuzz_get_n: idx 374, rem 171, size 7, val 0
fuzz_get_n: idx 381, rem 164, size 7, val 0
fuzz_get_n: idx 388, rem 157, size 7, val 0
fuzz_get_n: idx 395, rem 150, size 7, val 0
[    4.462628] usb_hcd_irq:2339 Enter
[    4.462635] xhci_irq:2844 Enter
[    4.462641] xhci_handle_event:2727 Enter
[    4.462649] usb_hcd_giveback_urb:1726 7f279bbbde00
[    4.462656] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.462666] xhci_handle_event:2776 Exit
[    4.462671] xhci_handle_event:2727 Enter
[    4.462678] xhci_irq:2909 Exit
[    4.462683] usb_hcd_irq:2347 Exit
[    4.462689] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.462695] usb_giveback_urb_bh:1678
[    4.462700] __usb_hcd_giveback_urb:1646 7f279bbbde00
[    4.462707] __usb_hcd_giveback_urb:1663 calling complete
[    4.462713] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.462725] usb_submit_urb:619 7f279bbbde00, interval 0 submit done
[    4.462727] usb_hcd_irq:2339 Enter
[    4.462742] xhci_irq:2844 Enter
[    4.462749] xhci_irq:2909 Exit
[    4.462754] usb_hcd_irq:2347 Exit
[    4.462760] usb_start_wait_urb:63 waiting 7f279bbbde00
Add waiter 7f279588c280, exst:773, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588c280, exst:(____ptrval____), total:0
[    4.462777] usb_start_wait_urb:77 done 7f279bbbde00
[    4.462788] usb 1-1: config 252 has too many interfaces: 252, using maximum allowed: 32
[    4.462799] usb 1-1: config 252 has an invalid interface number: 252 but max is 251
[    4.462811] usb 1-1: config 252 has 4 interfaces, different from the descriptor's value: 252
[    4.462819] usb 1-1: config 252 has no interface number 1
[    4.462827] usb 1-1: config 252 has no interface number 2
[    4.462835] usb 1-1: config 252 has no interface number 3
[    4.462847] usb 1-1: config 252 interface 252 altsetting 252 has an invalid endpoint with address 0xFC, skipping
[    4.462857] usb 1-1: config 252 interface 252 altsetting 252 has an invalid endpoint with address 0xFC, skipping
[    4.462866] usb 1-1: config 252 interface 252 altsetting 252 has an invalid endpoint with address 0x0, skipping
[    4.462882] usb 1-1: config 252 interface 10 altsetting 255 has an invalid endpoint with address 0xFF, skipping
[    4.462891] usb 1-1: config 252 interface 10 altsetting 255 has an invalid endpoint with address 0x0, skipping
[    4.462902] usb 1-1: config 252 interface 0 altsetting 0 has an invalid endpoint with address 0x0, skipping
[    4.462911] usb 1-1: config 252 interface 0 altsetting 0 has an invalid endpoint with address 0xFC, skipping
[    4.462920] usb 1-1: Duplicate descriptor for config 252 interface 0 altsetting 0, skipping
[    4.462934] usb 1-1: Duplicate descriptor for config 252 interface 0 altsetting 0, skipping
[    4.462943] usb 1-1: Duplicate descriptor for config 252 interface 0 altsetting 0, skipping
[    4.462955] usb 1-1: config 252 interface 58 altsetting 0 endpoint 0x8D has an invalid bInterval 0, changing to 10
[    4.462965] usb 1-1: config 252 interface 58 altsetting 0 endpoint 0x8D has invalid wMaxPacketSize 0
[    4.462975] usb 1-1: config 252 interface 58 altsetting 0 has an invalid endpoint with address 0x0, skipping
[    4.462984] usb 1-1: config 252 interface 252 has no altsetting 0
[    4.462992] usb 1-1: config 252 interface 10 has no altsetting 0
[    4.463002] usb 1-1: udev 2, busnum 1, minor = 1
[    4.463013] usb 1-1: New USB device found, idVendor=c000, idProduct=0000, bcdDevice= 0.00
[    4.463022] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.463029] usb_hub_to_struct_hub:144 7f279baf0000
[    4.463034] usb_get_intfdata 7f279baf0000
[    4.463042] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.463191] usb 1-1: usb_probe_device
[    4.463202] usb_hub_to_struct_hub:144 7f279baf0000
[    4.463207] usb_get_intfdata 7f279baf0000
[    4.463214] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.463225] usb 1-1: configuration #252 chosen from 1 choice
[    4.463238] Did not find alt setting 0 for intf 252, config 252
[    4.463245] Did not find alt setting 0 for intf 10, config 252
[    4.463256] usb 1-1: ep 0x8d - rounding interval to 64 microframes, ep desc says 80 microframes
[    4.463279] xhci-hcd xhci-hcd.0.auto: add ep 0x8d, slot id 1, new drop flags = 0x0, new add flags = 0x8000001
[    4.463290] xhci-hcd xhci-hcd.0.auto: xhci_check_bandwidth called for udev (____ptrval____)
[    4.463299] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463305] queue_trb: 9bbba000 7f27 0 1003001
[    4.463313] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.463324] usb_hcd_irq:2339 Enter
[    4.463331] xhci_irq:2844 Enter
[    4.463342] xhci_handle_event:2727 Enter
[    4.463350] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463356] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.463371] xhci_handle_event:2776 Exit
[    4.463376] xhci_handle_event:2727 Enter
[    4.463383] xhci_irq:2909 Exit
[    4.463390] usb_hcd_irq:2347 Exit
[    4.463396] xhci_configure_endpoint:2819 waiting
[    4.463398] usb_hcd_irq:2339 Enter
[    4.463407] xhci_irq:2844 Enter
[    4.463412] xhci_irq:2909 Exit
[    4.463416] usb_hcd_irq:2347 Exit
Add waiter 7f279babf680, exst:866, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf680, exst:(____ptrval____), total:0
[    4.463434] xhci_configure_endpoint:2821 waiting done
[    4.463443] xhci-hcd xhci-hcd.0.auto: Successful Endpoint Configure command
[    4.463471] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463479] queue_trb: 0 0 0 11b3c01
[    4.463486] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.463495] usb_hcd_irq:2339 Enter
[    4.463500] xhci_irq:2844 Enter
[    4.463508] xhci_handle_event:2727 Enter
[    4.463513] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463520] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.463533] xhci_handle_event:2776 Exit
[    4.463538] xhci_handle_event:2727 Enter
[    4.463544] xhci_irq:2909 Exit
[    4.463551] usb_hcd_irq:2347 Exit
[    4.463557] xhci_endpoint_reset:3220 waiting
[    4.463559] usb_hcd_irq:2339 Enter
[    4.463567] xhci_irq:2844 Enter
[    4.463572] xhci_irq:2909 Exit
[    4.463577] usb_hcd_irq:2347 Exit
Add waiter 7f279babf6c0, exst:930, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf6c0, exst:(____ptrval____), total:0
[    4.463593] xhci_endpoint_reset:3222 waiting done
[    4.463600] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463608] queue_trb: 9bbc4000 7f27 0 1003001
[    4.463615] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.463626] usb_hcd_irq:2339 Enter
[    4.463632] xhci_irq:2844 Enter
[    4.463638] xhci_handle_event:2727 Enter
[    4.463645] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.463650] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.463662] xhci_handle_event:2776 Exit
[    4.463668] xhci_handle_event:2727 Enter
[    4.463674] xhci_irq:2909 Exit
[    4.463679] usb_hcd_irq:2347 Exit
[    4.463684] xhci_endpoint_reset:3245 waiting
[    4.463686] usb_hcd_irq:2339 Enter
[    4.463695] xhci_irq:2844 Enter
[    4.463705] xhci_irq:2909 Exit
[    4.463711] usb_hcd_irq:2347 Exit
Add waiter 7f279babf700, exst:0, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf700, exst:(____ptrval____), total:0
[    4.463731] xhci_endpoint_reset:3247 waiting done
[    4.463747] usb_submit_urb:376 7f279bbbf300, interval 0
[    4.463755] usb_hcd_submit_urb:1534 7f279bbbf300, interval 0
[    4.463761] usb_hcd_submit_urb:1556 7f279bbbf300
[    4.463768] xhci_urb_enqueue:1472 7f279bbbf300, interval 0
[    4.463777] queue_trb: fc0900 0 8 840
[    4.463784] queue_trb: 0 0 0 11021
[    4.463797] usb_hcd_irq:2339 Enter
[    4.463803] xhci_irq:2844 Enter
[    4.463810] xhci_handle_event:2727 Enter
[    4.463817] usb_hcd_giveback_urb:1726 7f279bbbf300
[    4.463825] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.463834] xhci_handle_event:2776 Exit
[    4.463839] xhci_handle_event:2727 Enter
[    4.463846] xhci_irq:2909 Exit
[    4.463851] usb_hcd_irq:2347 Exit
[    4.463858] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.463863] usb_giveback_urb_bh:1678
[    4.463870] __usb_hcd_giveback_urb:1646 7f279bbbf300
[    4.463875] __usb_hcd_giveback_urb:1663 calling complete
[    4.463881] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.463892] usb_submit_urb:619 7f279bbbf300, interval 0 submit done
[    4.463894] usb_hcd_irq:2339 Enter
[    4.463903] xhci_irq:2844 Enter
[    4.463908] xhci_irq:2909 Exit
[    4.463914] usb_hcd_irq:2347 Exit
[    4.463922] usb_start_wait_urb:63 waiting 7f279bbbf300
Add waiter 7f279588bfc0, exst:834, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588bfc0, exst:(____ptrval____), total:0
[    4.463939] usb_start_wait_urb:77 done 7f279bbbf300
[    4.463945] usb_set_device_state:2092
[    4.463952] usb_set_device_state:2125
[    4.463961] usb_submit_urb:376 7f279bbbf400, interval 0
[    4.463969] usb_hcd_submit_urb:1534 7f279bbbf400, interval 0
[    4.463977] usb_hcd_submit_urb:1556 7f279bbbf400
[    4.463984] xhci_urb_enqueue:1472 7f279bbbf400, interval 0
[    4.463993] queue_trb: 3000680 ff0000 8 30840
[    4.464000] queue_trb: 9bbab600 7f27 ff 10c05
[    4.464006] queue_trb: 0 0 0 1021
[    4.464020] usb_hcd_irq:2339 Enter
[    4.464027] xhci_irq:2844 Enter
[    4.464033] xhci_handle_event:2727 Enter
[    4.464043] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.464050] xhci_handle_event:2776 Exit
[    4.464055] xhci_handle_event:2727 Enter
[    4.464064] usb_hcd_giveback_urb:1726 7f279bbbf400
[    4.464070] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.464085] xhci_handle_event:2776 Exit
[    4.464090] xhci_handle_event:2727 Enter
[    4.464098] xhci_irq:2909 Exit
[    4.464104] usb_hcd_irq:2347 Exit
[    4.464111] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.464117] usb_giveback_urb_bh:1678
[    4.464123] __usb_hcd_giveback_urb:1646 7f279bbbf400
[    4.464130] __usb_hcd_giveback_urb:1663 calling complete
[    4.464138] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.464150] usb_submit_urb:619 7f279bbbf400, interval 0 submit done
[    4.464163] rh_timer_func:803
[    4.464173] usb_hcd_poll_rh_status:761
[    4.464183] xhci-hcd xhci-hcd.0.auto: xhci_hub_status_data: stopping port polling.
[    4.464191] usb_hcd_irq:2339 Enter
[    4.464197] xhci_irq:2844 Enter
[    4.464204] xhci_irq:2909 Exit
[    4.464209] usb_hcd_irq:2347 Exit
[    4.464216] usb_start_wait_urb:63 waiting 7f279bbbf400
Add waiter 7f279588be80, exst:769, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588be80, exst:(____ptrval____), total:0
[    4.464234] usb_start_wait_urb:77 done 7f279bbbf400
[    4.464243] usb 1-1: default language 0x0409
[    4.464252] usb_submit_urb:376 7f279bbbf500, interval 0
[    4.464259] usb_hcd_submit_urb:1534 7f279bbbf500, interval 0
[    4.464267] usb_hcd_submit_urb:1556 7f279bbbf500
[    4.464273] xhci_urb_enqueue:1472 7f279bbbf500, interval 0
[    4.464281] queue_trb: 3fc0680 ff0409 8 30840
[    4.464288] queue_trb: 9bbab600 7f27 ff 10c05
[    4.464294] queue_trb: 0 0 0 1021
fuzz_get_n: idx 402, rem 143, size 32, val 0
[    4.464314] usb_hcd_irq:2339 Enter
[    4.464321] xhci_irq:2844 Enter
[    4.464328] xhci_handle_event:2727 Enter
[    4.464338] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.464343] xhci_handle_event:2776 Exit
[    4.464350] xhci_handle_event:2727 Enter
[    4.464358] usb_hcd_giveback_urb:1726 7f279bbbf500
[    4.464365] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.464376] xhci_handle_event:2776 Exit
[    4.464381] xhci_handle_event:2727 Enter
[    4.464389] xhci_irq:2909 Exit
[    4.464395] usb_hcd_irq:2347 Exit
[    4.464401] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.464408] usb_giveback_urb_bh:1678
[    4.464414] __usb_hcd_giveback_urb:1646 7f279bbbf500
[    4.464421] __usb_hcd_giveback_urb:1663 calling complete
[    4.464429] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.464441] usb_submit_urb:619 7f279bbbf500, interval 0 submit done
[    4.464444] usb_hcd_irq:2339 Enter
[    4.464453] xhci_irq:2844 Enter
[    4.464458] xhci_irq:2909 Exit
[    4.464464] usb_hcd_irq:2347 Exit
[    4.464471] usb_start_wait_urb:63 waiting 7f279bbbf500
Add waiter 7f279588be80, exst:769, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588be80, exst:(____ptrval____), total:0
[    4.464488] usb_start_wait_urb:77 done 7f279bbbf500
[    4.464499] usb 1-1: adding 1-1:252.252 (config #252, interface 252)
[    4.464540] usb_submit_urb:376 7f279bbbf600, interval 0
[    4.464550] usb_hcd_submit_urb:1534 7f279bbbf600, interval 0
[    4.464556] usb_hcd_submit_urb:1556 7f279bbbf600
[    4.464564] xhci_urb_enqueue:1472 7f279bbbf600, interval 0
[    4.464573] queue_trb: 3fc0680 ff0409 8 30840
[    4.464580] queue_trb: 9bbaba00 7f27 ff 10c05
[    4.464588] queue_trb: 0 0 0 1021
fuzz_get_n: idx 434, rem 111, size 32, val 0
[    4.464608] usb_hcd_irq:2339 Enter
[    4.464614] xhci_irq:2844 Enter
[    4.464621] xhci_handle_event:2727 Enter
[    4.464631] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.464637] xhci_handle_event:2776 Exit
[    4.464642] xhci_handle_event:2727 Enter
[    4.464651] usb_hcd_giveback_urb:1726 7f279bbbf600
[    4.464658] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.464668] xhci_handle_event:2776 Exit
[    4.464674] xhci_handle_event:2727 Enter
[    4.464681] xhci_irq:2909 Exit
[    4.464687] usb_hcd_irq:2347 Exit
[    4.464694] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.464700] usb_giveback_urb_bh:1678
[    4.464706] __usb_hcd_giveback_urb:1646 7f279bbbf600
[    4.464713] __usb_hcd_giveback_urb:1663 calling complete
[    4.464719] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.464731] usb_submit_urb:619 7f279bbbf600, interval 0 submit done
[    4.464733] usb_hcd_irq:2339 Enter
[    4.464743] xhci_irq:2844 Enter
[    4.464748] xhci_irq:2909 Exit
[    4.464753] usb_hcd_irq:2347 Exit
[    4.464761] usb_start_wait_urb:63 waiting 7f279bbbf600
Add waiter 7f279588bc40, exst:703, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588bc40, exst:(____ptrval____), total:0
--------------------------------------------------------------------------------
XXNOTE probe_interface fails and sets hdev->actconfig->interface[0]->dev to NULL
--------------------------------------------------------------------------------
[    4.464780] usb_start_wait_urb:77 done 7f279bbbf600
[    4.464813] hub 1-1:252.252: usb_probe_interface
[    4.464822] usb_hub_to_struct_hub:144 7f279baf0000
[    4.464827] usb_get_intfdata 7f279baf0000
[    4.464835] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.464844] hub 1-1:252.252: usb_probe_interface - got id
[    4.464853] hub 1-1:252.252: bad descriptor, ignoring hub
[    4.464859] usb_probe_interface:409 err
[    4.464866] usb_probe_interface:423 err set intf to NULL <--- XXNOTE here
[    4.464871] usb_set_intfdata 7f279bbad000 - 0
[    4.464878] really_probe:564: probe '1-1:252.252' returned -5
[    4.464892] hub: probe of 1-1:252.252 failed with error -5
[    4.465005] usb 1-1: adding 1-1:252.10 (config #252, interface 10)
[    4.465038] usb_submit_urb:376 7f279bbbf700, interval 0
[    4.465048] usb_hcd_submit_urb:1534 7f279bbbf700, interval 0
[    4.465055] usb_hcd_submit_urb:1556 7f279bbbf700
[    4.465062] xhci_urb_enqueue:1472 7f279bbbf700, interval 0
[    4.465071] queue_trb: 3ff0680 ff0409 8 30840
[    4.465079] queue_trb: 9bbabe00 7f27 ff 10c05
[    4.465086] queue_trb: 0 0 0 1021
fuzz_get_n: idx 466, rem 79, size 32, val 0
[    4.465108] usb_hcd_irq:2339 Enter
[    4.465115] xhci_irq:2844 Enter
[    4.465122] xhci_handle_event:2727 Enter
[    4.465132] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.465139] xhci_handle_event:2776 Exit
[    4.465144] xhci_handle_event:2727 Enter
[    4.465153] usb_hcd_giveback_urb:1726 7f279bbbf700
[    4.465160] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.465171] xhci_handle_event:2776 Exit
[    4.465176] xhci_handle_event:2727 Enter
[    4.465184] xhci_irq:2909 Exit
[    4.465190] usb_hcd_irq:2347 Exit
[    4.465197] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.465203] usb_giveback_urb_bh:1678
[    4.465209] __usb_hcd_giveback_urb:1646 7f279bbbf700
[    4.465216] __usb_hcd_giveback_urb:1663 calling complete
[    4.465222] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.465234] usb_submit_urb:619 7f279bbbf700, interval 0 submit done
[    4.465237] usb_hcd_irq:2339 Enter
[    4.465246] xhci_irq:2844 Enter
[    4.465251] xhci_irq:2909 Exit
[    4.465256] usb_hcd_irq:2347 Exit
[    4.465263] usb_start_wait_urb:63 waiting 7f279bbbf700
Add waiter 7f279588bc40, exst:703, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588bc40, exst:(____ptrval____), total:0
[    4.465280] usb_start_wait_urb:77 done 7f279bbbf700
[    4.465314] hub 1-1:252.10: usb_probe_interface
[    4.465323] usb_hub_to_struct_hub:144 7f279baf0000
[    4.465328] usb_get_intfdata 7f279baf0000
[    4.465336] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.465345] hub 1-1:252.10: usb_probe_interface - got id
[    4.465354] hub 1-1:252.10: bad descriptor, ignoring hub
[    4.465359] usb_probe_interface:409 err
[    4.465365] usb_probe_interface:423 err set intf to NULL <--- XXNOTE here
[    4.465371] usb_set_intfdata 7f279bbad800 - 0
[    4.465378] really_probe:564: probe '1-1:252.10' returned -5
[    4.465388] hub: probe of 1-1:252.10 failed with error -5
[    4.465466] usb 1-1: adding 1-1:252.0 (config #252, interface 0)
[    4.465516] hub 1-1:252.0: usb_probe_interface
[    4.465525] usb_hub_to_struct_hub:144 7f279baf0000
[    4.465532] usb_get_intfdata 7f279baf0000
[    4.465539] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.465548] hub 1-1:252.0: usb_probe_interface - got id
[    4.465556] hub 1-1:252.0: bad descriptor, ignoring hub
[    4.465562] usb_probe_interface:409 err
[    4.465568] usb_probe_interface:423 err set intf to NULL <--- XXNOTE here
[    4.465574] usb_set_intfdata 7f279bbae000 - 0
[    4.465581] really_probe:564: probe '1-1:252.0' returned -5
[    4.465591] hub: probe of 1-1:252.0 failed with error -5
[    4.465672] usb 1-1: adding 1-1:252.58 (config #252, interface 58)
[    4.465697] usb_submit_urb:376 7f279bbbf800, interval 0
[    4.465706] usb_hcd_submit_urb:1534 7f279bbbf800, interval 0
[    4.465712] usb_hcd_submit_urb:1556 7f279bbbf800
[    4.465721] xhci_urb_enqueue:1472 7f279bbbf800, interval 0
[    4.465729] queue_trb: 3ff0680 ff0409 8 30840
[    4.465737] queue_trb: 9bbc7400 7f27 ff 10c05
[    4.465743] queue_trb: 0 0 0 1021
fuzz_get_n: idx 498, rem 47, size 32, val 0
[    4.465765] usb_hcd_irq:2339 Enter
[    4.465771] xhci_irq:2844 Enter
[    4.465778] xhci_handle_event:2727 Enter
[    4.465788] xhci-hcd xhci-hcd.0.auto: Waiting for status stage event
[    4.465794] xhci_handle_event:2776 Exit
[    4.465799] xhci_handle_event:2727 Enter
[    4.465807] usb_hcd_giveback_urb:1726 7f279bbbf800
[    4.465813] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.465824] xhci_handle_event:2776 Exit
[    4.465830] xhci_handle_event:2727 Enter
[    4.465837] xhci_irq:2909 Exit
[    4.465842] usb_hcd_irq:2347 Exit
[    4.465850] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.465855] usb_giveback_urb_bh:1678
[    4.465863] __usb_hcd_giveback_urb:1646 7f279bbbf800
[    4.465869] __usb_hcd_giveback_urb:1663 calling complete
[    4.465876] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.465889] usb_submit_urb:619 7f279bbbf800, interval 0 submit done
[    4.465891] usb_hcd_irq:2339 Enter
[    4.465900] xhci_irq:2844 Enter
[    4.465906] xhci_irq:2909 Exit
[    4.465911] usb_hcd_irq:2347 Exit
[    4.465919] usb_start_wait_urb:63 waiting 7f279bbbf800
Add waiter 7f279588bc40, exst:703, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588bc40, exst:(____ptrval____), total:0
[    4.465936] usb_start_wait_urb:77 done 7f279bbbf800
[    4.465988] hub 1-1:252.58: usb_probe_interface
[    4.465997] usb_hub_to_struct_hub:144 7f279baf0000
[    4.466004] usb_get_intfdata 7f279baf0000
[    4.466011] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.466020] hub 1-1:252.58: usb_probe_interface - got id
[    4.466027] hub 1-1:252.58: USB hub found
[    4.466039] usb_set_intfdata 7f279bbae800 - 7f279bbd2000
[    4.466046] hub_configure:1399
[    4.466054] usb_submit_urb:376 7f279bbbf900, interval 0
[    4.466063] usb_hcd_submit_urb:1534 7f279bbbf900, interval 0
[    4.466070] usb_hcd_submit_urb:1556 7f279bbbf900
[    4.466078] xhci_urb_enqueue:1472 7f279bbbf900, interval 0
[    4.466087] queue_trb: 290006a0 f0000 8 30840
[    4.466094] queue_trb: 9bbb6780 7f27 f 10c05
[    4.466102] queue_trb: 0 0 0 1021
fuzz_get_n: idx 530, rem 15, size 15, val 0
[    4.466126] usb_hcd_irq:2339 Enter
[    4.466133] xhci_irq:2844 Enter
[    4.466140] xhci_handle_event:2727 Enter
[    4.466149] usb_hcd_giveback_urb:1726 7f279bbbf900
[    4.466156] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.466167] xhci_handle_event:2776 Exit
[    4.466172] xhci_handle_event:2727 Enter
[    4.466180] xhci_irq:2909 Exit
[    4.466186] usb_hcd_irq:2347 Exit
[    4.466193] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.466199] usb_giveback_urb_bh:1678
[    4.466205] __usb_hcd_giveback_urb:1646 7f279bbbf900
[    4.466212] __usb_hcd_giveback_urb:1663 calling complete
[    4.466220] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.466233] usb_submit_urb:619 7f279bbbf900, interval 0 submit done
[    4.466235] usb_hcd_irq:2339 Enter
[    4.466244] xhci_irq:2844 Enter
[    4.466249] xhci_irq:2909 Exit
[    4.466255] usb_hcd_irq:2347 Exit
[    4.466262] usb_start_wait_urb:63 waiting 7f279bbbf900
Add waiter 7f279588b920, exst:668, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b920, exst:(____ptrval____), total:0
[    4.466278] usb_start_wait_urb:77 done 7f279bbbf900
[    4.466288] hub 1-1:252.58: 16 ports detected
[    4.466296] hub 1-1:252.58: standalone hub
[    4.466304] hub 1-1:252.58: ganged power switching
[    4.466312] hub 1-1:252.58: global over-current protection
[    4.466319] hub 1-1:252.58: power on to power good time: 0ms
[    4.466328] usb_submit_urb:376 7f279bbbfa00, interval 0
[    4.466335] usb_hcd_submit_urb:1534 7f279bbbfa00, interval 0
[    4.466342] usb_hcd_submit_urb:1556 7f279bbbfa00
[    4.466349] xhci_urb_enqueue:1472 7f279bbbfa00, interval 0
[    4.466358] queue_trb: 80 20000 8 30840
[    4.466364] queue_trb: 9bbb3f00 7f27 2 10c05
[    4.466372] queue_trb: 0 0 0 1021
fuzz_get_n: idx 545, rem 0, size 2, val 0
[    4.466397] usb_hcd_irq:2339 Enter
[    4.466405] xhci_irq:2844 Enter
[    4.466411] xhci_handle_event:2727 Enter
[    4.466420] usb_hcd_giveback_urb:1726 7f279bbbfa00
[    4.466427] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.466438] xhci_handle_event:2776 Exit
[    4.466443] xhci_handle_event:2727 Enter
[    4.466450] xhci_irq:2909 Exit
[    4.466457] usb_hcd_irq:2347 Exit
[    4.466472] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.466482] usb_giveback_urb_bh:1678
[    4.466488] __usb_hcd_giveback_urb:1646 7f279bbbfa00
[    4.466496] __usb_hcd_giveback_urb:1663 calling complete
[    4.466503] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.466517] usb_submit_urb:619 7f279bbbfa00, interval 0 submit done
[    4.466519] usb_hcd_irq:2339 Enter
[    4.466528] xhci_irq:2844 Enter
[    4.466534] xhci_irq:2909 Exit
[    4.466539] usb_hcd_irq:2347 Exit
[    4.466547] usb_start_wait_urb:63 waiting 7f279bbbfa00
Add waiter 7f279588b8c0, exst:827, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b8c0, exst:(____ptrval____), total:0
[    4.466563] usb_start_wait_urb:77 done 7f279bbbfa00
[    4.466573] hub 1-1:252.58: hub controller current requirement: 0mA
[    4.466582] hub 1-1:252.58: insufficient power available to use all downstream ports
[    4.466589] hub 1-1:252.58: 100mA bus power budget for each child
[    4.466598] usb_submit_urb:376 7f279bbbfb00, interval 0
[    4.466605] usb_hcd_submit_urb:1534 7f279bbbfb00, interval 0
[    4.466611] usb_hcd_submit_urb:1556 7f279bbbfb00
[    4.466618] xhci_urb_enqueue:1472 7f279bbbfb00, interval 0
[    4.466626] queue_trb: a0 40000 8 30840
[    4.466635] queue_trb: 9bbb3eb0 7f27 4 10c05
[    4.466641] queue_trb: 0 0 0 1021
fuzz_get_n: idx 547, rem -2, size 4, val 0
[    4.466664] usb_hcd_irq:2339 Enter
[    4.466672] xhci_irq:2844 Enter
[    4.466678] xhci_handle_event:2727 Enter
[    4.466687] usb_hcd_giveback_urb:1726 7f279bbbfb00
[    4.466694] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.466705] xhci_handle_event:2776 Exit
[    4.466710] xhci_handle_event:2727 Enter
[    4.466716] xhci_irq:2909 Exit
[    4.466721] usb_hcd_irq:2347 Exit
[    4.466728] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.466736] usb_giveback_urb_bh:1678
[    4.466742] __usb_hcd_giveback_urb:1646 7f279bbbfb00
[    4.466749] __usb_hcd_giveback_urb:1663 calling complete
[    4.466755] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.466767] usb_submit_urb:619 7f279bbbfb00, interval 0 submit done
[    4.466770] usb_hcd_irq:2339 Enter
[    4.466779] xhci_irq:2844 Enter
[    4.466784] xhci_irq:2909 Exit
[    4.466790] usb_hcd_irq:2347 Exit
[    4.466796] usb_start_wait_urb:63 waiting 7f279bbbfb00
Add waiter 7f279588b8a0, exst:795, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b8a0, exst:(____ptrval____), total:0
[    4.466812] usb_start_wait_urb:77 done 7f279bbbfb00
[    4.466821] hub 1-1:252.58: local power source is good
[    4.466830] hub 1-1:252.58: no over-current condition exists
[    4.466837] hub_configure:1675 maxchild 16
[    4.466845] usb_hub_create_port_device:536 port 1
[    4.466875] usb_hub_to_struct_hub:144 7f279baf0000
[    4.466883] usb_get_intfdata 7f279baf0000
[    4.466890] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.466898] usb_hub_to_struct_hub:140 0 0 0
[    4.466905] usb_hub_create_port_device:536 port 2
[    4.466923] usb_hub_to_struct_hub:144 7f279baf0000
[    4.466930] usb_get_intfdata 7f279baf0000
[    4.466937] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.466944] usb_hub_to_struct_hub:140 0 0 0
[    4.466950] usb_hub_create_port_device:536 port 3
[    4.466977] usb_hub_to_struct_hub:144 7f279baf0000
[    4.466985] usb_get_intfdata 7f279baf0000
[    4.466991] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.466999] usb_hub_to_struct_hub:140 0 0 0
[    4.467005] usb_hub_create_port_device:536 port 4
[    4.467027] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467035] usb_get_intfdata 7f279baf0000
[    4.467041] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467049] usb_hub_to_struct_hub:140 0 0 0
[    4.467055] usb_hub_create_port_device:536 port 5
[    4.467072] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467079] usb_get_intfdata 7f279baf0000
[    4.467085] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467092] usb_hub_to_struct_hub:140 0 0 0
[    4.467100] usb_hub_create_port_device:536 port 6
[    4.467120] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467128] usb_get_intfdata 7f279baf0000
[    4.467134] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467142] usb_hub_to_struct_hub:140 0 0 0
[    4.467148] usb_hub_create_port_device:536 port 7
[    4.467164] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467171] usb_get_intfdata 7f279baf0000
[    4.467177] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467184] usb_hub_to_struct_hub:140 0 0 0
[    4.467190] usb_hub_create_port_device:536 port 8
[    4.467210] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467217] usb_get_intfdata 7f279baf0000
[    4.467224] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467231] usb_hub_to_struct_hub:140 0 0 0
[    4.467237] usb_hub_create_port_device:536 port 9
[    4.467253] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467260] usb_get_intfdata 7f279baf0000
[    4.467267] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467273] usb_hub_to_struct_hub:140 0 0 0
[    4.467280] usb_hub_create_port_device:536 port 10
[    4.467298] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467305] usb_get_intfdata 7f279baf0000
[    4.467312] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467319] usb_hub_to_struct_hub:140 0 0 0
[    4.467325] usb_hub_create_port_device:536 port 11
[    4.467352] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467360] usb_get_intfdata 7f279baf0000
[    4.467367] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467374] usb_hub_to_struct_hub:140 0 0 0
[    4.467380] usb_hub_create_port_device:536 port 12
[    4.467397] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467403] usb_get_intfdata 7f279baf0000
[    4.467410] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467418] usb_hub_to_struct_hub:140 0 0 0
[    4.467423] usb_hub_create_port_device:536 port 13
[    4.467440] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467446] usb_get_intfdata 7f279baf0000
[    4.467453] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467460] usb_hub_to_struct_hub:140 0 0 0
[    4.467467] usb_hub_create_port_device:536 port 14
[    4.467486] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467494] usb_get_intfdata 7f279baf0000
[    4.467500] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467508] usb_hub_to_struct_hub:140 0 0 0
[    4.467514] usb_hub_create_port_device:536 port 15
[    4.467533] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467540] usb_get_intfdata 7f279baf0000
[    4.467547] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467554] usb_hub_to_struct_hub:140 0 0 0
[    4.467560] usb_hub_create_port_device:536 port 16
[    4.467576] usb_hub_to_struct_hub:144 7f279baf0000
[    4.467583] usb_get_intfdata 7f279baf0000
[    4.467590] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.467597] usb_hub_to_struct_hub:140 0 0 0
[    4.467609] xhci-hcd xhci-hcd.0.auto: xHCI version 100 needs hub TT think time and number of ports
[    4.467619] xhci-hcd xhci-hcd.0.auto: Set up configure endpoint for hub device.
[    4.467627] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.467635] queue_trb: 9bbc4000 7f27 0 1003001
[    4.467644] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.467654] usb_hcd_irq:2339 Enter
[    4.467660] xhci_irq:2844 Enter
[    4.467667] xhci_handle_event:2727 Enter
[    4.467674] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.467681] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.467696] xhci_handle_event:2776 Exit
[    4.467702] xhci_handle_event:2727 Enter
[    4.467708] xhci_irq:2909 Exit
[    4.467715] usb_hcd_irq:2347 Exit
[    4.467721] xhci_configure_endpoint:2819 waiting
[    4.467723] usb_hcd_irq:2339 Enter
[    4.467732] xhci_irq:2844 Enter
[    4.467737] xhci_irq:2909 Exit
[    4.467743] usb_hcd_irq:2347 Exit
Add waiter 7f279babf780, exst:867, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf780, exst:(____ptrval____), total:0
[    4.467761] xhci_configure_endpoint:2821 waiting done
[    4.467771] xhci-hcd xhci-hcd.0.auto: Successful Endpoint Configure command
[    4.467780] usb_hub_to_struct_hub:144 7f279bbad000
[    4.467786] usb_get_intfdata 7f279bbad000
[    4.467792] usb_hub_to_struct_hub:146 7f279bacd000 7f279bbac800 10 ret 0
[    4.467799] hub_activate
[    4.467807] hub 1-1:252.58: enabling power on all ports
[    4.467815] usb_submit_urb:376 7f279bbbfd00, interval 0
[    4.467824] usb_hcd_submit_urb:1534 7f279bbbfd00, interval 0
[    4.467830] usb_hcd_submit_urb:1556 7f279bbbfd00
[    4.467837] xhci_urb_enqueue:1472 7f279bbbfd00, interval 0
[    4.467850] queue_trb: 80323 1 8 840
[    4.467858] queue_trb: 0 0 0 11021
fuzz_get_n: idx 551, rem -6, size 256, val 0
[    4.467883] usb_hcd_irq:2339 Enter
[    4.467890] xhci_irq:2844 Enter
[    4.467896] xhci_handle_event:2727 Enter
[    4.467904] usb_hcd_giveback_urb:1726 7f279bbbfd00
[    4.467912] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.467924] xhci_handle_event:2776 Exit
[    4.467931] xhci_handle_event:2727 Enter
[    4.467937] xhci_irq:2909 Exit
[    4.467944] usb_hcd_irq:2347 Exit
[    4.467950] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.467956] usb_giveback_urb_bh:1678
[    4.467962] __usb_hcd_giveback_urb:1646 7f279bbbfd00
[    4.467969] __usb_hcd_giveback_urb:1663 calling complete
[    4.467975] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.467988] usb_submit_urb:619 7f279bbbfd00, interval 0 submit done
[    4.467990] usb_hcd_irq:2339 Enter
[    4.467999] xhci_irq:2844 Enter
[    4.468005] xhci_irq:2909 Exit
[    4.468011] usb_hcd_irq:2347 Exit
[    4.468019] usb_start_wait_urb:63 waiting 7f279bbbfd00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.468035] usb_start_wait_urb:77 done 7f279bbbfd00
[    4.468043] usb_submit_urb:376 7f279bbbfe00, interval 0
[    4.468051] usb_hcd_submit_urb:1534 7f279bbbfe00, interval 0
[    4.468058] usb_hcd_submit_urb:1556 7f279bbbfe00
[    4.468064] xhci_urb_enqueue:1472 7f279bbbfe00, interval 0
[    4.468073] queue_trb: 80323 2 8 840
[    4.468079] queue_trb: 0 0 0 11021
fuzz_get_n: idx 807, rem -262, size 256, val 0
[    4.468110] usb_hcd_irq:2339 Enter
[    4.468117] xhci_irq:2844 Enter
[    4.468123] xhci_handle_event:2727 Enter
[    4.468132] usb_hcd_giveback_urb:1726 7f279bbbfe00
[    4.468139] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.468150] xhci_handle_event:2776 Exit
[    4.468155] xhci_handle_event:2727 Enter
[    4.468162] xhci_irq:2909 Exit
[    4.468169] usb_hcd_irq:2347 Exit
[    4.468176] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.468182] usb_giveback_urb_bh:1678
[    4.468188] __usb_hcd_giveback_urb:1646 7f279bbbfe00
[    4.468194] __usb_hcd_giveback_urb:1663 calling complete
[    4.468200] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.468213] usb_submit_urb:619 7f279bbbfe00, interval 0 submit done
[    4.468215] usb_hcd_irq:2339 Enter
[    4.468223] xhci_irq:2844 Enter
[    4.468228] xhci_irq:2909 Exit
[    4.468236] usb_hcd_irq:2347 Exit
[    4.468243] usb_start_wait_urb:63 waiting 7f279bbbfe00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.468260] usb_start_wait_urb:77 done 7f279bbbfe00
[    4.468269] usb_submit_urb:376 7f279bbbff00, interval 0
[    4.468277] usb_hcd_submit_urb:1534 7f279bbbff00, interval 0
[    4.468285] usb_hcd_submit_urb:1556 7f279bbbff00
[    4.468291] xhci_urb_enqueue:1472 7f279bbbff00, interval 0
[    4.468300] queue_trb: 80323 3 8 840
[    4.468306] queue_trb: 0 0 0 11021
fuzz_get_n: idx 1063, rem -518, size 256, val 0
[    4.468329] usb_hcd_irq:2339 Enter
[    4.468336] xhci_irq:2844 Enter
[    4.468342] xhci_handle_event:2727 Enter
[    4.468351] usb_hcd_giveback_urb:1726 7f279bbbff00
[    4.468358] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.468368] xhci_handle_event:2776 Exit
[    4.468374] xhci_handle_event:2727 Enter
[    4.468381] xhci_irq:2909 Exit
[    4.468388] usb_hcd_irq:2347 Exit
[    4.468396] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.468402] usb_giveback_urb_bh:1678
[    4.468408] __usb_hcd_giveback_urb:1646 7f279bbbff00
[    4.468414] __usb_hcd_giveback_urb:1663 calling complete
[    4.468420] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.468433] usb_submit_urb:619 7f279bbbff00, interval 0 submit done
[    4.468435] usb_hcd_irq:2339 Enter
[    4.468444] xhci_irq:2844 Enter
[    4.468450] xhci_irq:2909 Exit
[    4.468455] usb_hcd_irq:2347 Exit
[    4.468462] usb_start_wait_urb:63 waiting 7f279bbbff00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.468477] usb_start_wait_urb:77 done 7f279bbbff00
[    4.468494] usb_submit_urb:376 7f279bbec000, interval 0
[    4.468503] usb_hcd_submit_urb:1534 7f279bbec000, interval 0
[    4.468509] usb_hcd_submit_urb:1556 7f279bbec000
[    4.468516] xhci_urb_enqueue:1472 7f279bbec000, interval 0
[    4.468524] queue_trb: 80323 4 8 840
[    4.468532] queue_trb: 0 0 0 11021
fuzz_get_n: idx 1319, rem -774, size 256, val 0
[    4.468555] usb_hcd_irq:2339 Enter
[    4.468563] xhci_irq:2844 Enter
[    4.468569] xhci_handle_event:2727 Enter
[    4.468578] usb_hcd_giveback_urb:1726 7f279bbec000
[    4.468585] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.468606] xhci_handle_event:2776 Exit
[    4.468612] xhci_handle_event:2727 Enter
[    4.468620] xhci_irq:2909 Exit
[    4.468626] usb_hcd_irq:2347 Exit
[    4.468632] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.468639] usb_giveback_urb_bh:1678
[    4.468644] __usb_hcd_giveback_urb:1646 7f279bbec000
[    4.468651] __usb_hcd_giveback_urb:1663 calling complete
[    4.468657] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.468670] usb_submit_urb:619 7f279bbec000, interval 0 submit done
[    4.468672] usb_hcd_irq:2339 Enter
[    4.468681] xhci_irq:2844 Enter
[    4.468687] xhci_irq:2909 Exit
[    4.468692] usb_hcd_irq:2347 Exit
[    4.468700] usb_start_wait_urb:63 waiting 7f279bbec000
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.468716] usb_start_wait_urb:77 done 7f279bbec000
[    4.468724] usb_submit_urb:376 7f279bbec100, interval 0
[    4.468732] usb_hcd_submit_urb:1534 7f279bbec100, interval 0
[    4.468739] usb_hcd_submit_urb:1556 7f279bbec100
[    4.468747] xhci_urb_enqueue:1472 7f279bbec100, interval 0
[    4.468756] queue_trb: 80323 5 8 840
[    4.468764] queue_trb: 0 0 0 11021
fuzz_get_n: idx 1575, rem -1030, size 256, val 0
[    4.468786] usb_hcd_irq:2339 Enter
[    4.468793] xhci_irq:2844 Enter
[    4.468799] xhci_handle_event:2727 Enter
[    4.468808] usb_hcd_giveback_urb:1726 7f279bbec100
[    4.468813] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.468824] xhci_handle_event:2776 Exit
[    4.468829] xhci_handle_event:2727 Enter
[    4.468836] xhci_irq:2909 Exit
[    4.468841] usb_hcd_irq:2347 Exit
[    4.468849] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.468855] usb_giveback_urb_bh:1678
[    4.468862] __usb_hcd_giveback_urb:1646 7f279bbec100
[    4.468868] __usb_hcd_giveback_urb:1663 calling complete
[    4.468876] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.468887] usb_submit_urb:619 7f279bbec100, interval 0 submit done
[    4.468889] usb_hcd_irq:2339 Enter
[    4.468899] xhci_irq:2844 Enter
[    4.468904] xhci_irq:2909 Exit
[    4.468910] usb_hcd_irq:2347 Exit
[    4.468917] usb_start_wait_urb:63 waiting 7f279bbec100
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.468934] usb_start_wait_urb:77 done 7f279bbec100
[    4.468942] usb_submit_urb:376 7f279bbec200, interval 0
[    4.468950] usb_hcd_submit_urb:1534 7f279bbec200, interval 0
[    4.468957] usb_hcd_submit_urb:1556 7f279bbec200
[    4.468963] xhci_urb_enqueue:1472 7f279bbec200, interval 0
[    4.468972] queue_trb: 80323 6 8 840
[    4.468978] queue_trb: 0 0 0 11021
fuzz_get_n: idx 1831, rem -1286, size 256, val 0
[    4.468999] usb_hcd_irq:2339 Enter
[    4.469006] xhci_irq:2844 Enter
[    4.469012] xhci_handle_event:2727 Enter
[    4.469021] usb_hcd_giveback_urb:1726 7f279bbec200
[    4.469028] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.469040] xhci_handle_event:2776 Exit
[    4.469045] xhci_handle_event:2727 Enter
[    4.469051] xhci_irq:2909 Exit
[    4.469058] usb_hcd_irq:2347 Exit
[    4.469064] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.469070] usb_giveback_urb_bh:1678
[    4.469076] __usb_hcd_giveback_urb:1646 7f279bbec200
[    4.469083] __usb_hcd_giveback_urb:1663 calling complete
[    4.469089] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.469101] usb_submit_urb:619 7f279bbec200, interval 0 submit done
[    4.469103] usb_hcd_irq:2339 Enter
[    4.469113] xhci_irq:2844 Enter
[    4.469118] xhci_irq:2909 Exit
[    4.469124] usb_hcd_irq:2347 Exit
[    4.469131] usb_start_wait_urb:63 waiting 7f279bbec200
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.469157] usb_start_wait_urb:77 done 7f279bbec200
[    4.469165] usb_submit_urb:376 7f279bbec300, interval 0
[    4.469173] usb_hcd_submit_urb:1534 7f279bbec300, interval 0
[    4.469180] usb_hcd_submit_urb:1556 7f279bbec300
[    4.469187] xhci_urb_enqueue:1472 7f279bbec300, interval 0
[    4.469195] queue_trb: 80323 7 8 840
[    4.469202] queue_trb: 0 0 0 11021
fuzz_get_n: idx 2087, rem -1542, size 256, val 0
[    4.469224] usb_hcd_irq:2339 Enter
[    4.469231] xhci_irq:2844 Enter
[    4.469237] xhci_handle_event:2727 Enter
[    4.469246] usb_hcd_giveback_urb:1726 7f279bbec300
[    4.469253] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.469264] xhci_handle_event:2776 Exit
[    4.469269] xhci_handle_event:2727 Enter
[    4.469277] xhci_irq:2909 Exit
[    4.469283] usb_hcd_irq:2347 Exit
[    4.469290] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.469297] usb_giveback_urb_bh:1678
[    4.469302] __usb_hcd_giveback_urb:1646 7f279bbec300
[    4.469309] __usb_hcd_giveback_urb:1663 calling complete
[    4.469315] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.469327] usb_submit_urb:619 7f279bbec300, interval 0 submit done
[    4.469329] usb_hcd_irq:2339 Enter
[    4.469338] xhci_irq:2844 Enter
[    4.469344] xhci_irq:2909 Exit
[    4.469349] usb_hcd_irq:2347 Exit
[    4.469357] usb_start_wait_urb:63 waiting 7f279bbec300
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.469374] usb_start_wait_urb:77 done 7f279bbec300
[    4.469383] usb_submit_urb:376 7f279bbec400, interval 0
[    4.469391] usb_hcd_submit_urb:1534 7f279bbec400, interval 0
[    4.469397] usb_hcd_submit_urb:1556 7f279bbec400
[    4.469403] xhci_urb_enqueue:1472 7f279bbec400, interval 0
[    4.469410] queue_trb: 80323 8 8 840
[    4.469416] queue_trb: 0 0 0 11021
fuzz_get_n: idx 2343, rem -1798, size 256, val 0
[    4.469438] usb_hcd_irq:2339 Enter
[    4.469445] xhci_irq:2844 Enter
[    4.469451] xhci_handle_event:2727 Enter
[    4.469461] usb_hcd_giveback_urb:1726 7f279bbec400
[    4.469467] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.469478] xhci_handle_event:2776 Exit
[    4.469483] xhci_handle_event:2727 Enter
[    4.469490] xhci_irq:2909 Exit
[    4.469496] usb_hcd_irq:2347 Exit
[    4.469503] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.469510] usb_giveback_urb_bh:1678
[    4.469516] __usb_hcd_giveback_urb:1646 7f279bbec400
[    4.469522] __usb_hcd_giveback_urb:1663 calling complete
[    4.469528] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.469540] usb_submit_urb:619 7f279bbec400, interval 0 submit done
[    4.469543] usb_hcd_irq:2339 Enter
[    4.469552] xhci_irq:2844 Enter
[    4.469557] xhci_irq:2909 Exit
[    4.469562] usb_hcd_irq:2347 Exit
[    4.469571] usb_start_wait_urb:63 waiting 7f279bbec400
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.469587] usb_start_wait_urb:77 done 7f279bbec400
[    4.469595] usb_submit_urb:376 7f279bbec500, interval 0
[    4.469602] usb_hcd_submit_urb:1534 7f279bbec500, interval 0
[    4.469607] usb_hcd_submit_urb:1556 7f279bbec500
[    4.469616] xhci_urb_enqueue:1472 7f279bbec500, interval 0
[    4.469625] queue_trb: 80323 9 8 840
[    4.469632] queue_trb: 0 0 0 11021
fuzz_get_n: idx 2599, rem -2054, size 256, val 0
[    4.469654] usb_hcd_irq:2339 Enter
[    4.469661] xhci_irq:2844 Enter
[    4.469667] xhci_handle_event:2727 Enter
[    4.469676] usb_hcd_giveback_urb:1726 7f279bbec500
[    4.469682] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.469692] xhci_handle_event:2776 Exit
[    4.469699] xhci_handle_event:2727 Enter
[    4.469705] xhci_irq:2909 Exit
[    4.469712] usb_hcd_irq:2347 Exit
[    4.469718] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.469724] usb_giveback_urb_bh:1678
[    4.469730] __usb_hcd_giveback_urb:1646 7f279bbec500
[    4.469736] __usb_hcd_giveback_urb:1663 calling complete
[    4.469743] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.469754] usb_submit_urb:619 7f279bbec500, interval 0 submit done
[    4.469756] usb_hcd_irq:2339 Enter
[    4.469766] xhci_irq:2844 Enter
[    4.469771] xhci_irq:2909 Exit
[    4.469777] usb_hcd_irq:2347 Exit
[    4.469784] usb_start_wait_urb:63 waiting 7f279bbec500
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.469800] usb_start_wait_urb:77 done 7f279bbec500
[    4.469808] usb_submit_urb:376 7f279bbec600, interval 0
[    4.469817] usb_hcd_submit_urb:1534 7f279bbec600, interval 0
[    4.469824] usb_hcd_submit_urb:1556 7f279bbec600
[    4.469831] xhci_urb_enqueue:1472 7f279bbec600, interval 0
[    4.469838] queue_trb: 80323 a 8 840
[    4.469845] queue_trb: 0 0 0 11021
fuzz_get_n: idx 2855, rem -2310, size 256, val 0
[    4.469866] usb_hcd_irq:2339 Enter
[    4.469873] xhci_irq:2844 Enter
[    4.469880] xhci_handle_event:2727 Enter
[    4.469888] usb_hcd_giveback_urb:1726 7f279bbec600
[    4.469895] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.469904] xhci_handle_event:2776 Exit
[    4.469910] xhci_handle_event:2727 Enter
[    4.469916] xhci_irq:2909 Exit
[    4.469922] usb_hcd_irq:2347 Exit
[    4.469929] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.469935] usb_giveback_urb_bh:1678
[    4.469941] __usb_hcd_giveback_urb:1646 7f279bbec600
[    4.469947] __usb_hcd_giveback_urb:1663 calling complete
[    4.469955] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.469966] usb_submit_urb:619 7f279bbec600, interval 0 submit done
[    4.469968] usb_hcd_irq:2339 Enter
[    4.469977] xhci_irq:2844 Enter
[    4.469983] xhci_irq:2909 Exit
[    4.469989] usb_hcd_irq:2347 Exit
[    4.469996] usb_start_wait_urb:63 waiting 7f279bbec600
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.470013] usb_start_wait_urb:77 done 7f279bbec600
[    4.470020] usb_submit_urb:376 7f279bbec700, interval 0
[    4.470029] usb_hcd_submit_urb:1534 7f279bbec700, interval 0
[    4.470035] usb_hcd_submit_urb:1556 7f279bbec700
[    4.470042] xhci_urb_enqueue:1472 7f279bbec700, interval 0
[    4.470052] queue_trb: 80323 b 8 840
[    4.470059] queue_trb: 0 0 0 11021
fuzz_get_n: idx 3111, rem -2566, size 256, val 0
[    4.470086] usb_hcd_irq:2339 Enter
[    4.470094] xhci_irq:2844 Enter
[    4.470100] xhci_handle_event:2727 Enter
[    4.470109] usb_hcd_giveback_urb:1726 7f279bbec700
[    4.470116] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.470126] xhci_handle_event:2776 Exit
[    4.470132] xhci_handle_event:2727 Enter
[    4.470139] xhci_irq:2909 Exit
[    4.470144] usb_hcd_irq:2347 Exit
[    4.470152] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.470157] usb_giveback_urb_bh:1678
[    4.470165] __usb_hcd_giveback_urb:1646 7f279bbec700
[    4.470170] __usb_hcd_giveback_urb:1663 calling complete
[    4.470177] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.470187] usb_submit_urb:619 7f279bbec700, interval 0 submit done
[    4.470190] usb_hcd_irq:2339 Enter
[    4.470199] xhci_irq:2844 Enter
[    4.470205] xhci_irq:2909 Exit
[    4.470210] usb_hcd_irq:2347 Exit
[    4.470217] usb_start_wait_urb:63 waiting 7f279bbec700
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.470234] usb_start_wait_urb:77 done 7f279bbec700
[    4.470242] usb_submit_urb:376 7f279bbec800, interval 0
[    4.470250] usb_hcd_submit_urb:1534 7f279bbec800, interval 0
[    4.470256] usb_hcd_submit_urb:1556 7f279bbec800
[    4.470263] xhci_urb_enqueue:1472 7f279bbec800, interval 0
[    4.470271] queue_trb: 80323 c 8 840
[    4.470278] queue_trb: 0 0 0 11021
fuzz_get_n: idx 3367, rem -2822, size 256, val 0
[    4.470298] usb_hcd_irq:2339 Enter
[    4.470305] xhci_irq:2844 Enter
[    4.470312] xhci_handle_event:2727 Enter
[    4.470320] usb_hcd_giveback_urb:1726 7f279bbec800
[    4.470327] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.470338] xhci_handle_event:2776 Exit
[    4.470343] xhci_handle_event:2727 Enter
[    4.470351] xhci_irq:2909 Exit
[    4.470357] usb_hcd_irq:2347 Exit
[    4.470364] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.470370] usb_giveback_urb_bh:1678
[    4.470376] __usb_hcd_giveback_urb:1646 7f279bbec800
[    4.470382] __usb_hcd_giveback_urb:1663 calling complete
[    4.470388] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.470400] usb_submit_urb:619 7f279bbec800, interval 0 submit done
[    4.470402] usb_hcd_irq:2339 Enter
[    4.470412] xhci_irq:2844 Enter
[    4.470417] xhci_irq:2909 Exit
[    4.470422] usb_hcd_irq:2347 Exit
[    4.470429] usb_start_wait_urb:63 waiting 7f279bbec800
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.470446] usb_start_wait_urb:77 done 7f279bbec800
[    4.470454] usb_submit_urb:376 7f279bbec900, interval 0
[    4.470472] usb_hcd_submit_urb:1534 7f279bbec900, interval 0
[    4.470488] usb_hcd_submit_urb:1556 7f279bbec900
[    4.470495] xhci_urb_enqueue:1472 7f279bbec900, interval 0
[    4.470505] queue_trb: 80323 d 8 840
[    4.470512] queue_trb: 0 0 0 11021
fuzz_get_n: idx 3623, rem -3078, size 256, val 0
[    4.470534] usb_hcd_irq:2339 Enter
[    4.470542] xhci_irq:2844 Enter
[    4.470548] xhci_handle_event:2727 Enter
[    4.470557] usb_hcd_giveback_urb:1726 7f279bbec900
[    4.470564] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.470577] xhci_handle_event:2776 Exit
[    4.470582] xhci_handle_event:2727 Enter
[    4.470590] xhci_irq:2909 Exit
[    4.470596] usb_hcd_irq:2347 Exit
[    4.470602] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.470609] usb_giveback_urb_bh:1678
[    4.470614] __usb_hcd_giveback_urb:1646 7f279bbec900
[    4.470621] __usb_hcd_giveback_urb:1663 calling complete
[    4.470627] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.470640] usb_submit_urb:619 7f279bbec900, interval 0 submit done
[    4.470642] usb_hcd_irq:2339 Enter
[    4.470651] xhci_irq:2844 Enter
[    4.470657] xhci_irq:2909 Exit
[    4.470664] usb_hcd_irq:2347 Exit
[    4.470672] usb_start_wait_urb:63 waiting 7f279bbec900
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.470688] usb_start_wait_urb:77 done 7f279bbec900
[    4.470698] usb_submit_urb:376 7f279bbeca00, interval 0
[    4.470705] usb_hcd_submit_urb:1534 7f279bbeca00, interval 0
[    4.470711] usb_hcd_submit_urb:1556 7f279bbeca00
[    4.470719] xhci_urb_enqueue:1472 7f279bbeca00, interval 0
[    4.470727] queue_trb: 80323 e 8 840
[    4.470733] queue_trb: 0 0 0 11021
fuzz_get_n: idx 3879, rem -3334, size 256, val 0
[    4.470754] usb_hcd_irq:2339 Enter
[    4.470761] xhci_irq:2844 Enter
[    4.470768] xhci_handle_event:2727 Enter
[    4.470776] usb_hcd_giveback_urb:1726 7f279bbeca00
[    4.470783] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.470795] xhci_handle_event:2776 Exit
[    4.470800] xhci_handle_event:2727 Enter
[    4.470807] xhci_irq:2909 Exit
[    4.470812] usb_hcd_irq:2347 Exit
[    4.470820] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.470825] usb_giveback_urb_bh:1678
[    4.470832] __usb_hcd_giveback_urb:1646 7f279bbeca00
[    4.470838] __usb_hcd_giveback_urb:1663 calling complete
[    4.470845] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.470857] usb_submit_urb:619 7f279bbeca00, interval 0 submit done
[    4.470859] usb_hcd_irq:2339 Enter
[    4.470868] xhci_irq:2844 Enter
[    4.470874] xhci_irq:2909 Exit
[    4.470879] usb_hcd_irq:2347 Exit
[    4.470886] usb_start_wait_urb:63 waiting 7f279bbeca00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.470903] usb_start_wait_urb:77 done 7f279bbeca00
[    4.470911] usb_submit_urb:376 7f279bbecb00, interval 0
[    4.470920] usb_hcd_submit_urb:1534 7f279bbecb00, interval 0
[    4.470926] usb_hcd_submit_urb:1556 7f279bbecb00
[    4.470933] xhci_urb_enqueue:1472 7f279bbecb00, interval 0
[    4.470942] queue_trb: 80323 f 8 840
[    4.470950] queue_trb: 0 0 0 11021
fuzz_get_n: idx 4135, rem -3590, size 256, val 0
[    4.470970] usb_hcd_irq:2339 Enter
[    4.470977] xhci_irq:2844 Enter
[    4.470983] xhci_handle_event:2727 Enter
[    4.470992] usb_hcd_giveback_urb:1726 7f279bbecb00
[    4.470998] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.471009] xhci_handle_event:2776 Exit
[    4.471015] xhci_handle_event:2727 Enter
[    4.471021] xhci_irq:2909 Exit
[    4.471026] usb_hcd_irq:2347 Exit
[    4.471033] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.471038] usb_giveback_urb_bh:1678
[    4.471044] __usb_hcd_giveback_urb:1646 7f279bbecb00
[    4.471049] __usb_hcd_giveback_urb:1663 calling complete
[    4.471055] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.471068] usb_submit_urb:619 7f279bbecb00, interval 0 submit done
[    4.471070] usb_hcd_irq:2339 Enter
[    4.471080] xhci_irq:2844 Enter
[    4.471086] xhci_irq:2909 Exit
[    4.471091] usb_hcd_irq:2347 Exit
[    4.471098] usb_start_wait_urb:63 waiting 7f279bbecb00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.471115] usb_start_wait_urb:77 done 7f279bbecb00
[    4.471123] usb_submit_urb:376 7f279bbecc00, interval 0
[    4.471131] usb_hcd_submit_urb:1534 7f279bbecc00, interval 0
[    4.471138] usb_hcd_submit_urb:1556 7f279bbecc00
[    4.471144] xhci_urb_enqueue:1472 7f279bbecc00, interval 0
[    4.471153] queue_trb: 80323 10 8 840
[    4.471160] queue_trb: 0 0 0 11021
fuzz_get_n: idx 4391, rem -3846, size 256, val 0
[    4.471182] usb_hcd_irq:2339 Enter
[    4.471189] xhci_irq:2844 Enter
[    4.471196] xhci_handle_event:2727 Enter
[    4.471204] usb_hcd_giveback_urb:1726 7f279bbecc00
[    4.471211] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.471221] xhci_handle_event:2776 Exit
[    4.471226] xhci_handle_event:2727 Enter
[    4.471233] xhci_irq:2909 Exit
[    4.471238] usb_hcd_irq:2347 Exit
[    4.471246] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.471252] usb_giveback_urb_bh:1678
[    4.471258] __usb_hcd_giveback_urb:1646 7f279bbecc00
[    4.471266] __usb_hcd_giveback_urb:1663 calling complete
[    4.471272] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.471284] usb_submit_urb:619 7f279bbecc00, interval 0 submit done
[    4.471286] usb_hcd_irq:2339 Enter
[    4.471297] xhci_irq:2844 Enter
[    4.471302] xhci_irq:2909 Exit
[    4.471307] usb_hcd_irq:2347 Exit
[    4.471316] usb_start_wait_urb:63 waiting 7f279bbecc00
Add waiter 7f279588b7a0, exst:794, total:1
fuzz_trigger_wait_cond
Del waiter 7f279588b7a0, exst:(____ptrval____), total:0
[    4.471332] usb_start_wait_urb:77 done 7f279bbecc00
[    4.471339] __queue_delayed_work w 7f279bbd2158, wq 7f279a8ac800
[    4.471347] really_probe:564: probe '1-1:252.58' returned 0
[    4.471357] queue_work_on w 7f28a0f69d20, wq 7f279a8ac000
[    4.471364] __queue_work w 7f28a0f69d20, wq 7f279a8ac000
Add worker 7f28a0f69d20, exst:762, total:2
[    4.471415] really_probe:564: probe '1-1' returned 0
[    4.471442] usb_hub_to_struct_hub:144 7f279baf0000
[    4.471449] usb_get_intfdata 7f279baf0000
[    4.471456] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
--------------------------------------------------------------------------------
XXNOTE return value is 0, even though device is not properly set up
--------------------------------------------------------------------------------
[    4.471485] hub_port_connect:5311 ----------------- status 0
[    4.471497] process_one_work end 7f279baea9b0
Del worker 7f279baea9b0, exst:(____ptrval____), total:1
[    4.471512] process_one_work start 7f28a0f69d20
[    4.471519] process_one_work end 7f28a0f69d20
Del worker 7f28a0f69d20, exst:(____ptrval____), total:0
fuzz_trigger_iso_kicked_cond
Module initialized
[    4.471658] usb_hcd_irq:2339 Enter
[    4.471672] xhci_irq:2844 Enter
[    4.471681] xhci_irq:2909 Exit
[    4.471689] usb_hcd_irq:2347 Exit
lkl_fuzz_wait_for_iso_kicked trigger 0
lkl_fuzz_call_urb_end_cb
Trying to stop module 0
lkl_fuzz_stop_iso_kick_wait
fuzz_trigger_iso_kicked_cond
Trying to stop module 1
Trying to stop module 2
REMOVING DEV
[    4.471933] usb_hcd_irq:2339 Enter
[    4.471943] xhci_irq:2844 Enter
[    4.471955] xhci_handle_event:2727 Enter
[    4.471972] xhci-hcd xhci-hcd.0.auto: Port change event, 1-1, id 16, portsc: 0x202a0
[    4.471986] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[    4.471995] usb_hcd_poll_rh_status:761
[    4.472007] usb_hcd_giveback_urb:1726 7f279ba7cf00
[    4.472016] softirq: __tasklet_schedule_common 7f279ba9c170
Add worker 7f279ba9c170, exst:795, total:1
[    4.472046] xhci_handle_event:2776 Exit
[    4.472055] xhci_handle_event:2727 Enter
[    4.472066] xhci_irq:2909 Exit
[    4.472074] usb_hcd_irq:2347 Exit
[    4.472084] softirq: tasklet_action_common start 7f279ba9c170
[    4.472094] usb_giveback_urb_bh:1678
[    4.472103] __usb_hcd_giveback_urb:1646 7f279ba7cf00
[    4.472112] __usb_hcd_giveback_urb:1663 calling complete
[    4.472121] hub_irq:731
[    4.472129] kick_hub_wq:660
[    4.472138] queue_work_on w 7f279baea9b0, wq 7f279abefe00
[    4.472147] __queue_work w 7f279baea9b0, wq 7f279abefe00
Add worker 7f279baea9b0, exst:840, total:2
[    4.472168] usb_submit_urb:376 7f279ba7cf00, interval 2048
[    4.472180] usb_hcd_submit_urb:1534 7f279ba7cf00, interval 2048
[    4.472188] usb_hcd_submit_urb:1553 7f279ba7cf00
[    4.472197] rh_urb_enqueue:846 7f279ba7cf00
[    4.472208] usb_submit_urb:619 7f279ba7cf00, interval 2048 submit done
[    4.472217] softirq: tasklet_action_common end 7f279ba9c170
Del worker 7f279ba9c170, exst:(____ptrval____), total:1
[    4.472235] usb_hcd_irq:2339 Enter
[    4.472244] xhci_irq:2844 Enter
[    4.472253] xhci_irq:2909 Exit
[    4.472262] usb_hcd_irq:2347 Exit
[    4.472290] process_one_work start 7f279baea9b0
[    4.472310] hub 1-0:1.0: state 7 ports 15 chg 0000 evt 0002
[    4.472320] usb_submit_urb:376 7f279bbecd00, interval 0
[    4.472329] usb_hcd_submit_urb:1534 7f279bbecd00, interval 0
[    4.472335] usb_hcd_submit_urb:1553 7f279bbecd00
[    4.472341] rh_urb_enqueue:846 7f279bbecd00
[    4.472347] rh_call_control:491 7f279bbecd00
[    4.472360] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x202a0, return 0x10100
[    4.472369] usb_hcd_giveback_urb:1726 7f279bbecd00
[    4.472375] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.472391] usb_submit_urb:619 7f279bbecd00, interval 0 submit done
[    4.472398] usb_start_wait_urb:63 waiting 7f279bbecd00
Add waiter 7f279588c5e0, exst:872, total:1
fuzz_trigger_wait_cond
[    4.472411] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.472441] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.472456] usb_giveback_urb_bh:1678
[    4.472464] __usb_hcd_giveback_urb:1646 7f279bbecd00
[    4.472472] __usb_hcd_giveback_urb:1663 calling complete
[    4.472483] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.472515] schedule_timeout:1894 expired: timeout 100, expires 4294937841
Del waiter 7f279588c5e0, exst:(____ptrval____), total:0
[    4.472534] usb_start_wait_urb:77 done 7f279bbecd00
[    4.472543] usb_submit_urb:376 7f279bbece00, interval 0
[    4.472552] usb_hcd_submit_urb:1534 7f279bbece00, interval 0
[    4.472560] usb_hcd_submit_urb:1553 7f279bbece00
[    4.472566] rh_urb_enqueue:846 7f279bbece00
[    4.472573] rh_call_control:491 7f279bbece00
[    4.472585] xhci-hcd xhci-hcd.0.auto: clear port1 connect change, portsc: 0x2a0
[    4.472593] usb_hcd_giveback_urb:1726 7f279bbece00
[    4.472599] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.472611] usb_submit_urb:619 7f279bbece00, interval 0 submit done
[    4.472619] usb_start_wait_urb:63 waiting 7f279bbece00
Add waiter 7f279588c680, exst:777, total:1
fuzz_trigger_wait_cond
[    4.472632] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.472653] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.472664] usb_giveback_urb_bh:1678
[    4.472671] __usb_hcd_giveback_urb:1646 7f279bbece00
[    4.472676] __usb_hcd_giveback_urb:1663 calling complete
[    4.472684] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.472712] schedule_timeout:1894 expired: timeout 100, expires 4294937841
Del waiter 7f279588c680, exst:(____ptrval____), total:0
--------------------------------------------------------------------------------
XXNOTE hub_port_connect is called again and tries to un-attach previous port_dev->child
--------------------------------------------------------------------------------
[    4.472730] usb_start_wait_urb:77 done 7f279bbece00
[    4.472740] usb usb1-port1: status 0100, change 0001, 12 Mb/s
[    4.472748] hub_port_connect:5152 port 1
[    4.472755] usb_disconnect:2253 port 1
[    4.472761] usb_set_device_state:2092
[    4.472768] usb_set_device_state:2121
[    4.472774] usb_hub_to_struct_hub:144 7f279bbad000
[    4.472781] usb_get_intfdata 7f279bbad000
[    4.472788] usb_hub_to_struct_hub:146 7f279bacd000 7f279bbac800 10 ret 0
--------------------------------------------------------------------------------
XXNOTE recursively_mark_NOTATTACHED gets hub pointer which is NULL
Crash happens here, but i added a patch to handle the issue by checking whether
hub == NULL
--------------------------------------------------------------------------------
[    4.472794] recursively_mark_NOTATTACHED error no hub for interface <--- XXNOTE here the crash would happen
[    4.472800] usb_set_device_state:2125
[    4.472809] usb 1-1: USB disconnect, device number 2
[    4.472816] usb_hub_to_struct_hub:144 7f279bbad000
[    4.472821] usb_get_intfdata 7f279bbad000
[    4.472828] usb_hub_to_struct_hub:146 7f279bacd000 7f279bbac800 10 ret 0
[    4.472835] hub_disconnect_children error no hub for interface
[    4.472842] usb 1-1: unregistering device
[    4.472851] usb 1-1: unregistering interface 1-1:252.252
[    4.472909] usb 1-1: unregistering interface 1-1:252.10
[    4.472962] usb 1-1: unregistering interface 1-1:252.0
[    4.472998] usb 1-1: unregistering interface 1-1:252.58
[    4.473035] usb_get_intfdata 7f279bbae800
[    4.473042] hub_disconnect:1738
[    4.473048] hub_quiesce:1339 port 1
[    4.473055] hub_quiesce:1339 port 2
[    4.473060] hub_quiesce:1339 port 3
[    4.473067] hub_quiesce:1339 port 4
[    4.473072] hub_quiesce:1339 port 5
[    4.473078] hub_quiesce:1339 port 6
[    4.473083] hub_quiesce:1339 port 7
[    4.473089] hub_quiesce:1339 port 8
[    4.473094] hub_quiesce:1339 port 9
[    4.473101] hub_quiesce:1339 port 10
[    4.473106] hub_quiesce:1339 port 11
[    4.473112] hub_quiesce:1339 port 12
[    4.473118] hub_quiesce:1339 port 13
[    4.473124] hub_quiesce:1339 port 14
[    4.473129] hub_quiesce:1339 port 15
[    4.473136] hub_quiesce:1339 port 16
[    4.473141] usb_kill_urb:741 7f279bbbfc00
[    4.473148] usb_set_intfdata 7f279bbae800 - 0
[    4.473156] usb_hub_remove_port_device:620 port 16
[    4.473170] usb_hub_remove_port_device:620 port 15
[    4.473185] usb_hub_remove_port_device:620 port 14
[    4.473199] usb_hub_remove_port_device:620 port 13
[    4.473212] usb_hub_remove_port_device:620 port 12
[    4.473226] usb_hub_remove_port_device:620 port 11
[    4.473239] usb_hub_remove_port_device:620 port 10
[    4.473253] usb_hub_remove_port_device:620 port 9
[    4.473266] usb_hub_remove_port_device:620 port 8
[    4.473279] usb_hub_remove_port_device:620 port 7
[    4.473292] usb_hub_remove_port_device:620 port 6
[    4.473305] usb_hub_remove_port_device:620 port 5
[    4.473318] usb_hub_remove_port_device:620 port 4
[    4.473331] usb_hub_remove_port_device:620 port 3
[    4.473344] usb_hub_remove_port_device:620 port 2
[    4.473357] usb_hub_remove_port_device:620 port 1
[    4.473373] usb_set_intfdata 7f279bbae800 - 0
[    4.473414] usb_disable_device:1427 set actconfig NULL
[    4.473421] usb_set_device_state:2092
[    4.473427] usb_set_device_state:2125
[    4.473436] usb 1-1: usb_disable_device nuking all URBs
[    4.473447] xhci-hcd xhci-hcd.0.auto: xhci_drop_endpoint called for udev (____ptrval____)
[    4.473458] xhci-hcd xhci-hcd.0.auto: drop ep 0x8d, slot id 1, new drop flags = 0x8000000, new add flags = 0x0
[    4.473469] xhci-hcd xhci-hcd.0.auto: xhci_check_bandwidth called for udev (____ptrval____)
[    4.473480] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.473488] queue_trb: 9bbba000 7f27 0 1003001
[    4.473497] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[    4.473510] usb_hcd_irq:2339 Enter
[    4.473516] xhci_irq:2844 Enter
[    4.473523] xhci_handle_event:2727 Enter
[    4.473531] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.473536] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.473551] xhci_handle_event:2776 Exit
[    4.473558] xhci_handle_event:2727 Enter
[    4.473565] xhci_irq:2909 Exit
[    4.473572] usb_hcd_irq:2347 Exit
[    4.473578] xhci_configure_endpoint:2819 waiting
[    4.473581] usb_hcd_irq:2339 Enter
[    4.473590] xhci_irq:2844 Enter
[    4.473595] xhci_irq:2909 Exit
[    4.473601] usb_hcd_irq:2347 Exit
Add waiter 7f279babf800, exst:0, total:1
fuzz_trigger_wait_cond
Del waiter 7f279babf800, exst:(____ptrval____), total:0
[    4.473620] xhci_configure_endpoint:2821 waiting done
[    4.473630] xhci-hcd xhci-hcd.0.auto: Successful Endpoint Configure command
[    4.473643] usb_hub_to_struct_hub:144 7f279baf0000
[    4.473650] usb_get_intfdata 7f279baf0000
[    4.473657] usb_hub_to_struct_hub:146 7f279baca000 7f279ba7b800 f ret 7f279baea800
[    4.473765] __queue_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.473776] queue_trb: 0 0 0 1002801
[    4.473785] xhci-hcd xhci-hcd.0.auto: // Ding dong!
lkl_fuzz_stop_iso_kick_wait
fuzz_trigger_iso_kicked_cond
[    4.473805] usb_hcd_irq:2339 Enter
[    4.473812] xhci_irq:2844 Enter
[    4.473819] xhci_handle_event:2727 Enter
[    4.473826] cancel_delayed_work w 7f279ba9c2e8, wq 7f279a8ac000
[    4.473831] __cancel_work:3301
Del worker 7f279ba9c2e8, exst:0000000000000000, total:1
WARNING: worker 7f279ba9c2e8 not found
[    4.473850] xhci_handle_event:2776 Exit
[    4.473857] xhci_handle_event:2727 Enter
[    4.473864] xhci_irq:2909 Exit
[    4.473870] usb_hcd_irq:2347 Exit
[    4.473877] usb_hcd_irq:2339 Enter
[    4.473883] xhci_irq:2844 Enter
[    4.473888] xhci_irq:2909 Exit
[    4.473894] usb_hcd_irq:2347 Exit
[    4.473902] usb_submit_urb:376 7f279bbecf00, interval 0
[    4.473911] usb_hcd_submit_urb:1534 7f279bbecf00, interval 0
[    4.473917] usb_hcd_submit_urb:1553 7f279bbecf00
[    4.473925] rh_urb_enqueue:846 7f279bbecf00
[    4.473930] rh_call_control:491 7f279bbecf00
[    4.473943] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[    4.473951] usb_hcd_giveback_urb:1726 7f279bbecf00
[    4.473957] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.473971] usb_submit_urb:619 7f279bbecf00, interval 0 submit done
[    4.473979] usb_start_wait_urb:63 waiting 7f279bbecf00
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.473991] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.474013] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.474030] usb_giveback_urb_bh:1678
[    4.474039] __usb_hcd_giveback_urb:1646 7f279bbecf00
[    4.474047] __usb_hcd_giveback_urb:1663 calling complete
[    4.474066] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.474121] rh_timer_func:803
[    4.474130] usb_hcd_poll_rh_status:761
[    4.474142] xhci-hcd xhci-hcd.0.auto: xhci_hub_status_data: stopping port polling.
[    4.474165] schedule_timeout:1894 expired: timeout 99, expires 4294937841
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.474186] usb_start_wait_urb:77 done 7f279bbecf00
[    4.474202] usb_submit_urb:376 7f279bbee000, interval 0
[    4.474212] usb_hcd_submit_urb:1534 7f279bbee000, interval 0
[    4.474218] usb_hcd_submit_urb:1553 7f279bbee000
[    4.474225] rh_urb_enqueue:846 7f279bbee000
[    4.474231] rh_call_control:491 7f279bbee000
[    4.474244] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[    4.474252] usb_hcd_giveback_urb:1726 7f279bbee000
[    4.474258] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.474273] usb_submit_urb:619 7f279bbee000, interval 0 submit done
[    4.474281] usb_start_wait_urb:63 waiting 7f279bbee000
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.474294] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.474315] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.474328] usb_giveback_urb_bh:1678
[    4.474335] __usb_hcd_giveback_urb:1646 7f279bbee000
[    4.474341] __usb_hcd_giveback_urb:1663 calling complete
[    4.474351] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.474389] schedule_timeout:1894 expired: timeout 100, expires 4294937842
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.474408] usb_start_wait_urb:77 done 7f279bbee000
[    4.474417] usb_submit_urb:376 7f279bbee100, interval 0
[    4.474426] usb_hcd_submit_urb:1534 7f279bbee100, interval 0
[    4.474432] usb_hcd_submit_urb:1553 7f279bbee100
[    4.474440] rh_urb_enqueue:846 7f279bbee100
[    4.474446] rh_call_control:491 7f279bbee100
[    4.474456] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[    4.474474] usb_hcd_giveback_urb:1726 7f279bbee100
[    4.474482] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.474496] usb_submit_urb:619 7f279bbee100, interval 0 submit done
[    4.474503] usb_start_wait_urb:63 waiting 7f279bbee100
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.474518] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.474547] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.474561] usb_giveback_urb_bh:1678
[    4.474569] __usb_hcd_giveback_urb:1646 7f279bbee100
[    4.474577] __usb_hcd_giveback_urb:1663 calling complete
[    4.474587] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.474626] schedule_timeout:1894 expired: timeout 100, expires 4294937842
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.474646] usb_start_wait_urb:77 done 7f279bbee100
[    4.474656] usb_submit_urb:376 7f279bbee200, interval 0
[    4.474665] usb_hcd_submit_urb:1534 7f279bbee200, interval 0
[    4.474672] usb_hcd_submit_urb:1553 7f279bbee200
[    4.474679] rh_urb_enqueue:846 7f279bbee200
[    4.474686] rh_call_control:491 7f279bbee200
[    4.474697] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[    4.474705] usb_hcd_giveback_urb:1726 7f279bbee200
[    4.474712] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.474726] usb_submit_urb:619 7f279bbee200, interval 0 submit done
[    4.474734] usb_start_wait_urb:63 waiting 7f279bbee200
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.474747] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.474773] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.474790] usb_giveback_urb_bh:1678
[    4.474798] __usb_hcd_giveback_urb:1646 7f279bbee200
[    4.474807] __usb_hcd_giveback_urb:1663 calling complete
[    4.474817] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.474852] schedule_timeout:1894 expired: timeout 100, expires 4294937842
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.474871] usb_start_wait_urb:77 done 7f279bbee200
[    4.474880] usb_submit_urb:376 7f279bbee300, interval 0
[    4.474889] usb_hcd_submit_urb:1534 7f279bbee300, interval 0
[    4.474896] usb_hcd_submit_urb:1553 7f279bbee300
[    4.474902] rh_urb_enqueue:846 7f279bbee300
[    4.474908] rh_call_control:491 7f279bbee300
[    4.474919] xhci-hcd xhci-hcd.0.auto: Get port status 1-1 read: 0x2a0, return 0x100
[    4.474927] usb_hcd_giveback_urb:1726 7f279bbee300
[    4.474933] softirq: __tasklet_schedule_common 7f279ba9c1b8
Add worker 7f279ba9c1b8, exst:867, total:2
[    4.474947] usb_submit_urb:619 7f279bbee300, interval 0 submit done
[    4.474954] usb_start_wait_urb:63 waiting 7f279bbee300
Add waiter 7f279588c4c0, exst:839, total:1
fuzz_trigger_wait_cond
[    4.474966] schedule_timeout:1882 start: timeout 100
fuzz_trigger_wait_cond
[    4.474989] softirq: tasklet_action_common start 7f279ba9c1b8
[    4.475004] usb_giveback_urb_bh:1678
[    4.475012] __usb_hcd_giveback_urb:1646 7f279bbee300
[    4.475020] __usb_hcd_giveback_urb:1663 calling complete
[    4.475031] softirq: tasklet_action_common end 7f279ba9c1b8
Del worker 7f279ba9c1b8, exst:(____ptrval____), total:1
[    4.475068] schedule_timeout:1894 expired: timeout 100, expires 4294937842
Del waiter 7f279588c4c0, exst:(____ptrval____), total:0
[    4.475087] usb_start_wait_urb:77 done 7f279bbee300
[    4.475097] usb usb1-port1: debounce total 100ms stable 100ms status 0x100
[    4.475104] process_one_work end 7f279baea9b0
Del worker 7f279baea9b0, exst:(____ptrval____), total:0
fuzz_trigger_iso_kicked_cond
Stopped module

--------------7FE8A0A93015DCFE68413880--
