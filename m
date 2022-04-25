Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3637A50DE5D
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 13:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240581AbiDYLDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 07:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241602AbiDYLD3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 07:03:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10E38E188
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 04:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4287260F75
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC3A6C385B0
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650884424;
        bh=O2Yr/85QU5FppSsC4Rp1Si8w/X2IjZaWfj+0NT8jDEk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bGXz1+T0x61HAJSbbpYirdPtmO8vrQGcVFekV6I4LFRkjycPu5Mx/I2sP/+s6+UXA
         HpLIFm61AH326ICjUPM/zemRF2BCh91BJYBdOY18n8y25EOOdhOeLPWCEZPMuzPFCN
         wSoULPnoLCBfZez0/HRWLMrpdW8Xwos09wHd6DYy839EQavRGBVTdSJTib5qNUJlHm
         nCQeY6HFXpxgY1EJ5jAkpbyi2AwActrEqeFbnH2Bljc10q6VPQnZL0wpFN05TqbPXc
         DUryVpQkiElVKomwJ7ASzbdwwS3T/kTpOu0F95xeuWtECFr7HdyeyP+49AXElhjvDg
         Acq6W9pogJO/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9B7B5C05FCE; Mon, 25 Apr 2022 11:00:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 25 Apr 2022 11:00:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xy521521@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-F9dloCJXNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #25 from Hongyu Xie (xy521521@gmail.com) ---
On 2022/4/25 18:08, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214021
>
> --- Comment #24 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> (In reply to Hongyu Xie from comment #23)
>
>> Reapplied on linux-next? Haven't seen this on linux-next.
> As I said earlier, I'd like to get these patches tested and verified by
> someone
> who can trigger this issue before applying them.
>
> Can you help me test them?

About to do so. But my kernel is little old, 5.4.x. So I had to changed=20
it a little bit. You can see them in the

attachment.

>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
