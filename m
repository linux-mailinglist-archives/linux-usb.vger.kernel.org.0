Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512374ED438
	for <lists+linux-usb@lfdr.de>; Thu, 31 Mar 2022 08:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbiCaG4D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 02:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiCaG4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 02:56:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D68E1350AD
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 23:54:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1BB3616E9
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66638C340F2
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648709653;
        bh=YeENTUHQJDE/S6BsaQX6ikKfUDQDUti3/uv2LCTU+T4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IemWm8Pe360l+xeWxA4bEPcJ/+WaCuA6+eBANw7K0g84IIzQ1ed+a1leY1DVTBw0R
         8Mc6xLid0ZLVoQSr9j2jndDr3ZauHUpLQ0kEDdQK+ITJUDxyBndSteBsltOuh7E7uW
         l66Bu3y/GetaPfZF+fl4dsTTZ0OhtDrKCeRlYHtAzg0Uhmjw51o+j/YJNO829CVk+1
         3GIr/mrJz/L1Gtm9MFgHewbhxeDNlcRf6UJOF8F9n8pZTT04b1IKYttfhm3L1IKcES
         8v8bxr24GwyuKbcJavWAAfVY+WAXHAh2Hb/aEpMGsguPJe2Om2X6Vnb3BsYpYgIHW1
         YGbvetCZQ/S3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4AB2DC05FD5; Thu, 31 Mar 2022 06:54:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Thu, 31 Mar 2022 06:54:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-QPFMeL6r6W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #1)
> Am I right in assuming this didn't happen on earlier Linux versions like
> 5.16?
Forget that, should have looked in the redhat ticket before posting this, t=
here
you state that 5.13 seems to not be affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
