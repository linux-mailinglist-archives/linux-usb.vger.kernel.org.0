Return-Path: <linux-usb+bounces-36317-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3oEyNQf95Gm+cwEAu9opvQ
	(envelope-from <linux-usb+bounces-36317-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 18:04:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE242491E
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 18:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 573F53006457
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 16:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FB0282F08;
	Sun, 19 Apr 2026 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9bTlzR8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4E175A6C
	for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614659; cv=none; b=J41LYPOuEe5afllqMSrd/Puoy6iqtGpd+zXRnktiJQIfQZITEy+mq4sA3JcCjLWmfKxQmJmokak1KvsSK9GqwGiBCY2DFw+pKZVnNoXjSruN9+ThJzXi79TI4xpQlr1VchQFy10gjXxgi6mRFduhM9P/eYZL3+RbvzzdXMLtzJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614659; c=relaxed/simple;
	bh=bP8LUWuUeYaqGTwTGXSI6nG6WAM/PWKWYxSSXFoIbj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iF9GGjOzLKeFWY9wPcS8Px5MwhsA7HsqjYOl+hKrBsqR1YsKwJjDA4PZnrjZTDTD/ft9V+cLgDlm82JFLHtKALL2GQixbe7pk6HYCiI19VeZH2+Qt2AJUyUj5LNYw7ogUuyqDJ2DcsfYss0X2n7xvhLYoCA9cSQalJWTlNti8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9bTlzR8; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8eab809593cso32563085a.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776614655; x=1777219455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzC9+frMZLDuxuZiYMTZZFagyuqva6ZS5iE7927OW88=;
        b=R9bTlzR8liltQukpSV/Y5fR/U58848Isj+toJtS7WSTGVTcpJZQCvsU9Aqi05R2ejo
         tN+ejosGkavDTpQcycKKbeM+TykJRkbZy/hsXnNMblxl+XrSj7JPags6R7Qw1Pv2i0cq
         LbudjT6535Xgz2slopnfvtLaoCvSuU6anZdTEdg8Xo1t9nO1OdQt1tljzLrtp3HIw/0e
         CThZN0BPSl16UZUg7SgEjlcXEdDF2mdyGbrPwwyp45qvasje7h+b+68OzrqSvgGbj14f
         dFMQD98AyE+aFx1Uc9QnS+rJClfrfzfL/SRBvDq9+Ebt1cmPZ0yTEEciCBFOd2lEUjdf
         hv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776614655; x=1777219455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzC9+frMZLDuxuZiYMTZZFagyuqva6ZS5iE7927OW88=;
        b=jF9N0e20D4+ZngeZnTpo2x0h+kwzcrCq3O3uDRgeYpLNLius7duhaTVivyxkk7k41/
         8sbdFKv2oigaJgyg6qz/FfITMhj0VWblX+2/qw7a6s1SChe4jXhg9zbyAtC1KrQ64BGf
         Og7D6YCde9m8N3MV6XoYm1SUeEv99c8BTsELSVg5jcT20ZgFsz9SVPWaLCSIVEA69Dw6
         bAQP6sWdgN5AduzLzqeNvlYzkhwXgpuAiXJOgq7hTWRu0ujHDaOSCgqDDA646hF+e+3N
         XS0s4ccQGsXmf2n73bIb7YsR6Jm41e27JUurIdtyfMCalCfTjYpJlf518Y/mWbdE+kOi
         gl6g==
X-Forwarded-Encrypted: i=1; AFNElJ8qeqqBrZn4c4jehdYbfPAx4Kr32DUiIjZKgvtFI2bpbbBh+jxrkzjaVUrprw3e0GtYM8bRX2axmaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPve4cHf4S8FzvtE3sTS0tknJ95pY6v4gT9tA7X4Wo5CGSUYC6
	TB/ZFNYsrOhHSxe7e4w+Ko3tgFXhhI6V4uIFZ3hCbuWGZAH/miHrezqt
X-Gm-Gg: AeBDieulsm3iPjFLVE20Sv8NSeBiYrFPs6CGyFvMltcqbWgvTEe4mFqUctsJlUziZ2f
	xKBsBW0BxZCKC9Dg8imNGvU6kkGbMzT/8RQOscYfVP/V08Yo3gIT19PnN7CaoPchLMBJ6nQnQ6b
	QT76xYJgjhxCNddFQew9McoTY7tukKPKG4DS/74pVF7kDyIwaw6/SV7tE2oKcPTl42Mtn5KpjEB
	ygJtU0DZl2Mp8v1RF40byDLBiiIexViQMwZR72XWL99retIiB/U+RbrNp7ohl6cBhSiWuoorak0
	mW9/c5RGjyPKpCGmvb92ShQWfUjIYeIYGmjJ+PgKDPj0AC+9F734AX5GiZqY2VTGnz84p7lzn3o
	y73DIZQtlOtPAdp9b+VMLDJtGEZCo0L4+CvdkoCVz95hr6TXOn4WrV/roDSlq6X0ZKfmDiMyJVL
	vDk/D1HD1rtkQn7orWtlCWZefvMoSanzsVCtYjy71uqvgaAh3QJ5UokCHjwFmYdxDz+6OKqMgLQ
	VA/aGVzT8EgbfSYb2LJJmzfS4PAvmE=
X-Received: by 2002:a05:620a:17a0:b0:8da:e62d:888f with SMTP id af79cd13be357-8e792567177mr1377997185a.53.1776614655232;
        Sun, 19 Apr 2026 09:04:15 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb19632130sm53333485a.41.2026.04.19.09.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 09:04:14 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Sam Day <me@samcday.com>,
	Christian Brauner <brauner@kernel.org>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Michal Nazarewicz <m.nazarewicz@samsung.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: copy only received bytes on short ep0 read
Date: Sun, 19 Apr 2026 12:03:59 -0400
Message-ID: <20260419160359.1577270-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36317-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6CBE242491E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ffs_ep0_read() allocates its control-OUT data buffer with
kmalloc() (not kzalloc) at the Length value from the Setup
packet, then copies that full len to userspace regardless of
how many bytes were actually received:

    data = kmalloc(len, GFP_KERNEL);
    ...
    ret = __ffs_ep0_queue_wait(ffs, data, len);
    if ((ret > 0) && (copy_to_user(buf, data, len)))
            ret = -EFAULT;

__ffs_ep0_queue_wait() returns req->actual, which on a short
control OUT transfer is strictly less than len.  The
copy_to_user() call still copies len bytes, so on a short OUT
the last (len - ret) bytes of the kmalloc() buffer --
uninitialised slab residue -- are delivered to the FunctionFS
daemon.

Short ep0 OUT completions are specified USB control-transfer
behavior and are produced by in-tree UDCs:

  * dwc2 continues on req->actual < req->length for ep0 DATA OUT
    (short-not-ok is the only ep0-OUT stall path).
  * aspeed_udc ends ep0 OUT on rx_len < ep->ep.maxpacket.
  * renesas_usbf logs "ep0 short packet" and completes the
    request.
  * dwc3 stalls on short IN but not on short OUT.

A short ep0 OUT is therefore not evidence of a broken UDC; it is
a normal condition f_fs has to cope with.  The sibling gadgetfs
implementation in drivers/usb/gadget/legacy/inode.c already does
this correctly via min(len, dev->req->actual) before
copy_to_user().  This patch brings f_fs.c to the same safe
pattern rather than trimming at a defensive layer.

The bug is reached from the FunctionFS device node, which in
real deployments is owned by the privileged gadget daemon
(adbd, UMS, composite gadget services, etc.); it is not
reachable from unprivileged userspace.  Linux host stacks
normally reject short-wLength control OUTs before they reach
the gadget, so reproducing this required a build that
bypasses that host-side check.  With the bypass in place, a
1-byte payload on a 64-byte Setup produces 63 bytes of
non-canary slab residue in the daemon's read buffer.

Fix by copying only ret (actually received) bytes to
userspace.

Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 002c3441bea3..815639506520 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -619,7 +619,7 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 
 		/* unlocks spinlock */
 		ret = __ffs_ep0_queue_wait(ffs, data, len);
-		if ((ret > 0) && (copy_to_user(buf, data, len)))
+		if ((ret > 0) && (copy_to_user(buf, data, ret)))
 			ret = -EFAULT;
 		goto done_mutex;
 
-- 
2.53.0


