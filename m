Return-Path: <linux-usb+bounces-2851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C397EA5DA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 23:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42B81C208E1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 22:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2A83B282;
	Mon, 13 Nov 2023 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3fUERUe"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151442E62F
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 22:15:34 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB081715
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:15:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso7299820e87.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699913731; x=1700518531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBpcWEbnLvBhiTJXnEVisEI+IX+1EldtrM+V5goA5pE=;
        b=C3fUERUe051TpKigfOA1CLAL8o0/6V4MvehicDZ/xRQGY4AMAtsnKA0tqa4zbAj2ST
         OGq/3Ev7Q8yove2G4kp2rSTHqy5iei71niSaAr6LkENIUSm9ntxKLDKjR67+vr6PFz7z
         DYq4nftOEgmsUdCzjth0Bb6OfGRtd6QZtoPCk8PNbDEw7DgMrNz9xHjpzJdLZuG5ZPoM
         fHge0EoI6jR3P2oPn7VKtHUVtwSBu5P0YozIfwIiVin/xmgJ0Jr2Gkk6lH06C/2iZva1
         9RNz5U8GREVOwTl8V385xx7s8CNeziisE7U1C4Jf7s9y+VO1E1RHJPvOO2RHQgDIG89N
         2OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913731; x=1700518531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBpcWEbnLvBhiTJXnEVisEI+IX+1EldtrM+V5goA5pE=;
        b=mVwt7VFKNiJh9oOpzQYVdRLMRA3F0n21O/n1LPXzbjrpeiR9RnMmAjiEob6k66AkO+
         8ctPQ0JNp164oUXDUoL70O+0w12x8VWkMWqvNDVGx5pjSo6zcaqpx3yneMUEAT+l03EH
         8zfU9ih57wzJZchkGJDwwO6AUJ0PzNXzYQ09cdlPZhcohwKorfLQL3PnM01KQ1TzR8yq
         uF2qAShEoutkh+oVC/31U/Te2P66QmDuiJIhf/BiqkwMOnsOvduHaghbA8Lb8gaoMZll
         En5VVSXCvS9hHMlcr1GLtBxz7oqt+PT+qM8mDwh9VhmrqLMo1IMpox7NIy3jrO2cHXWw
         sD3w==
X-Gm-Message-State: AOJu0YzxcTt44Qnrxt6ItPrVD3/+wdnWl1G2LxyEoLITUwGuuD8wrUv7
	SkpfKa7bQ1WUPRvjzOz/HGyKZw==
X-Google-Smtp-Source: AGHT+IHQbV5ZIba5W01SlsPywbGGgoTu+lpQzTg0BrFlbBULoEcH9FtrHnaOQ4FVIbIgR8tMUcsxNQ==
X-Received: by 2002:a05:6512:291:b0:500:d970:6541 with SMTP id j17-20020a056512029100b00500d9706541mr4969377lfp.39.1699913731320;
        Mon, 13 Nov 2023 14:15:31 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a0565120b0800b00507f18af7e0sm1097578lfu.4.2023.11.13.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 14:15:30 -0800 (PST)
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
Subject: [PATCH v2 2/3] usb: typec: change altmode SVID to u16 entry
Date: Tue, 14 Nov 2023 00:13:28 +0200
Message-ID: <20231113221528.749481-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
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


