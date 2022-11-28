Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F0563A89D
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 13:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbiK1MnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 07:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiK1MnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 07:43:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DF064EF
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 04:42:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C187061163
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 12:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 280FFC433D7
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669639378;
        bh=SzmWkjdMy2ivo9yMOSXmPhBGGJT3R20aOUgoz9tg0LU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lT0UPGv59mMLQcfka5a6XpDmYuMy3lXg30yhtEAsgEjQhwGoj2Ib0iE+8CKZoUxlG
         UeiSIXK6z75kk3KGG/PuyhyFlA7VU9R1S7JlWouRPqwSBYWrtNnBXE8e7l8aXH0Cp+
         q+6OakAHzsjC99aIAEqhS9prHRyQN5skhKWUEjUTjim6DDI/lMKSBXvp15IKMAknaA
         fljfl+Yfs7ASIBg6h5NkjSWmtz8STXbFbrNMpUzg8KoSjiw7Cf20KwCTr/PGb8padO
         xDAwGTygU8h0J9pXK7s1U1TkrnOgY3JNSNe+GTnnpWdCNTXmTyuWHnxbwwAHxmEcfM
         CcE7B/AF0uaIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 07C03C433E4; Mon, 28 Nov 2022 12:42:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 28 Nov 2022 12:42:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-NJuUNNGr7V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #9 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303307
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303307&action=3Dedit
dmesg of kernel 6.1

Yes. The error is the same on kernel 6.0 and 6.1. I'm also curious about why
the power transition fail. There's no problem on non-CML platforms.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
