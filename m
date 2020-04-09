Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74211A3408
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 14:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgDIMec convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Apr 2020 08:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIMec (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Apr 2020 08:34:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
Date:   Thu, 09 Apr 2020 12:34:32 +0000
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
Message-ID: <bug-207065-208809-oRaqnkZ8Xx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207065-208809@https.bugzilla.kernel.org/>
References: <bug-207065-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207065

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 288293
  --> https://bugzilla.kernel.org/attachment.cgi?id=288293&action=edit
testpatch that doesn't clear TT buffer after protocol STALL

Does this help?  Could you share similar logs and traces with this applied?
Thanks

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
