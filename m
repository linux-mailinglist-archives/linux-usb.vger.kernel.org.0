Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD20C6C2633
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 01:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjCUAHd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Mar 2023 20:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCUAHc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Mar 2023 20:07:32 -0400
X-Greylist: delayed 481 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Mar 2023 17:07:29 PDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0902CFDD
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 17:07:29 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8B5A7428;
        Mon, 20 Mar 2023 16:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1679356767;
        bh=WKt4hYkmS97XIBCBpZpjSDhOPksTU12YysbXnAkD2gU=;
        h=Date:From:To:Cc:Subject:From;
        b=VbyYz2PR2YHacfmT9qE2NMCWOiZTBd1I+dsATOZERZ3S3NtpBj/dQNS0VnyCOKllH
         P081yyZbsgh2ybm+cdSHMnyY1I6dAukireH77UeJSMoq/wl3gNo8vgZmPm8DHyW4eb
         8l6Lkub1Wtw8YqYdbYxrUyeOr7FCaLROJ+lko+AI=
Date:   Mon, 20 Mar 2023 16:59:26 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Tao Ren <rentao.bupt@gmail.com>
Subject: Host CPU busy-looping with aspeed-vhub on C621A
Message-ID: <3e7273ac-7125-4e62-903a-ce9bdbdd565f@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I'm seeing an odd USB (mis)behavior on an in-progress OpenBMC port I'm 
working on.  The platform is the ASRock Rack SPC621D8HM3, which has an 
Intel C621A chipset and an AST2500 BMC.

The USB devices present on the system are as follows:

     # lsusb -t
     /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
     /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
         |__ Port 8: Dev 2, If 0, Class=Hub, Driver=hub/5p, 480M

(The 5-port hub in the final line is the AST2500's aspeed-vhub device.)

With the system otherwise idle, the host sits there with an entire CPU 
core tied up busy-looping in what appears to be some USB 
power-management code, with 'top' showing about 75% in a kworker thread 
and the remaining 25% in ksoftirqd.

Inspecting some workqueue events via ftrace, if I'm interpreting this 
right it appears that hub_event() and pm_runtime_work() are recursively 
triggering each other via queue_work():

     kworker/18:1-453     [018] .....  6520.912866: workqueue_execute_start: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] d..2.  6520.912873: workqueue_queue_work: work struct=0000000077eccca1 function=pm_runtime_work workqueue=pm req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..2.  6520.912873: workqueue_activate_work: work struct 0000000077eccca1
     kworker/18:1-453     [018] .....  6520.912873: workqueue_execute_end: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] .....  6520.912873: workqueue_execute_start: work struct 0000000077eccca1: function pm_runtime_work
     kworker/18:1-453     [018] d..1.  6520.912910: workqueue_queue_work: work struct=00000000de5443e3 function=hub_event [usbcore] workqueue=usb_hub_wq req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..1.  6520.912910: workqueue_activate_work: work struct 00000000de5443e3
     kworker/18:1-453     [018] .....  6520.912910: workqueue_execute_end: work struct 0000000077eccca1: function pm_runtime_work
     kworker/18:1-453     [018] .....  6520.912910: workqueue_execute_start: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] d..2.  6520.912917: workqueue_queue_work: work struct=0000000077eccca1 function=pm_runtime_work workqueue=pm req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..2.  6520.912917: workqueue_activate_work: work struct 0000000077eccca1
     kworker/18:1-453     [018] .....  6520.912918: workqueue_execute_end: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] .....  6520.912918: workqueue_execute_start: work struct 0000000077eccca1: function pm_runtime_work
     kworker/18:1-453     [018] d..1.  6520.912954: workqueue_queue_work: work struct=00000000de5443e3 function=hub_event [usbcore] workqueue=usb_hub_wq req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..1.  6520.912954: workqueue_activate_work: work struct 00000000de5443e3
     kworker/18:1-453     [018] .....  6520.912954: workqueue_execute_end: work struct 0000000077eccca1: function pm_runtime_work
     kworker/18:1-453     [018] .....  6520.912954: workqueue_execute_start: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] d..2.  6520.912961: workqueue_queue_work: work struct=0000000077eccca1 function=pm_runtime_work workqueue=pm req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..2.  6520.912962: workqueue_activate_work: work struct 0000000077eccca1
     kworker/18:1-453     [018] .....  6520.912962: workqueue_execute_end: work struct 00000000de5443e3: function hub_event [usbcore]

Adding in xhci-hcd events, the event stream pattern becomes:

     kworker/18:1-453     [018] .....  7086.376157: workqueue_execute_start: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] d..1.  7086.376158: xhci_get_port_status: port-8: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376165: xhci_get_port_status: port-10: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376168: xhci_get_port_status: port-12: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..2.  7086.376171: workqueue_queue_work: work struct=0000000077eccca1 function=pm_runtime_work workqueue=pm req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..2.  7086.376171: workqueue_activate_work: work struct 0000000077eccca1
     kworker/18:1-453     [018] .....  7086.376172: workqueue_execute_end: work struct 00000000de5443e3: function hub_event [usbcore]
     kworker/18:1-453     [018] .....  7086.376172: workqueue_execute_start: work struct 0000000077eccca1: function pm_runtime_work
     kworker/18:1-453     [018] d..1.  7086.376178: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376181: xhci_get_port_status: port-1: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376184: xhci_get_port_status: port-2: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376185: xhci_get_port_status: port-3: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376189: xhci_get_port_status: port-4: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376193: xhci_get_port_status: port-5: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376195: xhci_get_port_status: port-6: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376197: xhci_get_port_status: port-7: Powered Connected Enabled Link:U3 PortSpeed:3 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376199: xhci_get_port_status: port-8: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376202: xhci_get_port_status: port-9: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376204: xhci_get_port_status: port-10: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376209: xhci_get_port_status: port-11: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376212: xhci_get_port_status: port-12: Powered-off Not-connected Disabled Link:Disabled PortSpeed:0 OverCurrent Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376214: xhci_get_port_status: port-13: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376216: xhci_get_port_status: port-14: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376219: xhci_get_port_status: port-15: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
     kworker/18:1-453     [018] d..1.  7086.376221: workqueue_queue_work: work struct=00000000de5443e3 function=hub_event [usbcore] workqueue=usb_hub_wq req_cpu=256 cpu=18
     kworker/18:1-453     [018] d..1.  7086.376221: workqueue_activate_work: work struct 00000000de5443e3
     kworker/18:1-453     [018] .....  7086.376221: workqueue_execute_end: work struct 0000000077eccca1: function pm_runtime_work

(Port 8 has the vhub on it, but I'm not sure what's "special" about 
ports 10 and 12 that leads to hub_event apparently checking them but not 
all the others.)

Looking at usbmon's '0u' debugfs file I see a stream of events coming 
from the top-level root_hub that the aspeed-vhub is attached to, which I 
presume are the result of the xhci_get_port_status() calls above:

     ffff9bb242a2d200 2648339575 S Ci:1:001:0 s a3 00 0000 0001 0004 4 <
     ffff9bb242a2d200 2648339576 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339577 S Ci:1:001:0 s a3 00 0000 0002 0004 4 <
     ffff9bb242a2d200 2648339578 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339579 S Ci:1:001:0 s a3 00 0000 0003 0004 4 <
     ffff9bb242a2d200 2648339581 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339581 S Ci:1:001:0 s a3 00 0000 0004 0004 4 <
     ffff9bb242a2d200 2648339583 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339583 S Ci:1:001:0 s a3 00 0000 0005 0004 4 <
     ffff9bb242a2d200 2648339585 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339586 S Ci:1:001:0 s a3 00 0000 0006 0004 4 <
     ffff9bb242a2d200 2648339587 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339588 S Ci:1:001:0 s a3 00 0000 0007 0004 4 <
     ffff9bb242a2d200 2648339589 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339590 S Ci:1:001:0 s a3 00 0000 0008 0004 4 <
     ffff9bb242a2d200 2648339592 C Ci:1:001:0 0 4 = 07050000
     ffff9bb242a2d200 2648339592 S Ci:1:001:0 s a3 00 0000 0009 0004 4 <
     ffff9bb242a2d200 2648339594 C Ci:1:001:0 0 4 = 08000000
     ffff9bb242a2d200 2648339595 S Ci:1:001:0 s a3 00 0000 000a 0004 4 <
     ffff9bb242a2d200 2648339597 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339597 S Ci:1:001:0 s a3 00 0000 000b 0004 4 <
     ffff9bb242a2d200 2648339599 C Ci:1:001:0 0 4 = 08000000
     ffff9bb242a2d200 2648339600 S Ci:1:001:0 s a3 00 0000 000c 0004 4 <
     ffff9bb242a2d200 2648339602 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339603 S Ci:1:001:0 s a3 00 0000 000d 0004 4 <
     ffff9bb242a2d200 2648339604 C Ci:1:001:0 0 4 = 08000000
     ffff9bb242a2d200 2648339606 S Ci:1:001:0 s a3 00 0000 000e 0004 4 <
     ffff9bb242a2d200 2648339607 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339608 S Ci:1:001:0 s a3 00 0000 000f 0004 4 <
     ffff9bb242a2d200 2648339610 C Ci:1:001:0 0 4 = 00010000
     ffff9bb242a2d200 2648339611 S Ci:1:001:0 s a3 00 0000 0010 0004 4 <
     ffff9bb242a2d200 2648339613 C Ci:1:001:0 0 4 = 00010000
     ffff9bb240225200 2648339614 S Ii:1:001:1 -115:2048 4 <
     ffff9bb242a2d200 2648339615 S Ci:1:001:0 s a3 00 0000 0009 0004 4 <
     ffff9bb242a2d200 2648339616 C Ci:1:001:0 0 4 = 08000000
     ffff9bb242a2d200 2648339618 S Ci:1:001:0 s a3 00 0000 000b 0004 4 <
     ffff9bb242a2d200 2648339620 C Ci:1:001:0 0 4 = 08000000
     ffff9bb242a2d200 2648339622 S Ci:1:001:0 s a3 00 0000 000d 0004 4 <
     ffff9bb242a2d200 2648339624 C Ci:1:001:0 0 4 = 08000000
     ffff9bb240225200 2648339626 C Ii:1:001:1 -2:2048 0

However, I do *not* see any activity (increasing numbers) in the 
xhci_hcd line in /proc/interrupts, for what that's worth.

 From everything I can see there's no software activity going on on the 
BMC during this (no aspeed-vhub interrupts or code execution).

Interestingly, the busy-looping stops and the host CPU goes 
appropriately idle as soon as I add another USB device under the 
top-level hub, whether directly (a thumb drive plugged into a 
front-panel port) or indirectly under the vhub (the OpenBMC iKVM's 
virtual keyboard/mouse).  However, once any other devices are removed 
and the topology returns to that shown above (just the vhub under the 
top-level hub) the busy-looping resumes.

On another system with a similar topology but with a C246 chipset 
(ASRock Rack E3C246D4I) I don't see this happen.

It also doesn't happen with the factory (AMI) BMC firmware, so it seems 
like it must be a result of something OpenBMC is doing differently with 
the vhub.

I'm not terribly familiar with either the kernel USB stack or the 
aspeed-vhub hardware/driver, so any assistance with where to look next 
on this would be much appreciated!


Thanks,
Zev

