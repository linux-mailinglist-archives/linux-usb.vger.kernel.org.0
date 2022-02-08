Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798FD4ADA4B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 14:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358827AbiBHNmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 08:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbiBHNmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 08:42:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DA5C03FECE
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 05:42:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3886B81A77
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 13:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6E02C340E9
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644327771;
        bh=xcx+CmgUPhghmjvK04wKAtK+a+AmjA6Rg/5hC47cV+s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a0LYQTlgjwR+D6ObXXmSbc/EXwHG6+OOuBQoaEGuVXpkZhBLwiKMxLIj2M0kCMn3J
         v7ZYiajMGPN6KXrvZcVCYjmDgM3zGwGtV1AuA6KEvRfCqUukOmezidLmfhmEyoo9M6
         PtiYttembEh/bRzmFA+N6CCKRgi7en/5K1R5BxEK22l8Sg0m+6HAhkeV/LjqW2Bqj+
         29/wfVkxl0pI7T3e/qxYq+NgSrDbQ7AhvYxBHYjzke7YsQdnmUL//hTwf6AUUn/J/D
         85EdMqbRTwWRkYVRiIP9mAYMAOzXj5R9CtMcIUDHUAZUUdpMPAqX44elGRtHck2nOz
         exx5KBrVKv+Ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8FCBCCAC6E2; Tue,  8 Feb 2022 13:42:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Tue, 08 Feb 2022 13:42:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215561-208809-qvNMETMQma@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tiwai@suse.de

--- Comment #3 from Takashi Iwai (tiwai@suse.de) ---
Could you perform git-bisect and identify the culprit commit?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
