Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2413FDD70
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244695AbhIANsn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:48:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244689AbhIANsm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:48:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CF7F76101A
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504065;
        bh=GdFPAs9cssPFNLqgZUZR9uHCNpWEEHekF7m7DQ/bFR0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SMRa58ExbCU+U3Y7lRtrbKT6aWiphgEeUoiKb9wOy/G6IdGYqOC7WVGaYHdJOudeB
         2Uz5lGGxz750PdTdSvZ+NF04nuFoPfuueYn/i8Q2Oxve6flZ6Yb+KN8T6DIbW/44k8
         3z6lGdWtCEdloAruvqYnGLR7aNFFZf5nE4+BEynPbQIhgVxIETKvoTWglesq4rwN9K
         EgthomyxAd02jEIhlEmxd+fGDxjme8rebCssgCbvwv/Pn4oEp1x8nE4eODQSPupxDg
         j/2eHDwcdWGdYbF6dj2vz/INdtl+x+xHKZtg2c9L+sLEsQqHy0vDXyLwkgKf7XFRwM
         eyHghSthz3PnA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C4EA9610CD; Wed,  1 Sep 2021 13:47:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:47:45 +0000
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
Message-ID: <bug-214259-208809-OK5MJpw1Zh@https.bugzilla.kernel.org/>
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

--- Comment #4 from wse@tuxedocomputers.com ---
Created attachment 298573
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298573&action=3Dedit
lspci of boot without tb dock connected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
