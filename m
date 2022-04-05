Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD224F2C84
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 13:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbiDEIkh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 04:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241069AbiDEIcq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 04:32:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B7415719
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 01:26:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 323D8B81BB1
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 08:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F19E1C385A5
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649147190;
        bh=MEDZLY/fhQesmJKyrSOBr3eOZyfAFvQC6vUrSYaDyWQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PR6P3ayGcCZqhN+uEsrfvZyHfTnSIHeDWg20DLk81flhZLUGFnrEGnV65B13qN2TG
         PUF8TuP/r+FrzyQYz9brdzV9Ai7DAdLao0dpsPzT2zpDTJtDsLDgQR91122MzwMSD+
         YxzMFTO3VEiXToMu8K3U0NpAbhLV9nAweC9ob/6zqLkmLL88o/gn+iC2IFBvhmN8Yu
         qmNSbWrx9uRggdx1GlwpzXEmmoxHaYuAHlVwhah9/9BgpsTStdbu7ye0LOAXwt1nR1
         03R4o+tQBwqY6o7R1H3JtOhSzzsk6768zvDG8eXBWBiOuYGSDysKDENHFHG/8pg8EF
         OSne+NC0JShJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CAE2BC05FD6; Tue,  5 Apr 2022 08:26:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Tue, 05 Apr 2022 08:26:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215799-208809-jIIguWYJkf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #2 from Oliver Neukum (oliver@neukum.org) ---
Working theory:

You are misinterpreting the system's reaction. The hibernation is not done
automatically by the kernel. Instead the kernel reports a charger as a batt=
ery.
That battery, being a charger, reports a charge of zero. User space monitors
this and does as it should if its only known power source is a battery at z=
ero
charge: it hibernates the system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
