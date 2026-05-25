Return-Path: <linux-usb+bounces-38027-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK9gKI1kFGoxNAcAu9opvQ
	(envelope-from <linux-usb+bounces-38027-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 17:02:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F55CC095
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 17:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DEDF30151C7
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 15:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516403F411E;
	Mon, 25 May 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQDRGsFu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA433B6F6
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721326; cv=none; b=JLaYv62PxbcKjre9Ce/a32I8k1ZhtkR/ozLKKnTjiOLYkcebWUEBXEyyfim4LpUwXLGOId79S38abDQhFy3MoT4lQRL/LzqlqvEK+SvD/fubrT2VeD93vXoErBmPg/ZdoCREg9aoradUMqn+WntSmn8KOW/GNQHiXO/NLOixqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721326; c=relaxed/simple;
	bh=U2wSD17q1Tc2IUTCuRB46hxgyUdkv1T/mSiaZjdQbyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8SZxblrWoWXllMiBgqJDiwcsdR8O+rGvz3AFXh0XpPeaY9sjgAYxrb+SvlmaT9Qhw0FzcAJDTCVG+Uy45nos3OA5GxHBIABrh1PkGRhz4O4npMni2/MgVjAAepxgjIZl0koDEyuesmnytY6K6M6bYMEw0nFOzxNFPz23Djdyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQDRGsFu; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6061b3fd7so1707119a34.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779721323; x=1780326123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4o3etUmMc83jKXzjzz8NI/vuwQndsejxWjbjMzrTj0=;
        b=OQDRGsFujslUerswpML+vbKMpWoiYW9KX40O1i9kFJ6Q1K0InBAiaYHyjNCrmQebdw
         WAJboDIyet/JFqZNohveyr8Ieh1yvUKOtaNK6v1g/JAWchyPem8bTQo3vrEisShfc5J5
         Qo6s5K5CWkhg8nyp7fHaDzrCDXA1zVOBCX8blRfOgPrfGHDosaEWZsrrAv3CkghDH+Io
         XYuCq+vUpEwKZilQVXlETbbHCkofU4G3R5aMeyi4TFSU7crvVr5SSsRJrLCl+eHrYHuB
         9OwZh+HW8XdOmGtVr9/W0peovoj33rYHD4tQSK/TYjFF4wxspU4RNUuTwyEmdHyJJ4ES
         Yivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721323; x=1780326123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a4o3etUmMc83jKXzjzz8NI/vuwQndsejxWjbjMzrTj0=;
        b=qITQpDSRpSHwGlPrGXFZI6ctMpFD2T/r7VJyAd3sG4HElkqqg5XteldvT4Mxy3aTc5
         U8hGjpIOhVGd00K0tf3hLl2u6v9D+iQbXd1MBSUF39ClUDCsKOXMFaSNSip1rTgIoJLx
         IOMhG7iP5w9Cf8dQK8IVtVPMZxe9TIg8d5SQ5kSJgnDwGJiC2wBgOR5RQAsswOgTCiVA
         ifrAE7I3qctOsygpCNq1iNbp5skRGeAocjTxmYEDJGgAamAyj0w1D3L53bzoeVgyo51C
         gvzTyJ12Ux7785B2MeM8iYbZZfSvMQVKtQYnt45Ym7+07kTwb739SsqC2lGyxoHPTrA7
         qUXw==
X-Gm-Message-State: AOJu0Yxs23dojOsl5LYsaP+3i64FUlk4/gBlHwncvdfitxaZW85A36jE
	P+nkrORX5hUuQnFi51gYw0HxF0VYeGZsA+fnn4BO6Jg7nKiDtIYBMBeQ3lHvdIXurY4=
X-Gm-Gg: Acq92OElRgQDxy7PnqiZXsacueXxdLunHVzqGq28B/K5D0L4XVRTClmd+knzgsIbbmK
	oBtwbOYgzsHrvPQwn7hetxcFQp0mwTWDZiz7WgBbqK0n8WqGW4WSbBisMJKBWohej9xASN8uBrd
	7tn5az1et6tL8/Fh674Owt2KgkUtX5whfUu/iQkanhNRwlAEivuCEeIOr2kZcOI11hcwWbnSugV
	wPOtjDDCkAei2ZJtb1wc5BbckQmX17Hz/rf/ftADEPqgBLiIcn20tSPxFnD0lHHBNI1tJk/ZoQN
	Awewxo3j2qW5RBQEY8nf53TmMqxjr2vzL7fDXprGd0UKWWyng1Y7RB9+Fhb/R6EjmKPK/QI059I
	5aI0BtG6PpXnTHo9y4iV0dkXKkveA60y3pmLSoWVn+ToHNpayJLTLpJsZy/Md+RXmdPxICiket3
	rvHi9ibr2tmvTAPMy/izplnq2/TZPXR1DW1jZmPFssGOGG4pMP+tRfj9HuXnhH/s3INf1F+f7cO
	hvfMDn4Wjk5MjiCHXdtlBvVQj5cm2AMeIZoc0PPt6E7O9zb50HrkqKdBA==
X-Received: by 2002:a9d:60f9:0:b0:7e6:50dc:650f with SMTP id 46e09a7af769-7e650dc6933mr686769a34.23.1779721323019;
        Mon, 25 May 2026 08:02:03 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm7353920a34.0.2026.05.25.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:02:02 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	dave@stgolabs.net,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH] usb: gadget: f_midi: cancel work before midi is freed
Date: Mon, 25 May 2026 10:01:39 -0500
Message-ID: <20260525150139.3038-1-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026052509-shelter-caucus-92e5@gregkh>
References: <2026052509-shelter-caucus-92e5@gregkh>
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
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,stgolabs.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-38027-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 0B2F55CC095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_midi_disable() disables the USB endpoints but does not cancel the
pending work item before returning. Since f_midi uses the system
high-priority workqueue (system_highpri_wq) rather than a dedicated
workqueue, there is no implicit draining when the function is unbound.

The work item f_midi_in_work can therefore be scheduled via
queue_work() from f_midi_complete() or f_midi_in_trigger() and execute
after f_midi_free() has run, resulting in a use-after-free when
f_midi_transmit() accesses midi->in_ep, midi->transmit_lock,
midi->in_req_fifo and midi->in_ports_array.

This was introduced in commit 8653d71ce376 ("usb/gadget: f_midi:
Replace tasklet with work") which converted from tasklet_hi_schedule()
to queue_work() but omitted the cancel_work_sync() call needed to
ensure the work is not in flight when the structure is freed. Tasklets
did not require explicit cancellation in this path; workqueues do.

Fix by calling cancel_work_sync() in f_midi_disable() after disabling
the endpoints, ensuring no work item referencing midi can run after
teardown begins.

Fixes: 8653d71ce376 ("usb/gadget: f_midi: Replace tasklet with work")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 4d9e4bd700d8..864527bf900c 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -430,6 +430,8 @@ static void f_midi_disable(struct usb_function *f)
 	usb_ep_disable(midi->in_ep);
 	usb_ep_disable(midi->out_ep);
 
+	cancel_work_sync(&midi->work);
+
 	/* release IN requests */
 	while (kfifo_get(&midi->in_req_fifo, &req))
 		free_ep_req(midi->in_ep, req);
-- 
2.43.0


