Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DBD3F7AE0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 18:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhHYQr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 12:47:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230363AbhHYQr2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 12:47:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A39B60FC1
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629910002;
        bh=aaVYq6Wwcra8oMLeJuVZUxY9vEn9fay1383DbOp7NfE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kUNZ805vxByR0CyCurTypv3+nya5YzGkk+1OLx92JmpPBA2SkG8MN5mKn2jP3Iltw
         9JvpQYOi4GClr6x8tDjinBqn1JoNd0iYaHop7bnl3LCcPhICx6lUsALkkRKm72RvWX
         W/VWhH67a5J9vCNrLhQeCgjZqkoLAowyM41tZtvFpYkAdPxyBXzl2KFCR+RWCWd5UY
         lAKE+qe4YM18toWQM2erYAQ9KSqp5G56vnO1wSedErAEVfQdATEKi0XA83tiVAmbNQ
         SYcW7/9ck76SaYLN5RIGlcG+jgJJvRn2+++oArZ0sv+iiEOYf6wQyZgGmBysfTj2r/
         ELdv4F1fcAzTQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6134A61003; Wed, 25 Aug 2021 16:46:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Wed, 25 Aug 2021 16:46:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan.ruehl@h-da.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-Ge6pGJ3XLO@https.bugzilla.kernel.org/>
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

--- Comment #13 from Stefan T. Ruehl (stefan.ruehl@h-da.de) ---
Vielen Dank f=C3=BCr Ihre Nachricht. Bis voraussichtlich 31.08.2021 bin ich=
 nicht zu
erreichen. Ihre Nachrichten werden in dieser Zeit nicht bearbeitet.

Bei Fragen zur Infrastruktur oder den IT-Diensten des FB Informatik wenden =
Sie
sich bitte an Sergio Vergata ( sergio.vergata@h-da.de ).

Freundliche Gr=C3=BC=C3=9Fe
S. Ruehl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
