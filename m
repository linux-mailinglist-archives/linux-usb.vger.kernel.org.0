Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FCF39D96D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 12:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFGKRi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 06:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhFGKRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 06:17:38 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1708C061766
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 03:15:46 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h8so16920927wrz.8
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdptCY4cvujKkhAbbrElDi5hmCilr6pQuoJ8Mj4F+pc=;
        b=I2zbGQAX/BW2yOz9/seacIBo4fBqauQ6U/rU/2NqWP+sqtsUxJf+ovOfa5PzcmRKsu
         5UeGWFFSY3stHyw20VljIcrkXu3gCZbJNWg2PJSzPhPm3zDC5aKNZZ9Vob6ZOZXzTg7r
         QnlbA8PIVhpB/B6x6jz7EmUqA9KonCP3RirvPApeQsjPAy/E9zmjiIReFi6WGj5NwZgb
         tmroSQqWIHFr2GQbdh505wnzODCjhIQRW87ZEz4N2FTQfFhDMuJABoEUumuDwtTdPnMF
         s5c/t/9sdiseyCczCvXbsQHoJ/djC8KsQBjdhegt09YJyGoZUfDpAz7bMRCo5xzSKu/+
         RcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdptCY4cvujKkhAbbrElDi5hmCilr6pQuoJ8Mj4F+pc=;
        b=CeyCnYKlUKCH4RLg+Hy68hVaGjyBjgx8iTEqnmdKyQcs4wBFSWYawqfmvomegi6v5a
         nF1vOctQ6fI8sb5DibFAmIoN5PTQOnXm5ent9ptJaF0Ri9q90lSw3gPJjHnlFBFFA4Fv
         +IZhKSF/L3bKfxy6r9akuKPO+LfvEVhOrWdW4Hp6xpF7vMK/eI4709PgeACTBehlZ5NJ
         JmiGikL3wbrAKViGCjECGz7TsjA0cBktwUoiORz2hg9dBkpsk37MiAQ1SZJZZB4Owg69
         dvrK/7403Eh2u8e3KO8BSXJXnVhUs4YXkyUPG5Bif519eMjj5MkthXqLxl0ZszzPhmun
         qihg==
X-Gm-Message-State: AOAM5306UEyhrJdOP5J2wYaG0NU0lIRKpKIXs/2ddaw++aRhRoqPsAfm
        IHTBOA+8VmI61DDNx+EsH1npT2lpyUx9Rg==
X-Google-Smtp-Source: ABdhPJyIZfrwAEfLATneXbHjN+9dtU+aebg9eQYzFNGv1sGX29jt8nD1lop0OUMCC0SheqP8007WTw==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr15993493wrn.64.1623060945542;
        Mon, 07 Jun 2021 03:15:45 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id i9sm10236724wrn.54.2021.06.07.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:15:44 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2] MAINTAINERS: usb: add entry for isp1760
Date:   Mon,  7 Jun 2021 11:15:38 +0100
Message-Id: <20210607101538.74836-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Giving support for isp1763 made a little revival to this driver, add
entry in the MAINTAINERS file with me as maintainer, and
Laurent Pinchart as reviewer in a best effort style.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
v1[0] -> v2:
    - move Laurent to reviewer instead of maintainer by his request
      because of lack of bandwidth

[0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva@linaro.org/T/#u
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 503fd21901f1..bd3bdb22a608 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18869,6 +18869,14 @@ S:	Maintained
 F:	drivers/usb/host/isp116x*
 F:	include/linux/usb/isp116x.h
 
+USB ISP1760 DRIVER
+M:	Rui Miguel Silva <rui.silva@linaro.org>
+R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/isp1760/*
+F:	Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+
 USB LAN78XX ETHERNET DRIVER
 M:	Woojung Huh <woojung.huh@microchip.com>
 M:	UNGLinuxDriver@microchip.com
-- 
2.31.1

