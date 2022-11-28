Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D5B63A8C6
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 13:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiK1Mye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 07:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiK1My3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 07:54:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B731706E
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 04:54:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D033A6112D
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 12:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F8D7C433C1
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669640063;
        bh=LkFdUu4i8pMYgvpPNUVeudfR5HQzexDmN8kHA1ObI8M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dfFd77ni6SZqkfWukB30QIFDzFx1xznW+FkhPaTneCtyTkjEqTlb4w2eY7czPBvX5
         V4EH+s+kAb6po9obyifZrETHlmwr8mRBn0IqdXhWBCiowV1BZ2Fo006XBcsG2uWk8c
         zAkPfzpaMqVRykibnIegL4y1ZRKvtuXrN93I5PvThtzypWIzlnAVngRUT2MSDw5Rof
         DLJz61nLvn4nEfHDE2MN4j9Ogwb0c2yuL97sL5YvbGut789wE9q5dNPpifywVKzLuI
         vyigfdShqd+jWZvjL8RHWBYmblytpxspOM3V+RmI7m7SrSToCk3kjUIBT7P61NuYi9
         +Z3/TaWxeCzBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 01441C433E4; Mon, 28 Nov 2022 12:54:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 28 Nov 2022 12:54:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-VgMXZ8e4Wi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #10 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Can you enable CONFIG_PCI_DEBUG=3Dy and attach full dmesg (v6.1 kernel pref=
erably
but v6.0 is fine too)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
