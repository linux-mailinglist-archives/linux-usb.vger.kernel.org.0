Return-Path: <linux-usb+bounces-38036-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJG7HgWwFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38036-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB5D5CE517
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6116A3024A76
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF1F29D29F;
	Mon, 25 May 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGzm+/DG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459DD36308C
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740660; cv=none; b=ql3V+CT4KdyZr8nrVGm0w7Cqybo0Kf5Sowx38TOD0iLWHECiNJWgkvGxXNZa+6l+M01MfCEhIL+NbLTgZHJDAQEdFCr8NsHmfOkv2e4ai6gs45sNdLcBVEeztHl0JLUbkDqd/ogsEP83d4WfgouPovlahtIKG7UvZ0CAr7ndq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740660; c=relaxed/simple;
	bh=grdFfHOkHxTLhLsS6j+FX41ur/btn/7guyqiP83xFg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKteUcHXeS21QwAhnk9a2MbJK1uyKXbBr+MyKo64xjePX0yIS3GeHx9NLMlFNjgxmQN366H/XlnIk8jHEX1YeiO7xbtP68sVv+7D+eC4OJrMTLZGYVP1Oa/Cx9KRFih6eYFK3mm1BympwH75YICxaAUYsnclcoLajIep7N4D5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGzm+/DG; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4856128f670so2182244b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740658; x=1780345458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfK7e3u1o6Z9pLVZ7VLBuH4tZqriU9FnwEkSwlD5KZ8=;
        b=YGzm+/DGO+PYwS4sV2FDAq6Mh7yEELHU7OMvE/LUQBQvA0FtnrzqrvpfEeRwjrrQdY
         4eZhfV/K+JJ7cAVlA4gfLCejf0uDvgUfV9U4tuMx2J1r/9H9WYh5LvdHXIPrln01VPqO
         kOf5FtSRJgeCRd2CKUXLj4AcOs3gaBEBTMJPx9df8fIra7FD/dLzUE3EfpxfMagyQA07
         t5Z5GKNnCaPVzWki3cwBvyKMn7sluSfrTEe3IMXl/GRSIWpNuhYwgzme3ZA+jvEuS13q
         FSTMkdSraAs3lLz3+F7IQRR79ppBGnhrxfsYnJBVEHxytLjlDC83HEXaWdj5QS4c/Y4F
         hv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740658; x=1780345458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfK7e3u1o6Z9pLVZ7VLBuH4tZqriU9FnwEkSwlD5KZ8=;
        b=MGbf3BM15e6kVN+0T9VRWpdBnP58sCxC8fqZyerV/K+dK12qxu0DkK9xUdT0BAtB+q
         1EddeAxq/XgyJVHorvWSq1UtrI+d/8otpxLonD83M9r4fizpl1fussubrtk8U5mtyPrm
         1Mp7nPP2bliRXQyzU31U/+nSzR/iknzp9660AqUXfW+KzPOdioi3Xlkw8m4vWfILH2Ae
         3rmc2NNYjIBGW8vPEjeT++48ulCZdC9fOVRAI6oCjT35IJIKv6EPX8GA9TQbP7aJhmgA
         FgqU8JY3BSBRAk4GjIM/m526uqbTWPbDLlofuIWDJQK/9ujyCv5O/HpADpDXtBBRdn6d
         uQUg==
X-Gm-Message-State: AOJu0YwQbPJ6/Js83chR4c8dPDIhmI+CPZULVjpAYLF4cUgLu6x3qVv4
	y4WV5O9/Osos+n4sr6fJKEqofmrH3LYr5c4Uq5954cLWWXTIC+2Df5nVZjCdmQcTnQ4=
X-Gm-Gg: Acq92OFaboC1wSaVPDb5P1e1/zLZrp+eRo7LAGYXyPGST49KLIUaUz/BQhdnmLdXNAV
	PQnITvA96iVryrEhsRsCwJw2W7ii7IkxcLURc8BomRTKLKWoXE0kEHQa8HYkAtPtSsktA0hzmf+
	L+L1pvQA+tKmH3DZiC4sN+Ywq3rUoB+rpLlQQy3Enn+9xYGK8a2lefzHSS/DdIUTGNCKydclNM0
	9McvV+Lr4GK7Cu8OBBy+kZAEu2liizo6DWC6s3W6TxadaECmFrgvjYWOtHQt38Cx4Ob1yts+pRw
	WpDiz9jT4Iya9GroWatE4F9j/UIqRa9qyym3/+OKCVby/hMUoY4wBxcXJzJpnyitprrhdduxPJE
	ErR8UsW1OSb3OgSDkFpmtFSVvxK6Py3hA5kzw4+fyKMDNXvOv2I9kwY3D+Hlkdm0sX0qFtJwevE
	FHitEqdEmTPLvX6ncWJYd0OeVaocLhMHqM2sTjjzDENf4a90PZDgkwfPCzk/DJC9j+wuWWc2Rnw
	g6ftmss3LmyVW/iFzQKYeASRmU5nSxhGvAKSJarvb5HRYk=
X-Received: by 2002:a05:6808:5387:b0:467:254:b90 with SMTP id 5614622812f47-48549d6e4cfmr8815138b6e.10.1779740658155;
        Mon, 25 May 2026 13:24:18 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554757d5dsm5204305b6e.15.2026.05.25.13.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:24:17 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 1/4] usb: gadget: f_uac1_legacy: fix file handle leaks in gaudio_open_snd_dev()
Date: Mon, 25 May 2026 15:24:08 -0500
Message-ID: <20260525202414.602-2-adriank20047@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38036-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DFB5D5CE517
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


