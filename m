Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEB2185F41
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 20:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgCOTA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 15:00:56 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:39505 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgCOTAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 15:00:55 -0400
Received: by mail-oi1-f174.google.com with SMTP id d63so15412501oig.6
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seas-upenn-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dOl98hdtwWD6WGiF2f3JgBAOy6EWHbabHZ99IPN/Hbo=;
        b=NKsrt6lXhF3H1oWszW0iGCzD2BPeYo/wD7wfI1tnNUqn/IY0w7UidlISbOuJtpgXqV
         mo6SnfYcLeHd+wtEe6GXGp4BfPZtQrgucm5Dunxn3Z81flhzmw1RES2h/fCpm5PSPGtK
         52S7r5rs3uwpd8ZBs/GeoxcxThyn2hKWfGUX3tGg/D79Xhs9MsKVZBcVDC8eaaF5bp1G
         tQsp1RJuH7HCxC0E37W4uDAALrvqnnO5b7sQTGig1rpNuZoR3AzhiKeVM11nAFpWpMzi
         laUIAFn+w8Vv0LaZXUu2wW6UkIKAjuZaUkmcoqAC2dUFu1ozSazaEKAJac5GkJx8/bnx
         jguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dOl98hdtwWD6WGiF2f3JgBAOy6EWHbabHZ99IPN/Hbo=;
        b=CjrDzQoJ3+WWYcLvoMdWCv1kWpk4n/iv4LTveS1BMNfI5+y+Uho3v7XaYXJtQcirC1
         q9K0qNlJmHX5WRoYBopoLygv04g67Q3wPcmlrMMRd+s02DrYQbq8Cis35MNgetRBgSLp
         Z7j6oLLcdi0aivQ+ptgYi7VZ744tAnQy/7UU9jsIKqIZn+oWVKjiVdgbXXtoaBxJ0w4d
         ViMtuwDdHX1YOeiZ+DxbLx8zNcqmtnNeIlO6iqEchFabWZL1ZZ0l7Np54gTzGPPb0XKE
         v57gBIol3nzEdDl+UuQoCSFvaIeBzOEGHyV0PhgsaQNj/uj52/6R06xOHOvwbK/t4Q5D
         S5aA==
X-Gm-Message-State: ANhLgQ3TV95nN/QDf/kyKmB3IMCyvrug8cF1PH2Yh4HxhTz1OYqA4y/1
        9fZC4QuxUCUep48oyuYbuLaEaJ8BE7tZ0w==
X-Google-Smtp-Source: ADFU+vtnpuYUxTX+1P5LV1FdV4IlFoo3nAAj12YMoy1STIX1W/8cjSeJPWPglD8/JJW4Qz4ga3xb5A==
X-Received: by 2002:aca:4a55:: with SMTP id x82mr1636744oia.28.1584298855109;
        Sun, 15 Mar 2020 12:00:55 -0700 (PDT)
Received: from evX1 ([189.172.49.121])
        by smtp.gmail.com with ESMTPSA id h92sm10785016otb.2.2020.03.15.12.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 12:00:54 -0700 (PDT)
Date:   Sun, 15 Mar 2020 13:00:53 -0600
From:   Enrique Vargas <jevargas@seas.upenn.edu>
To:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/2] Staging: media: rkisp1: reduce comments width bellow 80
 chars
Message-ID: <5e08334eae9ca864dbb09c02291fd72687681c39.1584298430.git.jevargas@seas.upenn.edu>
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

Make 'Main Picture Path' part of block diagram on separate rows to avoid
80 chars WARNING found with checkpatch.

Signed-off-by: Enrique Vargas <jevargas@seas.upenn.edu>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c | 57 ++++++++++++++++-------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 558126e66465..194fc33941f0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -37,26 +37,47 @@
  *
  * ISP Block Diagram
  * -----------------
- *                                                             rkisp1-resizer.c          rkisp1-capture.c
- *                                                          |====================|  |=======================|
- *                                rkisp1-isp.c                              Main Picture Path
- *                        |==========================|      |===============================================|
- *                        +-----------+  +--+--+--+--+      +--------+  +--------+              +-----------+
- *                        |           |  |  |  |  |  |      |        |  |        |              |           |
- * +--------+    |\       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |------------->|           |
- * |  MIPI  |--->|  \     |           |  |  |  |  |  |   |  |        |  |        |              |           |
- * +--------+    |   |    |           |  |IE|IE|IE|IE|   |  +--------+  +--------+              |  Memory   |
- *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |---+                                      | Interface |
- * +--------+    |   |    |           |  |  |  |  |  |   |  +--------+  +--------+  +--------+  |           |
- * |Parallel|--->|  /     |           |  |  |  |  |  |   |  |        |  |        |  |        |  |           |
- * +--------+    |/       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
- *                        |           |  |  |  |  |  |      |        |  |        |  | Rotate |  |           |
- *                        +-----------+  +--+--+--+--+      +--------+  +--------+  +--------+  +-----------+
+ *                                                          
+ *                                                          
+ *                                rkisp1-isp.c              
+ *                        |==========================|      
+ *                        +-----------+  +--+--+--+--+   
+ *                        |           |  |  |  |  |  |   
+ * +--------+    |\       |           |  |  |  |  |  |   
+ * |  MIPI  |--->|  \     |           |  |  |  |  |  |   
+ * +--------+    |   |    |           |  |IE|IE|IE|IE|   
+ *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |--[A]--
+ * +--------+    |   |    |           |  |  |  |  |  |   
+ * |Parallel|--->|  /     |           |  |  |  |  |  |   
+ * +--------+    |/       |           |  |  |  |  |  |   
+ *                        |           |  |  |  |  |  |   
+ *                        +-----------+  +--+--+--+--+   
  *                                               ^
- * +--------+                                    |          |===============================================|
- * |  DMA   |------------------------------------+                          Self Picture Path
+ * +--------+                                    |       
+ * |  DMA   |------------------------------------+       
  * +--------+
- *
+ * 
+ * 
+ *              rkisp1-resizer.c          rkisp1-capture.c
+ *            |====================|  |=======================|
+ *                         Main Picture Path
+ *            |===============================================|
+ *            +--------+  +--------+              +-----------+
+ *            |        |  |        |              |           |
+ *         -->|  Crop  |->|  RSZ   |------------->|           |
+ *         |  |        |  |        |              |           |
+ *         |  +--------+  +--------+              |  Memory   |
+ * --[A]---+                                      | Interface |
+ *         |  +--------+  +--------+  +--------+  |           |
+ *         |  |        |  |        |  |        |  |           |
+ *         -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
+ *            |        |  |        |  | Rotate |  |           |
+ *            +--------+  +--------+  +--------+  +-----------+
+ *  
+ *            |===============================================|
+ *                          Self Picture Path
+ * 
+ * 
  *         rkisp1-stats.c        rkisp1-params.c
  *       |===============|      |===============|
  *       +---------------+      +---------------+
-- 
2.17.1

