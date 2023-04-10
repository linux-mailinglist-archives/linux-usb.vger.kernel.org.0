Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F97E6DCA10
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 19:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjDJRex (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 13:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjDJRet (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 13:34:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5F910DB
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 10:34:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC89B612BB
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 17:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55095C4339B
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681148073;
        bh=ZeIEAoamM/Fkn6tJxtBHALofQ6gk0AsLawrYYRfMVHA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LlBPHib9DTJzE3+0pyjZM4UiUiYCJNa5JEVsy6YZMJSwaARSlitPwvgoTEldk1coP
         q2/bba9e07wtnxcXBHyDy9T1Xai/RE9L3Q05OPmaX3E9wuHTS2RnG0aD+RZCBiX61B
         QC0bl8HN8UtiyrIzmquLjycj1IYke5Dk5zNsVDxwAOEfaavGp9sOSUeyhWsMRhUh8i
         yMNzoIeqO70arj7cWmmaF0cA9tgWMLWFjgx5oef1CqsazbwHSrjtRbL3FbPHi7Osnm
         VKJLRWCBmQrklm75REkNSCasgJs7XY8+VnNyXS50W8f49z/H5UyNuS2jkQZN3TXgIg
         FKd5Iv/Xxm8Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 364A4C43142; Mon, 10 Apr 2023 17:34:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Mon, 10 Apr 2023 17:34:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-ZSNS0nWEaT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #13 from Austin Domino (austin.domino@hotmail.com) ---
Created attachment 304110
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304110&action=3Dedit
Exert from kernel log on system running 5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
