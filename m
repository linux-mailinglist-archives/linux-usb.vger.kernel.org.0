Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488CA68789D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 10:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbjBBJRt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 04:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbjBBJRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 04:17:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AC526AF
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 01:17:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9A4E61A3C
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59B5CC433A0
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675329466;
        bh=Zq1kOcPaGr4FlVIL9ZssDTqlFjQEGfeJUpkOGEgTgYo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fu9ei8H4BNmvlpmkScUL+GQ/8ySfyd1tEXNHUF5GIyiKEhaEW6ep/0GkcHgfg8qPJ
         pefpmvoK1JLqWgN12MZrEq71niT2LDmt6LAdp9iSuzpg8NXsWvZeeEVvA+xlJUnTbO
         exfwWF619xjMzDWTX+S8wvcpQ5Nws9455G4ttda7IxEBtw3HnsaI2XmzbJTHzqUmQ5
         6lJO9BXpvM5aoDS3+ITKa2R5t0CuIAYr4lvqPCiyGq0Djy9QcWgzPl0h7ehVMhaXPn
         b/xZdEyCXgTKlLZofQ5h9HUBSP1EBGICE5tNsvtZJMnOboVFc/RX9M83M+bX7D8A6L
         tPq5M6wM9mMjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 46D3BC43142; Thu,  2 Feb 2023 09:17:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 02 Feb 2023 09:17:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-q84kAT78e1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #17 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
The patch for this bug has not been applied to any tree yet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
