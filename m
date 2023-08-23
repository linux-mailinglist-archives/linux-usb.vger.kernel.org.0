Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3EF5784DC6
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 02:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjHWAZA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 20:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjHWAY7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 20:24:59 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B7FCE8
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 17:24:57 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-529fa243739so6628a12.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692750296; x=1693355096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEv6SqhDMSY2QsBHQRqllRyeGUGD2nbAqO1ejPeBQAc=;
        b=o5rcLC6+bxqPms0xMyTiny9yYOfgAoVHwfsUhQCp/CbNFF5LQV3W5MrVWdWdq0CGdI
         V2duZHWl4WuEOedR7iRiOljRwRDlQiJpr0hi/IOlRUE6yh97637yDNNn315LRi+RPy20
         lTGI2sG8AJ2LQ/IppTfGX8oZa5dYbuo3f5c2XfRqa8lY5RFJKzfCwvr6VI10mDbvC3NS
         +ydf61dOqKe3JjxBKYma16Wf26NfrFDZaaj/WNi/8eIDSExyNpVH+RfffCbTLgLnpB4E
         hhGLxbuASLDw5yqa2rwuWtiiiLPrYABiM5a7kBFcVT0inmwnKp0qXIDUs/hbGB8sentG
         QlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692750296; x=1693355096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEv6SqhDMSY2QsBHQRqllRyeGUGD2nbAqO1ejPeBQAc=;
        b=BLIWMASmXkvPe2tdnNLatXE00UH4pbU76nzQc5130tRbAqrKahaDhczYoK9qTZ9vJb
         7YUCfhnA51tti+xu+cXncbEEdXZ4+ZEPMvVbG4HN19YtmCsAfjoWhAtkEty2zhkTv4IU
         pUBU48Yn+Izcp140mHYYrtMPJbWxFPiszRWd7tg2X9IqMg1fiECKOfEDANcYBEBT6X8o
         XnTnMqWvV88tj0JKCnEouw/kp+j/muPoKoiqJhLuge/ygudk/UlfrqLpUWPcqkllE7yH
         Kak59sLlyZFzcnZM2/tdwiEx0FfSvvJ0fcHUYfmLNNpk+70Zr8xb7l2+IC1gYjv1ugx5
         QqDg==
X-Gm-Message-State: AOJu0YyzndFyVwCg+j5ibly6B6q7hoBecEdAp1/uWdqsmUzcDwPoIW+6
        pfZGGhoxxL3ymCabShEYuwPljScoRQJqYVmB86h/cA==
X-Google-Smtp-Source: AGHT+IHw/qKSdzDnVUs2KHpsrW0Lu47wh1MGqIoLlJRJN5AIQYxb77IB38AI9A20BKj0P+hTs74Z1u4Mrd1tEpFJl7M=
X-Received: by 2002:a50:f690:0:b0:523:d5bc:8424 with SMTP id
 d16-20020a50f690000000b00523d5bc8424mr184738edn.5.1692750296145; Tue, 22 Aug
 2023 17:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
From:   Benson Leung <bleung@google.com>
Date:   Tue, 22 Aug 2023 17:24:44 -0700
Message-ID: <CANLzEkvrg3F=T4jxqcNTMLNgwr8JoN1jCf05P--8oNbN3+56PA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Tue, Aug 22, 2023 at 6:32=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Benson,
>
> RFC for now. I can't test these properly. If you guys could take over
> this, I would much appreciated. I hope this is at least close to your
> proposal.
>
> With this (or something like it) you should be able to get
> notification about USB connections and disconnections to your port
> driver by implementing the new "attach" and "deattach" callbacks in
> struct typec_partner_desc. The typec partner devices will also have
> symlinks to the enumerated USB devices and vise versa.
>
> I took a little shortcut and did not implement a proper device list.
> Instead there is now only a member for the USB2 device and a member
> for the USB3 device in struct typec_port, so with this only USB is
> supported. But the API does not deal with struct usb_device, so
> extending this to support other devices (TBT, Displayport, etc.) by
> adding the actual device list should be fairly easy.
>
> thanks,
>
> Heikki Krogerus (2):
>   usb: typec: Link enumerated USB devices with Type-C partner
>   usb: Inform the USB Type-C class about enumerated devices
>
>  drivers/usb/core/hub.c          |   4 ++
>  drivers/usb/core/hub.h          |   3 +
>  drivers/usb/core/port.c         |  19 +++++-
>  drivers/usb/typec/class.c       | 108 +++++++++++++++++++++++++++++---
>  drivers/usb/typec/class.h       |  16 +++++
>  drivers/usb/typec/port-mapper.c |   9 ++-
>  include/linux/usb/typec.h       |  37 +++++++++++
>  7 files changed, 184 insertions(+), 12 deletions(-)
>
> --
> 2.40.1
>

Tested-by: Benson Leung <bleung@chromium.org>


I picked these two changes back to my Brya/Redrix Chromebook which has
the PLD changes to link subsystems.

First I plugged in a USB-C to USB-A receptacle adapter with a USB3
thumbdrive into port0, and went to the port0-partner path.

redrix-rev3 /sys/class/typec/port0-partner # ls -lh
total 0
lrwxrwxrwx. 1 root root    0 Aug 22 17:16 2-1 ->
../../../../../../../0000:00:0d.0/usb2/2-1
-r--r--r--. 1 root root 4.0K Aug 22 17:14 accessory_mode
lrwxrwxrwx. 1 root root    0 Aug 22 17:14 device -> ../../port0
drwxr-xr-x. 2 root root    0 Aug 22 17:14 identity
drwxr-xr-x. 2 root root    0 Aug 22 17:14 power
lrwxrwxrwx. 1 root root    0 Aug 22 17:14 subsystem ->
../../../../../../../../../class/typec
-r--r--r--. 1 root root 4.0K Aug 22 17:14 supports_usb_power_delivery
-r--r--r--. 1 root root 4.0K Aug 22 17:14 type
-rw-r--r--. 1 root root 4.0K Aug 22 17:14 uevent
-r--r--r--. 1 root root 4.0K Aug 22 17:14 usb_power_delivery_revision

2-1 symlink appears, which is the SuperSpeed usb device associated
with the thumbdrive.
Unplugging the USB3 thumbdrive without unplugging the C-to-A adapter,
and then plugging in a USB2.0 security key:

redrix-rev3 /sys/class/typec/port0-partner # ls -lh
total 0
lrwxrwxrwx. 1 root root    0 Aug 22 17:19 3-1 ->
../../../../../../../0000:00:14.0/usb3/3-1
-r--r--r--. 1 root root 4.0K Aug 22 17:14 accessory_mode
lrwxrwxrwx. 1 root root    0 Aug 22 17:14 device -> ../../port0
drwxr-xr-x. 2 root root    0 Aug 22 17:14 identity
drwxr-xr-x. 2 root root    0 Aug 22 17:14 power
lrwxrwxrwx. 1 root root    0 Aug 22 17:14 subsystem ->
../../../../../../../../../class/typec
-r--r--r--. 1 root root 4.0K Aug 22 17:14 supports_usb_power_delivery
-r--r--r--. 1 root root 4.0K Aug 22 17:14 type
-rw-r--r--. 1 root root 4.0K Aug 22 17:14 uevent
-r--r--r--. 1 root root 4.0K Aug 22 17:14 usb_power_delivery_revision

2-1 node disappears. 3-1 appears

Unplugging the adapter, plugging in a USB4 hub:
redrix-rev3 /sys/class/typec/port0-partner # ls -lh
total 0
lrwxrwxrwx. 1 root root    0 Aug 22 17:21 2-1 ->
../../../../../../../0000:00:0d.0/usb2/2-1
lrwxrwxrwx. 1 root root    0 Aug 22 17:21 3-1 ->
../../../../../../../0000:00:14.0/usb3/3-1
-r--r--r--. 1 root root 4.0K Aug 22 17:21 accessory_mode
lrwxrwxrwx. 1 root root    0 Aug 22 17:21 device -> ../../port0
drwxr-xr-x. 2 root root    0 Aug 22 17:21 identity
-r--r--r--. 1 root root 4.0K Aug 22 17:21 number_of_alternate_modes
drwxr-xr-x. 5 root root    0 Aug 22 17:21 pd0
drwxr-xr-x. 4 root root    0 Aug 22 17:21 port0-partner.0
drwxr-xr-x. 2 root root    0 Aug 22 17:21 power
lrwxrwxrwx. 1 root root    0 Aug 22 17:21 subsystem ->
../../../../../../../../../class/typec
-r--r--r--. 1 root root 4.0K Aug 22 17:21 supports_usb_power_delivery
-r--r--r--. 1 root root 4.0K Aug 22 17:21 type
-rw-r--r--. 1 root root 4.0K Aug 22 17:21 uevent
lrwxrwxrwx. 1 root root    0 Aug 22 17:21 usb_power_delivery -> pd0
-r--r--r--. 1 root root 4.0K Aug 22 17:21 usb_power_delivery_revision

Both 2-1 and 3-1 are linked.

Thanks so much for this, Heikki! I can look a little closer at the
attach and deattach callbacks in our typec port driver in a little
while.

Benson
--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
