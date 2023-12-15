Return-Path: <linux-usb+bounces-4219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A0814EDA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 18:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21AE6B24452
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 17:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB31641858;
	Fri, 15 Dec 2023 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zAyVNbdv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF03FE5F
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50dfac6c0beso1098789e87.2
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 09:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702661412; x=1703266212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuB7T2TvtfzYulUsGwmzST1mtpoBCzmPcfLxjPTBXtc=;
        b=zAyVNbdvNydDUSfny5TzGH4PvLNXQceE35qqEdkDjkVuDQUT8VrkhAzm7nUbWKbxUl
         NUOGyeLDYLjnwREBzGIPznThTo2WfbOJwmSV1owRe08ywgXunqI6DCaRLgu1HcJjBPGJ
         J0/0RhUcNp0OO3GYWkPdPKoQ2CLQrqE0mlqE70hg3JUbHsYhUSgXnlYifslOCbh2ljFd
         Obl631QU9IHt1oBHKS54dfkVx8ResyoF2dIhomXzh4ueAed7cj/pBmgDRuuJH0I+5jMH
         LCFnmQKc+o4kzm+UchpdGAjopBsTb0JTVm2LB7emDXmNPCSI9XMQVv4i6hHoc4tkYChE
         LCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661412; x=1703266212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuB7T2TvtfzYulUsGwmzST1mtpoBCzmPcfLxjPTBXtc=;
        b=Ko0leaKrcajemQempwgC5CVpke/pUkM4PyJQQJZlYpqa6ege4gtkxJO/v/iCs8ysnw
         Ysy2YFON8NcUmylHON91KD/cN6Mq8VQ87CwN+eLvEpbtU2a1VCL1Chb2z3/TaAt7XX9O
         S3vA7D//bi7jSQwni2xIJ1MPEB5YuOdCFCyeu2Ba6vApbb+RjWqW9zpcsIQ33pIIeW7P
         5DsDDY4Msmf66Z8r5AGryjQySwRI+cCXLerCitCUDoNcTStv7CaWxjly1dFkb4qXFjLo
         /kVPbtXtDDDRaMpnM5BsvxgZ6u+KHn8/CdkJuJq4Fi+eXtWIgbxe5FR40uldZh2Kd7b0
         YJ1A==
X-Gm-Message-State: AOJu0YxA8eYsMImllf0rNCYfwgXUAqxPFBGCyMC97RzlK+XTJyvIp0SO
	4gbtguOBziHpHI1QvPe5KGVuVA==
X-Google-Smtp-Source: AGHT+IEPLjpVgNbe9nBxVwGSFSX9zn7rmswGw82ggEzdpfzFloeg6DJ2uf7unFMM0hO/T0qrCNwzPA==
X-Received: by 2002:a05:6512:1188:b0:50d:1a16:e89 with SMTP id g8-20020a056512118800b0050d1a160e89mr8338568lfr.36.1702661412574;
        Fri, 15 Dec 2023 09:30:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id g8-20020a056512118800b0050bf54b9f18sm2202274lfr.113.2023.12.15.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:30:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v2 2/2] usb: typec: tcpm: Parse Accessory Mode information
Date: Fri, 15 Dec 2023 19:30:05 +0200
Message-ID: <20231215173005.313422-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215173005.313422-1-dmitry.baryshkov@linaro.org>
References: <20231215173005.313422-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the boards supported by the TCPM drivers can support USB-C
Accessory Modes (Analog Audio, Debug). Parse information about supported
modes from the device tree.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8372f98de757..cf70f1cf2f61 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6144,6 +6144,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 {
 	const char *opmode_str;
 	int ret;
+	int mode;
 	u32 mw, frs_current;
 
 	if (!fwnode)
@@ -6162,6 +6163,14 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	if (ret < 0)
 		return ret;
 
+	mode = 0;
+
+	if (fwnode_property_read_bool(fwnode, "accessory-mode-audio"))
+		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_AUDIO;
+
+	if (fwnode_property_read_bool(fwnode, "accessory-mode-debug"))
+		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_DEBUG;
+
 	port->port_type = port->typec_caps.type;
 	port->pd_supported = !fwnode_property_read_bool(fwnode, "pd-disable");
 
-- 
2.43.0


