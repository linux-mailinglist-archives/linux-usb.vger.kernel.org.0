Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9ED4F2288
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 07:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiDEFVY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 01:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiDEFVX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 01:21:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D2E2F9
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:19:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 048CA6149A
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 05:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68849C3410F
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 05:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649135965;
        bh=WdgC2COU1GHpqM41Hkibldg1xVv3TLL3r+HWvCB8FUY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cgqyrui7zr45roLV+iNyGqNpsZYwyTC6UBABkC3SuJhtVbgKE0Hfd5U8ulUSM0Ks5
         YNEbFtfQ0bKtaHsVo0tCox5XhgC+4ewaxZjCIcd2YtCK06v4Xb9cY9NFQDwsFnJQT/
         yREIWat7qomyAYDEaKSHVJk8hVJc2Rermu53AJcxSNB4d+62t10dOXwymAxCYx0g5C
         P+e3hcuF+SGF0lRcSY2MyRAaQ0kvlVx/sP8/4/NPOvZPPBIuftF+y+H+O5O99DyvpG
         MXV6zcuCTT5WDa07FOt+a7cPNJtt09O/XkSfbzYJZT6PfAPsbvmLlUhgf6LTMNhHWE
         VCXqObLlopBzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4E7CEC05FCE; Tue,  5 Apr 2022 05:19:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Tue, 05 Apr 2022 05:19:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hch@lst.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-5eheVOeI2W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #5 from Christoph Hellwig (hch@lst.de) ---
On Thu, Mar 31, 2022 at 09:41:25AM +0200, Thorsten Leemhuis wrote:
> Hey Christoph, Marek, Greg!
>=20
> Below warning was reported to bugzilla.kernel.org more than a week ago;
> to quote the important parts here:

The warning is from a new debug check added in 5.14 under a debug
config option.  So while the USB maintainers should look into fixing it
I don't think it is a regression in that traditional sense of the word.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
