Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647F8274061
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgIVLHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:07:20 -0400
Received: from aibo.runbox.com ([91.220.196.211]:51596 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbgIVLHU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From; bh=Gt9U8tGVcPhoz5ONVIYQnIjce8bGn9xFfTOjk8/xxAc=; b=M97t9a
        FpLAnxL6L3q8Gx60F2sz6Z6vLew+uhk4uEh9kb4cf75FNt08VzMhk2wbc499KWvmTEwCWm+JKUewu
        C+rE+Z6ZviBA59U9s3+Lpk1mGoMKw25IFYIHrfrMHq5YZXeegZARTH+S63ckEtEvfjusL5R+w6bxf
        yIdn7rR9nyVaGyosKGrkMZRE5FJatPpwVeApsYuDJX/4X2ga7S5ZDIsrdfzbxARpMsotiq3d/bLoU
        59FDuZoWXcxvLzv9rgi8UAs/ZHyR6dXzDj2Ve6v8f3A3EhBaLBD6PY8fHfY47WXiq3Bj7zQzxQaK8
        WaUrIIFTUtApF4iBFwRkFSCwS+vg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kKg8j-0005uV-07; Tue, 22 Sep 2020 13:07:17 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kKg8d-00061H-Cx; Tue, 22 Sep 2020 13:07:11 +0200
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
To:     linux-usb@vger.kernel.org
Cc:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Bastien Nocera <hadess@hadess.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller@googlegroups.com
Subject: [PATCH v3 0/4] Fixes for usbip and specialised USB driver selection
Date:   Tue, 22 Sep 2020 14:06:59 +0300
Message-Id: <20200922110703.720960-1-m.v.b@runbox.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

This is the third version of the patch sets originally published in the
e-mail thread thread at [1]. As mentioned in the same e-mail thread with
the e-mail at [2], I was able to find a more acceptable solution to the
issue reported by Andrey Konovalov, where usbip takes over the
dummy_hcd-provided devices set up by the USB fuzzing instance of the
syzkaller fuzzer.

In summary, the approach involves:

* Removal of the usbip_match function.
* Fixing two bugs in the specialised USB driver selection code.
* Accommodating usbip by changing the logic in the specialised USB
  driver selection code, while preserving legacy/previous behaviour.

I have tested this patch set with Greg Kroah-Hartman's usb-next tree
based on v5.9-rc6 with the base commit mentioned below in this e-mail,
and I can report that usbip works as expected, with no regressions in
the usbip_test.sh self-test suite output compared to v4.14.119. I have
also verified that the apple-mfi-fastcharge driver is correctly used
when an iPhone is plugged in to my system. Finally, I can report that
Andrey Konovalov's "keyboard" test program making use of dummy_hcd,
found at [3], also works as expected.

I would appreciate your comments.

Thank you,

Vefa

[1] https://lore.kernel.org/linux-usb/CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com/
[2] https://lore.kernel.org/linux-usb/9f332d7b-e33d-ebd0-3154-246fbfb69128@runbox.com/
[3] https://github.com/xairy/raw-gadget

Cc: Bastien Nocera <hadess@hadess.net>
Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: <syzkaller@googlegroups.com>

M. Vefa Bicakci (4):
  Revert "usbip: Implement a match function to fix usbip"
  usbcore/driver: Fix specific driver selection
  usbcore/driver: Fix incorrect downcast
  usbcore/driver: Accommodate usbip

 drivers/usb/core/driver.c    | 50 ++++++++++++++++++++++++------------
 drivers/usb/usbip/stub_dev.c |  6 -----
 2 files changed, 34 insertions(+), 22 deletions(-)


base-commit: 55be22adf11b48c80ea181366685ec91a4700b7e
-- 
2.26.2

