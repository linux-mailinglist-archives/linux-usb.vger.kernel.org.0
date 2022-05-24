Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B935330AA
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 20:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbiEXSsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 14:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240424AbiEXSst (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 14:48:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23171EC72
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 11:48:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61001B81B85
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 18:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4D53C34115
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653418124;
        bh=Pz0ShCPZf2G50TpuIu85SsX4QI1fHj2Y8oO8zjjm4b4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M2OxRFs7WcwL/mpGVl4I9M5aaY0IGte1/DR+mouiGxwr+48KfhZjst1kPgf9+2MKP
         0jgxfPSz0euiudpLeK8qaa2+diTCbOoA2boNOJVInqXeh82LVn+k3UuXAOJCw2gC68
         FiCmuhaMhsCCLsa6FZkskKCa1g4y1mKHh3pBGnsEzS/XjvrVrRQr0SRX9/a9UjcIo2
         ZqtWrevQ6EQwgfdygiaJi8EF+lxtZZdNiO0mRYjS8IXf4D+Am0n7OcKtqeD6tXay/6
         5JoSiCCs9G7qh9YnUu3dyvvqqqcT08sRyB35mfAJeGZyFphmKe6oSKPdEzY2atVQWN
         FgtQsStkJW7AQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C1585C05FD4; Tue, 24 May 2022 18:48:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216020] drivers/usb/ folder compilation with allyesconfig fails
Date:   Tue, 24 May 2022 18:48:44 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216020-208809-PT2UEOc0F4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216020-208809@https.bugzilla.kernel.org/>
References: <bug-216020-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216020

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
The warnings about ene_ub6250.c are accurate.  The driver uses (EntryOffset=
 %
512) to index a 512-byte buffer and dereferences a 16-bit value at that
location, without checking for proper alignment.  It then dereferences anot=
her
16-bit value located 10 bytes farther on, without checking for overflow.

Not having the specs for this type of device, I don't know how this is mean=
t to
work.  Perhaps EntryOffset % 512 is always supposed to be 0.  But perhaps n=
ot,
so I don't want to make any hasty changes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
