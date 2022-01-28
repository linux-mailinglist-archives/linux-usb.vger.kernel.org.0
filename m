Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3894A04A7
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jan 2022 00:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344717AbiA1XxL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jan 2022 18:53:11 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:47784 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344659AbiA1XwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jan 2022 18:52:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 50AC2CE27E0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jan 2022 23:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A100C340E7
        for <linux-usb@vger.kernel.org>; Fri, 28 Jan 2022 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643413940;
        bh=CxXoqBR3MMplYQKyoSSaPFLCXRwewZroyaTsXXlI10c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OjinJmAS+/1iofxyDvioPhpJN26jgwCeavw7IIuBoSdukW0i54Xfc5BpTHMfF40TT
         trI14KfncZnREr/UlZHpTrGV23f5G2h1r0trPy9KBC2ATm6BgcyQrumAWJcq6DBtYs
         1lSgnVx+TdhPww68iXwQGTwlSukBNjMT/Y+gBc41u4r8dX8NnziBOK2SDWnDJ5IRpu
         ZIwgQngJ8TqNLn8PHUwtjDKQf7kIsElgKIgo8lYOQv1qsogE6eUaOgZ41EJo9k15E8
         Q81YQ/XGuqhTRrxaHAXSKwwKhRqwf+iwSrWnlTKM/yU6NPIFo2GVftp1jgSBkt0+G0
         zi5gKRsxWa7Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7BE5BC05FD0; Fri, 28 Jan 2022 23:52:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Fri, 28 Jan 2022 23:52:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-nsWF7IAxAK@https.bugzilla.kernel.org/>
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

--- Comment #12 from Ross Maynard (bids.7405@bigpond.com) ---
Hi Oliver,

I applied the patch, and was able to ping and ssh into my SL-6000.

Thanks!

On 28/1/22 2:50 am, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>
> --- Comment #11 from Oliver Neukum (oliver@neukum.org) ---
> Created attachment 300340
>    --> https://bugzilla.kernel.org/attachment.cgi?id=3D300340&action=3Ded=
it
> another special case
>
> Please try this patch
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
