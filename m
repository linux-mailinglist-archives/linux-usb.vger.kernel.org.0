Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22872503AF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 18:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgHXQtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 12:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgHXQsp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 12:48:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62977C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 09:48:44 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t14so8818516wmi.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=SHQD3xjOvqSXNqqegYvOSQSofcnAseNtopAf1bw4XZs=;
        b=SS3Vj4seWjgEHL0b2SJA1t+z7fR9dlYt4dYz1mbwcewoh7q+DL0KHbE3WDFpLCljom
         5mDZXijvHaDFcGmbDxHHTqW+2s24WLHJe/2r20qUAN9qHX/J867kc9Y6nceJGUrtNVA6
         lbZxATVGYbBoxvUH7hw/uLMSDnaGZYVen9ZGYLbDA+d1m70S3yHJlQaOvJav0cEAXtzj
         IO2+HC02oDnDWJJIkqFfBXtmzXO7x2tvgj1VK/7aLBAr20aU0wZ9jRLPXiDDmLBEWL3t
         Rdj+f+pIXxV72RFNwOPpap/mx1O99ZX9XxOP+EWnhamOUwfMxEJQ3inh0ct1+0MplzJA
         kmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=SHQD3xjOvqSXNqqegYvOSQSofcnAseNtopAf1bw4XZs=;
        b=PVNfaAMuW2OyBvbTqxf0xtyTtEePMOG+HChLxuV/n9NlXazD3YMNrDfqKX5vxvxSQU
         OGLQ89owtNbM9OPlGZUqkHhYjMGubOfAtumNcuGENAY44t31NnJPFXHKKQYikrDy7Hu9
         nrDMjRv4y+VB8h4WSz1itvtEIOT2BDw0MD1UgxjgSv1Na4iVCKdT5wNQfha9WLNPfl2S
         hSE8UaDKysaDeMg8zmdbNv1g0PJslqyP/WmX+QgIFiss8v1/iYmfhWhX38ftQLIwiP0O
         DnzHWY8PIp2aadoMuHJBi1C77auCfo/RmchhR87siTyT1Lhh6Fkt4I6p84991UAh29Zc
         6Pbg==
X-Gm-Message-State: AOAM530m1W549bS8Sepql9gG2mNFY64UjvmS9Tf2fTE/AGqYRHM/RfnI
        b91uAUakhxqpcqtYHtdaPOmpq0BH45y16w==
X-Google-Smtp-Source: ABdhPJw0qpWBZ9R5SgPdekIzbGO5E3bPwVTJRTa8pmVJtMtIS6I/43P7LXfE06wDS46MfRlqEo7fRg==
X-Received: by 2002:a05:600c:2103:: with SMTP id u3mr211234wml.52.1598287718835;
        Mon, 24 Aug 2020 09:48:38 -0700 (PDT)
Received: from localhost.localdomain (158.204.16.93.rev.sfr.net. [93.16.204.158])
        by smtp.gmail.com with ESMTPSA id o124sm286991wmb.2.2020.08.24.09.48.37
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 09:48:38 -0700 (PDT)
To:     linux-usb@vger.kernel.org
From:   Jean-Christophe Barnoud <jcbarnoud@gmail.com>
Subject: Duplicate endpoint : Sound Devices MixPre-D (sound interface)
Message-ID: <a8e7a061-e788-9c57-59fc-243d0daae851@gmail.com>
Date:   Mon, 24 Aug 2020 18:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello.

The team at libusb says that this is a kernel issue so here it is.
Device : Sound Devices MixPre-D
This is an external audio interface that worked simultaneously as input 
and output with older kernels and libusb versions (see far below with 
fedora 26, kernel 4.13.13-200, libusb 0.1.5-8 from an older mothballed 
machine).
With newer versions of the kernel and libusb it works only as output 
(see just below with a current fedora 32, kernel 5.7.15-200, 
libusb-0.1.5-16).

An online search shows that the dmesg output "duplicate endpoint" is 
identical to the one referenced in this permalink :
http://archive.lwn.net:8080/linux-kernel/20200201105829.5682c887@acme7.acmenet/
So I guess that the solution is the same, adding in 
drivers/usb/core/quirks.c (adapted to the specific hardware 
identification) :
+    /* Sound Devices MixPre-D */
+    { USB_DEVICE(0x0926, 0x0208), .driver_info = 
USB_QUIRK_ENDPOINT_BLACKLIST },
+
Would it be possible to add this exception to quirks.c ?
Thanks


Fedora 32

[jcb@localhost ~]$ dmesg
[181470.940975] usb 3-9: new high-speed USB device number 6 using xhci_hcd
[181471.067606] usb 3-9: config 1 interface 2 altsetting 1 has a 
duplicate endpoint with address 0x85, skipping
[181471.067609] usb 3-9: config 1 interface 2 altsetting 2 has a 
duplicate endpoint with address 0x85, skipping
[181471.067913] usb 3-9: New USB device found, idVendor=0926, 
idProduct=0208, bcdDevice= 1.00
[181471.067915] usb 3-9: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[181471.067916] usb 3-9: Product: MixPre-D
[181471.067918] usb 3-9: Manufacturer: Sound Devices
[181471.067919] usb 3-9: SerialNumber: JP0713320007
[181471.074743] usb 3-9: 1:3 : UAC_AS_GENERAL descriptor not found
[181471.076196] hid-generic 0003:0926:0208.0021: hiddev99,hidraw7: USB 
HID v1.01 Device [Sound Devices MixPre-D] on usb-0000:00:14.0-9/input3

[jcb@localhost ~]$ rpm -qi libusb
Name        : libusb
Epoch       : 1
Version     : 0.1.5
Release     : 16.fc32
Architecture: x86_64
Install Date: mar. 04 août 2020 12:55:36
Group       : Unspecified
Size        : 73011
License     : LGPLv2+
Signature   : RSA/SHA256, jeu. 30 janv. 2020 06:10:05, Key ID 
6c13026d12c944d0
Source RPM  : libusb-0.1.5-16.fc32.src.rpm
Build Date  : mer. 29 janv. 2020 12:47:36
Build Host  : buildhw-12.phx2.fedoraproject.org
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : http://sourceforge.net/projects/libusb/
Bug URL     : https://bugz.fedoraproject.org/libusb
Summary     : A library which allows userspace access to USB devices
Description :
This package provides a way for applications to access USB devices.
Legacy libusb-0.1 is no longer supported by upstream, therefore content 
of this
package was replaced by libusb-compat. It provides compatibility layer 
allowing
applications written for libusb-0.1 to work with libusb-1.0.

[jcb@localhost ~]$ rpm -qi kernel
Name        : kernel
Version     : 5.7.15
Release     : 200.fc32
Architecture: x86_64
Install Date: mer. 19 août 2020 07:01:19
Group       : Unspecified
Size        : 0
License     : GPLv2 and Redistributable, no modification permitted
Signature   : RSA/SHA256, mer. 12 août 2020 18:52:02, Key ID 
6c13026d12c944d0
Source RPM  : kernel-5.7.15-200.fc32.src.rpm
Build Date  : mar. 11 août 2020 18:20:17
Build Host  : bkernel01.iad2.fedoraproject.org
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : https://www.kernel.org/
Bug URL     : https://bugz.fedoraproject.org/kernel
Summary     : The Linux kernel
Description :
The kernel meta package

Fedora 26

[jcb@localhost ~]$ dmesg
[  439.668052] usb 5-2: new full-speed USB device number 2 using uhci_hcd
[  439.800080] usb 5-2: not running at top speed; connect to a high 
speed hub
[  439.829086] usb 5-2: New USB device found, idVendor=0926, idProduct=0208
[  439.829090] usb 5-2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  439.829093] usb 5-2: Product: MixPre-D
[  439.829096] usb 5-2: Manufacturer: Sound Devices
[  439.829099] usb 5-2: SerialNumber: JP0713320007
[  439.843083] usb 5-2: 1:3 : UAC_AS_GENERAL descriptor not found
[  439.855889] hid-generic 0003:0926:0208.0002: hiddev96,hidraw0: USB 
HID v1.01 Device [Sound Devices MixPre-D] on usb-0000:00:1d.0-2/input3

[root@lund ~]# rpm -qi libusb
Name        : libusb
Epoch       : 1
Version     : 0.1.5
Release     : 8.fc26
Architecture: x86_64
Install Date: sam. 26 août 2017 09:20:08 CEST
Group       : System Environment/Libraries
Size        : 64043
License     : LGPLv2+
Signature   : RSA/SHA256, dim. 12 févr. 2017 00:30:17 CET, Key ID 
812a6b4b64dab85d
Source RPM  : libusb-0.1.5-8.fc26.src.rpm
Build Date  : sam. 11 févr. 2017 05:07:06 CET
Build Host  : buildvm-21.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : http://sourceforge.net/projects/libusb/
Summary     : A library which allows userspace access to USB devices
Description :
This package provides a way for applications to access USB devices.
Legacy libusb-0.1 is no longer supported by upstream, therefore content 
of this
package was replaced by libusb-compat. It provides compatibility layer 
allowing
applications written for libusb-0.1 to work with libusb-1.0.

[root@lund ~]# rpm -qi kernel
Name        : kernel
Version     : 4.13.13
Release     : 200.fc26
Architecture: x86_64
Install Date: sam. 25 nov. 2017 10:02:52 CET
Group       : System Environment/Kernel
Size        : 0
License     : GPLv2 and Redistributable, no modification permitted
Signature   : RSA/SHA256, mer. 15 nov. 2017 22:47:36 CET, Key ID 
812a6b4b64dab85d
Source RPM  : kernel-4.13.13-200.fc26.src.rpm
Build Date  : mer. 15 nov. 2017 18:16:48 CET
Build Host  : bkernel01.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : http://www.kernel.org/
Summary     : The Linux kernel
Description :
The kernel meta package

