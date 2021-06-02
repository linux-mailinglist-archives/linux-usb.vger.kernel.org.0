Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E92A3993FE
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 21:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFBTzx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 15:55:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:44516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFBTzw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 15:55:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F221610E5
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622663649;
        bh=OJwmY625R9Z7qnHnZtNhCYcLjrfY2Vr7O9X1cxLI02E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KaJUSbcl3+0RV6iKmSn0KPfoHgwIGH7iJj7RSc4t3fE9DwB43yXTkrRUQalycXe3F
         O8G9/6mGfuJxhACP49JyVS6crJw9y9fHoje0Q52GL27VkA4jHTOw0VcyUA4xSUsmho
         AkL3NLTaG5EE76MPp9dtxr9e/EpNpSaSE99GlHurF6NcP9ZQ1A83XiThhANtnjGHAT
         IyftMPJKZCRAhQBEGEx11La9TlN/IgTD2fIpw8jOmsSjxbpJnuBoIIHQ5+m29HIEss
         k3XWM4NdPXXtzUxW+DLkZH6pKHlfKTQlkeiCVaM8qQBOENyWxAZ6oU8MqNZY4CiCdG
         QkDpyGmaEApzg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 689E161167; Wed,  2 Jun 2021 19:54:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 19:54:09 +0000
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
Message-ID: <bug-212955-208809-sNsBIKY4x3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
You do not have to go through that time-consuming procedure (checking out a=
nd
reverting) for every commit in the bisection process.  Those instructions I
gave you were just for verifying that the final commit found by the bisecti=
on
was indeed the one causing the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
