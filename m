Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A868E3C3C28
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 14:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhGKMSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 08:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhGKMSl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Jul 2021 08:18:41 -0400
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAEEC0613DD
        for <linux-usb@vger.kernel.org>; Sun, 11 Jul 2021 05:15:55 -0700 (PDT)
Received: from [84.114.224.132] (port=47972 helo=butterfield.nothingisreal.com)
        by balrog.mythic-beasts.com with esmtpa (Exim 4.92.3)
        (envelope-from <psychonaut@nothingisreal.com>)
        id 1m2YNF-0007yt-Bv; Sun, 11 Jul 2021 13:15:53 +0100
Received: from nuc.nothingisreal.com (localhost [IPv6:::1])
        by butterfield.nothingisreal.com (Postfix) with ESMTP id 48FED1FBC7;
        Sun, 11 Jul 2021 14:15:46 +0200 (CEST)
Date:   Sun, 11 Jul 2021 14:15:46 +0200
From:   Tristan Miller <psychonaut@nothingisreal.com>
To:     linux-usb@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: "Chipmunk audio" on Logitech USB webcams
Message-ID: <20210711141546.0ac1eec7.psychonaut@nothingisreal.com>
In-Reply-To: <YOrKFIlEHopiVKJT@kroah.com>
References: <20210711102503.179b154b.psychonaut@nothingisreal.com>
        <YOrKFIlEHopiVKJT@kroah.com>
Organization: https://logological.org/
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 10
X-Spam-Status: No, score=1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings.

On Sun, 11 Jul 2021 12:38:12 +0200, Greg KH
<gregkh@linuxfoundation.org> wrote:
> On Sun, Jul 11, 2021 at 10:25:03AM +0200, Tristan Miller wrote:
> > Many models of Logitech USB webcams malfunction under Linux by
> > producing audio that sounds distorted, garbled, or high-pitched.
> > For most users, the problem happens randomly, and can usually be
> > worked around by restarting the audio application or by unplugging
> > the webcam and then plugging it back in again.
> 
> Please report the information directly here, to this list, and to the
> sound developers at alsa-devel@alsa-project.org and we can all work to
> resolve this.

The problem as I'm currently experiencing it is as follows:

I have a Logitech C270 USB webcam running on openSUSE Tumbleweed for
x86_64 with the 5.13.0 kernel.  Sometimes audio recorded by the
camera's built-in microphone sounds artificially high-pitched and
garbled.  I've experienced this with lots of different applications,
including arecord, Skype, and various browser-based videoconferencing
software running in Firefox or Chromium.  The problem occurs rarely
(maybe once every 30 times I use the webcam microphone) and seemingly
at random; restarting the audio application or unplugging the webcam
and plugging it back in again usually works around the issue.  So
unfortunately I can't reliably reproduce the problem.  I haven't
noticed any errors in the system logs but then again am not sure exactly
what to look for and where. I've been experiencing this problem at
least as far back as kernel 4.13.12.

Some further details (more available on request):

# uname -a
Linux butterfield.nothingisreal.com 5.13.0-1-default #1 SMP Fri Jul 2 05:54:32 UTC 2021 (aa40472) x86_64 x86_64 x86_64 GNU/Linux

# lsusb -s 001:004 -v |head -17
Bus 001 Device 004: ID 046d:0825 Logitech, Inc. Webcam C270
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x046d Logitech, Inc.
  idProduct          0x0825 Webcam C270
  bcdDevice            0.10
  iManufacturer           0 
  iProduct                0 
  iSerial                 2 6457F4D0
  bNumConfigurations

Previous reports which apparently cover the same problem:

https://bugzilla.kernel.org/show_bug.cgi?id=35922
https://bugzilla.kernel.org/show_bug.cgi?id=44281
https://bugzilla.kernel.org/show_bug.cgi?id=105081
https://bugzilla.kernel.org/show_bug.cgi?id=203763
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/459445
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/843431
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/884210
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1018020
https://bugzilla.suse.com/show_bug.cgi?id=736093
https://bugzilla.redhat.com/show_bug.cgi?id=729269
https://bugzilla.redhat.com/show_bug.cgi?id=742010
https://bugs.archlinux.org/task/26528
https://bbs.archlinux.org/viewtopic.php?id=121607
https://bbs.archlinux.org/viewtopic.php?id=236056
https://forums.linuxmint.com/viewtopic.php?t=237677

Regards,
Tristan

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                  Tristan Miller
Free Software developer, ferret herder, logologist
             https://logological.org/
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
