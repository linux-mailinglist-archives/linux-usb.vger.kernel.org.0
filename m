Return-Path: <linux-usb+bounces-3137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CC7F3776
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84F99B21B83
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573D75578C;
	Tue, 21 Nov 2023 20:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCCR6+pb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EB71FF1
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:29:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so179512e87.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700598569; x=1701203369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6pUSylQ57QDAnOYu4uoAZWK5eAYHbB7ZTMJQDUS70M=;
        b=fCCR6+pbo1xyY31e4mJ4cQXLs2L4HGXuHsCeD8RpJ4hj4cwx1nXW4hRhytYk81PBda
         wfmGjdEilXAxS699atHxZIdWrI5R9sVkCOwQR1OrBdPFeFG+h6i7R1bJipwEl7VfJ94D
         YTFykVcMwgeGntOEeCSW0Ktil4bI0i0o4PCYJz2hOpv36I+JVbro64MVO2Gf2E1+chth
         rNf+Ri48jKkc+dfkZQL/JRg1wvo8meRfxNmEsig0u5h6OPs0DLUC164A7au+KP/3sZ1X
         D9H8i07ZhFb5uGbRkM06vTp0MyEeBrW4pzBmr8DmFwSWUooIynKUnfZTzPNsRzGcEEUd
         5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598569; x=1701203369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6pUSylQ57QDAnOYu4uoAZWK5eAYHbB7ZTMJQDUS70M=;
        b=hjG87+VHtf0n5UaHep1SBo6Eq008QStEHr2EeLbD2z7FhugUhre464pHAGU3CO57A3
         8RSthw8c+7StUTzh+Jacuy/s25/l79t4zLsvle9eZaIh8Rs69TkrXd81KUojxuFcSWzE
         BHYz0A0kMTxwejR8H21DVsqo/4BcpOVoDZ7RmUO0j8vYcZ+PJjIYCsJykjJk2dmInpJ5
         utT1dz/rFIRNZ951CY04RO0kDpSUVgYg+juYa/BzgiqRo0QVvakgr34/1S3Vvuuym1Lq
         Mwa+jjrOuVWY75JQ+e+b7G34u66wc01CvoTRRa95k3TsZQt8UjK7y53c+1akREzZtZkn
         kWuw==
X-Gm-Message-State: AOJu0Yzm+Vwntz7z5LkYD//yI/tTU8b5jtaQSZAs4Z2eHRRPb4OiLWlI
	Gro6Ph6NPoux76qfgOg0CZfjzg==
X-Google-Smtp-Source: AGHT+IH0jTRQM5w+kYWIMAHKUNTpVDgqlCy01ePT/kCx57Ft4PfLmDfBxK5KunZbk5hReZpNqqabLA==
X-Received: by 2002:a05:6512:3708:b0:50a:6fb8:a0c0 with SMTP id z8-20020a056512370800b0050a6fb8a0c0mr114755lfr.19.1700598568810;
        Tue, 21 Nov 2023 12:29:28 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ab6112af2sm286287lfs.65.2023.11.21.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:29:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: tcpm: Parse Accessory Mode information
Date: Tue, 21 Nov 2023 22:27:00 +0200
Message-ID: <20231121202925.2481471-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..ba2926846269 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6114,6 +6114,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 {
 	const char *opmode_str;
 	int ret;
+	int mode;
 	u32 mw, frs_current;
 
 	if (!fwnode)
@@ -6132,6 +6133,14 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
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
2.42.0


