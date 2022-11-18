Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E56A62FECA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiKRU0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiKRU0B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:26:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF2C623A3
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:26:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED9386275C
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DA68C433C1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803160;
        bh=fbl+85hrTbgljb31pLLVdricZNt0sJw/VXch+TTJP0k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MQjvdmzouA348X4ZcRFJg3XoTcOtrApuJ9QJfNSxt38qdK5/C5lnoMVgQ2XvZrPEC
         TCFbCmq9meiX90mSQQvtRSJu2atjRQ3ZB6S2EcUoUuyhpxUFWzbVIEYXEHWJ8gt+PI
         tFRHqHiolm/fISlism7L1S7v1G/ThLsIXG36HCiHdUccIIsLSc60YAx1pkH3UoG2UH
         3fnzvfExntvtT5W//kTEZdJwjEYPmAPaKXk/aTZChfCmixQal6DCH82mothOp25CyS
         me2EWO0HVnnMMOvFuhW55j8p++RN9ZSBUDaYOntQId+g2nx1J29+ESdXh+Afxor9dz
         VqywCaA3+SwZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4F18EC433E6; Fri, 18 Nov 2022 20:26:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] USBC resume callback takes far too long, between 650ms
 and 1200ms
Date:   Fri, 18 Nov 2022 20:26:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216706-208809-boe5Dp56Vo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216706-208809@https.bugzilla.kernel.org/>
References: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

--- Comment #4 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 303222
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303222&action=3Dedit
otcpl-dell-9370-kbl_mem.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
