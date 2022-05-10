Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D3D520FFD
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 10:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbiEJIwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 04:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbiEJIwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 04:52:37 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4664118C5AB
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 01:48:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AE969CE1C9B
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 08:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E76CAC385A6
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652172516;
        bh=ywURkgtN0JmQHICJmBvCzS+WTfsycHe+nonAUCO2EMg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CBh6upFG0jpfBnNFgC6kEkI2LlwtSJ9F2LzeDoIPwt/9TXkM2ox/Y9xIl5D6ldETu
         Ey3lOfZ8G8pD9ykNbHrKPJVGOpqSxvVw/xdjgl8/nw5IXroJ6RiqESEVeJ+IiSOrr1
         JKp4GWX0H/nPitmP+QX5ywiSELzot8a+nDJI8K3+voY3JWgSdz2rxHSyLMBNfWKGqV
         ze1T7sIOeNazwgFbH0ecpHyZHU99eoLcPyrt7CCAX18fkHYsXDGE46kXp7o2OGWVkF
         8OCeHUh0Wkwt85abdB+NqffIItXtVGcox+JACYD+RMcS5SA0D67Z0ama0AboD+JCLN
         7XXd8idOiiC5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BC286C05FF5; Tue, 10 May 2022 08:48:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Tue, 10 May 2022 08:48:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215890-208809-EI9N392L5F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #4 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
If you could test 5.18-rc1, and maybe bisect, that=E2=80=99d be great.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
