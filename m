Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA564F1FB6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 01:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238154AbiDDXEH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 19:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350957AbiDDXCq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 19:02:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8C76D387
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 15:23:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 330DA614C5
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92833C340F2
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649111004;
        bh=zpIdsgqgvUetGGuop3Q3ZBb8q//Ea9kSatUwG8thAzU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kO0Wiz3Tu0ilm9GXB+aMmNfZ7X0f3s8Sn7kx7XhcOmaM4zQjGZx1a1T0M5tRDwZ/M
         NYQgXy/MAQWy2Pa2TWfUj89PvRElMsgTaPYsiIrgPJleRbzQdI52zOtu1BWjtyDVJt
         NktxOevwxUJt655qwkoZcZ4JKjmbuYg6vFzUIsbJA3rpA+CYVFigL8PVFXfjyXOnAK
         I/m2oQNuYnRdBFQMMxVd5nNhg2MfozeENqSfupuLO/0U+fU/Cw9VzVGZRujHBT4zNX
         RdUmH8i9HtyzVjR9+lsMvQVSpRwOjtxcbyszforoBd3QYH1Jz37AiwjtbH4+P6kwhf
         GTNRfc62iiUEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7D712C05FD2; Mon,  4 Apr 2022 22:23:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Mon, 04 Apr 2022 22:23:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: labre@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215799-208809-mTiqY69r3A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

--- Comment #1 from Manuel Ullmann (labre@posteo.de) ---
Created attachment 300696
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300696&action=3Dedit
iPhone SE lsusb entry, while apple-mfi-fastcharge is unloaded

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
