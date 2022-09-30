Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E3C5F0D85
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 16:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiI3O2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 10:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiI3O2x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 10:28:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27021A1E94
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 07:28:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8511EB828F1
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 14:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3594DC433B5
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664548130;
        bh=d29FmoX3d4xWRV2oUBOB37Fb2SJ6sxThmEos8Kx2Of8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gcRduKuMjGid+uUqkJQ7m88ruS9pmYhcOeh0SQiEtfm2sXOPzck/7Doo40UQb7WKr
         4PQcXYW8v/mxxZ/FssfslX2iSmU2oyW8Xe16bLWWDWf7FbbJQLAQp5oGNkFQsD1CSZ
         eCb0yd2D5PMLLw3x8mI0wWolvI6vNrm9mz8KDrOAgJu72kSYfI0EHbfXheMCMPh1yb
         xex+jaJ9mn/F45ottVSD5Stu04UwjwQHQcrSN+uRzYh8P5n4h4txKgDoXDBnWsSdhi
         UyYsEoB9R/eBeshFrEKR9Yg6XH92DXZs9jFVvU3Y1vdfKlgX28dMCO4P3sDnJmQTN0
         p1XH8eSnE1wxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1D082C433E6; Fri, 30 Sep 2022 14:28:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 14:28:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216543-208809-iQs2d6we56@https.bugzilla.kernel.org/>
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

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 301908
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301908&action=3Dedit
Diagnostic patch for uvcvideo driver

This looks like a race in the uvcvideo driver, possibly between disconnect =
and
video start.

You might be able to trace this down more by running with the attached patc=
h.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
