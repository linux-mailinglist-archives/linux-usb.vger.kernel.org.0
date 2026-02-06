Return-Path: <linux-usb+bounces-33149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLeNJ1kAhmlhJAQAu9opvQ
	(envelope-from <linux-usb+bounces-33149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:53:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3303CFF480
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 15:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDA3A30396B5
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDF1426D2B;
	Fri,  6 Feb 2026 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w61DOjpC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0A42980D
	for <linux-usb@vger.kernel.org>; Fri,  6 Feb 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389453; cv=none; b=mf1ghkv+7c9R3v14Q9L3GXJeHyNWF7bcraLoaLev3YC7ufvrre9IhD+xBYu0ebfxb/yljNz7K37ueOyXYQDDLQ5d68KkmEpwb5XQ+ZqmMDnlVoFBK4etTmgseWBeD0EYJ7OxwiugxyaX1iEhpNZGiilFhwn4nqHoCA3xqUuyV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389453; c=relaxed/simple;
	bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUbv5VM9XDEkkQRT8QsUC/tFMlL3Wg9koPuwd7AES/DEC3k5NX1+vmAM93qZBiJkd8nIDtE2UpbeM30Tlpk0M+RstDVMyBXxnSyPsryK/s/Mx0Bj2xK0qN2jaI3KnwVlPoFMaHROgH5zBVUomdwJDKOWrqz/u8M3fi+NhJb2gjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w61DOjpC; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-482f454be5bso26962815e9.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Feb 2026 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389447; x=1770994247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=w61DOjpCrOOldTj6kJXzEcy1+RRqFagslwNCBl72Zl/jsH1KYwsFNTyvalNVrab77b
         dLSLS/PGXKdiGhcy9nFPNuv/9HLZKafdVEMcHzRxPSd/G4fUHdkwlqZpyqa2RjavY+sL
         0a//fMMERPBcKzGX79TsjVJfuVZ8BCDoVBQnRKu2uuGIQVC6tLsXTtINL3cEZRPf49Mr
         M+yCjBpIVIUXLLsfVdAFHijfVIL2QXtR69ZVsPyn6J5gR3G1iheH9jMMRNslrYFtxccZ
         /lnc/xYVhV42xUOpR5u5jN1RnSDEu52cI3vQJFxJiyOhih13FHVv41+ok3JviTMjMSAd
         9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389447; x=1770994247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=gl4eDUfYULc4T1JzDzg9UfPpfH31OJXNwNULkJ2MgypCH7AysTjBTNK0LXqX0Jkm6j
         RBb6/tUZ5uk+5kzI2Af3R7trjyneT6mNseIXNygE0GLhmWYJIdtQXfvr0twzGZzwHgZ8
         f4jbiTCdQteV2miNWObR7bJKFjNLLpZBLnhTRJPrVC5xPykzW+XtthYUETKMilQ0dhTr
         /lSUPHcs0tit7O3NftvXe81g+wfZLenfBRdfWrL3YV4L6mh4TliGP7QE88sGEFN+V3mo
         MUL+twFKtMEy4TKEztCVx9ene93PIkJyvKAUHzLmmv6F7kChvVmPN9j6gbKPJjXXum/8
         KDDg==
X-Gm-Message-State: AOJu0YypM9+BhbZ0uKIfYpyZjZN57Mg4wN3NrSruh9zUolT8uFmPqF6s
	j4EJdF1cbV5j/IesuuftqIR+9IsxrRDUtnJSV6ktWpstiqHtqh/OjIRubjJ5/9An2vjcKRTBJx3
	kFIip8r4=
X-Gm-Gg: AZuq6aL8wt4XhjFbf0IaDZ6NnjjQGJrMkKlS8WHgt8jC6QPGtNVFVmtBarol1hdzJT8
	PcabACGqAvE5AUcefnNH369gZfXtBW1c4JLakuUoZG12KWjn1ZL3xkStBIzjRR3b/QzukfGGdXl
	KYNRP/BIGxS+TJpYB9m+HgJGh1P1dDAgP5Ff4G8qVT/DkJzuUx3lUeD52P9eZ+wk/WhZyK+WcQf
	BG7oNcmMa5smjBZOiK3wXxwifOjyWi0qUVUGd39F5h0yjCA9hHKCDvXzuEFP/vXZYo6KqyQdpeP
	+3hyw3J6WjpvZEbS2vob5sJbRsZdwppsBWFlVKahVmaR5429U3COF7Z7UqYWRuS3ndYsGceYSls
	ezmsciAi8v6trDeCH3dYW0I958S751la+UZyoH9N8Eszm+KHQuludAC1tdoyajUycG4TjXuFGSP
	pEJOZccSEocw3DlsVJmZe/H4FDpYy5yGJ9
X-Received: by 2002:a05:600c:3e14:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-483203db77emr42394815e9.16.1770389446464;
        Fri, 06 Feb 2026 06:50:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:35 +0100
Subject: [PATCH v3 7/9] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-7-5b79c5d61a03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+8LIVwVOGfaj8vA8kiyspuw1o2XKUl5qHvBU3G
 YjPBJeOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/vAAKCRB33NvayMhJ0a4ZD/
 kBUC8ByNS0Z8Z5TN3IU/BTmOXJ0muNmK93A0saVzteh71XXt1UYFxQdDpGOVUgGS17Ml7LDcCSpnDy
 n8DkQkQQuUQYbZAS7zKZqMft0O6D0ABRS9CW5HNqPIhwyJHXhoibqLs1KrSY2xFzZhwxdyLHgcDUrW
 dlrRch7T7JdIygSFiTWzsc1BCaOC44MzEZQQ2hA9avqObcNKHrMrjlbAqcuY3u9JNXD8TXK6PNFsKc
 1x17X7B7ZWdh9xVvT6dwZqXaNCejL94wWvEYFjVqo70YgFPcsmDYcw2dCSEKH/pV/7Z8UOmdl2Plbr
 O3WOBhlozx04I8XWSrKkQ0KZJ3OREgz0LqfOgVVTSOKeUbRMwSN0mUzRxEWuDItyxTndSMvgDKaEPX
 pXygzstIhoYOGMar8ZlcJApMhT7xq9iW+JVLfdNIHoWQfU2+Wgc+zYES1gXBV23C2X5X5eadvwHk5m
 8c/aDlNqYiDW/z0Gi6FxTCL0wHo+8KKD59/SIoQRBpO2AfWiyc7lJR+VAaDsf7a+lJMHz7hfbdUtIg
 rJ6C+T0YKfzjO0ak/CMsGPIEEFFyMASlz661ELcYdJqEskI4+4udHvh3DY8KPntKPjehmrmbp93j7I
 J6/0ra7CTmZdAQ9G1jx5gSfAAqS92j1AjdxlANKszyhOSLylRTF7+Wio06kQ==
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
	TAGGED_FROM(0.00)[bounces-33149-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3303CFF480
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


