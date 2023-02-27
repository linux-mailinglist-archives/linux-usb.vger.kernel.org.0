Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8FB6A4A91
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 20:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjB0THf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 14:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjB0THf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 14:07:35 -0500
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Feb 2023 11:07:33 PST
Received: from infra.glanzmann.de (infra.glanzmann.de [IPv6:2a01:4f8:b0:3ffe::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193FF113F5
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 11:07:32 -0800 (PST)
Received: by infra.glanzmann.de (Postfix, from userid 1000)
        id C47B67A8007D; Mon, 27 Feb 2023 19:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glanzmann.de;
        s=infra26101010; t=1677524249;
        bh=SXeBH7gTU3aKDpYxjwztUqyI7fcohj8ehxEKlfdK3F0=;
        h=Date:From:To:Subject:From;
        b=hyjxzWnQozL+AldbrgU1Iw8OcPP0dfezEO1l2TAjwILOs4gZO5IBOqblNgsOsoK29
         rka8be85jozCT72RdTXveXkcvy+1O5aWKg99oI6F2+ms9yR4B4x3TRb7QTeoxMgIBw
         89xXG919QHgNIQQDK84tl4pYg379cRayiisM5H7eJQ4QS8tTVegR1Sb45RwmZ/TtiE
         zt1qAL3HIAlm14lGqOGBnpH1ydSt5XsZoSYiMNmUvkAA23etHWgPZ22TLfdCaKr1MX
         hO2Bneyu41ezx+DR0JDCaQAAeNgJAQrp5ZzDyG2QzBNsywiAAB5WpEt83qZKmpMhyM
         CS27oqc6T6nE73pLwAYHK4zduRlrC8DAiagrADriOx8ArzeHKuaRTi3wiaC6G1ZMTt
         nNlBxVMjabBmiKputrERvBUjA0FQI5D1xK0CvLqyOtn+nJz+0Ox0X8T9gLvA7n4FJ2
         8hoSTChU5ACu0OHK6OSsqS5HvFPHPjR3LHebw50H9hVXAgR0nhSogJKOzE54bFN3Zx
         38VP84pBrhDr5dj+Kg8yeARYoX+ohbmpJZrr7gFmYfB6881CeknqGfOyes15WkPj6j
         PkG86D31EHko01qDzLMjtIUQ8vk7evRzKrBAZLU4TWpCnpjgWipgGgVFZ+vzf0VNWD
         DEcglOY0eqq2OPknv+jkVsaY=
Date:   Mon, 27 Feb 2023 19:57:29 +0100
From:   Thomas Glanzmann <thomas@glanzmann.de>
To:     linux-usb@vger.kernel.org
Subject: xhci_hcd: USB-2 devices are not usable after replug
Message-ID: <Y/z9GdHjPyF2rNG3@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
my USB-2 mouse and keyboard works when connected while I'm booting. If I
replug them, I get in the dmesg the following lines and they no longer
work:

[   48.739931] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
[   48.739938] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
[   48.739941] usb usb1-port1: couldn't allocate usb_device
[   48.776022] xhci_hcd 0000:0c:00.0: WARN: xHC save state timeout
[   48.776032] xhci_hcd 0000:0c:00.0: PM: suspend_common(): xhci_pci_suspend+0x0/0x150 [xhci_pci] returns -110
[   48.776041] xhci_hcd 0000:0c:00.0: can't suspend (hcd_pci_runtime_suspend [usbcore] returned -110)

If I plug them in USB-3 port they work. Is this a known issue? Is there a
workaround? Has someone a patch that I can test?

Find the output of dmesg, lsusb, lspci, dmidecode and lscpu here:

https://tg.st/u/6c2aa1c7120cc64e2d90863dc3afea4d4c9e3d6f56666fc681c02ee5f0728130.txt

I'm running v6.2.1 with a Debian bookwork userland and have the latest
linux-firmware from git installed.

Cheers,
        Thomas
