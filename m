Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5439A653799
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 21:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiLUUcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 15:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLUUcj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 15:32:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9FAAE4F
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 12:32:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B2666191A
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 20:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4D01C433F1
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671654757;
        bh=Euxs2soz6DzqRvS9KZlgkmHLDQCz1VXVcbBqMbW9LN0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lurLuLvp+10dNfNk9gINvmLjtVvxMV+N13HRlNZkAOGRHLjyC78yci04d0bXQn32C
         MoTapKLaVqe8le22L0iE/7NNj7lGDoq4l3y8wsL0I6ufKY1Qtgre5WQalALTnkBbXv
         YLpHa1fz0jid5klLAHsLCKJekIKr/giShRNvBDdrIrG45vCRg/6ckdo/hFyCt7JQ0D
         LG8GGCO1qw2kO6y+N+MBDljpaSd3ujSpfrOvqNsjeK6F5uHVD+V7FNxTMKqBTJRM7U
         yD5QEKtjC99A3jQIt0wlfPTlfMV151fYfFKhCXgp0BGE3MC2jrYXChaTjPv11hPSIS
         TKBK3QrqhlKug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C2139C43142; Wed, 21 Dec 2022 20:32:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Wed, 21 Dec 2022 20:32:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alchernaev@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216697-208809-2xSi2fcBRH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #9 from Alexander Chernaev (alchernaev@protonmail.com) ---
Created attachment 303449
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303449&action=3Dedit
screenshot of error with patch

Tested with mentioned patch applied to kernel 6.1.0, unfortunately the issu=
e is
not resolved.
Patch tested: https://bugzilla.kernel.org/attachment.cgi?id=3D303247

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
