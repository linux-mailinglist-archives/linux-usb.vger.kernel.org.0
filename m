Return-Path: <linux-usb+bounces-3140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F100F7F379E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAEAE28262E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962EF20DD6;
	Tue, 21 Nov 2023 20:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uo6EHovU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A371A91
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:52 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c16f262317so150499a12.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700599132; x=1701203932; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpAN12hpYsjPqobveD3PUCYJQ9BmRdkXyaq+BHg4or4=;
        b=Uo6EHovUftNEVYErarZkRDqT8W44EzyRkAdKEe7S77QX7TCT+lynVmWNGAbCf2XDx2
         t9rzweGUwG98EMtDhckDVEK0GcQdLHA2bSFbyTFwTMne6l9QuwBTmjAFO6a8PMcCYExz
         275F2elITKplfLLXCObzrqsbaldQBA5aNCgHECBGw6KVZQAA7EgBU4MCGnA/4mI3Gt8S
         suwBC1OKdzIWt31jnP73VBTiinuXOe0e0/WbxCJAF+0P+Or1wReNDpL0F5JjmMWbTWls
         NxMgTvvSmAkj1wZ3/1lvjh6DlvUgHEaKoATD1aGb29f/4m4eVRd3WiZB55xw3gkMoUxE
         leTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599132; x=1701203932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpAN12hpYsjPqobveD3PUCYJQ9BmRdkXyaq+BHg4or4=;
        b=hxQtfTNjMQVHWf1g3wYCzHDWViBvHyuCc2rh9D60FNcA+1qe1THSFoRine5DnJv8+G
         fXgLLtaURAUk807qyR3j/J3bjVQ5w5BuwzJhrR0L/h9ffCj2OFZk3AYrkMMoRPczAirr
         JFnKTrkesO0t05j8dJUyfJEtMuaquSr2Qc5/l447oqlT5z0hMXbxFBapG4zpT4mAECgu
         YOEO2iE+0QOhnc80SAFv3jyukML80icQcTSNfZ28Vta/my3+JX+WOr3O/jRycMxiyQjv
         vtRO3SoczS20YIyMBm/+zb8IcyPbZJyrSdSIizlodlYiLQNetkN/N7WKfwrNhDl6ICPl
         QQrA==
X-Gm-Message-State: AOJu0YxYP6OVLllWrt4lvEX0/Ltu665PhEdFwXCuaQnV3mtddD0avWYH
	eVImCEzagn60AXBiTXRBbOrcet+xPfW95/E=
X-Google-Smtp-Source: AGHT+IH4DRI5US3jLyCwko2wUpOC4NIcFReSx07F/9ry6Ea9M80zEa8rCpiyb+ZWubY1zT8Lu21bmavCJm7OdY8=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a63:f517:0:b0:5bd:2714:1752 with SMTP id
 w23-20020a63f517000000b005bd27141752mr118281pgh.0.1700599132072; Tue, 21 Nov
 2023 12:38:52 -0800 (PST)
Date: Tue, 21 Nov 2023 20:38:47 +0000
In-Reply-To: <20231121203845.170234-4-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231121203845.170234-4-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=rdbabiera@google.com;
 h=from:subject; bh=SxYaVtVD/g0CMGs47FWSPZQOsqfpWmahrF8ll25pSnM=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmxoqH9gjdulPWq7J+/tnnNlaMzZ9XkM+prXutyLk3yv
 3tv+ju1jlIWBjEOBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACbCNp3hvxf77fmFWnKbNwWy
 VGZJNH+uSAvz9nQyEgiXVdtUf+KbNyPD9No0Hd1JdUtat3xiTwns/VomWc+yy8quc3LWhJ1el16 yAAA=
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231121203845.170234-5-rdbabiera@google.com>
Subject: [PATCH v1 1/2] usb: typec: tcpm: add tcpm_port_error_recovery symbol
From: RD Babiera <rdbabiera@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, badhri@google.com, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add tcpm_port_error_recovery symbol and corresponding event that runs in
tcpm_pd_event handler to set the port to the ERROR_RECOVERY state. tcpci
drivers can use the symbol to reset the port when tcpc faults affect port
functionality.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++++
 include/linux/usb/tcpm.h      |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 058d5b853b57..2e553dc63619 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -251,6 +251,7 @@ enum frs_typec_current {
 #define TCPM_FRS_EVENT		BIT(3)
 #define TCPM_SOURCING_VBUS	BIT(4)
 #define TCPM_PORT_CLEAN		BIT(5)
+#define TCPM_PORT_ERROR		BIT(6)
 
 #define LOG_BUFFER_ENTRIES	1024
 #define LOG_BUFFER_ENTRY_SIZE	128
@@ -5477,6 +5478,10 @@ static void tcpm_pd_event_handler(struct kthread_work *work)
 					tcpm_set_state(port, tcpm_default_state(port), 0);
 			}
 		}
+		if (events & TCPM_PORT_ERROR) {
+			tcpm_log(port, "port triggering error recovery");
+			tcpm_set_state(port, ERROR_RECOVERY, 0);
+		}
 
 		spin_lock(&port->pd_event_lock);
 	}
@@ -5544,6 +5549,15 @@ bool tcpm_port_is_toggling(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_port_is_toggling);
 
+void tcpm_port_error_recovery(struct tcpm_port *port)
+{
+	spin_lock(&port->pd_event_lock);
+	port->pd_events |= TCPM_PORT_ERROR;
+	spin_unlock(&port->pd_event_lock);
+	kthread_queue_work(port->wq, &port->event_work);
+}
+EXPORT_SYMBOL_GPL(tcpm_port_error_recovery);
+
 static void tcpm_enable_frs_work(struct kthread_work *work)
 {
 	struct tcpm_port *port = container_of(work, struct tcpm_port, enable_frs);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index ab7ca872950b..65fac5e1f317 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -173,5 +173,6 @@ void tcpm_pd_hard_reset(struct tcpm_port *port);
 void tcpm_tcpc_reset(struct tcpm_port *port);
 void tcpm_port_clean(struct tcpm_port *port);
 bool tcpm_port_is_toggling(struct tcpm_port *port);
+void tcpm_port_error_recovery(struct tcpm_port *port);
 
 #endif /* __LINUX_USB_TCPM_H */
-- 
2.43.0.rc1.413.gea7ed67945-goog


