Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1D549E15D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbiA0Lnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:43:42 -0500
Received: from cable.insite.cz ([84.242.75.189]:57024 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235854AbiA0Lnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 68747A1A3D406;
        Thu, 27 Jan 2022 12:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283817; bh=nus/oKH7y9NJ6wOXKjB/15SAsBIMfwG/K1ad1k+woo0=;
        h=From:To:Cc:Subject:Date:From;
        b=d+9WP6c0KNh1fmJVbhQaYkMRo1GL9G0jpox91n+H7rxhUNgv01PREf6N6Zf/IZEdt
         5iDu2Mmbu/xjDZ393+8tPpKu0DU3gnBZLUtYxVSHTkPSca6F0SJXDMp/gOtGYaB32X
         c+a0RmSLeXuUPUr6bK+IGqQQUBi/Nt6SxzixlyyU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yyTh1Eq711Hd; Thu, 27 Jan 2022 12:43:32 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id AD11BA1A3D400;
        Thu, 27 Jan 2022 12:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283811; bh=nus/oKH7y9NJ6wOXKjB/15SAsBIMfwG/K1ad1k+woo0=;
        h=From:To:Cc:Subject:Date:From;
        b=Ha1+OBp/FqNghHm09g6awWxykajUHrhaOrxGUInFnhW+1vWYIXKYD0vWfxwV4CS+H
         LXnS+/9ZMxrxQ3Q81MICCwhiWjoePSsr1skeZTBERTSxzTISlAEG9/vqCOZPHfMgWc
         iX06Ub/+8qpsmHx+Xb1l6cUA0jibXkWBADQOkHNc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yunhao Tian <t123yh.xyz@gmail.com>
Subject: [PATCH 0/4] Add configfs HS/SS bInterval, optimized or fixed
Date:   Thu, 27 Jan 2022 12:43:27 +0100
Message-Id: <20220127114331.41367-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The existing UAC2 gadget has hard-coded bInterval=4 for HS/SS EP IN and
EP OUT. This setting precludes using higher-bandwidth configurations
successfully (the srate/chmask/ssize combination is accepted, but data
are silently dropped). 

After discussing with John Keeping
(https://lore.kernel.org/all/YcHIsR4AFaL9g6N2@donbot/) this series
implements a compromise among the various requirements. Configfs params
c_hs_bint/p_hs_bint between 1 to 4 set fixed bInterval. If the params
are set to 0, maximum fitting max packet size and bInterval values for
the required bandwidth are calculated and used, minimizing thus CPU
load.

The default value is 0, i.e. the automated calculation. It was chosen to
simplify using the UAC2 gadget. Also, when existing installations
require minimum bInterval to achieve minimum latency, they had to be
modified in the code so far. Therefore it is assumed that having to set
the parameters to fixed bInterval values would be no major difference to
the current status.

Additionally, the code warns if the required bandwidth exceeds the used
max packet size/bInterval combination. The warning check if performed
for FS too even if the current configuration ends up using HS/SS. The
optimal solution would be preventing FS/HS/SS enumeration instead but
such feature will require more patches and is not part of this series.

The bInterval parameters are added to the legacy g_audio too as this
module is still used in many existing UAC2 gadget tutorials and the
added code is minimal.


With regards,

Pavel Hofman.

Pavel Hofman (4):
  usb: gadget: f_uac2: add HS/SS bInterval to configfs
  usb: gadget: audio: Add HS/SS bInterval params for UAC2
  usb: gadget: f_uac2: Optionally determine bInterval for HS and SS
  usb: gadget: f_uac2: Add speed names to bInterval dbg/warn

 .../ABI/testing/configfs-usb-gadget-uac2      |   2 +
 Documentation/usb/gadget-testing.rst          |   2 +
 drivers/usb/gadget/function/f_uac2.c          | 160 +++++++++++++-----
 drivers/usb/gadget/function/u_uac2.h          |   4 +
 drivers/usb/gadget/legacy/audio.c             |  15 ++
 5 files changed, 142 insertions(+), 41 deletions(-)

-- 
2.25.1

