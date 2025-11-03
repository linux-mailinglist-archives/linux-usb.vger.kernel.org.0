Return-Path: <linux-usb+bounces-29989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0AC2A0F4
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 06:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D76D3B2007
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 05:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECED28150F;
	Mon,  3 Nov 2025 05:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SDW09633"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAF23E25B
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 05:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762147498; cv=none; b=cqG05CexV6vr88WQsb7lbkzt44s8hisFIKGetS7yszH3LfcUKtxvcJYddOA2lq5ZyQV6bzd0VEP7eJ7P9C9yfW1n72faZ/E0vK5CyHW8jhO0e8ooi6cYT0Qedxc0zaZ7GaX+aSNBZKYUe3f67C+Iqc/VJmoN3LygrFhv8qUudqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762147498; c=relaxed/simple;
	bh=IQKNL9GWXX+eblktJ/DaeOuaemDNqFCi6duaItLKPGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XrBSnIgdPEeT5tKLAgM7nXslUFjgErT9C6Gx379byZQg7EnEYwrVf4f0Joq1kpRDxTPXWfcMbPxoizcC9/SgXZyNKZlqDM5tYzlYIX41EcidQth5qbWznco9iymG2+2jjm4b1YiyGqxZ36tz59eRiHC3hf8iaq2IuPtgGHVgcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SDW09633; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so9065913a91.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 21:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762147496; x=1762752296; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsNRfrHh1rrhbxLfUOmp7hUmrx3CJuqos5NLcSq/m/s=;
        b=SDW096332FrZlLMd80jYHLD0gkhy0m1Njm5Gr4dIvdZayhBoeVKPNU8/M9G/Tnf+Sv
         13ibTw+xmKqqBmGC4E1erXrxHlhXO6VA9BireXhMnwgkR5AXcrJBob76XoZ9k4ZtyfBz
         nscg3MSRn25QoY0VVV5LbtDPeMBEJNZEQJxxEPnblnrfimpYf3uTXYGe6rdR9oFWjsvy
         5HJ6DzT+01v7CK/GHPAmwRSfgXJc4yDDZXG6f+frmNkaDGRVZEla3RXZgXPFVLJ5MlJE
         yzfhyplUg8OIAXxtaQMTRzMqDXjg85t+E+TRsKlVCgGuiRBLQAWiKL1CIA9FSqEPiQT7
         q+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762147496; x=1762752296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsNRfrHh1rrhbxLfUOmp7hUmrx3CJuqos5NLcSq/m/s=;
        b=W+yNVzBR7LD+hW7CBDwhO2s9iFSFTwdOxl65P02riERh28kyC7q3POJE4+ZhGYNjiP
         Gl2dzl0vxz/FYG/CsnSNeM37P59TaRN1+/jIbiQwObvT196bz4JVLWJaWqdhLuuNRFcV
         8+ExoUNXNCINLxRGwxJdytBNEt33jZbzTLnLDQajSLorsyxpcCX/87ZvoQHWxUMWOCmL
         C+CqFY/nz5lHpoeBjJCfDA18eUB84rUHuz5WJa2/swH4qYOLWXUxIpYnEah4y7iad/RW
         ZzT+MtRaQk9u72qSO+kKWxAX0CtP0mevU0dPSxrtSoskpKHZ1AD0MZ8MWDL75nZMLFKn
         22Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV1b0bSqXWA5hWdDX5m9Nfiw0cGoicOhsREFJJEFjYQeg51qO9CPCPaYyIfJUJ3EI/TNP16CaH4j5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81bxAFfXjzg5BkOwp4YfYtS8bBUFuDKxIlCkMR15KFAbRf35q
	W6PeT0Iwv5jHkLXopuipo0zxQUyb3qbMlme+bfuNCW5oVqNF7+NsVRnOoE1jRjiwZ77ehJi7x06
	yiZ5rfg==
X-Google-Smtp-Source: AGHT+IG53Q37Cbg6GKpGX8bnk+oip0mRmktvRJ3fzpUO5V31LvFWcQ782pMmplhgZGooijPN1psdQ9C8TNs=
X-Received: from plxx10.prod.google.com ([2002:a17:902:e04a:b0:290:28e2:ce4b])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c408:b0:295:592f:9498
 with SMTP id d9443c01a7336-295592f9523mr100140935ad.44.1762147495837; Sun, 02
 Nov 2025 21:24:55 -0800 (PST)
Date: Mon,  3 Nov 2025 05:24:50 +0000
In-Reply-To: <20251103052450.1028813-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103052450.1028813-1-badhri@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103052450.1028813-2-badhri@google.com>
Subject: [PATCH v2 1/1] tcpm: Wraparound tcpm log and dont clear them when read
From: Badhri Jagan Sridharan <badhri@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com
Cc: amitsd@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

TCPM log do not wraparound by default and gets cleared when read.
This results in logs overflowing over time and the recent logs
containing relevant context to debug get dropped. Change this behavior
to wraparound the log by default and do not clear the log when dumped.

Adding the Kconfig option, TCPM_LOG_DISABLE_WRAPAROUND,
to disable wrap around and clear the log when read. Also adding a
a debugfs file node, tcpm_log_disable_wraparound, to switch between
the two during run time.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Kyle Tso <kyletso@google.com>
Reviewed-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes since v1:
* Make wrapping around when full as the default behavior.
* Added a Kconfig and a debugfs node option to switch between the two
  behaviors.
---
 drivers/usb/typec/tcpm/Kconfig |  8 ++++++
 drivers/usb/typec/tcpm/tcpm.c  | 51 ++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 8cdd84ca5d6f..4bb69f66c7bb 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -11,6 +11,14 @@ config TYPEC_TCPM
 
 if TYPEC_TCPM
 
+config TCPM_LOG_DISABLE_WRAPAROUND
+	bool "Disable TCPM log wraparound"
+	depends on DEBUG_FS
+	help
+	  When set, TCPM log do not wraparound and clears when dumped.
+	  When not set(i.e. default), TCPM log wraps around when full and do
+	  not clear when dumped.
+
 config TYPEC_TCPCI
 	tristate "Type-C Port Controller Interface driver"
 	depends on I2C
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4ca2746ce16b..2df21e5b5dff 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -591,6 +591,7 @@ struct tcpm_port {
 	int logbuffer_head;
 	int logbuffer_tail;
 	u8 *logbuffer[LOG_BUFFER_ENTRIES];
+	bool log_disable_wraparound;
 #endif
 };
 
@@ -723,7 +724,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
 
 	vsnprintf(tmpbuffer, sizeof(tmpbuffer), fmt, args);
 
-	if (tcpm_log_full(port)) {
+	if (port->log_disable_wraparound && tcpm_log_full(port)) {
 		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
 		strcpy(tmpbuffer, "overflow");
 	}
@@ -748,6 +749,10 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
 		  tmpbuffer);
 	port->logbuffer_head = (port->logbuffer_head + 1) % LOG_BUFFER_ENTRIES;
 
+	if (!port->log_disable_wraparound && port->logbuffer_head ==
+	    port->logbuffer_tail)
+		port->logbuffer_tail =
+			(port->logbuffer_tail + 1) % LOG_BUFFER_ENTRIES;
 abort:
 	mutex_unlock(&port->logbuffer_lock);
 }
@@ -863,7 +868,7 @@ static int tcpm_debug_show(struct seq_file *s, void *v)
 		seq_printf(s, "%s\n", port->logbuffer[tail]);
 		tail = (tail + 1) % LOG_BUFFER_ENTRIES;
 	}
-	if (!seq_has_overflowed(s))
+	if (port->log_disable_wraparound && !seq_has_overflowed(s))
 		port->logbuffer_tail = tail;
 	mutex_unlock(&port->logbuffer_lock);
 
@@ -871,15 +876,57 @@ static int tcpm_debug_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(tcpm_debug);
 
+static int tcpm_log_disable_wraparound_show(struct seq_file *s, void *v)
+{
+	struct tcpm_port *port = s->private;
+
+	mutex_lock(&port->logbuffer_lock);
+	seq_printf(s, "%d\n", port->log_disable_wraparound ? 1 : 0);
+	mutex_unlock(&port->logbuffer_lock);
+
+	return 0;
+}
+
+static ssize_t tcpm_log_disable_wraparound_write(struct file *file,
+						 const char __user *user_buf,
+						 size_t count, loff_t *ppos)
+{
+	struct seq_file *seq_f = file->private_data;
+	bool log_disable_wraparound;
+	struct tcpm_port *port;
+	int err;
+
+	port = seq_f->private;
+	err = kstrtobool_from_user(user_buf, count, &log_disable_wraparound);
+	if (err)
+		return err;
+
+	mutex_lock(&port->logbuffer_lock);
+	if (port->log_disable_wraparound == log_disable_wraparound)
+		goto exit;
+
+	port->logbuffer_tail = port->logbuffer_head;
+	port->log_disable_wraparound = log_disable_wraparound;
+exit:
+	mutex_unlock(&port->logbuffer_lock);
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(tcpm_log_disable_wraparound);
+
 static void tcpm_debugfs_init(struct tcpm_port *port)
 {
 	char name[NAME_MAX];
 
 	mutex_init(&port->logbuffer_lock);
+	port->log_disable_wraparound =
+		IS_ENABLED(CONFIG_TCPM_LOG_DISABLE_WRAPAROUND);
 	snprintf(name, NAME_MAX, "tcpm-%s", dev_name(port->dev));
 	port->dentry = debugfs_create_dir(name, usb_debug_root);
 	debugfs_create_file("log", S_IFREG | 0444, port->dentry, port,
 			    &tcpm_debug_fops);
+	debugfs_create_file("tcpm_log_disable_wraparound", 0644, port->dentry,
+			    port, &tcpm_log_disable_wraparound_fops);
 }
 
 static void tcpm_debugfs_exit(struct tcpm_port *port)
-- 
2.51.1.930.gacf6e81ea2-goog


