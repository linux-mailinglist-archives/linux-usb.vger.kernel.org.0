Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215466ABD96
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjCFLAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCFLAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:00:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087DC93FD
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:00:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B01260DF8
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 11:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A0B7C43444
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678100447;
        bh=88VtlVyqXjrL2Omzw1yWteFs/bnXePPMH3qoMy83Ong=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XhYnaV/V3KxPUk1lmkeK6okxq+9weR9MkV76o4W0GBsqmEkG7zv0UB0sONiS/qYs+
         hoFSWQ9v2kF8JB95ZKn1gnOMwDSgQxJVqFb4sJcRs0dinXuUTCyS8pnY5mfjNngfBM
         agEyotGznSEAw4m540t44Gi4VwV4hc6OTqV9loE+4W0KrGiECY56N7QMn68C2+nVLG
         ULPBAnVm5DISfi7NWlDzeBBANCUgeFrR/LfTGGfnJJBj7WDaNGliD/cQSij/xxSKCk
         s5Ze1R6MOGMQkeEBwShLUWhG2xzp3EsRmtKapEqUn3D3GL/tLkXCXnG3lNh3anxnAD
         l9TGe7YMZEL8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ECA2DC43165; Mon,  6 Mar 2023 11:00:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 06 Mar 2023 11:00:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-sJUtelL5ib@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #50 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
(In reply to wyattb from comment #49)
> Any chance the reason the icon shows plugged in when it's not, is because
> power supply always show as YES whether plugged in or not.

I'm not sure that problem is related to this one.

I don't think your kernel has the fix for this one. I don't know to which
5.19.x release the fix was included, but it definitely is not available in
v5.19.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
