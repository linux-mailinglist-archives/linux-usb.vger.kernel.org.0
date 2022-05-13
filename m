Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D279525FD1
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 12:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379517AbiEMKhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 06:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbiEMKhm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 06:37:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520A260AAC
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 03:37:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15A04B82D74
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 10:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF0CEC34114
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652438258;
        bh=2JR+k0daEbp4PbyrbCIS/pJJ97vE4vZ6HxuurWw4exI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CXxpKiZJ1yoV98ZuOjmTTkfCpPkE0H/LNdDYEYZt2n3gJ18OStCRbX7njXuIXOXMn
         8dsvnAZdZm7YhnTqnZQp5Jty3BQOGxGfG3U7K0PCMfiSyVODJkIw3ZG/BzySYLVaxi
         AQHjNJ+aXAP/xjXWUqZnF28Kq/auDiKIQKRfo22xJ3mXanOqWhxrdFGjJ3g9aOt3rZ
         s3PXUPXzkcWsjLn5cQjVcjxacP63c8/mUuBkc43WN3t8Vxnhb1dZDtMo7OXojbJzMm
         ngxDLLMcriNha6QQKuhvRZrGwEZtZ8PYIZ7SLUHiruhv8x9dqMn6hlmdl23a+mOrL9
         oFZNGLMlTUTuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BD517CC13B1; Fri, 13 May 2022 10:37:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 10:37:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hch@lst.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-pejxoC7N5j@https.bugzilla.kernel.org/>
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

--- Comment #9 from Christoph Hellwig (hch@lst.de) ---
On Fri, May 13, 2022 at 10:24:34AM +0200, Thorsten Leemhuis wrote:
> On 04.05.22 10:42, Thorsten Leemhuis wrote:
> >=20
> > Linux-Input developers, do you have any idea what might be causing the
> > problem outline below? It's a post 5.17 regression in mainline that was
> > reported to bugzilla.kernel.org about a week ago, but didn't even get a
> > single reply. Might be some other subsystem that is causing it, not sur=
e.
> >=20
> > On 27.04.22 00:42, bugzilla-daemon@kernel.org wrote:
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D215890
>=20
> FYI, the reporter bisected this regression down to f5ff79fddf0e
> ("dma-mapping: remove CONFIG_DMA_REMAP"). CCing Christoph, who authored
> that change (I wonder if it just exposed an existing bug, but well,
> that's up for you to discuss).
>=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>=20
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
>=20
> #regzbot introduced: f5ff79fddf0efecca538046b5cc20fb3ded2

Well, this just uncovered an existing bug in the driver.  You can not
just dma map memory returned from dma_alloc_coherent, and this driver
would already get vmalloc memory on arm/arm64 platforms anyway, we
now just do the same on x86 as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
