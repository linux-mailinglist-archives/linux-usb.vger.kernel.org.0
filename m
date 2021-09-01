Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64393FDD7A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244255AbhIANw7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:52:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242394AbhIANw6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:52:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F23DB61008
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504322;
        bh=82FQ62NyP5IH5fHpBTW34Afu4rSCE4K1tC60HuarqzI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sT1Ewb5s6FpAHlZ7xK4eM5ZyCKPZ4n/f1S6hAg4uBDOIdqD98iRuNESToIaL1muMN
         4D29EoOa8OUOFVUL/+kjdw0m5Nk1trR1AByfr4L0CfiZwRBqJN8Nvhm3WTgZQTQS+p
         D+/lP5DhNJVGGQEzw6sGZitgq6a27D06iNVsmqdxttb6F1NVbGNzzOrLSq8c0BLwQA
         HZLUVjPFBR5oAQR4N9HswrnGmX5B7/rAg/XU2nqZdQX7uZ/A94wnq6XssOcMbLsu1K
         Io7xqoOdL0dueW9kLcgyVJNBYPJIeU/qlnV4b1GmBiN49d5pkgyHfD+194vYxXG4Fh
         NnUkTCnwAAvrg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DD4BD610CD; Wed,  1 Sep 2021 13:52:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:52:01 +0000
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
Message-ID: <bug-214259-208809-8MGC8DCcVc@https.bugzilla.kernel.org/>
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

--- Comment #8 from wse@tuxedocomputers.com ---
Created attachment 298579
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298579&action=3Dedit
dmsg of boot without tb dock connected (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
