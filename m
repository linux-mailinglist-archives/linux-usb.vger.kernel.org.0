Return-Path: <linux-usb+bounces-38009-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJnSJh0XFGo4JgcAu9opvQ
	(envelope-from <linux-usb+bounces-38009-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:32:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD25C8A3C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F071830427F9
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8893E6DCE;
	Mon, 25 May 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdpFxHjG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619C3E63AF
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701353; cv=none; b=FV+UbpwbWfDw1Vz1+jPiZHkd4aHr/SdgJphi9GwgJktFzL2haVe35OwUTEevBnCq911gDYKf5Dy11ETho2XGWhsTNellmKCA4ZaonBdCJ2TlC8BoySW3lbHTNDYU/vIZYQvaUFfpfdfkZ2isgD+HXc+eR/YGzeu1wNeqEJqLSe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701353; c=relaxed/simple;
	bh=xYqqCZX1aHrmamBy2SBhedm1rID/oN896iWM3DutL3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOzuaFWreilIeMn6B7gqrXkIWmgUeta8z5keXzADms2+bs4++0d5cxRPQxmyvD/k4M/v+TspmKhk2UHkFFUKiDAC2NB7xPUtnMZIjI/3ysABpwPVRqbddgBFUt0UPLXZ5UK4lo+S/nVLevdKDnotmr4TZnsUEd93aHPjXMxjj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdpFxHjG; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8acae26e564so123475816d6.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701343; x=1780306143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkGu0TYeQg7c2WJmg7MepcxFtKbFnqZZwBVV8dtAMFY=;
        b=KdpFxHjGE1e6znL+VTwy9ZiMKEffIAwSEPvmMn0vc25o7dNq6hU43PZTZgR1IL4yUt
         W0jBd19S1McnyFcrObXqo2IEcC6pUgO8pFgyfZA1FT+RJmcebZhXCKgcI++3p82tM53l
         9JnL2etLWN+TL4W8O65ah8JH63dDSiOSI2anIglqKZhpQIEYtECECBthjdQhI7EEFSWC
         5+fuM8wBrTAZnMhHqK3GEkS9pBzJsuioekeN7seE4cK5sIv17j0Jakv7i3HjNTc2Erpr
         Z6HYqA/oiSfHPJfTQACOJvm3Py2zkam9HwCRH6Tout9ZOwV1mKeM+HTmlIBt7dDbjsPr
         JCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701343; x=1780306143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkGu0TYeQg7c2WJmg7MepcxFtKbFnqZZwBVV8dtAMFY=;
        b=l2H09jkRDAMej8O0TGQqOGBw3ywFGsqGUPe4OCjdmyN7FMmukkfWdLRU4Mxtj7r2I6
         yIafHtNfa1CxQJ9GdDoLvxy698pjM0GtAJdbt9d0dNM1CI7+yLOhMFu4dVsKE7cFeiJF
         YeLBPGjH2n8dN53Lgh/IMnTru/HF11qN9/XrvAOgLMUQzR4DeJldi7I5C6LCWs2Vop2i
         I9HUkC8lWETiP6WISZ58CmZn4e08F8qUqw+/mIMiBPn4sCUA9H+vh+K1bnEMLCyku2+0
         BFpAci+gRhmDAJbk7Bg2twoCY8v3Gn23CLurLSD8OTSamqotkBppRMSTpTxrcdl6ZL0G
         0uPg==
X-Gm-Message-State: AOJu0YzLovFuvxlQ3WHitNVzr9jJOpplqvj8DxK+iCbG11QPIiItfWPy
	kNnCRItCoZeNDorEBeQ1YJFe0XFlRFBJvjG6VZnAqt4Mgt/925eUok8p
X-Gm-Gg: Acq92OERI8Grmq+bJw/0b/jjVMJTBFjia10mfvHxDW9veaTjIXOAPTALzcQiuD69XtO
	PtNpi3cU3JTH57k1d+4zvtZn38/KPwTQ21b+gPajN+oZBvzjrd4/Mn97cDcRxQE3BKSLTNsjfbr
	stbG1/vgv2mcbdECZjQKirOPtUYvXYobgMoM3eHBZsSj6wb68+GFwlUoBP/tylBVXIgweCU4SQl
	QzZ76+G5JWRKjooEQKj6zzOVmfGNDZiiusmA/JeC5g0JAivIzWWjdXVM3veY1Pk16OAgQEp4cfS
	0R/GTSfmElDtGymlHw8v7I2hVtKGKD2saKewwArBo62ykE9VJYvjLHNAIFsMxlfSFsqqYIpVBIN
	9TGb8aRTFppeaDixQdVGG3k8P9Ytud1BHZbBF2P4RSuouzBHJaI+u9OTAv1Yo3jCLrrFoBbpchh
	oIMC6TU3APUV+DoYDQmjHqoXyldtfhO3k5JmlXFll2Go0fe0vLj8pwpvOJ+JL5xlfRpy+SEs+di
	6iv27XLRDheQL8/aGAo1g5VIp2l/i/0rEtw7T4QC4U=
X-Received: by 2002:a05:6214:242c:b0:8ae:60c4:857 with SMTP id 6a1803df08f44-8cc7b62163cmr227783116d6.18.1779701343370;
        Mon, 25 May 2026 02:29:03 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:02 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] thunderbolt: limit XDomain response copy to actual frame size
Date: Mon, 25 May 2026 05:28:29 -0400
Message-ID: <20260525092830.735472-6-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38009-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 07DD25C8A3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_xdomain_copy() copies req->response_size bytes from the received
packet buffer regardless of the actual frame size.  When a short
response arrives, this reads past the valid frame data in the DMA
pool buffer into stale contents from previous transactions.

Use the minimum of frame size and expected response size for the
copy length.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
The DMA pool buffer (ctl.c:340) is always 256 bytes, so a short
frame does not cause an out-of-bounds read from the buffer itself.
The real impact is that bytes past the valid frame contain stale
data from previous DMA transactions, which are copied into the
response struct and interpreted as protocol fields.

Confirmed on QEMU (7.1.0-rc3).

 drivers/thunderbolt/xdomain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 9d54e3ccc8278..1fd1cf4295a2a 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -123,7 +123,9 @@ static bool tb_xdomain_match(const struct tb_cfg_request *req,
 static bool tb_xdomain_copy(struct tb_cfg_request *req,
 			    const struct ctl_pkg *pkg)
 {
-	memcpy(req->response, pkg->buffer, req->response_size);
+	size_t len = min_t(size_t, pkg->frame.size, req->response_size);
+
+	memcpy(req->response, pkg->buffer, len);
 	req->result.err = 0;
 	return true;
 }
-- 
2.53.0


