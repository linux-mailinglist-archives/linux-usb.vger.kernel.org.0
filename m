Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5C85F0AC8
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 13:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiI3Lln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 07:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbiI3LlR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 07:41:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A2A14095
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 04:33:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68D88622EB
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE971C433D6
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664537579;
        bh=wu/mqUww3JzUIuHnMzrpQZA/mEhZZH/z44S4g8ihwfA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=I4SOWPIZ61Ccy4Pp67uwSoMFrDRBQDdt5xSDWjl1Bu/WHPmdK2CTdHcSwUApvgjN+
         ZcIaPlZK6HpypkXgAC+CdejKt2O+90ai7/Cu7cRB/JGsedNSafcoS5kPQW31/RwlhY
         +4l0JiYEsBIKGgw+kitdV4OEgsPABamI4SyibYjoustC7kaMXZbLATABvvDR76BGtB
         IqKI3Gjwi75LHpkuvE7PjlojSoydyodxEhxz3c5NmlXc4wSKPG2uMfU4POaYo9lif+
         yW52gbN5ThUjBGxcNEaU9PGuWa4l9OQofZCBZ9YSyqE20NSlrVouCD5fJDTwznc6HR
         RkGgJiLcXFYuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AA40EC433E4; Fri, 30 Sep 2022 11:32:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Fri, 30 Sep 2022 11:32:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nazar@mokrynskyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216543-208809-yqtTFnt5d8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216543-208809@https.bugzilla.kernel.org/>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

--- Comment #3 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
> That's really an unstable and unsupported system, sorry.  If you fix your
> cable it should work properly, right?

Yes. And I totally understand that is not supported, the only reason I post=
ed
this is because it seemed to uncover some race condition in the code that m=
ight
be beneficial to fix.

> What about any kernel log messages from right before this crashed?
> There should be some disconnect or other USB messages, right?  Specifics
here would be good to see.

Attached full kernel log.

> This isn't good, we shouldn't crash when a device is removed, but this
might be an issue with some reference counting.  More log messages might
help out here.

Yes, that is the reason I decided to create a bug report, just hoping it is
useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
