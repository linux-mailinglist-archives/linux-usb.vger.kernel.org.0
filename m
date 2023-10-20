Return-Path: <linux-usb+bounces-1965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2F7D0BE3
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 11:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3306282495
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4695812E7F;
	Fri, 20 Oct 2023 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FYeQJxTo"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036112E70
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 09:33:39 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9481710D3
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 02:33:27 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9c75ceea588so91203666b.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697794403; x=1698399203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HAqgphO8/nmhxveYYWq+PwS2fkw9vCkjtGCsYcP8DE=;
        b=FYeQJxToEaN56qaSjTi3xRkXXFxyQCFqoO9YHmFtdDCoeL1iwFeClkv8LCZPlFhEzQ
         Laj94aMaSp0ObpaFepN5IsHCkBJAlI0nxiUe62fgR/ahMYbMyT1ThaSnjKFtFPJrzjBE
         OaInWd+rCFYFqYGkoHNJ7QWmsR1x1Wgp1rVHZJa0vo9KemFrDJcx4jx1bAnIbd3dMAXH
         ekqHIp/GF/zWBeyvolfi2OK70RWRAtnSs/OWgvdAjLp54PlPuktGNmLoAAWNcVIQuHBO
         HlRwv3kfTSY7L/C4/iBbKoWKDAqBWySmUTSdK5KVyRTtZnNtG3bka/2Z+CRIm57pQ0vG
         HCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794403; x=1698399203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HAqgphO8/nmhxveYYWq+PwS2fkw9vCkjtGCsYcP8DE=;
        b=AXJkZWnBrJToQhNeqHUcWm6IBI2gceIDhCHsYqBw1MZ9lfhPsqpU0XoIzrZkFdLLG5
         yl690SDmxY+TM064szZHJJiMqOpiDHXSdtatNJLuKg8nUKYTRZohD+fkH472/igh4oU6
         uYrDH8QJm50p2mI21MOUTMfvUYV43JYeLhv2kUVNFePVO3QBDPTcTb2WEObdLmv0Rr+k
         OzL01Hyak3UFxcNxYcHsvtWOuFoS0xYi/n+D5ldM9c2wNMd2mCLj55GlY1p8fGZDCa9s
         8XBsYmwZfsHRYjjbOIBFqGYv2I5SR3CAByDRgAzKnjp3ny9h0a1hU8QrQNYOpiq98pyC
         LLkA==
X-Gm-Message-State: AOJu0YzYQPMhlAaDJ3dnRSiZpZFajiiLq/S6znLGcxSlbxlJLjBV9Hor
	5lOFGBT+RO9AJXpoiDiNdGTl4A==
X-Google-Smtp-Source: AGHT+IFP1JXUdkDGNVp03jbl+ZSC03News4HiarnwyTD2JABp9j7F8z4tTvDzgffGBOsPBTwQNK6FA==
X-Received: by 2002:a17:907:9724:b0:9bd:f3b0:c087 with SMTP id jg36-20020a170907972400b009bdf3b0c087mr922647ejc.2.1697794403304;
        Fri, 20 Oct 2023 02:33:23 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709066bcf00b009a13fdc139fsm1102535ejs.183.2023.10.20.02.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:33:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Oct 2023 11:33:19 +0200
Subject: [PATCH v2 2/3] usb: typec: fsa4480: Add support to swap SBU
 orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-fsa4480-swap-v2-2-9a7f9bb59873@fairphone.com>
References: <20231020-fsa4480-swap-v2-0-9a7f9bb59873@fairphone.com>
In-Reply-To: <20231020-fsa4480-swap-v2-0-9a7f9bb59873@fairphone.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3

On some hardware designs the AUX+/- lanes are connected reversed to
SBU1/2 compared to the expected design by FSA4480.

Made more complicated, the otherwise compatible Orient-Chip OCP96011
expects the lanes to be connected reversed compared to FSA4480.

* FSA4480 block diagram shows AUX+ connected to SBU2 and AUX- to SBU1.
* OCP96011 block diagram shows AUX+ connected to SBU1 and AUX- to SBU2.

So if OCP96011 is used as drop-in for FSA4480 then the orientation
handling in the driver needs to be reversed to match the expectation of
the OCP96011 hardware.

Support parsing the data-lanes parameter in the endpoint node to swap
this in the driver.

The parse_data_lanes_mapping function is mostly taken from nb7vpq904m.c.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/usb/typec/mux/fsa4480.c | 71 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index e0ee1f621abb..cb7cdf90cb0a 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -60,6 +60,7 @@ struct fsa4480 {
 	unsigned int svid;
 
 	u8 cur_enable;
+	bool swap_sbu_lanes;
 };
 
 static const struct regmap_config fsa4480_regmap_config = {
@@ -76,6 +77,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
 	u8 enable = FSA4480_ENABLE_DEVICE;
 	u8 sel = 0;
 
+	if (fsa->swap_sbu_lanes)
+		reverse = !reverse;
+
 	/* USB Mode */
 	if (fsa->mode < TYPEC_STATE_MODAL ||
 	    (!fsa->svid && (fsa->mode == TYPEC_MODE_USB2 ||
@@ -179,12 +183,75 @@ static int fsa4480_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *st
 	return ret;
 }
 
+enum {
+	NORMAL_LANE_MAPPING,
+	INVERT_LANE_MAPPING,
+};
+
+#define DATA_LANES_COUNT	2
+
+static const int supported_data_lane_mapping[][DATA_LANES_COUNT] = {
+	[NORMAL_LANE_MAPPING] = { 0, 1 },
+	[INVERT_LANE_MAPPING] = { 1, 0 },
+};
+
+static int fsa4480_parse_data_lanes_mapping(struct fsa4480 *fsa)
+{
+	struct fwnode_handle *ep;
+	u32 data_lanes[DATA_LANES_COUNT];
+	int ret, i, j;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&fsa->client->dev), NULL);
+	if (!ep)
+		return 0;
+
+	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes, DATA_LANES_COUNT);
+	if (ret == -EINVAL)
+		/* Property isn't here, consider default mapping */
+		goto out_done;
+	if (ret) {
+		dev_err(&fsa->client->dev, "invalid data-lanes property: %d\n", ret);
+		goto out_error;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
+		for (j = 0; j < DATA_LANES_COUNT; j++) {
+			if (data_lanes[j] != supported_data_lane_mapping[i][j])
+				break;
+		}
+
+		if (j == DATA_LANES_COUNT)
+			break;
+	}
+
+	switch (i) {
+	case NORMAL_LANE_MAPPING:
+		break;
+	case INVERT_LANE_MAPPING:
+		fsa->swap_sbu_lanes = true;
+		break;
+	default:
+		dev_err(&fsa->client->dev, "invalid data-lanes mapping\n");
+		ret = -EINVAL;
+		goto out_error;
+	}
+
+out_done:
+	ret = 0;
+
+out_error:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
 static int fsa4480_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct typec_switch_desc sw_desc = { };
 	struct typec_mux_desc mux_desc = { };
 	struct fsa4480 *fsa;
+	int ret;
 
 	fsa = devm_kzalloc(dev, sizeof(*fsa), GFP_KERNEL);
 	if (!fsa)
@@ -193,6 +260,10 @@ static int fsa4480_probe(struct i2c_client *client)
 	fsa->client = client;
 	mutex_init(&fsa->lock);
 
+	ret = fsa4480_parse_data_lanes_mapping(fsa);
+	if (ret)
+		return ret;
+
 	fsa->regmap = devm_regmap_init_i2c(client, &fsa4480_regmap_config);
 	if (IS_ERR(fsa->regmap))
 		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");

-- 
2.42.0


