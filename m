Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066385BC410
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 10:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiISILi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 04:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiISILh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 04:11:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEF112AA2
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 01:11:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E30D617BC
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 08:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F419C43470
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663575095;
        bh=WoiWURln4V1HVmGRQPpqJoLzCy/vEbg2zsn9sZZmPPw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UlMMzAxGgasAZCIhSslPTOgoyGUmziVVfZB1zZ0JA4dmMh8SL+vdrvEazkaoorlwb
         yZaQbZo6LF3mpuWufPKwu68WxY6JSyZ9O1m31B/U5FG1Jc6SkfZE+yUJP8sSDBIPIN
         LrTwUooPkPvejd08q206CYnDHA6NDOo52IftlohMrq9ZWRYmCbPnXWqMraXQxa6M75
         /QvoTuUfojTlozHCi7drvj30RF3wRCjJSkyxg6Od4SLqJkPNdKCMQO49q88hUptJUT
         D5QI4tlQHP2vPJH6vzesqRgoehjv+1mCho7RupKpSUJkzCtlzG8/Pppxpuru5jERs6
         eQ5nXV/Z4VXjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5DEDDC433E7; Mon, 19 Sep 2022 08:11:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 19 Sep 2022 08:11:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-cG48XfMKLE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

--- Comment #5 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
There are some IOMMU fixes between v5.19.8 and v5.19.9 that might be relate=
d as
 there are those DMAR faults in the dmesg. It should be pretty fast to bise=
ct
between v5.19.8 and v5.19.9 for the commit causing this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
