Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E946D34CA
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 00:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjDAWMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 18:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDAWMg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 18:12:36 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24517AB6
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 15:12:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8A326CE06B2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6124C433D2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680387151;
        bh=SFdtBLnwGNmfbj7lKN9yBwJy2DB2Qp6tng7gX/MyBRU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qX5hlv1AXQseyUVQPB1z5ucNDwvDBhSQ/n3Wr4ulZSnqnrTSEslcq8Yg6K84hS3Hc
         NrIU2AI3W71PuS2/J7NmEdeOP/c7nChF35UNfvYHtXbMhdbR/9ZiUgcUl28I0Cnt5M
         kjL4FvaBHW/UGiyR/h8hfuneNoPeRvt9P+VSVJ4K/IKm3doNAZnz+tcobokPbd4Hzc
         ftCfnHfRTb5UhxzTIgcRkmh9/iuURq3Ry/YQJ0STwZMwMukUMVg9OzATOn7HbPw5w+
         LkeT44YzAe40jbljfgy4sl2bpAlMbf5UBi35D0IonFO95Bv3sBqlblKfK+U2EC3Ssh
         5y++BpISUWBzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C28D2C43141; Sat,  1 Apr 2023 22:12:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 22:12:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-6siBLbflkO@https.bugzilla.kernel.org/>
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

--- Comment #5 from Austin Domino (austin.domino@hotmail.com) ---
The setup that created this output is described in related posts on:

Ubuntu Forums ->
[url]https://ubuntuforums.org/showthread.php?t=3D2485480&p=3D14136903#post1=
4136903[/url]
and
Ubuntu's Launchpad Bug Page ->
[url]https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2013390[/url]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
