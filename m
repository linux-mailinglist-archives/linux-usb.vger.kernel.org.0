Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3550A551305
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 10:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239884AbiFTIkI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 04:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbiFTIkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 04:40:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630AA12ACB
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 01:40:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1FD2BB80F2B
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 08:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7360C3411B
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655714402;
        bh=icpOoCUf51ZjSuzVzTfV0gzorCnopXC1GW8s/hHurCA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hCdooqlmcf2emH5HM8NLCdRZoK6g0xS2NyecoG9u0AVcda87D2VQ6MgRyA1ZzZK/f
         pJjkPUwHwo5TeSMPu7GxXISMQZt4FSuOI3dE0whB0/gS08yuTW6y42IyFDfjw4D4ce
         XoDBzMWvC+HFRUCLx7qojDkBguehMAEuJBzjYnY9sx3g2fpJaFvsr24cB94AY3ESL1
         1ZRe/DecQRyt7xwY6WWZoAgsQ69guU5MvcaeEKSLa/W3HNIPPK8fMyW9Q9yG61OUlw
         /AOQIBHqye+QihDjFNs11kO1g3/m+rtK48cVNKYa5BhNYGR8Vqu5oc6fXFn+4YTCqF
         WQ/8KLk8PnYag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 98696C05FD5; Mon, 20 Jun 2022 08:40:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Mon, 20 Jun 2022 08:40:02 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-J6iCgQGNCB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #8 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Piotr Pi=C3=B3rkowski from comment #7)
>
> > Any chance you could bisect this on upstream kernel?
> I'll try to do it this week

And news? Was the issue maybe fixed meanwhile?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
