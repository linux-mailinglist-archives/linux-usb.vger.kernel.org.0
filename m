Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC789403EC9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Sep 2021 20:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348081AbhIHSDG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Sep 2021 14:03:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229789AbhIHSDF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Sep 2021 14:03:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CB10E6115C
        for <linux-usb@vger.kernel.org>; Wed,  8 Sep 2021 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631124117;
        bh=JA5QSy4DxGSptRR+Jcm/2MbcCAP3IErCCIopGCsg7cg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lcxKhXDFuP3tIuwkPfSSweIiZi8twA5ZcOQB0GHXAfG8B9xP7NcyMN4px6/qhejzb
         cIBmAYxOVMO5ZfcJ75at4NrDPk5MXAtkvyYnbj3xgqJ9qT6758XVGIWJwiM4bAa2Zq
         qXSL5OzhzQ/RmMZKoQCg1Svo5EeXyhtCBtC5cQK3viTobJ9XGTe0uhOQHjyZABZJPq
         EKN+41EIz9QoCBwdD3U5MF8QYXbY1EuLDkGJNTmmBtJB/YusX/4YGexj+y5e9YPGn9
         uxWk9JJRu2eqvc+bnDNhBnvxZ+NGUcS8utkDOYRt/xCoMbbNkT8TUHv5z5OJt/Mkmi
         bgUpHCkNqhYJg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BEB2B610A8; Wed,  8 Sep 2021 18:01:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214137] USB randomly stops working, starting with mouse
Date:   Wed, 08 Sep 2021 18:01:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yaomtc@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214137-208809-hqjMjKQI74@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214137-208809@https.bugzilla.kernel.org/>
References: <bug-214137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214137

--- Comment #6 from yaomtc@protonmail.com ---
I ended up swapping in a new motherboard from AORUS. If ASUS ends up sendin=
g it
back to me and it still has the issue, I will get this data.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
