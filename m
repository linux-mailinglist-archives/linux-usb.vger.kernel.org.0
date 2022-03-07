Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1164CEF30
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 02:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiCGBlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 20:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiCGBlv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 20:41:51 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1B325EA4
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 17:40:57 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id mv5-20020a17090b198500b001bf2a039831so5909861pjb.5
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 17:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bogomips.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=VvXKnoM7Lyj2rBRdl2WBiMXJFOJCUY6FklI8a0RTPyc=;
        b=NU7M0hx0crE+Suh+5uoybgx7YLYEyfuELfqosO5GAfdJA2hN7UA525feG0mcjYthNT
         YjFEbkHKGhf45kJBoslxKUqBnIQewVc/eDTFjIg8taVaSiwWykHxW2UyISgKe/2ZvGZW
         0LKtgJrJtvNQP9tpJMRnU2Sds/FF9ZUmQn3dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VvXKnoM7Lyj2rBRdl2WBiMXJFOJCUY6FklI8a0RTPyc=;
        b=0xu9LQ9n4FpPsVvKuWlvw+5vr7fiTIOM64cKkTJSxOJgI4w2BIbpPRW5v+Y4DW9zY+
         GunP7lqqe6g6Q7p9/op0V7Z9DhJJN338kabC5l+Y6WfquvEB6rJmMHmvqZuyrJd6rFuM
         N7DkVIu3mmHxzCVcbnycRUteQpQRWl3utdOOjt4BMjJNBY1nxwieAf1VQYcuGIGZp45D
         8qKw6fXY8EjhJB4LS18GBr2gU+lPbUffvk9y7SZ/KUeXiZ96lYs9dBpYz7h6cyFWZwwE
         gubjBM5p+XnUeekPnP0euFLaXsQEEod1QgDpSvbNr84cG2Bi7UOgW4DExZo5n8z5MCtb
         1nGQ==
X-Gm-Message-State: AOAM530mYJ6Hd+PccOYTwKViQTHU1dNBWFj9yznQ3jHydQ2cmx0hGKp/
        O7SyzuvQmp8Q7bsczPPVGXlWeeWVZ/JG+uCL1QuMjvNzrVnLyg==
X-Google-Smtp-Source: ABdhPJzChIw79kep4GM/IO8/4Nlof6oaxRT8Veshtq52FII70CHMsTRpDdK+illuRkrAH4N7cF1k3R5BKBhiSS7Dzys=
X-Received: by 2002:a17:903:1ce:b0:150:2117:16b3 with SMTP id
 e14-20020a17090301ce00b00150211716b3mr10061750plh.26.1646617256346; Sun, 06
 Mar 2022 17:40:56 -0800 (PST)
MIME-Version: 1.0
From:   John Paul Morrison <jmorrison@bogomips.com>
Date:   Sun, 6 Mar 2022 17:40:36 -0800
Message-ID: <CAO-kYtGwa+CCHGOotmtmJQ6drEVp6hJZDBywAV4JPnCmzBv9qw@mail.gmail.com>
Subject: problems with ch341 driver USB RS485 in Linux but not Windows
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

I have a few CH340/341 USB RS485 adapters - they all look identical
and use the ch341 driver with ID 1a86:7523 but I've found one that
reports a different iProduct and bcdDevice from the others. They all
work fine in Windows but one has problems transmitting in Linux.

I have tried this on a few different machines/kernels.
5.13.0-30-generic #33~20.04.1-Ubuntu SMP Mon Feb 7 14:25:10 UTC 2022 x86_64
5.10.92-v7+ #1514 SMP Mon Jan 17 17:36:39 GMT 2022 armv7l
5.10.93.2-microsoft-standard-WSL2 #2 SMP Sat Mar 5 13:40:04 PST 2022 x86_64

miniterm and dmesg offer some clues - the problem device shows
different CTS/DSR states
I have not been able to work around this with stty or in miniterm

problem device
miniterm
--- RTS: active    DTR: active    BREAK: inactive
--- CTS: inactive  DSR: inactive  RI: inactive  CD: inactive
--- software flow control: inactive
--- hardware flow control: inactive

In Windows the Termite com program shows CTS/DSR/RI/CD active
If I run socat in Windows sharing the serial port, and socat Linux
using a pty the Linux serial application works perfectly but fails
using the ch341 driver directly

dmesg
[702953.276954] usb 3-4: new full-speed USB device number 2 using xhci_hcd
[702953.426006] usb 3-4: New USB device found, idVendor=1a86,
idProduct=7523, bcdDevice= 2.63
[702953.426014] usb 3-4: New USB device strings: Mfr=0, Product=2,
SerialNumber=0
[702953.426017] usb 3-4: Product: USB2.0-Serial
[702953.426919] ch341 3-4:1.0: ch341-uart converter detected
[702953.427336] usb 3-4: ch341-uart converter now attached to ttyUSB1


working device
miniterm
--- RTS: active    DTR: active    BREAK: inactive
--- CTS: active    DSR: active    RI: active    CD: active
--- software flow control: inactive
--- hardware flow control: inactive

dmesg
[  699.616711] usb 1-1.4: new full-speed USB device number 7 using ehci-pci
[  699.726105] usb 1-1.4: New USB device found, idVendor=1a86,
idProduct=7523, bcdDevice= 2.54
[  699.726113] usb 1-1.4: New USB device strings: Mfr=0, Product=2,
SerialNumber=0
[  699.726117] usb 1-1.4: Product: USB2.0-Ser!
[  699.726517] ch341 1-1.4:1.0: ch341-uart converter detected
[  699.727292] ch341-uart ttyUSB0: break control not supported, using
simulated break
[  699.727411] usb 1-1.4: ch341-uart converter now attached to ttyUSB0


lsusb - same vendor id
Bus 001 Device 007: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
Bus 003 Device 002: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter

lsusb -v
The only difference is in bcdDevice, iProduct and MaxPower

problem device
Bus 003 Device 002: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x1a86 QinHeng Electronics
  idProduct          0x7523 HL-340 USB-Serial adapter
  bcdDevice            2.63
  iManufacturer           0
  iProduct                2 USB2.0-Serial
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               98mA


working device
Bus 001 Device 007: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x1a86 QinHeng Electronics
  idProduct          0x7523 HL-340 USB-Serial adapter
  bcdDevice            2.54
  iManufacturer           0
  iProduct                2 USB2.0-Ser!
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               96mA
