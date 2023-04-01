Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E296D33E4
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 22:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjDAUtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 16:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDAUtV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 16:49:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809D327003
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 13:49:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 002A660FA5
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 545FCC433D2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680382157;
        bh=eTpZFplWPPgLE7nsJv/6vSi9vjurTcxO7iO53dcfTao=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VTc0ilvwWLd5RJR3E4J+gj/iHySrHET1/27jooA1BvJIR1pDpScMDpR7/EAuOL7HS
         kRycHdnxpePPF27TWhxzwJGFDeTTil5aThG+FdmN5/syxaIwBYUgjR1h1+8i3C9JFb
         bZ7VlFBCj5vpuLqVFJbsnP7n4viTI0MG/8MErSiysVNcWxMmIq0KnAEKvzJwUUsN2q
         4Cfo+3VO6kY/N0ARf9BT3k/bVOoJqAqja/VeKrVJcwx8MZwOSBaqTkayC/CRoer8go
         vlK3RR14WhsnNmFYw3OSIvoZ+KqguX5Fqr6n+p18S+E8ppk6wLZp/bKVocoNG7AEhp
         RUZm5QIi+15ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3A08BC43141; Sat,  1 Apr 2023 20:49:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 20:49:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217242-208809-PJcHBlZnjB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

Austin Domino (austin.domino@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |austin.domino@hotmail.com

--- Comment #1 from Austin Domino (austin.domino@hotmail.com) ---
The same problem has been seen on Intel NUC7i5BNK, ASRock NUC BOX-1260P,
LattePanda Delta 3 and other compact computers of the sort, and if enough
individual processes are doing USB serial communications (ttyUSB/ttyACM) at
once and it matches or exceeds the number of CPU cores, the entire CPU can =
get
locked up until the watchdog frees things up.  Most lock ups of this sort a=
re
resolved after ~20-25 seconds, but some have lasted over 20 minutes!  There=
's
several options to get around this problem. One of which is to set the CPU
affinity so at least 1 core won't ever be used for USB serial communication=
s.=20
Another one is to use a semaphore to add a similar limitation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
