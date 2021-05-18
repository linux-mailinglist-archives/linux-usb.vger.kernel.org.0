Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4876F38820D
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 23:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhERVVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 17:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236604AbhERVVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 17:21:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 973B361209
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 21:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621372798;
        bh=EiLMZboPgt1R4krql7DK/HkWMSz+L65U/NiGkQbJZmY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DgT/0bup2Iyk14wxc2pETRgQZDQRxz7S/bTnn1h2xpGMVzyccODoz0frrBMqUr2k5
         8hnDzp5sevNuxNzYiw2330spL4e8AWUrXJms142j9zbYS+7U8EB9LdBjLxf0IEQzl9
         YLFN+WQtz6YLeLlzJXyDP7sSyhEsBD6ovL0Xdxsd85sV/JSO9MLk6Cx4ECoRJN6l4E
         u68UArVQF4BEtZS7nSZmGJ/4EEqaP1Ad5KzFJ5aADoxqk9YNJmWPLO0x66u3xpouWn
         mVWjQ2AvhNDOl5or3THAJBgMhQ6E6g9bIlRLewggJ+F7y6i/OfB4eg0EFBA9QAytf4
         5a9jBdA5ubIeg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 945F66124A; Tue, 18 May 2021 21:19:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 21:19:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-KhX5sry2Tn@https.bugzilla.kernel.org/>
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

--- Comment #15 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Thanks again for the support so far Alan, I appreciate it!
I'm looking forward to hear from Mathias.
Peter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
