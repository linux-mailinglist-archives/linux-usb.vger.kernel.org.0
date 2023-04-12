Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F086DFF44
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 21:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjDLT5s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 15:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjDLT5q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 15:57:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23D12D57
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 12:57:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 571B7638C5
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 19:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD705C433D2
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681329464;
        bh=/WEh37+d6v2HD+FoZG/icob0xRgaIo2kKRSVRIb83xI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y+Q9k/5M9WUbDIkUOFLO1WGErF72GPjoXrUP2AQmPXeioI/OJ8N3cSlQQ8iZzqR9N
         QVH2AXSksmc/qpxy2630JL2UBV8tCAl+Fn5p1rQ9c1HKqDjzRry/aZuKPlSmhNbm2p
         DfNcV2tu81Y+AHR6nx1C4rCZIVuhfXQEu9ar099PNHGQ9RFXkdg/G6YOn/uys9JWH0
         01cIVYaU/DgbeZAFN3kaJ8Ic8tA73eKz1q9HfN5DMUAAeq8p4skrhHDLp7zRuyWc1q
         TAle9asZiTp3VfHr9Tvok6y8npgSyM3sCjAmgF69ZeSGpDbJ+alaUqhHZDjSjyO5hB
         NJnnfVHMutprw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC55EC43141; Wed, 12 Apr 2023 19:57:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 12 Apr 2023 19:57:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-Axmgo5BzHB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #16 from Hunter M (miller.hunterc@gmail.com) ---
URL hyperlink got cut - here's the correct link for the issue:
https://github.com/raspberrypi/linux/issues/5088#issuecomment-1241972882

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
