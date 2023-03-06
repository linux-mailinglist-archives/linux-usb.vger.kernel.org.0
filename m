Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B9D6AB471
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 02:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjCFB4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Mar 2023 20:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCFB4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Mar 2023 20:56:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A75126F6
        for <linux-usb@vger.kernel.org>; Sun,  5 Mar 2023 17:56:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E3B3B80B94
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 01:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A77AAC43444
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678067800;
        bh=aJwS4PnYlNsR7NEfcaQ1iy1SNH3N5f1evmRSQn/Ms5g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JwubhWEfDTN8baxodIyj+ug3ijQr2mWVZnBnObc27kA9tI4NxEeM2rb5GiU++gON9
         ZOVCE5Ig/HWP1scpgGn+v8MsSd3QHU7ZaaAgrklHpzK4UqgCDqaGopdmeOuEjgO8fq
         mGAnKvrMx56v/vTvbhl7TEzbiOwVJPGFjJ5m4iXSkU2rv6KTVPlysxopcb4JmaIeZ4
         2eZTgRKFO40lhAp7ociNfuJOFYX/tkp++b00GCa5x+awrUrCJHZLkRC9ERmzywwhUA
         Rlik9AB7pVAK8gwcfpOxR3NlxSqzitwfattBIZVuunCal2gKH6aTsI2MHbzT6jkQJL
         LXZqsEu945sSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9F966C43142; Mon,  6 Mar 2023 01:56:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 06 Mar 2023 01:56:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wyattbiker@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-210425-208809-Tis1XV4kYo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #49 from wyattb (wyattbiker@gmail.com) ---
Created attachment 303880
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303880&action=3Dedit
upower result unplugged

Any chance the reason the icon shows plugged in when it's not, is because p=
ower
supply always show as YES whether plugged in or not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
