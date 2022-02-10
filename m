Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B6B4B07B1
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 09:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236889AbiBJIBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 03:01:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbiBJIBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 03:01:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25426108D
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 00:01:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD9C4B80AF9
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 08:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A4B6C340EB
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644480062;
        bh=Gyg2O9OR/pAvePxc0fm1iYNH0NPfN7+cMhMZB+8IyUI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ihy6UwRAy9kC738l9OE+YVdvWOmu7L6k6Pe3Njd+fF228z5n1N1mx6mi04EHbsorH
         sz2wHmu2bTPJhjM/f0r+VSRqTESC1pw8v4JdKAOiPY/1ELUKEtQPbcnlBwSfrKrtcN
         EW1fCqLtjtRRMoDEDmy6o6Dfl+ZHRyHPZKK/7xKb9hDYHN1rg7WNWXHRXTxoJwJmYN
         5JBDXSEK2KQBwaXXrMjsWdtY/pyOm5E7S81Wcn+X8RUVrsx+nKR3gpa0KvXR/Qozj6
         gUFauoYNYhUoIK/fY/skOvzIRpl1C+lijGmeNbV+2MKzn0Q4usbvv0nJ71aVQk8Zuc
         4CUQJhe3anMVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 688BAC05FD2; Thu, 10 Feb 2022 08:01:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Thu, 10 Feb 2022 08:01:02 +0000
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
Message-ID: <bug-215561-208809-jCv9XeVgen@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #5 from Takashi Iwai (tiwai@suse.de) ---
If 5.15.22 works and 5.16 doesn't, it's likely not about the sound driver b=
ut
rather in a lower layer.  USB-audio driver code of 5.15.22 is almost identi=
cal
with 5.16.x.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
