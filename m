Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338314B4D9D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 12:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349604AbiBNLNN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 06:13:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350049AbiBNLNE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 06:13:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFD3AD10C
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 02:42:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 437FBB80D6D
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDE1FC340F6
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644835348;
        bh=S+7Y7Imnyyk/RvCif53B+Dm9TEttGp2ddB0z6S4NRRQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=L9WL1rE7OMkdYpXss9pzDaXZbkA4mDcC+Z1b3Eti+GVpZk2ifbG0NTyfQkjplCgGd
         U4zp193p2uBdIOYDxDoo3iUHayWdFRQaSOlNxMTfBEhpJbDSIBmzeExpiga+8yXtCu
         0y/BSgy3h403OPaAtTkMhx7K8WyMmvI5u7gWOg9t37bD/IA5QSV43gBdjk+Ejyt3kl
         ruTE+xdUmDgNI6MLcG3O+Wgy77EWrEdX1WEsAxEbsrgYaxUIRYLb4IziaFrqeKNVzN
         lAuaUwvOYRqvMAStkhahjlzUfq8pPpKTJs393CYgooB9L9ru4H+k8n2kfbFsNZAtw4
         E4wpqqkn08BNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D1FB5CC13A6; Mon, 14 Feb 2022 10:42:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 10:42:27 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215561-208809-1loU4ul1bJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #12 from Takashi Iwai (tiwai@suse.de) ---
Created attachment 300451
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300451&action=3Dedit
Test fix patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
