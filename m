Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9D6A4D14
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjB0VWw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjB0VWq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:22:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A4F2410A
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:22:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB24D60F1A
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44B12C433EF
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677532965;
        bh=A/l6KakIIybtnXRghw7jIDDHjcSad3Av1P25YkJpQRg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RY7gk/fF27w4DEAuwMznIfFc0yG1vDQ1ya3NS8+kn3mJYqkq0i6t9XWfbpNs8iQV/
         Up0eatcdA4swcYFTSGcIh34GXjuiIyGf19+AcEZvFwT6v3Sg5vw3kgH2HkEoI1mSIC
         8hypNQnDx1n9SzPipBN5FjefWifGC+Q9ViJFRCs8X8PFspwV+3efyBEfAQdGcGrlgw
         aBM8Ug5vV7DdL2pGi56911BfuHKgEnwVxQ6x/5pCOh6xWHz8PIAMOA3lVlUjKkGung
         WFdO/94xjharMvIobxo2eby5aZ1eITdnhCHzJ6m0ZC25g0Ncj3GhCA0s2fRGYKPKoM
         FCjAIzNEBV3FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2C2FEC43143; Mon, 27 Feb 2023 21:22:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Mon, 27 Feb 2023 21:22:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217089-208809-vLprBTvgUS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #5 from Pierre Germain (pierre2008@gmail.com) ---
Created attachment 303799
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303799&action=3Dedit
xone 23-c kernel 5.4.0.33 lsusb and dmesg

lsusb and dmesg with xone23-c under kernel 5.4.0.33.
The audio device is recognized.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
