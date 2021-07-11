Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06FA3C3B5A
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 11:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhGKJ4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 05:56:51 -0400
Received: from cable.insite.cz ([84.242.75.189]:45469 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231575AbhGKJ4t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Jul 2021 05:56:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id BAD00A1A3D408;
        Sun, 11 Jul 2021 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625997241; bh=+hyMHW68JR5e8uoMjGzxUu4hg/5lTipt1fa4KdzKZBw=;
        h=From:To:Cc:Subject:Date:From;
        b=AHd5z9+J98qO7bc8Pj8jauDW6Zt9dNI/Qg8keguLy5+pXErOqUoA9Ib9GvAmS9ZDc
         OOf6/IjnptZdvE8yBNkG3yn0iBCZpRVNliKr+A5xqYmPuINkeOSIZ30fj5LhWHCNG1
         YnGz1q7sNV3PPZ+7X3+wKGgWHJlMPwP6XKohtYyE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nd8HOwmDug6O; Sun, 11 Jul 2021 11:53:56 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 27557A1A3D402;
        Sun, 11 Jul 2021 11:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625997236; bh=+hyMHW68JR5e8uoMjGzxUu4hg/5lTipt1fa4KdzKZBw=;
        h=From:To:Cc:Subject:Date:From;
        b=rt2lDBF5Ou3WAFtqdN0AOIoo8f0eqJcOfp3ZIPtWlwFyHazIwbI/DpkyR/8KlanPw
         5U9czR6R79DaIhEyr2Egn30Ic1qHEwgfVtmx6MqwVWiho35+pkZjjFbPHHTcbghv+R
         4lKAMHoQgnR1IHx7PtvB3LLXchZ9bEzA+FOvudTM=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] usb: gadget: audio: add bi-directional volume and mute support
Date:   Sun, 11 Jul 2021 11:53:47 +0200
Message-Id: <20210711095351.16877-1-pavel.hofman@ivitera.com>
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
 drivers/usb/gadget/function/f_uac2.c          | 659 +++++++++++++++--
 drivers/usb/gadget/function/u_audio.c         | 369 +++++++++-
 drivers/usb/gadget/function/u_audio.h         |  22 +
 drivers/usb/gadget/function/u_uac1.h          |  20 +
 drivers/usb/gadget/function/u_uac2.h          |  23 +-
 include/linux/usb/audio-v2.h                  |  14 +
 10 files changed, 1735 insertions(+), 104 deletions(-)

-- 
2.25.1

