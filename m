Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A9425501D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 22:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgH0Uhz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 27 Aug 2020 16:37:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgH0Uhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 16:37:54 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208267] usbip broken with latest kernels?
Date:   Thu, 27 Aug 2020 20:37:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.v.b@runbox.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208267-208809-uw36ITTmN6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208267-208809@https.bugzilla.kernel.org/>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208267

--- Comment #10 from M. Vefa Bicakci (m.v.b@runbox.com) ---
Hello all,

I just wanted to let all of the subscribers to this bug know that a patch that
I prepared to resolve this issue was committed to Greg Kroah-Hartman's git tree
for the USB subsystem. Sorry for the silence on my end.

Here is a link to the commit:

 
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=7a2f2974f26542b4e7b9b4321edb3cbbf3eeb91a


I had already verified that the linked patch resolves this bug with USB-IP on
Qubes OS, but it would be beneficial/desirable for others to verify this.

I would also like to thank Jonathan Dieter for bisecting this issue to a
specific commit, which was very helpful in preparing the committed patch.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
