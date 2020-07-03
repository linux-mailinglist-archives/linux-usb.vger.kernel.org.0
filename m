Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4E2213EC1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgGCRmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgGCRmb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977F0C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q15so32756185wmj.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qi+0OF4ODQNxSO8LjvEMR71lEcthMzByu7Tr2x6qWes=;
        b=t2+CoUJs3bBmjlIR70pAcQdTHlv4TviWf+b2aA4YJe6LJeTqVDlg5vwidfJj6CBS8l
         Oc6IOSVUnLsIh6PdyDYr1ELmexj4PMuORbBHyUQXFoDAv+Vzrd6snchLVIi4QGuPfEX0
         BLF1y/cS/favJLDEvlezs/jNoBZZ5s8RLXv8/gw1CxmGrSNEcCwMgeToiRTBhTKO4CNl
         Y4iFnlx9iyVMXYokxxNrocJzJc6KUdzpfLuDPbFZwAVzokRZuNHosggTHDuvXhsNU3xA
         TLRE3LraSkdan5rLoZS5IwUxltwAQn+sPS79B9N5JzVM5fVjV0AGKQn0qyYczDTgXPb0
         NW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qi+0OF4ODQNxSO8LjvEMR71lEcthMzByu7Tr2x6qWes=;
        b=SyR0geAv3oV7nif3JvcTzlWmYTZ7d+WT2bEX1cXCmus89BWCOcEh0ww1OOauN4hGUl
         48ZZaEo304u6Fkq69+X9K2NBi9vtzAOYvA9Oi7FC+PjlnO9+V6LDaBCaXVjI9QSPrS1G
         I9lOhvqwRtLyuJYuYstUdUFHAjfFTRFv+K6jP7RxcPlj2hT/Ndxlvy3aWVLtoiFmqMGi
         YvFRhLG9I3IAzHySIW7rcSSXSOH5wzk71edW0uu2B21/CaqirEhWLogSnfWeYzrUqGBl
         61QgpFY17FYd3Y1O0aHGBTy3I7FyszSh0rd7G4U0QpwL6+d9GImo8PTJvcjB6FFh07gi
         IRlg==
X-Gm-Message-State: AOAM530VW2tUgfCMACEotQtGHq0De/D7fMidP+sNQP99Gq5hqNWk+491
        xwsF6nlQoRIV992frpDMwPeeKBLRvh8=
X-Google-Smtp-Source: ABdhPJxZeKq2kXp5maw2pou0t9HUknsokrf7o+MtWg1zXkBtDIjsv4yrGgRAE9d2iNVgqYk35P99+Q==
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr40912679wml.185.1593798150305;
        Fri, 03 Jul 2020 10:42:30 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>
Subject: [PATCH 10/30] usb: chipidea: debug: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:28 +0100
Message-Id: <20200703174148.2749969-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/debug.c:25: warning: Function parameter or member 's' not described in 'ci_device_show'
 drivers/usb/chipidea/debug.c:25: warning: Function parameter or member 'data' not described in 'ci_device_show'
 drivers/usb/chipidea/debug.c:54: warning: Function parameter or member 's' not described in 'ci_port_test_show'
 drivers/usb/chipidea/debug.c:54: warning: Function parameter or member 'data' not described in 'ci_port_test_show'
 drivers/usb/chipidea/debug.c:75: warning: Function parameter or member 'file' not described in 'ci_port_test_write'
 drivers/usb/chipidea/debug.c:75: warning: Function parameter or member 'ubuf' not described in 'ci_port_test_write'
 drivers/usb/chipidea/debug.c:75: warning: Function parameter or member 'count' not described in 'ci_port_test_write'
 drivers/usb/chipidea/debug.c:75: warning: Function parameter or member 'ppos' not described in 'ci_port_test_write'
 drivers/usb/chipidea/debug.c:122: warning: Function parameter or member 's' not described in 'ci_qheads_show'
 drivers/usb/chipidea/debug.c:122: warning: Function parameter or member 'data' not described in 'ci_qheads_show'
 drivers/usb/chipidea/debug.c:154: warning: Function parameter or member 's' not described in 'ci_requests_show'
 drivers/usb/chipidea/debug.c:154: warning: Function parameter or member 'data' not described in 'ci_requests_show'

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index e0376ee646adf..da5d18cf68406 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -18,7 +18,7 @@
 #include "bits.h"
 #include "otg.h"
 
-/**
+/*
  * ci_device_show: prints information about device capabilities and status
  */
 static int ci_device_show(struct seq_file *s, void *data)
@@ -47,7 +47,7 @@ static int ci_device_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(ci_device);
 
-/**
+/*
  * ci_port_test_show: reads port test mode
  */
 static int ci_port_test_show(struct seq_file *s, void *data)
@@ -67,7 +67,7 @@ static int ci_port_test_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-/**
+/*
  * ci_port_test_write: writes port test mode
  */
 static ssize_t ci_port_test_write(struct file *file, const char __user *ubuf,
@@ -115,7 +115,7 @@ static const struct file_operations ci_port_test_fops = {
 	.release	= single_release,
 };
 
-/**
+/*
  * ci_qheads_show: DMA contents of all queue heads
  */
 static int ci_qheads_show(struct seq_file *s, void *data)
@@ -147,7 +147,7 @@ static int ci_qheads_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(ci_qheads);
 
-/**
+/*
  * ci_requests_show: DMA contents of all requests currently queued (all endpts)
  */
 static int ci_requests_show(struct seq_file *s, void *data)
-- 
2.25.1

