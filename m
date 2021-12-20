Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A14647A514
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 07:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237580AbhLTGqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 01:46:35 -0500
Received: from mout.gmx.net ([212.227.15.15]:52147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234258AbhLTGqf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 01:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639982794;
        bh=2Nl2LaJ3AVazu4emdGuE6HEz4TfBVqejEGlFoWfUqT4=;
        h=X-UI-Sender-Class:From:To:Date;
        b=SQBWWvcELYJeAii2OteQpfxGOYjuYXyf+3Mnw8zO++rWCQMCHs7AuEdXC9EFdUV3y
         W1597vuJgxoGBnfjxTtF/0+FHoSOJFyPa1J2Qk4gWuyAJlUfec8zr2ODIaOA8ZZ8Ev
         fZ9jrLBNXb8JhD32pBR1leUPbMOTILQrQ39B142Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [194.140.113.242] ([194.140.113.242]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Mon, 20 Dec 2021
 07:46:34 +0100
MIME-Version: 1.0
Message-ID: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
From:   Ralf Beck <musical_snake@gmx.de>
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 20 Dec 2021 07:46:34 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:zIKfgIMCSE36oRYZIEeaIrHtHCMhTf0Ft3eJMXXlQHI2B1q00AUdG+iREqaFM46tIxYhL
 F7GgUlG32cM9s6QsDyBQjnDeZ+K37MeUGCg3kC89sWzf2Yj1IBwSs+f2WNeZPhRjm5MvwjykFRCs
 NJ6MolB2QcPgUAetyJrVCYt/YO2uVKO6NL3ZqkKYSam5zQR4mXF6jkHeGb6j/n+8S/8zA2PmwPIW
 3xmy26BSFGjbOnD+ColQS5ETpOpd/W4xKcZ5jjVWVn/NxbbkOFKqVsIeNcsMi4avskVjQahXKdr/
 3o=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AA+zFzPvssQ=:QNvnf21kW8FhiqoeaEdJn1
 pPFhjnzPd8x7p5f+p8sodoWR+O9EAIQTgwcRcNBSquzZOGYN+UM2d2RTY6u7zrZzTKx+rpx/N
 QrkSa9eBSSOxEap+7QTDqpedXuqCqz7ePJNLdda0w8usLoB0q3aQ34+GDW0FmVqMs5GvEfdXg
 lR1OAQCM7P253R6A/GwORJ+uNhwAOHzK6wTcPmnc3Rm9K676L5ktipOGo6UQDnM/Mojyqu8iB
 r9atgnUY7KsRN0Es2Yw8vjV9Aq8t+iIfRGyYZ/6PCTyd1a/h7FFgvJVAfSzKOGKT7ba0Ogz9W
 BFDd79Tgb87RQ3pO83I1b575Ozlw5uUokWUgZekHviWdT5xdCfRWILF+XGCUv4UyOGc+LVc7Z
 V9wPSQWaAwN18h0t/YDx6YddGGVirN/8xyxkisab49NMMRJ9Eu3aSRHt/s+fXS/ysdBWMFHRe
 /DloWcH6UZc/S8yUzAWr+DsXaNWQZmyoeK6JEGpfYok8CveMLKwlUhZQib4+wX8jKWa03Tw7Y
 y9tVtxHH1fk5Ls2Vrr7M2rPCsgPQiMMFXOlMm+riDigdTs3PregRcb5d0zcmSyg6Cc5JjbOYE
 IWw0HwP1Yh0/4CbMiU9//+zEWk04SwxeShsBcEQV25KrmKKeX0n7p9CouuUAulUbqgKabax0Y
 C0wc6s7j9Dk5giQdEVmpUMlAe/qPCmtdjCsft++BDS5V7+ADy3g4oCb9quZq4rOPHoHKlBP9H
 jTr6GokJMucrpTvmA2Rf2oiSQD3M+AzORzUXQPOTiGYtz8/WWxU/IVIgjBp0W7mYL+NIKoPKg
 l7OLz8/
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Currently the usb core is disabling the use of and endpoint, if the endpoint address is present in two different USB interface descriptors within the same USB configuration.
This behaviour is obviously based on following passage in the USB specification:

"An endpoint is not shared among interfaces within a single configuration unless the endpoint is used by alternate settings of the same interface."

However, this behaviour prevents using some interfaces (in my case the Motu AVB audio devices) in their vendor specific mode.

They use a single USB configuration with tqo sets of interfaces, which use the same isochronous entpoint numbers.

One set with audio class specific interfaces for use by an audi class driver.
The other set with vendor specific interfaces for use by the vendor driver.
Obviously the class specific interfaces and vendor specific interfaces are not intended to be use by a driver simultaniously.

There must be another solution to deal with this. It is unacceptable to request a user of these devices to have to disablethe duplicate endpoint check and recompile the kernel on every update in order to be able to use their devices in vendor mode.

Sincerly,
Ralf Beck
