Return-Path: <linux-usb+bounces-10982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110C8FE745
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 15:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8581C24C93
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BB7196446;
	Thu,  6 Jun 2024 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ge8HCxEn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F224D195F34
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679482; cv=none; b=ZdEtVpAuVSXHfi5//AKDsbKykmq2WY3zlJEAn9l3gZzCqaPbsxHaSPgsnv9l854MBw5fMDcbUT0HicoEVhipxD7BWndWOPurQHiu9uGw+iU1FizCjsi6qoXNLx0IwTpDdQOiqJfbfY2ddMTMqNBZ2inmrysoPNYnp2/fd0AkkmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679482; c=relaxed/simple;
	bh=2D81KA27BBA+iDw6acVjawnZtbTrX1ZuhLRaECsL8os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5YO3G4OnsNW5Cmo/UeGXNNWm/I0NDBd3OJbN2xFrZEuUOLpfHm39YsDIJIGuKRZmdaj5HIOq4mA/Jt3sj8yjTsea0Ifq6TUHump8p/lEzdzwDTyWgoYQNCSRAF0r8gDL/foJqDC3xZs5Pq35OAPAQnsRZ+igDK5YxgRH9/ER3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ge8HCxEn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35e0f4e1821so741417f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679479; x=1718284279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqx6Rfo2v8stZ/0E2QNEl3F7bOYaE7YQtE5TXaL/qnA=;
        b=Ge8HCxEnms1cVYamMIM6BViOOaRhYhP7WvkDo9YGINuLDV0qg/SqXUnKAAxIaL4IBI
         QvAQVTv2Ggm3pKSia7hM1nzUZphY19MX8BuBRtsweNt2rFcM6GmBu14ejDN1JkHOflDC
         8LGnLSkNwNFU7ADzjOhBBfIRuEd5znF8nae0zEO7AoDQoZwuSXwgEQymH4KBGxMlidxa
         xdAJJIcWB8w/l5QhUkOsHAYd/4OlWxyCALgqPkmFKDzSSfIJ+WxB4P6LxCpZP7UZF5Wr
         EoT3+aVislHV8Myj2zVtTmZ0EwqraiCCxafQJEriRv6PKrkE+PEieH3LS354MK+H8oqB
         Vivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679479; x=1718284279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqx6Rfo2v8stZ/0E2QNEl3F7bOYaE7YQtE5TXaL/qnA=;
        b=DyXjaTXvUQtGQwoYaZZycDAdwKgsAVIW8+GYkkb18CwlWCmL0otYPdlD1UGCQxexDz
         D7UnVNllLgJK6ARJQLUJBOcDXlE5xT7jBx+LobN5gjcuUK5Z1NSzMyPBW4xhSH+6RvFs
         TuJexQMJO4BiTgMnj9IUgq9IuiZN7W9DzMC4PVlbnGnhXrFJv0PDr9r/IUPkuksJivOE
         P6O6BQrlTMgYVx4ZBytVpKA65FON9FcpuJakIc8vWw00Dlde/h3oMX8yplWQdoGHuD5G
         +bBRjaS8VgICxPDE6PQL36ak6Xy4y01VL98BmYq4b7ILReiyXSIeLEdbzuiQZikjJ/Qo
         jfRA==
X-Forwarded-Encrypted: i=1; AJvYcCXlgrrXfrAnNVCIOxm83b3EPin+TmIvjL2J1DDX8yfYkDD9aXC8n333S0EFk9TrHEUfx3U+7U9v6DVuhlWc+vfP//oR0+BI+ERQ
X-Gm-Message-State: AOJu0Ywa91KjBYseC8AxlXrKv6xesz+r3aqyHDdIre60/9WihXOQoMQH
	TkLIHnvR3cRbTP1Xa+Ej/o+bVuW5J29HmARDbEOs2kAYM19w7lGFkbDnvj4Qj/E=
X-Google-Smtp-Source: AGHT+IHd2hgNJGF5hGKfvQxMegty1f1HzOHtA7bmcOdXE0FSZbv/HvwdZ+1xG0BLDkfaBAccsBGokQ==
X-Received: by 2002:adf:ea92:0:b0:354:fa7d:dcfe with SMTP id ffacd0b85a97d-35e8e1a4b55mr4496064f8f.23.1717679479292;
        Thu, 06 Jun 2024 06:11:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e96d8csm1536316f8f.68.2024.06.06.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:11:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 15:11:15 +0200
Subject: [PATCH v2 3/4] usb: typec-mux: ptn36502: broadcast typec state to
 next mux
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-3-c6f6eae479c3@linaro.org>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2D81KA27BBA+iDw6acVjawnZtbTrX1ZuhLRaECsL8os=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYbVzv65NFKTMozB0rDfmtAPdIDX7isOTZwpHit55
 1DuHdeyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmG1cwAKCRB33NvayMhJ0RnAD/
 4xzBKSemaIdJCYyJXJ6lqs8GS4sXVyLAZc2MwcskIDTGY2GsD5pm1OpfJjzqxw7p53lIIyQxd888l2
 7e9KbzZ+09gWWT2EltiOvW2WHj5+nj5NtrWq+tEOmqAWwpCDT5oC7vnd9WASBDuxJmxOeRoccKFNdX
 oYKKceAvfamp1CJc5c+KQTxv+OKmldAPJKompywXqEWDsOyHu1/4Qnuj7wZbq24BSM/9JnMGj9V21e
 J/ToESsqcFOBKRVCb4Fjiuwgvgs20hCGnHlr8Y3Pdeo+TsUWq4ThjE3+66IY/t9VTR42MyoaUuZ+Bg
 RmpDCWWCYKJP8IeqoF1Xc2uQc0HCb5aukHkz5W7by+VhRl20y9Gs7tEK37uudEUHqKKeePurSeKD6p
 X2p9UBVke7vPo8vyi3JMQ+W96bAMIbqSSj+CuM/lTaLNkBp/raYcw/D6K3KV+6Y/GGidiSHOdIBGFm
 taboiRGp/i/Mjk2FB2zFnh+ZflRJ9HRdEAP95SNl2yGhMiJhXkF/YAcFxmYPBRCveujIhK4/GixGzc
 IshlphhkOfmZK8VTm02N9uSojqiJSWucSELun+9+p+fyyV/S3ITIgBXpfgu6E596Bt5YnxblL02wik
 1rsFtC3CHWv/76emciB7qJvUdOaG69mkfyRz0kkKcaHIA64TsyTq2t6H8Vvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In the Type-C graph, the ptn36502 retimer is in between the USB-C
connector and the USB3/DP combo PHY, and this PHY also requires the
USB-C mode events to properly set-up the SuperSpeed Lanes functions
to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.

Update the ptn36502 retimer to get an optional type-c mux on the next
endpoint, and broadcast the received mode to it.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---

Reported Tested by Luca in [1]

[1] https://lore.kernel.org/all/D1HOCBW6RG72.1B2RKGKW2Q5VC@fairphone.com/
---
 drivers/usb/typec/mux/ptn36502.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/ptn36502.c b/drivers/usb/typec/mux/ptn36502.c
index 88136a6d6f31..129d9d24b932 100644
--- a/drivers/usb/typec/mux/ptn36502.c
+++ b/drivers/usb/typec/mux/ptn36502.c
@@ -67,6 +67,7 @@ struct ptn36502 {
 	struct typec_retimer *retimer;
 
 	struct typec_switch *typec_switch;
+	struct typec_mux *typec_mux;
 
 	struct mutex lock; /* protect non-concurrent retimer & switch */
 
@@ -235,6 +236,7 @@ static int ptn36502_sw_set(struct typec_switch_dev *sw, enum typec_orientation o
 static int ptn36502_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
 	struct ptn36502 *ptn = typec_retimer_get_drvdata(retimer);
+	struct typec_mux_state mux_state;
 	int ret = 0;
 
 	mutex_lock(&ptn->lock);
@@ -252,7 +254,14 @@ static int ptn36502_retimer_set(struct typec_retimer *retimer, struct typec_reti
 
 	mutex_unlock(&ptn->lock);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	mux_state.alt = state->alt;
+	mux_state.data = state->data;
+	mux_state.mode = state->mode;
+
+	return typec_mux_set(ptn->typec_mux, &mux_state);
 }
 
 static int ptn36502_detect(struct ptn36502 *ptn)
@@ -321,10 +330,17 @@ static int ptn36502_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ptn->typec_switch),
 				     "Failed to acquire orientation-switch\n");
 
+	ptn->typec_mux = fwnode_typec_mux_get(dev->fwnode);
+	if (IS_ERR(ptn->typec_mux)) {
+		ret = dev_err_probe(dev, PTR_ERR(ptn->typec_mux),
+				    "Failed to acquire mode-switch\n");
+		goto err_switch_put;
+	}
+
 	ret = regulator_enable(ptn->vdd18_supply);
 	if (ret) {
 		ret = dev_err_probe(dev, ret, "Failed to enable vdd18\n");
-		goto err_switch_put;
+		goto err_mux_put;
 	}
 
 	ret = ptn36502_detect(ptn);
@@ -365,6 +381,9 @@ static int ptn36502_probe(struct i2c_client *client)
 err_disable_regulator:
 	regulator_disable(ptn->vdd18_supply);
 
+err_mux_put:
+	typec_mux_put(ptn->typec_mux);
+
 err_switch_put:
 	typec_switch_put(ptn->typec_switch);
 
@@ -380,6 +399,7 @@ static void ptn36502_remove(struct i2c_client *client)
 
 	regulator_disable(ptn->vdd18_supply);
 
+	typec_mux_put(ptn->typec_mux);
 	typec_switch_put(ptn->typec_switch);
 }
 

-- 
2.34.1


