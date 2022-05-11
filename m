Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FE522BDB
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 07:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiEKFod (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 01:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239352AbiEKFo2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 01:44:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE54244F1C
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 22:44:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C20B0616E8
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 05:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31A72C385DB
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 05:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652247867;
        bh=OsdFX9ube3gQu7MAiOi9gA44saYU+V3GC4ROt5yp+D8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=flbN0sspG2oRpPg/JyicEJauMpw7tzFI1kjGvi6ttG/rKpNB5n4tgO0uEXWulWA+7
         XsJCexh6cOYMO4DctCYMg1sBa1s+btk1xzMdKEEy2zSd9R5pkAJsfQPi4uy6WkEXnr
         tF505V1JnJtqTx2Yns84eQQ1jiYYgmtXJuvW8/5Co5smTBr4LkGSZinXG7rcPz8rkT
         ZTqbJA7DcEoAsELpGpz8an9DlOXlv9A4unqjE2Isv+p8dwQw646s9TyVlnQSucAvAq
         xlzmxRe24S/53EiZyhFjZmoF0vuJ47Ir1wwaNHy3nQ07xjK0Es0T7zybMoxLdlsHbw
         T+oTBcDF2Xm4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0FF88CC13B2; Wed, 11 May 2022 05:44:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Wed, 11 May 2022 05:44:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-s1haoj2Uc6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #6 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, May 10, 2022 at 08:50:40PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215890
>=20
> --- Comment #5 from Satadru Pramanik (satadru@umich.edu) ---
> 5.18-rc1 has the same issue...
>=20
> Is it worth bisecting between 5.17 ad 5.18-rc1?
>=20
> Maybe there are obvious suspect commits to start with?

Yes, please bisect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
