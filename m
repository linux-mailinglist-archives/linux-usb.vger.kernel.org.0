Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452CE5BE1E9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Sep 2022 11:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiITJ3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Sep 2022 05:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiITJ3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Sep 2022 05:29:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BF36CD03
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 02:29:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B28146275C
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 09:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28545C433B5
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663666152;
        bh=uy0MiiRe6JUZm6uP0/B6MwYs4dT2tmECguLBbBB+4wQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hkBDuPWns4iW18irbIJJASPpAQjjYpYrS2Ut6h8VMx9mTzS4eFCMd6BzxtEFd1N9C
         OkgZ47bhGg2PB4KwiQ9NNOhR7KXyUN4y8mQQKqt7bOvdjGk6h4H5DVLz7aRSNx0vVe
         Hp6owvniumb/2kl3fQidZIJ9E90hpFx7K1m7SplNcU0HXm0aZhVpSlrjY9nE97su1b
         /fOyQGkIPH0gJWI3av2k23q7+a5P/kwXP66pxmegJ6A09RN4gE7o6UC/NXRsFeWPnK
         DxpqQAEwFrkk/w0juof304QRoosuSynbFf6u+8Iiyr6Uwzobn7INPNxsvCGz+WGy+e
         80NqpfEQ5V2gA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1247CC05F8D; Tue, 20 Sep 2022 09:29:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Tue, 20 Sep 2022 09:29:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-WyelimXuH4@https.bugzilla.kernel.org/>
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

--- Comment #9 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Hi all,

Baolu posted a revert for that commit here:

https://lore.kernel.org/linux-iommu/20220920081701.3453504-1-baolu.lu@linux=
.intel.com/

It is expected to land on stable trees soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
