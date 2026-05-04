Return-Path: <linux-usb+bounces-36882-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHTJC19j+GlJtgIAu9opvQ
	(envelope-from <linux-usb+bounces-36882-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:14:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7784BACBA
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 932F63006B51
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B119435F615;
	Mon,  4 May 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8JJ5BXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8035F17D
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886041; cv=none; b=tA4gaJ92ebTVrLoChBO0+m4H3WhTVqYf7BOZmqtqyKBrbnpo/bsmXMsatbqfMYATbSo7PdaPHH2cwB09zLow1ZIkcxezbABHajQirm1Eg0rq+zC2Jbq9wi24JALkkxWYYGxEiP9Ff0LijWLqH2esDDJTgehGaUTFv0YghEdh6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886041; c=relaxed/simple;
	bh=YTGIZWPU9y22Ivqcul+wFlsNQEPi7ai8o4vbiM2MlQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g2Bdh4DgBesz+CJvTW/2KfUZfe5P9M8Fv85DSBl26TR9+EmnnddHWEeRDyv+wa540KmEP106VLYWAQpc4kyOdZ09XuoVIf8gLWOjBSDzT5irqllIEQkW6TqUJD+30Keu8+IXSD6xgVrNxdDwbJBEuhdKQYtcyYyXOovhIf5IxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8JJ5BXe; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44b052142e1so1210037f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886038; x=1778490838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uEFiXqc4wlSqY+RDlXEzibsdFvgDZPhLEgJ5WepC+Us=;
        b=l8JJ5BXe4SmizBVhQtz0VMQ3up4sVURpjhCljJErvkLZWnd0tMZD36hMtczSrw6qeE
         fU1gaFzAWLVK4Xarx4aRsGbrhUlYMUT919vl0RrQtZgY22VZZR195w7dBGjpZwPcFlMP
         NAVR7IJP/s8QZp5VI24ab2PLohZn68KqhX0XFq27S7EWLhtdRxkmdymS+cz9e6MZCSdr
         4s/o1dIk3ezJuuRwyHHg3mpsR9HR1v2tYilBRtVDzLfUBTO/YqhAQ8wonrP0mXESRugs
         UZPt1BoXZERKHK1wWwNzF8tqqb9QZErpBB6NeaLwXNf0e5j8fVp9+atEMCr/dUPpbHVm
         rq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886038; x=1778490838;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEFiXqc4wlSqY+RDlXEzibsdFvgDZPhLEgJ5WepC+Us=;
        b=oBYGB2qDJgNgW7VoEX+18EFnPd1/XxJa57KMvJSVC4SZUkCrYcm/MRoVQhTd7C7ocj
         OVPMczztv4w95l3889WsiMt2BxCpLQmkwJh/Ps43d3gBJtNMbMTS264nQd/7s+4qM95d
         w9A2wP6IsWHg68YUXeBaA+wu1wo9FOU4z+tr4QWvYhwdD+EMDZdYGaTlB9cb5nH+UmGx
         MgcUTOHVy2HsaCDpIH0gFbH86tWZ6+zAZ3w7LeKtvg7qXnUwWLztEGOH2nVrhfTkjF7f
         FQmEMuxBEepj1u7Aqym9SSamTI6AhKZQZFnlM7QGmsNKpY4ZI98WKromBAwOlvRg0824
         1DaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7nb5JU9zNkMK2jBXoGSBAcZoNHp+03yVGMks+QoUYgz50HbfNdnmaODMvBs2Xf/FSZ7NxvCmWnRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1uvfPuMPbjyvIF3Fp/X89kFAOF8UXTHnAgPTTpqJeHYiIQe+x
	KdDyUSj7dW4eZN2uYsbD67onjDIVtK1e50L3QZ4NLSQBQA/nAOtn5aCW
X-Gm-Gg: AeBDievA4lbtFKgi8oL0gprhRvFvQeQa1q7GMMngav+pl2yhEQqk4/SvbtCFN8Y/GZl
	20kQkGgpPO474vF9xvnybbXWg36UCVPV1AKnbxe4SZF7SR6YyXsY8kqgQruHVPdhdci8Udg8sN7
	7kavRM1yrzCrssA7JYXloaqDlqhj3ks1raddzjkhbtIo0fh82trYZnYfCUtGwmbCk2lQjC85w9U
	NgY8xup1nBZppgMOLf/86qWVSVtCM4YaQJ1mO14mWW95HBi5lgewsuOJXKhRZ8poM64FkQAA49B
	ToyjqhFXxYCItdPrsSFmB68RUIrOyeL9A1rqU3VuT8gIa/MNfdhtdbOs2dEmHR4NdVBdnHhSvFq
	Gze85Gn2kiaMRgJ0rNOY5vJ//6yJWFVhnep/t0m7gUxMXN5DnnyKtPGmLL9FS0CAizlRVIRxQSZ
	WDg8ZZA99vQTHqznqYm/kZ/9NyeSePO8gC0fse11r+D/9OegAo94JHv93o
X-Received: by 2002:a05:6000:26c4:b0:43c:f247:4792 with SMTP id ffacd0b85a97d-44bb32fd802mr14989092f8f.12.1777886038122;
        Mon, 04 May 2026 02:13:58 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aa70dsm24848370f8f.25.2026.05.04.02.13.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 May 2026 02:13:57 -0700 (PDT)
Date: Mon, 4 May 2026 11:13:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] usb: core: Fix root hub descriptor wBytesPerInterval
Message-ID: <20260504111353.55ba2530.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CD7784BACBA
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-36882-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Per USB3 9.6.7, it's "the total number of bytes this endpoint will
transfer every service interval". There seems to be no good reason
to have wBytesPerInterval < wMaxPacketSize - either one is too low
or the other too high. Here, wBytesPerInterval is too low for hubs
with more than 15 ports and xHCI spec allows such root hubs.

This is inconsequential for emulated root hubs, but we may want to
override and log suspiciously low wBytesPerInterval in descriptors,
so fix this to prevent nuisance warnings.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2: same as v1

 drivers/usb/core/hcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 89221f1ce769..fc8130f94ca5 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -339,7 +339,8 @@ static const u8 ss_rh_config_descriptor[] = {
 		     /* Companion */
 	0x00,        /* __u8 ss_bMaxBurst; allows 1 TX between ACKs */
 	0x00,        /* __u8 ss_bmAttributes; 1 packet per service interval */
-	0x02, 0x00   /* __le16 ss_wBytesPerInterval; 15 bits for max 15 ports */
+		     /* __le16 ss_wBytesPerInterval; same as wMaxPacketSize */
+	(USB_MAXCHILDREN + 1 + 7) / 8, 0x00,
 };
 
 /* authorized_default behaviour:
-- 
2.48.1

