Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB91F4CE9EE
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 08:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbiCFH5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 02:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbiCFH5J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 02:57:09 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9DB50B22
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 23:56:17 -0800 (PST)
Received: from localhost.localdomain ([106.133.32.90])
        by smtp.orange.fr with ESMTPA
        id Qljkni9jQu3WEQljsnB7li; Sun, 06 Mar 2022 08:56:15 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Sun, 06 Mar 2022 08:56:15 +0100
X-ME-IP: 106.133.32.90
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 00/10] usb: rework usb_maxpacket() and remove its third argument
Date:   Sun,  6 Mar 2022 16:55:14 +0900
Message-Id: <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series rework usb_maxpacket() to change its prototype from:
| static inline __u16
| usb_maxpacket(struct usb_device *udev, int pipe, int is_out)

into:
| static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)

and rewrite the function.

Rationale:

  * The third argument of usb_maxpacket(): is_out can be derived from
    its second one: pipe using usb_pipeout(pipe). Furthermore,
    usb_pipeout(pipe) is being called within usb_maxpacket()
    regardless to confirm the input.

  * This function is not exposed to the UAPI so return type should be
    u16, not __u16.

  * Let's not reinvent the wheel and rely on usb_endpoint_maxp() to
    make this a one liner function.

In order to do so, usb_maxpacket() is temporarily changed into a variadic
function to ignore its third argument.

The series goes as follow:

    * Patches 1 and 2: preparation, remove a redundant call to the
      local macro max_packet() in two drivers

    * Patch 3: reword usb_maxpacket() and make it variadic to
      accommodate during the migration

    * Patch 4 to 9: migrate all the users of usb_maxpacket() (one
      patch per tree)

    * Patch 10: remove the third argument of usb_maxpacket() now that
      everyone is migrated



** Changelog: **

  v1 -> v2:

    * v1 contained a single patch, split it into a series. c.f.:
    https://lore.kernel.org/linux-usb/YiIgGOkNntEiu78O@kroah.com/T/#m6d25529f1cab1332b45e3e24480d541963684446

Vincent Mailhol (10):
  usb: oxu210hp-hcd: remove redundant call to max_packet() macro
  usb: isp1760: remove redundant max_packet() macro
  usb: rework usb_maxpacket() and deprecate its third argument
  HID: usbhid: remove third argument of usb_maxpacket()
  Input: remove third argument of usb_maxpacket()
  media: remove third argument of usb_maxpacket()
  net: remove third argument of usb_maxpacket()
  usb: remove third argument of usb_maxpacket()
  sound: usb: remove third argument of usb_maxpacket()
  usb: remove third argument of usb_maxpacket()

 drivers/hid/usbhid/hid-core.c                 |  2 +-
 drivers/hid/usbhid/usbkbd.c                   |  2 +-
 drivers/hid/usbhid/usbmouse.c                 |  2 +-
 drivers/input/misc/ati_remote2.c              |  2 +-
 drivers/input/misc/cm109.c                    |  2 +-
 drivers/input/misc/powermate.c                |  2 +-
 drivers/input/misc/yealink.c                  |  2 +-
 drivers/input/tablet/acecad.c                 |  2 +-
 drivers/input/tablet/pegasus_notetaker.c      |  2 +-
 drivers/media/rc/ati_remote.c                 |  4 ++--
 drivers/media/rc/mceusb.c                     |  2 +-
 drivers/media/rc/streamzap.c                  |  2 +-
 drivers/media/rc/xbox_remote.c                |  2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c         |  2 +-
 drivers/media/usb/tm6000/tm6000-input.c       |  2 +-
 drivers/media/usb/tm6000/tm6000-video.c       |  2 +-
 drivers/net/usb/cdc_ncm.c                     |  4 ++--
 drivers/net/usb/lan78xx.c                     |  4 ++--
 drivers/net/usb/rndis_host.c                  |  2 +-
 drivers/net/usb/usbnet.c                      |  4 ++--
 drivers/net/wireless/mediatek/mt76/usb.c      |  2 +-
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    |  4 ++--
 drivers/usb/atm/usbatm.c                      |  2 +-
 drivers/usb/c67x00/c67x00-sched.c             |  4 ++--
 drivers/usb/core/hub.c                        |  2 +-
 drivers/usb/host/ehci-q.c                     |  4 ++--
 drivers/usb/host/fhci-hcd.c                   |  3 +--
 drivers/usb/host/fotg210-hcd.c                |  2 +-
 drivers/usb/host/isp116x-hcd.c                |  5 ++--
 drivers/usb/host/isp1362-hcd.c                |  6 ++---
 drivers/usb/host/max3421-hcd.c                |  6 ++---
 drivers/usb/host/ohci-hcd.c                   |  3 +--
 drivers/usb/host/oxu210hp-hcd.c               |  4 ++--
 drivers/usb/host/r8a66597-hcd.c               |  3 +--
 drivers/usb/host/sl811-hcd.c                  |  6 ++---
 drivers/usb/isp1760/isp1760-hcd.c             |  7 ++----
 drivers/usb/misc/ftdi-elan.c                  | 15 ++++--------
 drivers/usb/misc/lvstest.c                    |  2 +-
 drivers/usb/storage/onetouch.c                |  2 +-
 drivers/usb/storage/transport.c               |  2 +-
 include/linux/usb.h                           | 23 ++-----------------
 sound/usb/line6/pcm.c                         |  4 ++--
 sound/usb/midi.c                              |  4 ++--
 sound/usb/usx2y/usb_stream.c                  |  6 ++---
 sound/usb/usx2y/usbusx2yaudio.c               |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |  2 +-
 46 files changed, 71 insertions(+), 102 deletions(-)

-- 
2.34.1

