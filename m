Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1EB6ABE49
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjCFLgU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjCFLf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:35:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF6D2916E
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:35:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 094D960DE7
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 11:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E892C433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678102544;
        bh=zo59L/JG3qMXkbZma+FqvJK4HPCFreYQg0aZ9JoLc6o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZfzQQ1PJ5gs+3Qs8qANnSwYZFPL07mCYjLryDBbEdsvs0CpYxuUYb9AmoEZ6qLgsz
         LORrTBTddYUyo6IPp6LQpZrApj4juC/Ce9rZfsrEfFiOKgsLLl1ACkCBkr/ATD5kTa
         2lWsumG8dQGiGNlwnZO9jhdRdjb0a7tAuY297uEaImIb8eKusFk4w+y+1Cy4K5LXNg
         yrNcbtgJi3MsmlLYM0dD4mOcBupPwn6TVoY7NFwquWX3N6a7NC/GZUxdl4EXBBIzQ7
         Dkhv8K/A2qfpVClRajV70lFYVSCjJgYLf1ZrGEHqvRdCwgA1BfArzWiUeEmQPRNItr
         2ML2tn1/DcTQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 51CF4C43142; Mon,  6 Mar 2023 11:35:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 11:35:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217122-208809-yzKgFZJZjf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #3 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Controller sent a transfer completion event for a transfer block (TRB) queu=
ed
at *c740 in the ring buffer, but driver is still waiting for a completion of
the previous transfer at *c730.

If git bisect doesn't point to a clear cause then xhci tracing and dynamic
debug could show what happened to that lost transfer.

steps for xhci trace and dynamic debug:

< disconnect all extra unrelated usb devices >
mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

Trace file grows quickly so try to copy it as soon as possible after trigge=
ring
the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
