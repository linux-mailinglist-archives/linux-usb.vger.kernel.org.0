Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B36297900
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 23:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756805AbgJWVn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 17:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753135AbgJWVn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 17:43:59 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D43FC0613CE
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:43:59 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id n16so2338232pgv.13
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8WfHBe1he2P6vHiEzCoXjELjhHqzR0SChORwDmTyBw=;
        b=Ioxm4k6IQEOK0IvA9CoL5I/Aim+DbS+TqDr9g55yRJIodJ87hC+4+UNpQY4kHVr8tt
         OBaXP46HwL7cBlOhlSyF9GOYv7fdo+K3NsQUgdIVjbiljF4guuN8CoCXyduDCRiKybw3
         pXhx3aEiDjZYwhT+qKooNVcDZDJKB5M7bttHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8WfHBe1he2P6vHiEzCoXjELjhHqzR0SChORwDmTyBw=;
        b=A4vTOZT8+hhPbMEDmIMLcj+5JNAaOzTumZ4WpAMVvvL/BITnbyGRwfHbEkyIMMSRNJ
         16evZ9xC/2A1Xq12Uo+3xDbzBbghAi32WNgWhvjLIysnWhQ39Bo1YrKhGQyzcNsh3CYd
         IsaNMeTJMpe4DsbPllu5Bpmm7PptPL0vvNkPUTZ5e8lNlxRnJQ7zHyUEy7PyIgV63RBb
         aR0Waus8cbS04XdtcF+dgGmF3Yym1c52KnQOEYdpBjR6IZZVA3ZwmmrrTZRRVZ9KDLe5
         kjitzF4yeYm1FBLMs4DiHkvoVy0Nk11p4bQhMnxZfjgIjFJIBqwrI0khT3r3yY92Zg5J
         ygqg==
X-Gm-Message-State: AOAM5318ZXJIQ8xrV3InH+fheJW5iP6pbHptQ3DIG1N79hOGUBVyn19e
        hmvn0PxKi81aChcSEtf8t0bAiHqUf8JfdA==
X-Google-Smtp-Source: ABdhPJxMtbdEGCDCPndeZC3NtuvPFx4B+/a4IKK8Y9iDM7CyDEOVp/yG7zfhSQLReUgP+re6nM2/GA==
X-Received: by 2002:a65:4bcb:: with SMTP id p11mr3533960pgr.253.1603489438336;
        Fri, 23 Oct 2020 14:43:58 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id j8sm3167338pfr.121.2020.10.23.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 14:43:56 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 1/2] usb: typec: Consolidate syfs ABI documentation
Date:   Fri, 23 Oct 2020 14:43:26 -0700
Message-Id: <20201023214328.1262883-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Both partner and cable have identity VDOs. These are listed separately
in the Documentation/ABI/testing/sysfs-class-typec. Factor these out
into a common location to avoid the duplication.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Patch first introduced in v3.

 Documentation/ABI/testing/sysfs-class-typec | 59 ++++++---------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index b834671522d6..0f839fd022f1 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -134,42 +134,6 @@ Description:
 		Shows if the partner supports USB Power Delivery communication:
 		Valid values: yes, no
 
-What:		/sys/class/typec/<port>-partner>/identity/
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		This directory appears only if the port device driver is capable
-		of showing the result of Discover Identity USB power delivery
-		command. That will not always be possible even when USB power
-		delivery is supported, for example when USB power delivery
-		communication for the port is mostly handled in firmware. If the
-		directory exists, it will have an attribute file for every VDO
-		in Discover Identity command result.
-
-What:		/sys/class/typec/<port>-partner/identity/id_header
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		ID Header VDO part of Discover Identity command result. The
-		value will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
-What:		/sys/class/typec/<port>-partner/identity/cert_stat
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		Cert Stat VDO part of Discover Identity command result. The
-		value will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
-What:		/sys/class/typec/<port>-partner/identity/product
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		Product VDO part of Discover Identity command result. The value
-		will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
 
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
@@ -196,17 +160,28 @@ Description:
 		- type-c
 		- captive
 
-What:		/sys/class/typec/<port>-cable/identity/
+
+USB Type-C partner/cable Power Delivery Identity objects
+
+NOTE: The following attributes will be applicable to both
+partner (e.g /sys/class/typec/port0-partner/) and
+cable (e.g /sys/class/typec/port0-cable/) devices. Consequently, the example file
+paths below are prefixed with "/sys/class/typec/<port>-{partner|cable}/" to
+reflect this.
+
+What:		/sys/class/typec/<port>-{partner|cable}/identity/
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		This directory appears only if the port device driver is capable
 		of showing the result of Discover Identity USB power delivery
 		command. That will not always be possible even when USB power
-		delivery is supported. If the directory exists, it will have an
-		attribute for every VDO returned by Discover Identity command.
+		delivery is supported, for example when USB power delivery
+		communication for the port is mostly handled in firmware. If the
+		directory exists, it will have an attribute file for every VDO
+		in Discover Identity command result.
 
-What:		/sys/class/typec/<port>-cable/identity/id_header
+What:		/sys/class/typec/<port>-{partner|cable}/identity/id_header
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
@@ -214,7 +189,7 @@ Description:
 		value will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
-What:		/sys/class/typec/<port>-cable/identity/cert_stat
+What:		/sys/class/typec/<port>-{partner|cable}/identity/cert_stat
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
@@ -222,7 +197,7 @@ Description:
 		value will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
-What:		/sys/class/typec/<port>-cable/identity/product
+What:		/sys/class/typec/<port>-{partner|cable}/identity/product
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
-- 
2.29.0.rc1.297.gfa9743e501-goog

