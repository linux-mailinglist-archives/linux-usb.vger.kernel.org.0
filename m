Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629E8701786
	for <lists+linux-usb@lfdr.de>; Sat, 13 May 2023 15:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238565AbjEMNwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 May 2023 09:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238074AbjEMNv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 May 2023 09:51:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEBD2716
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 06:51:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E8BA60C82
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B5DBC433EF
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683985917;
        bh=vIwZGOE09Ga43vHwPQdH+/st2rLCrvYgC4xfS6yJ+Hc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=syVw02Tb6ANKwBBTN26E2Kg0Ow+4n13VoCt8Y8QI4splxwaCj4XtAgq/08C6/Qdka
         vKprIGVY+D3shejsFVLQ867Ou02Xu5++TGOD1LBA1lpoOfqX4fY0tdpc8pHjabtCz8
         GSskjvEMgLmOVHQMqD0s2Xnh1c77ZLB+SpCU24g6FEYkIW7lmJMEtxu9gRs3GPf/mk
         seoT9xVUuunQSD5nZo7Tz2sOfi0qQc3RQlhS/PthPwCVzmxeoMJk6hoF42YwUkW9IT
         Idqnkr3S0aB7vnUFOw9elZy51hbZEvSXFh72YRzCL25zOK07kpmVg0Ak7bP/9BZkJN
         un0P1J4L3XL4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 529EEC43143; Sat, 13 May 2023 13:51:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Sat, 13 May 2023 13:51:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217399-208809-YiBoZvh695@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

--- Comment #8 from Bernd Buschinski (b.buschinski@gmail.com) ---
Hello, since I saw that kernel 6.3.2 also had some bpf changes, I tried it.

Vanilla 6.3.2: failed to boot
Patch + 6.3.2: works fine

Is there anything else that I can help you with? Something to test? Do you =
need
any additional information?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
