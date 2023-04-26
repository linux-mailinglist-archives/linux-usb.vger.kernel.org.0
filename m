Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02566EF7AC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240838AbjDZPUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 11:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjDZPUr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 11:20:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8BF3AA5
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 08:20:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69BD263774
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC37C4339C
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682522445;
        bh=gN11STyNRQ8e+6qXIl4ULVaMVQfVF4PBCrDQyDmTpY4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PySW876Y67l+PdQDI3fiUoVnqK5rS507EPNXMfbGcolMs3Kv0irZUsEqfi+eQ1MIV
         qqftRw3jBfDracbX6nJQ/QvbMKgoouqqNJgi6tAf065hPvb3niint/TmvaKOghF3o/
         1LtFJAw/ZDQVGE//As/sW3ORAFhhuaMFhBm5Skux4BFfb74M3v+OTS6rdYqS6y+Lmu
         ongQ017JeUdsSgrPCxVwRYSRo9+/+DHlZ8Z9tJu0qdXJAlIDaCrpgZRj3/gUmJL+MP
         ecrXc1c9km7femyxxy7zhHlvomSDdgo2S6WBJL49JMvhqi0sKNMo2wyswl3zkMH0DR
         xE3Ye5EIqFQNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5C40C43142; Wed, 26 Apr 2023 15:20:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 26 Apr 2023 15:20:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-9nwWz8AuZ9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #32 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 304188
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304188&action=3Dedit
Final free trb fix for 6.4 and stable

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
