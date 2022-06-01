Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9700453AB38
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 18:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356214AbiFAQoy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 12:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356196AbiFAQon (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 12:44:43 -0400
X-Greylist: delayed 412 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Jun 2022 09:44:40 PDT
Received: from mail.toniclab.ru (unknown [194.187.149.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416B29E9DA
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 09:44:39 -0700 (PDT)
Received: from post.toniclab.ru (localhost [127.0.0.1])
        by mail.toniclab.ru (Postfix) with ESMTPSA id 76F7F154DF7
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 19:37:45 +0300 (MSK)
MIME-Version: 1.0
Date:   Wed, 01 Jun 2022 19:37:45 +0300
From:   "TonicLab.ru" <info@toniclab.ru>
To:     linux-usb@vger.kernel.org
Subject: /dev/ttyUSB0 file disappears on Ubuntu 22.04
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <4b9e024d14c40cba7c04d5879ae64866@toniclab.ru>
X-Sender: info@toniclab.ru
Organization: TonicLab
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_05,KHOP_HELO_FCRDNS,
        RCVD_IN_PBL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This problem appeared on a freshly installed Ubuntu 22.04 desktop. Not 
sure I need to post this here.

When I'm attaching a ftdi device into usb everything looks great but 
there's no /dev/ttyUSB0 file. Seems it created and then disappeared. I 
tried to remove brltty package (as some recommends on the net) but it 
didn't help. The same ftdi device works on older Ubuntu version w/o any 
problems.

I'm having this in syslog:
Jun  1 16:58:09 qgs-comp kernel: [  538.642086] usb 2-1.5: new 
full-speed USB device number 5 using ehci-pci
Jun  1 16:58:10 qgs-comp kernel: [  538.756437] usb 2-1.5: New USB 
device found, idVendor=0403, idProduct=6001, bcdDevice= 6.00
Jun  1 16:58:10 qgs-comp kernel: [  538.756445] usb 2-1.5: New USB 
device strings: Mfr=1, Product=2, SerialNumber=3
Jun  1 16:58:10 qgs-comp kernel: [  538.756448] usb 2-1.5: Product: USB 
Serial
Jun  1 16:58:10 qgs-comp kernel: [  538.756450] usb 2-1.5: Manufacturer: 
FTDI
Jun  1 16:58:10 qgs-comp kernel: [  538.756452] usb 2-1.5: SerialNumber: 
FT0KKBIF
Jun  1 16:58:10 qgs-comp kernel: [  538.759677] ftdi_sio 2-1.5:1.0: FTDI 
USB Serial Device converter detected
Jun  1 16:58:10 qgs-comp kernel: [  538.759713] usb 2-1.5: Detected 
FT232RL
Jun  1 16:58:10 qgs-comp kernel: [  538.760546] usb 2-1.5: FTDI USB 
Serial Device converter now attached to ttyUSB0
Jun  1 16:58:01 qgs-comp colord-sane: message repeated 2 times: [ 
io/hpmud/musb.c 2101: Invalid usb_open: Permission denied]
Jun  1 16:58:10 qgs-comp mtp-probe: checking bus 2, device 5: 
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
Jun  1 16:58:10 qgs-comp mtp-probe: bus: 2, device: 5 was not an MTP 
device
Jun  1 16:58:10 qgs-comp systemd-udevd[5394]: 2-1.5: Failed to 
create/update device symlink '/dev/ttyUSB0', ignoring: File exists
Jun  1 16:58:10 qgs-comp snapd[942]: hotplug.go:199: hotplug device add 
event ignored, enable experimental.hotplug
Jun  1 16:58:10 qgs-comp mtp-probe: checking bus 2, device 5: 
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
Jun  1 16:58:10 qgs-comp mtp-probe: bus: 2, device: 5 was not an MTP 
device
Jun  1 16:58:10 qgs-comp colord-sane: io/hpmud/musb.c 2101: Invalid 
usb_open: Permission denied

I noticed this line:

Jun  1 16:58:10 qgs-comp systemd-udevd[5394]: 2-1.5: Failed to 
create/update device symlink '/dev/ttyUSB0', ignoring: File exists

Why is it happening? There's no /dev/ttyUSB0 neither before nor after I 
attach ftdi device to a USB port.

thanks
