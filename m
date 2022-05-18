Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464E752B80E
	for <lists+linux-usb@lfdr.de>; Wed, 18 May 2022 12:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbiERKUp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 May 2022 06:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbiERKUo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 May 2022 06:20:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43548E91
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 03:20:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF49D617C4
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 10:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45CFDC34113
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652869241;
        bh=DRv+CIS8hrUbwkZFqIBQ+zQxdBOTl2I3kbhWVw2Fdzg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j8mAv2xhxAyPJFovlU/EzsL8I0ialVjozQm9q+kwpiY7aKAy2qF3tccZJviTBuONL
         rqrwD0ZEEY249oYzowWM7m6Py3HZ6ros08+DTF6wgAzNoK2nOtsOEpWKw9i83S2Y6/
         cP2um9tkRIF3UGzXWSwQANfMZj8PM3CQJ9hPv20bh+ReS6VVEMDo7+1YXuhSTdzmQD
         I2XIie0Fb5jCfUOPwE+HQlHN/pZJNKgQAQb3b8nPetCJC+7l8EYgiE3vjSW/tzAZz5
         30fPu04cwKTh415cfQf9w9xx1volQIjTzwQIm0Fnh7EnF0sfY39ykrFHxtN+ehwDOV
         kHqvXfn0Kk5WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1D7EACC13B4; Wed, 18 May 2022 10:20:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Wed, 18 May 2022 10:20:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yury.lunev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209555-208809-ygZnSHFFNp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

Yury Lunev (yury.lunev@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yury.lunev@gmail.com

--- Comment #34 from Yury Lunev (yury.lunev@gmail.com) ---
Hello,

>       hsotg->params.power_down =3D 0; //val; WA

This workaround works for me on Odroid C4, linux 5.15.32.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
