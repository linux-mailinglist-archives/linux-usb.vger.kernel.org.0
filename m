Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A53F80B3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 04:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238262AbhHZCxV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 22:53:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237460AbhHZCxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 22:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 41498610CB
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 02:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629946354;
        bh=dlaajyHuNAyEGXINn7RqEv1qb9Wa72+CE/RU/5xqHzo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p4sv2fS9fj+vcblDsZITcHdfpR80TfuJGlSy0e50pdDnNSXiBfPXX3U/Qjqoayg7B
         P8XK42lSMRo35KgtoBIV8jiyxyoM03CqGWug17H7lOds5UCgDAv/sXJJgH4CrZnUja
         63Fig9XE5a0nXGQ3+WHmd2fW57XODSMSN8N7pDM+Pi+me2bybCue/dE7SODO9iySkp
         GLThpNMV7g2Iafaznp1LcU6axVI81tOVR7ajHRrVeBSjUhOjceqTzWxajUMNx25dsp
         bPJxke6NDt0cFL+47EYT2VL21I8mvkIxEHP6WHrzVKfaPWgHCSsVxuIsxxsYjUUKYC
         Jgk2/5dgrC9AA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 32C6161003; Thu, 26 Aug 2021 02:52:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 26 Aug 2021 02:52:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-i2FXfHfwdC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

--- Comment #14 from Alan Stern (stern@rowland.harvard.edu) ---
Johannes, can you attach the complete dmesg log?  If it's anything like Mar=
co's
log, the mass-storage device never worked (constant resets, at least once p=
er
second).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
