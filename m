Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CF43FDD6D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244642AbhIANri (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:47:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244570AbhIANri (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:47:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 778BF61057
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504001;
        bh=G8R5w14mWmwvAto6+cqyaBFKxW9oA7lHg3Na0/Kj2tA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dh2ecOeP+vfdI8O8mne6qrvugf9aIJGGL27uxVltA0qdID0udO3157wYLfTYj1sgW
         qysXqBFn7FM/mAg2AE1eupVkJ63Znb22UNrYuX2roBOZu8CoOy3gIDZOqKOtNLud5U
         J83I86MFoqPozdkzknKUVGmn+zHPHkVYBdP25hgSXfg79yaE0gk4pC0pO2nHEBCJwN
         ffNiTgqELXtFA06W2duO8SfFW/Ps/KI+Ax60MLLFOSK10U57dSdAoDf6AXoe4jCHtB
         RHY8XougT+9IEZH9mB0mNfcbDRjJDk+8eajhre73plJyMrsoYA6/9cxoCZQMkg5R2f
         8nIH16UEbQCJg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 70261610CD; Wed,  1 Sep 2021 13:46:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:46:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-4gALFoa502@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #3 from wse@tuxedocomputers.com ---
Created attachment 298571
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298571&action=3Dedit
dmsg of boot with tb dock connected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
