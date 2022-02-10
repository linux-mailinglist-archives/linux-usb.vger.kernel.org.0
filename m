Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1978B4B02A6
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 03:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbiBJB7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 20:59:37 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbiBJB7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 20:59:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC176270C3
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 17:33:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5987C618DB
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 01:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4955C340EF
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 01:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644456819;
        bh=d1OmR7DU95cKLJJ9fgMsNSj1l4hcEU9KN5HQYenZ4io=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XYoeM+lsZ2AuGgDfslllUQWYKZSKiqy6g9XvqjsS/Oc4r89UB+2ckLjop2nXUI7Yp
         MZoApZKGvMJiTEzJO/ACoclCXj2PIaDiuxBn4ChzO16VSpbFtCp1fevKyHoLQZVLMp
         A4O0j6lUcK5KHbfHgKBgmuV7HvdF3HXdUhBuA2k59OTi22fqjucDJLJ+zTtjQaz8bY
         Aq4BXOGN4MhAsilpdkRi2wFevXwZg5zmplTRrVynOIqOplLJtwOd15pkg7Ec+pdkrX
         AKj3+OcNrllMljTbIForwACJFKII/D1/jeq0at3rU1TIWeOk2CRmOxRJJXuNmUfLA9
         KBioYLYWijgOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9E322C05FE2; Thu, 10 Feb 2022 01:33:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Thu, 10 Feb 2022 01:33:39 +0000
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
Message-ID: <bug-215561-208809-OXpyW0pBpD@https.bugzilla.kernel.org/>
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

--- Comment #4 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
@Takashi, I can't really try that. Note that when this fault occurs my mach=
ine
becomes unusable and also will not reboot. I have to hard reset it via the
power switch. I see this with my dock but I just removed that and replicate=
d it
with nothing plugged in to my XPS 13 laptop except a direct USB headset. Set
sound output to that and then suspend. When resuming, sound will lock up. S=
till
fails on 5.16.8, works fine on all of 5.15 -> 5.15.22 and before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
