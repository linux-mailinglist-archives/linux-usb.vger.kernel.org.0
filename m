Return-Path: <linux-usb+bounces-38039-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM2mOiKwFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38039-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:25:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B65CE543
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 470D1302F26D
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122AC390C81;
	Mon, 25 May 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXbc0nC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1A3932EE
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740663; cv=none; b=Pg6OrwRtmRIF+rIgNh4URpkit1qXn1WhdZi3kN9vFfBb8OBQs4fjoMgu6hKzqo9rSdiThKEEfiV4Fz2PNmQyIK3oEIGjOCvOVbaA2effBe1TKVyzujSo/4h7bPh5Mwz67X6483p7GrR325qLLCed5MMX1Q1Fsg8Pjz19RuESVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740663; c=relaxed/simple;
	bh=2z3nyKEVA3fX4RWIlRXG+J+3x5NijVYYAa2uEK6YBRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fI/nI5K/WZJpsYNqSUwy8NnQCy5hEiuDZi3y73Gatrb6yujw9BZ0qco5Pjh8GAEU2TjSi4NUjiJTHPt3JMmmn42e6Eq1ghoTQeJNMDF9mUJ3mENlOlN2cHL1l8FsRRhoLKwF6yX7RIvb1IjucHhXjGIo9bJ/5HIL+d+hJSlGprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXbc0nC/; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4855003fa6cso2241281b6e.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740660; x=1780345460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=EXbc0nC/UkukedZ/qZ8jdJThyMllC5lvnl43YdYcDaVv508JlXP1F43V0eO9bYcRlW
         k2U8AS1n6/Jo7rJAHkSBpIkeS6xTLL+PB5HooyFNJHeKNc7AwFhO9uCcfECQGDEi7qYg
         qIl5xImT0c3geBeuN0LJ/7z/7yeo74pk4gbUeIek7SjdJJSp3PxMJxdVV7MZsTz4E7AV
         OhuDu9qREKoxX/jvHrmFxB1NvEIOKtKPG5sP6oJacNtdECHi2PVf1zFbXvnMXVpW37aN
         +wB3oTjPova0svwrA1LAjFQlgCGnpFdtWUATveSbhVtGxyO4TzNFkryKd07WQ7k2wzI8
         +gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740660; x=1780345460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=i8Oz9lGdUzGccUjuLdHsEE+ktshXkrrv1YuxudD9pRxKoCSGm5KkiICYXWd3O1iWEH
         SfvR9hHQFBSUyqy6X1M/A1GsscA9Yo7xknnv0W2KqlM5rdsBZEn/DO0KIkkhMcV0g2t7
         lFzV9lsqOerr/jkwdNx6DkeO1+bWNzbfj2OaWdonNMDpBZ12pTmz5qQrwzkEdVE0gltT
         l3uO//F2Hj7xl0GMfnt3AMbhWri1RB9yNMrvm9IoMXKYQ34VfHs0as9deC0K7wIOlqEU
         M2tj6tNjo9QAz9kpymhO2v3beVfPHIJhZtDdp/Pkg/qQAVTU+IaEQ8G26ADMUprAE9gi
         c7ng==
X-Gm-Message-State: AOJu0YzKwFphx8DLfwuHIT9Jlg4oZXGJivTGkaSu/rWP5yxVpo+QLvOv
	6ldi4mncWE0CzcbZUSI7FKixDae4XDn+ZG4me+Ii+GH6XIJth2rlXxtCQkCC+M+/wMI=
X-Gm-Gg: Acq92OEPzWG1c43dGYljEiLctc/nk6WJrLjX/g5NlU0uDkeEjAZlCZjzIeRZPlEtqkj
	nJmHemLKPMmCSxhOg/UUFL1cKJQbOUhu8wVgBQ4hv0g32JRJ9sQayWR3iWb7GNAO44vMYnHIohy
	FfNUTJuUCsz43Hnp/s+g7teXJBJN+YcZNLCFqW/BQrDBnakNDlr7NUYgzDYA7GSXEhU25U6AUoC
	TUuIoApv/9YWfikev9SdBdkwbNZpHGr8ZXx7Nf73LQUHDLK+o2jusLq+LdJ3Edv4C4LelkmlF5r
	KZqWpmGtPnzlOAOCBy6PjmcEu2sa76jBI33k/+48Rqhl1/AUhJACHPJBtw80sRgqrRWrRqZaBlC
	6PFiRYrm/TyMJuB8ThadO1znTfr+lD1syEv3NTQMJCR4HLkfcvNeiV3KMlZc1Tf7MY84tBFfIYF
	TArEnsznO566u2kw7huGg/X1DpR//nMSTj810lJ/8Lj9aJn/am0p5NjSV6e3mRqclHhJwjsecoy
	6/j8M8+K9nDsE3MYyyhkyl/48xqcEbh786IQPjkSc+zBwUOeAeo+kA6Ug==
X-Received: by 2002:a05:6808:191a:b0:47b:d914:48c3 with SMTP id 5614622812f47-48549cfca30mr8480499b6e.10.1779740660388;
        Mon, 25 May 2026 13:24:20 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554757d5dsm5204305b6e.15.2026.05.25.13.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:24:20 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 3/4] usb: gadget: f_uac1_legacy: cancel work in f_audio_disable()
Date: Mon, 25 May 2026 15:24:11 -0500
Message-ID: <20260525202414.602-5-adriank20047@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38039-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 930B65CE543
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


