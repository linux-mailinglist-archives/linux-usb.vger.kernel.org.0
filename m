Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D08E3D4E39
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 17:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhGYOd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 10:33:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:51016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231208AbhGYOd5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 10:33:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 17E5C60F41
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627226068;
        bh=NqTUgb5l6RZxld7Fg2/jLg+tmmr/pz0ZCIDajBTTvQg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gES6mzRK+utNVrMLJb6DbqlxWNbSE5M/XQ3ykgpSeCq4po6hz6GDjnxEy9A2nvtOD
         ri/07vDryavun5qQc+G0rAITyKJLJJ9u3DGUGGtZVNSaLSh1EJaX/BwG2MV2Ac15kG
         VT1hTqprl72c/4BcKrmeThEYeeyxq76Wcj1QQNnHEIUZ58Hpw9isN58dHAqu+fLrEL
         BZgJWQiBsQxseq6pUoT0XWglZ5CW3SohTjsZPuAcDL34mJadIGLDizNoGBVg1Es9Fh
         fXcz4ZKR8eilZLT7MeVfxWqHLYQ9EaUcLM6K3jwkXSTqRWOyzO5YM2VRzxZCaM7JcC
         5Rl1iFVq/8Bwg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1482860E9A; Sun, 25 Jul 2021 15:14:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 15:14:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-RBZje1SC6P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #21 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
Hi Yunhao,

For uac2

#define UAC2_DEF_REQ_NUM 2

set to i.e. 16

Thanks,
Minas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
