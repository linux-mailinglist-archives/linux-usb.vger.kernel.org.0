Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A15F436B72
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhJUTsh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:48:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:37160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhJUTsh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 15:48:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C50F76108E
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 19:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634845580;
        bh=+WlrllNchFoggVurJ6wANFVd0X4oZnGTPPQRuZhpWyw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W1SkCRYVLVjtMHJCpmHgR4BvepUDnWbiVPiD4SL573Cv7NxIHiefnl/vZmv3+iDil
         +WZtmcOzBoByNlzNUBzAiZOStr/cneAtQ7C/TOd3STJf8iEugDIw5LBjt9q3oE5Tbn
         8KeWy3yuuQWqCsyckZUc5mtbSEGA8QOZKDdl12YVA+2I7zOuj5TLhxOIxDEhTmQ7eE
         yR1rosMulIEgwEy2Hds1ugrOhHBaMKnXrrc0iw3SaWDtczV67WjewX/xW2xmWsRSjy
         dGuBaF1t0gNClNUAOKvXUKEtRO4yVWb3QPQmzUwrmxHIXnRY4b97lKsA/kZHLYlZT6
         n5yY1wZpiWyZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B9C5760F92; Thu, 21 Oct 2021 19:46:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 19:46:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-Ijq3oU6fFr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) ---
How many of those 90 interrupts were issued by the EHCI host controller as
opposed to the card?

Are there any USB devices attached to the host controller?  What does
/sys/kernel/debug/usb/devices have to say?

Does the card use edge-triggered interrupts rather than level-triggered?

Have you tried adding any debugging messages to ehci_irq to find out what's
going on when it runs?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
