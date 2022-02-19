Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C564BCB08
	for <lists+linux-usb@lfdr.de>; Sat, 19 Feb 2022 23:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiBSWoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Feb 2022 17:44:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiBSWoT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Feb 2022 17:44:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D223AA62
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 14:44:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9BA260EEC
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 22:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E3DEC340F1
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 22:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645310639;
        bh=VaPzEYnJQksgWWI490jKw1P2D4zk/FvcaFCwbZWL+J8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Gn+2LHKSucCCs2UMKG5+0wSkaRggSlzriNs+kYGL/aMCULDYlCPKmkmEHdJLbRXsP
         JUs2ASogQegY83BfpIDIs93zPJ6nY/RWrbFT7/sO5x8lLLw4Zl5pCz95vcuKirC+/W
         RjJEcbXgUPQ+pKBVn1dd1lhWjKrPPb/gyt5J3hzMS4VLE020VREOzzZ0ub8iwvGrhU
         H69sUL1odmtHFO6wJuYbI/z0802dfCR/Sfv0bE+VA7ZoWDHCsDszzR7W9dNmHIj4ht
         tztNHfnGCMOKVqXAuyvNt6z9KNbuAMTT6P0JVMBqWgMVHaFfoxVLpr/6ZKlDlYY5Os
         wPgvom36ZYMgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 180A1C05FD2; Sat, 19 Feb 2022 22:43:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Sat, 19 Feb 2022 22:43:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steph@combo.cc
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215561-208809-Ovmg60AOrQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

Stephane Travostino (steph@combo.cc) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |steph@combo.cc

--- Comment #16 from Stephane Travostino (steph@combo.cc) ---
*** Bug 215606 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
