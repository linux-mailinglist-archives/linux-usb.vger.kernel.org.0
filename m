Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4003845816B
	for <lists+linux-usb@lfdr.de>; Sun, 21 Nov 2021 02:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbhKUBFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Nov 2021 20:05:43 -0500
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21370 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhKUBFm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Nov 2021 20:05:42 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1637456556; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Mzrn2+bSC+2Rnwgle8Jv1PNyT/4cqctnNphrtPdRCqOaGosiIezRxsICod8hdaJ+hlz+2UrHuVZmODv8xZZwMLTywH85BFCs6/kvJgs6C4gXUL+XO/XA0Y32J1rvYzP9l8r4YGruJgms1p/3u2E4KwFEBQPIl9/DAYWGZnX1UOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1637456556; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=kmSt6LlgRJJmaQRiStcMAelccO09f+pWBXFSLlOUw+I=; 
        b=XHFJ1c/m3v77vDpAY+gosHq4LAwpJbBqLOrUu52hyk+yCbOMp5uJDM1kr2rC92rhyh2GSyEn1yqjLpcdmhrgz5xPGF3ytS9oZezs/qbbKeQLBJ7hmtKYNUaQ1biBIaJHeMVTw8LoKwibY4tRo+poEolQy1YBXIzAdaqY0qYKbyU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=xanmod.org;
        spf=pass  smtp.mailfrom=kernel@xanmod.org;
        dmarc=pass header.from=<kernel@xanmod.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1637456556;
        s=main; d=xanmod.org; i=kernel@xanmod.org;
        h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=kmSt6LlgRJJmaQRiStcMAelccO09f+pWBXFSLlOUw+I=;
        b=mESk6kvdYEsOCUhn8fSGZ3n5Ph+hMnM9b9ReigMuwWFZCwdC3OkpJ6eDqO324gu9
        ctWMInra5dZTEz4jngGHw1dyzqcT/DgAWZYQzK2UaF7eAfk/95654P6vut3CVdDe3x8
        riPCmeV6Ij4+WxnLTNfZjQmQC0XMb6CiO/qwhIzc=
Received: from mail.zoho.com by mx.zohomail.com
        with SMTP id 1637456555350319.9012626145992; Sat, 20 Nov 2021 17:02:35 -0800 (PST)
Date:   Sat, 20 Nov 2021 22:02:35 -0300
From:   Alexandre Frade <kernel@xanmod.org>
To:     "linux-usb" <linux-usb@vger.kernel.org>
Message-ID: <17d40042d3b.f54aeba22864166.9088645547283469156@xanmod.org>
Subject: [xanmod/linux] 5.14.14 renders unusable all USB ports except one
 (Issue #207)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear USB Leadership Team,

Please, follow this issue: https://github.com/xanmod/linux/issues/207

kern.log:
-----
[   14.105940] usb 4-3: device not accepting address 2, error -108
[   14.106012] usb usb3-port2: couldn't allocate usb_device
[   14.106049] usb usb4-port3: couldn't allocate usb_device
-----

SoftExpert: Hello, I updated to 5.14.14-xanmod1-cacule and then to 5.14.14-xanmod2-cacule - both versions render unusable my USB ports except the one that has pass-through charging.

When booting in the previous version 5.14.13 all USB ports function normally.
Here are the requested files:
https://github.com/xanmod/linux/files/7391333/lshw5.14.13.log
https://github.com/xanmod/linux/files/7391334/lshw5.14.14.log
kern.log
I also performed a sudo lsusb -v under both versions:
https://github.com/xanmod/linux/files/7391339/lsusb_xanmod5.14.14.txt
https://github.com/xanmod/linux/files/7391340/lsusb_xanmod5.14.13.txt

SoftExpert: Hello, I installed 5.14.15 and I have the same issue ...

SoftExpert: Hello, I installed 5.14.15 and I have the same issue ...

SoftExpert: Hello, I confirm the same issue with 5.14.16 and with 5.15.0 ...

Vi: I'm using 5.14.20-xanmod1 #0~git20211118.f58acc8 and it indeed it broke something with USB interfaces, half of them doesn't work anymore.

Vi: Attached as requested. Note that I reverted back to 5.14.17 for now
https://github.com/xanmod/linux/files/7572385/kern.log
https://github.com/xanmod/linux/files/7572386/syslog.log

--
Thanks,
Alexandre Frade














