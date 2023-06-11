Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1871B72B091
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jun 2023 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjFKHLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jun 2023 03:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFKHLq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Jun 2023 03:11:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E5C19BB
        for <linux-usb@vger.kernel.org>; Sun, 11 Jun 2023 00:11:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 17A0160B76
        for <linux-usb@vger.kernel.org>; Sun, 11 Jun 2023 07:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68217C4339B
        for <linux-usb@vger.kernel.org>; Sun, 11 Jun 2023 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686467504;
        bh=Z5FeSTSbnv2FjDHSutqJWYXN2Gn8zOqHj8cLikyT+tU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dgdCRFQmRf0sYudxpzdUz0YQeEcAAs3I8KNnWWCjV42oRa8VGTm7vPhdiPIP33eyr
         ZGUJyyAh/LE3lhtiTJmeNI3cx7hYtDGmMxKVIzBbys9mSNBWP47AoL2URT+GeLBfjb
         Rh4I3l7Vg55W8RMMbRfYoq3o4EA1E2yy9wQVulRkBEaPsUHbRDST79LtsizyFE7dZA
         Fqxq0wSF09lIKVVB0PZSTqCIPKZ9rrsZO2mAjIuT5IqOJkbIHleLylGTVHmiH9YFUA
         2/1opiG0RaZOqrFf8sbwlGpjOIXBA/KOQqJDXwLz7EETk64tjj5GB3UXckrIspEbRb
         k95Ap1bmYuFMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42E47C43143; Sun, 11 Jun 2023 07:11:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Sun, 11 Jun 2023 07:11:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217399-208809-ESvEIcSqjM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

Bernd Buschinski (b.buschinski@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Bernd Buschinski (b.buschinski@gmail.com) ---
Hello, I tested with 6.3.7 (which contains the fix
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.3.7&id=3D7e1ca7f01d872293ab1594c726922ff459830903)
and can confirm that it works fine, thanks! :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
