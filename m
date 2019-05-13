Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2931BF6D
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 00:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfEMWZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 18:25:20 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:44242 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfEMWZU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 18:25:20 -0400
Received: by mail-pl1-f173.google.com with SMTP id d3so7160631plj.11
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:user-agent:mime-version;
        bh=+E/rNcQej0hkhrGIjq1bC3pNien7D/CRbE8Cnop8XpU=;
        b=2GoruObEtrYqQ+Ln4R1IKGn3FkbeZJHYgzGML0ZQmJWzwBP0EhobkD4/cZXH5V5X8M
         HgYRLYNi9p/9H8EUB4zOhV+HQXdA9yz5MDGLz+E/4lD7as/dRmgBUQrKwhRJ4RWLQFlR
         5dxmSQXBiI2w02ORYHcVrjmhScaUMkO5Nh7o8JeQjehEXMToHA8Y2GMjnFnXsun/bIUq
         ZBiYNxIpwQUoBGWAEv4u8ITTTJzFOcRZW1YTltsW2wvBcojOOfbPjwngkOSXvQnQ8JxK
         EMyFNbyhd/MaCQG33vlk5Sx/YC8jW9Rr2VE9pH5K1EHLcd7JWvAccLavEq8ySMPR9677
         FAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=+E/rNcQej0hkhrGIjq1bC3pNien7D/CRbE8Cnop8XpU=;
        b=lwu9yJWq8r6DWYuz7qWzSsHhnRWFcGBGiB+plzWanI5aFuILqJwD9AchXSDp9JsHtI
         UuFHYULyAzJMf9UyLMHFOl8wgV7JsMi0XWIK2a6UPj7TedPR7tnTQH1PD2H+JvXtsrAN
         u3J8+7PAQ1rC9QaKtY2+M895yGsO3mUlYJ+iMrEjAWUZ0WtPFbg0TNQM9+CuAtz5itC6
         ocGSmSQil3N21VLjUJiqZZE7YplEySC62KsoEVcWzonW8HoPksRjdrEQHjm2nluFiXw/
         zwOhSxlbzolyJUEAEhbVCnUXi7V5czR9pTLv8AYVYq2xxeywe7qMYuGEZtOetriDVxYi
         T06A==
X-Gm-Message-State: APjAAAWY751d6yUR6lKpmToILhtCqe1KMsryfKK/1frx21PDEHK00aX4
        mi8MJeGxox2xwJxkQ5Yk9Cm17A==
X-Google-Smtp-Source: APXvYqxqb2qz340dPusi1hripn1ehROGDJeQFf54W9iI9JH7opjmI/TsuLBnnR/W2/xj4Uh5qx1l9Q==
X-Received: by 2002:a17:902:6b82:: with SMTP id p2mr33009307plk.99.1557786319004;
        Mon, 13 May 2019 15:25:19 -0700 (PDT)
Received: from gnarnia.frontierlocal.net ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id o20sm15044261pgj.70.2019.05.13.15.25.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 15:25:18 -0700 (PDT)
Date:   Mon, 13 May 2019 15:25:17 -0700
From:   evan@gnarbox.com
To:     felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org, rob@gnarbox.com
Subject: [BUG REPORT] usb: dwc3: "failed to enable ep0out" when
 enabling mass storage mode
Message-ID: <20190513222517.LT4QsTQlr%evan@gnarbox.com>
User-Agent: mail v14.8.16
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=-=MWrspTEZ1c2SSlKHhaiiPIvbjvJWc30zTfCY=-="
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.

--=-=MWrspTEZ1c2SSlKHhaiiPIvbjvJWc30zTfCY=-=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline

Hi Felipe,

I'm picking up a bug my coworker Rob touched on in this thread:
https://marc.info/?l=linux-usb&m=155349928622570&w=2

We occasionally see the following dmesg when enabling mass storage mode:

	dwc3 dwc3.1.auto: failed to enable ep0out

To reproduce after a clean boot:

	Enable mass storage mode
	Disable mass storage mode
	Enable mass storage mode

I don't need to plug any devices, just switch modes.

The error does not happen every boot.  If I don't get the error on that
second enable, then as far as I can tell I won't get the error at all
during that boot.

I've attached the trace and regdump.  When capturing these I was running
a 4.9.115 kernel and using the g_mass_storage driver for simplicity.
Here is the shell session:

	root@gnarbox-2:~# echo device > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role && modprobe g_mass_storage file=/dev/nvme0n1p7 iSerialNumber=90405
	[  118.627628] Mass Storage Function, version: 2009/09/11
	[  118.633426] LUN: removable file: (no medium)
	[  118.638283] LUN: file: /dev/nvme0n1p7
	[  118.642397] Number of LUNs=1
	[  118.646080] g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
	[  118.653902] g_mass_storage gadget: g_mass_storage ready
	root@gnarbox-2:~# modprobe -r g_mass_storage && echo host > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role 
	root@gnarbox-2:~# echo device > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role && modprobe g_mass_storage file=/dev/nvme0n1p7 iSerialNumber=90405
	[  123.416789] Mass Storage Function, version: 2009/09/11
	[  123.422546] LUN: removable file: (no medium)
	[  123.427386] LUN: file: /dev/nvme0n1p7
	[  123.431531] Number of LUNs=1
	[  123.435278] g_mass_storage gadget: Mass Storage Gadget, version: 2009/09/11
	[  123.443168] g_mass_storage gadget: g_mass_storage ready
	[  123.451998] dwc3 dwc3.1.auto: failed to enable ep0out
	root@gnarbox-2:~# 

I still get the error when using the gadget configfs instead of
g_mass_storage.  I still get the error on kernel 5.0.5.

Do you have any idea what's happening here?  What steps can I take to
help debug this?

Thanks,
Evan

--=-=MWrspTEZ1c2SSlKHhaiiPIvbjvJWc30zTfCY=-=
Content-Type: application/x-xz; charset=binary
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dwc3-trace-20190513.txz"

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
/NCxxGf7AgAAAAAEWVo=

--=-=MWrspTEZ1c2SSlKHhaiiPIvbjvJWc30zTfCY=-=--
