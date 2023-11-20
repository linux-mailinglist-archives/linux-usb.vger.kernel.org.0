Return-Path: <linux-usb+bounces-3056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D437F20B4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065D91C20FCD
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86BC3AC0D;
	Mon, 20 Nov 2023 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgESDd+1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D0510C
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 14:49:24 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507adc3381cso6394009e87.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 14:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520563; x=1701125363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8esms7qjDsIwHkmFPq5izCGww9P1bMAldhJOLTVxrVo=;
        b=WgESDd+1HNeprrMOVztoWh8lTIrh7SUDPLUEIENJlpvrcTBmvQS+zDUU4rTB7gA8fS
         fCUign0iYqVb1MPuzCU/UXi0IG83wkDBkDJqq3dDBvaJtmLDwO6X0Yb5p+aEK0hYlOST
         NLJguGfgISiDE/uWI8Zw7vhOuedrN8F1oVCCL3KSdbt8Z7y/8aP6mONrvp4jbj48d/Oy
         13oMWwNH5hKhobU8yAHgzdUxzN6KzUHnIeM5C4HZlOCzjXtpZZHRVF3WrFpLTAs7GHpz
         YiG+IG+BukIk1vRIcNAbaWuXOVqgO3poStTzV1da8Pi3S+IhM2pbg3iefPIbFWvPH2md
         YqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520563; x=1701125363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8esms7qjDsIwHkmFPq5izCGww9P1bMAldhJOLTVxrVo=;
        b=iKwbcBbiHAYIZL74q1BSTxIpQU8Tb6f59GjNGWy6KSabJ7b/HpxQ5RUKLGI54BJW48
         O0Z72phWdoSuOcbqlxSDY9U0VC/zigJ2Qm0fEDMEzeK8Pk51vNCx7i8y+kqKHZ9m+OG0
         XbQ20+C5IEYhQj5hu9YbXErsGYjufxnzYiwMuik7tjveTqXd06HBgl8kXVGKyEVji7oE
         SZOvMvenY6tylBX5Ou0m7JM0gq8r+3mKpMfRTA/GNz75VPpnF3lemJwQRx/3RiYOUmOq
         A8J2hozqyBFkd55ZO2q8LvLrUh4FVH+VC/f/ykP463IjROYC3Wl7ghQll+lty2Y6tlgz
         AjCA==
X-Gm-Message-State: AOJu0YzYfIyKsXVvZxPBK4+0EXFhrm050NWZlmPH91WPVMdXQwkmi8uY
	rDzF217QIL5zcB5o0nYq7U25XA==
X-Google-Smtp-Source: AGHT+IFSlei+njl+21Vg/SeVwhKhBCNtO5ycJO62MX4mCxIWXcMcNVTMVgx9fUPcaQOpdGDSgNXKtw==
X-Received: by 2002:a05:6512:41e:b0:509:31e6:1de5 with SMTP id u30-20020a056512041e00b0050931e61de5mr5826985lfk.47.1700520563147;
        Mon, 20 Nov 2023 14:49:23 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:22 -0800 (PST)
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
Subject: [PATCH v3 2/3] usb: typec: change altmode SVID to u16 entry
Date: Tue, 21 Nov 2023 00:00:19 +0200
Message-ID: <20231120224919.2293730-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
References: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in the changelog for the commit 7b458a4c5d73 ("usb: typec: Add
typec_port_register_altmodes()"), the code should be adjusted according
to the AltMode bindings. As the SVID is 16 bits wide (according to the
USB PD Spec), use fwnode_property_read_u16() to read it.

Acked-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/platform/x86/intel/chtwc_int33fe.c | 2 +-
 drivers/usb/typec/class.c                  | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
index 848baecc1bb0..93f75ba1dafd 100644
--- a/drivers/platform/x86/intel/chtwc_int33fe.c
+++ b/drivers/platform/x86/intel/chtwc_int33fe.c
@@ -136,7 +136,7 @@ static const struct software_node altmodes_node = {
 };
 
 static const struct property_entry dp_altmode_properties[] = {
-	PROPERTY_ENTRY_U32("svid", 0xff01),
+	PROPERTY_ENTRY_U16("svid", 0xff01),
 	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
 	{ }
 };
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 6ec2a94e6fad..4251d44137b6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2238,7 +2238,8 @@ void typec_port_register_altmodes(struct typec_port *port,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *alt;
 	size_t index = 0;
-	u32 svid, vdo;
+	u16 svid;
+	u32 vdo;
 	int ret;
 
 	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
@@ -2246,7 +2247,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 		return; /* No altmodes specified */
 
 	fwnode_for_each_child_node(altmodes_node, child) {
-		ret = fwnode_property_read_u32(child, "svid", &svid);
+		ret = fwnode_property_read_u16(child, "svid", &svid);
 		if (ret) {
 			dev_err(&port->dev, "Error reading svid for altmode %s\n",
 				fwnode_get_name(child));
-- 
2.42.0


