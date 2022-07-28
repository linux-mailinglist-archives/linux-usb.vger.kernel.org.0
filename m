Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B9A584206
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiG1Om6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 10:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbiG1Omj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 10:42:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CF62CCB9
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 07:42:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E9EA619A5
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 14:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3BDCC43470
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659019339;
        bh=NZgRR9WjY0KMpvSTSWwPnOatHWinKQKnBv25jNxheO8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Yl4w/QKUdcHmFc6sylTmS/wv7yfvZyf+o2FLgSUsDwCXnqqmVaPXnl+acoaa3MuRd
         gqI0YuCaoPXNRy/tnZ9iH7aVmLbWW8J+/0mPF97o3jmfhFwJaBAqXO/p2LlONIpEoO
         YPryjQOKi1HZu/HUG6kLXHN2TpTdyIL/y5iJ4bBF/6yw+B3VpUe1nq3Ph/+LswdxM2
         waCCtGLELCJdg9UJriKcatZtQqMcVsd7YPCI1pn+vL0+ZFQHzqn/DR957NcagWPjlH
         atlgwrVOljrbeK/fPjCm+ybOmdfjUCRLqn6Cj599iePYZ9jMvAeaEfkxOcpcux3eUG
         TXfXRQgkq87lg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 814ABC433E6; Thu, 28 Jul 2022 14:42:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Thu, 28 Jul 2022 14:42:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-GFQTzhN3xS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
Make sure your current directory is something regular, like your home
directory. Not something under /sys/ -- those directories aren't writeable.

It's normal for the files under /sys to show up as 0 bytes long in an "ls -=
l"
listing.  They aren't real files, but interfaces to the kernel.  As long as
they do show up at all they should be okay.

While the "cat" process is running, any activity on the USB bus (such as
activity caused by plugging in the drive) will get copied to the "mon.out"
file.

(By the way, the output from neofetch is not really useful.  You might as w=
ell
stop including it.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
