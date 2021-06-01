Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91981397351
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbhFAMeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 08:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbhFAMd7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 08:33:59 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2142C061574
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 05:32:16 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id 31-20020a1709020022b02900eeddd708c8so4484515pla.11
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JctqiyfH0XVicZkZGLx/v4l2VDYTxFT6JonHjlOUxnA=;
        b=iKgRwDxKFYOf43YFz+J13Vd9f53h3y8It79xAgBtsJ+r7a6Kfh3unBAXGmR3yA/LJO
         sjYeH9LKaVRJcoaI8VfpyukIQACtEPHO7yKRvwelwBTHnUe4aI7AoedLeG0rsTnqDunI
         vwcNKNaTRBPgD6QHvkO58Sd77wyRpGx8aAiNh5X+K43hg1WpW/m5CBREZu0N+kqZREZj
         Yid4SIVbvFvAOYNHvpi8ARN3PndW3Q+6qVnSJ6Vd+fgQ5erTz5EMabepq+UboSi3pDDJ
         hKcQYjgUPct4N+Fm3J1Vwau6O4LqFPcOWJxsGexH2crGiLPer01vzFEl8lrFiDgU2GKF
         PFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JctqiyfH0XVicZkZGLx/v4l2VDYTxFT6JonHjlOUxnA=;
        b=S0A5pFNLGdhFxv6R5Lc1MgRHM71kVKga6b/A95hn097+p7AD2yGw6XvSoyiAjttwmu
         NH7tGS3dnAX0FqRKk5liRHkanM9U3GvhCGagA1VjIEVlSr7mBXaTEU5Ui+7hME5720RU
         rvGFOz2A5t6xyoPeLmYOyITK2z9Pt+v00IZu0WI2Rk1dXTF4cCf0Vk6yW895UUsqmhvT
         IbLFby7K6dm0WXTW81RNTWIQwi9ohpv8xZ2lWv3BgLIl+JHyjI4fDlnKVE6wOh5Ulu5D
         AHph2pOQc3GWC2rsFFW2NTyoplrucB4mHjnXGgMBXevcijJiMJMOm2nTXOe4oM8Iu7bU
         hSow==
X-Gm-Message-State: AOAM530XjhdQzKOkkIgRh8mMc9IyA1nOy8QNMw7KrXnf36dRlZPYYi2B
        pVbzTygW2ljPymeTSw/SEAguRhorsBm4
X-Google-Smtp-Source: ABdhPJzSHVTD5EqPx2Ya73euD4lw0KuKiVoKG9/k0unvlAhODYfOVEOZC2AuYw+ElX/k8F9CwnWVge3uTsMo
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:c9e8:9a17:9774:bcd3])
 (user=kyletso job=sendgmr) by 2002:a17:902:7401:b029:102:34f7:48f5 with SMTP
 id g1-20020a1709027401b029010234f748f5mr16020870pll.47.1622550736436; Tue, 01
 Jun 2021 05:32:16 -0700 (PDT)
Date:   Tue,  1 Jun 2021 20:31:51 +0800
In-Reply-To: <20210601123151.3441914-1-kyletso@google.com>
Message-Id: <20210601123151.3441914-5-kyletso@google.com>
Mime-Version: 1.0
References: <20210601123151.3441914-1-kyletso@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v3 4/4] usb: typec: tcpm: Fix misuses of AMS invocation
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tcpm_ams_start is used to initiate an AMS as well as checking Collision
Avoidance conditions but not for flagging passive AMS (initiated by the
port partner). Fix the misuses of tcpm_ams_start in tcpm_pd_svdm.

ATTENTION doesn't need responses so the AMS flag is not needed here.

Fixes: 0bc3ee92880d ("usb: typec: tcpm: Properly interrupt VDM AMS")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ebe490949fa0..c4b02a6ca3d7 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1583,7 +1583,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				svdm_version = PD_VDO_SVDM_VER(p[0]);
 			}
 
-			tcpm_ams_start(port, DISCOVER_IDENTITY);
+			port->ams = DISCOVER_IDENTITY;
 			/*
 			 * PD2.0 Spec 6.10.3: respond with NAK as DFP (data host)
 			 * PD3.1 Spec 6.4.4.2.5.1: respond with NAK if "invalid field" or
@@ -1604,19 +1604,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			}
 			break;
 		case CMD_DISCOVER_SVID:
-			tcpm_ams_start(port, DISCOVER_SVIDS);
+			port->ams = DISCOVER_SVIDS;
 			break;
 		case CMD_DISCOVER_MODES:
-			tcpm_ams_start(port, DISCOVER_MODES);
+			port->ams = DISCOVER_MODES;
 			break;
 		case CMD_ENTER_MODE:
-			tcpm_ams_start(port, DFP_TO_UFP_ENTER_MODE);
+			port->ams = DFP_TO_UFP_ENTER_MODE;
 			break;
 		case CMD_EXIT_MODE:
-			tcpm_ams_start(port, DFP_TO_UFP_EXIT_MODE);
+			port->ams = DFP_TO_UFP_EXIT_MODE;
 			break;
 		case CMD_ATTENTION:
-			tcpm_ams_start(port, ATTENTION);
 			/* Attention command does not have response */
 			*adev_action = ADEV_ATTENTION;
 			return 0;
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

