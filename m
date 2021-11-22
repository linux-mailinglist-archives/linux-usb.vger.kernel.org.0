Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1084845916C
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 16:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239846AbhKVPeD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 10:34:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:60166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239815AbhKVPeC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 10:34:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4E3D260F4F
        for <linux-usb@vger.kernel.org>; Mon, 22 Nov 2021 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637595052;
        bh=EYsHlJSQQP7a/7PRbv8X2Gkg3yrjamc92xNRFjEeP9w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JOWdKmfi/cAOPdxvfF9l8FR5NCb3qLHzLdG9O+K271YgTu5epHKbfx9TSqxes7U5w
         ol5UbKdBqrNPtq65yEzv4jxVzLSHRfm76MqSSjuSGhkzldHGAaOG5oN63IsLxBT2vN
         u0Kj9Gm+hL9hgjYqvP0cH45WgnF+mS/4oXNSnzfd5BnNvKzxUu/qrphQHVXtEFzyF/
         G/+sida5aGhFG7hsr1P8+kXTItWK5YZQeQsCxnZAxeacMW6FEdfopSfAXoGhLwYPI+
         DOdW9d+N1WFzY23n9eE53ijoTcZF5ING+fFrGF+4/YW0OFwR+gsybIbSyh7k5yfBon
         a/LU7zeXyn+/w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 39F1C60F11; Mon, 22 Nov 2021 15:30:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Mon, 22 Nov 2021 15:30:52 +0000
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
Message-ID: <bug-215095-208809-xaaCtFd3Qc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215095-208809@https.bugzilla.kernel.org/>
References: <bug-215095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215095

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Since this happens only when the kernel is running as a kvm guest but never
happens when running on the bare metal, I would think that this is most lik=
ely
a bug in kvm, not a bug in the kernel.

However, if you want to track it down further, you could try different kern=
el
versions between 5.10 and 5.15 to see at what point the trouble begins.  But
doing this requires that you get reliable testing results, which might not =
be
easy if the problem occurs only 20% of the time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
