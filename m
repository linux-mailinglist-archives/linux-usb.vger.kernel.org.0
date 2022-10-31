Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529AF6139D1
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 16:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiJaPPq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 11:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJaPPp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 11:15:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E8C11441
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 08:15:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D88086126B
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 15:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4891FC43145
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667229344;
        bh=ogz9xYLRF58DpKha8pmXV042VkKH6AfFVSKb4s1yoKs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T/nXTh/JdXhObV7Ml3VSyH13JOqUUnZ2lLW515nOs+wyB0Dk4sU4h2EFcQ8UADgVp
         y1Ga2BBojgniVlll2F1Ed94f+38bBj6+Sve5f1JreYi5sG3F0+FX3VMOgWAZq4GSte
         JIuMr7uTdZoMhF28UoXlvttGZCHxm0p/tPhiXaueX03jKwBi73aLvRYWWmYa/hk5+M
         TAgGTvbkpA9PeOlu94bqD8kDFIk18n5D/5bo8wJkOwriYXUDs24uUmVB44Q8fT6yyH
         u1JrbQTmpNO6DLl5ANwKIvQOUums51EGQLaKfNmQ9tncZ2JMAusZLCcm3YcWwyALpO
         g6AQvb8LqnV7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 384C0C433EA; Mon, 31 Oct 2022 15:15:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Mon, 31 Oct 2022 15:15:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-KIeEIkiEJt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203419

--- Comment #52 from Takashi Iwai (tiwai@suse.de) ---
You'll need to show exactly what you've changed.  And, at best, submit the
patch by yourself to the upstream.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
