Return-Path: <linux-usb+bounces-37486-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ANhAOXiBmoDowIAu9opvQ
	(envelope-from <linux-usb+bounces-37486-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4854C10B
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F44930913E1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C8343C067;
	Fri, 15 May 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XVBLp6dG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3942B72F
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835753; cv=none; b=Q0YuMTwo4F7yAk0f+H3xBfJnY+NR5IzwCFih3YjIlMGFPBMurrIA/uQ4/6yT5oPbjEGqK/kzQhESGJ/8i3nQElRl7bUBpiMxr23Y2PdD+grS6Wvb5c+NOBJzjW0OONDfGalNSH7BdMu8gEnNs51u+G6NR8o7qlTIzuYCg2jJyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835753; c=relaxed/simple;
	bh=QRpARmRr4aby8NmbN5psePJT0Yr58c8UhxRZ326x/uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eM7PlBZz852/Fan+QcQn37coDDO/UNVIJKGKUq0ZbHDITg/1nDyj8ld3VI8fKZnny5OWW5hEmKdwlgSD0Czb3lLDHiOUdr1HlW2mRFvZ7qdvHi27OW6qm/xvLBBjK40K488CX7OzYYH7WgOPt0piGcKmu1qnRfj9+m7UAoeiquQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XVBLp6dG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so7142699a91.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835752; x=1779440552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=XVBLp6dG2w7uoyWmBIp0CYnnZjzHEo5WWhiovnBtiqtfWfWsFkeB8ysWTXF7+3FrXi
         nacf+BfQBjFV0t/UnuegJ8R1AK3vR7Z5gNksPxUHh0wPDNMKy9DJQ/JoI6ERLFHaBRko
         rzOSjwKD6bz7wtRj2BDy/wgaxwuPbmAQGNqP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835752; x=1779440552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=F990qBB75KJLz+e+1pjRV3suF4gHEKAImCU/Xal/Kbtj+VSe0gCNlLdAXv2f/636RR
         c3z/pbfT3VwC1hpgQhH4DFQZBRcC5aPxRBl8OXs0o8p1TZoVGNvA/0y7qfSYV7i0GKRl
         VC2l3JlroEEHn/ieaw+TVJ9xWT3j3e3f5cYNIQcL48WLdvQQ4tGTUvvEYBNh6odDTG7D
         oUMUS94cgs2yzWh9tg3uS3N1wXBT2GVF6EP+kE4gk5F5ZoJzKaCbkwbFyCiDq832hieb
         ZCoDzfnyM1HkfZCAM4q+RoaxwszFi0LlOYBOb+UCuGO4l2+sikx+JiKJsf5CpNQDLD8h
         fAWg==
X-Forwarded-Encrypted: i=1; AFNElJ+hoyaKGjwsXua+Nh/AtASMmOx/Aj16MrX1ZvMZXJ8uL2SrzBtuEPLzeWoR+KKsOTbkRv0Y0Xtu/Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxCvMJB0UQ4i+v0rN+e5HN8j/3djAlz3PfMkVZgr2ysGa0rJU
	puac3JkT8VbYZUFnuCftsID7WiplojNMwUaFk/19hCiTndmMpE0l1pwO2MZvq9VpNg==
X-Gm-Gg: Acq92OF8M1Gpcd/wsdZmFdfih7uuqTD4Txopx922p8aIuqzZ10i+TpAVfJ3aHLxQxCZ
	/bqqAbtkFAi1QnsXkqY1njHPT1k3gnc/9ZlikE2Fr7yWpUhP3rjx9JOYmI6uy+sHg3S8VuYEjnd
	7jvlv/Kv7VoNit50WIBhCyBZtgg84mskvr6KFMLB8cjZ86iHmZ6hmuyjoUpY2+22mjtYcflOZcH
	cFyAd3p/6UVNGXAm937Puo7BR1chzDjIsn3z0iBmuiEiVuvix+1ujZ/YJ7fPPJRKm1HVXBKBpws
	iRkk/QEtpGbHFCbgczzdlDSOOVJpBkwLbchX/AobSDF99q6zOTnXMZ/CdyUr24k9KvU1mI24ouX
	XFQBT+EeZn4EJPj4uxmzgjGegRpN2dW7qlvWtcRB6dPhAcFzOOCHb3z+bcxuXCiKJJd2oJeSwr6
	gpGPMsuvakrtZZgiJEVyHIAEAdjrFhl3d9kcMtMPzVxjmR17Ic4h6N15EJIQ8WKDtearbCSroE5
	XK0pn9a1BboE9hTBQY=
X-Received: by 2002:a17:90b:5784:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-369519dfe40mr3451397a91.8.1778835751725;
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 07/12] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Fri, 15 May 2026 17:01:43 +0800
Message-ID: <20260515090149.3169406-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 94A4854C10B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37486-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.54.0.563.g4f69b47b94-goog


