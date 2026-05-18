Return-Path: <linux-usb+bounces-37623-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIRaLpA+C2oJFAUAu9opvQ
	(envelope-from <linux-usb+bounces-37623-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:30:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD07570EDC
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E1A4307E296
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C62948AE34;
	Mon, 18 May 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv513+di"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E853FDC00
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121223; cv=none; b=fuoTZME2Ps/nh0CSLIMo2qFXWbwnE03Ad5TGT6aLDQ+aWKj0QFnWHwbn4FMVCR6vHLeFCAm/EQP2NEy5HziAO/S7/7Gpj2aPe0lzSRw1gW7Iqfg6N/CyzEoj0wVslDixmQdZZouOxv3nv1NUGZJjQkB0dUncaWL3N7CKwPHqLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121223; c=relaxed/simple;
	bh=vdEZEUOs7PRDXYhwPRYrWKYpoelBDrzxoSmk24QTQgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXDdlOzDBuio1SJ79YjAiEZ71hYnT6ivfQXFhAW6I7EYdaG2kD5Vk50MIxayeGO3hfhk2kiYQvDUnQivdlkiLwJQO5iPy+OWV2QS+ULvibvmiSaUX8ooGBUVW6rII6CZm44MJ2EsGWNAHRtUGfLw7AH/HDodvTiUG+i+sx85h+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv513+di; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c3ea2ebf7so2920965d50.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779121218; x=1779726018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm59fBho8TSPcttA9nMtsPpYbNTzkooRSqlhl7WTUa4=;
        b=Tv513+dirocYuWNp4yWdL8GR4535jqc0dO/0/qCymsboV9Y5nmmcgYIT8IyGzFrsit
         xvITzE3Gcl2rnpHkWtMcADz02YxnGzWqzgQPdGOEZZ4xxOqfTkTcKRbVW6XjzYk8mjdY
         0TYmjAPr9bG9+BCZz1gXF9CM/bupATQ+9WY6qnWeGOt0FdTiFIw5d/Mf1Nx5uImg2nNh
         +7KIpChSccZ6YmZtRtbb3OFTZmWFU9432etb2kem23n8U3Hd3XFfoLMLjk3WXcn7Cmmc
         nVzFXSmrZgwVes9JtDBU38a/brgvqbHawkcrXciZ3xIdyTdwy9iG5p+hS/CvqiU8xulD
         +c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121218; x=1779726018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mm59fBho8TSPcttA9nMtsPpYbNTzkooRSqlhl7WTUa4=;
        b=d+BhwSVvcruALK1uF3MaaGOhrHEFuXVgI+GwnFrhxDZXJ3mmFRdLt/LwmvwBIGt7iF
         26o7ez4mqZ5JIzpNdsWvSygs1mimhJZK2I8xllXMEvV4/Z3PaMcxRyp2VB/horFPqtY0
         e6BazcrG3v7IElgGpVICieBlULZFiScEbOZrIQlSSywc5BwuKRFw92eA0JK47+tqqP68
         dpzar37B4KvlGC4UanRUo5MgiYCB8KnVqsyyx2vBu3sm/P0FtNmUbempxnF5fxxxgGH8
         o41Dll0LseXPx/+SeyJJgNnAGDQKhb+fBUWlCryruPImYEUpM/W8yVE+9OolAuERmNph
         otkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JLnxKkyKPn3Vc9to6FE58MKuPxz/nWicqv8HAoh7s2iva3sGnlkxDHp2y/oIBTAZBK0xiEowyrX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOC+Z8n7ZUDKDFwIfDR88RLdcnqQtxA8Zcnfa4r0j006w9n5e2
	yXTCu2CV52Tlla5oFa+9NJz6VTeUNGqRWWm49Cag+56Kz2lNdDZYX9bf
X-Gm-Gg: Acq92OGj9kGr+nzavNMvzFUKR4tCsBBXVfCbjz/wUajHvi5J+EhGube2MkkWHUZ53hq
	dzww1L0IM0IMDCsZHdUQ5uULGuu+PWrRfuU6EyvquTGJyDFU06TmEcObFBNJZErCvVKOioOYENY
	ypEpXk9BMWvGVZOTHCcbPP9z3SlAfJ0J2bSp1Z6TnnAVd523At9PxVdwGvSDs4fcqacBzjwiQtN
	phgnqZENQD2yl/yYnETc9ZhC5JSBdd9sq1gxDHQegf1+2Q9/IFYnzKA3nI1LlDgEcrLv558FcFx
	gS8xErvYL3grKfVwXHlSE9VBF7rJ0mcV4Wv5KYvvdgmLKXEpW6TgKZQU2VfOSytZ97Ae8+TMTGN
	PNM18BnLGyOrTzywJUFVF0vxTFC3gW9xw4A/Hf0MHpNx9j8aWfzVkEtUD2W+uJmBie2wy1Oc5o3
	t4Jh+Ed+k0DvNAheeLqLWNLyzpPOchpDdkIgah7QzwSQ==
X-Received: by 2002:a05:690e:190f:b0:654:c2b5:b77c with SMTP id 956f58d0204a3-65e226632f7mr15134957d50.7.1779121217793;
        Mon, 18 May 2026 09:20:17 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db60379sm6596021d50.14.2026.05.18.09.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:20:17 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 11:20:14 -0500
Message-ID: <20260518162014.18251-3-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
References: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37623-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 3CD07570EDC
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
index 7ded36384..05ffc33a2 100644
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
@@ -108,6 +115,12 @@ examples:
             };
           };
         };
+
+        port {
+          endpoint {
+            remote-endpoint = <&usb_role_switch>;
+          };
+        };
       };
     };
 ...
-- 
2.54.0


