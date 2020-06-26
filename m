Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A17220B931
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgFZTQl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 26 Jun 2020 15:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:33392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgFZTQl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jun 2020 15:16:41 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208307] Alcor Micro Corp. Multi Flash Reader [058f:6366] keeps
 being detected and removed continuously
Date:   Fri, 26 Jun 2020 19:16:40 +0000
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
Message-ID: <bug-208307-208809-xJVVbZqrIQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208307-208809@https.bugzilla.kernel.org/>
References: <bug-208307-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208307

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
On Wed, Jun 24, 2020 at 05:05:49AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208307
> 
>             Bug ID: 208307
>            Summary: Alcor Micro Corp. Multi Flash Reader [058f:6366] keeps
>                     being detected and removed continuously
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.8-rc2

> We have a laptop equipped with AMD Ryzen 5 4500U with Radeon Graphics.  The
> Alcor Micro Corp. Multi Flash Reader keeps being detected and removed
> continuously.  Then, once the storage modules try to access it, there will be
> the failure.  These messages keep showing up like floods in the kernel
> message
> log.

Try disabling Link Power Management for this device:

   echo 058f:6366:k >/sys/module/usbcore/parameters/quirks

Alan Stern

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
