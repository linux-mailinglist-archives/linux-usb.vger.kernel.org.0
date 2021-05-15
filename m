Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA02B381994
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 17:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhEOPiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 11:38:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232479AbhEOPiD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 11:38:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5409861377
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621093010;
        bh=X/lrg8LYdtlT/S3UvhtNWthULyOE3VOGQQCfFWCXWBI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tKke/N9SgElU8fnWZHBh8dEiCD85oUew+mQQa17r0oOeP9JtYS/VefAKwSId7MQFw
         CoqIUWUro0mAlu78O48qu0LcAJ3w9bTfCSsObDaVibsrDLX2CeKPjAa97p+AY9/bzq
         QLlFKzLkCZJRVEnsg/ORSR3wrSAXkGKPHuIhPlSiWBufyV4qWUSgyDC3unlr3XJshR
         +4LdcsUZcpnOTL/c2zWCSvYhOyCspnwWrR2cZmnlahaEXYbHucxl80BnlbIP0+ZlyP
         P6lOOYv3AHimgxk9Hgm+pTFVTQoMr3HpMVgRdBV7p59Kjh87sId8YFWZl+6BnBgqiw
         ri3Xc34V/IIhA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 46E24610A4; Sat, 15 May 2021 15:36:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 15 May 2021 15:36:50 +0000
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
Message-ID: <bug-213081-208809-LjNmAGSBl0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
Can you collect usbmon traces for bus 6 showing the failure under a 5.12 ke=
rnel
and success under a 5.11.21 kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
