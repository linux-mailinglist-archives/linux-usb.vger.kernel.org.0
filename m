Return-Path: <linux-usb+bounces-37998-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFusFGjVE2oCGgcAu9opvQ
	(envelope-from <linux-usb+bounces-37998-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 06:51:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E685C5C87
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 06:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 643F3301226B
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DBE325704;
	Mon, 25 May 2026 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgXGM1aK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80FE315793
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779684701; cv=pass; b=d4o0wPzOdZSp8WmvCS8+Vh2/NNnrTDKFFEqYuo4I0zP+LUcNLRhetUcBrb2rhMiqncRm8M6AJusmRNBYeRpks4DHE1mu/hxH+l0bPasFWB9G8QmQTTjmSvbyZ2GrloA9ybS2W6XM2pHMVK9WmR4uM2ms7YxsoMcKvpZyA5FbtF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779684701; c=relaxed/simple;
	bh=q6p0ooq6Sno5Jb5VpwX5zDubbrYII1VdagBmZdZSNXo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LyIVBEtUmS8Ci1rY4h8KnIQ9WjYhZx4WzNtqwy2cExS5ducL9BfjwWCLYf1Wbardst4Mv2MqhV7I4hQcRkIINRhpsaRBEdJ4EYCVrU5QyAtOpCnFH3TFp0PiNsAxxMcuw9bVpg7yVZGE4UCs6G9W2/FsVtLooP8NjfYtIDvGqX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgXGM1aK; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e61e251966so632654a34.0
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 21:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779684697; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfQ0rj0CE/FSU9sJduoNx4cyxISlPeHrxU7zVr6OxT/n5TN6a0aXMzDp0q5dYcTYxX
         tx9vLQmmSizDVMqhzE+nvVzeh7opkaDg/OT8gsQ799e4WSsnWfB9Kj/RdoV503klVSws
         iiYxrinacTNxi7Jyhf1KmukDVPlC9/Oc9W2185/aT0gi9oHrjLjsHpA3H54mKOFzSb6+
         Bpo/P+4T/wAifPQ+7mb6aR0KPx6QjJSaRUQi6hwUlUD90b7IBPdDVQACI3cwlPCsJnTM
         SY46iWtwBCDbJ+2mwxeKHR9wt7aQzef5rTrLplYY6eyRGogsyer5CvathCRIz8lqlS0p
         yBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=K/z1bhwr6Ofo8w1oLQvfJdmWvPh/HW9LkJm8LXPq2fA=;
        fh=XwR7Qyaw4xIM+TU/xR5zQLuzaf4qAALGCG7s+LiouaM=;
        b=S2v2yrCpxjZNcUSY8tvh9kgmQhjl/AteecRwyYgxbYZ1+ObSV98zbaOSB2UxNZnXyJ
         Z2CpgwlDTDzhiZ0tx3MfvMdGfU1dJOqGvRVPMZRkf5c5WdTFjIWs5W7XEZW7LBoysm54
         DMMtrOve7yB/zio6Da/HbmU2m2zdUjCUSvtMJozeU41+7mpHfbaxFvgVcfuVAM4cun5l
         xfPmg1Yx4/8iPrkRKknQr8pJt20MGiT1XaYnTcLtMz8QQE8VHT5Mo67yNMrv76JpWg9W
         d043HWvOhjfhmM5KcnO4l/q1WNZgCZssEigKv25awxDcUWeJrdlw27ldPbPIICR2WTZV
         g91w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779684697; x=1780289497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/z1bhwr6Ofo8w1oLQvfJdmWvPh/HW9LkJm8LXPq2fA=;
        b=ZgXGM1aKRe5WeBnipOGlnaYxRczkiE0yKaIkkCt2xduEQcDuslMSv5ChRcWcNjVstp
         sNUNGvEVG4VE/H0NF+THhs+8z1owAqNINPr7MZtT1hGNmsLIJ+/505Uo2IA1Nf9O0nY5
         UqNk6TnlaX+BLdkuiI3VkGVSnZKPZqS72iuFsQj7b8LW1OvKbqcXi4ZJoYIkJNNTVxrb
         iGt3xVTabW3LXsPgXf3O4N7ePLl4Au+DUOGMu7jm8QBRssFVBTCcU0Ys2ObzYuWNip0w
         Q++2iFb6WNZsdaMBxx2Ymku6/GuLDeAo1wYosii45YvrzxFKXA7GVwefmbsnQEXYW1Ez
         3XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779684697; x=1780289497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/z1bhwr6Ofo8w1oLQvfJdmWvPh/HW9LkJm8LXPq2fA=;
        b=HOTiKFSq+xubD7LG4Fs5FrjVhlma2uAfYGG4uIJu3MFliojhcwMZ7tXuyVWwQvrHgh
         2jsKxwk7pD/T9UwTqNdaB0megY7/zuNGb8J5v85FuJpvKG0tRZiVvNOaM6I2F3MOO+f8
         eKicnEXAmh2AtZ9GguKoOi7TdMOv5vjEe4vP7JtkOyXrwaK70nFjgAfMHv+ImDnXwgvO
         n9QcSGh7FScSAvPIOFcgk7zNpOUnWTEGjM5Ndz6v/cXB5XPawWjJDU0d/SiyUjxzDDb5
         Lq1hRPPHuBehJrs3W28NKt7L3DzBK3hGb8VlfRr3mZV6wYNKsi0aWeupzGEOaH3M4Aan
         T5yg==
X-Gm-Message-State: AOJu0YwfrDsOfvtXhKM3bgy3I14Ba73lYHiQAe6fOwxJK5YkLok2o0yT
	GWyxhH6LOlKXkUIfZD/qquxpO2bpKyWdTXR9x3pyNWTyJgEsL+QBy+rtEjQs+i7tFRzjqOQI4Wg
	qDxgPAGxwXhBM1fNJqTI4+2kZIu9Wkk4338U0F/Pqsw==
X-Gm-Gg: Acq92OHgvJnAH6vWJyymQ63YeffMsrv3WSf5/vd8Qg14jPw2ZyKC3j7j9OC+zp5iewf
	VD8VJLt1lx8jquZHHG1BvuYrORR66A7YWWMgEO9t2/wdgYWKyuRVW7lK+F81NQuBTUZQ6oUnN70
	Wi/APFQ4lW7Je5AaoWcQNuMjEg6F93LpPMdoAYBNa/E+qdJIEi5E125OHObNBBSiIPXegWU8fL2
	HN/DA+1M+S6RdeebqlfbVOQket3ZH9Kh2y0OaHEAUdwxj9MAL2xABiQSBclJgb94kmvVqLNBmyd
	1ICoN9r7ITrjw1NOaPuJupg0jhW+ZrcpHxfjL2/b50/2HViTzo96X2tblXq3sQRB0ZTzJ7OhSw=
	=
X-Received: by 2002:a05:6830:20ca:b0:7e5:6d2e:acd9 with SMTP id
 46e09a7af769-7e5fefcbc8dmr5091047a34.12.1779684696881; Sun, 24 May 2026
 21:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian Korwel <adriank20047@gmail.com>
Date: Sun, 24 May 2026 23:51:25 -0500
X-Gm-Features: AVHnY4I6eFiYZiSJ4FBlGh9DSgjGlQkuKLwHkU2mL60pbZoWbCr5zh5szgA6QYY
Message-ID: <CADgB2mEP106R3uzh9H=-yCjNLOcn5m+0eEayTb_1i=nh=EUP_g@mail.gmail.com>
Subject: [PATCH] usb: typec: thunderbolt: cancel work before altmode is removed
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37998-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E4E685C5C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tbt_altmode_remove() frees resources associated with the Thunderbolt
altmode but does not cancel the pending work item before returning.
Since tbt is allocated with devm_kzalloc(), it is freed automatically
when the device is released after remove() returns.

The work item tbt_altmode_work() can be scheduled via schedule_work()
from tbt_altmode_vdm(), tbt_altmode_activate(), and the probe path,
and may still be pending or running when tbt_altmode_remove() returns.
The work function accesses tbt->lock, tbt->state, tbt->alt, and
tbt->plug[] =E2=80=94 all of which reside in the freed struct, resulting in
a use-after-free.

Fix by calling cancel_work_sync() in tbt_altmode_remove() before
releasing any resources, ensuring no work item referencing tbt can
run after teardown begins.

Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mo=
de")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c
b/drivers/usb/typec/altmodes/thunderbolt.c
index 32250b94262a..57c8dff0c51f 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -303,6 +303,8 @@ static void tbt_altmode_remove(struct typec_altmode *al=
t)
 {
        struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
+       cancel_work_sync(&tbt->work);
+
        for (int i =3D TYPEC_PLUG_SOP_PP; i >=3D 0; --i) {
                if (tbt->plug[i])
                        typec_altmode_put_plug(tbt->plug[i]);
--=20
2.43.0

