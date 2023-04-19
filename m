Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7BE6E7EC8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 17:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbjDSPot (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 11:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbjDSPoQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 11:44:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC07A93C9
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 08:44:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABE762048
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FF0EC4339E
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681919045;
        bh=k/H8fBS1KQg7oVIRmAGSb3+2i8kQYOsxM3y+bpW3Gl8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=btco8mGIwLfOi87AKuCqnwV3kFrWRMeBzs+Dzl4y8c1waxK4P7GZR6SukZDD+Oojh
         E2CfMHMW+o+FtBfhIpH+c51gJHyRboiY9QZH5IUj5+fSthTTVs6W1AAnq9dJhbJrPK
         N5mNKFAihQ7/nZHr3bSPv1fh0bYCl4UXZq+vyfQmGR9DEfEHRYgiKPG5daI/3QQxbc
         E1NkyzPshqC0LLkV9TjtrSxgNT4WwfOe5ggyYBgarf4jRU4amqIem2pOZIOtlxSyqI
         aRRkXFX+zo5qfncSK/GwuQX+Wc93VDiMc/Vj88Hl9IMcrJhaqJUQ7MoqqAEIAfflH5
         n3wDgVuMgV1rA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5865EC43143; Wed, 19 Apr 2023 15:44:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 19 Apr 2023 15:44:05 +0000
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
Message-ID: <bug-217242-208809-bvwiXfnyC2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #25 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 304163
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304163&action=3Dedit
Fix trb free calculation patch, goes on top debug patch comparing free trbs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
