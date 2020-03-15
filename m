Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B95185F42
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 20:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgCOTBn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 15:01:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35700 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgCOTBn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 15:01:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id k26so15656962otr.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seas-upenn-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jak/lAW6pYji22+OWxOArVMTNrMXGQ+FMRJkUXqnnh4=;
        b=bhrvTTkOTLPGRBgEm/qMWKZLJ3+EYCZTujVnl8yefqBy46WbYlVX3/AmF9YbcCGUXr
         O1RNxFLKtQbgDAORGxuUj0xgMuobKk9dS/9617Lo795QXmKXHNqrBuoQ5GSHefhc2JdA
         2DnBLMjBmZsdhsarMTDsJdDe7xwwPmnV6mwRQZ+73UxV9tiqOrk9na/XMD041M68DtyT
         1dbI9McVDHJ2lkgWpuhVtC3caZawWPLs4XjN4GV1WWQPjVWjFYnRkVQqV68fVPfhIvOA
         BBeOkAxHwanyzS2BG07Y0fe4d1b9mfKgPJKToXzh1v+2PuWLUbW9ZuzSVTUZv/LBE2wf
         U8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jak/lAW6pYji22+OWxOArVMTNrMXGQ+FMRJkUXqnnh4=;
        b=q2/+JmZ3tpueGJ2KuXsUebWwGoJIJcI0bnSR4keFdYo1mBuUKfWTb3EN0lWYa6ECuE
         jH1S+WGe/PL1feFUMexxDkvLhm2amshGthZATfFrXzPEkbQGTNtMro0H3Ep4qrgVasQP
         g5UJzD2mDWmYbpl1d3c13ONUX3KzJLNTqpnQ6gEX83zv8OHcFdAFUDmHkTlPSgtmUo3i
         K2aWQTmdNcW3IAgoDKj0Ry8BjHuSwm2a9nXVbpPPQUzvV1LgSScLQQu3v2UGDadcLo0S
         IDQa4ifDC0bwhsUD5arrH1hAhjIZ22Jb8Hrfnz0nA3nWHkGXPsQiYegmJkGene9AwpZf
         nSvA==
X-Gm-Message-State: ANhLgQ0Jl6W/ID0NPTHSs+3wuPPAWXH41pdq8s7giPzBMDBnU1bzqzhW
        2jClGET4wRDM56KF1/eqvaLLAP0MB2UmNQ==
X-Google-Smtp-Source: ADFU+vttL421RKSFRaOUi70sFyO9I2zT6/ZaUf7JUoTjQU7v/kva/sST8ncDZoNO5dwt1XHMH2N5qw==
X-Received: by 2002:a9d:77d0:: with SMTP id w16mr19929186otl.66.1584298901912;
        Sun, 15 Mar 2020 12:01:41 -0700 (PDT)
Received: from evX1 ([189.172.49.121])
        by smtp.gmail.com with ESMTPSA id v12sm4954848otp.75.2020.03.15.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 12:01:41 -0700 (PDT)
Date:   Sun, 15 Mar 2020 13:01:40 -0600
From:   Enrique Vargas <jevargas@seas.upenn.edu>
To:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/2] Staging: media: rkisp1: eliminate trailing whitespaces
 on comments
Message-ID: <c9d004081be83ba4d5e2a07da196e6b774b49262.1584298430.git.jevargas@seas.upenn.edu>
References: <cover.1584298430.git.jevargas@seas.upenn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1584298430.git.jevargas@seas.upenn.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Eliminate lines with trailing whitespaces in block diagram.  Found with
checkpatch.

Signed-off-by: Enrique Vargas <jevargas@seas.upenn.edu>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c | 41 +++++++++++------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 194fc33941f0..faa8538b9fea 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -37,27 +37,26 @@
  *
  * ISP Block Diagram
  * -----------------
- *                                                          
- *                                                          
- *                                rkisp1-isp.c              
- *                        |==========================|      
- *                        +-----------+  +--+--+--+--+   
- *                        |           |  |  |  |  |  |   
- * +--------+    |\       |           |  |  |  |  |  |   
- * |  MIPI  |--->|  \     |           |  |  |  |  |  |   
- * +--------+    |   |    |           |  |IE|IE|IE|IE|   
+ *
+ *                                rkisp1-isp.c
+ *                        |==========================|
+ *                        +-----------+  +--+--+--+--+
+ *                        |           |  |  |  |  |  |
+ * +--------+    |\       |           |  |  |  |  |  |
+ * |  MIPI  |--->|  \     |           |  |  |  |  |  |
+ * +--------+    |   |    |           |  |IE|IE|IE|IE|
  *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |--[A]--
- * +--------+    |   |    |           |  |  |  |  |  |   
- * |Parallel|--->|  /     |           |  |  |  |  |  |   
- * +--------+    |/       |           |  |  |  |  |  |   
- *                        |           |  |  |  |  |  |   
- *                        +-----------+  +--+--+--+--+   
+ * +--------+    |   |    |           |  |  |  |  |  |
+ * |Parallel|--->|  /     |           |  |  |  |  |  |
+ * +--------+    |/       |           |  |  |  |  |  |
+ *                        |           |  |  |  |  |  |
+ *                        +-----------+  +--+--+--+--+
  *                                               ^
- * +--------+                                    |       
- * |  DMA   |------------------------------------+       
+ * +--------+                                    |
+ * |  DMA   |------------------------------------+
  * +--------+
- * 
- * 
+ *
+ *
  *              rkisp1-resizer.c          rkisp1-capture.c
  *            |====================|  |=======================|
  *                         Main Picture Path
@@ -73,11 +72,11 @@
  *         -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
  *            |        |  |        |  | Rotate |  |           |
  *            +--------+  +--------+  +--------+  +-----------+
- *  
+ *
  *            |===============================================|
  *                          Self Picture Path
- * 
- * 
+ *
+ *
  *         rkisp1-stats.c        rkisp1-params.c
  *       |===============|      |===============|
  *       +---------------+      +---------------+
-- 
2.17.1

