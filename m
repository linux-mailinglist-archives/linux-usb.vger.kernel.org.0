Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3814F94D8
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 13:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235322AbiDHL6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 07:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbiDHL6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 07:58:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2CC7DE39
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 04:56:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5721CB82A8C
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 11:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9878C385B4
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649419003;
        bh=HczfQE3vWSFDP66cbbbQF6je5sSn5i8hkPYsi4xkO4I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oraKp0RC63hEEcqMpQH5Zukas1p1Mj+mDlhsiWf+7UiLPNKIUELLdSLtGDOKv0ot3
         QljN3f7vflUBa1HX92VPYjDqYG70rTt3/2Gy+Wup8hSBOVpsV96g1jFK9T6UWnd6Vt
         qcnRySjGORHOPHGPyuU8gxJ244TC+8M/BTygpfbC2NOpACeQAc64MOL2r5m/BoVPyW
         FMItKivEv7EwfNtJR4p9IY5R7GdU6ynE5a6hy+Q7ePMvO4hYaIf1yFnZ/jFLO29uzx
         JEiGG87KFAZai8FnSjW7QiSteuOqzXsinRUP/BK04kXjnTXLNQT5uspGtja5+a1zli
         rx826//+X5bkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D356FCC13B0; Fri,  8 Apr 2022 11:56:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 08 Apr 2022 11:56:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214021-208809-WwABQonNzh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #20 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 300723
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300723&action=3Dedit
Patch 0001 usb core hcd: Add support for deferring roothub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
