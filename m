Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DCB5BD908
	for <lists+linux-usb@lfdr.de>; Tue, 20 Sep 2022 03:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiITBEu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 21:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiITBEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 21:04:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A8862FA
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 18:04:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72FCDB81CE8
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 01:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C16AC4347C
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 01:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663635885;
        bh=3s1EdQG2QRQBxsFsv1GFSsxL5Wb22UK4oLNqrM7m02E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VBac6shY/eSFN3CI/RAg954TVrLBQxe5PglgIjZ33da7N2c2flrMSQuPghpKKeMss
         sjlQH+gb7i+/PcQo0hNs6bM1vbkBJDw6GkCwy1X+QndvP0eFskyqIoPS8RU8lxMfK4
         MpsqTPWVm8MzLKSaEIlDtB87wrahPLylCbIFAdzdAchlWITPzclujg+uoXwUYDevhY
         M1xgnFpFmtuVT5HOBxN/B+7fAPRMxbTcvBMOJXscEf3gs1yJAfIA4ILOyvDexLhaOF
         GS1X/GMO1lY4K9LntcEtre3+YQuX9nj5qaUIcP20NcN7ypZwkG2/KoEqOSw/adnjpS
         +GRqCMBD8MJOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 190B1C433E9; Tue, 20 Sep 2022 01:04:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Tue, 20 Sep 2022 01:04:44 +0000
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
Message-ID: <bug-216497-208809-5vgGUR1eaY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

--- Comment #7 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
I reverted the single commit stated by Jason above from stock Arch 5.19.9
kernel and it fixed the USB issue with my TB19 dock.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
