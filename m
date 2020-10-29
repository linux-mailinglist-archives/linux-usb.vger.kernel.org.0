Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CA329E765
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgJ2Jd1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 29 Oct 2020 05:33:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:32952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2Jd0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:33:26 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208257] Kingston USB flash drive repeatedly disconnected after
 "Set SEL for device-initiated U2 failed."
Date:   Thu, 29 Oct 2020 09:33:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208257-208809-6xSKZsXWBA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208257-208809@https.bugzilla.kernel.org/>
References: <bug-208257-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208257

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #9 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I've (In reply to Julien Humbert from comment #8)
> I asked for some help on the Red Hat Bugzilla, because I'm not sure how to

I have prepared a Fedora kernel test-build with the patch added, this is
currently building here:
https://koji.fedoraproject.org/koji/taskinfo?taskID=54473681

Note it takes a couple of hour for the build to complete.

See here for some generic instructions on installing a kernel test-build
directly from koji (the Fedora buildsystem):
https://fedorapeople.org/~jwrdegoede/kernel-test-instructions.txt

> compile the kernel with the patch, and I'm not even sure I could boot it on
> my main computer which is using secure boot.

You will need to disable secure-boot I'm afraid as test kernel-builds are not
signed.

If you cannot do this from within your BIOS you can instead run:

mokutil --disable-validation

This will ask you to pick a password (I would advise using 123456789) and then
on reboot will ask you to enter the nth char of the password a couple of times,
to prove you have physical access to the machine *and* that it was you who
requested the change.

This temporarily disables validation at the shim level, once you are done you
can re-enable validation by running:

mokutil --enable-validation

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
