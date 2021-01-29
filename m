Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F9130858D
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 07:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhA2GPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 01:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbhA2GO6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jan 2021 01:14:58 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E30C06174A
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:18 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g3so4693025plp.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w/wn3T3iqZt9tVHIDyqV8Hkntdbm1OettNslItOmP6Y=;
        b=nDx5OMKdWtXkpN/dc9Q5pzLqYss9vnOgoh8QnodPTN4+s7+SzdZf2sDamih5n3VmOV
         sH1bQ4ZMoEZZf9Y5LLdjF0ju6RZy6puOW6klo8tzT4Gdd3MjtmDQMZT2Svqz4cGKR0Ik
         ZKk5kSYNAc90P0LhG908KRXmFhP58tB1Kayv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/wn3T3iqZt9tVHIDyqV8Hkntdbm1OettNslItOmP6Y=;
        b=TwAkavn4/cBk/N/F2T7Anhne/nF4uMWQrxV209BmGsWChwY7dg4++smHzEQ5aocZTZ
         SjjN/HETMvznlVqI9CxGODj8F4UvOc3AnWbnfOxkd6B+ZsJFJ7t8OHQEfrWX8uprdeif
         UIiy3nSMf98IcIkM7xKwj4kVTI+bWHHIN+hvRz7CRmZU8c7PxGo+0NWCZTiJWxR19KF+
         t7iddM3XOKTwMr3uNOtUerryTSBpzKYTp8Qfgau8+uoHJBA2jpUPUM5uCJYX80qp5Q4K
         XHo265zvqXYyJNb+RJim0B397mXUwi+MB1ljIXNPhd3lD9Y/+7opTiAYCg8REVizMIdc
         mOxA==
X-Gm-Message-State: AOAM532tDYtEOlF54/C91hQbPfxND6aNBx3LISy26blPfIs6uDzSixgi
        t2uuIcd63Cqy/5GABZDlvNHvBg==
X-Google-Smtp-Source: ABdhPJyr/UyrX/i7+3DY+c54vjuNEEirqThXM+GMKNAXpqILTa3y999RCdhvQurmsEVKEJYg9JiOqA==
X-Received: by 2002:a17:90a:578a:: with SMTP id g10mr2998943pji.74.1611900857904;
        Thu, 28 Jan 2021 22:14:17 -0800 (PST)
Received: from bleung.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id 17sm7551013pfv.13.2021.01.28.22.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 22:14:17 -0800 (PST)
From:   Benson Leung <bleung@chromium.org>
To:     heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     groeck@chromium.org, bleung@google.com, bleung@chromium.org
Subject: [PATCH 1/6] usb: typec: Standardize PD Revision format with Type-C Revision
Date:   Thu, 28 Jan 2021 22:14:01 -0800
Message-Id: <20210129061406.2680146-2-bleung@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129061406.2680146-1-bleung@chromium.org>
References: <20210129061406.2680146-1-bleung@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Type-C Revision was in a specific BCD format "0120H" for 1.2.
USB PD revision numbers follow a similar pattern with "0300H" for 3.0.

Standardizes the sysfs format for usb_power_delivery_revision
to align with the BCD format used for usb_typec_revision.

Example values:
- "2.0": USB Power Delivery Release 2.0
- "3.0": USB Power Delivery Release 3.0
- "3.1": USB Power Delivery Release 3.1

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 7 ++++++-
 drivers/usb/typec/class.c                   | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 8eab41e79ce6..b61480535fdc 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -105,7 +105,12 @@ Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Revision number of the supported USB Power Delivery
-		specification, or 0 when USB Power Delivery is not supported.
+		specification, or 0.0 when USB Power Delivery is not supported.
+
+		Example values:
+		- "2.0": USB Power Delivery Release 2.0
+		- "3.0": USB Power Delivery Release 3.0
+		- "3.1": USB Power Delivery Release 3.1
 
 What:		/sys/class/typec/<port>/usb_typec_revision
 Date:		April 2017
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 8f77669f9cf4..4f60ee7ba76a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1500,8 +1500,9 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 						char *buf)
 {
 	struct typec_port *p = to_typec_port(dev);
+	u16 rev = p->cap->pd_revision;
 
-	return sprintf(buf, "%d\n", (p->cap->pd_revision >> 8) & 0xff);
+	return sprintf(buf, "%d.%d\n", (rev >> 8) & 0xff, (rev >> 4) & 0xf);
 }
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
-- 
2.30.0.365.g02bc693789-goog

