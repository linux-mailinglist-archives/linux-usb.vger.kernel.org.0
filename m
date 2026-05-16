Return-Path: <linux-usb+bounces-37537-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCnnFcFMCGpqigMAu9opvQ
	(envelope-from <linux-usb+bounces-37537-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 12:53:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B178555B38C
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 12:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F13301A937
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D14D3D47C4;
	Sat, 16 May 2026 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="k9+awQhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from bumble.birch.relay.mailchannels.net (bumble.birch.relay.mailchannels.net [23.83.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91D39937B;
	Sat, 16 May 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778928805; cv=pass; b=K5yyn3AII2ntknI81YofdBzM/Drm/eKgdim0m7ULfTRV43tmaZ6hbFtSRTQJh0tB90KvTOJf+bTtN1Gn0yUgmB4Kjkh2Xcnkk4wCg0vkZSV9jXpKPnIw45hgGBisJdx9VvxNDfyxe5AYooFY81D4ScTInRsfoXKzXUrWxzal0vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778928805; c=relaxed/simple;
	bh=EvlFNFL5qYe6hGJ5zak/zDGnwmqF9V8P0Xwz5Os/PqQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=HFgtpnGVc0vYmkVeywcFbvTUw30F1SQlZCkNHqYtFKblMDbuXtTsLgh2PshKO6RwxiyMI3rCpivWtlyk4oZddCo0AVEG4kCrqBhHAG5b5rqdP4qgEGfQ2olBhaeM811Ng1ZkVuedw93A8MmfoqJm8gqxLT7lQXepwHfwKbfHLOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=k9+awQhK; arc=pass smtp.client-ip=23.83.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4C2CF4E1319;
	Sat, 16 May 2026 10:53:23 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-98-15-67.trex-nlb.outbound.svc.cluster.local [100.98.15.67])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C63084E1145;
	Sat, 16 May 2026 10:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778928800;
	b=zxfnjuUXWimh1WEHeEkKTM2I4aJ5j2AiwjwxysBzK3q7iRHzd4yI4JSAlCHKCJBwCYrnzF
	EL4env8zSqJtBFtAKk95zULyNkhm6bS/eeCfZJxKvOxQ6zDMEbr3GQ2uIdddQ+6geM1+Jh
	oJcKwjETZ24Mwo734xIbO7/Tw7ZUrLCmmn1MAbTORUuCF6qXoHNCB3/6jtxBVDricP9u03
	JTpVzArPYmImmH9aTTiQf4V40n68/Bn4GYap2uSIlEIwUi4//Jk9lnnoRXzLHhZvXK0X5W
	1X8sqCro8+5SnOHuv3BZ3JqcbDwr9M5+lpSontqb/20pVZGcZbv3zVX2bC2efg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778928800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=4M80wcRFRdldUMVHV+1auAZaTo5JHUT1ayi0K1G4Kyk=;
	b=UZZcDuSep2ujJiRMSA6nRuR8zkDka29kfvFkiOu7m1SmmgrdPzHVk5IZTh3s+frAp+IcCr
	OcT38qz9J1Ip0cbSE+XodfTB2hnUH7r6dQ0IDFVOrqROvFVbzzhihyrzH4sO2ohBqiqSKF
	30eqoz0T9qM0Psxla0UfhzPJ6Pjj/LraYhFLsq2VYq+G320C69/t9we2vX3SHpa7GNCPqu
	aCYO1VDEO2vPNPNmS2G5DmlyQjJNfkE4wKDjeUcXUThGvqf22fm32RsY2rIeHmfqu/3JEl
	srK7k41AlsGeYv+Zhi9jphH0cJTFQyx3gk/8z0Q/3KfSCSx90dlvcWqvSxzeqg==
ARC-Authentication-Results: i=1;
	rspamd-5c5444c55f-srnxv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Supply-Vacuous: 391faea43c85d4a4_1778928803093_4123370979
X-MC-Loop-Signature: 1778928803092:2594299746
X-MC-Ingress-Time: 1778928803092
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.15.67 (trex/7.1.5);
	Sat, 16 May 2026 10:53:23 +0000
Received: from [172.17.0.2] (unknown [125.163.200.11])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gHgs62rP5z1xxw;
	Sat, 16 May 2026 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778928797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4M80wcRFRdldUMVHV+1auAZaTo5JHUT1ayi0K1G4Kyk=;
	b=k9+awQhKaRrt5WAmGsprRH0HHO6XvdpSoyVMA1cmwGCkCeXejGLzEBhzJwyGwl4NR+734j
	dAsiDUDkm5duIGIpbfs/KrXDerAVggwhtc6JS3Ub+FSgbyigoTueihpiBS2jKaag3bel+q
	T1W0ziKJkjKwtvXXA68HicmGXsei0tLVhQg7va78GpOZBsrGTY77jjkonQlEfZ3usa8M6r
	2z+madNRImsxe1SN1AHdQSK+tiu9bEJRkUNi2ABuTTTjo6U6FhqMnbE1r3VAJsLJblkxng
	Kvw4hdindriJGBn2c5Ulec+hmCy3Z/f4nrQh7jYpW4mjy9HG/5t7aIK9PAW8MQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks
 for qcom,ci-hdrc
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
X-B4-Tracking: v=1; b=H4sIAJJMCGoC/4WNQQ6CMBREr0K69ptS0gquvIdhUX6LVKTVfiAaw
 t0teACXbzJvZmFko7PEztnCop0dueATiEPGsNP+ZsGZxExwobjkFbwwDIAOOhMR8BGwh9a9odR
 GniquURWKJfkZbYr34Wv9Y5qau8VxW9sanaMxxM/+POdb7+/JnEMOrRRFqZq2lEZfaNC+nyhEO
 iaF1eu6fgHJ48js0wAAAA==
X-Change-ID: 20260509-qcom-ci-hdrc-clock-fix-8ad5790ac636
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>
Cc: MINETTE Alexandre <contact@alex-min.fr>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778928794; l=3228;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=EvlFNFL5qYe6hGJ5zak/zDGnwmqF9V8P0Xwz5Os/PqQ=;
 b=NL4pUFBFokpG5mWm/WZ0cBJBPvxtS1dPlvrbpfX4iB0obRZ6l6h2JVMBrg/ksMlWYm5XIf7yK
 5u/7Si2YY4TCA+suxTdqHvPw9NRrMkP8Bdb12cy7JPXFV9k47yLQ/aF
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 16 May 2026 10:53:14 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=6a084c9c a=oT7Jj8hHNdDiqa595b47Tg==:117 a=oT7Jj8hHNdDiqa595b47Tg==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=bC-a23v3AAAA:8 a=dH9NZFB9pYOLtSt-TGoA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=QJY96suAAestDpCc5Gi9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-CM-Envelope: MS4xfBhvQF75CsiQCMnTKpFwby4XDa6qbq+Q8Q3H4LqHysAxHCyrcW++qt6aCpSN+yIokSvnBU7uoGg10A6EybXzFGdnMleT06DIAaFQ/QTElpFQHnSbjsha HRmDBx4iYZUkBLB8eX2TaXZUgV0XWtZ6+mnDUHfu3XEfeGFv4EdAfGzbkIfC87rBFtY2adYiKw6xd+QaOl5dghElcIUImEURJ6E5oxon/jEbZuvKcRy9xJjY ls3DM/aQtejIT4XKIPCNpRkDq5ciMKQwdo9/+di8WyM+HTf0iDOxBAykFe3rSkDPqvk1iTPRuIe2AzUry0lFJLF9m80hbDWcnNpteC4r25L1V6gGXhivY+ol ijG38/XxFjC7eOC4L+zEju3P8ZzOwqqQx9YHRYnuCBpXo8Rvpot5UInareWuwJqpCRC5sPb3YHY3KLH/reCcuQ89rZVLHii6XiNa8p43PdsqwSblRpJEuOZx eZ4Pcxhl6G36i9bqckMUGFF2yYPDjA+/zVgJjE+bFLv5zBk5YrnmKicdunMw+87Sw/jCBNdxH7XGFLcc21fT203FFLPF2C12I0aJyQ==
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: B178555B38C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37537-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some Qualcomm SoCs such as apq8064 and msm8960 require a third "fs"
clock in addition to "iface" and "core", needed to propagate resets
through the controller and wrapper logic. Later SoCs such as msm8974
dropped this requirement and only use two clocks.

Note that the existing apq8064 and msm8960 DTS files currently specify
the "iface" and "core" clocks in reverse order compared to most newer
SoCs DTS, which causes dtbs_check warnings for these older SoCs. The
dependent patch series will fix that clock ordering.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
This patch updates the ci-hdrc-usb2 binding to allow up to 3 clocks for
qcom,ci-hdrc, to accommodate Qualcomm SoCs that require an additional
"fs" clock for reset propagation.

This is a prerequisite for the following patch series currently under
review:
  - ARM: dts: qcom: apq8064: Fix USB controller clocks [1]
  - ARM: dts: qcom: msm8960: add RPM clock controller and fix USB
    clocks [2]

Without this binding change, those series produce dtbs_check errors
due to the 3-clock entries in their respective device tree sources.

[1] https://lore.kernel.org/all/20260427-mainline-send-v1-sending-v2-6-dcaa9178007b@alex-min.fr/
[2] https://lore.kernel.org/all/20260514-msm8960-wifi-v2-5-7cbae45dab5e@smankusors.com/
---
Changes in v2:
- Reverted the removal of clock properties from the top level
- Enforced stricter clock property requirements with clock-names for
  qcom,ci-hdrc compatible nodes
- Removed minItems from the else case, as it is already covered at the
  top level
- Link to v1: https://patch.msgid.link/20260509-qcom-ci-hdrc-clock-fix-v1-1-f52386bf85da@smankusors.com
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..a4575a413f42 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -45,11 +45,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   operating-points-v2:
     description: A phandle to the OPP table containing the performance states.
@@ -91,6 +91,27 @@ allOf:
   - $ref: chipidea,usb2-common.yaml#
   - $ref: usb-hcd.yaml#
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ci-hdrc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+          items:
+            - const: iface
+            - const: core
+            - const: fs
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
 
 unevaluatedProperties: false
 

---
base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
change-id: 20260509-qcom-ci-hdrc-clock-fix-8ad5790ac636

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


