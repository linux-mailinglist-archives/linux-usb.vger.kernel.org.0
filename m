Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A16374ED4
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 07:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhEFFSy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 01:18:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFFSx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 01:18:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E7C34611EE
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620278275;
        bh=5PvJ2hSO/pu6KEFvTSePfAcNIMvPyHf98mj6R2o2IBM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=frTH5cPsaZF8zL5NcB/4nqoWbu6Toqwcn1RFVNgfeqEH9ICl1iq+mhn8Soy+VQStN
         5ci45gJ5hx6bDFhmDKWkYimP3pl6lghy0mVInAYy2BD75HDwJbDxx6KnNfl2CrT9yO
         +6pZbn+tfApCA6dvZ1tMtmAGzmAfJiLM5D5FSNjI00b/3kQCvZ5neOSit6PXuaSihT
         aLhXtL471zW1GpckpHcs8HcrR0Fd9ADLmArhbDCNjxbeveYChk3Mw7IijslDNuKlxo
         ldXS6ezW/4KdiozNktgu5jdkucOr2YxEQBi7+KkTca+/JbsJjvjXryjBQDSuuWcy0d
         WBIUmCHmSYP6Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DBF876129D; Thu,  6 May 2021 05:17:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 06 May 2021 05:17:55 +0000
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
Message-ID: <bug-212955-208809-9dg21ScXeP@https.bugzilla.kernel.org/>
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

--- Comment #5 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296667
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296667&action=3Dedit
dmesg USB 2 port non-working

I hope this helps you identify the usbmon entries, and eventually leads to a
conclusion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
