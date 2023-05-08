Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A0C6FAEBA
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 13:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236209AbjEHLrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 07:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbjEHLqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 07:46:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F6A10A03
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 04:46:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4687C63591
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 11:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF154C433EF
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683546410;
        bh=TUn5iw3rv0yQCzvtTnX44lZbNvd8p6QcTPBDyw7VCog=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gZOVExo2pTCPuBn7UQgTq3Qh9bC+SaR8cn3069AGMyBY+5MdqblsDyNxx8kqVuFqc
         5ML3BcAkdy+IYXT5uZjDntdWcxt1rHO41VhxG0IZq9ak7xIzlse9O5Qr0NstVQnVRK
         +N3ihWuwVfVbgK71xLQPkxb1w2/c4ZHGBc+h0D7XA6BRNZE/gS0NtjhWD2dxRYLpti
         C0snIiuukxH/Ov8ewim4exZRRjS7yReF3ZCDp+rRi8hOd+t5OTSnd+HiBKLJHc4AH1
         ArkpDAibu6VNSojNK1ddquvMJRmKfIXuXOTd0GiuQDMcXX/NKJY2w5i6TIoQc7In29
         iy5g1axemVAFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8E348C43143; Mon,  8 May 2023 11:46:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Mon, 08 May 2023 11:46:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217242-208809-hnZlvr9WNG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

Hunter M (miller.hunterc@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #36 from Hunter M (miller.hunterc@gmail.com) ---
Yes go ahead. Marking this issue as resolved.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
