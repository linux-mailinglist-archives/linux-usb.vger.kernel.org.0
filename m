Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E97305A16
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237053AbhA0LmA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236718AbhA0L3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:29:46 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C303AC0612F2
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:09 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q7so1484389wre.13
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrHfRQQ/E55YMZ4NS0RU+tz/ZZcnxVsTRIQbMp7bfu4=;
        b=QsH4cxFeLPJSLDLgvVVWqbfs1nNYSguuJJ5RoM2X14aS59cXwZyyf/SthbmdwBcbpm
         k2isWMHqYx6x63QZoqbneCyFIEvv+YeTqhw+3NyWrQITgTT63lhMpFlW8bzA6PSHiI2s
         4Frqm98pt97nNvnDEILxtkPvFP1LiSaqGZTiXWiW8QrAdyuxA4RxBJcZVc7PjKwXMwVe
         t7yBrUxT/0zIzxE/sT4XvdSo9ZHZNakYNxGWG+1rzSn6rNlpN5IfJwoi2bT6zi1QtzyV
         dIQFFYMVJjCqB3CIuzV0Ik+g3w7ZF3jaibbmlsSD9JLJYUQ2jMkNpC6JbxwL5sMy88O/
         n6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrHfRQQ/E55YMZ4NS0RU+tz/ZZcnxVsTRIQbMp7bfu4=;
        b=pCR2mHmLkXcYcznjo29+OQJ3+N5dXdwgUw5/WSL88J8p+TFZ1k+7a5qUnneBknFFIf
         jntHzeb/OlabAeegxOVGdgw6nYq9caZzVNE7x0/rWFPNibSVXmaD4bEjWj0v78m/TDvl
         NWj3bwhcg2LRLIY2G4j0tTfqk7c/mbahRIjEJjMy30rMUedbpkGciyqlVCyfdIJDR3OP
         QI5YIbjdlOxadZNGF+2Q2ZaeIkp2bGYYVo5Od5UwbGlCkheJVORf86nQXONo7T546QCp
         1wFkmTQ6nUxdl+CrRx5MW9vukYMTfeEIMpz8QrvMu0XaIuTTFt94hCU52sFNNtlHOjek
         /cNQ==
X-Gm-Message-State: AOAM530pmPGo3B647At87aPf0np/9tCOJwSHIeApWX2c4EklbCmdHbS9
        KMab5ie0lV+IwsJU8PmI+avTnA==
X-Google-Smtp-Source: ABdhPJzWI1nalbd0AEwTqiXOmP8+Kw8caxr4ZAdGpHQwJDkjZLaOARlqG0y7O6a0L58462LBm8WpYQ==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr10805222wrx.140.1611746768541;
        Wed, 27 Jan 2021 03:26:08 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m2sm2040065wml.34.2021.01.27.03.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:26:07 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 08/12] thunderbolt: tb: Kernel-doc function headers should document their parameters
Date:   Wed, 27 Jan 2021 11:25:50 +0000
Message-Id: <20210127112554.3770172-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127112554.3770172-1-lee.jones@linaro.org>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/thunderbolt/tb.c:535: warning: Function parameter or member 'sw' not described in 'tb_scan_switch'
 drivers/thunderbolt/tb.c:551: warning: Function parameter or member 'port' not described in 'tb_scan_port'
 drivers/thunderbolt/tb.c:711: warning: Function parameter or member 'tb' not described in 'tb_free_invalid_tunnels'
 drivers/thunderbolt/tb.c:726: warning: Function parameter or member 'sw' not described in 'tb_free_unplugged_children'
 drivers/thunderbolt/tb.c:1129: warning: Function parameter or member 'work' not described in 'tb_handle_hotplug'
 drivers/thunderbolt/tb.c:1239: warning: Function parameter or member 'tb' not described in 'tb_handle_event'
 drivers/thunderbolt/tb.c:1239: warning: Function parameter or member 'type' not described in 'tb_handle_event'
 drivers/thunderbolt/tb.c:1239: warning: Function parameter or member 'buf' not described in 'tb_handle_event'
 drivers/thunderbolt/tb.c:1239: warning: Function parameter or member 'size' not described in 'tb_handle_event'
 drivers/thunderbolt/tb.c:1239: warning: expecting prototype for tb_schedule_hotplug_handler(). Prototype was for tb_handle_event() instead

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/tb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index d08879849abed..413955aa6a949 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -528,7 +528,7 @@ static int tb_create_usb3_tunnels(struct tb_switch *sw)
 
 static void tb_scan_port(struct tb_port *port);
 
-/**
+/*
  * tb_scan_switch() - scan for and initialize downstream switches
  */
 static void tb_scan_switch(struct tb_switch *sw)
@@ -544,7 +544,7 @@ static void tb_scan_switch(struct tb_switch *sw)
 	pm_runtime_put_autosuspend(&sw->dev);
 }
 
-/**
+/*
  * tb_scan_port() - check for and initialize switches below port
  */
 static void tb_scan_port(struct tb_port *port)
@@ -704,7 +704,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 	tb_tunnel_free(tunnel);
 }
 
-/**
+/*
  * tb_free_invalid_tunnels() - destroy tunnels of devices that have gone away
  */
 static void tb_free_invalid_tunnels(struct tb *tb)
@@ -719,7 +719,7 @@ static void tb_free_invalid_tunnels(struct tb *tb)
 	}
 }
 
-/**
+/*
  * tb_free_unplugged_children() - traverse hierarchy and free unplugged switches
  */
 static void tb_free_unplugged_children(struct tb_switch *sw)
@@ -1120,7 +1120,7 @@ static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 
 /* hotplug handling */
 
-/**
+/*
  * tb_handle_hotplug() - handle hotplug event
  *
  * Executes on tb->wq.
@@ -1229,7 +1229,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 	kfree(ev);
 }
 
-/**
+/*
  * tb_schedule_hotplug_handler() - callback function for the control channel
  *
  * Delegates to tb_handle_hotplug.
-- 
2.25.1

