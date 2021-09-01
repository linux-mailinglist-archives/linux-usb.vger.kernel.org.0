Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB343FDD67
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244372AbhIANq4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244277AbhIANqz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:46:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1FD4360F92
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630503959;
        bh=keX77VXNmuPH64e2momLsh1sLTNO6HdE3+x+lmjNEKY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=blMVGDNMMKEYcc8gHdEFAHTfkKSp3ZpyxLGGjA+0hyMyn/8TmthH3MQvLD8gCJBkZ
         MZKnIz+y17lw3jaQeKQ2MEy19WW0QxvbQV7FtWYyvS6zx6DOB1lmw5NmqUsoFWjpaH
         mEc/0UkJt3ZnOkGWkIjWzdJH11O3KG7f0XIaU5vJB9wa9BnQDZO3SvLMGD1qsNLIvy
         YiPJ8KcAIb2Td6dBsZ0saZGFfPRlq74E55q2SjoC83jy6hmwz2JTsguuSxZE1hE3eB
         ShfgPVVjzjQObYaXY0DRI0pMRk7MvG5GH5G91Lzvqy7jF/qqsQ+NB8lr1EC2iWpXhm
         KGGHfrNuU3+1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 19E2E610CD; Wed,  1 Sep 2021 13:45:59 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:45:58 +0000
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
Message-ID: <bug-214259-208809-qTlpQHpuex@https.bugzilla.kernel.org/>
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

--- Comment #2 from wse@tuxedocomputers.com ---
Created attachment 298569
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298569&action=3Dedit
dmsg after connecting tb dock

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
