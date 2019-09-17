Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54578B4CE6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 13:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfIQL3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 07:29:36 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:41560 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfIQL3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 07:29:36 -0400
Received: by mail-io1-f51.google.com with SMTP id r26so6645043ioh.8
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YvnpJ+QPzoXSWxHP2z0FRgwimljwbZES308F9P4Y0+A=;
        b=TY76KGyaB7w4QTgfditqVavueI+HcSOdms+cxbPwnPJikywyiLGIqwLG0dqlGPXcqR
         g+Mrv5cqcaEZegVx7+w6z+cfjqkInLeB/dtT/WVtF7qQZY4lin+lBPkAej4gSJ03nbSI
         mUJEHBxn7/H9IzTrr4kCC6pqq+J3XH14ft55URi67GgrrkZO3Xby2aMuDnXkmmANNDjX
         DiluFnaideShMvcH/gCfPdH6j/U6ztvXeirVMPbR9kuwOHu3t42YKFwPQkqzDE+95+sR
         JwmbmoyYYTGZdlbaTtW4oaLz4wifImk/A3KgbYzYbnWU4NqB9UvLYxHVCLaYpzhhAfAP
         yV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YvnpJ+QPzoXSWxHP2z0FRgwimljwbZES308F9P4Y0+A=;
        b=g7gJhimyRRPoLnsTCKQrsTWET/ByGikqPBnz35JGWB1v7I3rrsP6kIKzsAvNXOVdhH
         6Wvr83wZj3jR3qwhI6acbK5IImqN2e0WKBAzCIfkMeghya4hrgcEX+4iyy+EpE0RbnYM
         s/LmejfAbhBhksleR76fcIZzkTFoJHXYsFuDVOuXfWz0faIoJ9O0agGdxaFnpa5t/fAN
         j62WhuN6FsMBuBNjRnjUTLZdsTpbAsHDQV3VcJT6h/KZAWjGvW2R28uljNFwgaWUDfqp
         VHD3djJ5iTvMk7E9pFIKPZfhOCmSALnnpYhL1Fq12F7lt98/Wg2qXCM98oaiFlHy7kPX
         mJtw==
X-Gm-Message-State: APjAAAXhy94CYxTMp2gluElthOh9P2wHn/2NNA+M72gzgnUlj7Sxtw+i
        Ea7LopBquMWnuYkoEmPCFPKzMRFOSHYOwq0bWhut4g==
X-Google-Smtp-Source: APXvYqzD+95KULGSqzypHhBykxewlOvEHMXnmwbOm6uBemxAlPk7guVOmXT3tQH94P6n4EAb/21Sv4/IYd6cUxQ33vs=
X-Received: by 2002:a05:6638:73d:: with SMTP id j29mr3822795jad.21.1568719775278;
 Tue, 17 Sep 2019 04:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Tue, 17 Sep 2019 04:29:34
 -0700 (PDT)
From:   JH <jupiter.hce@gmail.com>
Date:   Tue, 17 Sep 2019 21:29:34 +1000
Message-ID: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
Subject: Failed to connect to 4G modem
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am running kernel LTS 4.19 in an i.MX6 board with a 4G LTE modem, it
continually displayed following messages in a serial port tried and
failed to connect to LTE modem, are there any problems in kernel 4.19
LTS to support usb qmi protocol and LTE modem connection?

I did try the kernel version 5.1, it can connect to the modem, but
failed in couple of hours or days, when it disconnected, it got the
same following messages.

Are there serious problems in kernel to support usb qmi LTE modem
communication and connection?

[   43.837243] option1 ttyUSB0: GSM modem (1-port) converter now disconnected f0
[   43.882941] option 1-1:1.0: device disconnected
[   43.942788] option1 ttyUSB1: GSM modem (1-port) converter now disconnected f1
[   44.001445] option 1-1:1.2: device disconnected
[   44.011575] qmi_wwan 1-1:1.3: nonzero urb status received: -71
[   44.017461] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
[   44.022801] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb failed with 9
[   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan' usb-ci_hdrc.1-1, We
[   47.675604] usb 1-1: new high-speed USB device number 5 using ci_hdrc
[   47.905246] usb 1-1: New USB device found, idVendor=05c6, idProduct=90b2, bc0
[   47.913732] usb 1-1: New USB device strings: Mfr=3, Product=2, SerialNumber=4
[   47.921099] usb 1-1: Product: Qualcomm CDMA Technologies MSM
[   47.927087] usb 1-1: Manufacturer: Qualcomm, Incorporated
[   47.932746] usb 1-1: SerialNumber: 5ff10299
[   47.964528] option 1-1:1.0: GSM modem (1-port) converter detected
[   47.989484] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB0
[   48.014760] option 1-1:1.2: GSM modem (1-port) converter detected
[   48.026996] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB1
[   48.048810] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
[   48.082751] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at usb-ci_hdrc.1-1, 8
[   51.581595] usb 1-1: USB disconnect, device number 5
[   51.613737] option1 ttyUSB0: GSM modem (1-port) converter now disconnected f0
[   51.644564] option 1-1:1.0: device disconnected
[   51.713919] option1 ttyUSB1: GSM modem (1-port) converter now disconnected f1
[   51.771139] option 1-1:1.2: device disconnected

Thank you.

Kind regards,

- jh
