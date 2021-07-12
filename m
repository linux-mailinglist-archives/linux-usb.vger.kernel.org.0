Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F324C3C5CB0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 14:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbhGLM61 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 08:58:27 -0400
Received: from cable.insite.cz ([84.242.75.189]:35084 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhGLM60 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 08:58:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 10A7AA1A3D406;
        Mon, 12 Jul 2021 14:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094536; bh=qyT0yYZflAEgIspFGTXd3AvdhqT4kLf8aXCbLBIvuGw=;
        h=From:To:Cc:Subject:Date:From;
        b=sR6ha02ny5ip/5sTstxUsSQGspv6xoOH9GAzGfvY95eIaxSKHv9Nw1JoiCnMuCGVH
         inGRrDEYG89Q8s6ALw9KI54OaVpBvoN0wY6wls7tjPU2Ikals8uaLoISPk2r+2PiN2
         yLg7N/J0JV734cW7yobCmN5lUMmR4N4YZMURKLPI=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gHq2VcKNCB2z; Mon, 12 Jul 2021 14:55:30 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 775C3A1A3D401;
        Mon, 12 Jul 2021 14:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094530; bh=qyT0yYZflAEgIspFGTXd3AvdhqT4kLf8aXCbLBIvuGw=;
        h=From:To:Cc:Subject:Date:From;
        b=D1AVWGpS/tAK5syBsQiIOdJXSbY/PlRRqceY/Jlnj+wUL8BU6TE69MrgQ5YVKZH9B
         p59En4XCYB9Hmjfoxg7w0S7cVMUNWOxf/TCPvJAxo/zV932FkVDrSSmBgNlWGv+BpC
         0CeOZnk9qZ7VhMhNZl8cy3jhD46N/wWzfukM6Sn8=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/4] usb: gadget: audio: add bi-directional volume and mute support
Date:   Mon, 12 Jul 2021 14:55:25 +0200
Message-Id: <20210712125529.76070-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These are patches implementing volume and mute support in audio gadget from
Ruslan Bilovol
https://patchwork.kernel.org/project/linux-usb/list/?series=439931 rebased for
the latest async feedback patches (Ruslan authored, Jerome modified) already
pushed to mainline.

Patches 1 and 4 are basically intact, patches for f_uac2 had to be modified for
the changes in the final feedback patches.

I tested the f_uac2 code to work correctly.

Rebased patches for switching among multiple rates originally authored by Julian
Sheel https://lore.kernel.org/patchwork/patch/803422/ are to follow, thank you
for reviewing and accepting this patchset first.

v3 - removed debug messages added for rebasing

Best regards,

Pavel Hofman.

Ruslan Bilovol (4):
  usb: audio-v2: add ability to define feature unit descriptor
  usb: gadget: u_audio: add bi-directional volume and mute support
  usb: gadget: f_uac2: add volume and mute support
  usb: gadget: f_uac1: add volume and mute support

 .../ABI/testing/configfs-usb-gadget-uac1      |  10 +
 .../ABI/testing/configfs-usb-gadget-uac2      |  10 +
 Documentation/usb/gadget-testing.rst          |  38 +-
 drivers/usb/gadget/function/f_uac1.c          | 674 +++++++++++++++++-
 drivers/usb/gadget/function/f_uac2.c          | 656 +++++++++++++++--
 drivers/usb/gadget/function/u_audio.c         | 369 +++++++++-
 drivers/usb/gadget/function/u_audio.h         |  22 +
 drivers/usb/gadget/function/u_uac1.h          |  20 +
 drivers/usb/gadget/function/u_uac2.h          |  23 +-
 include/linux/usb/audio-v2.h                  |  14 +
 10 files changed, 1732 insertions(+), 104 deletions(-)

-- 
2.25.1

