Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636CF6F8992
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 21:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjEETjq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 15:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjEETjm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 15:39:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCFA3C18
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 12:39:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 81B6363066
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 19:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2440C433D2
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683315570;
        bh=nx1cfOBa7I1DV7dL2JGa2W8XyBpXv77ohcV6DTYNRCg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YZuyJdBw3d+6GHh8QT5KvZimjRm/xiYGPOFiIFW+Xy3O1oI/pBnaU2FX4twGh21jt
         5oFycYFAqJSCN5S8W1B1c2p1Xkpvv2utp7pS0ur6V+QYirU2O/R6NZiHXzKmQ0OIhS
         9hPms0qYKckFarlvEkw7lDHK0DwjIJA610epCTtIiCQZKaDwx/EAtRFNFVkG1Rcrcw
         MbwMUtACWH3mPWGXhwXXZD8QBUj/bru//h3gOGM5Og2kktgPvZWkTJ7FlKQg4O5UtC
         wen7fB4MCuhjmgOw8CMSCAa3Los+rXAboYCsIqnIF/uNHdsTXZUpm3qocVVpMLpB4s
         8Ao3btCHwvNIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D0389C43142; Fri,  5 May 2023 19:39:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Fri, 05 May 2023 19:39:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kubakici@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217399-208809-71IO3So6Ox@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

--- Comment #6 from Jakub Kicinski (kubakici@wp.pl) ---
s/Bernard/Bernd/ apologies

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
