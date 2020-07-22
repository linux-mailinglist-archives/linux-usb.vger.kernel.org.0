Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB2322991F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732178AbgGVNTb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 Jul 2020 09:19:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgGVNTb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 09:19:31 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208327] xhci_hcd issue transfer event - usb3.0
Date:   Wed, 22 Jul 2020 13:19:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208327-208809-9FakA3dghb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208327-208809@https.bugzilla.kernel.org/>
References: <bug-208327-208809@https.bugzilla.kernel.org/>
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

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks

Logs show we get double (duplicate) events for some ISOC transfers.
Driver expects only one event per TRB and warns when we get a second event for
the same TRB

A wild guess is that this is somehow related to the soft retry of transaction
errors seen on another endpoint on the same device.
Driver tries to recover from the transaction error with a soft retry
three times. the duplicate events seen on the other endpoint occur close to the
soft retries, almost like this ISOC enpoint is being retried as well.

driver will ignore the duplicate events after warning about it, so there
shouldn't be any functional impact, but this isn't how it's supposed to
behave.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
