Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B426482747
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 11:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiAAKhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 05:37:46 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45782 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKhp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 05:37:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EC1360AE0
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4DF6C36AEC
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641033464;
        bh=YC3RBNX+6g5/mW5RHxjsM11T8HcKlYhsxKhkKqXSerQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LsRA6gqSjYmDrx4ElxhYjyg3kDZmhZQ/x3eSA4cySJru8WPjoB5do+4p3CWIjA+fj
         Wo71CiSQ40InjILyN9vIff0UQP/p6Yei27BRpMxxo2VinTO+tvo4GdI0aDrc6Fu/e8
         7gfy7ChVfUs/7iye+nxK1GctOa8UuJu6mJL6kiS3kG4nRYvE8k4WQtAzVUC6MY0CcU
         2SdUAKiLmc3EEd3QqX3j5T0xK7nJ/Ult+IL2oRuVIcJJnH1Rh55VV0/O661aAq0V2e
         PTbcNVALkmyUiM1lGe7VTUZdd1X4N+OvP0pSQua0WuifZgtIvJHtNuoH9/OrtAbY9v
         3MsLLNNMKJ+4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 92F1BCBF85D; Sat,  1 Jan 2022 10:37:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 10:37:44 +0000
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
Message-ID: <bug-213839-208809-WcwB4HrsXo@https.bugzilla.kernel.org/>
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

--- Comment #12 from Jonathan McDowell (noodles@earth.li) ---
Created attachment 300193
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300193&action=3Dedit
dmesg, no usb autosuspend, hub working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
