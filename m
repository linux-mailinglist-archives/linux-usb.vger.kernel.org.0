Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825D9640FCA
	for <lists+linux-usb@lfdr.de>; Fri,  2 Dec 2022 22:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbiLBVJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 16:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiLBVJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 16:09:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28F2DF02
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 13:09:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5326362118
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 21:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAA57C433D6
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670015350;
        bh=KWa9GTUor/EbaTUCzEWAPMRU/gztiZv0hl9i0ic/DBg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ninCJYTY62+U57c2tcfTfDPwduzxFLSlSEqKhA7Sk8bn/SdfOpL9KWQgDMuUcBk4Z
         utuKgVxYv8ZmBn92JCv3Z8GtxAFM/uey5OyfgGv/paqgc6S3xO4CwO5fufiTYLa8Tn
         //2VLJzrx+gMFLvbUaNwhUX75Z6PQmxRyXGJB3BCgVUcR5z5QpsTp1/pjsd8YWIjBZ
         SAzcij3S3Y45y6JiYSdN5lHNPa3TrjkBk/fZEl5af1ra9f51JVl+vy8CgkCOY66gQT
         hn7V1huew6rwJmrROs1OfXZAyl4OQSMYgdPK5PZ4D7kc9BeuqRj625mN4jtNS45b/L
         pYgF139c4O44w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 892DAC433E6; Fri,  2 Dec 2022 21:09:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216766] USB enumeration lockup
Date:   Fri, 02 Dec 2022 21:09:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.burgmeier@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216766-208809-Dr8GmG7Wld@https.bugzilla.kernel.org/>
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

--- Comment #2 from Jan Burgmeier (jan.burgmeier@gmx.de) ---
Created attachment 303343
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303343&action=3Dedit
dmesg output after hang

Attached dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
