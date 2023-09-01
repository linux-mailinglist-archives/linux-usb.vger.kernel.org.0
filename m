Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF7B78FAAE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344681AbjIAJW4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 05:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbjIAJWz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 05:22:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBAB1739
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 02:22:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82B4260C78
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 09:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5F2FC433C9
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693560139;
        bh=3Cs6nD0yLZPeCtrq+uaj4vzI/GDoKJNbEcbDBHuumpw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cQenG0Acp9cOOFoEEqnwdUcfBoCPsDQ+eGyMGcKtaAH4WgeMPT2eAZ05+ANK0tklJ
         8xaiCJtUkrUkN1Y1Yg8PyeZoTt/nYyMdgaf76CObWL8cDOgYRbFAkrfmlmipvFhaod
         vyVwkyBY9UpJh2zP3K+wholuooVlkM7J03590LmRQF/nwVlwT2vZZr5C6gTPahd/Ns
         D3QmLfUz0U3wRjqY1nWZFE19votGOz6ZXiHwqkAmWxe7cRdSuiP+ITlDCxNh0z7DZ0
         k0GNLtI3ocGv03SZw/xzt4wOdwdrl2HYVa93cZfQLXWFDGRZQJeg00MUlDfSQx8MZF
         yNOd0v5sWfJOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C917AC4332E; Fri,  1 Sep 2023 09:22:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 09:22:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-C8BpEenB9J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #13 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Tomasz, can you do what Greg asked for? It seems the commits you listed in
comment 6 do not apply cleanly any more (I just checked), so you are in the
best position to help here, as something might have changed since your comm=
ent
6 and 8.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
