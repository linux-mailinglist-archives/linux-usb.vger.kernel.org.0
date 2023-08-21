Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE641783132
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 21:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjHUTUD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 15:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjHUTUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 15:20:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD88CD3
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 12:19:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03C876434B
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 19:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C0B1C433C8
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692645598;
        bh=0Zw11OriB+qoaKJ18iR/IHY6y8+TB9HJTYDcZjKz3Kw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RDka/CXhDAlsY1LQ+VIGM/g1P3ZtHzgxVPNZcpGIrKGBDKKHUm9ekrE/ZNu7yAZMS
         0LDfSSiprHU5NDPEfTp/HNXxg/mIW0jLMcn+PWblCxvz3u67nCDYJyubXJRVzNA/So
         SUk7xoGnLfSiIx94J78333InT6ObC2TT7G+Ef96SwVj8nr7wjM0+0SPg2OH2fgnRo+
         1RGQQdnwuqgz09RMLgxQM/U6mh8s6/tX0WmNmMkY6zF47yf84MKGcYxA1XXNQy0Af7
         ZHe80ZJahQRrkuJWXKJzb1qNsqdaiC6XdYJLZnI2SJiJWQ76tgZqQdfGDKTpOKKVOx
         7wCu1hXx/oHzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A700C4332E; Mon, 21 Aug 2023 19:19:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Mon, 21 Aug 2023 19:19:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.byrecki@techniline.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217811-208809-x0t444e7Za@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217811-208809@https.bugzilla.kernel.org/>
References: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

Michal Byrecki (michal.byrecki@techniline.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INSUFFICIENT_DATA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
