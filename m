Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182A448252A
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 17:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhLaQch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 11:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhLaQcg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 11:32:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD33C061574
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 08:32:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0BFA5617F3
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 778E3C36AEB
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640968354;
        bh=JZRs/eHrPB0NIAmOtDVwIYctAamLhzFncyb9eA6Vlwg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Irs5Io7EttnxA0WMjQQW40brFZp0xQ9t4QR5WqIwzSxJ1KVEQcAS1bz7w3dLfyzfG
         Lu3JfOAQndaWQ8jV6D5NpKC4BRA/cPIULWaG5lmv6lpN/p/Ob8NsDo34EVnhZgs2MK
         tlCf3NqlgV9z+2VW7vxl84vUdWTfXf0lY7ki6M9dou8MmhkUs08+2Gd2sWpo/L+VRX
         GyK1so+u1WgFTjJTwFB8H9y7uliXx9NqaPwQa2AS+lLM7iqBD4vgshWaHy2WseaeSr
         mvJiMMxQhzJOhePnQ+yr9H3/71RFho+0WdbO+Zr+3I4rOJfCKnTQfQCAYrQyRIPeSf
         vIAI70K5vucyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 67287C05FCA; Fri, 31 Dec 2021 16:32:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Fri, 31 Dec 2021 16:32:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213839-208809-uhxLKIFWxu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #8 from Jonathan McDowell (noodles@earth.li) ---
Created attachment 300190
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300190&action=3Dedit
Plugged in under Linux, USB flash drive inserted into port on second hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
