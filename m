Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1166248924C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240008AbiAJHlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:41:51 -0500
Received: from cable.insite.cz ([84.242.75.189]:58681 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241379AbiAJHhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:37:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 64B16A1A3D40E;
        Mon, 10 Jan 2022 08:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800270; bh=E4cuYGXjxJ4RBAN6lIKdf+fs5oP8Ii3xcXgGCs+moSg=;
        h=From:To:Cc:Subject:Date:From;
        b=D7YpPZsbd1zFPzPNKjmVqoYoUAG/Kw5mQDuMIi8qccDCnCHOKIKmJEa9ztsBx/tD0
         YVn91+pLocfddfA4OKBTUcZOT/UipN27gd6NTwKaoBvXVDbHvbnNaj418ozG1iwKvG
         4OF9khjSRCpFuyICahd26nGA5zjLFITIShfJGv6o=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RhIdFulj-vv4; Mon, 10 Jan 2022 08:37:43 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 78105A1A3D400;
        Mon, 10 Jan 2022 08:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800263; bh=E4cuYGXjxJ4RBAN6lIKdf+fs5oP8Ii3xcXgGCs+moSg=;
        h=From:To:Cc:Subject:Date:From;
        b=AQhgLD35UCHH4Qt+58o28tVCMm2g1U26S4kjZAgpgPoscFH34HJqa10Jyb7I7fKr0
         EJfSR992N9S1FYoTHHJlvPr8HQuFwoTiAiJe2g0AuLbg4dToXAWY16k7KE3bSlXSfn
         pbzlCFLTIpT/RjFgCoZEsHA+vdNZlSpg1tJkAOW8=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 00/10] usb: gadget: audio: Multiple rates, notify
Date:   Mon, 10 Jan 2022 08:37:32 +0100
Message-Id: <20220110073742.394237-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
usb:    gadget: audio: Multiple rates, notify
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
 drivers/usb/gadget/function/f_uac2.c          | 207 ++++++++++++---
 drivers/usb/gadget/function/u_audio.c         | 238 ++++++++++++++++--
 drivers/usb/gadget/function/u_audio.h         |  14 +-
 drivers/usb/gadget/function/u_uac1.h          |   5 +-
 drivers/usb/gadget/function/u_uac2.h          |   5 +-
 drivers/usb/gadget/function/uac_common.h      |   9 +
 drivers/usb/gadget/legacy/audio.c             |  78 +++---
 11 files changed, 632 insertions(+), 130 deletions(-)
 create mode 100644 drivers/usb/gadget/function/uac_common.h

-- 
2.25.1

