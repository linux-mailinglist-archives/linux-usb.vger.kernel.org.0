Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1986FA1A4
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 09:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbjEHHzC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 03:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjEHHy7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 03:54:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884AC1BFE
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 00:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D38E62045
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81368C4339B
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683532497;
        bh=HTbTDq4wDTKEdsxrhZLo7i/wX0h4Vpylwu2MEBU6E2A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A+HYZ1+kivp30BmiqJKlAXXP7E9wUNOgBJY2ySl5eF+Fi3HzGkdwz3r1cuj9FX3wB
         mltCFGF0txAJa/xQ7nBupWwB4rh3UaCZ1QFy3LxZcQuti45L2LyZBWtzBTsquepzwG
         clka43ZHc2QO8+Y79JI8HO77ne/N7Mc0U2MLhA/NRci5cToCBE25Ne0Cu/aCIkzIje
         SpEjKQqtvkPMCWPv33VkhDwC6ZeGGKCFGXo2+rxybOReaSjliPW1Jk6ZqBYJr++/GF
         El3vPoIi7SMGdglJK155aMvw5dACGfDhZx6YcnGnWG6fp2L72Q2orpRsJDV66idYTU
         H3BNOIHXs13QA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6B465C43143; Mon,  8 May 2023 07:54:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Mon, 08 May 2023 07:54:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-8gcDDfh8VS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #35 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks for testing the larger rework, no logs needed.
Can I add "Tested-by: Miller Hunter <MillerH@hearthnhome.com>" tag to that
series?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
