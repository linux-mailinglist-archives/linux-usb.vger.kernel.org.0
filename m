Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E4D4B5095
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353618AbiBNMrh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 07:47:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiBNMrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 07:47:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BCE63A5
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 04:47:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F1DEB80E8F
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 12:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A218DC340F1
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644842845;
        bh=ipgLosYF/sxb7lv2cEpO8bNnxgM4CGK4cuRqpdujKUw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AZMF/amHDFes76BZOao0M0irbu2Gi/5ucBea3zb94OV770bZhPyOQOT96zkLRjbF6
         HJFvG4f8S2qJ+vYtqEMpz0QdLWnjwltUPqCHLptg+yF6gRqtF3PLc5U8JS7KMniPiZ
         Gs68o8A/gXJA0b1mqWpi0tlY+8iZ4/bmr7+h0vwpMJQO7d6QQ5DUVi8UtBKW4MbLmf
         mnnFfafQF6w+/j4MlhVUfitqZA/Q0EBAHzGTG2Cc8rGDLLydL2kvP7JwZTqcWAgZkH
         uCb0rKGuiaYgfaDEs5mLZCPKECG+qj0xch69rPWHSZO1pq/nSYvcmdLfd43F/0m6uW
         t6OeC05WIhKgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8AB0AC05FD4; Mon, 14 Feb 2022 12:47:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 12:47:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-fQdj6iCxLK@https.bugzilla.kernel.org/>
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

--- Comment #14 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
@Takashi, I have been running the Arch LTS kernel (currently 5.15.22) which
works. I just installed the regular kernel (currently 5.16.9) to confirm it
still has this bug. Then I applied your patch to 5.16.9 sources to also con=
firm
that the bug goes away. Thanks very much for your prompt work on this fix.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
