Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269141A7819
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 12:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438125AbgDNKHS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Apr 2020 06:07:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438121AbgDNKHF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 06:07:05 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
Date:   Tue, 14 Apr 2020 10:07:04 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207065-208809-YoYz6nLFcB@https.bugzilla.kernel.org/>
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

--- Comment #8 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> TTs should be cleared when an error occurs in the protocol.  STALL
> isn't an error; a real error would be a timeout or CRC mismatch or URB
> cancellation, things like that -- things that might leave the TT in a
> busy state (because it hasn't sent its final status back to the host)
> when it ought to be idle.  Sending a STALL isn't a protocol error and
> it does clear the TT status.
> 
> This is discussed (not as explicitly as one might want) in sections 
> 11.17.3 and 11.17.5 of the USB-2.0 specification.
> 

Thanks for the clarification, makes sense.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
