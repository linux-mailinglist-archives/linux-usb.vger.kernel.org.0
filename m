Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC983FDD81
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244404AbhIANyk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244347AbhIANyj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:54:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1317F61008
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504423;
        bh=nSB1zvkj/aAGLTZ7cQmKfSoOYDSwnJEbdFZX4okD0aM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cFzocTR7oFBWWR7uF6hYuMiZDYH7gjp2A8KbGDJFdA0ICUlp0epmtzTZHDBjYgWqd
         FK1SwBktoQsbOGHnFI7zNTZuHppFvkZop/3xaHPh0HIGMnOHxDqvoRmav8znOwHsoC
         VCLQpSUpNTRdTBghxVXkdynUHe0yHXlEScNfzGdnTjgTP6AvxYTzMQExF6q+r/akA7
         g6gYrRA27b+jLBTs++CniLMU94Pc+BgQc4U/qBq2+PiS96V4kBVSGIXoqIA3SAyQWj
         uZiGM2vtNv3TXHME5x69z/MBh1xsmnKUO6HL8pYt6qwlrs8eTyLWOkxzBG/hd+08iF
         anN8mLoi6hEHQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 06783610CD; Wed,  1 Sep 2021 13:53:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:53:42 +0000
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
Message-ID: <bug-214259-208809-KQJaisuYGH@https.bugzilla.kernel.org/>
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

--- Comment #12 from wse@tuxedocomputers.com ---
Created attachment 298587
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298587&action=3Dedit
lspci after connecting tb dock (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
