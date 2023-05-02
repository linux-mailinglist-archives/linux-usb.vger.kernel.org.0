Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37EC6F421F
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 12:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbjEBK7d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 06:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjEBK7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 06:59:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04864686
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 03:59:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A1C7611F3
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 10:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5CF2C433D2
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683025168;
        bh=gNQmEOE0/qnWCnzkN+sGhEMEJfckKVoZoDcz9I7K/G4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VuSxtayaQFxi8qnSiW1wGICkWgLEkAwypdL2VOBGk26+AcE5lbk2kg1w+1dpTYINE
         +24myYv2DvQLyvwOndaaN9gqByjgxhBgAMvAFG/SzzEwESP+tG1QVx6/3DocliYsIV
         +YiEkxGhngiitMjL178Zk0vbTn7ZLQWkkF074Az/puTGhLAP/XNvVc+/+sMozeoiLu
         fR/3YBZqo+n1idAtRNv9bYVJHOSD3Ly84dAVZcqegX3UjOapQ2Ra6J2uSRfvEdbXq+
         XtOGJro8BmqU6ViJpnMmfDUi7cE70m6B54hxSMhXqUf4qBCnjHur7jf8FmyHwrVmKj
         5dtcwZZ/9gJLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 982AFC43142; Tue,  2 May 2023 10:59:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 02 May 2023 10:59:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dev@kicherer.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-eTD2L7qJgD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Mario Kicherer (dev@kicherer.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dev@kicherer.org

--- Comment #28 from Mario Kicherer (dev@kicherer.org) ---
Are there plans to backport this to the stable/longterm branches?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
