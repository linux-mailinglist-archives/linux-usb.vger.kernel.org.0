Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223E26F6A66
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 13:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjEDLvs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 07:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjEDLvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 07:51:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FE349D9
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 04:51:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F03B612BC
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89942C433EF
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683201104;
        bh=LMIzgvpLTiT70qmKX9r0AqmTgJznxLbu/TKzZ/rxR4s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KthjVm1KdmUPE8q9eTTQCKgaGiB0IEj1wWAd2vjW46omN+kWfzKXph9JTmi4E5MXf
         HgDC7T34cG9KX0LUGZTR2z9JgDcw6M6oVGK5dD/+j7gKSR6ex4PlkzeTYpCP06gSlk
         /INFQbNl51g0nlDLIFyBVl0ObyXNCeJC9O7EV7ISG51uAnVFE3+1KD5UOLC82Ch2uZ
         Y9X5d0KSqFgLHvFlfpkgv3hTylz2u9+cmQ8vvE1xDIwFdSJy5KKgpuaf+7xQVJwW8y
         soX7rM5WLDH8HjHInfUPeMnFtob1+TP/XkqVL89NC98HrbuvZf7rB0nfG9GwdMJfHr
         fZVCpmgaIU5+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 761B0C43142; Thu,  4 May 2023 11:51:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Thu, 04 May 2023 11:51:44 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217399-208809-Fp9HD5UcIY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

--- Comment #2 from Bernd Buschinski (b.buschinski@gmail.com) ---
Created attachment 304216
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304216&action=3Dedit
lsusb -v, for the the device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
