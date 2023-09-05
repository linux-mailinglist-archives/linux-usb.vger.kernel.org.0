Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151CE792595
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbjIEQC4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243259AbjIEAqq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 20:46:46 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF9EDD
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 17:46:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7E92ECE021C
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 00:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5033C433C8
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693874799;
        bh=arDKhwtGpg2S6ieOzMKNSubdKu98Ve3ZDNBoDXUfilI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bcjYPpxeQtVlSM/VsCBpSNTU2yK84KK8GJqUzx7JW5pZ0kU6QRH6zDA9sCL50qsRJ
         aWhazCpn/zCJsGZ9TMfNRu4234za01BPC4qA/hnlBvUyhIF47Da+0nUUhj2ALKIhIB
         KGMdP9FlJunhBgbW0u5l2S2S/xYDsyBokiCdpx/bAS5utTI2mTC7uDVNu6WEzQhouK
         C0mPeWDRHAHEV/rN2Dl0C8tV4CV8+i0dXeaZ3zsEvtap7xd7NdtrE2qZWTNCZuQ31c
         vUaG0AJ/PM6cwZOBlxdSzP+3dyH4hKLSPXM0n1+EI8lZ0TkGX9NkcVubL9SBK4yYJ6
         +s0oxdLAFOzYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AEA6FC53BC6; Tue,  5 Sep 2023 00:46:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Tue, 05 Sep 2023 00:46:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-J4JqsLC09w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
There really isn't enough information in that crash report to tell what's g=
oing
wrong.  Can you rebuild the driver with CONFIG_USB_DEBUG turned on and run =
the
test again?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
