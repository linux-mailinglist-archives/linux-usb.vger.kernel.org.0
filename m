Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C741F3FDD71
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244502AbhIANt3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:49:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240837AbhIANt1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D5BC61057
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504111;
        bh=cc2Tyt98peRrc4BmRK3qQViY+ZptaksccPR5KlJtTA8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ti2XJ6clV9qlnsraPisIkBP71WBsfqb3GxNGvTljWgecAEldQQIbVD6qg5OWyr8g4
         4KWWJbolynTf5rxUKOvh0wUG0JHznYG7nEnrjfM0XB6Gm6uohIto/zmNtWwXBgS7r8
         KaPEnrSsRlKpbSuF7/QdCbYVOQNS8lgfX/XO0ei8ClMvDpy+NZ7A2wrSiSotTL8+ix
         fYXVcvtEYz67hYX2gUOJ6voxh99JfZkoz0E++XRQ5qICrxfYLGO0bfTR5V9vixfHN/
         woFow5jU9hENYjkAeCdNryF2d07/78PcAmOJfcTjRkQ9NBHjFmp3HCKvbZsL6+Y6Gg
         Pft3eRO/i0gjQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0F8A8610CD; Wed,  1 Sep 2021 13:48:31 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:48:30 +0000
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
Message-ID: <bug-214259-208809-SksQJqGlpb@https.bugzilla.kernel.org/>
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

--- Comment #5 from wse@tuxedocomputers.com ---
Created attachment 298575
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298575&action=3Dedit
lspci after connecting tb dock

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
