Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9572F72F8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 07:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbhAOGkh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 15 Jan 2021 01:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:42552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbhAOGkh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 01:40:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C4F023436
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 06:39:57 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2D93B86728; Fri, 15 Jan 2021 06:39:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210777] pwc driver doesn't work anymore
Date:   Fri, 15 Jan 2021 06:39:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harald@a-little-linux-box.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210777-208809-KvNY6uQgDf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210777-208809@https.bugzilla.kernel.org/>
References: <bug-210777-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210777

--- Comment #13 from Harald Jenny (harald@a-little-linux-box.at) ---
The patch was just uploaded here to allow people to fix already released
kernels, patch submitter Matwey V. Kornilov took care of submitting it for
kernel inclusion. But thanks for your hint anyway :-).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
