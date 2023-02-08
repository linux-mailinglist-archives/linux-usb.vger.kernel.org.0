Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF768F02E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 14:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjBHNyZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 08:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBHNyY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 08:54:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919113D78
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 05:54:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11FDC616D6
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 13:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77A7DC433D2
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675864463;
        bh=ecJJoGKHfwI1hGKpfBoA3Oy6ZJiPCPD2mhJeOEdfhTo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ibhOH+18kdONPnrUGLkdIY7Z9Bd2GAyyZHFzmNLWqiZTEPVrOPeFXYnZ2lndkW5LW
         +Yw0agOyD3lVGD0iBwa/VCO1fLmRXXLf9Y9WF+SsLNwq8F/aBjTHrErwwYdilhcMws
         oEvPCzirQdkWUhBSctwjMpslKa8gx+LrTwJiecPhx2k9+6BraQEAnnakJW6BwVfaIs
         UlAN/3afueXaxt3zvnB6uxM8cziWazM5aYDk2wQNsno/LkNXBUq4Uw/IyWXDxszToj
         WCTINWWfiMQrQY50mYky7oeouYdr8jqGhAoj/Rpj0dsOUIeOBeo6TygwBSy+Zm57GV
         4/nGXmC14RcWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3EE55C43143; Wed,  8 Feb 2023 13:54:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 08 Feb 2023 13:54:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-pmpW7hSuUo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #26 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Thanks for testing. I will send it upstream after v6.3-rc1 is released sinc=
e we
are pretty late in the release cycle.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
