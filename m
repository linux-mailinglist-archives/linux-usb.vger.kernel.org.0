Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFFE27118E
	for <lists+linux-usb@lfdr.de>; Sun, 20 Sep 2020 02:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgITATE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Sep 2020 20:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgITATE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Sep 2020 20:19:04 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BCBC061755;
        Sat, 19 Sep 2020 17:19:03 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z22so12912329ejl.7;
        Sat, 19 Sep 2020 17:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqMUCWqnC8X95n93xXKHH2Uq/hu5MulcBebPHENOdFo=;
        b=SGBkf+G6Np9pJqBOPISg28JjR1ib/N8myichiaw9TwCRXukGwMZmjGJXPap9BIVniq
         DPAHoC69KnCBZo0IGapn2UwnXpCa4J8wOCCAkskbHK+rZ3V5CFNu6yIIzfxX4qF3yfLm
         JzItLWzIjlc3aclaoo/xwVGpfZkCYx+B6AplCXIFum7XKd4OPDEma8ieBV3z63J3zfZ7
         obfL0a4P/Cqqs2q4uGb69GJG74VieWhdnAoTZLLV2bLNSMTQlGevmimVWYAWFCJYPApK
         09B7fj9RYqicUoiThXjDuDth+fkByONc6nItGIUuP3MTi8bV96OhbuoviBAXYUw0pMn+
         lGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqMUCWqnC8X95n93xXKHH2Uq/hu5MulcBebPHENOdFo=;
        b=kULwS8oPyxpX5PPAhWZRHdTN50NfVoVi2/jXQnI2lE/CUq4rPKzVSeI4lRHhq43/gk
         ThTypf9D80r4+2QshJtsNi7U+2985DQFz6j/649Fx8WzZDIcQIlVLiEslOFUu5uX8hKW
         Y2yjjcPPm80hoaw4iwOEEOMQeO5R/Ql3GM85EY2/fc/mekoUGyBpK74FcCEQRqneMA6l
         118O7feUOR3Yzdu3Hy3al5gs+EaypCtVKBmAtYEi9owHCWpvv9faQuNnqcTlU9VHYI9f
         kEXDZUe5kVYwpqz9K0+CWDeJV1c8MmShTNi3n61jt/IamGNZZt8vS2paXRBsdylyRf5L
         I+uA==
X-Gm-Message-State: AOAM531k4j3O01Q/h3WHvkcVgA5+nY+L5CtXzZcV2yBkiiCeBGjgd75b
        6fSNgKOCJ3J9d4EZjCePJHE=
X-Google-Smtp-Source: ABdhPJxNmSBiqkIfzhUTXm3NBMml7mRBIGv59XKGanZt/f9JaWrH1kRKbscUN/xtqGd/Zk5ezzEqWQ==
X-Received: by 2002:a17:906:16da:: with SMTP id t26mr42258394ejd.172.1600561141738;
        Sat, 19 Sep 2020 17:19:01 -0700 (PDT)
Received: from debian64.daheim (p4fd09180.dip0.t-ipconnect.de. [79.208.145.128])
        by smtp.gmail.com with ESMTPSA id a15sm5326886eje.16.2020.09.19.17.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 17:19:01 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1kJn4A-000s3r-Eh; Sun, 20 Sep 2020 02:18:54 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: [PATCH v1 2/2] usb: dwc2: add support for APM82181 USB OTG
Date:   Sun, 20 Sep 2020 02:18:50 +0200
Message-Id: <c8a9f98e50482fd068232deb7161f35910631bf6.1600560884.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <a43868b06566f5d959d8cfc4e763bede2885931a.1600560884.git.chunkeey@gmail.com>
References: <a43868b06566f5d959d8cfc4e763bede2885931a.1600560884.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

adds the specific compatible string for the DWC2 IP found in the APM82181
SoCs. The IP is setup correctly through the auto detection... With the
exception of the AHB Burst Size. The default of GAHBCFG_HBSTLEN_INCR4 of
the "snps,dwc2" can cause a system hang when the USB and SATA is used
concurrently. Because the predecessor (PPC460EX (Canyonlands)) already
had the same problem, this SoC can make use of the existing
dwc2_set_amcc_params() function.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 8f9d061c4d5f..6d2b9a6c247c 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -210,6 +210,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "amlogic,meson-g12a-usb",
 	  .data = dwc2_set_amlogic_g12a_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
+	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
 	{ .compatible = "st,stm32f4x9-hsotg" },
-- 
2.28.0

