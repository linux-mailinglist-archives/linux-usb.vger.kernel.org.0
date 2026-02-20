Return-Path: <linux-usb+bounces-33519-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJI/DUt4mGlrJAMAu9opvQ
	(envelope-from <linux-usb+bounces-33519-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:05:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D4168A8A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97226304AC39
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5C734EF08;
	Fri, 20 Feb 2026 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaY3bOWv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BC34DB48
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599893; cv=none; b=vGOhi8N5gmu2vIGCTyUAfLjVuXBEHNdbUfeJagCC2uQwOK+pIQdJNMF1kW+UTXCBeg1TGf0wGDDQqDxwOBhTzjtDDGLgMM2qPe59uVMgNa6Bv3xg38sQ51r0RhOi4TmqbgXFMiL/AFD2IXhyQ1qaQEjMPjOjlpQOM2wEdWa3dfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599893; c=relaxed/simple;
	bh=LSJ6iVt1fKqUBE+D4hO2jHttM0Mg6l5uyfncK8nFUsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLjENDIo8OQze9mG+H22zMhs3nXcOaIzQkkzrPhJh5eXl9UJIWpSBQeSkf3Mr97ebQPaS2zZLIp0L97qcDO5WmLm3qN9iO+PXilYZ+EjfwbXhZysbPS8TN6DpTg7zONHkdzwcxQCH7YESc/GQzZFc1C2jVRZ0Ws+EyR2LdXUiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaY3bOWv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so20630955e9.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599890; x=1772204690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rodd3MUSh6tvMD3m/O9jejBF/2t7v6lgidsmMLGv4EQ=;
        b=vaY3bOWvB8wfenM1n/uiGN6jYBQB+v/2Vw6aUutuHsP7o2gnVdyCgbUjaxVDA/AqN1
         THOf8YafjiuZhxotDgo9THQPaW76zX3xcOK5MTCIIppuz3HTWqJ2L2649vVSJdX8rgQZ
         wW6LyTMcwhqZriR+JvKxktSAqZOHWi1JplGh5NXIr3HuWBBVoWOhhr3abXznBbvzRpsZ
         2IhFu7NGsXtaabNy8w7eYDDPa3E+hdYgVKQsYfX5AMo2yriKQpx+L8VfVEiZSsDvamtU
         abIDs+wmE9Mp/ljWp8djG0S8qFcFeg4b76en8cOL0IAkf+bnsbm5NRR0OlOQwP8P78Z6
         Kp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599890; x=1772204690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rodd3MUSh6tvMD3m/O9jejBF/2t7v6lgidsmMLGv4EQ=;
        b=emm5laqnvyZLaPGeCxouNRSox5TYC34qbsm7VKzmVGR/Wm4XShRypnzvJej62RSjHn
         tZxmW74SpyyqxIXkzUTxrJzjfYDXo5y4ZReQ32pPEhyxdn+Z+v+4stUGuqXl2562QDJA
         H4V3C1x1qCizqBSyA/e8Wy6UGxLbqie9PAi5W1Ua8uTapqu33bFU9EzDPw1vdkGDVjU8
         33ewTEkUsdDrznGfKlPVeQyilLE57pyd8GJ2POJc/BouhW+J9tGmrfLuJbNQVtqvYVKL
         l1I7GBXRbDhQIk5DTfB/1t9etHnNYzmghbx4jJJx4d4rrJOyKr8OP6zkfvSjmSVSiRaB
         bdtA==
X-Gm-Message-State: AOJu0YwrrJi7Dg8P7QR7Fn8r3ERBvmfEFbgTlM01VkM0jT6SF7kZW6E6
	r0+onmIY4ql0vt+K75F/FIS6Ve433JX/0SKhzBIy6AoiLn+CLc0PSnBEETUUI65ZRvE=
X-Gm-Gg: AZuq6aLgfuQSll0hjKajcV52+VkiiZO//NIB7xSyTJNnBHyuMEqZsg4pCe2RIh1k8Fo
	aiQFhnjUc8iOSCCvYUTJPs/SLk+AelcWOZ128HH+2F+Evb0TNFjKPI0M7NnJ0Xa9ZqMMac5vGj5
	bPtauO391lukceRLEkfnTz8SpM692XeFqOWfax5w1byxeQXDodAraeeYVwMJusyTqIU5QI3bjF5
	zI+nqW9V9QokqUPUAv0PdD7i4EOhDBIIN2064+6PlOQc40O3aFM2SoFesQPg6lnwdEzXpAeT8ag
	bTDypuoS6iO2rPHEXCEqvUh673+1F89XuPpQbAFNKoRW7nOQZdPdjde4N+eo53CU1jxDJP3Ykrw
	ydSEbB+D4C/c8YVWjMoS/pSrl2RHmiFpU6Dwvafk08z1KKf4P6+OdDyDf/aluxmTayTdJonXqqT
	h1/yHrMVkNxdHqKYEXpd9t3oHBVe72OYbbD9XxkcCKWVck
X-Received: by 2002:a05:600c:1e24:b0:483:a21:774c with SMTP id 5b1f17b1804b1-4839e668a55mr114317005e9.25.1771599890008;
        Fri, 20 Feb 2026 07:04:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:41 +0100
Subject: [PATCH v5 2/9] pci: pwrctrl: slot: fix dev_err_probe() usage
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-2-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LSJ6iVt1fKqUBE+D4hO2jHttM0Mg6l5uyfncK8nFUsY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgLvAqgpyS3WqEtzwpidrWJupURRMxHHCbYRiCH
 s2cHeQGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4CwAKCRB33NvayMhJ0VnvD/
 9JxYCAzcI+M+RYnaW+fQ5gm0DcADfB4wSW/ncXdOTNzw9LTvMkqbhtK/7qp6IsesiNZUWpif2ZiEH2
 sD0fr3RdWo6TI9uUGAsICG/mc+tHB7Gh/cp1PxprLrUhMhp3pXVcTkDF3qoZkDmK4TYEzV4I75VKci
 N+/dXI4qgpOF5T3LMvCbX7fREmTfv/rF/f3D7UrEYqaH36oer49SaEoylq0qVPnwCZzeTLjKhyP6RW
 yoYjWDKEeSF/Kf6uM2K7SAFwio4KNXa+3GI2q+d4IhFk8rG2lrVaka4OGbCRFrUZQ5X4STcq55P+4v
 gHB7ieWqafW4DQ4wd7vQT/sJvSuWk9CnYjEYcCsgR0rb9jVh5ThwVQJrERNkmOGOxwzP7hssqBqDAE
 r3i252QykXNG2nMtKhk0+4LbIecm+vxLaccSD00waLDeeoIlN/avkIvJpnQdL1pkzyKySq6UEQqrrk
 SmQYoxPeSo7mVZrSdUS88t2HudZGcHtvmL/+LMXiNExUbtecw/na81wuyhIhgCwrwfoMXED+NzNUa7
 FSnOdRPJCjd51v5reoU6dOzC2aUDV5KFeVM8EGvMeiA6B6M+6LM79Wt0/iIfEwRlHtiwfZ+occGxe2
 E09RHwUZpi8mZQ4Ju4EpL/GnLuHGdrlZFz8FyiXUabhd06ixIwXQeLHQs5yQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33519-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E02D4168A8A
X-Rspamd-Action: no action

The code was not returning dev_err_probe() but dev_err_probe()
returns the error code, so simplify the code.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/slot.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 082af81efe25..f03debabbc73 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -88,18 +88,15 @@ static int slot_pwrctrl_probe(struct platform_device *pdev)
 
 	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
 					&slot->supplies);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to get slot regulators\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
 
 	slot->num_supplies = ret;
 
 	slot->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(slot->clk)) {
+	if (IS_ERR(slot->clk))
 		return dev_err_probe(dev, PTR_ERR(slot->clk),
 				     "Failed to enable slot clock\n");
-	}
 
 skip_resources:
 	slot->pwrctrl.power_on = slot_pwrctrl_power_on;

-- 
2.34.1


