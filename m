Return-Path: <linux-usb+bounces-14586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767896A458
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3131C23F09
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3B61420DD;
	Tue,  3 Sep 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2W1eHW8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42E18BB98
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381045; cv=none; b=e2yu3NTWCxKR15fGZwg2QhUXT4mFFIPx0CGqiijIUFRfD+HYrrC4qxxgMWNTVpQ7ajpTka8uh6xNX97B5Wn6s0xLp3KEIkqCbGKiMQdi6UG3YFYdKdxr67JuqZhlgSmfUz50V7WSVkIcAnJq841gzz4oRfyMsgx+ydWI2A5ai10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381045; c=relaxed/simple;
	bh=TsmOE9Ka/cnWkIMlbMKgGfPc39w+hTp4h9HPdq+aFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQBJsToygmXz4sv+/de9xNO/BWQOCyA8Bxss/QNUmmA2J3NgVAXJUjUrEmAreecZ9ryVvKzM/MebjLRKpom7U6WeCgOiKtQC553KNdkF4adliNUyXCCejIFnaNGudki5ELErQ8ogMd3sMiFLVIVdl/xmubKOXdazxk4y2fNgB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2W1eHW8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a83597ce5beso886882766b.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381042; x=1725985842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtMD3IMlTRzDoSIZAH1mJmZO2t72h7tff8Sou3zt11w=;
        b=G2W1eHW8Fzh3vBgb3ZywWof6DiqsGGVvnmJdLIwdn+R91P5GvbxTzH0IBM4vP6UPAC
         YrEVFJZMukbcLUVwfVlZyPW5TRDP6EBR1nmZjOu/lrOZrZ8eYdbqY8ptE/yiSykvqwx2
         YB8iEbC3cYwLhFEYj1Nb8DqGAwDS5QGiYp2NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381042; x=1725985842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtMD3IMlTRzDoSIZAH1mJmZO2t72h7tff8Sou3zt11w=;
        b=m+x95UOvbGkTCbrGA2dQzzmpWsMjnOSt/2f+btv4FUzQywc4chEfcJ3fdxyIxg/j5F
         U4r1PV/I9jQl+SY2brgL/ldlTy6f6tBKwpQmBASQU/tnb7Bl88rDhf0rw16v+zhjHF1i
         tcmTxGD2uqhKXQZFzwwmzWVg/HyckG99psUlyHYl650VIAIB1yOVvfFOFgyUerV9imkx
         s+0c2XzhUUfBdayFOdSusHSK9D6rdRmsXwVYylDBM6q7ofLttVfnry72Wd4MvV3z3SRI
         vf6kxYo0E1+orzWI/rcsTQzrGJtGp7XMlGNHIrszh+OgC6NHtvfXyyrxLa38VmGdSRAE
         Sdrg==
X-Forwarded-Encrypted: i=1; AJvYcCWM1fG8qExwAxR96V1f3zYKBBqKRXWg8MKYDhW1klXTYwqv9lT6sM+FS88H/V50IRa6/BW+rA5dtfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoclTFvOEst8fZSOefVYMSNi/1DmNoPnaBDAkuuaGeUb60y1Aa
	hursjYbT0Jc/Jr2StR+NGR3igRSe21GPBbkoZCicaCvEid1ewfX7uA8z22Q2
X-Google-Smtp-Source: AGHT+IEpNCPxVCdSEzTX2L1luDog7Pdct+Z7ieU4407jTg3v6KUKlvKALbxBkKJpVDEajJiHx9Lcww==
X-Received: by 2002:a17:907:1ca4:b0:a86:84c3:a87 with SMTP id a640c23a62f3a-a89827a9635mr1883312666b.24.1725381041877;
        Tue, 03 Sep 2024 09:30:41 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:41 -0700 (PDT)
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
Subject: [PATCH v5 5/8] usb: typec: cros_ec_ucsi: Add trace events
Date: Tue,  3 Sep 2024 16:30:30 +0000
Message-ID: <20240903163033.3170815-6-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
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
index 4a3369c649bf..6e020b7ed352 100644
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
 
@@ -101,6 +105,8 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
 		return ret;
 	}
+
+	trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
 	return 0;
 }
 
@@ -143,6 +149,8 @@ static void cros_ucsi_work(struct work_struct *work)
 	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
 	u32 cci;
 
+	trace_cros_ec_ppm_to_opm(0);
+
 	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci)))
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
2.46.0.469.g59c65b2a67-goog


