Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B6A65AEC3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 10:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjABJlb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 04:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjABJl3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 04:41:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0139EF4D
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 01:41:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 712F2B80BE9
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 09:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31A9EC43392
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672652486;
        bh=tP/FJxZ5F7UnfDiSIgPsOGuvwJKnjMCgkfS7wuByruo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SElnbO81YawXz3BBMGZNdUZSt3K5BIb95InuTVxDLZN/cJY02vENF2ypzNmUDSMu9
         B49NbmD5nw0kDivGtXSksbcbhuFprIjYhijXZH3W4hPcYsbwgjsjATl/hJrZmbq/sf
         r0eezadB6Uu9pwOA2JvxBlKjWKCvAWjoumOyKjrUGoywDqobuSG2aZ6qKcvkpTDk10
         1MtWl64XStupXqiGLrnC3VeWKdrXL/6xCt4aWUONDYD8GleAVpBLPGEIMexdOL16Xj
         PuDhOmv2Qy/1Woxr7OH8zJaevnOrk/hLyDF8e+Qk84LTfxQhtxkVdwbGzelCl4sc1d
         YlrwgWDQStUrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 18A6EC05FD2; Mon,  2 Jan 2023 09:41:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Mon, 02 Jan 2023 09:41:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-l3ocBwfdHz@https.bugzilla.kernel.org/>
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

--- Comment #10 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Thanks for checking that. I'll try to figure out what's happening.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
