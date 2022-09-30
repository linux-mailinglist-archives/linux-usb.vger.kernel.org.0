Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97DF85F0AD9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 13:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbiI3LpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiI3LoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 07:44:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A321CFCB
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 04:38:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3367622F4
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16078C433C1
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664537927;
        bh=GDtndTVfcXi4GRHzwy6U3g7FTvCfaKm1LT8KW0OBMVo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KwZF6o1jV1eGNASYNQnRnancYd+jv04SuT7N+VCdD0/8BuoJwMvomlEPdTGlRVtr/
         pbH+EYNU9MWZwet5P180zalWtSFyY5uusKOmtjQVZFIok36zJp8tlrLscdDZzhNlnb
         6gI7iOq4TB7Cy7n6bHtKA7nqwzZAmcWV+qjfl0e3nB/SFQD/iC5OZ1/bIaXA/UjgPw
         Wyzp20bgOgpDYXi4uSf4mW7TakJ9Pos4wumGsvaf7hq/CfYN4NiHMGmh7bpg44Q+fg
         5S10+bH+As0RbFnBEAPb64f+PHtd4vqxGGWPu3flVEAPHgNFVTQFyTclAbDhRv8Wub
         Cg4mfXEOHIbZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EED1FC433E6; Fri, 30 Sep 2022 11:38:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 11:38:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nazar@mokrynskyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216543-208809-9SJHQpIfGA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216543-208809@https.bugzilla.kernel.org/>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

--- Comment #4 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
Created attachment 301906
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301906&action=3Dedit
kernel log from first crash

Previously uploaded file is from second log snippet, this is the first one =
for
completeness since stack traces are slightly different there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
