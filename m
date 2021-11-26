Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01D545E39D
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 01:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346012AbhKZAR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 19:17:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:35434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237131AbhKZAP7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 19:15:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F8A560231
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637885567;
        bh=lPuLd4QeF9PfrGbDe+98rSW+PpJ2bYOTTIyBbWPZi+k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kRLm0NJg/3pCHCdBoLz4q6nHuFrv0ezFmziWEPBbeMP3MXn+HwLp59UmR/+9HGPzy
         Y58yphP6Nnn+IwMjyvWwAmq5NwcKbK/xc/YPZK/ylRR+DCoK9wa6QQVOi+c0+IJ+wH
         aIK2ldWwkbddqzSkHHs1t3oQQI77ZZzm53lABv54+7lsMv0RoSrPLcaX+U2tm+7X+A
         odS6gagyDnuhc2rQ8mEqyG2cRf/e5Fo6HO+V0+4pq4CqTNqge7p2ioFi1OLAdyv484
         Ttnv0FqWpVtqjAIrXEbxhsxC1d2BjooYOUeZ3YDvxa8594hfOHYJy8NzdqqUzlWjzT
         JtNxhoeQvvq/Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5B93660F39; Fri, 26 Nov 2021 00:12:47 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Fri, 26 Nov 2021 00:12:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wangyugui@e16-tech.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215095-208809-wiXlwgkRVQ@https.bugzilla.kernel.org/>
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

wangyugui@e16-tech.com (wangyugui@e16-tech.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #6 from wangyugui@e16-tech.com (wangyugui@e16-tech.com) ---
This problem yet not happen on kvm/host 5.15.5. so let's mark it as kvm/host
problem.

although I checked the patches of 5.15.5, but failed to find out the patch
which matched this problem directly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
