Return-Path: <linux-usb+bounces-35056-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF4PG8y7ummqbQIAu9opvQ
	(envelope-from <linux-usb+bounces-35056-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:50:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30F2BD880
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E123306460C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9C23DC4D3;
	Wed, 18 Mar 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="hspEZ5/0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE53DA7CC
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844398; cv=none; b=OW8j134NuhbTRxgZlJ6io3JAurtvinWmI7GUTc6kHZIMWl1Wq5BSTYKQEcOtPHf+fAnJPdvaTOravY6MQ3jynp2sdlZcPnrTQZM0Ax7daOnI//MfEOB5f96apVrm2nkesinvUOMTwTyLgZOT9v42vXqMrUj1wpleVYbhPWLdE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844398; c=relaxed/simple;
	bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2BrL4xRmHEeLcWaU8h6T3JRxcnepHn4rGXlvEAbUvC/lYV8cxSFYlVPrSWftcLXkBUCd1CmB2cRRDeFdP/feAre7x/pkfgo3ZMd9qnWU1YqJQyyhsJAeo/kGHajLmDy0DJro26qBVbzerfNAwloAIs7XwmtCqcxX/qXYcPk9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=hspEZ5/0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48534237460so74031885e9.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773844394; x=1774449194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=hspEZ5/0KXR48ulicGhIDKAuX54iDCKlzIVaYdc+CGbUiF7ZyjQcecZpPsvFiKDGlz
         ueXShCx5A2PsNVX3y+LGkIgFvDNRYjzlYnC7mTpqh9goI/CXX2wbTjE/QilMo4Ow66Sf
         gP+EaO2kuhdhApe6rt7kwAb6NfOU9EvcGLTi+pKG5gMLb9eVhVluRYtUOb0rqyc4OoDN
         keVsjB2yjc0iEeB8RjNCOwnE5fB3Uv+ueKjUjoqDu93SwtXjL7biwUDghehyCxwNkaQt
         iZlbUXOAQwXN+rO54KH78paj54uywEBDsUf2tq7Am9TBZ8lJ1cBd7a3O+xKuOtanEy5A
         mGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844394; x=1774449194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S9sCFNxATE1UQcKX1OKooIck8dS1xOFB94Y0TqD1Dbc=;
        b=GL9Zif2azq8jYgYpcVGvKcvJ8L0KJKceCvY9iu9jBrF70eq639bEv/eZiDM7Ah43s1
         YWzvGmaoCH2TIIDTdZJsyIg+rF2cMM+BjrtYsTGtdzEKboKpZD6DboeN4jXQFD35Cl6q
         oY6seD5MCI7od8ctZ/+nkMT2qOP1auQCbj1G9k2M39aTQFSz+qOm94t04ilu/FVzTbXl
         ygrPs0mmRMrtnsb0pfd5qw1RrWlNLNAPYq1khX2Knq0BMgTF/iqR4/pirYcTIIAh9rOc
         K1BrcxrDMZEfp1vPDTcheca1NAnuJKpuS29X2/4l5PjdC++aoAIqor2gT4XmLO/W4jsZ
         FQTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8t9Pgwv2bOuiIrGl1YhK5Z8yHjgyTvOvCvdvx2vIcKFN1WiTt2bXeCCrh1qksx3sYQm9Ep9r/veE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBoOIB+Zcy0JMs0M5i8xYOvhXpu6lBlehOz9o4NX3gpuhgGKw5
	h0W6HcIuvl2Iy+cTYXfUqtrOZ0UEIUaol1G3WHtIN13Iy9k9zLcQuLGfwUOS0w5Q2s8=
X-Gm-Gg: ATEYQzxPq3AMZAHddApNMqphhD8Vzy3YoYt64lcF2+1Ze2D7yNyjnC3ZU9ftahBjhh6
	bHeNWVGZwoOFrl4z1Oy5bDQGqRLbjBTvMBHX3AByVBoT62iZJv9e5RI5Rh9NVJLK7qdigEFNeyp
	IfMqbGpJd6d3Yf1OqBrZWiXvueR4fR7vlh+zOSjG/1PYLpzMdbQ7mt4e6m5FgeQc8hTqKQj85Pj
	/aVojImnw9P7MPt9gnuUa8vAQsaw8iZ59g5tpy8Ce/K+Rujiqh5rEU30+vKnHRP1UwbMd4Zj7BX
	YfJe+P2cMmA2QhVzEJnxe36qYO2qBpaj0OMC9sQt6XvHFSkQZVT8CPoBrp6Acyr+o2pgoruMMZk
	Y3FFLjA5VyBcvNdL9TA7WVfOkRzdOiB+obJPyxgYh7LeYE1w4k2rqqq2lkKD/cHnr2Lsn60AC9u
	GMBlcLfYNtJ+EiyBAArahVmGP+B6eOVdFvQHXndx9p96bSvivgNB+027DY8HyV/cBaOBEg/VlZZ
	rWUGg==
X-Received: by 2002:a05:600c:3acf:b0:485:4438:6ef6 with SMTP id 5b1f17b1804b1-486f44435eemr57308705e9.18.1773844394264;
        Wed, 18 Mar 2026 07:33:14 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm270642085e9.3.2026.03.18.07.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:33:13 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 18:32:53 +0400
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v4-1-69e029255430@flipper.net>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
In-Reply-To: <20260318-husb311-v4-0-69e029255430@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=alchark@flipper.net;
 h=from:subject:message-id; bh=T+J1OY8trN/7RzkbAWgyzywsuUmbTSqBleeNAx93u6E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r7kzYviGyXduTk7ey0XzS+bNjFVv7SWWf9GoGYDk
 /3q59dOdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVljsY/keJNMj5lHBFzBWZy3zEW3gKmxuXhvZb35Rme5s7+VdC9jP8j95a/Xv
 zNd/oetNbPyeJZx/YedqnmmtZWuL5OMNdWc942AE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35056-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hynetek.com:url,flipper.net:dkim,flipper.net:email,flipper.net:mid,microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F30F2BD880
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


