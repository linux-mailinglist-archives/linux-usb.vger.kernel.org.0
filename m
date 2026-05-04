Return-Path: <linux-usb+bounces-36883-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB/XDeRj+GlJtgIAu9opvQ
	(envelope-from <linux-usb+bounces-36883-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:16:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365A4BACF7
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 11:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 209443018085
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C406376464;
	Mon,  4 May 2026 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VW378ljQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B6376479
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886174; cv=none; b=fr3f61eQbDs/2Kvpxa+U4EBU7gIGI6J+ZCe2383pIDkm3CS5h1BntXfw12G+XrvGGKSMe+KSW9agzOl0BhDftcNacqROkRRMgKt8tqQ2mB85//IQPgULw5AU7Nuyyyc1x60cinh+NKauOljTrn9ATa3JUGK5jwTKqgrq9HzQi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886174; c=relaxed/simple;
	bh=E2/0/3HZlF6L8ECZLIYbqr1RiP5uPZYK7csbvS2Zlkg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K8bcJbk1ROqfzsz3jUixWVVu/0NNYpi6iO0EsT7mw+cUU2aSG7rifKreaIwfdhIlK/NM0c9/WCsxehJS3z7JaJmk6aASaqxjw7UQgxhJlj9R80dyn1iRZk4bX2bOI0htVfIelF2dUUfNrHC6Ibbp5sdZULV/WnFywNpm/siInh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VW378ljQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so2051166f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886171; x=1778490971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shwVhb77dPxS4n2JZIDKWi0MH3W6ZtPKvDbHq7WuSc0=;
        b=VW378ljQFtJFndtwpgqqwJa3pg/tS/8wsf7hXoZz0nOixIR/jCgO16zt9+y/t5TN20
         I9wn5oGMv8oTe1Z5FWzTfuernXj/XQhv2rGHeKkl0BshvG7fI557DZyRs25WI6q6ShIn
         8T6IGE2YjDYOqEaJncMz0sptQI1a16FbTiuxMY93KcaWfSAXDet0svQQvJwqpyntb/14
         XnuqnmjsYJC/mCXBOEnnJ0ZAXg2uU37aSGgO0TDGfKq/01sWvW6Ey17Al7b4mKSC0X1s
         XNYJZx4myWDmDTZlDVU8CF7iBoTZYyNnRItr56ollyddAeYqmEcNfmue6Wtk0ilPxN8J
         SPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886171; x=1778490971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shwVhb77dPxS4n2JZIDKWi0MH3W6ZtPKvDbHq7WuSc0=;
        b=gHoPwbYHosvI8m8riWHTA8JBhTTxeyBkBQfQcaTp1LM1VZ5T0wAf5FxTj/YhDErZKG
         UM67WwGNj+fBnLcGvGw2jVe0Q48qBW5CoUlYjMpFT2ozF04zw0Ps/njoxTA4dlWpcR1J
         PmmQJ1k2SXwksYLJaE9mDXlOlJu4TKiU3MA/8G2x+080jG9H5Y/eZaCohgc3+n9snuYl
         0DDAnmz+IkDan31bfplmQtiF+4DB2k6IjCr3g/fJ7B48PzAevyM8COShDGSVssYRU+C8
         2pyDr1ArYLyHbQcUmkTGuX5AAm26x/by89nVCVOPtUE3frKsZXYAGGppjH52taGWP+Mg
         3UBA==
X-Forwarded-Encrypted: i=1; AFNElJ/6YHiajJ/uGvp90NpMwm3734JUrgyv7clOi0MBJVvCvZc2zO1WCfpKHCSHXm5VWRRtOAAtGU61tYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKj15dfQkFz7g9POWUTlIeAbUMYZL4+4HEotbwdqUu+j6Zyeov
	n1YyMhQI8PMY4bn5pvLb5nUdq6rB6tuT/B/qa9z6iMV4zX6Htc7lPD3k
X-Gm-Gg: AeBDiet3LEazQr0/L8LsAEy1zJP1KUAjXWyhcSkjvkBxa7s5jPUco4tdmXlsE0oD8Tt
	UbgqQ5uUIGIt4hVksAYaKUEYHbQAlgoeItxC/LABoWB5aYOU+uA2hQfe0iwUEGo+NpzpQKYABAu
	sGrRsH2zUcxdWYhoQ8wWKIws7LmLYEz7NlIl7YatX2tzXox/CJ0S7piVtHJB1xNNbYpjY7Sn6Bv
	W6XIubO+X0wWWqOMxy2/9qtR6YRJT/ZISjkWKu2MStsCFHP/Czf97FABIr3fobsIPq79cu9kqvj
	60kaEvfr/YoA4O7+zHB06lwyyi2Eq8CPjOfn83wRwDsDz0Vwqw8VTH+32w2jtIYjuu+szyH9XVQ
	+GcTMu9mh7GgA8cZ6hsYvg2XTaQSJd3DGcomeOpGU74vYYxdAULcEm+GQELjAf1YHodakGU25mx
	P4eTbulttiMyo6y93d/zHPdAVO63JYpgf6k/76/vei7mq3cg==
X-Received: by 2002:a5d:5c89:0:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-44bb5b4cbdamr14418493f8f.32.1777886171160;
        Mon, 04 May 2026 02:16:11 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981dee90sm23981273f8f.22.2026.05.04.02.16.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 May 2026 02:16:10 -0700 (PDT)
Date: Mon, 4 May 2026 11:16:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, <caiyadong@huawei.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] usb: core: Fix up Interrupt IN endpoints with bogus
 wBytesPerInterval
Message-ID: <20260504111606.3a312549.michal.pecio@gmail.com>
In-Reply-To: <20260504111353.55ba2530.michal.pecio@gmail.com>
References: <20260504111353.55ba2530.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9365A4BACF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36883-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:email]

Tao Xue found that some common devices violate USB3 section 9.6.7
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

v2:
- added reporter's tested-by
- use usb_endpoint_is_int_in() as suggested by Alan

 drivers/usb/core/config.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 6a1fd967e0a6..74945cd30cd2 100644
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

