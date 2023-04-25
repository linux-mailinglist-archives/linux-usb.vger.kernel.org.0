Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEEA6EE7F5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 21:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbjDYTBH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 15:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbjDYTBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 15:01:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E7416F3D
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 12:01:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2BA563107
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 19:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48058C433D2
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682449261;
        bh=qWP0BMNHO6Wkfiycv5YUET9mU2P6JZqtM6IBrA5bnoo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IGp4Y4d3l19T2D6DqdVsRO2HhQXue7O6dmvceudvZ1Ncf7PemEA7pSVzcfMfH7X4G
         Td2L1rjfjMMLxeILYNoq6gXqi14cnuruxYO5eu3ig31oVXQbue7KFqRnopXnEnwNIX
         O/9FHz7iKD4uZmrV2jC9h+/w1vZH8P0TfSpODXlMEyMfvizzP6AqeLQM2wye4dHkw6
         xPN7r6nmhII/P8tExFVb0UkIuYM+oS863dzTdfAQCCZMBhhgC2E/q9zDTno/+BbkFN
         hU9SjWDBvoXYkGwS67yMlPLVz3T4/VithDrc7L08+PdS6wCBDoFr3ircVHeOyv2uzQ
         UVolRBNlEKarw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 20DCCC43141; Tue, 25 Apr 2023 19:01:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Tue, 25 Apr 2023 19:01:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-miEvgo0sq9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #30 from Austin Domino (austin.domino@hotmail.com) ---
(In reply to Hunter M from comment #29)
> 12 computers have been running since 04-19-2023 with no CPU lockups using
> the patches. TRB values constant at 512.=20
> The only thing I have seen on 2 of the computers is a warning log for the
> following:
>=20
> Apr 21 07:47:37 myuser kernel: xhci_hid 0000:00:14.0: WARN Set TR Deq Ptr
> cmd failed due to incorrect slot or ep state.

Hunter, I've seen the same warning in logs for computers running kernel 6.1=
 and
6.2 before and after these patches were applied.  Also, it appears that the=
re's
already a bug report put together for this warning (see bug w/ id 202541).

Also, since I'm writing a quick comment, I'll give an update on testing the
kernel with these patches applied.  I haven't had any problems so far on any
computer running kernel 5.15, 6.1 or 6.2 with these patches applied over the
past 6 days, and the number of TRBs has remained at 512 on all 5 computers.=
=20
I'm becoming more and more certain as they days go by that these patches fix
this bug, and I'm okay with running a patched kernel for the time being.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
