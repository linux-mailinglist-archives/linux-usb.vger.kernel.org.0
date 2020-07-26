Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4509A22E055
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 17:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgGZPFn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 26 Jul 2020 11:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgGZPFn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 11:05:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208257] Kingston USB flash drive repeatedly disconnected after
 "Set SEL for device-initiated U2 failed."
Date:   Sun, 26 Jul 2020 15:05:43 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-208257-208809-eTvOpe1rVI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208257-208809@https.bugzilla.kernel.org/>
References: <bug-208257-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208257

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 290577
  --> https://bugzilla.kernel.org/attachment.cgi?id=290577&action=edit
Patch to add NO_LPM quirk

Here is a patch to add the NO_LPM quirk for the Kingston DataTraveler.  Can you
build a kernel to test it?  If you can't, the people on the Fedora bug report
may be able to help.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
