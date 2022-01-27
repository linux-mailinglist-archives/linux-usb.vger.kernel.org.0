Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57F649E15C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240714AbiA0Lnl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from cable.insite.cz ([84.242.75.189]:36234 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232316AbiA0Lnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id EA1EEA1A3D408;
        Thu, 27 Jan 2022 12:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283817; bh=Z9n/0NScHJX+w+2MKsi2LzgtIVsBJ5oF4JV1D39IxBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bXyZJcRI2W/c+Qrtw4FrsSCJMiDycsR99ihPXnP5ieKYxP8yF8cxDnWJH11Lk1urN
         DLQe6RivC0MD9BsSc+/atmiMRitERqhIav7X+73luzi+Hr5og6pEFF2hNkD2t12wmM
         9zbX5iUQ0NUkAPHbOLy8qmWb2quOM3ZmOVi4bT0k=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EtoMYbf6nngr; Thu, 27 Jan 2022 12:43:32 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8D3CCA1A3D402;
        Thu, 27 Jan 2022 12:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283812; bh=Z9n/0NScHJX+w+2MKsi2LzgtIVsBJ5oF4JV1D39IxBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b6/xO+If4t43DzLr9eM0b1XV21wLAgmc+x6sdpxG7GGcppzKZ3FozsvJq9syeBo55
         mgVTntu4cbulublC32JkrGwkIW1SgTytNSvVaFjY2rbLQU8FPZH7LCQ54HcOaf2P/c
         5v7m/Lz8tPo3QE3FHOtNIvihVkVoLciYEDQ4A8ms=
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
Subject: [PATCH 2/4] usb: gadget: audio: Add HS/SS bInterval params for UAC2
Date:   Thu, 27 Jan 2022 12:43:29 +0100
Message-Id: <20220127114331.41367-3-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127114331.41367-1-pavel.hofman@ivitera.com>
References: <20220127114331.41367-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow configuring the existing f_uac2 configfs bInterval params through
parameters of the gaudio module.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/legacy/audio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index c89c777a1aa3..76ea6decf7b6 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -36,6 +36,12 @@ static int p_ssize = UAC2_DEF_PSSIZE;
 module_param(p_ssize, uint, 0444);
 MODULE_PARM_DESC(p_ssize, "Playback Sample Size(bytes)");
 
+/* Playback bInterval for HS/SS (1-4: fixed, 0: auto) */
+static u8 p_hs_bint = UAC2_DEF_PHSBINT;
+module_param(p_hs_bint, byte, 0444);
+MODULE_PARM_DESC(p_hs_bint,
+		"Playback bInterval for HS/SS (1-4: fixed, 0: auto)");
+
 /* Capture(USB-OUT) Default Stereo - Fl/Fr */
 static int c_chmask = UAC2_DEF_CCHMASK;
 module_param(c_chmask, uint, 0444);
@@ -51,6 +57,13 @@ MODULE_PARM_DESC(c_srate, "Capture Sampling Rates (array)");
 static int c_ssize = UAC2_DEF_CSSIZE;
 module_param(c_ssize, uint, 0444);
 MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
+
+/* capture bInterval for HS/SS (1-4: fixed, 0: auto) */
+static u8 c_hs_bint = UAC2_DEF_CHSBINT;
+module_param(c_hs_bint, byte, 0444);
+MODULE_PARM_DESC(c_hs_bint,
+		"Capture bInterval for HS/SS (1-4: fixed, 0: auto)");
+
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 #include "u_uac1.h"
@@ -274,12 +287,14 @@ static int audio_bind(struct usb_composite_dev *cdev)
 		uac2_opts->p_srates[i] = p_srates[i];
 
 	uac2_opts->p_ssize = p_ssize;
+	uac2_opts->p_hs_bint = p_hs_bint;
 	uac2_opts->c_chmask = c_chmask;
 
 	for (i = 0; i < c_srates_cnt; ++i)
 		uac2_opts->c_srates[i] = c_srates[i];
 
 	uac2_opts->c_ssize = c_ssize;
+	uac2_opts->c_hs_bint = c_hs_bint;
 	uac2_opts->req_number = UAC2_DEF_REQ_NUM;
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
-- 
2.25.1

