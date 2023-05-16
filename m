Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3B9705021
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 16:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233304AbjEPOD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 10:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbjEPOD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 10:03:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C5C35A0
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 07:03:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69AF560A07
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 14:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CABF9C433D2
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684245833;
        bh=L3E9DSx9jcqsJQpWhf6qfU3ED0rmQ9p6qLzo49tg7UE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pNQojAaJHLfm+Dy2XN8ix6MKm2e6hUIEG6mH0/BFZPux3Dk/b8vRGnJaHuxQATiT0
         pO01kTC44AHFcFMe6gROOW8cf4woBpX26z2hs61OMinFt/7JAskzpD0+AzsNNwqfyj
         fQ8E3GuWr2GHPKC5bqLXvQtya9kNeet3guVWYdS6AYA0B5F2kJkLC7k5CDyD22/hyS
         jVCRfiWULycTOHg9tRScXmv78vRnCinMAAZd5favM4yWfMoSZPHh1bWwd/U7JZ77T3
         xSdAiyQiiZMIR91xAHEyleivIuwORoZ4wHLuswVAlu3n/OLhG2NP0RuNaso259tzhz
         nHd9p/Dm/iXXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BB2FDC43143; Tue, 16 May 2023 14:03:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 208749] XHCI debugfs missing default endpoint context
Date:   Tue, 16 May 2023 14:03:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208749-208809-JsmQ30KqnQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208749-208809@https.bugzilla.kernel.org/>
References: <bug-208749-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208749

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #1 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Fixed with:
0077b1b2c8d9 usb: host: xhci: fix ep context print mismatch in debugfs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
