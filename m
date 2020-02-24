Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2EF16B221
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 22:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgBXVXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 16:23:39 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34010 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbgBXVXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 16:23:38 -0500
Received: by mail-io1-f66.google.com with SMTP id 13so11278456iou.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 13:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ps+7/Ky1jmV1lwuVEOjX97P0N6GgjfaMM6j0fFxvapg=;
        b=qhII204n+xRj0K+q5q9BPVtIsWIdd19ZO+qRFR7XM/3dNDRCPD/R5fwhjAr+xaIzvC
         zHyLH/+dwCKdPo5+YIosIpqV7MNCpMy/kSy/nT1xx0WDprQTw9PiDwA8RsDA3omksdB5
         LUfaBGxICBJLEWjDMARx9E2kvZWDwihpKV1AMzXWpN1qhrOnNuH6vIrtni6odS9Inws7
         LjjyP/ZcVdf6QX+1KKB3m0tl5vCRZD0ZZB+Gh4EqfXCwK0pnDxIxj5f5eMHLK9wLb/8X
         Kf1TpCYKTWUHJ6pBaf0zFd6SvqLUpKbzx3zT3cX9jF3CbUchnzXs8OwnXk3DgdCh0Bf5
         xwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ps+7/Ky1jmV1lwuVEOjX97P0N6GgjfaMM6j0fFxvapg=;
        b=O9QZyBhNc2gjIeHkjWSAimf1zBxvsrLnOkg1hFQWBMjCts4YXthp8E8URAjJjUuqxW
         enmGf8u3EIjRwukVD6dVmcxEYHC7vXZjtw/G759drQsCU7nN62g+aI7hzmEMYRfKfk8I
         dpNGmB3ALxCBEbx93uiU+a9H9i32SZmjFF9quYw+9deNx2aakK1gxsrndp8PdFdPWgey
         XawodsadFKihQ0p+ako7LWJbaHEvXMsD8eVvVTAWezXQTWHpoDCZ94OoCXkuGw3Wk8V8
         7s+AHzIjdtY6iN6GFmGZOxqKqv3hRdB3aGqOMugCH84xxenBg2fBtcUwMGMk1EGTVET4
         yHRQ==
X-Gm-Message-State: APjAAAUs/pvnNUH+4XB+WqZybp5ObWNsP0FzYJU/E7yf5f8uliIs1CiU
        qTyYDgyDztxEnJ07zHjkBOt4SlcT06Unl3NfgEnN3fCmxVw=
X-Google-Smtp-Source: APXvYqzOAGijWtMe4GDlLaZ0BfxSnjXyVuuclmeXpVlhT6TeXszLdthEBB6d0/XBcB6TNEwkSD1h4dq7HOO7yASfI/g=
X-Received: by 2002:a6b:5109:: with SMTP id f9mr53936010iob.86.1582579418100;
 Mon, 24 Feb 2020 13:23:38 -0800 (PST)
MIME-Version: 1.0
From:   PLENTY <plentypvp@gmail.com>
Date:   Tue, 25 Feb 2020 02:23:27 +0500
Message-ID: <CALDgPpU+zqjeLbh7SnGGbe66RjJU9a2P6JiZUp-VJn=w44S_=A@mail.gmail.com>
Subject: Driver fault
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello. I'm using Ubuntu 18.04.3 LTS. I'm trying to get my JT308 RFID
reader working. Please help.

$ sudo modprobe usbserial vendor=0xffff product=0x0035
$ dmesg
...
[  266.304578] usbserial_generic 2-1.5:1.1: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[  266.304579] usbserial_generic 2-1.5:1.1: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.

$ lsusb -d ffff:0035 -v
Bus 002 Device 003: ID ffff:0035
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0xffff
  idProduct          0x0035
  bcdDevice            1.00
  iManufacturer           1 Sycreader
  iProduct                2 USB Reader
  iSerial                 3 08FF20150112
  bNumConfigurations      1
