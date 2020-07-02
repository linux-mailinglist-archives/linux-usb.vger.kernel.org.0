Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FA22126C0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgGBOr0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730106AbgGBOrK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:47:10 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEF6C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:47:10 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r12so28733177wrj.13
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGmNfPC5yyfRr4hRGf2JBNE4nTAK9gpUa3GW7C/jBWg=;
        b=NF9g3FmC0XN5JQHD6tLzZePjEQQeNjaNgi80LtNDZOe509ZXtnM99as/gig4tZM43V
         /LTUc4rwnO7YAurW0YGpnQulS7Cp9bzVFb5MH3rCEi5wm6YwY6TLAfRDomNexC4rnEu6
         c5xrPVbs4ksyzWPLp2M9t0vP3nKHETS7MysXVUaWfe3bOIrGk4unP+NjuXwN8k0LwJtw
         Ej7T4rjanV9O5oHL7oi80Dk6yFHa/VboIKRhhXnb9oa15jjYMbwKtD7RHz5ThbQ0ym31
         CgYkfpCAvvclfI7u+tam5EKcoXhYGh1IWCaIoiClWayNYdv71V9J7NDWE+zvdknuUtiE
         K2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGmNfPC5yyfRr4hRGf2JBNE4nTAK9gpUa3GW7C/jBWg=;
        b=GtRGz3Uasuuh//fD4Lb4quegP2+qe+RvjiEfi0TCnNrbkMstJMZCBUhleQA26TViSj
         1wivsJtdM+QCicQ3uXpLVrG30Z0jjITBni7crbqA1vMWs6oVtyNucY1JIegIDPQDz+Aa
         LarOJTqI3ap8HS5Kx2YTEDJGmS8ZuLy6MzUHfp1WmLhSzYI7JtMbg95nXwlKTtUUO3h5
         DT2u/8owMTCx+g3qy+754/uQ+1BuKSXrkGIxZ2CL2XwtNpCP2rD22C8GnqUBvpBMJvx6
         U5aRSq937MFBXwkge//GPIFfMqEFN11xDU/sCz9F+k2w571PEVjfd1iLG7+d2I0IwcB+
         /kkA==
X-Gm-Message-State: AOAM532nndPmeXelKTJIQMAfqgsO5X007hbkDGLJTe/ZlNel/uIM5ZZd
        JRONFTcfSnK8tphuymMQNLxcHw==
X-Google-Smtp-Source: ABdhPJxOsbwXE/Dv8fyPSOwYjCV8DD+BU5x3NhIySmUznQc+FEh85NIDpK8tN/yFxlLe35byCsnobw==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr23432964wrp.64.1593701228692;
        Thu, 02 Jul 2020 07:47:08 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:47:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Peter Korsgaard <jacmet@sunsite.dk>
Subject: [PATCH 30/30] usb: c67x00: c67x00-sched: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Thu,  2 Jul 2020 15:46:25 +0100
Message-Id: <20200702144625.2533530-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/c67x00/c67x00-sched.c:35: warning: Function parameter or member 'queue' not described in 'c67x00_ep_data'
 drivers/usb/c67x00/c67x00-sched.c:35: warning: Function parameter or member 'node' not described in 'c67x00_ep_data'
 drivers/usb/c67x00/c67x00-sched.c:35: warning: Function parameter or member 'hep' not described in 'c67x00_ep_data'
 drivers/usb/c67x00/c67x00-sched.c:35: warning: Function parameter or member 'dev' not described in 'c67x00_ep_data'
 drivers/usb/c67x00/c67x00-sched.c:35: warning: Function parameter or member 'next_frame' not described in 'c67x00_ep_data'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'ly_base_addr' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'port_length' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'pid_ep' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'dev_addr' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'ctrl_reg' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'status' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'retry_cnt' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'residue' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'next_td_addr' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'td_list' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'td_addr' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'data' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'urb' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'privdata' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'ep_data' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:71: warning: Function parameter or member 'pipe' not described in 'c67x00_td'
 drivers/usb/c67x00/c67x00-sched.c:137: warning: Function parameter or member 'c67x00' not described in 'dbg_td'
 drivers/usb/c67x00/c67x00-sched.c:137: warning: Function parameter or member 'td' not described in 'dbg_td'
 drivers/usb/c67x00/c67x00-sched.c:137: warning: Function parameter or member 'msg' not described in 'dbg_td'
 drivers/usb/c67x00/c67x00-sched.c:169: warning: Function parameter or member 'a' not described in 'frame_add'
 drivers/usb/c67x00/c67x00-sched.c:169: warning: Function parameter or member 'b' not described in 'frame_add'
 drivers/usb/c67x00/c67x00-sched.c:177: warning: Function parameter or member 'a' not described in 'frame_after'
 drivers/usb/c67x00/c67x00-sched.c:177: warning: Function parameter or member 'b' not described in 'frame_after'
 drivers/usb/c67x00/c67x00-sched.c:186: warning: Function parameter or member 'a' not described in 'frame_after_eq'
 drivers/usb/c67x00/c67x00-sched.c:186: warning: Function parameter or member 'b' not described in 'frame_after_eq'
 drivers/usb/c67x00/c67x00-sched.c:199: warning: Function parameter or member 'c67x00' not described in 'c67x00_release_urb'
 drivers/usb/c67x00/c67x00-sched.c:199: warning: Function parameter or member 'urb' not described in 'c67x00_release_urb'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'c67x00' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'urb' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'data' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'len' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'pid' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'toggle' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:566: warning: Function parameter or member 'privdata' not described in 'c67x00_create_td'
 drivers/usb/c67x00/c67x00-sched.c:692: warning: Function parameter or member 'c67x00' not described in 'c67x00_add_ctrl_urb'
 drivers/usb/c67x00/c67x00-sched.c:692: warning: Function parameter or member 'urb' not described in 'c67x00_add_ctrl_urb'
 drivers/usb/c67x00/c67x00-sched.c:830: warning: Function parameter or member 'c67x00' not described in 'c67x00_parse_td'
 drivers/usb/c67x00/c67x00-sched.c:830: warning: Function parameter or member 'td' not described in 'c67x00_parse_td'
 drivers/usb/c67x00/c67x00-sched.c:978: warning: Function parameter or member 'c67x00' not described in 'c67x00_check_td_list'
 drivers/usb/c67x00/c67x00-sched.c:1052: warning: Function parameter or member 'c67x00' not described in 'c67x00_send_td'
 drivers/usb/c67x00/c67x00-sched.c:1052: warning: Function parameter or member 'td' not described in 'c67x00_send_td'
 drivers/usb/c67x00/c67x00-sched.c:1088: warning: Function parameter or member 'c67x00' not described in 'c67x00_do_work'

Cc: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/c67x00/c67x00-sched.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index 633c52de3bb36..ef1e4ecaee996 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -23,7 +23,7 @@
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * struct c67x00_ep_data: Host endpoint data structure
  */
 struct c67x00_ep_data {
@@ -34,7 +34,7 @@ struct c67x00_ep_data {
 	u16 next_frame;		/* For int/isoc transactions */
 };
 
-/**
+/*
  * struct c67x00_td
  *
  * Hardware parts are little endiannes, SW in CPU endianess.
@@ -130,7 +130,7 @@ struct c67x00_urb_priv {
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * dbg_td - Dump the contents of the TD
  */
 static void dbg_td(struct c67x00_hcd *c67x00, struct c67x00_td *td, char *msg)
@@ -161,7 +161,7 @@ static inline u16 c67x00_get_current_frame_number(struct c67x00_hcd *c67x00)
 	return c67x00_ll_husb_get_frame(c67x00->sie) & HOST_FRAME_MASK;
 }
 
-/**
+/*
  * frame_add
  * Software wraparound for framenumbers.
  */
@@ -170,7 +170,7 @@ static inline u16 frame_add(u16 a, u16 b)
 	return (a + b) & HOST_FRAME_MASK;
 }
 
-/**
+/*
  * frame_after - is frame a after frame b
  */
 static inline int frame_after(u16 a, u16 b)
@@ -179,7 +179,7 @@ static inline int frame_after(u16 a, u16 b)
 	    (HOST_FRAME_MASK / 2);
 }
 
-/**
+/*
  * frame_after_eq - is frame a after or equal to frame b
  */
 static inline int frame_after_eq(u16 a, u16 b)
@@ -190,7 +190,7 @@ static inline int frame_after_eq(u16 a, u16 b)
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * c67x00_release_urb - remove link from all tds to this urb
  * Disconnects the urb from it's tds, so that it can be given back.
  * pre: urb->hcpriv != NULL
@@ -557,7 +557,7 @@ static int c67x00_claim_frame_bw(struct c67x00_hcd *c67x00, struct urb *urb,
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * td_addr and buf_addr must be word aligned
  */
 static int c67x00_create_td(struct c67x00_hcd *c67x00, struct urb *urb,
@@ -685,7 +685,7 @@ static int c67x00_add_data_urb(struct c67x00_hcd *c67x00, struct urb *urb)
 	return 0;
 }
 
-/**
+/*
  * return 0 in case more bandwidth is available, else errorcode
  */
 static int c67x00_add_ctrl_urb(struct c67x00_hcd *c67x00, struct urb *urb)
@@ -822,7 +822,7 @@ static void c67x00_fill_frame(struct c67x00_hcd *c67x00)
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * Get TD from C67X00
  */
 static inline void
@@ -970,7 +970,7 @@ static void c67x00_handle_isoc(struct c67x00_hcd *c67x00, struct c67x00_td *td)
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * c67x00_check_td_list - handle tds which have been processed by the c67x00
  * pre: current_td == 0
  */
@@ -1045,7 +1045,7 @@ static inline int c67x00_all_tds_processed(struct c67x00_hcd *c67x00)
 	return !c67x00_ll_husb_get_current_td(c67x00->sie);
 }
 
-/**
+/*
  * Send td to C67X00
  */
 static void c67x00_send_td(struct c67x00_hcd *c67x00, struct c67x00_td *td)
@@ -1081,7 +1081,7 @@ static void c67x00_send_frame(struct c67x00_hcd *c67x00)
 
 /* -------------------------------------------------------------------------- */
 
-/**
+/*
  * c67x00_do_work - Schedulers state machine
  */
 static void c67x00_do_work(struct c67x00_hcd *c67x00)
-- 
2.25.1

