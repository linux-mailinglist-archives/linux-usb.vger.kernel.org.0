Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5F9488922
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbiAIL76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 06:59:58 -0500
Received: from cable.insite.cz ([84.242.75.189]:43158 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231294AbiAIL74 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 06:59:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 969B7A1A3D40D;
        Sun,  9 Jan 2022 12:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729593; bh=gbW6nPR6g9lDp5oWzmtxpJ/zGZhebAKY2LcAjSHMa60=;
        h=From:To:Cc:Subject:Date:From;
        b=ShWTIfyWyOWvhNHCELRIPL87UHk+48ElyRL3SkVS0c/PqiQHYvCvAla9bO0ADJlAh
         6q8hbO4+ONt9bfezkTErRDCdkvVlGo8GElCHlPI3q8ysD67boBiX7dSn2iseAoPIZN
         Dd/lPFWcKGTWO9LsvSYncSPqhRkOEjpnu8DF1olc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id blnZ2FZvoqkR; Sun,  9 Jan 2022 12:59:48 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id B9B81A1A3D400;
        Sun,  9 Jan 2022 12:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729588; bh=gbW6nPR6g9lDp5oWzmtxpJ/zGZhebAKY2LcAjSHMa60=;
        h=From:To:Cc:Subject:Date:From;
        b=H1hhenZ565gQUwUTkODqmxU9AbqDHW8Mb6IVU2tqe/1hU6cGmCQu6aRDvcQl9hjg5
         DE0iru49ClCHbdaamqZOt+c4GZzWDapCrh4EbqyOcNOwpY0pLkByXVFx6yPoGAFuzh
         HF+vSwXXy2bCZC8yoQeKjZvjyjBPC7MvzNa2kIyc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 00/11] usb: gadget: audio: Multiple rates, notify
Date:   Sun,  9 Jan 2022 12:59:35 +0100
Message-Id: <20220109115946.392818-1-pavel.hofman@ivitera.com>
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

Julian Scheel (4):
  usb: gadget: u_audio: Support multiple sampling rates
  usb: gadget: f_uac2: Support multiple sampling rates
  usb: gadget: f_uac2: Rename Clock Sources to fixed names
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
 drivers/usb/gadget/function/f_uac2.c          | 209 ++++++++++++---
 drivers/usb/gadget/function/u_audio.c         | 238 ++++++++++++++++--
 drivers/usb/gadget/function/u_audio.h         |  14 +-
 drivers/usb/gadget/function/u_uac1.h          |   5 +-
 drivers/usb/gadget/function/u_uac2.h          |   5 +-
 drivers/usb/gadget/function/uac_common.h      |   9 +
 drivers/usb/gadget/legacy/audio.c             |  78 +++---
 11 files changed, 635 insertions(+), 129 deletions(-)
 create mode 100644 drivers/usb/gadget/function/uac_common.h

-- 
2.25.1

