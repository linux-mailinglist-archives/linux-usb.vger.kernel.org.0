Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A453F2E1B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 16:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240820AbhHTOcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 10:32:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:38536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235928AbhHTOcL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 10:32:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A9E1961101
        for <linux-usb@vger.kernel.org>; Fri, 20 Aug 2021 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629469893;
        bh=79EAN2fUQnpSLH1oVaYEYNyY8dwl0l7CwVcZLjPL/fw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=onD/KhM1y+DICwd+0mYxcKI8XoG66IN6LJ9FwC7azK8EeIiYdmMRHIlln253HCT5C
         obd3kEOSdfL/PqOMXRhPiMDGhJbQywyrNhqOkzyV5FBW+TlW1Ucv0uqYUHxpfKOCKy
         ZtblDHuubTPj/Od6RyLY2Jy3TDhHlflIbgJvbyBy7HO221chXmCIMgvTcxe/PECx5Q
         PbQssl9+a3gVFXHuBx0AON+SHAfThgtCv21JUVnMgKv/RZhIfflvBXqjq2fS0GwybW
         vJq8Jyddb1ISw/Sc1cBHl74zbDwqv9t2iR6WxAFLbH/33ROk+ASu/2UknRDPe/wK6f
         7nU6duU7YFDiQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9794A60F01; Fri, 20 Aug 2021 14:31:33 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 20 Aug 2021 14:31:33 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214021-208809-guHf2eDVNU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 298391
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298391&action=3Dedit
Delay registration of secondary root hub

Would something like the attached patch fix the problem?  It delays
registration of the secondary root hub until after the primary hcd is start=
ed,
just before the primary root hub is registered.

Chris, can you test this patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
