Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F099B63F0F3
	for <lists+linux-usb@lfdr.de>; Thu,  1 Dec 2022 13:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiLAM5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Dec 2022 07:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiLAM5f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Dec 2022 07:57:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DE3A4
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 04:57:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DDFC9B81F39
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 12:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A26DDC433C1
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 12:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669899449;
        bh=izpOOgRT9ZJUe0UFYEFuI/iXcqUKlfd3EaHuZ6Dj0eA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A6ElyOq3l2+08qSon55j+XvwBxUnBsdFbhcUe0w0T+u0DDyrFwXq+ACEds8THbB71
         2/Xqasb0CozkCEVLFstdy0w0PYqWHb2eU6s1487h3YymV1e01FKpnOgGx4I/za7WGC
         JNuQ/HDFIJtx09ivMODK6T5zk+v/SoFboA/tPSHSmd7QMtnlLVc6et9M3AOjmdIm9Y
         ZjWMgcLc5xR8euxMku6fs0M4Q4G61syKFnJddglzeoOA6Drd6z+QrFIVz8Ty/prZ8L
         7ymfOt6wP3WYjWhzk3LvLD4AYHypes9cMU2VjRwwti3D2AUryFlAFjpt5bggLnljW6
         1x58k4Lq0+Mzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7FA53C433E7; Thu,  1 Dec 2022 12:57:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 01 Dec 2022 12:57:29 +0000
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
Message-ID: <bug-216697-208809-uhPoaPo1CQ@https.bugzilla.kernel.org/>
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

--- Comment #6 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
There is a fix for bug 216706, but it hasn't made it into the mainline nor =
the
stable kernels yet. Can somebody test that fix separately, if it helps with
this bug as well?
https://bugzilla.kernel.org/attachment.cgi?id=3D303247

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
