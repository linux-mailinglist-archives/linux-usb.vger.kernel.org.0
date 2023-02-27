Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341986A4D1A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjB0VY1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjB0VY0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:24:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1720E07C
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:24:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3BC0B80D7C
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F81DC433EF
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677533062;
        bh=td75oT2NsW6Wc0TU/HAXisG9Z2iNsfCK3BmgVnUpY1Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YrDhrswR4gRKH+FubZ3kBw8eDxPL4vft1KUNGQJmF5zGt9TQApbgzmMpoTzBA6xBS
         b45X270GlRq3XCVOBbL/0Af5Bc2pdEVQdmymoXljAaTmIqjrohfQOFBMQOk7SyfZ/7
         PBX/+QomRrh/qeqeYPjq61y1hjQMrXEhwOd6FCFhefs7uI8gaHYjPU1kfpk1cglBbn
         4V1itgOEo58ySgIJUCpr/6e3ykkbFpPy//4nfKlqPNcdAXklrPlxAGGasWQIUvZy3W
         Wp3MkgycTt3ZgUqPkD/JA98+4SQwOukLMtaoQ2CGJJgyugW4t0UN3W4pd+LTnDfshh
         p+i+y6S6TVMyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5EE14C43142; Mon, 27 Feb 2023 21:24:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Mon, 27 Feb 2023 21:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217089-208809-h5HiJ6lbSC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #7 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303801
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303801&action=3Dedit
UI showing the xone23-c under kernel 5.4.0.37. The audio device is NOT
recognized.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
