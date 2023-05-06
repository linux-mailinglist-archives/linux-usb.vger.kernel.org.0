Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD706F935B
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 19:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEFRbI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 13:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjEFRbH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 13:31:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C825A1A1ED
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 10:31:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BC6B61044
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 17:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 940E0C433EF
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 17:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683394261;
        bh=5duUjjRx6OSJPfYKELQPW8KxDIytVJGrqlUg4WGJkcg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mG1nCOOypXBDo/VHAk8pTtr+SLr7Hlb1CpcnjJQIrOKBYhgBA6cuhc8QGI6Nru5Re
         rFVWsuV5565myhQAuFQUOTjvV+KRWK2F0KNraGJbmC/p5zdf5mrrDsTtFrdxcpmRiu
         wGP7j1CkIzMetVixbSIXkMM6GbU05mRi27inMweCnFliukovGWaTgufW3bH00cbjfv
         okBRHzZjk0gMUnONT4G2PwMN4F5LjEfn15l6sU8BI2ComBXILyKLRvRfUMR1XjXu87
         A7zhr3BoATNyhPMuO6/KuL/eMPG0TjHdM9Q/j0kL1vpg1K4iCGd5zYHBsfDefApyiS
         feSVTDha8LCgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 75222C43141; Sat,  6 May 2023 17:31:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Sat, 06 May 2023 17:31:01 +0000
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
Message-ID: <bug-217122-208809-2Hb4ZtKUZu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #12 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
Update: now the bisect steps are different, currently I'm 4 steps away from
completion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
