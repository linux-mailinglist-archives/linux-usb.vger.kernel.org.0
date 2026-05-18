Return-Path: <linux-usb+bounces-37633-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Jk0O1l2C2o+IAUAu9opvQ
	(envelope-from <linux-usb+bounces-37633-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:28:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704B57363C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A00F730A5A24
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CD43932D1;
	Mon, 18 May 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msGf+D36"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E148B392803
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135803; cv=none; b=T3YMQvJvh5tHZOaBlh7LerTNMug1++37sYS71AJdnpx1gNwcYRyrid01/nY3gZbw74Y4YVQCDK603W+EC3vngzD6jl4nTo1Rd6FrAI2wTRNVuqjE+YyfQ/SjTmq26ntdFus/RB9Y2z5geDYV1b4Cf+kk/vE9//Xisv12ovlhwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135803; c=relaxed/simple;
	bh=QzaN/O/VlVMdJSFQy2H+lcyumcLYvF1o8hZeXgqCS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdikhKnw+3EcAzIt6M2S8E9hiDVGkWT40zxr0bJGearP9DpedQap2QTm/LZMBs8AD/Gx3c6I5SgdCfBPSWCnkUXAsHwd6dB0/7GaR43TDDWJ8jQAztUz7sOrMRKkd/L1ah0bArNJR6brD30wsLLRSWbbfc7ZI7fB0Y4uD0QRPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msGf+D36; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7d983f79so28225701fa.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135796; x=1779740596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=msGf+D36QGPX4Ec2wrtXvmY3rm4T1+tihRJeG3wlE/yYqqyXSCjPQS77ARYKcXIbbV
         i7CkYoEiNiyJALRwpb7w8WJ6O9vZU7C+83PckOxLULYd0cx6jSbr+biU4gmz3I7nYAVp
         WV17g3mgMZgBOnK8/4ounC0TLMK4r8tZQlOoc2eph0eQOdSWma2gKIVtiO1QXmnKq48e
         qnL5Mq5U1HaQoRlx6GM7otEUv0vw5xJJSLDNtQ+lnwN8EBDPna5Y98fCoicCtRabN/rS
         vILakx9gd0uX7ZoydRo38+KRKQMWT3yz78nf18wDxtLUmiWl/LAg4RLGEzcam88D2E7q
         1iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135796; x=1779740596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=KG3LXqxnWWbeQ+el0RgZ696bvVdjBqGwulgzU+bczmJIUa4JKAdGPnbRZivIsOiuyT
         WBGawrBc+pGZbmz9MApPl5niDvFIPUNsBH5Xf4dPxS3tzqnngM0MZf/u3bUsSM1yse8A
         FA0gsYEnssRbALEotPxtfbO2p90omaZ/TiwjqYVwi9T+VWfdIIRGN2F5ZL4976zRXPik
         mKue2G0bJWjxzGI9Rox0ZTr/FjAdr9qwVuwT9t4gnI0nB+6LKQgJ1xwcJoaEOY6D8ZIg
         wbccL2/dTalIjdxBp3NEsMFgVG61MdWZKuJjzvV96GyWsrSlL7BusimL7V9D+7bVunA3
         7Izw==
X-Forwarded-Encrypted: i=1; AFNElJ9S3Ju8In6N8IpHjxW2jAdV+N5TzSt5ozz7e9rOfCfFtjRhrpDkaUF2tnqFBtXBCk2wpN6j35wrnxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvkSYHY4rFeqp0SIemF2FeiuIZqBaNcHy1urvBR+UaM2uBw8Z
	I2Pq3AQcNFBaR8GN5db+4pQKnXzI7t3Lw3rIh6f3glcpBPYPu7HG+FZ9
X-Gm-Gg: Acq92OGZy9qN4A+0wccHNSADO9tW2XQVrwZw1asi2USrdP8IDbK/grs7WzUofy86al6
	z3kS25LaYCKXsqSU2bsTNLuYYwgb3ctPN7ddMnFnDDS95uz0d2hfoiaMIYrIZPh5/7LloBxYXZm
	GS1WW1ber7W+wbnzTXA04RE9rtP7jHy4Aw4ghD/tfpUISWvMPr1YwHj22zsjnDpxv3nrZ8RIT/9
	3HQB1Lc22u4o2KT4pVspVwBbGCFhpWETCRDY105T1jgvWW51QmUTs8w5zzmKqhZnQ0/47UHH86/
	vCFLGjRUxaqIFOjO8SM9FrCj6P7RauuSANQ22JM4SX8DK9CEBxyEccsi9TX41ir42bqGTD7LmTv
	mBALP0t1BNmmGXs95dPMLpbdYc5/O+w8RgrkQ4TPxoDuo6auKrWLQFYcXLM4Ov6WZzDnmqCTS+6
	BCA8AEQYXtoQUEVpfKPYxytJ48K0UvnkshEd0sVb3K
X-Received: by 2002:a2e:8a95:0:b0:394:635:70b1 with SMTP id 38308e7fff4ca-395619b0b28mr45511291fa.3.1779135795950;
        Mon, 18 May 2026 13:23:15 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:14 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 6/6] MAINTAINERS: add entry for Qualcomm PMI8998 USB Type-C driver
Date: Tue, 19 May 2026 01:22:51 +0500
Message-ID: <f77068e556b6a166ef05f2758d61234a4e1b954b.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-37633-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 5704B57363C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a MAINTAINERS entry covering the new qcom_pmi8998_typec driver
and its device-tree binding.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..d2861fdef012 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22120,6 +22120,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
+QUALCOMM PMI8998 USB TYPE-C ROLE-SWITCH DRIVER
+M:	Maxim Furman <taygoth@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
+F:	drivers/usb/typec/qcom_pmi8998_typec.c
+
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
-- 
2.47.3


