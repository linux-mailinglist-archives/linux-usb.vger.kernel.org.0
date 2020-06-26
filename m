Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0214920B0A3
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 13:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgFZLiH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 26 Jun 2020 07:38:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgFZLiG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jun 2020 07:38:06 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208327] New: xhci_hcd issue transfer event - usb3.0
Date:   Fri, 26 Jun 2020 11:38:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208327-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208327

            Bug ID: 208327
           Summary: xhci_hcd issue transfer event - usb3.0
           Product: Drivers
           Version: 2.5
    Kernel Version: 4.14.170
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

With compile vanilla kernel 4.14.170, observe this issue with
connect/disconnect usb device (mouse and keyboard).


usb xhci_hcd issue, USB3.0

[  146.924776] usb 1-2: USB disconnect, device number 2
[  146.926153] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  146.926163] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffee2350
trb-start 00000000ffee2360 trb-end 00000000ffee2360 seg-start 00000000ffee2000
seg-end 00000000ffee2ff0
[  146.927151] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  146.927160] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffee2360
trb-start 00000000ffee2370 trb-end 00000000ffee2370 seg-start 00000000ffee2000
seg-end 00000000ffee2ff0
[  146.928153] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  146.928163] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffee2370
trb-start 00000000ffee2380 trb-end 00000000ffee2380 seg-start 00000000ffee2000
seg-end 00000000ffee2ff0
[  146.929150] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  146.929159] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffee2380
trb-start 00000000ffee2390 trb-end 00000000ffee2390 seg-start 00000000ffee2000
seg-end 00000000ffee2ff0
[  146.930150] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  146.930158] xhci_hcd 0000:00:14.0: Looking for event-dma 00000000ffee2390
trb-start 00000000ffee23a0 trb-end 00000000ffee23a0 seg-start 00000000ffee2000
seg-end 00000000ffee2ff0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
