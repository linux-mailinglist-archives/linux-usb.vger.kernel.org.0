Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4C9463D5C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 19:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245249AbhK3SFR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 13:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245232AbhK3SFR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 13:05:17 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBCDC061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 10:01:58 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id y68so55171134ybe.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oe/NaKuJIbwNFYt9uFJ8UB1yf3dzHirpwyyuU7nnvcA=;
        b=dtApeI/wglfqbnblG5cvWhMCHXLqen9TDPZyWXQc4hEr6NYj8BLZutdquEe8WD3nse
         SFGbLTttYzswXaV6v290AWlGI0D2k1pvxQq7S9e0e2yZfN2w/wIdLqRhIPZkNZuhCMD2
         X7OozluzrRkofGXtakBcqmzB1kk0aVUIP/5PPHhL1xU9/Nddh/vVaxqcR+eW9AMb1isZ
         GSOBd0tydvX+1J3x/U3JOLpzyH7FpNK5QwrbCd+CIzHMP63iQPkLKKeWRnOd3AUSaGKz
         kzIznRCa7gqOqL1AM/RGTJ31hK5R6UMuHdfIsAPo3RDB4Q5xeuk+LuT/aOq2L8EmYqXx
         Ue+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oe/NaKuJIbwNFYt9uFJ8UB1yf3dzHirpwyyuU7nnvcA=;
        b=x22jszwXCmud8vdaslyNk85S7ze6l3EN4tc9tEdpQHX2iPv+7MqGRNK04DVXcSC6hc
         5rP+gtv0YV/zjw7+piOJ8atiKdDqOjCqXokHQiHoMzU9MZzMseCncgKdhdPn5TlvcLdT
         bcc4HWTjRgkwcRRTtTYZ8vbX/BagXGpXaW9grFpbFE+IH4NghRUowKYhyd28VII+T6Ve
         nsx0YG+zWf1CNGT4ECx3emk13kWRxwQevZEKPgh+J5Y0LgO1hSgX2Y5PIpcLeIGiFyGX
         0GYStG403Pr4cf8iflGA3m+dv128NBzcy8g4NfXYEEGHWwGCM/JzSXcoIdqVrZavFLmX
         fhbw==
X-Gm-Message-State: AOAM532LemAqUrSgHCi7vorhwwPbzY3YDHfA/He2XBhsHKaGhVTU1r78
        RPuFwJg2bIQFgI2n2L84AtzdYjZYlFm/su9EwSNgH+wuF2Q=
X-Google-Smtp-Source: ABdhPJx/AeD8zEuzPoQDwxSy0gxiF3pAnEoxP3bzCcbSX0D4vAwSw/wtX0zcIW8BfrWndsthkeVOXV/nLfyUbplBW/k=
X-Received: by 2002:a25:2fd2:: with SMTP id v201mr766583ybv.370.1638295317168;
 Tue, 30 Nov 2021 10:01:57 -0800 (PST)
MIME-Version: 1.0
From:   Volodymyr Lisivka <vlisivka@gmail.com>
Date:   Tue, 30 Nov 2021 20:01:46 +0200
Message-ID: <CAKjGFBVrUevZtS4bDihRz3s3U3E0a8_DhdxEuata0vS3hLEvTQ@mail.gmail.com>
Subject: BUG: iPNPstring in f_printer USB gadget is reduced by two bytes
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Description:

Printer USB gadget uses iPNPstring to communicate device name and
command language with host. Linux driver for printer gadget sends
GET_DEVICE_ID response packet without 2 last bytes, which may cause
trouble for the host driver.

Steps to reproduce:

Use Raspberry Pi, or an other device with USB OTG plug. Raspberry Pi 4
was used by issue author.
Configure plug to be in peripheral mode, e.g. by adding
dtoverlay=dwc2,dr_mode=peripheral to /boot/config.txt.
Connect OTG port to host and reboot Raspberry Pi.
Load g_printer module using command sudo modprobe g_printer.
Use command ./get-iPNPstring.pl /dev/usb/lp1 to get iPNPstring from
the device. (See get-iPNPstring.pl.gz ). As alternative, kernel usbmon
or WireShark can be used to capture raw USB packet for GET_DEVICE_ID
response.

Expected result:

It's expected to receive same string as defined in module:
iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:1;'

Actual result:

iPNPstring='MFG:linux;MDL:g_printer;CLS:PRINTER;SN:'

(Notice that last 2 chars are missing).

Workarround:

Just add two space to the end of printer gadget iPNPstring.

Root cause:

In drivers/usb/gadget/function/f_printer.c, length of iPNPstring is
used as length of the whole packet, without length of 2 byte size
field.

Patch:

--- f_printer.c.orig 2021-11-26 19:12:21.632221126 +0200
+++ f_printer.c 2021-11-26 19:09:19.454991670 +0200
@@ -1003,11 +1003,11 @@
  value = 0;
  break;
  }
- value = strlen(dev->pnp_string) ;
+ value = strlen(dev->pnp_string) + 2;
  buf[0] = (value >> 8) & 0xFF;
  buf[1] = value & 0xFF;
- memcpy(buf + 2, dev->pnp_string, value);
- DBG(dev, "1284 PNP String: %x %s\n", value,
+ memcpy(buf + 2, dev->pnp_string, value - 2);
+ DBG(dev, "1284 PNP String: %x %s\n", value - 2,
      dev->pnp_string);
  /* Length of packet is length of length field and length of iPNPstring. */
  break;
