Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853AF36BAAC
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 22:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239960AbhDZU0J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 16:26:09 -0400
Received: from mail.linuxsystems.it ([79.7.78.67]:51078 "EHLO
        mail.linuxsystems.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbhDZU0I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 16:26:08 -0400
X-Greylist: delayed 479 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Apr 2021 16:26:08 EDT
Received: by mail.linuxsystems.it (Postfix, from userid 33)
        id BDCE820F85B; Mon, 26 Apr 2021 21:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxsystems.it;
        s=linuxsystems.it; t=1619466906;
        bh=dnkWv1CS9YiaAKNiNlgG6YG1kqlWBXJOsmhnHYZy0JI=;
        h=To:Subject:Date:From:From;
        b=hg4WCvH0IrLoL8uEk/157BL2hLUcnk0BdSMxrheTQn/trzH5EeitEu8K4ebWxbzwM
         WB+Ym6BWIOZbUGby+HRkpm00oUvDFypgQCskLZLVoeq1wR09yJgtWnAPJcWvEkeiU6
         p7j94l9C9mcZcckhkwbkrv8r09TqhYNAVpkL4GQY=
To:     linux-usb@vger.kernel.org
Subject: cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl irq) failed
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Apr 2021 21:55:06 +0200
From:   =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
Message-ID: <2fd1819252485b07e38f5154592dad43@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

My Aeon Labs ZWave USB stick doesn't work anymore since 5.11.12-arch1-1:
[ 193.677337] usb 2-2: new full-speed USB device number 5 using xhci_hcd
[ 193.818112] usb 2-2: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[ 193.818117] usb 2-2: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 194.372999] cdc_acm 2-2:1.0: ttyACM0: USB ACM device
[ 194.373197] usbcore: registered new interface driver cdc_acm
[ 194.373199] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters
[ 200.173616] cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl 
irq) failed

It works fine on 5.11.11-arch1-1 and on a Fedora 34 Live USB with kernel 
5.11.16.
Arch's 5.11.16 doesn't work and latest Arch's linux-lts doesn't work 
either.
This led me to believe that this could be due to an Arch configuration 
change happened between 5.11.11 and 5.11.12 (AFAIK they don't carry any 
additional patch).
This is the only one I've found: 
https://github.com/archlinux/svntogit-packages/commit/0b94106e755810659ccd9accfa4821bc3b429d34#diff-3e341d2d9c67be01819b25b25d5e53ea3cdf3a38d28846cda85a195eb9b7203a

Basically they added CONFIG_IDLE_PAGE_TRACKING=y. They backported the 
same configuration change to linux-lts. I don't know if this makes any 
sense, I'm running out of ideas.

Niccolo' Belli
