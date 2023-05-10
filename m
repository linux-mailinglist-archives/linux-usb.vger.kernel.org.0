Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77DD46FE735
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 00:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236324AbjEJW25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 18:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236300AbjEJW2y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 18:28:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CA130C1
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 15:28:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC43363442
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E05DC433D2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683757732;
        bh=a8sSYaqpLc7c5L7f8PCvfnqk6xUpJ9KSnbaRfkOpHWk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LLf5pURJQBw1Ez6WFPkKYso16FybFS6UMDuvj0N5f8YZMJLpuurwQ4M8ZFf3sDfS4
         +FWazJerJGomUxq2olD1AH1sD9VRFMoSQFfVFFryjmeUG26/JPG84xosuDGvx9kGFo
         H2TahVZWlVzcklx4CKjH20gPW8pJb2aYOQMMpDA2uXQgHkuqyUbeVNlNOQU47vAvKS
         SspbUJA7cfkKbTYt5okzT2dDHoU7sev68GGyqSdNiubRxhzxOSxyHNCHQWcV7FwQDO
         V6HOEZmV4fguJF9asbb/s+rv9k1Vr8HjDykCDtqBR/GZD5cUa5GDDjedrv8+GhiniE
         zY3Oa3aegiZew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 08182C43142; Wed, 10 May 2023 22:28:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 22:28:51 +0000
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
Message-ID: <bug-217122-208809-i2oMj31XMI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #22 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
OK, I will do that an dreport back if that particular commit also fixes the
issue with TPM re-enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
