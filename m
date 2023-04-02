Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D396D396D
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 19:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjDBRZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 13:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjDBRZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 13:25:38 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEE87DBA
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 10:25:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 91A27CE0B09
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 17:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C385FC433D2
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680456331;
        bh=ti+F+jgB6K7eZfLzXDcWTdz9crOjuz2TMmTBIrgb0tw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n1Z/scji086mIfhQo8jTUS7OKChHiDayHVNRLBMcJBP6U60CmyzDrE+7EhDUM+4IF
         WHE+GiUdSzdL60KQt+jeWI84szHoNyxLISPIYQBKA9ns48fqtlfLrt91K8ny7lgFvL
         pnMq+fNElbydY0oDYjBPDCJHvIZR+ohbwdSzkPQS4WbNgRvRkjxdUQACElcXdbIMdA
         y/YShdycNKofG2Xc5oyUoQovWADYWXPXj4NGPcUq/GzN2OwB5kVihzPFq+uKAXS79P
         RQNEHMXhuRz7VdEbPThkbl4/wL/fPialxe6fFj/Zse6UcaNj02tl22OLv4Ji9oLgy7
         73WgVZ/q/1nBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AB8ACC43144; Sun,  2 Apr 2023 17:25:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sun, 02 Apr 2023 17:25:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-h7EG9olzLh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #8 from gregkh@linuxfoundation.org ---
On Sun, Apr 02, 2023 at 05:54:18PM +0200, Hans Petter Selasky wrote:
> While that being said, I wish the Linux USB core would take the example of
> the FreeBSD USB core, and pre-allocate all memory needed for USB transfer=
s,
> also called URB's, during device attach.

Many drivers do that today already, which specific ones do you think
need to have this added that are not doing so?

> Frequently going through allocate
> and free cycles during operation, is not just inefficient, but also great=
ly
> degrades the ability to debug the system.

Based on the slow USB speeds, "inefficient" isn't anything that I've
been able to measure specifically, have you?

> USB is still quite essential when doing remote server access. Yeah,
> the serial port is great too, but one day inb() and outb() will die

That's what a USB debugging cable is for :)

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
