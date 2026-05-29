Return-Path: <linux-usb+bounces-38152-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMGTGlhYGWqtvggAu9opvQ
	(envelope-from <linux-usb+bounces-38152-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:11:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C098A5FFBCE
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0D5630908B7
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CAD33F8AA;
	Fri, 29 May 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKyCcyXK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA23B83FB
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045518; cv=none; b=NzlFkV3/qUP8WREDxb8mjuyrxauc1divT8ue2lyi6YhcJ9LELKbAdEe3fjfeGwULXEjPfjJhsVP4OTbYAFlO9/Nru0/7FBfbd4gMOiHppLgFVs6fpsTLQqFPlyD2x7ErRtyEWlZwM6a8PPUIfeoxl9b4H1L6GVC4/7la4f6Cf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045518; c=relaxed/simple;
	bh=6/4ydw5s/iaq6poXIuJBHDyGmmyhrg0/yKjMttGBOBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jedqiSL3ONlyxvpwmN/rGcrecvmbMt1lOugZDb7y4lYWLWZhgUj3jQsHEQsNeRdHIl7lGyGOjqGhP2mL+u5bpzGN02iGQogADduuqKWkqFU5Lyl+v6gL1Vw/96EGpKvqICgUO/6j7fRQdkQqDKOuvVjvtmtflPdJahnfiYZSDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKyCcyXK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-459bf19e87bso8275451f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 02:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045516; x=1780650316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHQcc7Z4aI0VEcc8CWWx1n+N4u8iP52vYgOu5CKwS8s=;
        b=pKyCcyXKV8C6D4divL2SLjcOiXJnJ7NhAcjsJ+f8SHfQdhTLsS+JuuP20NSQS5ShSo
         XEAkvDULoyU25CexVjFWH9V5Wmig69kd1z7FGcckPZzGbz6ifsclyzZMfsvNQtcEWTnN
         M2JgJAHVbU6LT0u7moNq94qXZ3q7FZ0wbApp8zh4tw/+GaDNF4fpgvF1nrv7goDLxLZ0
         rCkhqARaZn6StpMQ1Yei2IWYGJrZNd23DgUInCtMmW3Ch65t7mMcH8XthkJQg8jGZegp
         aHYgFxJzK7ZPm09JEGbBBKo7fSk3j/jgepY9lxWueoFoAKlGibnjJp89ZMfmvalzHyMb
         SXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045516; x=1780650316;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHQcc7Z4aI0VEcc8CWWx1n+N4u8iP52vYgOu5CKwS8s=;
        b=tYroTJqRFQ97IfMXCVd9E6BeTo2s1/8p7vzmoXTmxRrrLEsI+gJtHmd86OIpQoFXqa
         obC/r+RP0UpuCKmQTY6oNdZRmsYRtDqFOaEHe0Ms8helWzMn3sRZSDGnUc8JiZnsQ0OR
         k79G8oOl3+ArJPifZAeMkwEXc6epdbnaZeaQkkSyfBqR2ERnp301T2TTgQ33/QpynU9c
         y8ikqfxmskM2pgnrwWcvlWFm1tPMb0dSUvAc4CgpYzM3xh0bYBMgvH1We/RmzTtcxLPu
         NmQIxMN8B14PqW984ypTrPc7/ezYVRpbWm2WPxd7lIuWBNGdoiUZh7JI3HQJHSY7K3u4
         Pfaw==
X-Gm-Message-State: AOJu0Ywfb7kSqxo1Q+OQcaHgqwvtFKXbN8iBrqMz9AWGOv7hpQNYQ+YP
	xtESEHrh2ZBzFn7y6ufVxMldYpIGQ/4kXNMyxUkvA6cRGnXlFItN1rGz
X-Gm-Gg: Acq92OGzAwxdZgjmU6VmM09w0ksefTwEJQhOHV1LDjKoGicw5PQz9u4roOTFPvOfOx3
	tZ5qwPZ18x5qCsLV8w1LDjoOpxk9SjvAx7WymlsPus35V2wbEiHZNhtPZqjMp2nOSWhKTNHfhzU
	cUE60I3QCwrrescrzKlAWMy0BZvckDQaWfCUwQPo0AvGJOo5dEmenBrBlN+PJGmrcYoVCfhcoYB
	LsyNeh0I9e4YgzNADBb5Pj9PoDxk9mvSabf/jFXQmHIFrptbraVieibv8vL6KWiaKcD/C4MJ77N
	MUzIkx8namGH3DX9W+1JXKKDW96dMnuw0FsfiWBBN7eb7qizfow0yxzXuzdzcP9Ywixq2ZZylYj
	zEsM4sZNCACZtZ1gCEGAhOh3gunCATu1yrCgv2F2PqOLj4F8LWwp5gCfZN6VJT51FQLSbCADpof
	voWf3JvvocVEwFLiAIpicSoJ3GPGmO1g2oVW0lqXC1RpHaYeNbK9CIFKK8
X-Received: by 2002:a05:600c:6287:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-4909c0ac81bmr36499935e9.16.1780045515518;
        Fri, 29 May 2026 02:05:15 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34bcc30sm1987465f8f.12.2026.05.29.02.05.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 02:05:15 -0700 (PDT)
Date: Fri, 29 May 2026 11:05:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Simplify xhci_quiesce()
Message-ID: <20260529110510.64115fce.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38152-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C098A5FFBCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function reads USBCMD, clears some bits and writes it back.
Its treatment of the Run bit is weird: the bit is usually written
as 0, as we would expect, but it may also be written as 1 if both
its current value and USBSTS.HCHalted are observed as 1.

Per xHCI 5.4.2, HCHalted is 0 whenever Run is 1, so the above can
only happen due to buggy HW or SW, e.g. concurrent xhci_quiesce()
and xhci_start() execution.

It's unclear why we should treat such cases specially and write
the bit as 1. The logic comes from original PoC implementation
and has never been explained. Just write 0 every time, which
looks like the safer choice when the intent is to stop the xHC.

We could get in trouble if clearing Run causes some very broken
xHC to start running after it was halted, but no such case has
been documented. It seems the logic was just poorly thought out.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Hi Mathias,

I'm not aware of this causing any problem. But I wasted a few minutes
trying to understand the point of this code, until I was forced to
conclude that it doesn't seem to have any point whatsoever.

Maybe getting rid of it will save somebody else another few minutes.
The removal seems harmless.

 drivers/usb/host/xhci.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ccd07e4495cb..acdc9254b92c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -102,17 +102,10 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
  */
 void xhci_quiesce(struct xhci_hcd *xhci)
 {
-	u32 halted;
 	u32 cmd;
-	u32 mask;
-
-	mask = ~(XHCI_IRQS);
-	halted = readl(&xhci->op_regs->status) & STS_HALT;
-	if (!halted)
-		mask &= ~CMD_RUN;
 
 	cmd = readl(&xhci->op_regs->command);
-	cmd &= mask;
+	cmd &= ~(CMD_RUN | XHCI_IRQS);
 	writel(cmd, &xhci->op_regs->command);
 }
 
-- 
2.48.1

