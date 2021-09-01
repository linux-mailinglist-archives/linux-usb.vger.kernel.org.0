Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535C23FDD7C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244416AbhIANxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:53:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242394AbhIANxk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:53:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5021561008
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504363;
        bh=X+xIe2zyt/bB3znjn9MB5G8/b+IIMqaA6fKN0ymmlY8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ax4G6aDB0c2h7TBc0p9jqr4wyf/tVshI0/9wZDIr3YqLS2ekOh7a5xm4i523ZnVha
         xmjlfqmboqHkgL7Axd85kCP9Qg2NJGcL4UgDbv4W+OAba9sqeow9fw0CnBuVZbaxPC
         15CgWkdsyIXOzFphv1XzH3n1dIvrXZEyx0Yl8WXd7qeGkQhrXQKZsINRVRhZrd1xTE
         bhYUCjgov1kZ5ysk/IAbeq2MXZNkEflfssIcLL2kZnkBu4mg57OaL/tKI0KE2zKsrn
         +NP7ZTLviXxBevud5C5kof8wf1Xxi0p5zMz7aBWmEktODViQrnUEF06B7I8YIW15m5
         nFuVlToZvAiYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4CB89610CD; Wed,  1 Sep 2021 13:52:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:52:43 +0000
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
Message-ID: <bug-214259-208809-AsbOSeUUxw@https.bugzilla.kernel.org/>
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

--- Comment #10 from wse@tuxedocomputers.com ---
Created attachment 298583
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298583&action=3Dedit
dmsg of boot with tb dock connected (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
