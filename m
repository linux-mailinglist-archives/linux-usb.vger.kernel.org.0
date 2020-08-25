Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F264251069
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgHYEW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgHYEW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:26 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A3AC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:25 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 78so1902088pgf.5
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=JEUp//OgrqIdq4oBTWKdSUH95jBvEG8vdsM1vuPs8Tc=;
        b=jkhAZg0iMscEcFm/RUujA72vXdC5gOQalIMPfd5KOkCgy0trvRgRNN31LwH8axbb7i
         xOLx4FM+xYzv2EGDoGafREwUQoWb2M+/oQkPRZlswGJnaPNb8tdZwjkBj1fnwNhV576/
         R0y80iV4KLLDO566lEoAvw6xLv1BQdZffvioxrcRTOZVQMglHb96tE6o9Xjskbs7rhkf
         ApskSMLxthNLqOY1aRI+2ijCMAJLe5FnQYOcxBmE0yrHJfckDTTYByGE5JXdgtLrQw3I
         nUpd3w8XVA8y4JfSuoVObQcUCdk71hZLCS2c00zANEgCy3TZ0y47FfmqCp4xPp8G1mQo
         iu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JEUp//OgrqIdq4oBTWKdSUH95jBvEG8vdsM1vuPs8Tc=;
        b=N06ihSy2WR2S2HYPsA7wSvNRXQCJ1q7FBWQk4G8CbRrEbSJNR2qtIVBl8qHrspwZRA
         pfQCr6zbFj4pGzTqOvPaogarpoBZYhJGunpffGcFllt66jOPgjyKmgwfMLQavZHVnxKv
         3QJPrAS9L9SCMl2VnBzftjk/awvOqsO13bULyXMm6tWOXbmFKlLKPuo5VI6PARxv8okk
         riRsuuNLXyn0R/WMhWF3wFj5h/JbwncGDNc8RiYQuiZZkQka9GVQnIpquljV1rTnZ9qv
         OCl14lokS2Mh20PKpJpgUW1Dkz9vQqzmNM6mb/iZZ4layhlCzJvw2fgz6i/7RbzqHiq9
         JK/Q==
X-Gm-Message-State: AOAM533bgYjc3HTVMt1211NMt3qsayAZNWZJoNACvPZIBlMFNQQ9qE68
        FWJFwqakND4nOHc/410OchKuZTxysIg=
X-Google-Smtp-Source: ABdhPJyqxUn6kmdMRMpi7HMnXOCyU5kHwFBq5l3bMwOsEy7jvpoqAEAyF30GuaZPav1y862SjZOY2YhBsHQ=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:bd8a:: with SMTP id
 z10mr72361pjr.12.1598329345209; Mon, 24 Aug 2020 21:22:25 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:21:57 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-2-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 01/14 v1] usb: typec: tcpci: Add register definitions to tcpci
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add register definitions to trap extended alerts.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 11c36d086c86..fd26ca35814c 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -16,6 +16,7 @@
 #define TCPC_PD_INT_REV			0xa
 
 #define TCPC_ALERT			0x10
+#define TCPC_ALERT_EXTENDED_STATUS	BIT(13)
 #define TCPC_ALERT_VBUS_DISCNCT		BIT(11)
 #define TCPC_ALERT_RX_BUF_OVF		BIT(10)
 #define TCPC_ALERT_FAULT		BIT(9)
@@ -32,6 +33,10 @@
 #define TCPC_ALERT_MASK			0x12
 #define TCPC_POWER_STATUS_MASK		0x14
 #define TCPC_FAULT_STATUS_MASK		0x15
+
+#define TCPC_EXTENDED_STATUS_MASK		0x16
+#define TCPC_EXTENDED_STATUS_MASK_VSAFE0V	BIT(0)
+
 #define TCPC_CONFIG_STD_OUTPUT		0x18
 
 #define TCPC_TCPC_CTRL			0x19
-- 
2.28.0.297.g1956fa8f8d-goog

