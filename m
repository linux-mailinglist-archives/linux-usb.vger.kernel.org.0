Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6247E7854CA
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 12:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbjHWKBi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 06:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbjHWKBT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 06:01:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088C4E7C
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692784877; x=1724320877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WZAUpslPj2yfejNoH79fLQiJ+GlJ2t91M7bRXqGZsSw=;
  b=bAyunSB9+BQ8zF1YHA3PjTKqD1D6nJyaJbAhIDNVoPn5YNz+DZZfcgKQ
   QSihvVy6ZXZRnN7e+Yx97oxjgL2G2gFjeadO4Ub/10pq+eI1RfuGc16DX
   G/Cqdkym6WtCWy/nqu9RBcxbQmyZxIHFzoF2oOf/niYtr5RzwcOOO2pJp
   QaCWJL2CjE7KQ7kcBwwbYbihmmRkxvrrEiThLUnE8MHIr9P2FXK6LiMUV
   z70862HTbpmstz9LKYOYWVU4fRpM3IDbZ9sy8eDleOSbygoNpTgKpVaE+
   pY0S7nZZMGhjItrK+QmBGxA1EM0lGVx1UggGGW7XwGW4VGZ7R/TICX6pz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460488092"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460488092"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 03:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880337442"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Aug 2023 03:01:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Aug 2023 13:01:13 +0300
Date:   Wed, 23 Aug 2023 13:01:13 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Benson Leung <bleung@google.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
Message-ID: <ZOXY6U4RRmmmkmLJ@kuha.fi.intel.com>
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
 <CANLzEkvrg3F=T4jxqcNTMLNgwr8JoN1jCf05P--8oNbN3+56PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLzEkvrg3F=T4jxqcNTMLNgwr8JoN1jCf05P--8oNbN3+56PA@mail.gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 22, 2023 at 05:24:44PM -0700, Benson Leung wrote:
> Hi Heikki,
> 
> On Tue, Aug 22, 2023 at 6:32 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Benson,
> >
> > RFC for now. I can't test these properly. If you guys could take over
> > this, I would much appreciated. I hope this is at least close to your
> > proposal.
> >
> > With this (or something like it) you should be able to get
> > notification about USB connections and disconnections to your port
> > driver by implementing the new "attach" and "deattach" callbacks in
> > struct typec_partner_desc. The typec partner devices will also have
> > symlinks to the enumerated USB devices and vise versa.
> >
> > I took a little shortcut and did not implement a proper device list.
> > Instead there is now only a member for the USB2 device and a member
> > for the USB3 device in struct typec_port, so with this only USB is
> > supported. But the API does not deal with struct usb_device, so
> > extending this to support other devices (TBT, Displayport, etc.) by
> > adding the actual device list should be fairly easy.
> >
> > thanks,
> >
> > Heikki Krogerus (2):
> >   usb: typec: Link enumerated USB devices with Type-C partner
> >   usb: Inform the USB Type-C class about enumerated devices
> >
> >  drivers/usb/core/hub.c          |   4 ++
> >  drivers/usb/core/hub.h          |   3 +
> >  drivers/usb/core/port.c         |  19 +++++-
> >  drivers/usb/typec/class.c       | 108 +++++++++++++++++++++++++++++---
> >  drivers/usb/typec/class.h       |  16 +++++
> >  drivers/usb/typec/port-mapper.c |   9 ++-
> >  include/linux/usb/typec.h       |  37 +++++++++++
> >  7 files changed, 184 insertions(+), 12 deletions(-)
> >
> > --
> > 2.40.1
> >
> 
> Tested-by: Benson Leung <bleung@chromium.org>
> 
> 
> I picked these two changes back to my Brya/Redrix Chromebook which has
> the PLD changes to link subsystems.
> 
> First I plugged in a USB-C to USB-A receptacle adapter with a USB3
> thumbdrive into port0, and went to the port0-partner path.
> 
> redrix-rev3 /sys/class/typec/port0-partner # ls -lh
> total 0
> lrwxrwxrwx. 1 root root    0 Aug 22 17:16 2-1 ->
> ../../../../../../../0000:00:0d.0/usb2/2-1
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 accessory_mode
> lrwxrwxrwx. 1 root root    0 Aug 22 17:14 device -> ../../port0
> drwxr-xr-x. 2 root root    0 Aug 22 17:14 identity
> drwxr-xr-x. 2 root root    0 Aug 22 17:14 power
> lrwxrwxrwx. 1 root root    0 Aug 22 17:14 subsystem ->
> ../../../../../../../../../class/typec
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 supports_usb_power_delivery
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 type
> -rw-r--r--. 1 root root 4.0K Aug 22 17:14 uevent
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 usb_power_delivery_revision
> 
> 2-1 symlink appears, which is the SuperSpeed usb device associated
> with the thumbdrive.
> Unplugging the USB3 thumbdrive without unplugging the C-to-A adapter,
> and then plugging in a USB2.0 security key:
> 
> redrix-rev3 /sys/class/typec/port0-partner # ls -lh
> total 0
> lrwxrwxrwx. 1 root root    0 Aug 22 17:19 3-1 ->
> ../../../../../../../0000:00:14.0/usb3/3-1
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 accessory_mode
> lrwxrwxrwx. 1 root root    0 Aug 22 17:14 device -> ../../port0
> drwxr-xr-x. 2 root root    0 Aug 22 17:14 identity
> drwxr-xr-x. 2 root root    0 Aug 22 17:14 power
> lrwxrwxrwx. 1 root root    0 Aug 22 17:14 subsystem ->
> ../../../../../../../../../class/typec
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 supports_usb_power_delivery
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 type
> -rw-r--r--. 1 root root 4.0K Aug 22 17:14 uevent
> -r--r--r--. 1 root root 4.0K Aug 22 17:14 usb_power_delivery_revision
> 
> 2-1 node disappears. 3-1 appears
> 
> Unplugging the adapter, plugging in a USB4 hub:
> redrix-rev3 /sys/class/typec/port0-partner # ls -lh
> total 0
> lrwxrwxrwx. 1 root root    0 Aug 22 17:21 2-1 ->
> ../../../../../../../0000:00:0d.0/usb2/2-1
> lrwxrwxrwx. 1 root root    0 Aug 22 17:21 3-1 ->
> ../../../../../../../0000:00:14.0/usb3/3-1
> -r--r--r--. 1 root root 4.0K Aug 22 17:21 accessory_mode
> lrwxrwxrwx. 1 root root    0 Aug 22 17:21 device -> ../../port0
> drwxr-xr-x. 2 root root    0 Aug 22 17:21 identity
> -r--r--r--. 1 root root 4.0K Aug 22 17:21 number_of_alternate_modes
> drwxr-xr-x. 5 root root    0 Aug 22 17:21 pd0
> drwxr-xr-x. 4 root root    0 Aug 22 17:21 port0-partner.0
> drwxr-xr-x. 2 root root    0 Aug 22 17:21 power
> lrwxrwxrwx. 1 root root    0 Aug 22 17:21 subsystem ->
> ../../../../../../../../../class/typec
> -r--r--r--. 1 root root 4.0K Aug 22 17:21 supports_usb_power_delivery
> -r--r--r--. 1 root root 4.0K Aug 22 17:21 type
> -rw-r--r--. 1 root root 4.0K Aug 22 17:21 uevent
> lrwxrwxrwx. 1 root root    0 Aug 22 17:21 usb_power_delivery -> pd0
> -r--r--r--. 1 root root 4.0K Aug 22 17:21 usb_power_delivery_revision
> 
> Both 2-1 and 3-1 are linked.
> 
> Thanks so much for this, Heikki! I can look a little closer at the
> attach and deattach callbacks in our typec port driver in a little
> while.

Cool! Thank you!

-- 
heikki
