Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266AA62FECE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiKRU0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiKRU0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:26:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5C4663FB
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:26:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CB5F62766
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E19E4C433C1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803203;
        bh=Ml3Z5+ws/bUT0Mi82bO8lkvf6ttWzvoiNTymFZf1beY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aneBnpOxomSgn3SK6oYojxHT8+CUFTvi5YFS5CBKmo3xOj3Y7OSuSZcdqQtu436jc
         xVuC0s4+e/rGZBS+3hXxhTf9BWwJw8v+lR2QHrKGDEcjHhj2sD4mQhNtspxW0FqBbm
         LCHWBBh3LJGgWFO6JszTZ946qC4vK2q6kARFWiIyA08XkgaOAT+q5bQ+SkAPyHAhHh
         9cPbJLhjpjlMd2FjiKYvvJIX5m3uf9OnFbWP2O+GY8pjXl3lpzxdIXLKpNWCfOjLVc
         e9rTthqNXejZJJnu2D5+gAkwG+OgnAMR20n2L5noypkWOeTRPEAgO3F5fwKFxFMU+J
         eO1SXM5sfxp/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D0F10C433E6; Fri, 18 Nov 2022 20:26:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:26:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216706-208809-4KA04RrsY3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

--- Comment #6 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303224
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303224&action=3Dedit
otcpl-lenovo-tix1-tgl_freeze.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
