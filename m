Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB02B25A9C3
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgIBLCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 07:02:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:45526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgIBLA6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 07:00:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B4462098B;
        Wed,  2 Sep 2020 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599044458;
        bh=j4+uze57jaKSPdl86kFYD2e9uQbKV5r15/uY12dIyTg=;
        h=From:To:Cc:Subject:Date:From;
        b=KQUO8aM0q8lsyoUUjY1fm6YU4t2DKhsqnX34r/3z+mUnF/A0LAw4CpM+HoGp5C8jE
         ALIP8QBgkZVfrtSQC+aqQvkiNcSo74O8YlA/2qydObCgkoRhhadHuwtgZFMwm+W+Pt
         XNZGfKbfo3XL74KKdqVUQNqBunRG7kfSVX5o+8Uo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org
Cc:     perex@perex.cz, tiwai@suse.com, stern@rowland.harvard.ed,
        linux-kernel@vger.kernel.org, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/10] USB: new USB control message helper functions
Date:   Wed,  2 Sep 2020 13:01:02 +0200
Message-Id: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In a recent discussion about a USB networking bug found by syzbot, and
fixed by Himadri Pandya, the design of the existing usb_control_msg()
call was brought up as not being the "nicest" thing to use by Dmitry
Vyukov:
	https://lore.kernel.org/r/CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com

The function makes it hard to get right, in that it will return the
number of bytes sent/received, but almost no one checks to see if a
short read/write happens.  With a malicious, or broken, USB device, this
can cause drivers to act on data that they did not anticipate, and
sometimes copy internal kernel data out to userspace.

So let's fix this up by creating two new functions,
usb_control_msg_send() and usb_control_msg_recv().  These functions
either complete the full transation, or they return an error, a short
send/recv is now an error.

They also accept data off of the stack, saving individual drivers the
pain of having to constantly allocate memory on their own for tiny
messages, thereby saving overall kernel code space.

The api also does not require a raw USB "pipe" to be sent to the
function, as we know the direction, so just pass in the endpoint number
instead, again making it easier on the USB driver author to use.

This series first takes a helper function out of the sound core for
verifying USB endpoints to be able to use internally, and then adds the
new functions, converts over some internal USB code to use them, and
then starts to clean up some drivers using these new functions, as an
example of the savings that can happen by using these functions.

Thanks to Dmitry and Himadri for the idea on how to do all of this.

greg k-h

Greg Kroah-Hartman (10):
  USB: move snd_usb_pipe_sanity_check into the USB core
  USB: add usb_control_msg_send() and usb_control_msg_recv()
  USB: core: message.c: use usb_control_msg_send() in a few places
  USB: core: hub.c: use usb_control_msg_send() in a few places
  USB: legousbtower: use usb_control_msg_recv()
  sound: usx2y: move to use usb_control_msg_send()
  sound: 6fire: move to use usb_control_msg_send() and
    usb_control_msg_recv()
  sound: line6: move to use usb_control_msg_send() and
    usb_control_msg_recv()
  sound: hiface: move to use usb_control_msg_send()
  Bluetooth: ath3k: use usb_control_msg_send() and
    usb_control_msg_recv()

 drivers/bluetooth/ath3k.c       |  90 +++++------------
 drivers/usb/core/hub.c          | 128 +++++++++---------------
 drivers/usb/core/message.c      | 171 ++++++++++++++++++++++++++++----
 drivers/usb/core/urb.c          |  29 ++++--
 drivers/usb/misc/legousbtower.c |  60 ++++-------
 include/linux/usb.h             |   7 ++
 sound/usb/6fire/firmware.c      |  38 +++----
 sound/usb/helper.c              |  16 +--
 sound/usb/helper.h              |   1 -
 sound/usb/hiface/pcm.c          |  14 ++-
 sound/usb/line6/driver.c        |  69 +++++--------
 sound/usb/line6/podhd.c         |  17 ++--
 sound/usb/line6/toneport.c      |   8 +-
 sound/usb/mixer_scarlett_gen2.c |   2 +-
 sound/usb/quirks.c              |  12 +--
 sound/usb/usx2y/us122l.c        |  42 ++------
 16 files changed, 345 insertions(+), 359 deletions(-)

-- 
2.28.0

