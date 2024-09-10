Return-Path: <linux-usb+bounces-14893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7497325F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41468B2B7A2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992C319ABB7;
	Tue, 10 Sep 2024 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bjKQWGY+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9D191F7C
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963346; cv=none; b=LCGTQjsDK/b3d3kzUy4xVQ+ERWuB1ifMCqxL32pbp0BdDjBVy/GD8ZFoEiFq3qs28xzCDehJdjJcYQeI/PGv1q8qXUqhjuCRAgbXzI0sNCEUmKdiK+8ngmp9mQm55dERqaX5hTb/Uj3Xc0AS6BM1uCZPyDOPcBb5vrd+CzeYxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963346; c=relaxed/simple;
	bh=DL0ES7GQTcBR+O0ekDUc5sXgU65md8CXp2+82FUPG+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6H/OS0BJojUrDETEMkacruMoxfatcPaDOB4XjxgqBdh3shfdk2R305avSoCIwjBvxLio4vt5uh0G/QcQinYcd4eNTxBOu+hxINP14VPj2WyKuQ8ACSf2GUtwCTZjMXzmfTJamW4ddOAxAkqH2ozTt1kCyoaQr10lK3xR+LzZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bjKQWGY+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c3d8d3ebbdso1301882a12.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963343; x=1726568143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mV7s2/c0ENI+DAgLmXgDu7uFl4rCLD3wDrwUZ7SKho=;
        b=bjKQWGY+svT9sqAySlg6d6iHHZ3VrPtp9IEOagDvK0Nf6mdsagh8azrfivHtg+SgpU
         LZRJQnP+sAsutXzsMEIebywNnVJaOmtsrtGN4aOhfHUYvcu4fHwF1pQDekNpm/8jOIYr
         YOyWbwWgkklj/xqfdKpkwp4ZC1MVVm90/HqSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963343; x=1726568143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mV7s2/c0ENI+DAgLmXgDu7uFl4rCLD3wDrwUZ7SKho=;
        b=FVoaAJYYaBMedmXY5r/ANjT+fJoJtjTrftz+q63+fedjPdAbxaBXjdHMfq393VgUt8
         tg/Ed8wyLw0PwkLWe6KXRxSGFCbtjEt0uloNRUjeXu/fsgFc/tYRjlHjMhdeHL1zTZ2b
         6VoW97vU+8hXvjPexsOk5IfBD1BLDjIKZTUsQjV9Lu84oppwbuM5xi1ugZHkkXs8O5c5
         zED04qQ8+6yqTWAOU7KDYy+wWQ6DBkgG6qAprd7s/5ha8RyX+7nOH1fw31KGaVLObN9V
         FHEPZqMXwSjFoxOHEy5JmLk5lvOiYGv4+lcGakK+Y6jrM2jFFB3+3tkeDLjkpdteFEn/
         tX8w==
X-Forwarded-Encrypted: i=1; AJvYcCVvjEXdIj+EaS2Jus40PECw5kTjKNSzmLZsyfOcBfeROxQPLrZAWKoiewamEUiqYPwTljdqq3wxRAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIt3+wFlwX9H52MxWT9ZDN29fbMMgKXYdQufaP6L+GYgN7uTY
	oeFIpnoiylMWwmzg7abh9iGoscyXh7hZc5Rdke2efemhtkZ4pNqMRkcKgQpA
X-Google-Smtp-Source: AGHT+IHMlhonJbaZfa1GMj5EzQdDJRpA3hiqFQeMvTdoDzv0sPWqFnTEoc1JUOnwydyVp91uXQ7R0Q==
X-Received: by 2002:a05:6402:4315:b0:5be:d595:5413 with SMTP id 4fb4d7f45d1cf-5c4015ce1b3mr2683973a12.3.1725963341881;
        Tue, 10 Sep 2024 03:15:41 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:40 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 5/8] usb: typec: cros_ec_ucsi: Add trace events
Date: Tue, 10 Sep 2024 10:15:24 +0000
Message-ID: <20240910101527.603452-6-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add trace events to ChromeOS UCSI driver to enable debugging.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 MAINTAINERS                                 |  1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  8 ++
 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h | 92 +++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c030ea0b503..d084f32208f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5306,6 +5306,7 @@ M:	Łukasz Bartosik <ukaszb@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
+F:	drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
 
 CHRONTEL CH7322 CEC DRIVER
 M:	Joe Tessler <jrt@google.com>
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 422b3b14028c..70185616ec86 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -16,7 +16,9 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#define CREATE_TRACE_POINTS
 #include "ucsi.h"
+#include "cros_ec_ucsi_trace.h"
 
 /*
  * Maximum size in bytes of a UCSI message between AP and EC
@@ -62,6 +64,8 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
 		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
 		return ret;
 	}
+
+	trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
 	return 0;
 }
 
@@ -96,6 +100,8 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
 		return ret;
 	}
+
+	trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
 	return 0;
 }
 
@@ -138,6 +144,8 @@ static void cros_ucsi_work(struct work_struct *work)
 	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
 	u32 cci;
 
+	trace_cros_ec_ppm_to_opm(0);
+
 	if (cros_ucsi_read_cci(udata->ucsi, &cci))
 		return;
 
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h b/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
new file mode 100644
index 000000000000..b765ef5c8236
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM cros_ec_ucsi
+
+#if !defined(__CROS_EC_UCSI_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __CROS_EC_UCSI_TRACE_H
+
+#include <linux/tracepoint.h>
+
+#define decode_cmd(cmd)									\
+	__print_symbolic(cmd,								\
+		{ 0,				"Unknown command"		},	\
+		{ UCSI_PPM_RESET,		"PPM_RESET"			},	\
+		{ UCSI_CONNECTOR_RESET,		"CONNECTOR_RESET,"		},	\
+		{ UCSI_ACK_CC_CI,		"ACK_CC_CI"			},	\
+		{ UCSI_SET_NOTIFICATION_ENABLE,	"SET_NOTIFICATION_ENABLE"	},	\
+		{ UCSI_GET_CAPABILITY,		"GET_CAPABILITY"		},	\
+		{ UCSI_GET_CONNECTOR_CAPABILITY, "GET_CONNECTOR_CAPABILITY"	},	\
+		{ UCSI_SET_UOM,			"SET_UOM"			},	\
+		{ UCSI_SET_UOR,			"SET_UOR"			},	\
+		{ UCSI_SET_PDM,			"SET_PDM"			},	\
+		{ UCSI_SET_PDR,			"SET_PDR"			},	\
+		{ UCSI_GET_ALTERNATE_MODES,	"GET_ALTERNATE_MODES"		},	\
+		{ UCSI_GET_CAM_SUPPORTED,	"GET_CAM_SUPPORTED"		},	\
+		{ UCSI_GET_CURRENT_CAM,		"GET_CURRENT_CAM"		},	\
+		{ UCSI_SET_NEW_CAM,		"SET_NEW_CAM"			},	\
+		{ UCSI_GET_PDOS,		"GET_PDOS"			},	\
+		{ UCSI_GET_CABLE_PROPERTY,	"GET_CABLE_PROPERTY"		},	\
+		{ UCSI_GET_CONNECTOR_STATUS,	"GET_CONNECTOR_STATUS"		},	\
+		{ UCSI_GET_ERROR_STATUS,	"GET_ERROR_STATUS"		})
+
+#define decode_offset(offset)					\
+	__print_symbolic(offset,				\
+		{ UCSI_VERSION,		"VER"		},	\
+		{ UCSI_CCI,		"CCI"		},	\
+		{ UCSI_CONTROL,		"CTRL"		},	\
+		{ UCSI_MESSAGE_IN,	"MSG_IN"	},	\
+		{ UCSI_MESSAGE_OUT,	"MSG_OUT"	},	\
+		{ UCSIv2_MESSAGE_OUT,	"MSG_OUTv2"	})
+
+DECLARE_EVENT_CLASS(cros_ec_opm_to_ppm,
+	TP_PROTO(u16 offset, const void *value, size_t length),
+	TP_ARGS(offset, value, length),
+	TP_STRUCT__entry(
+		__field(u8, cmd)
+		__field(u16, offset)
+		__field(size_t, length)
+		__dynamic_array(char, msg, length)
+	),
+	TP_fast_assign(
+		__entry->cmd = *((u64 *) value + 3);
+		__entry->offset = offset;
+		__entry->length = length;
+		memcpy(__get_dynamic_array(msg), value, length);
+	),
+	TP_printk("(%s) %s: %s",
+		decode_offset(__entry->offset),
+		__entry->offset == UCSI_CONTROL ?
+		decode_cmd(__entry->cmd) : "",
+		__print_hex(__get_dynamic_array(msg), __entry->length))
+);
+
+DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_rd,
+	TP_PROTO(u16 offset, const void *value, size_t length),
+	TP_ARGS(offset, value, length)
+);
+
+DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_wr,
+	TP_PROTO(u16 offset, const void *value, size_t length),
+	TP_ARGS(offset, value, length)
+);
+
+TRACE_EVENT(cros_ec_ppm_to_opm,
+	TP_PROTO(int x),
+	TP_ARGS(x),
+	TP_STRUCT__entry(__array(char, x, 0)),
+	TP_fast_assign((void)x),
+	TP_printk("notification%s", "")
+);
+
+#endif /* __CROS_EC_UCSI_TRACE_H */
+
+/* This part must be outside protection */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE cros_ec_ucsi_trace
+
+#include <trace/define_trace.h>
-- 
2.46.0.598.g6f2099f65c-goog


