Return-Path: <linux-usb+bounces-33388-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEyTO6kok2kI2AEAu9opvQ
	(envelope-from <linux-usb+bounces-33388-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:24:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331B144967
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81670305B457
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 14:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0047F3112BC;
	Mon, 16 Feb 2026 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byOUQlHn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC846313279
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251721; cv=none; b=RV0K+22IrBojXalk4+lTNuOHCaTbsxhwKC1t2v/v+FFxhs/8wYamxlNQiiBAmjpTWxX7lNeCyoiLerjQk94P36y85Xvk6DWYfqaKWXd7KbcjOYN+t/LaQVpzAVLxnGA6Jy+TSafg/ixU5uYB3wKenbtq+7MT3IVGwLmtImXn/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251721; c=relaxed/simple;
	bh=gNRGWFg8BciC69sNOtnWd0kGP1UBPVT2I+H63GUNNOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cf1T9Hj2BqRja0S0WcSVMlNzU8EjmqUajB3Ow6f6uC9HZsjlU4/JjUYzurB0bXD5tQPIbuK01HhnuKhEjIhwVNQ4N4fML5cRG6WNtQDqAT84tEUhcNHpdkOg0wGFBwb9Ho5vOn3NKvDDMcVch4zNb4bKwBt88qoXnVRdMc/TKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byOUQlHn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068127f00so34720295e9.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251717; x=1771856517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9Swo8EHFlkKGAVfWwzLCgBH0uCFJkUFACNjEB/L8G4=;
        b=byOUQlHnfzdAVnJpsZPScdNFE/ieN0JPrzJrXIbRauIKCVG3eXX8QJiB9etCNNTbOc
         ek6r3fUyO+bJtLccVXZ0Sgm2xeI2izW0i1M+Gf+3mD2WY3udYzJfw8u4B2vW2lFHMzv8
         ev/8VTRa6sJVsiCmhSY6/ij0+ykSnFID9KTfELiBb6zT1BwXBfkxXes2ViyBzK8Z2I5+
         yH0vXybytDnmN6rqmLrfbEoR8UwlVDhDrPU+An9bF0wmVVJNpVung0/xomzjP1uqJi11
         g5PWmY9PXQY9MJxaBbB+LA4t8lRDhNi4Lim6OYwYoGdNl7rmHTW8KrDrP3R+TmLeblpj
         boMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251717; x=1771856517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9Swo8EHFlkKGAVfWwzLCgBH0uCFJkUFACNjEB/L8G4=;
        b=jLR9tViBe0fQNLqJ+9ZrQHjMagrz6IyBo5aVJvW018/ex56lRMhLn+y16ygKsCPi1y
         Mft2OPyKr5xK53PCBiI7xDPYFjxtt72Cp/s2GBXoQ7qJxC/bSIdEqVfjBFDI9PNpAo8d
         QEKU+j3bk61uKmXv5v6EBnQ6Wc5pwnq9dSgdIbn9NPv6KF6MO3Py/7ROsRjjhsiaaYyE
         j3yH2iUhKYhFVDS2FfH84LdRxQ/zCZFn/tmlKLDLt11IL3n6v9Ai0AfSFe1dho+wxAlo
         MPRNpOQ7orIlgk8zXabvu75uNcuAjU8cG598hgpUEKtK/9II6XybYSZHVNvo7A79JOKM
         CJ+g==
X-Gm-Message-State: AOJu0YzuI5c/BqzFtj2fL2D3ntFR6eSQAwp/xlF9d0g5tVnuBP9FJQbb
	l98uBAOXmh2nApsM39jYbZBFfhgu0RJLS6d0yzm4UVKVIjTVaoP7dLk+w9q3IeNprPM=
X-Gm-Gg: AZuq6aJAokRi55bxkGWm9pkRSSRsSIjn0mPxtzOuvbHDpYZ6xRtcuGzUTh5+z5yRFVq
	qJyknpOh2lHPO/0QEicR7toVNnTV/fz7ixOf7CXrzXlXQHLA4ROH71kOCrkgKafx8FHRl9oKP9h
	6StQO2DasLak7RZuuD2bxdVckWLEE+xxOxdcXvRdosLEQvWlEm7AEXuTVmTdWUii9/do2tR5g5q
	FcrVXLT4xo07sYKd6RJm4A2aBzDELp/80OuFU8B2p3UF3A1YnizUR1K7OKvHJXyv8xU8euN1+pK
	T5h3Kvtm3iWMlhyz0kkoh/gxcKfeYteqy+Pe3f0en4kM5/Cx7415yUqt5oPtRu8c+bJ6OlPA0Yr
	X4vMnvj8E5yYJmzGgQtCU1Sdgjs9Tavkrt70p9OqASHOjVupWcwZw1K/aPlrULDxKs7DLxevi1C
	0UfRhjiI5QDIFQGSm6cpHD/pfMaetqnwkvMbWlY/MsMjhz
X-Received: by 2002:a05:600c:4e4d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-48373a661ebmr174878405e9.26.1771251717262;
        Mon, 16 Feb 2026 06:21:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:49 +0100
Subject: [PATCH v4 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-5-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gNRGWFg8BciC69sNOtnWd0kGP1UBPVT2I+H63GUNNOw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf8RIFsAp7s23x2o6Io6/7zg8SpJVZF1WB8msk9
 5j22b66JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/AAKCRB33NvayMhJ0TMwEA
 CP2YDUnqsl9Gn67wxmjEyV90tlvminbZqLB7TTbMWXXB0yV0fJGEa31VJ4WxYFn3WNgp474NJUgBYZ
 QJumQwJSFEUQYnnCwf7hJ1XXxxEf69SBOtuaetXqLaZSd3fJ+ayWOBE/jCM7L6SWTenA9EyT+75/wX
 ZhbnxGnsONJ4AP5JT6uBFtXC8cvU/mmT5KncLAtdI4kdR1YDxQuSNxrpSBqcVji+DO8461PYtLWdxy
 ZMYRFAS1n+NU70VIesZaYSygAz4VqHkPEuNqwvcBtQ/rnnJqTrRJZJtKPq4QAOVTYv3jDnc+dZY6t7
 Z63l9a5nNtuGuKZswbIz70pOSLe8gQj3coSTmJUM/K48bjFEYV+Z/v01Qf75/A9ZXg9XiSAnV3ULfm
 V9xx3Gdlz7LVxR2NLFfLzTM77WxwMD37+1hfJsKec3Whj5bpBBWv3FEOSueVwDya0MQDb5C5NQ4oRY
 b1JtVubnau7oFZxkj1oVcLm5ET1Zjto3bMwZMK1RqOU427DXquZUUSvFEC4JqxW3o91OKg1G693vvi
 Miq12zKVxb6PcEjJliKdA0hdj0osZk3e2b5MQwxVk+LoclPEaTcaebglU5nTxjEUjoffNy0oOpAGWd
 siGFXe6Ax4wpaZ4geFQC8ofacG0s215dE6zmpsYOe1/1h/VKXBM7jyQqm39w==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33388-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9331B144967
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
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


