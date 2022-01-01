Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CC0482841
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 19:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiAASvp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 13:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiAASvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 13:51:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6319C061574
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:51:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5701F60B6F
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 18:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB585C36AED
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641063103;
        bh=g24k5Tdp5hDcD5Ep+WGVZsQdC0U4WMIPCet/DTyGKjo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ouBWnZQDT2eDTKZwMzcrTPA21HFjEG/y+xLDwrmQyzD9eoAmP1g5apYv6Xx9Mr92Y
         84O5dqRh0hs23RUjh4ENnQNyd2eZ2YnKAmONMOmngQ3nRgxmG0gTwqrUTL+kYuBDGT
         Q6pKXkGCmgnFKutkW+QE14qMK1vJRptUw+JgD06e3Lmmns8N13IyiDf19X/kBT6fkx
         Ipibz7pokUf7KMZjjPFjdXQnUibNd4w8yDX2J7uRKPOJNvw6YzKxqtASHPSedbfhIe
         2/G94lPzits97YU2iGFsVgVkXheFe0dUAJC0o6cck8/o5jwaFxbYln0IqZx4gYejel
         Qyjsf7/3PtZNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A000BC04E57; Sat,  1 Jan 2022 18:51:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 18:51:43 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-oEVs9MjOBW@https.bugzilla.kernel.org/>
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

--- Comment #17 from Jonathan McDowell (noodles@earth.li) ---
(In reply to Jonathan McDowell from comment #16)
> Excellent. Your fix appears to make things work fine. Built it on top of
> 5.12.12, plugged in the hub, plugged flash drive into a port off the seco=
nd
> hub chip and it gets detected fine:

Er, 5.15.12, i.e. latest stable, I didn't just pick a random kernel version=
 to
test!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
