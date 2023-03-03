Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831726AA05A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 20:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjCCTx7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 14:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjCCTx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 14:53:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3CF1689E
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 11:53:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6318F6185C
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 19:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1D4DC433D2
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677873235;
        bh=5aP7nUk3mRyKE/BBbrV7uMYqL3SEA4B74kmcogW1+XI=;
        h=From:To:Subject:Date:From;
        b=VpVKtmZqro3NqO1dRc6AtjUHcYOSiIJMvBQpWQapkMpbKcHVPMulsGIAs2bD4IFnj
         yjIDA2acXQFiFTSUzcm2+oFnzfD6JTgLdOwa0OOa58bvBtg2jiACgaZeh5gk4EE1dn
         6ke0U8WP3/CVlXILT6utSoY+86LvJDEGFzPUEZ0quAt0zfog6ECTf5zsHk9LNQk/zj
         TUS+QhngR8OBDL+zEJ2b/oMT7eLqVfdtrPkOLeR656GsaV5xxWSSPheV4+5GsxnwzJ
         ji1asMznSpD4WPPp7b/wR7sgGjXFPJnwLeM0L5F/OWC44RVf3Hdqm/e1p+GH2Odk8I
         zqRiaQ74oWttQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A1E54C43141; Fri,  3 Mar 2023 19:53:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] New: Regression in xhci driver since 6.1 "Transfer
 event TRB DMA ptr not part of current TD"
Date:   Fri, 03 Mar 2023 19:53:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,WEIRD_PORT autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

            Bug ID: 217122
           Summary: Regression in xhci driver since 6.1 "Transfer event
                    TRB DMA ptr not part of current TD"
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: t-5@t-5.eu
        Regression: No

Created attachment 303837
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303837&action=3Dedit
collection of txt files with various hardware/software states

Occasionally this error happens:

[94467.984745] xhci_hcd 0000:05:00.4: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 3 comp_code 1
[94467.984751] xhci_hcd 0000:05:00.4: Looking for event-dma 000000010f10c730
trb-start 000000010f10c740 trb-end 000000010f10c740 seg-start 000000010f10
c000 seg-end 000000010f10cff0

the playback software (camilladsp then reports an error:

2023-03-03 05:41:37.010408 WARN [src/alsadevice.rs:260] Capture device fail=
ed
while waiting for available frames, error: ALSA function 'snd_pcm_wait' f
ailed with error 'EPIPE: Broken pipe'
2023-03-03 05:41:37.013214 ERROR [src/bin.rs:364] Capture error: ALSA funct=
ion
'snd_pcm_wait' failed with error 'EPIPE: Broken pipe'

This did not occur in any 6.0 version and was introduced in 6.1, still pres=
ent
in 6.2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
