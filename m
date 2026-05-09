Return-Path: <linux-usb+bounces-37180-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM57FO0J/2mv1QAAu9opvQ
	(envelope-from <linux-usb+bounces-37180-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 12:18:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CE4FF2F5
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 12:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80647301A7EC
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 10:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960813A2576;
	Sat,  9 May 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Ypw0FK6M"
X-Original-To: linux-usb@vger.kernel.org
Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF13A1E7E;
	Sat,  9 May 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321896; cv=pass; b=mUH2zplGoa8lJ8XiyzzmdYAzChY2UVEMsfrM8QSAvTDBADxtNAGnDZt9oMk0dQZpWhNvVxLR9oah0Dgx4Z2C3YXDETas5IpoUBCFNpfEkyUorEJEqEr5TKFW1LJNGCQxU+OpYTaZNHG0AB90B1yb6fuB4T1R77QsBvR+Kvu+O2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321896; c=relaxed/simple;
	bh=Ae03Oz6MCSn+3b26vmABckKdtCuD+FQVcr7L3BULr64=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=YvYz26t19zSGP26jkrMSM65NKBCT4c6qsYqBVgfOaO0cO3Rmr11Q9jmgHBjOmadIAGVT+ppFTOPR92TillD8rFEmFqx+tTqPqhOenDCoCRuTkaaOhEY5WqS9rYZbWMAvspsz1SH2EVtWy8EM71AS2VcXjVwrX6AAmlQfFmkUesk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Ypw0FK6M; arc=pass smtp.client-ip=23.83.223.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0959F8C22B9;
	Sat, 09 May 2026 10:18:06 +0000 (UTC)
Received: from fr-int-smtpout11.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.98.8.159])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A07968C2195;
	Sat, 09 May 2026 10:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778321883;
	b=KbP3/J7l3mzpS8jKVJ9zikWYBVbu2SffrKwbAUyl0ub6IsVvmeEr3TtIljuuevJfqpufah
	cNIsI+ZySVnm4mNQqslES3IxT16NhIz2QSeaEUQx4U6wNLC5paAw5+rUPn0baB50d1uVy4
	H5ADa89Ffeg+lgSicHI9dDSSaGwDm327GweXR77x4fNHXaI6wedyT8GxkuMXpEqTCKeXyh
	/eCX2DfhNyUtmpzAxtaQ1s9KVs+/zSGJie5YB6bW23zW/31Ym+OeobDz+WykhjgyFHRXLo
	r4ZDTUrSdIGYpFfYFa9N9e6VSRy9qydkdiKBADEPByZUCS+2pSp3hli1dn7fzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778321883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=JRwIbdwwsFBG1zeZHZJUr8fkW1KbEdeQx5xEi+4OZro=;
	b=1rFMHK88Wg/ULEItMjHeFj1vZjnMokNwCpn6s67JY6zRZrgifOdZoWPEm4da68cQY//G2Z
	xcHD30KsJ2vCfxPtuxQtH7M01p8UgD93RnX4MeMyKESAJ1yy+wifg53LuQZLCIkP3KcQj1
	lJmJGmkUfopXmUh49O+NnDDFIgHY/l/8q7QfZGgFPwSiSgECliqm4D76rGNChhjH2+dizK
	EA4KcRH6Db/x98Xrx+0FTgl674n8Von2bZzN4Svr7fukA/cjL6toLCDbHzryBWuOKi7G3O
	sL5Okw2avqbGKpt1kJkYeREiICDY6EmCuWpvuGYRmSd4SmITGjnJKVC24Faiww==
ARC-Authentication-Results: i=1;
	rspamd-5c5444c55f-rvsz6;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Callous-Shoe: 78f5c6d677ec9f01_1778321885807_2390101064
X-MC-Loop-Signature: 1778321885807:3112988065
X-MC-Ingress-Time: 1778321885807
Received: from fr-int-smtpout11.hostinger.io ([TEMPUNAVAIL]. [148.222.54.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.8.159 (trex/7.1.5);
	Sat, 09 May 2026 10:18:05 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCMPX2WX5zySS;
	Sat,  9 May 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778321874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JRwIbdwwsFBG1zeZHZJUr8fkW1KbEdeQx5xEi+4OZro=;
	b=Ypw0FK6MexmHU7DSb/CmoL2gusLmASvb3cKYhegxX6E+F7WYHHcmC5q7OHccUmRLaT6XXt
	p6KIofeNNC0xC1UQYmtxjXvdodHSH/KREW92QJkJPNYinIvdqsIF48vW9ewj0DzsGCfCyX
	Rhj2KekGcm80mellpjLuLgPdUbZhmZId6StcBvG06QZMeAm8iz83FnP8+OG4bp3ScYVoeU
	pBdai4q94FCl1ZgSj8mXot2zzV+Eda14qzq7mQhNMXJEbuLHKMJpJs/kmTqWcH9AmHQHwu
	BYApnqSn8ZeZT7hPvJ4LZVPCdydtwxm15djjMS5/qoHqKLYClKMyZixiGCbAxw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks for
 qcom,ci-hdrc
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-qcom-ci-hdrc-clock-fix-v1-1-f52386bf85da@smankusors.com>
X-B4-Tracking: v=1; b=H4sIALwJ/2kC/yXMQQqDMBCF4avIrDsQFdPaq5Qu4mTUadXYREUQ7
 26sy+/B+zcI7IUDPJMNPC8SxA0R6S0Bas3QMIqNhkxlWhWqxB+5HkmwtZ6QOkdfrGXFh7HFvVS
 GdK4hnkfPcf6HX+/LYa4+TNNZg30/APSfZ8Z6AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778321872; l=2659;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Ae03Oz6MCSn+3b26vmABckKdtCuD+FQVcr7L3BULr64=;
 b=hXLcOrN1Bk+KuZgrIY2UGG1W1A0EySRQg2AibuAG6Qvqzdo6y5qaG2CGzRp1SfGIJ1joCFXMC
 CV2TTGREUwFBe4kSsfqsp6a56OAoM3SJO9if3hAzf7octY2BDEpS94N
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat,  9 May 2026 10:17:52 +0000 (UTC)
X-CM-Envelope: MS4xfCJzAKg39dRpVmpPl2fqY2jQxvNw6DTgHNzyl0TN0lkDvLIwr2GZsDyZDV+Wf99IGxN6RT+e8VSv2mp55kpCddn1ffxFtqyvNXqmKsG1+MZ0Obs4yeh3 oBmG1ohgAeE6UMUiZskeiM0eDyPNzkOjBgB/JV1JwFF5zffBbuorYZzH2J41r+ETbX4Y5rT+dy/Z40blw5XqkpZ3C3sikbZXuP+Ef42lhNc/hBR2IzymyPu8 Ktf6O6iI0WZZJflHDEspjKAGItayh6+UJmF7ekriZIAwvm/KdPj4A6C71PF3oCvzoeAFyJ5Ok6kl5esrtMjD0bVLO3sJaAbO7vgusIhaZEtBRj7qgNqvVOsS t3qVlw2mE88whcaTomXwh/ypr6diPQOY7W55VnHo8Wt8AC/JE6VVW+aku8nD7MXQNue1KA9mGSdJawY7xPiHIbWtWZw2HUHpQYZexcv5Z8xIvS4Zn7tWyWoo kExOqghLRgplyhoekcjiXbixe4m+QNgef0AO21xK8p+tQbd1ankNkVrvWYCp+WmP5N8QwyaDOEG+86uC
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69ff09d2 a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=Z8CMZ-RkyekkVbdE0TUA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: C23CE4FF2F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37180-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
[2] https://lore.kernel.org/all/20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com/
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 29 ++++++++++++++++------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..5d18d47efaed 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -43,14 +43,6 @@ properties:
               - nxp,s32g3-usb
           - const: nxp,s32g2-usb
 
-  clocks:
-    minItems: 1
-    maxItems: 2
-
-  clock-names:
-    minItems: 1
-    maxItems: 2
-
   operating-points-v2:
     description: A phandle to the OPP table containing the performance states.
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -91,6 +83,27 @@ allOf:
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
+          minItems: 1
+          maxItems: 3
+        clock-names:
+          minItems: 1
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          maxItems: 2
 
 unevaluatedProperties: false
 

---
base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
change-id: 20260509-qcom-ci-hdrc-clock-fix-8ad5790ac636

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


