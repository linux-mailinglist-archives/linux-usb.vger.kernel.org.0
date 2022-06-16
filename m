Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F054DF9A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 12:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376719AbiFPK73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 06:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376716AbiFPK72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 06:59:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B754EA37
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 03:59:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B071B82234
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 10:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF0A2C341C0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655377164;
        bh=4xnETlptaEfdfuh7a3r6wWewLuZdUQNIjV9S7sXnK4o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jp2o5NKcsrgsJ3CAHArzZGiGN/1DA7tyK0iIvXCRugasvdxjwnSd4SRQH0jSYCZRG
         U4aEx/pjbW2vl5Syt2JcO2cnUgFceH90I0V//j4kgE64a8WL+iJ3Lc0ZMB7iHioN1V
         t17vuBa6iSjp2FR7ox+N4jZQQQVds104ror1nTFG42DoDthhu2KKI/I1JVeCRFjTAc
         fF0oMWmx+APhjl7jNA9sOlsfUz80FVIA6FyMI4PFXTiK/64kdhLdq2jeQ04Uh9kxHi
         vT0CDo7mWiJ/8aKIbQRQEZ9hcAlX9JraoD6aU0LnU8S2Bv/XMTDbnLdDQi3eyOWvuX
         jNtHJX06ca5Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B875CC05FD6; Thu, 16 Jun 2022 10:59:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Thu, 16 Jun 2022 10:59:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-xAbjNmZeYa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #26 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Dimitar Kosev from comment #25)
> I believe this is not fixed yet. I have the same issue with 5.18.x on
> Gentoo, the difference is that the Realtek card reader is involved:

Not my area of expertise, but I guess the driver for the realtek card reader
likely has the same underlying issue like the input driver this bug was abo=
ut.
Unless Mathias speaks up here to provide further info (or maybe even comes
around with a fix) I suggest you report it separately (please drop a link to
the report afterwards here).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
