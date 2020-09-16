Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013C426BFEC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPI4e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 16 Sep 2020 04:56:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbgIPI4d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:56:33 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Wed, 16 Sep 2020 08:56:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209089-208809-7u1WksXxXJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209089-208809@https.bugzilla.kernel.org/>
References: <bug-209089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209089

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #18 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Manish Jain from comment #15)
> Hi Alan,
> 
> Nice to see your response to the reopened PR.

Storage and UAS do use the SCSI command set. Hence

1) the commands specific to SCSI can be issued
2) there is an sg device associated with each sd
3) we have optical drives, tapes and other devices on USB (USB-SCSI bridges are
real)

Hence if anything is inappropriately named, it would be SATA devices, not USB
devices.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
