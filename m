Return-Path: <linux-usb+bounces-37481-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBBdEvPlBmoHowIAu9opvQ
	(envelope-from <linux-usb+bounces-37481-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:22:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8754C569
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72F631C85E6
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF5442E016;
	Fri, 15 May 2026 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DPnKhZhC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC742E004
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835739; cv=none; b=GRfz2WVmfKzO7Nmc+IgT6uNs457XMReWlxhhWimHaZSTU/A8Oa8HvZiLUwDvA7cSR8mPTmuq+UklbAH5DM/k3R7bjhu48ZuuaPVhnDKZCnnjX6DjYTwjR3lQmXU3ZcHZziD5hdRwhjOSMtNL4DR8pvZq+Gz/+YvzhWFs+pHfcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835739; c=relaxed/simple;
	bh=QIk7JPCunkbKluanxQkxUv0yYQaC75cEo7KnXQQKbys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZvQ3FSLtKyhB0EyeERp31OL4yugEeQGH2LvLtvZa+1TN0NMD8oGVecXN2IUKi4YMR0S2agOT5je9Uc8JO1WcAZLWGSwfMF2aO5+rIUB9oZVWWLXmd6HEp85quKCv9imCyNDccFEFlSw55pBeH5tJNaMmfNqJnRWWDMX5aGJv7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DPnKhZhC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3664df32e91so7795717a91.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835737; x=1779440537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+04SKeVBhvRIfsHaTWxnqsLENnjwWESaqrABBm+vFKc=;
        b=DPnKhZhC5Y83A/rt7Xy0jgw3iNZL/jL2ZLVbssKOTHrXzvVEhcGIHbRsC9C6wTIBMV
         ExuKaY6V0JcsnTZB5oanONfSbuT8RyWHyDYpbjukDIY2oCkh55PdyoreUEcMFuRt5pg1
         yWBdSAWq9XnD/mbhJehUWWV5hLvNf0lIWuf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835737; x=1779440537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+04SKeVBhvRIfsHaTWxnqsLENnjwWESaqrABBm+vFKc=;
        b=OZqVCWo/5CWS8Wud/QY0rLo6jjbZcFEROzfwVXR+aexK09u/ywkZyrr9MpOZ7GwcxW
         Gkhi5IldQD83VJWANYRm8jFYaAE8QrtWLyURvyCJfx+BCMW8f+fTPAdDuhJKpxuj5xnJ
         eIDFTmPLi9gC7qheAm973Av1u3xo2hCS+gp9Sba1gxIZw4JwtnKnFu/4mU74JPwRFgd6
         OJbGzhFEnHSKw5Zf8N3oUaIS9t4zegO9VGuZFwup+YwfIDCnwcS/oXpCH70rqmt6rTWZ
         oM3C3Ix1tH9T/B+lufhId0acOAA/LNc5vsS4g9Fj0VpzbQTvFNlIoloAZPiS421CTg9o
         44tg==
X-Forwarded-Encrypted: i=1; AFNElJ9V2Nzo1XZiERQ40rJRr3FHY0MPzX8BGTEm+9oI5hKa/w++IjoxF2KwsOYZ6TPc4ZKJbz5/nr093Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEsd0512RgMPJvKBhYwhKb+wXawEqApVOYdqiNlLQu+R4XJV4s
	LAl7cmMiUAMwA8gIzAzXOqnDwppxorMxZaqU0wHP+z8wiDp2s3S8SYXuNsuDgQrjBw==
X-Gm-Gg: Acq92OEgNgHojnrrXUbqLe/btvwIUfnn8RsIJ9sNpFp5VOXjKbHwBY8H4qI+nAcIpXk
	7BtdbQj+j3mBer7g++ut5W1HkOkiZApk3/JgjHSyqu6HzeRMGid1EYXHCCCfRN3FoBMur/TGPmx
	8HDLogCxBvOiLXc/lKcyAvODd8uvYXsCa/ne3lTCnOrDdW2foRhmpnCpBSdlFfim0zyy7rOv4KH
	x5SjxYhXamVwCIjd+3PbXLCgEfa0L89e/ZodWc6+fJOLgqFVWY5D1xt4TjbCsMj179qjB4pAyUV
	Yi0detskpzMap5/CWbI6TWIyRCVXpOcteIH9TtnQNHtY9k2IVSm7Nh8U6djVn0NQON+pVko7yuD
	L8pG9FqmpS0ou4trxnRmwQ6JKcutV0ZfGpQUTsQchIYe1nvH1gfqkiIYOjVAah6OU+M79+xzxjJ
	gUenS+ZdAAnVA2X2bhvRdh7IbhhHEg1DSK0fYiuHlGNjt9sI7lij8x2tz1k0fw/nIAxyudPTPV1
	jA1QCp7
X-Received: by 2002:a17:90b:50d0:b0:367:bb47:9fc2 with SMTP id 98e67ed59e1d1-369518bae79mr3243819a91.2.1778835734722;
        Fri, 15 May 2026 02:02:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 02/12] power: sequencing: pcie-m2: implement port index matching
Date: Fri, 15 May 2026 17:01:38 +0800
Message-ID: <20260515090149.3169406-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DAD8754C569
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37481-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

For USB connections, the upstream USB (hub) device could be connected to
multiple M.2 E-key slots (or other power sequencer providers) via
different downstream USB ports. The provider needs a way to tell the
different connections apart so that the correct provider is matched.

In the previous change an index parameter was added for the consumer API
and the provider matching function. Implement port matching using the
index parameter. We simply check if the remote endpoint's port number
matches the index.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 16a332f9da7d..c9aed2c02e81 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -165,12 +165,28 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 
 	/*
 	 * Traverse the 'remote-endpoint' nodes and check if the remote node's
-	 * parent matches the OF node of 'dev'.
+	 * parent matches the OF node of 'dev' and the port number matches
+	 * 'index'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		struct device_node *remote_ep __free(device_node) =
+				of_graph_get_remote_endpoint(endpoint);
 		struct device_node *remote __free(device_node) =
-				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+				of_graph_get_port_parent(remote_ep);
+		struct of_endpoint ep;
+
+		if (!remote)
+			continue;
+		if (remote != dev_of_node(dev))
+			continue;
+		/* For existing users of pwrseq_get(): index = -1 */
+		if (index < 0)
+			return PWRSEQ_MATCH_OK;
+
+		/* Check if the remote endpoint's port matches 'index'. */
+		if (of_graph_parse_endpoint(remote_ep, &ep) < 0)
+			continue;
+		if (ep.port == index)
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.54.0.563.g4f69b47b94-goog


