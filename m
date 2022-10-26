Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C28760DE78
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 11:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiJZJ6z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 05:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiJZJ6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 05:58:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3D552FD7
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 02:58:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 27EE6B82143
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 09:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D55D8C43143
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666778330;
        bh=+Qs5QUxbPjHsIRpPk8UmrKk5TzeFUZXqaLHPMpA41OM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YC1e1d7dptuSHRlnQMmJCUKck5M7fmTZ4/w7+vyqYHfMG3bef7TFM3ZRjJObkKKvZ
         WpPa0h3Z7GBawz+e2RC4/Wfeegx1+lemig+8CHALNNO4EIQvtX1R0Gw8XRKeZRHWlG
         Z2/cjzcOJcBDy1GkJa08lfZJymTASWctVVb6baWKRks2eVdBuEgXp48sAHh+c5Du2k
         PhmQY0VGZ9BIcpBecFOfG8jkUt340Pl6xjffqk1HzCqL2l1ykQB77wv9KBL6HN/LpQ
         oxg72fCRqiCTHW7Hus/lhVbgrJmcT6DzKtEV1WiI/zKc4gsNcXKiSadeTGEUXUEwRZ
         Gjnrr/Ef0Nt0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C7B8BC433E4; Wed, 26 Oct 2022 09:58:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 26 Oct 2022 09:58:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-KC2xfkl4LC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #40 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to Adrien from comment #39)
> @heikki Today i have installed 5.19.17 kernel (btw it appears to be the l=
ast
> 5.19.X kernel) I have saw that you made a fix regarding usci but the issue
> is still present on my machine. So I don't know if this fix was referring=
 to
> this specific issue, please let me know :)
> thanks

The fix for this bug is not in v5.19.17. It's not even part of mainline yet.

It's now waiting in Greg's tree (there are actually two patches, but you can
just keep an eye on this one):
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-linus&id=3D99f6d43611135bd6f211dec9e88bb41e4167e304

Once it get's applied - presumable withing the next couple of weeks - I'm
expecting there to be a bot that reacts by changing the status of this bug.=
 We
shall see.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
