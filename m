Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EF849C9B8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbiAZMcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:32:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52738 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241329AbiAZMcE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:32:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1464B81B99
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90CC6C340E3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643200322;
        bh=cLvuDbxja3RZBTZcmb5KVhAsg74K0yetHVbytfw5M8A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=u3uXk3jW8D8YLS1N0ar3e5UcjA8CW2c+xDOCcNLflfQrYUQ8fs4aVc4I9V8pZqsYb
         gyxtZehUnvEu4yo0LolnV++cPwBDTFScHWLbDFFSlA4YiX22Cbdc2erIW71ZypHV55
         5BVPc1IuJhzvVr9sI2JxOl7bLpQXFmM7ewGds0+ftd6tR2G+yQ6X0qcBQ39MsYn3kO
         u8+vto+k4f0XYAq+0/ANIZbwoXrjG7k0AafilJBXdL2vICefvUTYUhtNXoUnczmU0c
         yciURgvpDXxKi1tzgNefpchx25lHTopjr8POX2MjOMj+krf5g1DYKLdFdoFhyzae07
         ukVsdmyJJ8Hqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 74F2BCC13AE; Wed, 26 Jan 2022 12:32:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Wed, 26 Jan 2022 12:32:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-kxBgKhuoRY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #7 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sun, Jan 16, 2022 at 04:23:55AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>=20
> --- Comment #6 from Ross Maynard (bids.7405@bigpond.com) ---
> Hi Greg,
>=20
> I found the patch:
>=20
> Bisecting: 0 revisions left to test after this (roughly 0 steps)
> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad=20
> module alias from zaurus.

Great, can you send this information to the linux-usb mailing list so we
know what id to add to the driver?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
