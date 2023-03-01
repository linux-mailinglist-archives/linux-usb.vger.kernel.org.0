Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59446A6F64
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 16:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjCAP0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 10:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCAP0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 10:26:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DF2BC
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 07:26:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED19611D5
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0358C433D2
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677684362;
        bh=yvL8EQVorxD/vIuVGSFdCkSmw4smrksZ9kYH1+fgwks=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ARRzAbV42FEFX07XR1KPYo3j0K9AEl9iIUBz3VS5fWHKoyU1QbVFzdiHUqub1Pjty
         s15lqjiVoogCTC652QvIcceY3TeuZLK7s9cz83L42XAXsB3xIuKCy5E2lvKar2Lsbb
         Nf0wo0Dk6Z64XmvZiBApgOHDmrIT9oFFfs3ab/nsq/dOEGl7otMMrduY17e+qSfAOH
         HccwdhKlgvVRE2VANzGkPHi+ESv1TTr3+KJBgzKEzEO+5ts//fh95PT0PoknrTtdMa
         QKDpGJ9UYaItVuioOv4EKFvuxt0rz8dRctha8zhouu3XvvZ3G9R3hWevbW0+RVCKaW
         a/Hc3eh2+fmpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ADCF6C43144; Wed,  1 Mar 2023 15:26:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 15:26:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-lyimTgnELz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) ---
In the meantime, you can mark this bug report closed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
