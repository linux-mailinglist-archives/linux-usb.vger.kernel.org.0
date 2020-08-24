Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9438324F985
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 11:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgHXJq3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 24 Aug 2020 05:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbgHXImU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 04:42:20 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208959] USB-serial (mct_u232): bit7=1 when tty is set to cs7?
Date:   Mon, 24 Aug 2020 08:42:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208959-208809-4BpGXGzak4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208959-208809@https.bugzilla.kernel.org/>
References: <bug-208959-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208959

--- Comment #1 from Johan Hovold (johan@kernel.org) ---
On Wed, Aug 19, 2020 at 02:52:47AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208959
> 
>             Bug ID: 208959
>            Summary: USB-serial (mct_u232): bit7=1 when tty is set to cs7?
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.7.0
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: low
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: mslade@epic-code.com.au
>         Regression: No
> 
> I'm not 100% certain this is a bug, please let me know if this is expected
> behavior.
> 
> I have hooked an old serial mouse up to a USB serial device, USB ID 0711:0230
> (part of an circa 2000 Targus port replicator)
> 
> when I configure it with the appropriate 1200 baud and 7 bit char width, the
> bytes that come through /dev/ttyUSB0 all have bit7 set to 1.
> 
> This behavior is in contrast to an old serial port on a box running a 2.4.19
> kernel.
> 
> Is there a standard for the value that non-data bits should be set to?

This sounds like a configuration issue. If the mouse is indeed using
7n1 and the converter is expecting 8n1 you could end up with bit 7
always set on input.

Can you verify that the converter is configured correctly, for example,
by reading out the termios settings, enabling debugging and/or
connecting it to another serial port configured for 7n1?

Johan

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
