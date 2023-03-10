Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72046B5217
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 21:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjCJUoA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 15:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjCJUn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 15:43:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE4AA7A81
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 12:43:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C30661D45
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 20:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E285FC4339B
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678481035;
        bh=kToA5dpmRhmjKCTnGeYtCDOcJ6oB0/IIr4LgrE8GgVI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YswvgKy0OO1uuuBnyYv/ip65eqL/wFcnGsfNYjER9chGX7EkjJEsua1KlGw71sA52
         10RzLWAIKEv3dDpGw/Ub3sLwkuAs0jIu+djbrbW0vAbyQsK2cbQ9XZ6GIMTu1iX7PO
         eKTBwuSpjlqtJsIKI1NfwMOMRZlj+oTOfdE8GpseXlDkg174B5NUAPXM7ttjoIzfmb
         gStMjwM+wdrPqVmqC2aIZAfjilEHO7rvx2OEVVigxqzjPVHgH+vs1shtd+nxvBdfAF
         +8UDl9mKjsi0FSiLKa1+w1ros+5J0EGSXO+vm7h9oDW8Z2oa+fYFnsUQvGrj3sE+rx
         dUyXjBym4YNwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BB3EBC43142; Fri, 10 Mar 2023 20:43:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217174] Plugging in usb external drive, mount and umount causes
 kernel Oops
Date:   Fri, 10 Mar 2023 20:43:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: Block Layer
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mike.cloaked@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217174-208809-V6HepaUQyW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217174-208809@https.bugzilla.kernel.org/>
References: <bug-217174-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,TRACKER_ID autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217174

--- Comment #3 from Mike Cloaked (mike.cloaked@gmail.com) ---
I just tested 6.2.3 built reverting commit

bfe46d2efe46c5c952f982e2ca94fe2ec5e58e2a=20

and the kernel Oops no longer occurs for me - so that resolves the issue I
reported.

I have also tested a second build with two commits reverted as below, and t=
his
also
gives no Oops following usb umount.

So reverting both

bfe46d2efe46c5c952f982e2ca94fe2ec5e58e2a
57a425badc05c2e87e9f25713e5c3c0298e4202c

Has resolved the issue for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
