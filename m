Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FDD30BB0A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbhBBJfI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhBBJef (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 04:34:35 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317DDC06178C
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 01:33:55 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id p19so11383449plr.22
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 01:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=S4Mhk39bbXlkNrotr3DgqM+vlFOU2lM4Arg9L7yykNE=;
        b=QRIE2cVPkVAr5925xGQBAk+VqRJkO8q/Iw3cIMI01fHEyKQhlyPUnubNDbXG5p9kHu
         HvQml8E5bLdo2JhxN//W4kTk7mZyxSdC63fepdmIFdmBqPElj/ZNLA8QpTRUVgOaqZr7
         R2NVTM7AUBY9dXxBFcbQTHKeoayHsorQHhPOdcA8xkLWmvYgE0xFGvpK09QA8bHJHY+d
         A86oqwvfFDfC5wThJzxZZ5rHlLkJ1M5I97MxX52OGezra4zmbJ6dQuhOIpGmaKtnR2Z8
         Jw8iOG50MuIipuF8RMeMtJa+p3eNq8Wbl5cWVsEKUXbrT848fOeDpph6AVvgqiSb/phb
         k+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=S4Mhk39bbXlkNrotr3DgqM+vlFOU2lM4Arg9L7yykNE=;
        b=f6u6ph/U1RA9r6PeOZJ7BU6ENj6uxhfdrZ1aBkiVq7uaVm9YkU0VvQpbZj0XvN4f0P
         vdyDEN4EoXy6Do/eIww06oU3F+5lwPF93vIzUl450hsX64Wscnxd6CQZLkfDafMmWSJD
         yOu0Mb8V/CvlQEf52CscNn6ODbdMxwIF2WJaQl2h7ZOGxwjmTMg4ToQQFnzJlYjzb4Uy
         jQFLKhnrfEODTvd7hJPIH3t3jFYqkQtbwGi2MldCg1x9sfTNHB0G+i/v3QW3m7NtrR61
         LOX1nzfWCMdh+iRqL26gl3djt6ikdyB/ZFYXcZCKx97KYrd4k5CKXHie+0an8YSBS/qR
         ms/g==
X-Gm-Message-State: AOAM533NEzvetcnLMqPqEhc3BqFQ2ODJHaJRt1E486/Qam6C9UVXgGgC
        gbIiHQiFW5Ahu171znPWJfk+KirpB/3j
X-Google-Smtp-Source: ABdhPJxzB8Wce0MmbXCZy7VjAE8COOMrr6GE8xDKq+tc1ZwbEBTQSoTMOuXSgv5qV7WK6jrqAM6lQO0l0ILc
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a17:902:680a:b029:e1:8329:490 with SMTP id
 h10-20020a170902680ab02900e183290490mr3609919plk.13.1612258434508; Tue, 02
 Feb 2021 01:33:54 -0800 (PST)
Date:   Tue,  2 Feb 2021 17:33:35 +0800
In-Reply-To: <20210202093342.738691-1-kyletso@google.com>
Message-Id: <20210202093342.738691-2-kyletso@google.com>
Mime-Version: 1.0
References: <20210202093342.738691-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v4 1/8] usb: typec: Manage SVDM version
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10
  6.4.4.2.3 Structured VDM Version
  "The Structured VDM Version field of the Discover Identity Command
  sent and received during VDM discovery Shall be used to determine the
  lowest common Structured VDM Version supported by the Port Partners or
  Cable Plug and Shall continue to operate using this Specification
  Revision until they are Detached."

Add a variable in typec_capability to specify the highest SVDM version
supported by the port and another variable in typec_port to cache the
negotiated SVDM version between the port partners.

Also add setter/getter functions for the negotiated SVDM version.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 13 +++++++++++++
 include/linux/usb/typec.h | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index b6ceab3dc16b..42d1be1eece9 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -51,6 +51,7 @@ struct typec_port {
 	enum typec_role			vconn_role;
 	enum typec_pwr_opmode		pwr_opmode;
 	enum typec_port_type		port_type;
+	enum usb_pd_svdm_ver		svdm_version;
 	struct mutex			port_type_lock;
 
 	enum typec_orientation		orientation;
@@ -1841,6 +1842,18 @@ int typec_find_port_data_role(const char *name)
 }
 EXPORT_SYMBOL_GPL(typec_find_port_data_role);
 
+void typec_set_svdm_version(struct typec_port *port, enum usb_pd_svdm_ver ver)
+{
+	port->svdm_version = ver;
+}
+EXPORT_SYMBOL_GPL(typec_set_svdm_version);
+
+enum usb_pd_svdm_ver typec_get_svdm_version(struct typec_port *port)
+{
+	return port->svdm_version;
+}
+EXPORT_SYMBOL_GPL(typec_get_svdm_version);
+
 /* ------------------------------------------ */
 /* API for Multiplexer/DeMultiplexer Switches */
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 4946eca742d5..f692d9ee0f13 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -217,12 +217,19 @@ struct typec_operations {
 			     enum typec_port_type type);
 };
 
+enum usb_pd_svdm_ver {
+	SVDM_VER_1_0 = 0,
+	SVDM_VER_2_0 = 1,
+	SVDM_VER_MAX = SVDM_VER_2_0,
+};
+
 /*
  * struct typec_capability - USB Type-C Port Capabilities
  * @type: Supported power role of the port
  * @data: Supported data role of the port
  * @revision: USB Type-C Specification release. Binary coded decimal
  * @pd_revision: USB Power Delivery Specification revision if supported
+ * @svdm_version: USB PD Structured VDM version if supported
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @fwnode: Optional fwnode of the port
@@ -236,6 +243,7 @@ struct typec_capability {
 	enum typec_port_data	data;
 	u16			revision; /* 0120H = "1.2" */
 	u16			pd_revision; /* 0300H = "3.0" */
+	enum usb_pd_svdm_ver	svdm_version;
 	int			prefer_role;
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
@@ -286,4 +294,6 @@ int typec_find_orientation(const char *name);
 int typec_find_port_power_role(const char *name);
 int typec_find_power_role(const char *name);
 int typec_find_port_data_role(const char *name);
+void typec_set_svdm_version(struct typec_port *port, enum usb_pd_svdm_ver);
+enum usb_pd_svdm_ver typec_get_svdm_version(struct typec_port *port);
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.30.0.365.g02bc693789-goog

