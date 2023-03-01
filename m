Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1F16A7546
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 21:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjCAU1x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 15:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCAU1k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 15:27:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF8F37B6A
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 12:27:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B02F6142F
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 20:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5BA7C4339B
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677702458;
        bh=iHH9HcKwXYcd1x/9cmd69hSigWrw3FKooD18q/5p/Cs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aP7swFtsurTJhRMvYn7nUy6dbPC6liPbt9NIuxGBeklxvcrogISBCp7qf+CWzcJlz
         SBCURkacTV0pFPz1N6yp41w32XUNUyk8wGNIMO+c7jk1jymx5ffGIzOo2cOdstWwSZ
         44lDho0/25omu3jUl+TuALCZwtRRzT2KZBSSIFX1hz9xlzIe39EGFkFNSUBRl49hKD
         SA3VS1136trcUAUeduPSGvtOCUMfHdQcL9xHMAPN+dfJhhMs4wilOrKkaHQ5lslw3V
         Tji2cx6a/aEqCNphM8HibLx11nBftN7sOdr+YYITQSkUeG18CNhoUO6IkSyk7RsPBr
         /zyFh/nbIluqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C12C5C072A6; Wed,  1 Mar 2023 20:27:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 20:27:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-g0CcyQuu3u@https.bugzilla.kernel.org/>
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

--- Comment #23 from Pierre Germain (pierre2008@gmail.com) ---
Thanks a lot Alan for all your effort and good work. I hope you have a nice
week.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
