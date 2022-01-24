Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAE7499F95
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 00:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1841601AbiAXW7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 17:59:34 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48620 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1836682AbiAXWkk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 17:40:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7640B81255
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E540C340E5
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643064012;
        bh=RY3FT4bXSOOJL1G0OpyNEBCzpqVgOO8tY3HaY4K01uo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nHudRIs229AU/0KWX8Lmh5VwSCYdgq2QX05m8SuStxyRodXZ/Wmv5oFVOYFAqzm8i
         KCSydrfVtZC78DqNaE+Eo5JAP+C9yCcnQPiHbPqhI0Raf3JzZpCnbk3ZvlrVzys22c
         JItKIorS6eMVY0h0Ht0ybQP+Q8uSCwyEt1hr7YKqbdsfSltjhoDnY4UAi47XzDZUkH
         M8Zgy9m8oMa3fZILi3biKvzwD4rwoN4pYHqRehuji+rlhbKk7LmlTKG0go23ypZjS7
         BVWJaNIfPUdYw6Tr/OPyvmhixTA2YCdz9lqkQ2ir7hBvev48t+HzW6VXoFYeuekT40
         0GeWqcV90hzZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 89552CC13A7; Mon, 24 Jan 2022 22:40:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215529] REGRESSION kernel NULL pointer crash in
 typec_link_ports
Date:   Mon, 24 Jan 2022 22:40:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215529-208809-S0pN54cqMW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215529-208809@https.bugzilla.kernel.org/>
References: <bug-215529-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215529

--- Comment #2 from Len Brown (lenb@kernel.org) ---
Created attachment 300313
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300313&action=3Dedit
Dell XPS 13 9300 dmesg after patch

The patch above didn't help.
I was able to grab another dmesg after boot and before system hang.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
