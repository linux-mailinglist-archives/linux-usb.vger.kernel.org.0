Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A6376D3F6
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 18:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjHBQrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 12:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjHBQrA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 12:47:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6572710
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 09:46:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5166F615C2
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACD77C433C9
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690994815;
        bh=nR5b22Vd4ATtg5y+KwKGLBlAUpgDuSy/R7Ajtq+e/9w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k+Z72RSgfwC8+1v5RBS9jr8DkrnBnPctr+/DuIygH9ypiHaKCbv+00Wpjan6bW0h2
         CiNhvHhnuHZf0nwkaw2n2Y93Zd6gQeBgeVchJbBx5S6vyNaTnJECFhXCZPfVH6fDAA
         nPExvkQsgEeUUzHBgUSa4XQMv3DSSAoJ+bkNFvL+NT3nUHkOmFe0kTA84DztqR1wf6
         UrVc81YI1U2z330uENafP/Lfw4RX4fJ4WqjJ5DNmFC+Yy+v/j7Sx51ktuCn7D5Ozzv
         NyETc+NM+LQO1PcpICLgF6/UX/U/hUEyl5a9GTg2Itv9RSF+elGZThUHllsMC7bcO1
         POEgjFZaZR/ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8EC4FC4332E; Wed,  2 Aug 2023 16:46:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 02 Aug 2023 16:46:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-E9KRW5r6PX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #30 from Michael (ZeroBeat@gmx.de) ---
Thanks for the fast response and the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
