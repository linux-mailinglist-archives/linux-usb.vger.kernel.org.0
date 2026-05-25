Return-Path: <linux-usb+bounces-38037-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD1HJvevFGrAPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38037-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFA5CE4F8
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 515163008C18
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED90C1BD9C9;
	Mon, 25 May 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJWY9n/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFF937F72A
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740661; cv=none; b=TWMgBQq6LRQBy06PEFUx0NSbtpadrz18EJxgyyjOD3MiMYR3eeqvO5vPBU+hWhtKMCp1TGiDQ3eVKPifxalfhiUi528Wi8Okg8XXLYOtA8t0VyQNBrJHRxFReMc4DN6O9Lzen9rw24Edvf2tXgHpgj4BdGAbQRQ3QGADc/pgiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740661; c=relaxed/simple;
	bh=grdFfHOkHxTLhLsS6j+FX41ur/btn/7guyqiP83xFg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFCICzdoQwM6X2cqjUVSQLYBVbs4tbtlInkthnqQBav3EFHK1vjkeWiMGYIne+Qlkj3QQxQvtZIenTEEzMSrODNm1bk6iG26VrrNGfOvVyIzBHZcNM7ro+w/Lt39nqp9WgR9sw4YYcDKEO7AM33vjyfLeTty8S6Ttd4XqQv0Tls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJWY9n/6; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4855e69a5a4so1639689b6e.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740659; x=1780345459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfK7e3u1o6Z9pLVZ7VLBuH4tZqriU9FnwEkSwlD5KZ8=;
        b=lJWY9n/6RwfGjNK8klzhgVc+l5YMZD8Y1iY4vq1KzCRgpEY5u+aIVHpxyH6BXZ3h2t
         I6zYkf5KozFh7DffVW64x+9q/P6SR+UjU3b+RDSwGbyfFuCy5/UaW/89Ypfdrx0Tb03U
         hRz27qIoQ0GmQe0SEfYkeg//IXCMQIDcr/YvQCmr0TGFV7hnRBvsxEhZWVp3+T8p1G2q
         R3sKLNYMeSNrxdI3OxAy0/8jJod1hGJOmj3NFVMqMEX5lEdjkFWDOMNA2wN++t6orJHw
         l9caZ3ZlPirhw/wVZlWM0O+Kln+VXsSTThCOYBNM+y2zQb/RaCBLuRfT46/MhM2VXdw1
         oFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740659; x=1780345459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfK7e3u1o6Z9pLVZ7VLBuH4tZqriU9FnwEkSwlD5KZ8=;
        b=YCtfaH0btibqAknpd50JzVJecsJMTlEYRfVOHA6JFnej5oTvSMnXd0FNfjWlVaoeyT
         1asCraGXYLj7UdkLDEQMDf+DHNnVCPfLINeRIGeoeNdlAiDEnuB7isxjPBhv7e+UwvVJ
         10LVA3tzPSggyLJTVIwKKngcLBBpCUGbWJev9IrOUyd5Beqw8r7sQve7/4hruW74d3JS
         jtvS2iBKAcoqEQ8gU9WZQuA7wcXjPUmMGjTxGNGd8VI6/brgBhXhxA0Ksj7s1/1uCQu2
         j3pDjWt4+vNs+F3sCQv3vu/Zlz2ceXfEVLfFWdPEAu8SMq4SqzysLqkwCKZ8yCdcjTun
         b6hQ==
X-Gm-Message-State: AOJu0Yy/U1Wc1Q//3y7u2TRIrTh3a1+JocSdsYn8RmAPsXcfsWMXfOqy
	SvDkhYGx1MeRj5TEihung0npDYM4+9/e/ViisluzK5MFbm4FhJdJk0epbS6n52vjCwM=
X-Gm-Gg: Acq92OH8xiYjGeoy0RnPYf2gBTbY1UGU/KPeQCOnoNUG8HuA8TOXCT8GCK4rUYmEZ0x
	O/V7pMBHuDRQOMBKiXMcSoWMp7s+9f0zs73lCjm9TxlxPvyKZXWwe7vHYA5B4PYLu1LmyBeTlpi
	IZbYjBTJIT24LU+P64SX/hJyCSLvyzrF2DaPXaA53qof4rSEFYlXd2E+CaWBQ8qgSfyRlp+6t/h
	7Ldbf+verGVegE0qLAOBb8EBdUsFj5hEzClJb4nlNkd2s+6ty+UYG0sDaFf7chb75rNoHB1a++v
	UL3vfaKOwtCXh3O/p992ZXfw1324oDLHT/GGIDL3r2o81IjYrf/rO4VqTiwJ9FF/JL+Uwq/gee8
	+jY4ymBFiWrIo6xP6U9tzwec++cHPshioOGziBqVrw11fTiTGic6UHFByGZfzinXrrPaxHFfTnD
	Z43+VmbfwA4aBxLYgOVH2Yp/kWHcAlVp/rm4f7cqivgCDy8k7pGyYhQNFRRhxY7AFe70sfRG4f8
	/RCwc/+TMXkdU7QfTSJiuVcQoxFVT8Um9kT70N5LpktCv4=
X-Received: by 2002:a05:6808:80a6:b0:485:403d:9b92 with SMTP id 5614622812f47-4854a1697demr9954756b6e.22.1779740658853;
        Mon, 25 May 2026 13:24:18 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554757d5dsm5204305b6e.15.2026.05.25.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:24:18 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 2/4] usb: gadget: f_uac1_legacy: fix file handle leaks in gaudio_open_snd_dev()
Date: Mon, 25 May 2026 15:24:09 -0500
Message-ID: <20260525202414.602-3-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202414.602-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202414.602-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38037-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 40EFA5CE4F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gaudio_open_snd_dev() opens the ALSA control device file first, then
opens the PCM playback device. On two error paths the control file
handle is leaked:

When filp_open() for the playback device fails, the function returns
immediately without closing the already-opened control file handle.

When playback_default_hw_params() fails, its return value was ignored
and both the playback and control file handles were leaked.

Both leaks result in gaudio_cleanup() calling filp_close() on already
freed file objects, causing a use-after-free.

Fix by closing previously opened file handles before returning on
each error path, and by checking the return value of
playback_default_hw_params().

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/u_uac1_legacy.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c b/drivers/usb/gadget/function/u_uac1_legacy.c
index 01016102fa17..5bcd3afd6366 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -226,12 +226,20 @@ static int gaudio_open_snd_dev(struct gaudio *card)
 
 		ERROR(card, "No such PCM playback device: %s\n", fn_play);
 		snd->filp = NULL;
+		filp_close(card->control.filp, NULL);
+		card->control.filp = NULL;
 		return ret;
 	}
 	pcm_file = snd->filp->private_data;
 	snd->substream = pcm_file->substream;
 	snd->card = card;
-	playback_default_hw_params(snd);
+	if (playback_default_hw_params(snd) < 0) {
+		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		filp_close(card->control.filp, NULL);
+		card->control.filp = NULL;
+		return -EINVAL;
+	}
 
 	/* Open PCM capture device and setup substream */
 	snd = &card->capture;
-- 
2.43.0


