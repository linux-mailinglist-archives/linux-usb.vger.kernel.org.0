Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E623F4DB5FD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357493AbiCPQVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357504AbiCPQVD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:03 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435C86D4F1
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:47 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id s8so4359920pfk.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1VSh1hQRuDRtcQ9TmWjdBiBHcajg3PSuX7fwreN9s3A=;
        b=PePlyu9HvdbgQNrR9cDVSZHeSS5z4SQkwfgiK6OgL8vW0EEMz0zvkQlVVmVxaxNEuG
         0eO3IvWrEuqFckZS1Ey2Odtx+SIHVv/zlaMJqCE3Aq4bqCDdzO5wVUuHtpvADBccVXh2
         K9c7R7EpyBrWmV4VwD1DnVDqzeFE+bPvr6ZlO+IH0+fki3cFp2zy2v6PSSmkixyfLw7o
         ed30TNX5Snp5Sy2FxHhXVCw6juRiu0nsw7++Cigs21/UaJrQveUuGmvDfucru2EMN1UR
         zXbr2ibnN1tyDxuqUsK/xsGl4B85uqnfBvXflgNd5O6jza1JXh3fT9iEN76405vUfhVb
         Zz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1VSh1hQRuDRtcQ9TmWjdBiBHcajg3PSuX7fwreN9s3A=;
        b=UvwRo2o5rXBBD37EBNTbJH6LIubYRPK+0mQTrgeJZCy/HgNIUXUxo8Ragr4/j3uF7J
         4n88tsTN86V4OafpNw/hllsM6tO7Jvg5LwhiMqMlbhtNKr1rllmMki2d/zOSjz0O2eId
         Q6PujrLDfCGilLr82CDWVj53MYzy2q7c/CmWwQGWor68eff+BcqCukoCzKoip7IV1pPb
         w6oV7rRuOjSllC7BMXHlUiQ82FZyUNOdwDJyw4XyGw0JGPv9xdXJwaddHVTWrzr/IgQ1
         HWJcz2K0qPVpRY7JgCMeC8mbfWC6IZyWyJSfXliyoX3ZM8gslbtr0a0zbJLVNLhdXZSD
         SDeQ==
X-Gm-Message-State: AOAM533M0oQtska8H8ivEmYc26iIM/4v7vLEn7PaS2IRed+yb8Mb+iHl
        jWy0IvLuj2hxmhAC6X3HGINrVHtQDs4=
X-Google-Smtp-Source: ABdhPJw3faQOLdOnJgfRNofq6so6rjglRcf/q+ldDqgnWsoDqUPB1uzQT8lbCvCyHnsx/v4Q+tb6pQ==
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id z5-20020a056a00240500b004e15008adccmr420950pfh.35.1647447586667;
        Wed, 16 Mar 2022 09:19:46 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:19:46 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v3 0/9] usb: rework usb_maxpacket() and remove its third argument
Date:   Thu, 17 Mar 2022 01:19:26 +0900
Message-Id: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series rework usb_maxpacket() to change its prototype from:
| static inline __u16
| usb_maxpacket(struct usb_device *udev, int pipe, int is_out)

into:
| static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)

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

    * Patch 1: make usb_maxpacket() variadic to accommodate during the
      migration

    * Patch 2 to 7: migrate all the users of usb_maxpacket() (one
      patch per tree)

    * Patch 8: remove the third argument of usb_maxpacket() now that
      everyone is migrated

    * Patch 9: fully rework usb_maxpacket()'s body using
      usb_pipe_endpoint()



** Changelog: **

  v2 -> v3:

    * remove patch 1 and 2 from the series because already applied to
      usb-testing.

    * split the change on usb_maxpacket in tiny steps:
       - a first patch to make the function variadic (patch 1 of this
         series)
       - a second one to remove the third argrument (patch 8 of this
         series)
       - a third and last one to fully rework the body and use
         usb_pipe_endpoint() (patch 9 of this series)

    * keep current variable names (do not rename usb_maxpacket
      parameter from udev to dev).

    c.f.:
    https://lore.kernel.org/linux-usb/YiIgGOkNntEiu78O@kroah.com/T/#m6a218544713670448c156ead95e72e8e1aa2373b


  v1 -> v2:

    * v1 contained a single patch, split it into a series. c.f.:
    https://lore.kernel.org/linux-usb/YiIgGOkNntEiu78O@kroah.com/T/#m6d25529f1cab1332b45e3e24480d541963684446


Vincent Mailhol (9):
  usb: deprecate the third argument of usb_maxpacket()
  HID: usbhid: remove third argument of usb_maxpacket()
  Input: remove third argument of usb_maxpacket()
  media: remove third argument of usb_maxpacket()
  net: remove third argument of usb_maxpacket()
  usb: remove third argument of usb_maxpacket()
  sound: usb: remove third argument of usb_maxpacket()
  usb: remove third argument of usb_maxpacket()
  usb: rework usb_maxpacket() using usb_pipe_endpoint()

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
 drivers/usb/isp1760/isp1760-hcd.c             |  6 ++---
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
 46 files changed, 71 insertions(+), 101 deletions(-)

-- 
2.34.1

