Return-Path: <linux-usb+bounces-2826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C263D7E9F49
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87284280E4A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBCA2134A;
	Mon, 13 Nov 2023 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lv0+zchx"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07AA21349
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:53:35 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8420F172D
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:33 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso4976927e87.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699887212; x=1700492012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xhUueshKstjuF7T+PvYpgtmmmU0JX7LuXbXVkaBcbA=;
        b=lv0+zchxhNZqoGbBL9qahOnzuJ6h1gAwvKdLpdmFteRWRjg8SklqeMj8Ud+8DQu9HF
         fybXoYo7EDvBicjSS6t4a1X15LyM/+OQw8D3SCWi5rCYXRkVaMmSJcyFq2NIrRU0Cy+A
         dqYe1Dd+cpwJ0mWs71JQpyTkS52sZMTHXt7kGaLEl9v/5xc3jpNfatdW50fTy/OO6H5p
         /HI58O7yX91hoNEQ4tCVXIIuxL2ezXR8vA9pDr0xtg5pM0tL+Sq7ohFV88nCGVPwSW+f
         hUdPMNYSsOBcziazi242A3V32xVMDVAxTWof44xChmeDja2Qrwdwli2x/TkdRTY/yhAV
         rAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887212; x=1700492012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xhUueshKstjuF7T+PvYpgtmmmU0JX7LuXbXVkaBcbA=;
        b=kjONhVJCM9Ai+x/PQrmMmjsAD3dxFQqhQcXKdPow6ppESB5df9qHN5n5/G4ApDKRM3
         OUxLsRS+PAVC+CEKMbVPZ8a7B0NPKqeWy6XVNRiRwrQPZgV7Y3AT+3Rt82YJwtAhAyaS
         8vTvo//A3k9PDH2MrSuHdHjFeULQu6h5p27AvBjRJxlwIqzHeWQAOGNBdClTv8lQhUDL
         Z06KI59Sp2u2rnU4ETLz5uLx83cB5Vyw6sTV+IBEjCQSfaFIYcrKCOMEE8C61UOXKAwC
         +vPpolNi0KQDZdHxsHA49msheAnyOEaILESYGU19/9HziJ9R/H8Hpz5WTGkdloUM6pSa
         B+/A==
X-Gm-Message-State: AOJu0Ywj+fVuDjn1AqUVxY/9bGvxbA5FRIs73bFqaj4snCjJrklv0Zi/
	Pmox5UidAWsA/qAHWsZkt8SYwg==
X-Google-Smtp-Source: AGHT+IFjbTelwXsX6I7IEtJnCOEXdhWdUITLUYWGVGg27FEvoMIr9jUiUXGIawMQ2APipbh2OsIqHA==
X-Received: by 2002:a05:6512:388f:b0:503:778:9ad2 with SMTP id n15-20020a056512388f00b0050307789ad2mr4273107lft.19.1699887211871;
        Mon, 13 Nov 2023 06:53:31 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050794b05c8asm991429lfc.42.2023.11.13.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:53:31 -0800 (PST)
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
Subject: [PATCH 2/3] usb: typec: change altmode SVID to u16 entry
Date: Mon, 13 Nov 2023 16:33:08 +0200
Message-ID: <20231113145328.42575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
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


