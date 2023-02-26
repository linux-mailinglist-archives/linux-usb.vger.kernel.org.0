Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23ABE6A34B9
	for <lists+linux-usb@lfdr.de>; Sun, 26 Feb 2023 23:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjBZWd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 17:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjBZWd5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 17:33:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75381B77D
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 14:33:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2CAEDB80BE8
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 22:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBB07C433D2
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677450833;
        bh=928Wfm90vcjvGIZIWvRhZ59H8a5Myq4CrBC3iEJE9+c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lhIlpvL5eGdJ65GXJUyD7LnOxKrNfsbldPv7iD3fXfOH0cQe7Fy7oRwAjtSTwZxGx
         Qxn/gAPcx0UQI+a7fzRqxkwvn9G6jHlv/E6FqgB+altQyya5fvSb2q7sgWnP/IT/b9
         07nlfwrjetW/D1vUTD3zNsbGA0ebY3m3izN0/CeKMVyepohEJUzxe9wZu3iVrbzxCF
         cvOMkB50IKkYUowTxXmfH1q1YagoNoNExZ85U07RAMmX+ObTgvMmSVgrgc/i/+lZUr
         0WnNm0GGFloqieHEOVIyupGOKE0oatJGLDdLkOdKcioAf/yKmUeGrvbqI8wXHbZ5g3
         vyP9Yb2RaMSPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A3C29C43141; Sun, 26 Feb 2023 22:33:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Sun, 26 Feb 2023 22:33:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-PRMx4FWdhN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Pasting the lsusb output into the bug report ruined the formatting, making =
the
text very difficult to read.  That's why I suggested you attach the output
instead of pasting it.

Anyway, can you try booting the earlier kernel and getting the same data?  =
I'd
like to see if the kernel version makes any difference.  If it did, that wo=
uld
be pretty surprising.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
