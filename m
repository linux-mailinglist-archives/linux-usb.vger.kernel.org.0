Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F63E631EA7
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 11:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKUKpz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 05:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiKUKpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 05:45:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436DE7DECA
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 02:45:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EB92FB80E48
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 10:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D5A8C4314A
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669027541;
        bh=qTEz8SG/h9aBhkzHP+GfiJNpOvgHxUc4qvzzvaAckIw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q8MBWRyFmOX1BAusXPVl9DwL2P74y523ok8s5zK4+IpQC2mbxvlTVDljv0+SSkUub
         rvJ922sAq9+mchDGehVF1nVx9VPGPoFU5pqHsyCRN63H7ZCRYWeMrX3JI4v1kuwEQA
         6XtXCEhTJWhXXrK0kI1o+pT0adpB96Xs2sPro9UeccWrJYdqD+sIeVlAUeIRkZXLfU
         0mtl/eA0132r9knwyZI6iBh0HNqWr/V4JpaFISPBFqfcH5HZxvK98wZ6Z+qWsy8g3y
         z3eBqc19KDUNsI/iIdv60XatBAnQ3xI1yxTr4hcirVRizSrdXTRr7C5fdgdWxiL4n8
         4kwymp0QERokQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8174DC433E4; Mon, 21 Nov 2022 10:45:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Mon, 21 Nov 2022 10:45:41 +0000
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
Message-ID: <bug-216697-208809-uA098YamKK@https.bugzilla.kernel.org/>
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

--- Comment #4 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to Roman Belikin from comment #3)
> Hi, I got the similar issue, that I've explained here -
> https://bbs.archlinux.org/viewtopic.php?id=3D281375
> Blacklisting this module also helps me

I think that problem is related to bug 216706 (maybe). I'll figure out a fix
for that first. Let's see if it helps with this problem as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
