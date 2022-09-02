Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95F75AADC0
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbiIBLcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 07:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbiIBLcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 07:32:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F644D5719
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 04:31:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF6462099
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 11:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3AB8C43143
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662118270;
        bh=c5ECmi4CczGjLelGW5kHEsn0kROdVNSfE/iT2JiXDjM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Kz9nYZLNLxHip6Rztay7Il6RatXCol2U9iYP/Pd5xkvlGe86YYtPlGAbjwjghl94w
         HzR0leGU7Wk9xZxvqk2DNfRllPYFbVFg7souuGizRKuH+4Yi+/Qc6aSsV/DbCXY6N0
         aGtnG0QO3PBy0iE4C4GnVUuQtqGVx1ZChuJODIKFIlLy81DJssmO0TukKYumckYwbn
         fLAa+yCm3HAk+hJ0Bctz6zf9zVOCM2vqjdYOfoeXXsJodaZUx89bfoFXUDeiSYU0Lv
         3laWnXzPuLnX1eEJ9sNGL2RYYbzBHwlKYcuyIn6uWFRvEbmH11n4vElMa/0dSIrku4
         2HHVlQohtY3NA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E4231C433EA; Fri,  2 Sep 2022 11:31:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 02 Sep 2022 11:31:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bastian@rieck.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-AjO1ymhfXu@https.bugzilla.kernel.org/>
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

--- Comment #24 from Bastian Rieck (bastian@rieck.me) ---
Happy to check---can I just apply this to a current HEAD checkout of the
kernel? (It's been a while since I last compiled my own kernel)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
