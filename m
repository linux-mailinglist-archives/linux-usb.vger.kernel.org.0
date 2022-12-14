Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C2764CC27
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 15:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbiLNO1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 09:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238627AbiLNO1E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 09:27:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D2F20355
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 06:27:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A379B818D0
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 14:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5576C433D2
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671028020;
        bh=F40aXKMllqOi3WaSmdfZ6+ShnoD8TVZcuEX5yEPx4tw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fT/B63s9skieB7LtitckBFWZMnDEPLhrrpWU4t3d+WWEhogTFFbtgAiXTYlkuhkEz
         ACfZy99v4fesPqsPV04tECuF8SWPOLM76tuuptLRrbKt494vJTAbtW6r5ltUit6j9R
         crE7RzXrYeEXGdj3U2HyQ0Rw6ka+qruBhbuu8ZlQqfQocZypALn6IE0cspAjP2i9gc
         t0ekpzg0c9B8zXMXnDXZV8kc8MqSvX+5rBU2QAeLa0OeK2MoGK391kCOvlKbkaAa1y
         KYHf7uVGQ9VJs+FEmOwr/DHXFyEiMYMbL/rg4Kwusk2Sfq1K7X7Q1RDW5CxuaE/YTh
         RcYVhmFiOBaAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BBA5CC43142; Wed, 14 Dec 2022 14:27:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216810] uvc_video: 0010:uvc_video_decode_meta+0x29a/0x2b0
 [uvcvideo]
Date:   Wed, 14 Dec 2022 14:27:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216810-208809-gnfKjoT5rL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216810-208809@https.bugzilla.kernel.org/>
References: <bug-216810-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216810

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
CPU Model name:            12th Gen Intel(R) Core(TM) i7-1260P

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
