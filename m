Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3C549625E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381708AbiAUPxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:53:22 -0500
Received: from cable.insite.cz ([84.242.75.189]:53535 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381701AbiAUPxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 10:53:20 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 424D9A1A3D404;
        Fri, 21 Jan 2022 16:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780397; bh=IEnt5TgC3qQalkRD+LLGjaXajeg4DBcTWXtxo3qjUJs=;
        h=From:To:Cc:Subject:Date:From;
        b=DMJGmYMStoI7klhkCPa5Kchi4QGXGoADsJtpS+cTCNPN6NV0gT3xlHO6NRQnpgACZ
         LVVfuCwV+vOanxUO0xcYfJovSEux9ShVT4CrsZptavD9mEjuECpSCxRYEdZHEi/UPi
         O7Fyc1brFygJO7jHh+6+gPP58UusmfGD6ADRGMbM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wLw4i2ZgBr-G; Fri, 21 Jan 2022 16:53:10 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C4FDAA1A3D401;
        Fri, 21 Jan 2022 16:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780390; bh=IEnt5TgC3qQalkRD+LLGjaXajeg4DBcTWXtxo3qjUJs=;
        h=From:To:Cc:Subject:Date:From;
        b=VkfKFdkZloiSXmMnZ3u8vDzwjBi0yaxSBTzDxS182igXrGpo6VXRgv8mDgDRA0iGR
         HIXbXydZUKOGiTWmyMl611bdjPkcWgfq1+SEtPNARyMhlQXmP/22oRIjVRPk3zel1o
         /KsTEY4aGpeRD/v7J7OUeSOid1/xQfwaKZy6ms5g=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 00/10] usb: gadget: audio: Multiple rates, notify
Date:   Fri, 21 Jan 2022 16:52:58 +0100
Message-Id: <20220121155308.48794-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series implements:
* Support for multiple rates in the audio gadget
* Notification of gadget-side alsa processes about playback/capture
  start/stop on the host side via Playback/Capture Rate controls.
* Detection of the USB cable disconnection by handling SUSPEND call
  in f_uac1/2. The disconnection generates a stop notification.

Patches for the multirate support, originally authored by Julian Scheel,
were rebased and modified for the current code base. Julian has
acknowledged the presented patches.

The detection of cable disconnection was discussed with dwc2 maintainer
Minas Harutyunyan who confirmed that the suspend event can be used
(https://lore.kernel.org/all/5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com/T/).
Tests on dwc2 have confirmed reliable detection, the gadget correctly
reports playback/capture stop at cable disconnection.

The start/stop/current rate notification feature is accompanied by
example implementation of audio gadget controller
https://github.com/pavhofman/gaudio_ctl. The controller also handles
debouncing fast start/stop events when USB host audio driver is loaded
and/or audio daemon re/started.

Changes:
--------

v2:
* Fixed compilation of "usb: gadget: f_uac1: Support multiple sampling
  rates" - added changes for CONFIG_GADGET_UAC1

v3:
* Implemented most of changes suggested by John Keeping
* Patches for bInterval calculation moved to a separate patch series
* Patches for stopping substreams moved to a separate patch series
* audio: Replaced deprecated macro S_IRUGO
* u_audio: Moved dynamic srate from params to rtd
* f_uac2: removed current state srates from struct f_uac2_opts, using
  u_audio_get_playback/capture_srate() instead.
* f_uac2: Reworked macros for struct cntrl_ranges_lay3_xxx

v4:
* Fixed the unused-but-set-variable warnings
* Patch "usb: gadget: f_uac2: Rename Clock Sources to fixed names"
  squashed to patch "usb: gadget: f_uac2: Support multiple sampling
  rates"

v5:
* Fixed sparse warnings (cast to restricted __le32, restricted __le16
  degrades to integer), as reported by the kernel test robot
  <lkp@intel.com>

Julian Scheel (3):
  usb: gadget: u_audio: Support multiple sampling rates
  usb: gadget: f_uac2: Support multiple sampling rates
  usb: gadget: f_uac1: Support multiple sampling rates

Pavel Hofman (7):
  usb: gadget:audio: Replace deprecated macro S_IRUGO
  usb: gadget: u_audio: Move dynamic srate from params to rtd
  usb: gadget: u_audio: Add capture/playback srate getter
  usb: gadget: u_audio: Rate ctl notifies about current srate
    (0=stopped)
  usb: gadget: u_audio: Add suspend call
  usb: gadget: f_uac2: Add suspend callback
  usb: gadget: f_uac1: Add suspend callback

 .../ABI/testing/configfs-usb-gadget-uac1      |   4 +-
 .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
 Documentation/usb/gadget-testing.rst          |   8 +-
 drivers/usb/gadget/function/f_uac1.c          | 190 ++++++++++++--
 drivers/usb/gadget/function/f_uac2.c          | 208 ++++++++++++---
 drivers/usb/gadget/function/u_audio.c         | 238 ++++++++++++++++--
 drivers/usb/gadget/function/u_audio.h         |  14 +-
 drivers/usb/gadget/function/u_uac1.h          |   5 +-
 drivers/usb/gadget/function/u_uac2.h          |   5 +-
 drivers/usb/gadget/function/uac_common.h      |   9 +
 drivers/usb/gadget/legacy/audio.c             |  78 +++---
 11 files changed, 633 insertions(+), 130 deletions(-)
 create mode 100644 drivers/usb/gadget/function/uac_common.h

-- 
2.25.1

