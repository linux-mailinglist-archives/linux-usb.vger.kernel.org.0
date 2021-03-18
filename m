Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F233408A7
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 16:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhCRPUH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 11:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231596AbhCRPTq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 11:19:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 22FC464F1D
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616080784;
        bh=sjXuxrjVkNjvpqcBFbq+MtqeH3Kk8UTgxvpVUepwvx0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NxUjJAmZ3UqTBQfwf1obHp6F6iCY7zDiuBKmnddAGiYm/F9IBSczzqmIxBh3StjAh
         ZiQRxye4196WFjF2G23BsJL04cDotPRmn/+v8NPD//dFaHomRgnCiuQ7WmdWS4BKKC
         T9jco0EvIayiONmPQSjTQbhBNLpNEVBYhxaUlZDLy3mgI6f8ENioA0yy4mg+/tWbCe
         eeVWRaDfuHvd9W6HQxCjRQYGBJt3FqH1sIa3HZ67tZHCvk4SYiqo6fDUYj+3Bad0F8
         841UfYY7eTQNIHIhrCIGbDIv+u4AeOioiyfHOLsfiiKs2tX3+lF2bDYhn1HGqVu1lv
         f5MsWYl5IlGyQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 15D70653C5; Thu, 18 Mar 2021 15:19:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 18 Mar 2021 15:19:43 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-7khJakrpmW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) ---
Suppose you install the jumper so that the mass-storage device is enabled.=
=20
Does that help the problem?

Marco's log suggests that the colord-sane program is somehow related to the
problem.  What happens if the program isn't running?

Is the dock involved in the problem?  WHat happens if you attach the keyboa=
rd
without using the dock?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
