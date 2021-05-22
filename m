Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC60B38D2F4
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 04:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhEVCPV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 22:15:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54653 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230371AbhEVCPV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 22:15:21 -0400
Received: (qmail 1260923 invoked by uid 1000); 21 May 2021 22:13:56 -0400
Date:   Fri, 21 May 2021 22:13:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     guido@kiener-muenchen.de
Cc:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>, dpenkler@gmail.com,
        USB list <linux-usb@vger.kernel.org>,
        Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com
Subject: Re: [syzbot] INFO: rcu detected stall in tx
Message-ID: <20210522021356.GA1260282@rowland.harvard.edu>
References: <35b615b7c7344767b6fd37f7d420787e@rohde-schwarz.com>
 <20210521012420.GC1224757@rowland.harvard.edu>
 <20210521221706.Horde.sFtE6C4lkS5sJzKfWl41tv7@webmail.kiener-muenchen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521221706.Horde.sFtE6C4lkS5sJzKfWl41tv7@webmail.kiener-muenchen.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:17:06PM +0000, guido@kiener-muenchen.de wrote:
> I looked at the original console output again:
> https://syzkaller.appspot.com/x/log.txt?x=1065c5fcd00000
> I'm not very familiar yet in reading rcu files, but I would say:
> 1. I assume there are 2 CPUs running (C0,C1).
> 2. There are 5 USBTMC devices running concurrenlty which seems to be
> disconnected together at once.
> You will find all disconnect messages "usb x-1: USB disconnect, device
> number y" at the end within 5 seconds (418.4-423.7 sec).
> 3. Each USBTMC device issues every 20 msec the typical INT pipe message
> "X-1:0.0: unknown status received: -71" when the connection is disconnected.
> All USBTMC device messages are alternating. Round robin works.
> 
> Does someone have an idea for the following questions:
> 1. Why does it take about 96 seconds from the beginning of the first INT
> pipe message (322.1) until the first disconnect message (418.4)?

Because the system is so busy handling all those -71 errors that it 
doesn't have time to process the disconnect events until 96 seconds have 
passed by.

> 2. What is blocking the "disconnect" event for such a long time?

The usbtmc driver immediately resubmits the URB that failed with a -71 
error code.  The resubmitted URB fails a few milliseconds later with the 
same error, and so on.  This all happens at interrupt priority.  With 
five instances of this going on concurrently there's no time for the 
system to do much of anything else.

For another example of a bug reported by syzbot having exactly the form 
and the same explanation, see commit 32a0721c6620 ("USB: yurex: Don't 
retry on unexpected errors") and the accompanying syzbot 
dashboard and console output 
(https://syzkaller.appspot.com/bug?extid=b24d736f18a1541ad550, 
https://syzkaller.appspot.com/x/log.txt?x=1146550d600000).  The 
solution was to prevent the yurex driver from resubmitting the URB if it 
failed with code -EPROTO.  No doubt a similar fix would work for usbtmc.

> 3. Is it possible to provoke this behavior when I disconnect the cable in
> slow motion?

It doesn't matter how quickly or slowly you unplug the cable.  
Disconnection is an "edge" event; it happens all at once.

> 4. Is the self-detected stall just caused by another driver and the USBTMC
> driver is innocent, but only chatty?

No.  It is caused by the usbtmc driver.

> Next Thursday I can check recommendations again.

There's another very important difference that you didn't notice.  In 
your test, you are certainly using a different USB host controller 
driver from what syzbot uses.  You're probably using xhci-hcd, whereas 
syzbot uses dummy-hcd.  Those two drivers handle USB communications in 
completely different ways; it's entirely possible that one of them could 
get stuck in this error loop while the other one would not.

Alan Stern
