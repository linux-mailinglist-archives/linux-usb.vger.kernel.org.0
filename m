Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA435686FCC
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 21:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjBAUmF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 15:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjBAUln (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 15:41:43 -0500
X-Greylist: delayed 554 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Feb 2023 12:41:34 PST
Received: from correo.ikatu.com (correo.ikatu.com [190.0.137.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483ED783E7
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 12:41:34 -0800 (PST)
Received: from correo.ikatu.com (correo.ikatu.com [127.0.0.1])
        by correo.ikatu.com (Postfix) with ESMTP id 4P6YW523WCzKmmJ
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 17:32:17 -0300 (-03)
Authentication-Results: correo.ikatu.com (amavisd-new);
        dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
        header.d=ikatu.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ikatu.com; h=
        message-id:user-agent:subject:subject:to:from:from:date:date
        :content-transfer-encoding:content-type:content-type
        :mime-version; s=dkim; t=1675283535; x=1677875536; bh=1RbS9hevEr
        X2sEHRvh25j5cZXd4C431INEiJL/m2rKk=; b=aiv1g1bkpL702J3/0wiFJJD4cU
        KoizA2Le8oZCMx/crYcLJ1VvxK4OVDmKmabozI+t9U9oImSm+HjVWjRMNOFSuqkB
        b62s4OU3jdlHFs8W6EIzLce/WPmoumq1Z4YYthDJoD9A2o9v+qxIr4cQFXdSMRsI
        A6YcYqejfCQtycmhc=
X-Virus-Scanned: Debian amavisd-new at correo.ikatu.com
Received: from correo.ikatu.com ([127.0.0.1])
        by correo.ikatu.com (correo.ikatu.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id hRVclPV51q8L for <linux-usb@vger.kernel.org>;
        Wed,  1 Feb 2023 17:32:15 -0300 (-03)
Received: from localhost (correo.ikatu.com [127.0.0.1])
        by correo.ikatu.com (Postfix) with ESMTPSA id 4P6YW31qJ7zKmkM;
        Wed,  1 Feb 2023 17:32:15 -0300 (-03)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 01 Feb 2023 17:32:15 -0300
From:   hector@ikatu.com
To:     felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?Q?Federico_Nu=C3=B1ez?= <fna@ikatu.com>
Subject: [BUG REPORT] usb: dwc3: Bug while trying to use a RF ID Reader
 connected to USB port
User-Agent: RoundCube Webmail
Message-ID: <707b75a4895e3fd898b3e516e562d843@ikatu.com>
X-Sender: hector@ikatu.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

thanks in advance if you read this!

I'm having issues trying to use a RF ID Reader connected to USB port.
The platform I'm using is based on rockchip rk3328. Linux version: 
5.15.78-yocto-standard.

When the RF ID Reader is connected to the USB port, the device is 
recognized, but it doesn't work. After the ID Reader is disconnected the 
XHCI does not respond anymore, and we need to reboot the system to use 
the USB port again.

dmesg logs when the device is plugged:
[   36.187404] usb 4-1: new full-speed USB device number 2 using 
xhci-hcd
[   36.307412] usb 4-1: New USB device found, idVendor=413d, 
idProduct=2107
[   36.314171] usb 4-1: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[   36.322146] usb 4-1: ep 0x81 - rounding interval to 64 microframes, 
ep desc says 80 microframes
[   36.344498] input: HID 413d:2107 as 
/devices/platform/usb@ff600000/ff600000.dwc3/xhci-hcd.5.auto/usb4/4-1/4-1:1.0/0003:413D:2107.0001/input/input2
[   36.409716] hid-generic 0003:413D:2107.0001: input,hidraw0: USB HID 
v1.11 Keyboard [HID 413d:2107] on usb-xhci-hcd.5.auto-1/input0

dmesg logs some seconds after device is unplugged:
[   66.634196] usb 4-1: USB disconnect, device number 2
[   71.647386] xhci-hcd xhci-hcd.5.auto: xHCI host not responding to 
stop endpoint command.
[   71.655492] xhci-hcd xhci-hcd.5.auto: Assuming host is dying, halting 
host.
[   71.678498] xhci-hcd xhci-hcd.5.auto: Host not halted after 16000 
microseconds.
[   71.685832] xhci-hcd xhci-hcd.5.auto: Non-responsive xHCI host is not 
halting.
[   71.693073] xhci-hcd xhci-hcd.5.auto: Completing active URBs anyway.
[   71.699496] xhci-hcd xhci-hcd.5.auto: HC died; cleaning up


I found some people was having this issue because of USB autosuspend. 
But disabling that functionality didn't help.

https://we.tl/t-84bf0EE0Fs
In that link you can download the files with regdump traces and dmesg.

Any help to solve this is appreciated! Let me know if you need more 
information.

Best regards,
Hector

