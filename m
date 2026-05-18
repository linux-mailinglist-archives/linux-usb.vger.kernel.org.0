Return-Path: <linux-usb+bounces-37571-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMdvArykCmqu4gQAu9opvQ
	(envelope-from <linux-usb+bounces-37571-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:33:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE05664D7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F518303254B
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEDE327C09;
	Mon, 18 May 2026 05:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWWLlLT9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88753AEF30
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082353; cv=none; b=YAfQbYX7OViOAVlqJn9XkGHpZKesYNAj5iRp0D9BIiNS9qMt43TQncOvUdVZeGf2kkSu7bTpcuE2rn+Bpw4Ay53VSJ2KsP3VyBX38oHyxvBcViwZU+I6w1yO8v1CWJy6R72RBvxTdW2b20+rIqn3SvfB/YbMWEFsGXz5uY8MatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082353; c=relaxed/simple;
	bh=mdFHqmiM7J1eyeeB0BYJJMW3l7BJGjPJuNDC/3hHRa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3tXTyb86InnMjtAXQR09Yk2jfAwak5iyWQYjpCzI/arY3gBKbApyyuQ9D4imxSGdgQbge6gQqbAkVHsYniPAb6e4T8dh1kTboejS1391iWpQ15gUxGX6v1IVQBBdrbU9yAKUxBaGX+LS/2SeaW91Oe8dKsr4pSIAprQi5mVig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWWLlLT9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso14152065e9.0
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 22:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082330; x=1779687130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz3RXE6rLnkPyLWqz9WMXcLwC/lkGY7zfy2G8LQXM4I=;
        b=NWWLlLT9+6Mvp7iSmMIaz2YEsLV7HhJi/fq+nZlpYdY1U0/AerSqsI11br1hyb7/Z5
         U81aCeYHts06iZeIpDCdI/IiyH3jPDeSmC6Jc3HKl+oq6wEQE7sbyLsY3+Z0WZJBxgsG
         7cXXy/Z9uHFOcYLcWv2b+4opxfX0Pcurr2WqmxpvaaGeaDXGIMmtfPc2wy4uWn2rOzxh
         OgekfyOSEQc+1pJ38eUwbpNj9FcCzweDbzp46NUIXrWcKMVSHLf8bLc8iyK8i27xS4ue
         46w1MV4ldOhaQq8typqUmU9WvxBYyX31joY4fF+Nvmf1v97xpB5w5MbtfbkqX2G65Gpf
         Y04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082330; x=1779687130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zz3RXE6rLnkPyLWqz9WMXcLwC/lkGY7zfy2G8LQXM4I=;
        b=TrQffpMkgPOlzC1Am2hdJHFse0tl+jaoO5WqjbdTXumTqlZNLaHYKgQMufjDrLXoBe
         hVCxym+iN5bMPBC7toIGiDbibAit2uCx6/deNFHpJriJz2AfM4/4t2tYYrIVzXyZkzJP
         Da9ggZjJPyhgk6Sv1ZC58YlwDy3qRza9rpc42Fa76DdIP3er3sA8oCdYrOe6lzl10CKO
         7PrNDDjfAks80A9lXZWMDvakE8XqLyGeXvAkub/7lW3kEv9Y+NPdNKksagawyP0jNe7B
         bv/JLtNnCMURs2/DCRwhGorhwq4QdKUuVRVvtyKrkcqL7ro3ddScJvJ0CpUWyqEUtAcu
         T6XA==
X-Forwarded-Encrypted: i=1; AFNElJ+QkgZk4+AxOb9l7yK/eDLuP6qtohyC8ZxtImLr1z88boyPAqQLcnXnfOrTRixB1uCU3d+Xzl0En/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwncXasoQxXHd7ixGcUE/H3nAnid+XPB0FtGToB2zCcQdyN3UGJ
	PoWQyhRJOPN0v92Go3xKBeuwvK292vs3/ROZpem23W8vxFl7b3TtEHG+
X-Gm-Gg: Acq92OG7Jb0SEs0jsGn2PCTyE4LU9wKDRMgb90VY1Yn3gMOScvqQCM8DCxnfCBihn2B
	29ZdRBBq3o9vKGNKE0ev8aOORzPfeRQqAmMhZpiYtqUsQo4J2u904sMzApOnA65+Iqlel3oUumU
	S000d5JEmpJCOhZXsPYcftCKgrSDC6iKS1pNZljkFJF3IjARswAU17zXI/Sdl2TFwL4O+mNCmvY
	PAK9mHXenrLm4rvoyg3TEZ3vHApHwPNev12BNwbBZbFhplRvyAsnAV+SHg9861JBGwm2zX6cCdi
	i2cigoDqxw05aQqoxXWEcb9maja3tErpL2UWhRYPgZ8hYEKmBzs6t7O/Q7rhA9crmcztJtJ/o87
	BWlnfYUBhxY4CxpKsZZk9vRjJVDr1cQQxk1OhlI3pI1+9EWe5LpAY5N94SrbATxlgIws0sYtfZE
	iRBLEsw2+M6WTdVJAfnw2c4s58QqH67w0L
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr213731975e9.20.1779082330414;
        Sun, 17 May 2026 22:32:10 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm243360535e9.2.2026.05.17.22.32.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 17 May 2026 22:32:10 -0700 (PDT)
Date: Mon, 18 May 2026 07:32:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] usb: core: Fix up Interrupt IN endpoints with bogus
 wBytesPerInterval
Message-ID: <20260518073207.5b7d26e7.michal.pecio@gmail.com>
In-Reply-To: <20260518073026.5580bb79.michal.pecio@gmail.com>
References: <20260518073026.5580bb79.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A1DE05664D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37571-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Tao Xue found that some common devices violate USB 3.x section 9.6.7
by reporting wBytesPerInterval lower than the size of packets they
actually send. I confirmed that AX88179 may set it to 0 and RTL8153
CDC configuration sets it to 8 but sends both 8 and 16 byte packets:

S Ii:11:007:3 -115:128 16 <
C Ii:11:007:3 0:128 8 = a1000000 01000000
S Ii:11:007:3 -115:128 16 <
C Ii:11:007:3 0:128 16 = a12a0000 01000800 00000000 00000000

Most xHCI host controllers neglect interrupt bandwidth reservations
and let such devices exceed theirs, some fail the URB with EOVERFLOW.

Assume that wBytesPerInterval lower than wMaxPacketSize is bogus and
increase it to the worst case maximum on interrupt IN endpoints. This
solves xHCI problems and appears to have no other effect. Interrupt
transfers are not limited to one interval and drivers submit URBs of
class defined size without looking at wBytesPerInterval. Any multi-
interval transfer is considered terminated by a packet shorter than
wMaxPacketSize regardless of wBytesPerInterval - see USB3 8.10.3.

Stay in spec on OUT endpoints and isochronous. No buggy devices are
known and we don't want to risk sending more data than the device
is prepared to handle or confusing isoc drivers regarding altsetting
capacities guaranteed by the device itself. And don't complain when
wMaxPacketSize <= wBytesPerInterval < wMaxPacketSize * (bMaxBurst+1)
because enabling this seems to be the exact goal of the spec.

Reported-and-tested-by: Tao Xue <xuetao09@huawei.com>
Closes: https://lore.kernel.org/linux-usb/20260402021400.28853-1-xuetao09@huawei.com/
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/core/config.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 417140b012bb..d9171bf7bc88 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -191,7 +191,14 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 			(desc->bMaxBurst + 1);
 	else
 		max_tx = 999999;
-	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx) {
+	/*
+	 * wBytesPerInterval > max_tx is bogus, but USB3 spec doesn't forbid the opposite.
+	 * Experience shows that wBytesPerInterval < wMaxPacketSize on common interrupt IN
+	 * endpoints is usually bogus too, and recent HCs enforce interrupt BW limits.
+	 */
+	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
+	    (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
+	     usb_endpoint_is_int_in(&ep->desc))) {
 		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to %d\n",
-- 
2.48.1

