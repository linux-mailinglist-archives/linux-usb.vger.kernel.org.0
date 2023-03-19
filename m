Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D078A6C06A9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Mar 2023 00:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjCSXnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 19:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCSXnP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 19:43:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94AD1A66D
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 16:43:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 443A8B80CBE
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 23:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C5DC433EF
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679269392;
        bh=warv0vI1VIvIZU6rfLI8N7l9kyG4lLBCKtbD745m6yw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xe4mElpovoxdFv1V3mIdih8MH09ofrrXC9/eQjsAqstgJnvIGmKicI9gMOitVrWiO
         bZvAxUbf53opZi0BILrd/F2RFAVEcMwtDcvc29XATklOi/L+J89UeJBJrHdxeGVi9y
         L36H3DXuhDhknUeTpJ8epsAYKRac6XLV1C9vFtESHk7LbNGIH/5Msvuji6XroBXx/4
         XkU18ezrewqKNuzrTRQSTDIj63WZSiZpZLFbWRmb1OEGRNGHOwz285NkP+xLzK9I2v
         WbtIBBz8oOOGadMKphhLtyNGepH1GsrGh97aRbHEgRwL1mHfBXbo7Yv3cL6D260TO3
         X41aJthz18P7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BF5F7C43141; Sun, 19 Mar 2023 23:43:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217215] Oops removing usb drive
Date:   Sun, 19 Mar 2023 23:43:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edtoml@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217215-208809-OPOfkOf40c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217215-208809@https.bugzilla.kernel.org/>
References: <bug-217215-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217215

--- Comment #2 from Ed Tomlinson (edtoml@gmail.com) ---
Thanks for the feedback Alan,  I'll watch for the fix.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
