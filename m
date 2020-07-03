Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273E7213EDF
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgGCRn3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgGCRmx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAD3C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o2so34857714wmh.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kET32cWBEbf+azZpl4b9S5hhud6fCuzb1HVS2JBoyeg=;
        b=E+eqmQcJjcmnr2u4Nr9qPSNrgPa0cqnh4p53vmQ7P1dwDX9UnVYEjQxvClD1uAJ9Et
         uzhmv5h+j90jPdmZ2+ERqI5c22248cZINxdUx6F+2myWrFrXFgqpf6eNpKYa0O/MBx3m
         eev4UTe30wi7JJHgf7OfYcxQTuv4BeTaWmQJIpWM9KzuYepaK8oC+fcYIppNmp23TMX2
         G/yTZk7ZYVnMpw77HcYQ80Pw2EvMp3Q2JJV932kBQn/XCfqsumQIuKyABQHBYFREEhwR
         3HBMjRlr2ascNOBsgGi8i4ez9fFsEC2RFybCAEcAcHKjodJycriwHG1mFqRAFz/TlBla
         o7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kET32cWBEbf+azZpl4b9S5hhud6fCuzb1HVS2JBoyeg=;
        b=Dba3xjIyOC3Mg4TQ3wOJsLGlJ3eqF8ratO9iiu9EzkEjvyoQtA8OKYJBVA8Gb7Ee6O
         c/RCHBzL1+gdEGk9j4/E113pGfBKMrS53M9Q1IUpF4SoK+PnAtmV9PoARvAq+B/aspeX
         G3DmNktVwjSAS8EKJ216yD8DX5n6ATGiiVaiPmIrbdIMdVBw9hK1kOumUx/yjCOLu90d
         xWGyZ8H5YGX5HZwzfsY95CpVAcnqcS6VnDs6MCvlrXsvUCbWUF1wGhAXXcvt3hOpK0ie
         UexWWyqBsTWuSbglRdgP/3i9L/KdBZNRao9ye2bjkhqwFCLI0pieMHNYlZhfJBX7f2pf
         kFHA==
X-Gm-Message-State: AOAM5326klASI6Xw/AKOuLt+I6AFg25rYm3wUJeibl3LHtZaPE4/f7vi
        MwCuxwNiUbmABdBxxGEz3VG6SA==
X-Google-Smtp-Source: ABdhPJx+kvzQZ7rH7eOuqZcSpRb7jmBkzPEVOp4RMNOQJpQ/CkWOVZU3h/qUTZDxWMj0S80UE1YZlA==
X-Received: by 2002:a1c:3504:: with SMTP id c4mr4441366wma.177.1593798171685;
        Fri, 03 Jul 2020 10:42:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Richard Zhao <richard.zhao@freescale.com>
Subject: [PATCH 23/30] usb: chipidea: usbmisc_imx: Demote obvious misuse of kerneldoc to standard comment block
Date:   Fri,  3 Jul 2020 18:41:41 +0100
Message-Id: <20200703174148.2749969-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/usbmisc_imx.c:801: warning: Function parameter or member 'data' not described in 'imx7d_charger_detection'

Cc: Peter Chen <Peter.Chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Richard Zhao <richard.zhao@freescale.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index f136876cb4a30..8a8e7ad928a61 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -789,7 +789,7 @@ static int imx7d_charger_primary_detection(struct imx_usbmisc_data *data)
 	return 0;
 }
 
-/**
+/*
  * Whole charger detection process:
  * 1. OPMODE override to be non-driving
  * 2. Data contact check
-- 
2.25.1

