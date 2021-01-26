Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714BA303FD8
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 15:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392407AbhAZOLk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Jan 2021 09:11:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405770AbhAZOKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 09:10:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 39D7F22D04
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 14:09:20 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2C96986731; Tue, 26 Jan 2021 14:09:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210351] Wrong setting baudrate for FTDI chip FT230X
Date:   Tue, 26 Jan 2021 14:09:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210351-208809-8KTTIUc3fD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210351-208809@https.bugzilla.kernel.org/>
References: <bug-210351-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210351

--- Comment #5 from Johan Hovold (johan@kernel.org) ---
Your reply never made it to the linux-usb list so I didn't see it until
today when I was preparing the patch I just CCed you on.

I'll queue it up for 5.12, but then I think we can backport it to the
stable trees as well.

Thanks again for reporting this.

Johan

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
