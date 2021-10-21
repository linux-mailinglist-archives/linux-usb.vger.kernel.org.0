Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E25436B54
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhJUTaG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:30:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUTaG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 15:30:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E497B61213
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634844469;
        bh=SAQZFVKqSJW6AQR5cjoqIcHivNSmt60OCX7KgN50/WY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gashT1J2PWOyazD6xKb9AnWuIO6YYlEf+9ZNrpJmPgleq/w8LxO31yHcUPggFMiq+
         lrKFUkJPidi1AcEu0JajJFu1VPvDZXOmM1dqEu+oe8GDEc6gqmtxjYlewHx8EVnJcS
         S5QNLLGXxYc2TQ0AfYpRul3Yvb4ic49D3ivc/27N81eAXisT4rjja/9foO7rZ2Lr0F
         CmNv/65P+GuY0/TYr5fxs068oJbgCcLxHgJfCpCyF2RPQBWDjJFfi0c5v+xYBcf/cl
         Igf/U+CxK+eC8iU3SELc+J4RjPGGwQLsO90wFVE8mV5oyE3LmAdaSqGBD9jxNyrDL4
         ysQXkwgsL5+Gg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CFD8760F92; Thu, 21 Oct 2021 19:27:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 19:27:49 +0000
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
Message-ID: <bug-214789-208809-lMUTBR3DhZ@https.bugzilla.kernel.org/>
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

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
Okay, but _why_ don't the timing card's interrupts get handled when ehci_irq
uses spin_lock?  And _why_ does changing to spin_lock_irqsave make a
difference?

Do all of the card's interrupt requests get lost or only some of them?

Are you somehow getting recursive (nested) interrupts for the same IRQ line?

Is ehci_irq somehow getting called with interrupts enabled?

I don't want to make any changes to the driver until we know the answers to
these questions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
