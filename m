Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D847779335B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 03:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbjIFBZk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 21:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235732AbjIFBZh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 21:25:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26558185
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 18:25:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE31DC433C7
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 01:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693963533;
        bh=BNbfgidfRYS8hQqksOSJgnA8B06LoiJ1lgs0gQScHzg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dFaQOXDwsykJ+2s0hkOrQwtAEovovMC4pnvqQ91DqWrufrnS3VQc3n+fTr5te8RVU
         LHHRNQ3t+NEKtmCR02MjIRYjQzuUEcm8XVbZfhIAKA5pU8D5rCj0HCccfXBX/9UTue
         srwNb6KUp6pDzJeLdIOAgxmDhTOQcn2tTysH1T5H8thlo6fF30Vg1ez9lldX4WYnmQ
         0kh2/49nhApS8PblVdvl2jT/VBevLRuQQOHbYwGy9GwU5Qb3rbC+WESMKxS5w1wPhw
         Sg9CIS4KQ/9TXfDoLZEB/VGBhw0WCRsX3zWhT6i6mqa/9ieFKikFoKZYTLV6QU5iGB
         gQZWKV8AxpNdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5B66C4332E; Wed,  6 Sep 2023 01:25:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Wed, 06 Sep 2023 01:25:33 +0000
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
Message-ID: <bug-217862-208809-XyY4KTzG8Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #12 from pawlick3r@proton.me ---
Created attachment 305052
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305052&action=3Dedit
Wireshark dump from Windows 7

I tested the same card and reader on a laptop with Windows 7 32-bit and used
Wireshark to record the USB output of the reader from the second it's plugg=
ed
in with the door shut and card inserted, and also performed several functio=
ns
including opening a text file, opening and closing the door to disconnect a=
nd
connect the card, and reading the directory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
