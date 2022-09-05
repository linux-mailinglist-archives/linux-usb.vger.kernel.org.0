Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1705ACD5F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 10:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbiIEICl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 04:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbiIEICj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 04:02:39 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7504548CB1
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 01:02:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 31E2DCE1064
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 08:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 583DFC43142
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662364950;
        bh=zzv+rVwPY0WDEzqxo67yeFzT0f0GzFntIW3r3CEwApU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MBU4nodNVH+qjqWY5d2zFnqIS/YxLhEd4TIQB23kxst2N4zWaZwsmXGeNJT7nnauw
         8ZM/a3gc8aTG1N67G7BsPQvOaBWS/PT3LQpJBlWTzQTNzfAS5pgz0Ow4BVsb9x8Dyc
         f97YTLc4OmGtzoxPbB4+/BCrq5CrNNW8Yrn2YOXDP95K1gpQxNBTkNeVy1EKzMSqCk
         jWUscxbJ2QKMcjcHdYW4Y4aGfsIVdCRsdz4BNlj7lRyv89v3nb9VIfWBhMRzn7fENp
         hblEaMNBi5CCKx6HpXH0ol9SUMvyNbJQ0LlsdFxfPPxQZAihej4vOjFaVpQzSHb79T
         cMRp5NmvTLrpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 48B46C433EA; Mon,  5 Sep 2022 08:02:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 05 Sep 2022 08:02:29 +0000
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
Message-ID: <bug-210425-208809-RFStTKURQh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #27 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to Grzegorz Alibo=C5=BCek from comment #26)
> correcting the problem occurs on the dock: Lenovo Thinkpad Ultra Dock 40A=
J,
> in journalctl i see:
> sep 03 08:33:25 kernel: ucsi_acpi USBC000:00: ucsi_handle_connector_chang=
e:
> GET_CONNECTOR_STATUS failed (-110)
>=20
> but the main problem seems to be resolved

Okay. In your case this bug may be just a symptom of that other issue. So my
patch may just be a workaround in your case, but how about the others? Does
everybody with this issue see that warning when they resume?

There is another report for that issue. I think it's best that we try to so=
lve
that first: https://bugzilla.kernel.org/show_bug.cgi?id=3D216426

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
