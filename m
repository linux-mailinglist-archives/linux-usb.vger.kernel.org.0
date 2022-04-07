Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C422C4F89A0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 00:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiDGV3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 17:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbiDGV32 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 17:29:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDD219F233
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 14:27:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36AA361FC5
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96E68C385AB
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649366845;
        bh=isS1AAPoCHI50lJtfO3cbRFpENtCIwE/M6HQe+8sDSI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qOJBCNPeZsuiE81Wf4zM1kyx1V8Um5PDmONq3jJ+HsjGwztZ2xTmmDOen7tk2NUKq
         F+KejXRx7MaQNin+3LWkhfvuixegi0uZcu+ngp/m52zpWbl7VDV4ShpTaFuKgKTrGK
         sGu7KZBL/U2Z32PE8jqr46p5pgWx8iUh/8UR3eIOdX5braVsYV/Il5/WKPzSsw1ApD
         pXVY6ZQX4lCYawZ5J7ubhoC0q3ava0hgbEezg8qSsnX87ehqNjI+1xDoqZn3cym+OC
         7UlqZPrp8qAdkWOFWqAF6YNLOHKBZw5DWkmYpcxYTX6Ggba498yLimEKtv6IwjmYzs
         040Gt8/gm27wA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 84B1FC05FD2; Thu,  7 Apr 2022 21:27:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Thu, 07 Apr 2022 21:27:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stygarfield@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-qfY9SH2wd5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #18 from stygarfield@gmail.com ---
(In reply to stygarfield from comment #17)
> Created attachment 300715 [details]
> output of journalctl -b | grep -E "(xhci|\: usb)"

I'm having the same issue I believe, and am hoping that there is a fix out
there. This started happening fairly recently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
