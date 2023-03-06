Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9C66AB97D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 10:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjCFJRJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 04:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCFJRH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 04:17:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8C9211E6
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 01:17:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 644A260A2A
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 09:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC102C433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678094225;
        bh=MvplivZ1upkhSNLAxVpk9/YyNy6RcsYk5+iSd3VY3Ds=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hFfO558wtHvQONCln4iD6DSw2nH3NLiWt+zhgd5An1+YZ3UZNIsZP4a+Ho4CoQS0s
         o8wDL3PyNXi6Jiohm/cfyNEPIkPPlWr51GD7xsImNKvwo0cmZV70lBOl9PWOZ9AiSR
         NkuKT0IrsekExQrFSjDm8A3bFxUXLh00NwHc1+iaGcFi4JU0/OTgtL75n1ylpLuh44
         EYT4TWTphvqOtLpuDpk5WtT/LGssnpRMfAZGVyNxo2sZ8deo0XGM7cgHu7LwMdojTr
         DKRZx546BOtnsc3ZC2Pt3jDkgGmlprzaAQx061NdzvC7X1df1L8k28ks0PtkPRinvB
         /7ppODl7zff6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AAE4AC43141; Mon,  6 Mar 2023 09:17:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 09:17:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-92mUhdt5lg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #2 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
Yes, i also checked 6.0.y releases, currently I have 6.0.19 running and the
error does not happen there.

So I guess it is not runtime power management related? You say there was a
policy change, how can I force the old policy on 6.2 to rule that out?

And if a bisect is necessary can you point me to some information how to do=
 it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
