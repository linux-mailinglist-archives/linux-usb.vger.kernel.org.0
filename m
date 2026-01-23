Return-Path: <linux-usb+bounces-32644-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEFuIgtec2l3vAAAu9opvQ
	(envelope-from <linux-usb+bounces-32644-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 12:39:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C727875333
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 12:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 680303093211
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80EE361DA1;
	Fri, 23 Jan 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o1R1Qecx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XHlcExbr"
X-Original-To: linux-usb@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011E33B6D3;
	Fri, 23 Jan 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168244; cv=none; b=YYhbJQurVxmZ5IEaWVfvf1KPD4IMQpyoAOyTFoKFSq5WFxmGyJbHO2sPe4h5OFEE9WC7cHuvHTuD0pOkQodRYHWFQ1Fi4wwFrBDiDhwTrIWalnA0GSgWHiPlYMhibubD6w/bJyMztp53iKFKUJ5AnM6JIP0KQlSw0P1XvMRi8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168244; c=relaxed/simple;
	bh=Ho2psf7/qNUddFKw3dQI1I0+XwQk++kQx5ZMVlv6P9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqLzIhE/xgE7Ra/EdVOkmNr+QmDfKNrCRhP0EbTtyOzkWeOVzSEk4mFXe2LafvNvpqhShZG83oDjI1WPVqN+2RijdBwXNYx9inEHwil5wbSnrJzjIro+92J6HsXTm6xT0NrCJFNax1cCVViMhc+GI9mYTOfQ7enLHQ66QvvPs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o1R1Qecx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XHlcExbr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKAdw30kiS16YSJS+M2uj7rvfnRZHv16JtZKgorXgz4=;
	b=o1R1Qecxpa8p513yby3Xjp1M+Xvu7NpGugDC/ZDFV8uvv1NjymABPzIu0+C7SzY4pWb4XA
	cnM7+apZcLN+5unC26/rwzVIHYspLyPP/1jC4IcjZsaS5a0kZ508CUPIcJ8t0CGe/ruH54
	pI9SU1Q/gEjoJpRxo66lPEC4MB5HnIGp57lhZZGTRFruNcZxxIFpo67PGRLhk9hLq2XRyb
	/fCEi3UJiPrJylW+2Hl2W0xaoI+8SpYU7/Tkk/EdPA5zktHkZJjAnUnH1mocIgTlu8axUj
	goeBg1u8+eX1oMcRcilu+CpvhPYL/ZzyD31KT5Kt59dNDP28oN8cBF9e1Ab14Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKAdw30kiS16YSJS+M2uj7rvfnRZHv16JtZKgorXgz4=;
	b=XHlcExbr1ZUWWUELsI9V+SIxudW4CmnAoNVyOn3XP3wiQl6HBAFF75KSFkdOuouykpGHBS
	U0WNmdeulZe6lqCA==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 13/21] usb: typec: fusb302: Remove IRQF_ONESHOT
Date: Fri, 23 Jan 2026 12:36:59 +0100
Message-ID: <20260123113708.416727-14-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32644-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,intel.com:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: C727875333
X-Rspamd-Action: no action

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Fixes: 309b6341d5570 ("usb: typec: fusb302: Revert incorrect threaded irq f=
ix")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/usb/typec/tcpm/fusb302.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb=
302.c
index 870a71f953f6c..19ff8217818e7 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1756,8 +1756,7 @@ static int fusb302_probe(struct i2c_client *client)
 	}
=20
 	ret =3D request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			  "fsc_interrupt_int_n", chip);
+			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=3D%d", ret);
 		goto tcpm_unregister_port;
--=20
2.51.0


