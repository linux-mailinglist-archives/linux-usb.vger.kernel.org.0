Return-Path: <linux-usb+bounces-32787-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDCoA2eMeGlDrAEAu9opvQ
	(envelope-from <linux-usb+bounces-32787-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:59:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AF9242C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3210D300DF5D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D37933A705;
	Tue, 27 Jan 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b02W5Jg2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E0338584
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507867; cv=none; b=T/qoxfGJZs6eWzdwgag6aa/jXL/N4iC8OgJz9vtvjxkKGJ2Y3HjeGe7y5/tAmWEkrK1jordVlDCLy3+1PN84U4RvW0QjfqgojLDCLMWAb/ugYPIsXvq1BX/Gtqjv0uxtBY36mIqMFbKFoPKxTVZOVFIEc5Q8QffQ6HUZse7gpM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507867; c=relaxed/simple;
	bh=2Ns+pMZa86LvrQfFtn8cdEtEqL3ywsq0lxHQPfJxOM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNZQ2wZU/LCodRtnSzW84K5W+1ZHnQ7ZXE378xLdF8KjO7Cotau/m3kxwPsATEwnNFT3Wct77HlHyBjk9qxquGr7bTElzLQnHg1fLpdn0seklptPcqZR6sCwKsgeMobRu9qKVSr5pg5MbuQ0hN0jb/l2x7iQX9D73LcmKRAfaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b02W5Jg2; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso42950795e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507863; x=1770112663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3u70wj8BZadIrCLL0DylfNahosVjS1bY9wyGCplcMZQ=;
        b=b02W5Jg2K+VHDjKIWdeTmqz3bVKZVHg5gkZ3gcnLF6VtJaFDpy3flqDIhXk97vNvbM
         TQ+uuZFSldSnxtLESiIwJacf1765qrx/w9yK3OnrAopouBdf17yVNgk4eTr46AowgOu7
         HaJV1uc2E0Z5ZY+l9ZDJ0eS7lO2EF+OOx6xdSDfMjHbBMO9XLIraRLeBJ0naUDrup/1t
         V2W/ZEi9jFDUNKUVoGQq9MMOlijyetPKfXTfo8Ov97B61O/aqDEZlVBF474myh89TGdQ
         lrlrbJ05fo7MXOwRHLEgZWvUN7Ztf3QVMfBwkbIU1bvXQZRCdmQm7UmKIauT0VV6g8/p
         0PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507863; x=1770112663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3u70wj8BZadIrCLL0DylfNahosVjS1bY9wyGCplcMZQ=;
        b=b4xqD9DWVU8Mhl0WsDUJ27Lvb2ueINpmRG5lfciN8uX4LhKRl6oDz44WGyPGvwLQ79
         IMQe6PdT7O51znlORdh/vWJdh9bb3V76Tu/1d2pvpWa7yN45+si42DOsPKgpkIzsK801
         DMEVYBHkG4z5WNO9yfcJ14xqqxcKFDBfPpU5ynrA9AVaF4mXHIc6KI970nxzrf1SkZGG
         0MQyo032lWBalUJfHuTcO1D8InmdvOyuAUahkaKR9TrDEFgJLHw8bKKKL9Pks3XAnMQe
         q1sv5pFLXlBj0mTz6iEsOO1Vlecr7cStL44l6Y86bAo8RGxnMu9vxEkxiQqKGvF9Vk7M
         jVGA==
X-Forwarded-Encrypted: i=1; AJvYcCUkN4unxljMa+zC0bWEGg4AULloUg+nfr9OkkO/BrTm95utP+F9rIvpiMux4rbaWAZMsu1i2g1KOEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzusUNGVVxfbl8dJRsbsanwcq7u1P+ABKYx7UJm8UjR6kL2XLW2
	N/6xicPDBaWeeaA9P5yxmpsO8uZfWn5gOHC/uCHSYWg/zcZw6RtRnYco4DgHHfOQ7Xg=
X-Gm-Gg: AZuq6aJyT/YqVREKkWqnWfOt8b0vOazT05Ixb7eqGRxDpffHMroCCAi5dxokM9rdHHI
	HOwCgdI9FPvxhj0E+CtUxSIX/aYaFYCPg5OhCjEEpIhAzF190GYpm6KcqR8j83VoUv/xZWbLwyw
	URWQn0wE0cmO/0peK1peioP5JOM/gOB7Nc7UotjFbKK9ds1LEupQMupMQr1PSgKP4BQ3yrQriUK
	ginfu0KVEDrzevT2DZMccX5d91VTtob1jwgvL7/dOcwHMih5XiqYwXW13H3VV+2zF3C6lKXcH8l
	CI1BUPu+zKrezviWsVzXF5+ZiFs9vRMVrVcvbilL2I8oqUSIgARYCpfWj+US0hwk6iBE0bIxT6Q
	UVTOVxGFdjqpqnKbm7qF0CuAawT+X3ZmySIsCTCQ3TYfrF3aGLJ+SMaA1G8WZ5bTEnQ33J4QiNY
	ZnyhbnDbnyBXHQcUHfMGrgqmksoWSlhrQ=
X-Received: by 2002:a05:600c:4e15:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48069c0e620mr16149515e9.10.1769507863045;
        Tue, 27 Jan 2026 01:57:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:28 +0100
Subject: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2Ns+pMZa86LvrQfFtn8cdEtEqL3ywsq0lxHQPfJxOM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwRkyAEHvuBwSj5jjPxvqdbtCoWiO6EneNxoN91
 55+erNGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEQAKCRB33NvayMhJ0fXCD/
 9kHeCaLqrPOrHsr8zRdoWZqqn6NsSYv1iH1ngKtU4xGPjeBMpPOv8BLxizH7VfWoCam9doS72L/gEQ
 TH6Sgs/ga90z3X4x0r1rCQPNMgPN00fYG24WkTjrKwPk/fsdLG5E6XzFrkT2aTAGvnRk3RYF6AVRJd
 obDwumygk61So6Y88MevHwXmosnbl964AmGhZwswMc2Jy6sFEPb1LsAM54SEdLIlnzG/0//5HTlvCs
 srMDrTmh4K7xxYEbLH0l97qRHYQ8XfGTpxr9QUG7E8ukPpK8oXZtPf3PVL8nUPPiC/cHYHLKMNdrU0
 QtlcKyiK25Db0yMFiwgQKVD/3jpHjZm8ecTOfMO6sCHG8U+HiTBYnyXYvjGLKPffGuKRKIaohB2udx
 3lev6ud9LG+nIMCIWaCEVfZd3KFDuebXssMYyMDty5vsaw9fWsP9MOMpcBkYdk5dfWDCEvW9WljSql
 DAxiJZrxDsSU4URwupdIX7WiCwVboCRr8YOJwRRf+vN/8J+nQYTpZ5yV5X0NgWzf2EiofXGLVlLiMV
 M4csdWIy6kPP+EyG7s7/QQEd9eJf7WP+I9eWgpAejbY6e7oi92cpoTyT76z/f/6PB9OuT2Onyf7znl
 8ry1Diq/B2DGLc24T9faUmz4goCJB1xWBvDM9Yr8VhmuO+PqsVGTDm3X2EjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32787-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 675AF9242C
X-Rspamd-Action: no action

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..df3cdcf44747
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 up to two downstream ports, while UPD720201 supports up to
+  four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    const: pci1912,0014
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+        };
+    };

-- 
2.34.1


