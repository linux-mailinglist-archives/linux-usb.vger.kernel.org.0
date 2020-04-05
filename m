Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADED119ECE7
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2020 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgDERbR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 5 Apr 2020 13:31:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbgDERbQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Apr 2020 13:31:16 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207125] New: Possible null pointer dereference in 
 ohci_restart()
Date:   Sun, 05 Apr 2020 17:31:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zhandy@hit.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207125-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207125

            Bug ID: 207125
           Summary: Possible null pointer dereference in  ohci_restart()
           Product: Drivers
           Version: 2.5
    Kernel Version: Linux 4.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: zhandy@hit.edu.cn
        Regression: No

In Linux 4.17, ohci_restart() in /drivers/usb/host/ohci-hcd.c does not handle
the failure of ohci_init(), causing ohci->hcca could be a null pointer. After
that, writting to this ohci->hcca->int_table [i] field could cause a null
pointer dereference bug.

Url of ohci_restart()
https://elixir.bootlin.com/linux/v4.10.17/source/drivers/usb/host/ohci-hcd.c#L1000

int ohci_restart(struct ohci_hcd *ohci)
{
        ...
        ohci_init(ohci); //does not handle the failure
        ...
        for (i = 0; i < NUM_INTS; i++) ohci->hcca->int_table [i] = 0; //null
pointer dereference
        ...
}

Url of ohci_init()
https://elixir.bootlin.com/linux/v4.10.17/source/drivers/usb/host/ohci-hcd.c#L441
static int ohci_init (struct ohci_hcd *ohci)
{
...
ohci->hcca = dma_alloc_coherent (hcd->self.controller,
                        sizeof(*ohci->hcca), &ohci->hcca_dma, GFP_KERNEL);
        if (!ohci->hcca)
                return -ENOMEM; // ohci->hcca can be a null pointer
...
}

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
