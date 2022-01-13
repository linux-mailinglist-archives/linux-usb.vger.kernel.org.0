Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE8948D9BE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 15:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbiAMOgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 09:36:11 -0500
Received: from mail-4316.protonmail.ch ([185.70.43.16]:12965 "EHLO
        mail-4316.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiAMOgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 09:36:11 -0500
Date:   Thu, 13 Jan 2022 14:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1642084569;
        bh=XLqkgVqjC5To3INRuaegxGa4dj9umVCTqdlVrXLHRek=;
        h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
        b=OFQz84q4H8WHKIauPMSAoDYGTStJl0X/YlJAzW9N1TOQAWyBtDX+BD6xSGzdAS0zq
         I479+XvhmQ3CL3KmWVz6asVanB0JWv7bVK6rptDuuFJj3mdPycIAfH4I4WqTDSJvbG
         KwGuCveVyFOSPvBFuqedTo54fc7SesM/ndC44xOHXigNYjFEDiYWx2VGWxG1qBqYfj
         t1XZs/xTPCgNooMFvUzRzbBnKQthBot5TnpIREQQn9vNl8vbM7t1HRk3VfFYw0Uj/8
         7Vrkb+tG9Y1dwvoAKtsg9yYjKz++yqWEUerNMTNdRa2XpwLnFADDg4kA4IXMCTH8r0
         xRW/7pMiULOnw==
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Christopher Rutherford <chrisrutherford@protonmail.com>
Reply-To: Christopher Rutherford <chrisrutherford@protonmail.com>
Subject: Neoway Technology N27 NB-IoT/eMTC/EGPRS module
Message-ID: <KX3y23_c5OPlneretDRhw4_4oqxJ1tXAwYfYb99nLhF8jWCLgWNuhotDR3ehKZ7bPqfDP4aocSpkn8IHccmKt6flhO4CqVxtR9wbidlaTEQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

As per the dmesg log, please add the Neoway N27 to a proper driver.

lsusb
Bus 001 Device 014: ID 2949:8620 Qualcomm, Incorporated Qualcomm CDMA Techn=
ologies MSM

sudo modprobe usbserial vendor=3D0x2949 product=3D0x8620

[1989329.151331] usbcore: registered new interface driver usbserial_generic
[1989329.151336] usbserial: USB Serial support registered for generic
[1989329.151346] usbserial_generic 1-11:1.0: The "generic" usb-serial drive=
r is only for testing and one-off prototypes.
[1989329.151347] usbserial_generic 1-11:1.0: Tell linux-usb@vger.kernel.org=
 to add your device to a proper driver.
[1989329.151348] usbserial_generic 1-11:1.0: generic converter detected
[1989329.151429] usb 1-11: generic converter now attached to ttyUSB0
[1989329.151451] usbserial_generic 1-11:1.1: The "generic" usb-serial drive=
r is only for testing and one-off prototypes.
[1989329.151451] usbserial_generic 1-11:1.1: Tell linux-usb@vger.kernel.org=
 to add your device to a proper driver.
[1989329.151452] usbserial_generic 1-11:1.1: generic converter detected
[1989329.151486] usb 1-11: generic converter now attached to ttyUSB1
[1989329.151499] usbserial_generic 1-11:1.2: The "generic" usb-serial drive=
r is only for testing and one-off prototypes.
[1989329.151500] usbserial_generic 1-11:1.2: Tell linux-usb@vger.kernel.org=
 to add your device to a proper driver.
[1989329.151501] usbserial_generic 1-11:1.2: generic converter detected
[1989329.151526] usb 1-11: generic converter now attached to ttyUSB2
[1989329.151536] usbserial_generic 1-11:1.3: The "generic" usb-serial drive=
r is only for testing and one-off prototypes.
[1989329.151537] usbserial_generic 1-11:1.3: Tell linux-usb@vger.kernel.org=
 to add your device to a proper driver.
[1989329.151538] usbserial_generic 1-11:1.3: generic converter detected
[1989329.151567] usb 1-11: generic converter now attached to ttyUSB3

miniterm  /dev/ttyUSB1
--- Miniterm on /dev/ttyUSB1  9600,8,N,1 ---
--- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
at
OK
at
OK

Best regards,

Christopher
