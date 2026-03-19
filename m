Return-Path: <linux-usb+bounces-35112-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COyoOg67u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35112-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:59:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBA2C83F6
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4448A320AEA8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609133B3BE3;
	Thu, 19 Mar 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYo20634"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D83B0AEE
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910520; cv=none; b=s5cQW28TpEg5keWUpS0NefKhkK4LBjPhpZHoko9ZO+wXOSErhU7u80uOk7nr5KzQXY9Vi2mjcpXI5WBXPJooUvM9iRZy0qmPJCCZQ3UXK5B5uMRkCFQ01VrPEdeR6hHnm4l0KjvyVC3yNlbWv03xod7Sf1Zwrvh0coQp04eUxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910520; c=relaxed/simple;
	bh=5XxWigC5My4B3x24Szv6ks3z8EguLjBpSYctWIzjgW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbzbClkwt2hfMR1h4LOU+q6Pmzf4Ndzo2imqCZXyAN8aIL732DOr2E77KYDlbCV7PxAuHoW9zn1C4MU6WkzsjwmpMu/ZW7vwfWMf4smrIOYuQbaO3FXWytrPnASLZIILZNAHa9wUGjIA+mgMcZZgbnksTl1HMAY7RvjG6STw8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYo20634; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b45bb7548so435196f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910516; x=1774515316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8swaaNWSl9RHsLGGBfu8B3B1mvGualJmPbpF6pl4oPU=;
        b=ZYo20634g1jYb89G2/6s6kncGg01GNoTEUhcFAeTMi209owQ+xqEsueeYh5hnXLuUg
         mT3uFkENCMjfxaCq8YKPo3JAADDBhrgtfC9r5jsITpgJgk/RjF/VCgKFuPhSgtYoyjn2
         qFlxPBGgcsJaPAUO87bU/COL7jMvT510jgiGXAKdZ6anoc8QNlGNppTwVNJr8gO+FEx4
         ESMcrgIep7lCK5nKV5uymTJmw+LJpwsmmBsZ2uJgVKXKKon+I8/a/Egiv7kzSZoHLpmX
         FQkRdNo8AP8ysi3+mZEE29wOmBxFCfvk4nTfqXb1Tn1l04KRuNJzyfkyGk8bq9k21UKQ
         v9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910516; x=1774515316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8swaaNWSl9RHsLGGBfu8B3B1mvGualJmPbpF6pl4oPU=;
        b=tLrFrDbU19qSEBgW5jky7zosvxw6hE89YqznKVvS2J+vMu3O/Y8m6OGSCN/qLQJ9q+
         2M4pABWBKeBc9XhN/XwzoBJgKGrBMpbSEHO0ogd5VQ0Esf7hWPOlQ4/7VBMbcwIdWA7w
         hmd+2lftKX1B0SbsYiOvL/Hj1yCyfO+R9GwnbqbjmKLUqjpmANbWPN7retbsaFrGkCz3
         yZqpHDoTg/iVu0VDnn3vYv+MauomjAovjZLGk9AjDEkcqyeRur5UV58pHFoIgUEBDrgH
         7yEanrF4d4DISE05zsIAcw1He1/RiZJzFcdEL7unFoYmBToDA2mGssK69OzR9Yg9LDzX
         VQqQ==
X-Gm-Message-State: AOJu0YwrnFkkRTFuiWHlHxctecAiQ+wm5j+z/I+nrMwPwKKTrMgJI3d+
	Bo8vzvueQ7QIP8Zt624vEmn12Zjs2UBWClPKbAVgR1F+IE1q3tGovvcP8j2AB1tDROE=
X-Gm-Gg: ATEYQzzOtqcUXjA6dogxVM1FcueMa4UIbHp97mZCef1XZf0fsuGuDJgv+VDRK3vRQSK
	xpkaOlundUEy+4E8Nwjb7VyVpWI80v0p8qGmlhwS2eOfAleyeBE3tdmlwqElDE0BLNA4AgJA/p5
	SYNLx/MZNr+JrrKGaGaQ+jRfuhrEncM7QrnZge7Yah5ODLVDbtkGdzO0bFudlG5MQp5n75i6FMH
	W4ZUCr6g2kMPS7n9Fq8GE9L+R6oWedFUxAZthilqs9t4CcPiO4fH3Xmh6mos0fQE6m0srObkvic
	ap6anuCpA3nr9PCE+wlEA9a5ow8m7Np3pFHs/Vr637I2EUFMonalOTINMll2mRio1FAaa/m2oDC
	wxjY4JOHL4zHYsQrpM5xlMV2dTJGVfBX4wmeIAXnA95s6Yl1lw320Mxt2lStap5ROCA6R/s8Z5j
	VsCjuDrSMCCjQpTiBQHRbBv5KvAdTXD74fpsBtAYLtp6MC
X-Received: by 2002:a5d:544f:0:b0:43b:5762:298f with SMTP id ffacd0b85a97d-43b57622a4fmr3176952f8f.36.1773910515711;
        Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:09 +0100
Subject: [PATCH v6 3/5] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-3-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5XxWigC5My4B3x24Szv6ks3z8EguLjBpSYctWIzjgW8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nuLW6CFzyeEaURq0TdwKGR7x2YQyIFu9wrygmk
 /Un4k+6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57gAKCRB33NvayMhJ0WZVEA
 CE0nSlAt+Tnw+3tKQyLV56hWvjVI/qhzfRru75asl8IggHQfFCgtY6eCcoZOlFa/J3JFnJcAQ5aw7E
 SBB1lPVoUSGfZIKS9MDaCxdqozFEsQ3vyt3wabS2j+F8wSa9NBnY4bmfNwhnGbXUNBQYC7O9OQ/Lut
 MyQG4xe69TqFxzkxgg2RUNtwahV6YTDWMlQ7RyAOaag25QK7MGlb1siTpZmaAuo9BnJzOE6K+1BQFI
 v7tj5QUzA3Ec8h+p05oZ/nDgBja+jM5xNubVbruuz5zmx0POC3z6hm7dn2hqIxl6MNq+oZg6O05UWH
 QNKpwvtFkWfOetoMV3/580tykYz81PjJAYkKnBIpzuPWPAxqQHnI70Bv97AERG/ltEM0bKq4Mnnd0M
 ++terUMijoWU7iJSlkKmGFGqhFQ9Il/HBsdFUz06hh+hh/jbbfhBqT+gbx6SfsjTQEn4TKfXh+TzRY
 c7ketgyw6H+/VuFmSB5lj13LT9UGkVdmNQGQYdSzfbdTYd5+Q+Wu/te/wL4j5nsYiO66LskCg+2qQ9
 i68HG3ckbgJx0EF/FoDi7fUQThFQqEWqSxKlMMVTfpKlydxMDdfMm1gMlnuKV9OcO/yFEFmiS7UH1r
 7kjgTXBpwbIL935kyHICiKGkGCln8IGqkcspgT9aWxXq0eUo3dN8BlzK1+3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35112-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 91FBA2C83F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d..0a6312b15712 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1077,6 +1077,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


