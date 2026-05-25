Return-Path: <linux-usb+bounces-38045-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCnqIHOwFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38045-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9EE5CE593
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FB8C301D97E
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52D33793C3;
	Mon, 25 May 2026 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYDnRejN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755333955F4
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740780; cv=none; b=WkR5aTizACekrIaiUJ1kiAEBo5J1GDR+lT2wPjkMkfvLQJAeN88j3slohwMT8Pqabf0MvUfhveAeSCTUZVodSsitCZfG02WiTRhbZmBis9khhqtyv0OikWRtBSePlNJLwMVIWipFE64JzipMnYYZq+hmtHyOV+8BZap3udvBK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740780; c=relaxed/simple;
	bh=2z3nyKEVA3fX4RWIlRXG+J+3x5NijVYYAa2uEK6YBRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml97zD+YSjbwzPeGPR0lJYW1RTOKQJI+VrlUY4qQ+EB66yCRIDAeYL8GTQLqdcPmXa1oztB5pWszKM9NwvEUz9zRO4T2eSedU/qTzcyRVCz4p94NSupt3v9BWm/MdIy7JYLWZYxvn56HStXwwI6SuwX1BzNGKxHpHSE5J1jCwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYDnRejN; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69d7aa0ac14so2477522eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740777; x=1780345577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=IYDnRejNayu9h5dPSYSq05118yfaxK1pNL/Rltj5WgXgfmuoUx5K3rwzZsrvEsKeR8
         /2Jz0qZt297ef4OnbrmHIpnkD9ds1829JqzSn9bru3cw+Pevax2SWgjIsNX7oSj9ccQy
         Zz8y26M7L9kClkD3ZAHbfJJSs4HzWAqNPYHiT1h6qYW0jKj5MLd+U5m2wY74OHBVuNEX
         fuSmG2watBgmJA+iBHI30F3xAWWG7jTmb14wKWulnrWCYjvn0byt1uIiYE1emWhC5IJw
         /aWV0qJXRF/K0JDWprRXFPoaC8MPei2UlBU4b/deiPgC+G3H+4KE0h9VOZlD55gDz0MH
         QnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740777; x=1780345577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=Fi9tHg5DY3Y+yGvEH9Tydw/eCINJd1SySm3q6gsvRhFpHKj+IFsPRFyb9QB1RbgHCk
         FS1IWxhWLoj+3ygDwoQQwDQOrCGybEw/PEQJ3dPs/XrqW/teoSvhKyW8Vs9687eQRTa+
         TMB2vuQsiAzzYfamOjBvliVgOONxA7Ifj0eImXlyQKPEqye3q2fshnnj6aiRhXJiWYI9
         qETj3CxT3RoU2ifXl1siYCWfQUHKuEjsyiZkTJiOwHQZ6tnsPmlNl9CqiAhW6mxg67ZX
         E7CCQNvHkmMc0nh4QRT5SgnRVA345ASk4KzM2Q3QdcPwX/lUwt3wcl+HW1oU1QYEftuX
         9hvQ==
X-Gm-Message-State: AOJu0Yxvow4u2D8YWhgGWF0Bh5CfYeSk95a8+6LJ9THlKtwmnsaomwn7
	NJFRaq80efPam1tjI7aPI9KA7hR3RPPDHwsYglkVVAMKSP029Xx0cwVKTC+KmNBKpis=
X-Gm-Gg: Acq92OF9cL4XnQYmnnf7xkRfeE9WPzYVSWcyiiYfAPWFo5gjxrJuj6PELfgCUdpoxbX
	mHr7cXZmtqJhH56QmfIu2Erki+aK90fqqdY9j58o761KhOINb5g9tXRbhuE54xgcXQnovOGgbya
	6oScW+LycmzYDwcFHZYX2wZlihYRMhuFmvPmAsDqY0o8kuey/Ns41mNsb+zL+o34XmU2tlJb1Xj
	LYXT9muNc68Qc+eZe5GXf4bpMz6EcIeUhQPb+w7mumr8jqsaF3I6Dc6Ht0B2ETFTvay3wTenE7j
	1IoK8bTL+o4nLKVQZpV9JVkybXPBgtl/v7dGyL9hjx6xt5UabxyvTV9A0M/w/W9Nl8iobt6Pc/I
	Y9OI8QQYmAd3Xw9gbp74zGJyimb51OEy5qLcugesXRGzFTA7HNoFv9+80G9RA+wMfP5myQ9INxP
	usLyNntuiOPSP3pvICqtv3edIgYutkB3/I7RmmiB0/Ovfb5c4jPdH8ZZsI4RZODwXFBML0WFAwT
	Km2gOEQ58l+Ny8XuFpuH7CcCK0w034XSU8bydHBw2/WY9w=
X-Received: by 2002:a05:6820:178e:b0:69b:56aa:1525 with SMTP id 006d021491bc7-69d7e83e0f8mr9916091eaf.0.1779740777211;
        Mon, 25 May 2026 13:26:17 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63512d63sm10898192fac.2.2026.05.25.13.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:26:17 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 3/4] usb: gadget: f_uac1_legacy: cancel work in f_audio_disable()
Date: Mon, 25 May 2026 15:26:11 -0500
Message-ID: <20260525202612.680-3-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202612.680-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202612.680-1-adriank20047@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38045-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C9EE5CE593
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_audio_disable() was an empty stub that simply returned without
cancelling the pending playback work item. The work function
f_audio_playback_work() accesses audio->lock, audio->play_queue and
audio->card which reside in the audio struct that is freed by
f_audio_free() after disable returns.

Fix by adding cancel_work_sync() to ensure the playback work item is
not in flight when the audio struct is freed.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 6ad4b16769b7..798fbb8550bc 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -697,7 +697,9 @@ static int f_audio_get_alt(struct usb_function *f, unsigned intf)
 
 static void f_audio_disable(struct usb_function *f)
 {
-	return;
+	struct f_audio *audio = func_to_audio(f);
+
+	cancel_work_sync(&audio->playback_work);
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.43.0


