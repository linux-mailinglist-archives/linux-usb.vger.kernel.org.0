Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE126F88FE
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 20:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbjEESuz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 14:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbjEESuy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 14:50:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C6921578
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 11:50:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CB3E63FE3
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 18:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E230EC433D2
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683312632;
        bh=qZihlQgTFMvQ1lWpbqvwogM1kaIwZTP6H6JDb3W1QAE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JNXCQBH0D/NQcnC8L/oWBh9Yv92UIQibdwcsnFf/dnoy3mcDxS6FwNJfyBxYH15K2
         wWhGGdcpDl6KD7bRnWjCkwMWt3GTx7bxdlaS+W7cERA9kMLo1vlSLq0X8UOz3mC/ON
         h6Mc1EFc03nBu/cDM0J+i8mG+77gk/Mh8ojc6jmMokuy7LAaVIHtWssd+pm3XJezwm
         0N/KYDuqtk2Y4tUqT8zLA4fj7Si80o3Y8Ut92LHolT1oHEnUOrKgK+P2ryDY3STCYJ
         eee6F6nMVz0VePWrpdaey9duLeCWXCAktAdGYFCxHT8uHglTBfG6+NTZp+8+AaMjRM
         SdA7gu8sK9OkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFA81C43142; Fri,  5 May 2023 18:50:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Fri, 05 May 2023 18:50:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-3PWHCmCfra@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #34 from Hunter M (miller.hunterc@gmail.com) ---
Update on larger rework - No issues found running on 2 computers for the we=
ek.
Would logs containing dynamic debug statement for xhci_hcd module be needed=
? If
so, will be able to get a snippet of those logs next week.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
