Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE2D50D054
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 09:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238601AbiDXHzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Apr 2022 03:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbiDXHzt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Apr 2022 03:55:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDDD50E3F
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 00:52:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C574B80CC5
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 07:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C6F9C385B0
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 07:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650786767;
        bh=+zEJaTeM2S6pgTlhgJSlywYEAmXLTe2oNTWcBJSegJw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ugzrhU/OiUmoghW0qPON4BV7ewZel9bo3+HkrvMQfmRg4J7cs/cePqYogKmhXNciE
         i8bIlJ4iukhy5diA46GhzLAeFB5Rnlt6jgYI0vcev0kTDRfgMH9DmdOZnVeY7TZekr
         nEQrj3yXh4h4G/4oyE+SadfVpwDPSjkI7wB0oRds7I9knTZ8bnqhZlFoytgSE1iw4c
         YdcVpUjVD5G1RQ7JiMXTrtUzsg2+DJVBa5npKwlhOHOUsZozHyrWYE0aeYSHRWT7qO
         /0pQcArhz/qBuPVgbA+pVsblac5I+EVNMuQIAQA42MR0v9N3PnB2NjZmDLqgAG21uh
         PVPAF+0ASLofQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E8AA5C05FD6; Sun, 24 Apr 2022 07:52:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Sun, 24 Apr 2022 07:52:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xy521521@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-Ls8fGJSCKH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #23 from Hongyu Xie (xy521521@gmail.com) ---
(In reply to Mathias Nyman from comment #21)
> Created attachment 300724 [details]
> PAtch 0002 xhci: set hcd flag to defer primary roothub registration

Reapplied on linux-next? Haven't seen this on linux-next.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
