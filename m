Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD22542746
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 09:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiFHGz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 02:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbiFHGDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 02:03:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6DA26A084
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 21:54:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8B6861964
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 04:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21EABC341C8
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 04:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654663973;
        bh=LEf5r0E8fR14DbE6FGMLMJl0DZiiOv9T8QIfFxl/hQg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DChKVtlLSmtuMnYqZYsVauUgVM12JVC3pKyJlykpRKe0onoHT4Ho7cq7iBdwbD+wn
         7EeCTV75OL3oZOY5MLDyqODpGQ/9vf116ZrcfQaHct/rHggkW0yyjhPmphhDH6btKk
         uOgGBwRDpdDqlUtOsPNpQXjjko1nkeyURtcYAQEtm1i9T4in9Xqv3TIpLRfUTr0h4f
         qim9pSvDfgXOYSqspY+Eh+Hlujo2RpqFzZURUfq+FJFRXS3iYE/mZRJVJSMinlexiN
         gMloPWMkUQSX8npvoEOIrfH1HvseZGwPDRJGBEEgZb3zNs3UaJlcFHk2LFa7iUdLtC
         gAaiZn4vOhFjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 10D74C05FD5; Wed,  8 Jun 2022 04:52:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 08 Jun 2022 04:52:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bastian@rieck.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-xDitVSLPzH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #14 from Bastian Rieck (bastian@rieck.me) ---
Does not appear with Arch Linux 5.18.1-arch1-1 any more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
