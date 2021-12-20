Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01CD47B4D1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhLTVLm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:42 -0500
Received: from cable.insite.cz ([84.242.75.189]:56529 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230334AbhLTVLk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 5F12FA1A3D401;
        Mon, 20 Dec 2021 22:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034698; bh=oB1LYKMFOt9Rev+8KQfPTAQdGMk3uM/03viTJNW919o=;
        h=From:To:Cc:Subject:Date:From;
        b=pOtbk47v/pU6Zesu5zQqUDLgFbcbA4DnuKyeUdAzLLQGzYpPigLC0KWKyYsGTYzwc
         AVGwKJyESvxz/EoujoxJtNoiKc+PP81m5a91ujU2nCFB+oFbWrcwL+u7Hb19msLlZL
         GAEhRLUZy97CTA+q8TUKc/RQHSWj4I61OoBYOInY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1uQ_m-CRj9gW; Mon, 20 Dec 2021 22:11:31 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 80DE1A1A3D400;
        Mon, 20 Dec 2021 22:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034691; bh=oB1LYKMFOt9Rev+8KQfPTAQdGMk3uM/03viTJNW919o=;
        h=From:To:Cc:Subject:Date:From;
        b=G0z1ATsZNALHgz/yx0sVGhN/Ab+M4DxGaQ5hkSrvkyduV+pxS4wS9JE/2DLL7MMJk
         A1hEc625nQFtBFuEf7f2Zqh/4SwMPi9uEkzwteS7BZ8tmZeQSlushBczvVcq0r+Aph
         ZVbdRa832wfQsUzydzG5SXIAylg7pvxx25xSrH+s=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 00/11] usb: gadget: audio: Multiple rates, dyn. bInterval
Date:   Mon, 20 Dec 2021 22:11:19 +0100
Message-Id: <20211220211130.88590-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series implements:
* Support for multiple rates in the audio gadget
* Notification of gadget-side alsa processes about playback/capture
start/stop on the host side via Playback/Capture Rate controls.
* Detection of the USB cable disconnection by handling SUSPEND call
in f_uac1/2. The disconnection generates a stop notification.
* Dynamic bInterval calculation for HS and SS

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

v2: Fixed compilation of "usb: gadget: f_uac1: Support multiple sampling
rates" - added changes for CONFIG_GADGET_UAC1

---------
Julian Scheel (4):
  usb: gadget: u_audio: Support multiple sampling rates
  usb: gadget: f_uac2: Support multiple sampling rates
  usb: gadget: f_uac1: Support multiple sampling rates
  usb: gadget: f_uac2: Renaming Clock Sources to fixed names

Pavel Hofman (7):
  usb: gadget: u_audio: Subdevice 0 for capture ctls
  usb: gadget: u_audio: Rate ctl notifies about current srate
    (0=stopped)
  usb: gadget: u_audio: Stopping PCM substream at capture/playback stop
  usb: gadget: u_audio: Adding suspend call
  usb: gadget: f_uac2: Adding suspend callback
  usb: gadget: f_uac1: Adding suspend callback
  usb: gadget: f_uac2: Determining bInterval for HS and SS

 .../ABI/testing/configfs-usb-gadget-uac1      |   4 +-
 .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
 Documentation/usb/gadget-testing.rst          |   8 +-
 drivers/usb/gadget/function/f_uac1.c          | 121 ++++++++--
 drivers/usb/gadget/function/f_uac2.c          | 221 ++++++++++++------
 drivers/usb/gadget/function/u_audio.c         | 162 ++++++++++++-
 drivers/usb/gadget/function/u_audio.h         |  12 +-
 drivers/usb/gadget/function/u_uac1.h          |  63 ++++-
 drivers/usb/gadget/function/u_uac2.h          |  62 +++++
 drivers/usb/gadget/function/uac_common.h      |   9 +
 drivers/usb/gadget/legacy/audio.c             |  40 +++-
 11 files changed, 597 insertions(+), 109 deletions(-)
 create mode 100644 drivers/usb/gadget/function/uac_common.h

-- 
2.25.1

