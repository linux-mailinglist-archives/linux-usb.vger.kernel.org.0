Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73EB339D23
	for <lists+linux-usb@lfdr.de>; Sat, 13 Mar 2021 10:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhCMJCP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Mar 2021 04:02:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:57382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhCMJB4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 13 Mar 2021 04:01:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A6C6F64F1D
        for <linux-usb@vger.kernel.org>; Sat, 13 Mar 2021 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615626115;
        bh=/gijRcWvx45dWpF+Ct4VLGmshc+3h6FvJcG/NDi28k0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ShKn8DOiNvTI20aqrbLu0x1QWLuAUhSX3MYKDuH19sLZ/6vxmB8TT9KNtTFHRIo14
         /z1DufT1lAEuUs1PphfkLroOvT38k9uye63pefdcx8dtlv3Ob3Box91Z7l8nmAUhex
         FCLGe9pn1NDCkl+ckXUi5jblq6v31Mo92gFcAOv1oKrX9V6Q+9m9YGEYkNP0CJlw01
         4flIlK8dU76cFSfXfHQg2L48HrIA6NjNiC6ZOpLevX5pgLhiUhQZQT+n0QyJ5GeOVJ
         WJG99gR/dp/Yn7yv0GDEkHYbQ2GrA56TdFEMa5pdgQeINAM+gx/MPGcNBJ9D97n3M8
         AbHW9L/Hd4XlA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9ADDA65202; Sat, 13 Mar 2021 09:01:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212101] xhci_hcd cant setup
Date:   Sat, 13 Mar 2021 09:01:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hose@posteo.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212101-208809-NtjEAq1aIp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212101-208809@https.bugzilla.kernel.org/>
References: <bug-212101-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212101

--- Comment #1 from pik a-b (hose@posteo.net) ---
Created attachment 295833
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295833&action=3Dedit
outputs for diagnosis

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
