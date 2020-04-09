Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D501A342C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 14:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgDIMjL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Apr 2020 08:39:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgDIMjF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Apr 2020 08:39:05 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Thu, 09 Apr 2020 12:39:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-203419-208809-DjdMFGmoGm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

--- Comment #27 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 288295
  --> https://bugzilla.kernel.org/attachment.cgi?id=288295&action=edit
testpatch that doesn't clear TT buffer after protocol STALL

Adding same patch and comment here as in bug #207065, it might
help in this case as well.


"Traces show its related to Clearing TT buffer after a STALL on 
endpoint 0.

The first stall looks like a protocol stall, not a function stall, meaning that
endpoint isn't really halted, just that the device does not support the
request in the control transfer. 

Anyway, xhci starts clearing what it assumes is a halted endpoint, 
including clearing the hub TT buffer.

Specs are a bit unclear if TT should be cleared in this case, 
or at least I couldn't find it."

Attached is a tespatch that doesn't clear TT buffer on protocol stalls,
withexcessive tracing and debugging.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
