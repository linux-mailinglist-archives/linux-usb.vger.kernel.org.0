Return-Path: <linux-usb+bounces-36103-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLIpFG2T12k2PwgAu9opvQ
	(envelope-from <linux-usb+bounces-36103-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:54:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A45023C9E54
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 13:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A966301469E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 11:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2853C2787;
	Thu,  9 Apr 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpAnBy4i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595343C0623;
	Thu,  9 Apr 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735650; cv=none; b=W+7YIFn1uOSaXjcG3vbcwgnjdbtUuvC/5gPa0wnM70SqnpVhqzcnx7WUNaxxnLeV8Uu3VRqGT/dhxY6Je+g9WeX2qsXg64Y0hE3TCJuLm8jtMJITbkRGfQfduHBm07TJ4AjVq0nTxnfTr/WytgGkGoEUKG29apqukwf9lHwbso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735650; c=relaxed/simple;
	bh=VfMT/iT0cjbkHNKbjq5ah6QbcWGuyVG0hJsRXPkMoTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WrI3yaRu+yRuUuOLq8hfS9kLzMN8PPrNQZW+dBUvXJjkYDNc5G6awIKqU7Q5iKIc3p2kZfReItyZqCEqwSemyhjmmHnCAqbVAcYl2djv/jrEYenkcW+R5t+F7T23MCJtT4IXKXEblu+lCuuZxauuUElAToUFNyfGflmBrupQzeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpAnBy4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1560C4CEF7;
	Thu,  9 Apr 2026 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775735650;
	bh=VfMT/iT0cjbkHNKbjq5ah6QbcWGuyVG0hJsRXPkMoTk=;
	h=From:Date:Subject:To:Cc:From;
	b=OpAnBy4iVaVmeasnKu2ItvLp7EZodRN2ruyHTIkcoD9Gg98cGEcCpqCZY39px0XUx
	 cPQLpYuVRAD7g8GUQDOsw4kKcvonPxQBFoZQlzkLPoSrUDjLZ5nAtzGfxwHxN/T0dW
	 7lrb0JKe17v+FIM/HwiPhKJCRqQzf47AJBcLc8e7aSd7o1jmNN2hMUY0pzAaJIU6+m
	 G4ZS+TAFYernkOCwcMu5BA4+lE8FHmw2srZXpwav26PvCDSDi4XFsZuriIOg3hRWsW
	 O0ju+cURAzS82pwihbtmsyveX3/pbVqprtIALbS5dMcyEwM+JMPNHNnHBqZNElU0Va
	 X5UN/poUtP+XQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 09 Apr 2026 13:54:01 +0200
Subject: [PATCH RFT] usb: typec: mux: Mark mux/switch devices as 'PM not
 required'
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-topic-usb_mux_nopm-v1-1-e8ff107c58b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMmKcOuEhFlU80iFa0IwrsnL
 d/i/xciBaYIXfFCoJsjO5tRlQWYfbIbCV6yQaJUWKMWp/NsxBXn8bie0Tp/CKRG1q2uFBoFOfS
 BVn7+aT+k9AFQ9bQ1ZAAAAA==
X-Change-ID: 20260409-topic-usb_mux_nopm-0e52479160c6
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775735648; l=1344;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=psHmfFIIjh8ETmDzP30TpS3Fm39KFDkwAfIGlScflnc=;
 b=Juvsqn1YV1ZvPM//XGwOkqg+JQgmsGXowEd8BnGf1xtDoSsXqWkbDb85R6GWK7t3IJOoiCLND
 jKReJ5H9bllDwvNFMz5HC3ln3gaNYf7u8A2ft9YmybhbzlJjpRAE9bP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36103-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: A45023C9E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

These are spawned as children of the device that normally represents
the chip/hw block providing Type-C functionality. They don't have PM
callbacks, so it makes no sense for them to be taken into account
there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
I saw no regressions, but such changes are always a little scary..
Sending as RFT
---
 drivers/usb/typec/mux.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index db5e4a4c0a99..080252f202ec 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -199,6 +199,8 @@ typec_switch_register(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	device_set_pm_not_required(&sw_dev->dev);
+
 	ret = device_add(&sw_dev->dev);
 	if (ret) {
 		dev_err(parent, "failed to register switch (%d)\n", ret);
@@ -454,6 +456,8 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 		return ERR_PTR(ret);
 	}
 
+	device_set_pm_not_required(&mux_dev->dev);
+
 	ret = device_add(&mux_dev->dev);
 	if (ret) {
 		dev_err(parent, "failed to register mux (%d)\n", ret);

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-topic-usb_mux_nopm-0e52479160c6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


