Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7764274325F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 03:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjF3Bsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 21:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjF3Bsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 21:48:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633BE2D52
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 18:48:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00EE161644
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DD0EC433C8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688089715;
        bh=1ercjega+N8EW4ObmMzVRLFRbCK5rMZHRMMi2djWRMM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MGBru96fyNLlNQpSzYiBPDwAzxgOzjG5u1KvgafbtmuhYb/GDodww969vd9tdI1uc
         7EL98OnCJhrzTyu7wQjLNZb9sShcz8waMUSBACLYT2W0362B1Te8VgtVEmQQf5TZxm
         /y//oP+rnEzzNK0v3oebqyHkX9GoleX9o1iTvgGPKP3/jR69dohweoUxr6Bl3FTj2I
         jXjTh449h85vi/4hgm6CKjlydduFWgM5KLrZc19+hs4YX//0lX6wB7aHT1NL95O4AY
         5E7Pe+hU7KyX69sRjIqBi86egCfKLqm6douz8HWPbVgdVgmWGTCPfchIvzeQna7fQE
         TF8DZUiqye2Ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4204BC4332E; Fri, 30 Jun 2023 01:48:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217613] [BUG] [media] dvb-usb: possible data-inconsistency due
 to data races in dib0700_rc_query_old_firmware()
Date:   Fri, 30 Jun 2023 01:48:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: islituo@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217613-208809-Cg6CFBWo3S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217613-208809@https.bugzilla.kernel.org/>
References: <bug-217613-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217613

Tuo Li (islituo@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #1 from Tuo Li (islituo@gmail.com) ---


*** This bug has been marked as a duplicate of bug 217614 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
