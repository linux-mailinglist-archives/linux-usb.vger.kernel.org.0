Return-Path: <linux-usb+bounces-37628-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKg7IoZ1C2oZIAUAu9opvQ
	(envelope-from <linux-usb+bounces-37628-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:24:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25057356B
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14D793034B24
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFFB38911E;
	Mon, 18 May 2026 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM9+02m6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7C392C5A
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135785; cv=none; b=u5ip/xCdPXVLY0S20RA9mwgvhVrtae/wOHelT9b/geAZ0nVh4BQKowFhXF8qDRd61jC35AU5SVEcLdGShX7bhtfuo69AUTbm50jDZEvK+nUVckxzmNOJxle5bLC7Q6SAQzR14vNtfJIOIUi5AFr97dmBCj+cNOQbGa2sEzshB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135785; c=relaxed/simple;
	bh=76imd3xvKIwUkGBVDpZRcuQTnCY8Hnrgy5OngDhkblo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td7raPvYsOXl62ZZmDuyr8fGqvxDlXp7eswPhPhYxYktSFyaTU2m7xLJ8IoPkZiDZoROUsYec8zLIt6+OXiX2+ZhL0D3KYqNSc00ZhGqNkf6wgMqDw9GD1fJeW23007BznkR94rIHfTa/q/t/hSVEKgnrYY5NsRsdB4aVuzLb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM9+02m6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38be5e86918so37336911fa.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135782; x=1779740582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=mM9+02m6JXu3/BhrglIhDvyLkMp0xUnvmGEqTbI2en/IQMN9/3jf+hedyk5NBEFttD
         RMy1aR7NUgX9ULlYAOUZ+sNI9nuBoyUOkNxkzBJUxpwYkKFgFQiIcRWTQOPhNYfyUnAG
         3uYWhANZn/dccRx3oU4RiKUBgYWDy36c1w5mV2ZPUhpxa61T550WQVYIwjWjP6ckTm5q
         uTy+8iUML/hjVvsd7KX37fE9m1cIRqNMaiaC2p9lGLGBob3YiQva7Dgyh4iDW9Djokl2
         Jt6CrUZaCa4w0TdS6cOWyisNNHMiioICtWKfzSe1syZ1p3T8+cx3vrD7OEKARV5F0BOw
         87nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135782; x=1779740582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=GTiRQhKUq1Xzcvt6Wm8iLT4oX5ME+ZOgl7+4zbN2WZkfCyPy7mYllI/OAQdh7UENur
         jcfJYOZFUGSNFSB7USJurPkK23eNxK/jskRkdDZ0Q4mIpUbF2DcTnTgYlX9Rmgop8YjK
         LL4l/f2zIVROJ7rwGNC8NdvP8M7bBs6mn0mtoC450b42oj/BaL7m+rqFQyTcatHiDiyt
         U11RV8WvlqBqNEBoy703awc4D6b/CNf/h3oHBqfNim1A3GAWXlyUQACEocvkplp7ALXE
         owzSv/YKy308QOEdiuAYD80A9csTKFKr4PKreTQjhwIul0lC2euueByH0fram0/RyHw3
         2xZg==
X-Forwarded-Encrypted: i=1; AFNElJ8QnNfdXV9dX220gvJrpQEiJewxaXb6fNXzZ6HTJWgK1MvgxM1kfBsAurIgDkXhbK+GQtXqis483oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoWpdFuZUmmRohEu/zt+Borwpbh4PA7x3nMhPHza9JEv/l+/ab
	uuO8ZXFY8s94ucsrF3UfgelL7ibx50Njt6EWW5WeTrrbdf1jQ43xM0VV
X-Gm-Gg: Acq92OHnEpIx6wK3CGlWjinHIm+rhPcS4hYE1pRqAuvB0ZrKj3rRyY4bQDISxlkIdod
	3Sk6WlwErfUu+83aLC5Pt4RxQpYPg4UcGRjPqn3F7E4ALI/oHzWL+XIs7Qwo5Vn2frj/PQosrlt
	LY4tHNMnW/+Vl0lYDbz422gzbnoQROgYkaPnnHAIgyEMW+an8O/fAB7wGLtz0oXG7RNFj5sTaVu
	u8wsvccBueK6SqPxG48NcYOd8l+yyFiabE7kSuMwsBKHuwt7epJxdx5vMgL1231rHD+cpCcgQi2
	1Zt3EvIbGQwFGWrCzqO6J9fx+P0VG99M8T6JFR+dx95F3DRvNNqnRnMG6GnJD4RNgCa2KDuEKmb
	+hmPlLA+moMA+vDvauH03FKTV3RJZ5MdUP0zJ6Ujm68q2E5guzHERio/ZtsmQ6jjwt5fxXTRHCb
	gCKhOY2zyYzPOKPs8qrZPx8StngbYp6oGEPNyv1IZHR4+C5ZfG2UU=
X-Received: by 2002:a05:651c:4393:20b0:393:9ee6:1b7b with SMTP id 38308e7fff4ca-39561c3734dmr39284741fa.22.1779135781624;
        Mon, 18 May 2026 13:23:01 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.22.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:22:59 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add PMI8998
Date: Tue, 19 May 2026 01:22:46 +0500
Message-ID: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-37628-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC25057356B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
inside its SMB2 charger block at offset 0x1100. The OTG control
register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
qcom_usb_vbus-regulator driver can drive it without code changes via
compatible cascade.

Verified by inspecting the downstream qpnp-smb2 driver and reading
live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
mainline Linux.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a..9e2e2c8f9539 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
+              - qcom,pmi8998-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 
   reg:
-- 
2.47.3


