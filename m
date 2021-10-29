Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F624401A0
	for <lists+linux-usb@lfdr.de>; Fri, 29 Oct 2021 20:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhJ2SC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Oct 2021 14:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:34480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhJ2SC6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Oct 2021 14:02:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DB7B610E5
        for <linux-usb@vger.kernel.org>; Fri, 29 Oct 2021 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635530429;
        bh=z/sshuXznMEHv/LVQeEPCY7/Jo21SN8u6L7d3F1aD+o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=neinEJdonvidTcImmn6jSJ4SZQ4TKEVNm4IAv5feYE3rYwuxx/qnodp9ldsuOV5cI
         6sckwb0TdqhOC9UR3qwYGcgWhU8WttvR3zBfHVh8lXMZaG+zaMcKHYpnAIGYK9y/Kk
         4ciWXkwBwe+5QrD44PsXJbp4E1vJ45kgYnwUEz+g8TyYe407H+THAdnVE7FU4eP+HY
         9BblKIGVpEc2uGooUClgD22BUZw76g8C/gk+vyq74aWiKM8sdBgsZ1euiINC7QSPv7
         73pivco008eiPxOnS2KFK7JTSHJktddlVhXYn0TfuroWDWHwt5sotmHhFzieDpQ65Z
         GxFLz3AEhdUGQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 49D4B60F14; Fri, 29 Oct 2021 18:00:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 29 Oct 2021 18:00:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: meven29@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-GfNxMTNjNU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #6 from M=C3=A9ven Car (meven29@gmail.com) ---
Also the driver ucsi_acpi_platform_driver does not hook to platform_driver=
=20
resume() suspend()

This might be the right place to handle resume/suspend.

Found the usci intel documentation:
https://www.intel.com/content/dam/www/public/us/en/documents/technical-spec=
ifications/usb-type-c-ucsi-spec.pdf
might be of use.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
