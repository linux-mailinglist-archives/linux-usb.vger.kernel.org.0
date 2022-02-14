Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAB4B4DB7
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 12:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350011AbiBNLMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 06:12:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350100AbiBNLMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 06:12:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF5A657AD
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 02:41:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DCC16093C
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05CF3C36B11
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644835317;
        bh=lNil+2c2gJeFgkrk3KFFxUJhu/sp06DUPDLrrfKpFHw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IlIc39kMRv3Sy5qW8kl94LWzJL84Kzv2E7mJaFXBnBzdb6izSj9DN3jaawGFHjy/+
         xTR5i/wZLGjTWMl02CEIZyTPj5xYp42vhdiBHa/KKiczpm+DLiox6hUwuW6rqmXDGI
         iOUTCf7yfP4nT4Ts/HjSbrYy2GQMMkABBdznI3eIj8THXnv8hO5uc1HypYSNvvdHtj
         b03CEX2oMT9ckvKFBVzZzO0I+JsBHj8ynolYj3PKxWglUH+GF/rotkbTrKfEn0m6Aw
         aZXeVngL97Pl0dwKzGtusY0glVEG2yet0nqdYsk0exJ4/Sm7YJywK/dF6K64MmpNJ9
         Ky+Tadkfb0GQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E543ACC13A6; Mon, 14 Feb 2022 10:41:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 10:41:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-Ku7IJArVWW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #11 from Takashi Iwai (tiwai@suse.de) ---
The "X" and "Y" are replaced with some numbers in the actual output.  But t=
he
error messages might be already suppressed by the driver for some devices.

Basically this is an old problem that surfaced now due to the commit forcib=
ly
initializes each mixer element at probe time.  The patch like below should
"fix" the problem, just by ignoring the error.  Could you check whether it
works?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
