Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DE83FDD7E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244889AbhIANyP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:45166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244587AbhIANyJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:54:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EA38B61026
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504393;
        bh=xea1Ua3o1IHl80fUlDRfivrw7NtlhQ2FFIsQ9vh1gvY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pU9nStkFMhGpN20fzSj3oh/ovo4X2gYSotpTp80czrwVdNYRqlYqv26C+u/PbxI5s
         4ND5BaN4HqDJXa362eT4P2wXKjtCZCIbz6/4ylbaZnu2jShJNYqAZdNR/tFGq8US80
         EG9uZs1/qKd58PTiK/QAi0JRZe0hfS01oLNtIDU8cls9HuK5N+gzpilmx5dqaYvzlD
         9qGu98uJQB42wA3r1R/syC6nsyTiTYYG7TY4M5TTOCXi1DblHmKr31kKU2kbg9OHrU
         hfJPcBWSHQ1pO+Q0VvcVVfZrsjS6tBkVB9SoJq7cb9FGpd7nkyG89C4FCJ6U9c6MK+
         WRxVq2tPigXrw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E6C6B610CD; Wed,  1 Sep 2021 13:53:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:53:12 +0000
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
Message-ID: <bug-214259-208809-LORRbRIIwZ@https.bugzilla.kernel.org/>
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

--- Comment #11 from wse@tuxedocomputers.com ---
Created attachment 298585
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298585&action=3Dedit
lspci of boot without tb dock connected (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
