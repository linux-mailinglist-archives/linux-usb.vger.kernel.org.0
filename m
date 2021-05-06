Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC22374ED3
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 07:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhEFFSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 01:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFFSE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 01:18:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FC81611EE
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620278226;
        bh=HxUg/4Ysn1GHOyB1eO3TURqOIgmiUHYfNV5aX3TXF74=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qwPDvUYirUjl1boZ53L58fNneMPnKxUck4aME3RPUtzT2Hoc0keSHFT14X3mWTits
         uRryvkR3YhBi5hgBcFpyUj6sYFpf/7gMgd828G1TTrGisjokPe+S3awWV2OdRnH1PE
         Vv+v5DE6zd3NzVIB9tPeidMC1sOEtIoHSMd0NIVE9pYXwowZY6/Q2IpeJm1p+rZea0
         wKFXH51cDLQt0LzRTO9emFzZ9UDfQw6kWc4I75cpfI1EpE6ig4j5bSXffs4jmBp8pK
         LHgYz1BCEcz1bKjgCzjFKQBKXO/zYz4UN1Q8NfB6JpH3Mtfv8UuJqFqxPA/G4Bnmzo
         2gZdT5PARMURw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8BEC16129D; Thu,  6 May 2021 05:17:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 06 May 2021 05:17:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212955-208809-b9zmfssip1@https.bugzilla.kernel.org/>
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

--- Comment #4 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296665
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296665&action=3Dedit
dmesg USB 3 port working

I hope this helps you identify the usbmon entries, and eventually leads to a
conclusion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
