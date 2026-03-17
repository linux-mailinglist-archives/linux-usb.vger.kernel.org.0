Return-Path: <linux-usb+bounces-34969-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AvOFTSauWn5KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34969-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:15:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BA2B0BFF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F3AF31ACBE7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD4837E2F6;
	Tue, 17 Mar 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="7RchHNvA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062137F8DF
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770898; cv=none; b=ldzr+NCNtBTZ61MZg/syz2osTHANvm5FnzLzu0O2+jO9mogYwU5QZUlRpAIkH9GCXAbStMjhGf6lu9msoEP9qWXFb8NDG33jjQ/Jme/8L6f/YrJlMiIKkDclrKFkRvCp/8AyodNVKTtzlZx3oeMPQxS47/TRlAfwHuiMwQxcLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770898; c=relaxed/simple;
	bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwcAEkr/7aaHWrYwVugQVHqM5kxTS9DqyCxGblPr4uvm742SmYc05s08vUDs82WYtzTNc3Nm0Q5BBgjNDotP7dyiP5RAq5/ni3l/SkoQ97U3w7Jam/ryvsNZ+m8VEvWUbcIBLlZXB/Nri69rGz8PghmDcGkg4kh7LTjU+0OBKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=7RchHNvA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so5928813f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770892; x=1774375692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=7RchHNvANxRoBoM/Dddt2pCx0uq+VrKATQ+lZPt4fyhHFwTRk+h7JKduDpDz76NQW6
         yYIj8gWlnfVlP5C78OzGw2qqQ2MtqbS65upsEToCjeatBzHguX+JUr9szIvY8I8yT2tf
         F2s/zPGqUIxt0yEZDtdG7t5L+MS6+63yHGSZI4y+zq5O9o3Un9v96KUocigEFOhWwtIc
         Y81pnHi8hZXlyfa+y9+PGVqzwP6AgvcMGy7bNm2qQ4RtWpGYSt4RKSwwQsW/+MYJoYKp
         HaaXQMEByRam+5ezQSu06GMRS30VcxhRDSvu1RJHyzEeFAiPmN/vYppkrgZ5HgKUWwGo
         GK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770892; x=1774375692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=Ik/insLE5ZqruSp1CBMvWXEptJLOjSb3TPZXNaTsynEz02vy00Qp2BGFihsV+2hcib
         3MlRHdktjnnAKfvmZXAXxmJfx/jVeAT/IUE5TXXyMKRPYjpy2EqLaR4Q4LenCnL6OUVI
         SAnrzRROVt5r8c6KQt0bihkGuUToM6VBziP9BaBvXaMA5egUjBMoNmVFcfLaPodSpXok
         oLkLQS+tfK1WcW/yC1fkhArx81UcJ4qOl6W9dFFBtlSbGx5OSGcIAzWBnq++XBFhwILV
         QGYPWOFKBjQlWd8VzInvERkgw4wlpNBYRdGZmHVN1C0oQ6vtH/u3zm4K9TJXUR1P32Xs
         RLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL3plmXZqldT/YeMVDjhY/Kq0+YZ1eQE6aoo/qCwupsLvIK0mk1Z+aA11TzUccENAGo4yZ5KqQkz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaCyLZ07WekY6PymFtUcpHeQQCpeVLGEOIBTwOXJSjhfaFfOv
	d2xMu2dtldP6gxN2dKfQZsyROf2jfnVYI1JVai0Y9PekF2QwjluYb8NS+Xz57G05rRg=
X-Gm-Gg: ATEYQzzaenX48tytumeAtTj6/KEaxhnSllihCzmuxMJAomEd0olK4Y6e9OBVBQSKiac
	iBLqZpnYmuXil2yZDASDdGnZsm3/9XX59kaaMCvRRasQtUV1zetxmIMaNOl9bwivlD3IiFaJuyw
	z+RTAoz3C+bxcHplhlb7Rvwcmc/19vfvhi9s0PLTzFiXm92mzyWKRiA9L79PCyloyGFM7zRXXob
	C7mTITDveS+7d8vnVs/5G3aktGjQi+J1foyVVRNfYADiaSOC7nQ2B5gVrtz1oJ+wHfmsEoK+6PP
	KjdzcJr2QiJYFeVUGJS6Vdxeg6QOzzoEZl8bUr9hivAvbjIkCW3WUv7E/WdkbUvl3zEWy46WyBD
	dGsaEdSlyiDarmqv34eFI+I+g0wJIlg/CmFZn1gqbQnrTwzDsnyKIzbVH0WezRGA7rSSFNhDurv
	FrXwkqaIlGqynx9LLnm7qRY4r9bPUaATvHmrRjBkNbct49byUiCI34JJZ8h17lHwmIorqLlFD80
	o9QlqXrA70cwc5B
X-Received: by 2002:a05:6000:608:b0:43b:447a:11a6 with SMTP id ffacd0b85a97d-43b527a0871mr372127f8f.8.1773770892007;
        Tue, 17 Mar 2026 11:08:12 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:11 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:07:58 +0400
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-1-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=alchark@flipper.net;
 h=from:subject:message-id; bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNGWxX9hHu/TwgdqBXVCqw4uu3hAfLto+YSe6Y4V/
 iZeR0tOdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVdVEM/0NfeRv6vWLZMTvtw74F/0IO1V7YEBDr9utKA/e3c/67I30Z/oesDEj
 NE718LvnIupknltQoM00srGFWk8jRvWsp1/pEjxMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-34969-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AE5BA2B0BFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hynetek Semiconductor Co., Ltd. focuses on intelligent energy control
technology, mainly for the intelligent fast charging and digital energy
fields.

Link: https://en.hynetek.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5a806faf7170..3ffb1a8e24af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -747,6 +747,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynetek,.*":
+    description: Hynetek Semiconductor Co., Ltd.
   "^hynitron,.*":
     description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":

-- 
2.52.0


