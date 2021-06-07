Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2061739D3A2
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 05:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhFGDt2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 23:49:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:40318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230241AbhFGDt1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 6 Jun 2021 23:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 46734611C0
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 03:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623037657;
        bh=H+7HSMzO3HWeUE/Bxeo0+o1GVaHQCSFnj8NepXXuQ80=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kfd4sYDoP0bflGfOmmTt5NuBN974B9lbm6f//DMuazRXcfhwJm2zkycVUntMoyS+b
         uXKL07YXHO7f1wf95nt7ZC0d1eoYc+4ZikTAGHuQL2wdtkcGFNk0BoV9kagLwQGPg+
         vP4jcbccpNpX3ioTmEUGmn78MijV3JfuQryzQkFE3WWu5SKjdQtQymCNrXn6woQUgf
         iy1p/jfWc2x+46gaFligRaM6PcLs8e71c7Lc6S4xSFutTxceIYCTus6QXNW9WtA4+h
         XYUJFsT2rhm8cLFmqbR80961QKthye6A3Br2zgZjyjeo2oDlGWr0uAdGuRy4jiD73q
         sSNHsuFSo+W/g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 335ED61179; Mon,  7 Jun 2021 03:47:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Mon, 07 Jun 2021 03:47:36 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-fyjaV1kMTE@https.bugzilla.kernel.org/>
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

--- Comment #20 from Lucas Endres (jaffa225man@gmail.com) ---
I sped through it this time with definite success:

The commit causing it was one I helped diagnose so that the UA-101's MIDI
device became available, but since I told Takashi Iwai about the issue and =
he
wanted me to check with you USB gurus, maybe we can help eachother in figur=
ing
out why the snd-ua101 module doesn't work with its "Hi-SPEED" switch set to
"off" (USB1 mode) only. The snd-usb-audio module apparently did work for US=
B1
mode, but caused the MIDI port to be unavailable.

And, yes, its parent commit tested good
(473d5ae82d73c3b21160b725af0e247fa94d7832), and this really was tested as b=
ad:

d763145312582c08c4e9ed99d61276cde8488256 is the first bad commit
commit d763145312582c08c4e9ed99d61276cde8488256
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Apr 8 09:56:56 2021 +0200

    ALSA: usb-audio: Skip probe of UA-101 devices

    UA-101 device and co are supported by another driver, snd-ua101, but
    the USB audio class driver (snd-usb-audio) catches all and this
    resulted in the lack of functionality like missing MIDI devices.

    This patch introduces a sort of deny-listing for those devices to just
    return -ENODEV at probe in snd-usb-audio driver, so that it falls back
    to the probe by snd-ua101.

    BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D212477
    Link: https://lore.kernel.org/r/20210408075656.30184-1-tiwai@suse.de
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

 sound/usb/card.c         |  2 ++
 sound/usb/quirks-table.h | 21 +++++++++++++++++++++
 sound/usb/usbaudio.h     |  1 +
 3 files changed, 24 insertions(+)


I think it will, but can only hope that this time, it will lead to the
solution.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
