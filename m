Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4E86E7FBD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 18:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjDSQgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 12:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjDSQgP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 12:36:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4BF194
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 09:36:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19A39636A9
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 16:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E773C433D2
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681922173;
        bh=OcyT21ZEX7q13oEj7KpHfmFh4ZyiQOf9RISnuQQ0smU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uKWQH2bYsjG757BHk0kE1cm6FfyT3Qe2IyPxdMZQ/xjPNEtTuoulpLlHKleYQf41o
         uw5iLg4HxSONa+rXRvYwL8lQo8sbwHacTM/Yd1ublkMPFwh1K/pyN1WXupKoQ+KoAI
         cucVo6wYIEX70MRNVahpk+f+6SOXDmMIR+xxXWuhEsM8WDwIdr7q/owhIQOyW0c/YV
         NoztGJftuXl75vnezgVNOuKNAESTmR4aE5YYoejuY5x8yA2vh0uOblRSzJXoGutYSf
         7uUpEe4wM+UHp9+MmMKZw1yXWti2tIhOD1TlH22U6xHOkJU2m9PXi2yLKhyltr1Nfe
         yDknGL/O4RJ0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 62CB8C43141; Wed, 19 Apr 2023 16:36:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 19 Apr 2023 16:36:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-YaxLkZXIc8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #11 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
OMG, just found out why bisect failed again. The bug only manifests itself,=
 if
nvidia drivers are NOT loaded. Currently running 6.2.11 to confirm and the =
bug
has not shown up since 24h with nvidia drivers loaded.

Due do improper systemd configuration I had to restart once to get nvidia
drivers compiled and loaded before Xorg started. Since I fixed that problem=
 and
every time the nvidia drivers are loaded now every time I log on.

Will disable DMKS for nvidia drivers for now and start the bisect at the la=
st
known bad state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
