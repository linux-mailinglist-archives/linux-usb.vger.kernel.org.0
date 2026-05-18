Return-Path: <linux-usb+bounces-37615-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JpaIT4kC2p5DwUAu9opvQ
	(envelope-from <linux-usb+bounces-37615-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:37:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FC56EF81
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12354307CDAA
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F648C8AB;
	Mon, 18 May 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgzTHPlF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37905404894
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114547; cv=none; b=ffLjUXm21fxFIzGZKfrSTp9nRcOImm9vIiIVxCDD00ibdQudSAPMQ3yr1efbhitWvUzgBAhijDRtWF76YRTIGWnSaYPwCM/5bLfWdoMmHFtibBbhgQWDrgMFud2O+uF8r7HU2JO1z+hp9mescJluAQ2IuhLCf/QTtoPwRFqrb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114547; c=relaxed/simple;
	bh=jZS0cfoCx0fWKIraDqZnTPmyRkWvp91bnw4H+4AY/W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBFUTDIae953NcJIHTKiehbIzevhs1Om+Rlm8Wlr3Zk5jYYSkloYiA6AmJb8VklcdEgkCLhBMqMLHeBaPOi+7Gw6PUDVNLy53NTur0ypNzaKWa1VkkW0vX1J258Q76uRnKLkJVpOrdBJsxIxgnVfEQtbUazQwmCYDDi7lnvejWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgzTHPlF; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7bf1eaba464so17000187b3.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114544; x=1779719344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InSESvH6SbYX4PPIUX4JXAvnZujlKzjBMLYv/0HgeqA=;
        b=sgzTHPlF6xeBrYUZ4oFlgbUDzPsHmVY8wZSfnEjI2L8TBcLBMlCUYvN24+/bnI9YC3
         dZM62AatoZjZ8nJqqBZ1mB6+8gxR7Fh3DrYcFfpg9ilXk/EBIMS1+Uamvj81nJoxkE7X
         lEJpbcJmcFXn5bzKXfMkGfwu2DFiLgEJWBuEkl2+R8o/vD9PgtVXdqgVkNwtlUhJSa7p
         d/UX/7rxE/uqEDD3wyQlEgvSF4w8g52LepAW61pvrcarXI5sIhGBWWppFTb/K3N/3Rwd
         wS8v015TrosoklOd3r47BBswIKFEM+Oel3cjAqaAlsgFmUPNIOT6RQjL9yFHB6sVbQov
         ipMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114544; x=1779719344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=InSESvH6SbYX4PPIUX4JXAvnZujlKzjBMLYv/0HgeqA=;
        b=oNLVlQ8rt/Ki7A8wehcpTF8I7z96kOYavo8nwrT4vuuJ8PnSE2rUJoXYYloz3funi7
         n6kjaUT7NEs17bQRj5p9J/1aDWlZ7axVxiVP4Qnl8L0unUvnNL40OtGDyebDR9b8P/vy
         L9nLIqc2oF8BKOUVSXKToAbFGgf4bSJ+iCPB6yThKRB0/F7r0BPydSITgBIB3+HSu60b
         xtNtRcryCQAuvtxWjpgzRCSTzyLpq3rE+yVWOSGTYOprbtiihLHTUdPdRVq6sqMLkjax
         cbmUqSQpmiwnaQ9swXTKTuPzfnwSGK4wSTabRUWyQXXi0WwvzZksEnpx4nA6+X4qb+eq
         7beQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I7TvVpnJM5p5qd2alNgueYKOM6931n08USRSuB90bDq2XqoTjj1PYQSWsV94SHH2lapRa/8y4AXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywco2r6i2N+gTtXpur49ORv8Y6A7P9okz0cGc178DioIAG3aI7X
	uzR027uF6ZpFFUxyZM43hp+G9PisJybktzRrfEnyEjtaw77PUMbrOcr1
X-Gm-Gg: Acq92OG2xji9wd3AXOW/G/QtvhqmcX7B/lSeTSUADfaT2rHuy0ASs6hMAlLCYeMcPRD
	NieND9fRPw66qy2wVsugzq7gAEs08gDPTc8EPMidQngTUjIFWuBIN/ude+Min1V9hk71jiR0Tjo
	qk5BKnFDqZLe9eRjIGCpol9uNLe9hsfTVNDcHSCOlOCmhchz0RBUVHVXLOoWBLyOEhQq2jIrzPY
	ZY9fOiuW6EHhNM5XRTDImP9fmLVwcIA2fc6qi8MBIz5jc9QCQH3jPXTdRo9owGqGA0TKn7B02EO
	pIgY1zoMDucQj5smIz59/Y8qG6xWlUwd9VMsoDUzoFrVVyHonIsx1aPSJSi5BXhzlg2SLMbXeWk
	Al1yScM6iAJfxHlVUVIfKATBOzWabsx1Iry8NGA+OJxS9n3GlCHAryCNWWobKDlowjOhkyCBcsI
	tYlCRoi7Ksamb3RqXhn11taxJw7jJWbymAM3Rd/IptxQ==
X-Received: by 2002:a05:690c:e566:b0:79f:7972:f89a with SMTP id 00721157ae682-7c95bd1b4b8mr135891887b3.28.1779114544188;
        Mon, 18 May 2026 07:29:04 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc997cb156sm22094067b3.18.2026.05.18.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:29:03 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 09:29:01 -0500
Message-ID: <20260518142901.1747-3-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
References: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37615-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,4e:email]
X-Rspamd-Queue-Id: F23FC56EF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The schema declares 'additionalProperties: false' but omits the
top-level 'port' property, which hi3660-hikey960.dts uses to
describe the role-switch graph endpoint. This causes dtbs_check
to emit:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
  not match any of the regexes: '^pinctrl-[0-9]+$'

Add the missing property using /schemas/graph.yaml#/properties/port,
following the pattern used by realtek,rts5411.yaml and other USB
controller bindings.

Update the example accordingly.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 .../devicetree/bindings/usb/richtek,rt1711h.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 7ded36384..fd7f29179 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -52,6 +52,13 @@ properties:
     description:
       Properties for usb c connector.
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      OF graph port describing the connection to the USB role switch
+      consumer (e.g., a dwc3 controller with usb-role-switch), used to
+      convey type-C data-role changes signaled by the TCPC.
+
 additionalProperties: false
 
 required:
@@ -107,6 +114,12 @@ examples:
               };
             };
           };
+
+          port {
+            endpoint {
+              remote-endpoint = <&usb_role_switch>;
+            };
+          };
         };
       };
     };
-- 
2.54.0


