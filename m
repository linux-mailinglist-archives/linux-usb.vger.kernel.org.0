Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC025809CD
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 05:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiGZDHk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 23:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbiGZDHj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 23:07:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5A129CBF
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 20:07:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B7CFB811BF
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D11EC341C6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658804856;
        bh=V3QWoUh2kH3nWILDMyWtkpshEwysEX1j8aaXshglVu0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qtznXAeBkOKbzBAJfSTLlauf4tTxG/UGcbqFivcrMPbhMtZgIJ46eLG70iP0yZzOe
         TQd0XB/u9WjiqoRKsGarQMKMoI+WEb6vyV46Qs1pU7f3b9LXEEUMt5cTfuKPMcBY/Y
         Dcj3FUY+8rjYUykrndp8HcS07ShqyZfTJXVlRRLT7OaNlQ7RPJmqjX1uTcsyjk3gCU
         dP+69wGo1RIdjOb5H4LfJqz0sRZaC6ZLAR4AgYVUZMbF8Saq5hyIWcm3XAk6vBxI+n
         nqNqXWC2i8LEtDXq77YEToJmzAgDC5mirnCUpaPAWvj5yGlioIfNE1CCCyZdLfEiEH
         hgCmG/njIstZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F083EC05FD2; Tue, 26 Jul 2022 03:07:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 03:07:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-ZzX26DXjQO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #3 from audioprof2001@yahoo.com ---
When you Turn-on the USB3.0 to SATA controller,
electrons travel near the speed of light.

Kernel interupts the CPU very fast, betwenn 1GHz and 2.8Ghz
to detect & load drivers.

BUT... the Mechanical HDD needs time to spin-up, when is turned-on,
time to reach operating speed of 7200rpm,
Large 3.5" HDD eat more than 3Amps at 12volts dc to spin-up.

USB Mass Storage Needs a Delay, an interrupt wait to read from the controll=
er,
wait to initialize, until HDD had enough time to spin-up and read basic inf=
o,
like Name, File system, etc...

Like the Turtle vs. Rabbit Tale.

-------------


$ sudo dmesg | grep usb

[93862.823187] usb 2-2: new SuperSpeed USB device number 4 using xhci_hcd
[93862.844103] usb 2-2: New USB device found, idVendor=3D174c, idProduct=3D=
5106,
bcdDevice=3D 1.00
[93862.844109] usb 2-2: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[93862.844111] usb 2-2: Product: BlacX
[93862.844113] usb 2-2: Manufacturer: Thermaltake
[93862.844114] usb 2-2: SerialNumber: 000000000002
[93862.881811] usb-storage 2-2:1.0: USB Mass Storage device detected
[93862.881944] scsi host2: usb-storage 2-2:1.0
[93862.882037] usbcore: registered new interface driver usb-storage
[93862.885157] usbcore: registered new interface driver uas
[93887.950491] usb 2-2: reset SuperSpeed USB device number 4 using xhci_hcd
[94392.705178] usb 2-2: USB disconnect, device number 4
[94397.329093] usb 2-4: new SuperSpeed USB device number 5 using xhci_hcd
[94397.350234] usb 2-4: New USB device found, idVendor=3D174c, idProduct=3D=
5106,
bcdDevice=3D 1.00
[94397.350246] usb 2-4: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[94397.350252] usb 2-4: Product: BlacX
[94397.350255] usb 2-4: Manufacturer: Thermaltake
[94397.350259] usb 2-4: SerialNumber: 000000000002
[94397.353440] usb-storage 2-4:1.0: USB Mass Storage device detected
[94397.353565] scsi host2: usb-storage 2-4:1.0
[94405.460664] usb 2-2: new SuperSpeed USB device number 6 using xhci_hcd
[94405.481472] usb 2-2: New USB device found, idVendor=3D174c, idProduct=3D=
5106,
bcdDevice=3D 1.00
[94405.481478] usb 2-2: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[94405.481481] usb 2-2: Product: BlacX
[94405.481483] usb 2-2: Manufacturer: Thermaltake
[94405.481484] usb 2-2: SerialNumber: 000000000001
[94405.483318] usb-storage 2-2:1.0: USB Mass Storage device detected
[94405.483606] scsi host3: usb-storage 2-2:1.0
[94845.006638] usb 2-2: USB disconnect, device number 6
[94857.034440] usb 2-4: USB disconnect, device number 5
[96252.135710] usb 2-2: new SuperSpeed USB device number 7 using xhci_hcd
[96252.156665] usb 2-2: New USB device found, idVendor=3D174c, idProduct=3D=
5106,
bcdDevice=3D 1.00
[96252.156679] usb 2-2: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[96252.156685] usb 2-2: Product: BlacX
[96252.156689] usb 2-2: Manufacturer: Thermaltake
[96252.156693] usb 2-2: SerialNumber: 000000000001
[96252.160248] usb-storage 2-2:1.0: USB Mass Storage device detected
[96252.160387] scsi host2: usb-storage 2-2:1.0
[96618.800360] usb 2-2: USB disconnect, device number 7
[96643.705966] usb 2-3.1: new SuperSpeed USB device number 8 using xhci_hcd
[96643.726865] usb 2-3.1: New USB device found, idVendor=3D174c, idProduct=
=3D5106,
bcdDevice=3D 1.00
[96643.726872] usb 2-3.1: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[96643.726874] usb 2-3.1: Product: BlacX
[96643.726876] usb 2-3.1: Manufacturer: Thermaltake
[96643.726877] usb 2-3.1: SerialNumber: 000000000001
[96643.731430] usb-storage 2-3.1:1.0: USB Mass Storage device detected
[96643.731717] scsi host2: usb-storage 2-3.1:1.0
[97775.098841] usb 2-3.1: USB disconnect, device number 8
[97789.264277] usb 1-1.4: USB disconnect, device number 14
[109374.033610] usb 2-4: new SuperSpeed USB device number 9 using xhci_hcd
[109374.054547] usb 2-4: New USB device found, idVendor=3D174c, idProduct=
=3D5106,
bcdDevice=3D 1.00
[109374.054561] usb 2-4: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[109374.054567] usb 2-4: Product: BlacX
[109374.054571] usb 2-4: Manufacturer: Thermaltake
[109374.054575] usb 2-4: SerialNumber: 000000000002
[109374.056168] usb-storage 2-4:1.0: USB Mass Storage device detected
[109374.056547] scsi host2: usb-storage 2-4:1.0
[109399.212614] usb 2-4: reset SuperSpeed USB device number 9 using xhci_hcd
[109516.959732] usb 2-4: USB disconnect, device number 9
[109519.055610] usb 2-4: new SuperSpeed USB device number 10 using xhci_hcd
[109519.076525] usb 2-4: New USB device found, idVendor=3D174c, idProduct=
=3D5106,
bcdDevice=3D 1.00
[109519.076540] usb 2-4: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[109519.076545] usb 2-4: Product: BlacX
[109519.076550] usb 2-4: Manufacturer: Thermaltake
[109519.076554] usb 2-4: SerialNumber: 000000000002
[109519.078216] usb-storage 2-4:1.0: USB Mass Storage device detected
[109519.078505] scsi host2: usb-storage 2-4:1.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
