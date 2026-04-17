Return-Path: <linux-usb+bounces-36287-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBzsBqyY4WkdvQAAu9opvQ
	(envelope-from <linux-usb+bounces-36287-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 04:19:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E10364162EF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 04:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55E56301B052
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 02:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30824148850;
	Fri, 17 Apr 2026 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1wXakc9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AB7192D97
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 02:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776392358; cv=none; b=IE1e1su6SXLryaxHXyvNi/4GRm0HoBUvPj+5pXJN/tbEeY5GmMXRb2QMl54S/J585rICYYaUc+gWesqVIrU3f6Pe3ifL4tE0mEje4sNL2xef0vyWIRbMnyTxzDmwHSBoNy9mgWG53lcGbHNH3Haj/B7hl0wWwt7L7TBqX4X26aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776392358; c=relaxed/simple;
	bh=BO2i1/v+gTWrIcLiVciQV3wUwpKBs4fxw7jV5qK2atc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLbuqIZQN5liVdqesyMDYdIZUB3e8MxVwoNtDeMo4/W1CNmDonDF+PYIiynCgSlp99gLiDwmaXHdLhQQnU54BqRslH61dXZkEgctsmwg9T/DhwmNxe7m4gNILT2NlhP3KmeOoUuK/5rg1DsXtE9mTwPlm8708FOzQAOFOipVFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1wXakc9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad21f437eeso1268395ad.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776392357; x=1776997157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=J1wXakc9nowN9rQu/XyKbQemkmtz+NmL6BxgMjFC3Eq0/GTnFicO01cMReBfL4fVEK
         zVsB5Gc59QBSu4TOuZzSrUgitzcIS8IsbLUQAENU0cwImck/pX1X70/DUMkBeaR6qDLw
         fyHbmkc46RensyacCpopXoy5mokxepy6ihcJ/FAFzpjPO99kmMNA9x9rvi/PA27aqdOn
         nGhvGSSWUaAOMmGU2O3bdhMA0swW21AdGsoy4FsQfVXH/7eAFUG8vcTvcvgWdd/Tbq+O
         akztTWmhSNiN5+bCdd2sjbSbcRL+5GbpmWOvsk0uuj0d6/W8SSIZhHVPMs979m7MwzYw
         vS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776392357; x=1776997157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=q7XWktl/ODIbijNuQ+RgHlGDfDxQo8YkCBnDozzriPAbBMxxTWGmr7CE+8iexiXNkQ
         ZML1M0GNhouzp/+lURCmbZ3r5LbSkkAPUNcrIyKbkfoRWgVMxRJ+gDFE6tQkdRPBJ3KS
         w3U8TqKInNxA74CV7QL+XzQq3Vxeo2D3hz3DOEfjoJPPUEo1n6oQGKSdbSDwZYRA/dC/
         YD84gF2KD0PWEmHIs31sXZq7KwYKdBu83x/jwMmy9iXbrIw7VirP285OKGPv0rZyEAYj
         /SJpoCQg1v4XpIiOYzFQKJKLlCsZruZh/y4pb/0cLCYUtDObXUSG8DFfbt0C44iijlpr
         gaag==
X-Forwarded-Encrypted: i=1; AFNElJ9dyciUCinUBWbJ6SVa0NRySZwF9brZTYmIpUbq4CiLNip6pSeJFNf2HEI+AgoHliaPKTt+GnSgDwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PBmnf6Iyb3ZJ3g0TcOPhwJBKawpDUk7EHfh4UeebtvfMAceR
	JmbMtJT0Y/pxJjflEnWeezrl3B5/xUtyHEXZflGOOFRrm7zYnnhiNCl+
X-Gm-Gg: AeBDietcDz603EUWHcNShvm76AfLoxVOK5Bl2QHoq9WxbpMQ8nXPH7GUjN3BSxFPUzu
	a4BNn3zV1s/x1hibf1ndypcN71BRf/osLEg5Al/PfeDnTghyLLHfdD0+Eq67l4SKj14A/DEZHrX
	NXqr1TjbMqDVuyvMvJA9Pa/0qQ04lFo2b2dTFJJE7aoguExa+XnS5iKIzB7ILUwnWU4s31UiwlP
	9ccsTjsXXScPW9ft/u+uzf2wUxVW387h6ljNoiGs9k7/6zkQbqk0NMV09xSHIaGYJImnZHetkyw
	BCCOBoeA/SUJPBLLDsFLSoqGDH52WW/eBnztUuTYztdX4wiDU2CuG2HoOMnp6TGJIXuWMYj4yS8
	YZb2TRM3hULvPFbuT2Yn3iFTxmmB8GQVVX/RuJOyTr60HfoWHmb/LhgLS5GQKFWa2Kl3jw94Hlw
	0RG3C4q6UxBN87QJ4z85LKIxH7d2mz0SDhs9pb0BSEdSpWGxngr4Vvpktyvp0s7xvPYiAm
X-Received: by 2002:a17:902:bb96:b0:2b2:5168:2f82 with SMTP id d9443c01a7336-2b5f9ed4d0cmr4664685ad.24.1776392356836;
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm2755845ad.36.2026.04.16.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	lee@kernel.org,
	heiko@sntech.de,
	gregkh@linuxfoundation.org,
	linusw@kernel.org,
	zyw@rock-chips.com,
	zhangqing@rock-chips.com,
	gene_chen@richtek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
Date: Fri, 17 Apr 2026 09:18:58 +0700
Message-ID: <20260417021858.6582-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36287-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[shmanahar.org,gmail.com,microchip.com,bootlin.com,tuxon.dev,kernel.org,sntech.de,linuxfoundation.org,rock-chips.com,richtek.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-usb@vger.kernel.org]
X-Rspamd-Queue-Id: E10364162EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. Remove the redundant 'type: boolean' from the binding file to
clean up the binding files.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml   | 3 +--
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml  | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 9bf07acea599..26ea78df27c4 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -88,8 +88,7 @@ properties:
       - 2 # ATMEL_MXT_WAKEUP_GPIO
     default: 0
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index 0676890f101e..a58d9455a1a5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,8 +44,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..ec0d83220527 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -33,8 +33,7 @@ properties:
   vbus-supply:
     description: VBUS power supply
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   connector:
     type: object
-- 
2.43.0


