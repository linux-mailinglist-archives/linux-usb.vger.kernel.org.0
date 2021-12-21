Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15B747BB78
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 09:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbhLUIHk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 03:07:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbhLUIHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 03:07:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D633CC061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 00:07:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9BFD3B811D7
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 08:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B13AC36AE2
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 08:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640074057;
        bh=stUEuPAg9JGuYo1coDuLtuQSmONB9GGkW4GAIYM9fOQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Tfoku9EzgYCrNJAigWo89v29EVDi+WPEJS0pEUjuwhCXH9qhA5tf2yE0rftXmJLOb
         IvFqO0+U0SbT7rRZR/SYC9kk+nX7Nt27tTv7WwCLuWaQsYeof/CG3fTdFwvKetHZWe
         ML6pPe3ryaR4m0NYr32fpHG4hctgLBjJ7uSIpwHmxyN+RuzgHfH4Ui9NqyR87O+tw4
         DQoU0CHRgcTSTUI+wJbVfube4pQpVhsmGWbVCDMDgGXX7u8Nc3rt79bGZWt6HWgRgC
         It96+vLZvX+47I0VJsGf/liEBbcZv8pJognY3GBX79AhEWMvTpSRreuEB7KauK/izC
         /ePw34BbRspiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3EB2A61106; Tue, 21 Dec 2021 08:07:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Tue, 21 Dec 2021 08:07:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-UcLCp9zH1m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #4 from Ross Maynard (bids.7405@bigpond.com) ---
Hi Greg,

1. I tried connecting the SL-6000 in kernel 5.14.10, but got the same error:

usb 1-1: New USB device found, idVendor=3D04dd, idProduct=3D9032, bcdDevice=
=3D=20
0.00
usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 1-1: Product: SL-6000
usb 1-1: Manufacturer: Sharp
usb 1-1: bad CDC descriptors
usbcore: registered new interface driver cdc_ether

As a side note, I also tried it with my SL-5600 with the same result.

2. The latest kernel I could find that would connect my Zaurus was=20
2.6.38. I did get the "bad CDC descriptors" message, but the zaurus=20
module loaded anyway:

usb 1-1: bad CDC descriptors
usbcore: registered new interface driver cdc_ether
zaurus 1-1:1.0: usb0: register 'zaurus' at usb-0000:00:14.0-1,=20
pseudo-MDLM (BLAN) device, ea:30:12:ff:59:20
usbcore: registered new interface driver zaurus

3. I then tested with kernel 3.0. That did not work, and the zaurus=20
module did not load:

usb 1-1: new full speed USB device number 4 using xhci_hcd
usb 1-1: bad CDC descriptors
usbcore: registered new interface driver cdc_ether

I am wondering if there was a change in the cdc_ether or zaurus modules=20
that caused it to stop working in 3.0.


On 20/12/21 7:37 pm, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>
> --- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
> On Sun, Dec 19, 2021 at 06:14:00AM +0000, bugzilla-daemon@bugzilla.kernel=
.org
> wrote:
>> A 'bad CDC descriptors' error occurs when plugging the Sharp SL-6000 zau=
rus
>> into USB. It was working in 2.6.32 but has been broken from kernel 3
>> onwards.
> 2.6.32 was released in 2009, and 3.0 was released in 2011.  Can you
> please try a more modern kernel like 5.15, or ask for support from the
> vendor that is forcing you to use older kernels?
>
> Or, can you use 'git bisect' between the working and failing kernel
> versions to track down the offending commit?
>
> thanks,
>
> greg k-h
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
