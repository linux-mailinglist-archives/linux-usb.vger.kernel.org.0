Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABF8D790494
	for <lists+linux-usb@lfdr.de>; Sat,  2 Sep 2023 03:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351463AbjIBBF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 21:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240134AbjIBBF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 21:05:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A36FE
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 18:05:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97099619E0
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 01:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEEF7C433C8
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693616754;
        bh=gswmAxkRw4FcXd/cOqXOv4vFkg+j4TQDYKvQgtht7t0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PuDMjVKCNTLsTVR5E9Kr1lZ3KtvitOyefOIdO7E4BJdn96+IxWLvz6ZTIZ65Rd5WI
         VgkQBTHO81jN8+NIvtwGxeGA9sgZUF/rCFG55H8fTfojfLSLIX3ErgDmVqFyM5LdOW
         ulvR08GTNdX66tAB1Yuy0lTHheub235o01JxGsZAWJ/vZZddR590tBj7p3GYEl1kHp
         uqdH7v46n9n8OXa2U18w4wLHTz6BFHriUsJ0yXXgnz+WUrKPngq37NWjsCkNkptNxs
         B+v0OR6bbZRDKiF3g4hnKC+ymRyVsMOqCrN6VCsHIWCnkWcOhW0gzj4aalzNv06Gwf
         QvIrHV7Sk0DoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DB9F5C4332E; Sat,  2 Sep 2023 01:05:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sat, 02 Sep 2023 01:05:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-jalRsuHavD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #1 from pawlick3r@proton.me ---
Created attachment 305022
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305022&action=3Dedit
dmesg error from the card reader

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
