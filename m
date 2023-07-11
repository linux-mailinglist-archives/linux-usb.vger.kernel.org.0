Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABB074E9F7
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 11:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjGKJOG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 05:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjGKJOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 05:14:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EDCE7E
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 02:14:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B952A61411
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252CBC433C8
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689066841;
        bh=IELU8ZaA6mmi/oPVNNf7mOnh9oxlY8tL18H2MoJWPrE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qBqPSx2Ky3S3pTyX42IxTl3htmQa6cBmx3SZNMzLf0q/H4UPNea7o4ETKfgfsozpI
         YVOboE8sJ0/c+RRrit/x9mgAMjDJu3+Q5JLtNitzUsDTpn/J2E3CYdbvY7KlKVaSdz
         4OlCyNdNKPXfXnq9yni1hokYF0VHHF9dNNyJGUpEc10YB96CKbS5vzga4wRUr2ih9n
         1Fba4sSYnP+f3YAGZKvSqj91ZMj6Fov1rRT/G59jWlvYcGqI1Q5iUHPh8R60l0grD8
         wZWHylkIUrBYWC9sod+hTXZdUZRjawxQfHbGSbW7ta6IimQKZr+3dIK/grOQdScPEm
         woOlCcFxI3vZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 11A8DC4332E; Tue, 11 Jul 2023 09:14:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Tue, 11 Jul 2023 09:14:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217632-208809-pQCroPdLS7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

--- Comment #4 from Ross Maynard (bids.7405@bigpond.com) ---
Created attachment 304609
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304609&action=3Dedit
proof-of-concept patch

Tested makeshift patch and it fixed the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
