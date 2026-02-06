Return-Path: <linux-usb+bounces-33145-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKV4K2EAhmlhJAQAu9opvQ
	(envelope-from <linux-usb+bounces-33145-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:53:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D438FF48E
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05576307DCAC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9BD423A92;
	Fri,  6 Feb 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IN/oYr9o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31D4266AE
	for <linux-usb@vger.kernel.org>; Fri,  6 Feb 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389446; cv=none; b=CeRlKAt2CCxa6DzrbWMftedmAfO6qYHLGodZ79Y0NzDRfGq7jnsQmXv394DK5c1VRjf9poDHogmeJ56P5Lmto/S90tN6atrD0K7EgNyHsqTNsrRfRRFm9ajhQD96JaYepa9jHraZq+Jijsc73Cy4UIbr1XmBvZjyOujGTKgXF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389446; c=relaxed/simple;
	bh=g7pVEIyvtjR2rEj/a6QvbvFSLtaV0ediGa8aTrfiBNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WclbkofbnuQ6G95arByIG5Y9AS4oKlwB2irad2a85jitFLL6S70zun6pR1YHZraQzLHBoMI+W5txX3c90a3tpaGJ2e/UowUYLAFYk41vj5QwoEWo+TF3kS7FKTv8IcxyQMWdSqblkoLg1c2kalhdZgVyrV207ZjSNeAy50F8nZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IN/oYr9o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-481188b7760so16436715e9.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Feb 2026 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389445; x=1770994245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlSYfEBBAdIRU1v5SNtOD7nFSWy/9WeV76IFE0K4K+Y=;
        b=IN/oYr9oLoIDZaHr6u8+gif+1TV/sgRC+SW1cmcE/H0ETLeQW1YJswrnIFfiPtstUO
         WFpESeSyJp1mK+GiJxvXqqQCZytNvoCtzF+r0SK60aTcKk+rNDNkaQFxVsgsyDftV7zR
         TB/rMu7F9yM7xRfpiV66KczFFk6asmHkWokgZ9t3hSZMzAtKnyOuK5cfNGoMZyX9d5Lk
         Kf9Bbc/EAV2GwRtrPM0TMh0ANpsUAbv4UujAVUoD4gzkHolSpraJMSWVTK+iSznkovB4
         c+BpKJ3QTKRkHvMAiCHqurzF//2s09wJYJKB6W0xf39IZib2e1dZdJS+6oDVA2mV2SU1
         2zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389445; x=1770994245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FlSYfEBBAdIRU1v5SNtOD7nFSWy/9WeV76IFE0K4K+Y=;
        b=BW3bMl+//ouWfCh9zE5RncogG6XOn+uRESzUMFRyoh8iMnmj5Jla3PNmSnis7JEOf1
         P78tT+iyfioHq/sZLYQzyIay7wXx1JoCym8dfP4pav8HdCe3Ly+snWFZqE/FPnA5jWNj
         i1ZwQt/tGKjasHVggZJu33l+ym33VJd2U/B0npbFv4jV1LRJH809L+NrrOtn2gAjtUTw
         iHC45WEIT/FtO61RlkllnM8hkb4nZAoSjqcMbQffc3r9byjl+eHb9JKj6GPCJEIpCtjh
         ZL4Qb1+mrlpnjzRD7WcdvzDd2zy7KOaw/4IIe+CPt1nrnaza+BmZN6IhXm7MYUh7dVIo
         Hfqw==
X-Gm-Message-State: AOJu0YxQr67EilTzliJwc5auhVO3n5/dzQH7WpsYdYs9WVqwCdg/k5lx
	LqHeb+TWI606YxCalN8QMPUcvTOxo24FaVjNQUQXhFEzXfNUAGDZ8YoZ4Fs9RKv2/To=
X-Gm-Gg: AZuq6aJmpi7AbNwzLWUxiCciFwH3M603C3Tb5th+AnTSpU7aEOfbzMYfe0rSI9SS8Be
	RTlFgB0heLrH89aFWPmn9UObUZSmkO1H9aAdhmdL8IOJi0y+SaVmzuupyWcHGJcIOirHH5CsPf8
	9jgEhnyzmww5zNdjFOm2veHJU63z5nUWVBM04HHLlfI6THIly6Eihjox7j6SncMNXUuYp3Rap40
	oFCm7EDbmxmTBCBClEYmJUZ/xLsj5uAsfsn3TeL9Qa+Cx7rgeQNAYM9mU2B1jfh2HcaqvKMJc40
	2aoeXAr+JcGEx0YO7SNejGE1o3WqBR1Tj0RvRiXzKssNEPnO+ZisYobiY6SB57mgOsFa32noGao
	iZJ7LMtY1HXSpMp0J1h5UDCp0egPRlYIzYN0RnW3/MIcksjXsY1dFgJflPC70QQxS0eA/4hZ9uu
	0mPTVzJL343mhZ8teTpX12l7cm2vODBEvU
X-Received: by 2002:a05:600c:1912:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48320966cf7mr29773605e9.20.1770389444512;
        Fri, 06 Feb 2026 06:50:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:33 +0100
Subject: [PATCH v3 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-5-5b79c5d61a03@linaro.org>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=g7pVEIyvtjR2rEj/a6QvbvFSLtaV0ediGa8aTrfiBNA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+8083v2BvmoVt+DFmY1AnidxnT2LmfSJLsmFlx
 0lKrmyKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/vAAKCRB33NvayMhJ0WatEA
 C+UqOH3jAZM4aVjDBBFAb7wLBX7vQELxv9cJXnfxleS8zwNPVxBPt0D3FbLcqPFGnb+UCfJWk/hPaT
 bso7oMzVMzSHVQnNgd1dTudn8KH6ZOtBkkHC0WtpaytBs/9iUPAb9xLdzkTSIy0whDNwmzr/+gO+yN
 ZhMj6zb+tiwae6Q5O02Y3C3DxVf91EcAApB61NmRKEWc3ONhE/jRsAotIcEiWL8eTY6K0y7av9jSNi
 MxB6BNVsowUbkjGhfWfSJb9meVSUA87VOk1lWY+Ceuh8+jgIGgl5BJpQH8RwlGQQdV1uyEjGkKIIeK
 XSObr4TEVOA5huii+4DJdW0Eufs086JQ9Fln/uGmPG7NtDC3AcLIXW14LBTrquWAO33ofDwIkKR4T7
 zMMUXheuYrjkk6KVS48Htfp5GRI5XA7JKtOlWa/NCekDN3g1XKZzht5D15XwKRfXqxBDtpKHKWdrFi
 bQZV/atcF04xRJoJj5R4uwENr+w8ecAQV8yr3j+9Ks+/9SP808IPYck7lB57HCOWttzic7TzjDJj/Q
 Q20wKq8ywo1gFMFHtW4CHZwHqKchviU7xnN1oAB76/yFSmKlRtC4olc6dP57qtTxSvhJGct0b7bk0X
 Cn+d+2jsKioO5wqf1TdFvtXwDWx0VsmahBIMRkvAWReUb3Br6wVdLR/Xbrvg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33145-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D438FF48E
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 35e9eb180c9a..5efcd4943a4b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -250,6 +250,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


