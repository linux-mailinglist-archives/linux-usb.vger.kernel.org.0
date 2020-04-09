Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B931A3551
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 16:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgDIOBm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Apr 2020 10:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:33228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgDIOBl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Apr 2020 10:01:41 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
Date:   Thu, 09 Apr 2020 14:01:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207065-208809-g3C6ph6dOQ@https.bugzilla.kernel.org/>
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

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
On Thu, 9 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> --- Comment #4 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> Thanks, traces show its related to Clearing TT buffer after a STALL on 
> endpoint 0.
> 
> The first stall looks like a protocol stall, not a function stall, meaning
> that
> endpoint isn't really halted, just that the device does not support the
> request in the control transfer. 
> 
> Anyway, xhci starts clearing what it assumes is a halted endpoint, 
> including clearing the hub TT buffer.
> 
> Specs are a bit unclear if TT should be cleared in this case, 
> or at least I couldn't find it.

TTs should be cleared when an error occurs in the protocol.  STALL
isn't an error; a real error would be a timeout or CRC mismatch or URB
cancellation, things like that -- things that might leave the TT in a
busy state (because it hasn't sent its final status back to the host)
when it ought to be idle.  Sending a STALL isn't a protocol error and
it does clear the TT status.

This is discussed (not as explicitly as one might want) in sections 
11.17.3 and 11.17.5 of the USB-2.0 specification.

Alan Stern

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
