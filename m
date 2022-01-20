Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A279494D30
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 12:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbiATLlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 06:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiATLlA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 06:41:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47D2C061574
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 03:41:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4630461642
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 11:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B15F7C340E5
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642678859;
        bh=3o57YbobPwgKqrN+/1UMaRcec+TblYhChk12qKroA4Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AuBwkgtsQWoXCvRT/dfotrZDmWAkFzNCLKyp+9DYAVZ563gblHkP/oFllBIyw9YMY
         /tMgTGyF5A5/m839XIsnXD7noOXY7SsGw4ueQvRMy/mwc/icqjqWdr1Cie6zQjSemu
         6t494BKc7bcIWptdaVCuLkNUo+CdhQiSgBo71l8vGiF50ra6pgOpfAY7VCe9tRJm66
         zTyT4T+ZbQqK4f1e9I3FGjg8BGiudHGpZ953/lmzS+GN/zx5q5V7KrzdKwyFKgyVsW
         rxcY1EliIhPeAEBA93wG/rlA7jMT+75jbdFFJbM5I6I8qzAR3SeLMAF1LTsIqThX6h
         r9nbeP8tBA4sw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9EEBCCC13AC; Thu, 20 Jan 2022 11:40:59 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215490] Logitech Brio doesn't initialise on USB 3.0 port of
 Asus M5A97 Evo R2.0
Date:   Thu, 20 Jan 2022 11:40:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nouveau@spliet.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-215490-208809-ASG9r8V10e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215490-208809@https.bugzilla.kernel.org/>
References: <bug-215490-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215490

Roy (nouveau@spliet.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15.13                     |5.16.1

--- Comment #3 from Roy (nouveau@spliet.org) ---
Re-tried with kernel 5.16.1
(https://koji.fedoraproject.org/koji/buildinfo?buildID=3D1878500), to no av=
ail.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
