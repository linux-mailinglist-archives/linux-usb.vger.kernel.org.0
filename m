Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCB227A1A5
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 17:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgI0Peh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 27 Sep 2020 11:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgI0Peh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 27 Sep 2020 11:34:37 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] New: skb_over_panic in cdc_mbim_tx_fixup
Date:   Sun, 27 Sep 2020 15:34:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jks@iki.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209407-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209407

            Bug ID: 209407
           Summary: skb_over_panic in cdc_mbim_tx_fixup
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jks@iki.fi
        Regression: No

Created attachment 292681
  --> https://bugzilla.kernel.org/attachment.cgi?id=292681&action=edit
Debug information including the dmesg dump

I'm running a PCEngines APU3C4 system as a router, with a Huawei
909s-120 LTE module for the upstream connection. It has been crashing
once every few days. I found a way to cause the crash (or at least one
case of it) quite reliably by transferring a large file from a host to
AWS S3 via the router. This happened initially on Debian's kernel
4.19.132-1 but I can reproduce it on an unmodified 5.8.12. The
following dumps are all from 5.8.12.

Some lines from the dmesg dump (the full dump in the attachment along
with other debug information):

> [ 2297.135441] skbuff: skb_over_panic: text:ffffffffc09bf27a len:122 put:122
> head:0000000000000000 data:0000000000000000 tail:0x7a end:0x0 dev:<NULL>
> [ 2297.137499] BUG: unable to handle page fault for address: ffff90b01631c000
> [ 2297.167354] Call Trace:
> [ 2297.167369]  <IRQ>
> [ 2297.167409]  cdc_ncm_fill_tx_frame+0x83a/0x970 [cdc_ncm]
> [ 2297.306125]  cdc_mbim_tx_fixup+0x1d9/0x240 [cdc_mbim]
> [ 2297.311578]  usbnet_start_xmit+0x5d/0x720 [usbnet]
> [ 2297.316682]  dev_hard_start_xmit+0x93/0x1f0

cdc_ncm_fill_tx_frame+0x83a is in cdc_ncm_fill_tx_frame
(./include/linux/skbuff.h:2252):

> 2246  static inline void *skb_put_zero(struct sk_buff *skb, unsigned int len)
> 2247  {
> 2248          void *tmp = skb_put(skb, len);
> 2249
> 2250          memset(tmp, 0, len);
> 2251
> 2252          return tmp;
> 2253  }

cdc_mbim_tx_fixup+0x1d9 is in cdc_mbim_tx_fixup
(drivers/net/usb/cdc_mbim.c:292):

> 288                   }
> 289           }
> 290
> 291           spin_lock_bh(&ctx->mtx);
> 292           skb_out = cdc_ncm_fill_tx_frame(dev, skb, sign);
> 293           spin_unlock_bh(&ctx->mtx);
> 294           return skb_out;


My corresponding Debian bug report is at
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970736

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
