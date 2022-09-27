Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505565EC3C6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiI0NKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 09:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiI0NKG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 09:10:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0865CB2871
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 06:09:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A8F561984
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06CF0C43143
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664284186;
        bh=XnRE8IgsMweXUOdk//vy2QJnFhGOwqDn2Gpw1yBFt5g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CfrRjWfC79MHPK42ewOlLV1cJGDIz+8LzDRaYZ7qiq0zV9g9ggVYFZjZbPU6YgmgT
         MbPdhKBhmBsMBYkMmA6W5x0g0jEiJTdzUA8dtSzhzUHLn0OUAvQFXx14UCpKbHIEOK
         ywUXtQ+/Gt5pbAxp/dVWKM/TMH3Oe+ald+U6XUmyp0ic/99t/NZxnjRkLn2m5qew1C
         8M7WsBwAm7z3DTHGuMgFIErkkOeNbAkGrUMzEjEpoq40AOVhbyeFHEqE6LjqkQ4VEt
         sGH37shu970wGBcQiKJD+noCI8LKx1lQHnSXocjVymjs18d/0ZWc3vp1GSLi1ZznxG
         qdk8LeMaHgiPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E85B5C433E7; Tue, 27 Sep 2022 13:09:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 27 Sep 2022 13:09:45 +0000
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
Message-ID: <bug-210425-208809-z6GpGhqUSa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #34 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to Bastien Nocera from comment #33)
> I don't remember seeing anything, I don't even have the hardware to trigg=
er
> this.

Sorry, Bastian not Bastien:
https://lore.kernel.org/linux-usb/27257661.hdJqBvvX10@nimue/#t

The DisplayPort alt mode is activated (in the code) before the DP alt mode
driver is bound to it in that case. I don't know exactly why is that happen=
ing
- I have a theory, but I can reproduce the problem, so I can't test anythin=
g.
Bear with me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
