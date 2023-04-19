Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C5B6E8157
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 20:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjDSSmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 14:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjDSSmB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 14:42:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A391A0
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 11:42:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A352760C5D
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 18:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CD39C4339B
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681929720;
        bh=BuIasEsNawAN8W0K32VHuBkNXqxOZZoNlvv5rI+JsUQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TW1IsGsbJ/sfoACuVVj0K1qv9BVZ085MQd7NtZDViKd25wrFVTm95Bxy2WC9B/kt8
         9hzvQIF1mBb/MnnYxsFOKp+tqTm2XefbHl7Xp+xRxPX9fgsYsgV/A1HxwyRcy7feBP
         L+1Z0Vz+bUStrtAgbD+9w3J+0ZKHiUGHJtixqd/2g/H7VIx35uZK99xhJWmG/bxz5/
         KqPTEetibmCVj9+HZ9PP+ib+ILrFdyMY331WT6FxpaFXdgonIe8XzNFERNHhxVX0nM
         15knfQSTKmls8sqk6l82hj98sLfw06P6iJ7Jp4Mzi9MgRio3jZnYt77dUKDClKZjQK
         dqqDU5+MzhQmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0DECC43141; Wed, 19 Apr 2023 18:41:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 19 Apr 2023 18:41:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-gdDLkEkjPh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #26 from Austin Domino (austin.domino@hotmail.com) ---
I can probably do so, but I'm sure Hunter will be on this eventually too.

Also, I saw that you mentioned something about commit 55f6153d8cc8, so I
reverted that commit, rebuilt the kernel, and tested, but I forgot to apply=
 the
previous debug patch.  The TRBs problem doesn't appear to be present anymore
and I haven't run into any hard lockups within the ~24 hour period that it =
has
been running for so far.  Although, I'd like to run things with that kernel
build for a while longer before saying anything definitive, and I think that
some of the changes themselves within that commit are justifiable (but what=
 can
I really say; I'm way too new at this), so changes likened unto those in th=
is
newest patch appear to be a better solution to me.  I'll just build the most
recent kernel release with this patch for another device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
