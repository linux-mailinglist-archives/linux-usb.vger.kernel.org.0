Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE95642C59
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 16:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbiLEP6r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 10:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiLEP6q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 10:58:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC6317047
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 07:58:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2555DB81142
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 15:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B83BBC433C1
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670255921;
        bh=64xSyUfcyygt4FO9TwX5cJegJUKHd9Xesjl2U1avbMA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qxX2YSAXlVuScf2ArmUp5nGMTzHtBX3y+6PxS0DgOI145pcHpvBc3j431mOJbD0QT
         cVT4RBg1ZbCqbK/ZqT+ETFMCeHJYkGQW+N1FQbS0OpbEEfe0Yb1o7AIgz6rw7glQ88
         fbTNaWeYynI3WtV9g6C1fyMOh0TabfUVjIgTts7Yfks5ozvfRxQ1CxigA2rXxdIoLS
         RVauLIjT8PXt+99FI0N0eAeBQk3evvxnCPKuKpvpKVoaAD1XawqZwu2ez0qzkfvX52
         +66MgKy2Yn7vcHiLi9tUdzU14jJxmruxc13Y7cUcCjH1Hel1FlQ64bvfp0m4QsLrXe
         MbQnD/tzkh5vA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A7BD5C433E6; Mon,  5 Dec 2022 15:58:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Mon, 05 Dec 2022 15:58:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216766-208809-0P4nkQSEru@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216766-208809@https.bugzilla.kernel.org/>
References: <bug-216766-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216766

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
This could also be related to USB Type-C port setting in resume.

I'm guessing this dock uses DP Alt-mode, with both Display port
and USB 3 over Type-C.

In both resume cases there are some error related to the display:

[drm:dm_late_init [amdgpu]] *ERROR* DM_MST: Failed to start MST
[drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR* late_init of IP block <dm>
failed -5

After this all usb devices on usb4 and usb5 buses disconnect (xHCI
0000:06:00.3:)
There are no xhci errors in the log, just disconnects, as if Type-C port was
muxed away from xHCI.

A bit later we see DP Alt mode entry after first resume, and usb devices are
enumerated again.
[  136.881649] [drm] DP Alt mode state on HPD: 1
[  137.153415] [drm] DM_MST: starting TM on aconnector: 00000000018c53ab [i=
d:
89]

After second resume we don't se this DP Alt mode entry in the log, and usb
devices remain disconnected.

Not that familiar with Type-C settings, could be AMD specific

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
