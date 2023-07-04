Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 774EA746D57
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 11:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjGDJ3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 05:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjGDJ3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 05:29:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644D69D
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 02:29:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6713611AB
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 09:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4302FC433C7
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688462939;
        bh=XPajGxaUBhS27WXkweOvRpaq8rRDLpUH1UBYw/VshHI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TAnKr0FCPzr5vU2tOqETImAkRxtkqgXzt+dZrhtyUVdQjAixqxSJyGdJBvaoFExfv
         t/K3Xu1mT/JRVY/KXCX/VQ7m9Fub4FqGAJV48JjW3wIyVwSf8qkKynAyGADXkWnVvY
         Xb245IFpyMU4NjuaISOfOj1IY+KbvpHUU5DiIveV88xXOrkyAEmQRdP7JuIOaokgTu
         U9yi7jUSWMOE25E9KCuNMsdfemcmv0jeruFIBFbZQ35C7kXxAXG6sKXsu6jK1OOd1i
         PUi/PEjQ1wv4VJvap2leUe7MbQGtZwiRpzRP+6e61LD8MXtwV4Xc+0jHFGJh/3eml2
         3KVtOBZNhQa+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2732DC4332E; Tue,  4 Jul 2023 09:28:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Tue, 04 Jul 2023 09:28:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217632-208809-vXwP3yXgSf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Ross Maynard from comment #0)
> Created attachment 304541 [details]
> dmesg and lsusb output
>=20
> The following patch broke support of 3 more Zaurus models: SL-5600, A300 =
and
> C700
>=20
> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad modu=
le
> alias from zaurus
>=20
> dmesg and lsusb output attached.

What problem do you have on your Zaurus devices?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
