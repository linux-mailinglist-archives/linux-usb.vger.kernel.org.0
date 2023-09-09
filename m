Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7465799B46
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 22:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239702AbjIIU6I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 16:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjIIU6H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 16:58:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4841E19F
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 13:58:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70ED0C433C8
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 20:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694293082;
        bh=EOv0NT8tGW4mas1rssAUPgxGmUsz9WT/GEWTMESwPHY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Pgupa8lP511e0LKqfm34pBJimBL4nOKOAOc21gKYPANMJImlZsa4vSpJV28/ZCKNF
         WiOH75jRz+hf6EZYa5qub8iIuYonaWVrG16k24J/VewkXcnIvkew0ZJiwo8boESqfO
         ce6u0ZvPn9TLSUff45PbE27hE956a3xBjjN6g0MiB2AXHgqOtc2nKUk8oCPfl+hdlD
         LEnkomgtWxG1nR/u/6eBgmW2nOHioj4T41jvku91/eLXB9bPLo+AuhbLMeH1nu67QZ
         B9pUR+kQvuxUU9lmJMvRmIb0P7lSp8h3hNw0/Pe/V5Va46Dm9Pg/C+7mqrEar+0oBs
         n6ynRARi2Z/IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A4C9C4332E; Sat,  9 Sep 2023 20:58:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sat, 09 Sep 2023 20:58:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-U75TOFoBMg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #16 from pawlick3r@proton.me ---
Created attachment 305075
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305075&action=3Dedit
dmesg and usbmon with patch

The good news is now there's progress as the reader is a lot "chattier" in
dmesg with debug on, to the point of actually filling up the buffer. The bad
news is it still doesn't work, but now there's actual communication happeni=
ng
more often.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
