Return-Path: <linux-usb+bounces-34097-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B9vIhCZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34097-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:54:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97E213E92
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EF3C30A86C7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45CA3A7F74;
	Thu,  5 Mar 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcRDw8Uy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1E39F177
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721686; cv=none; b=F7kkfAd5nFWZWITcN1X88oAt1ewDr8j9S88zWE1qp74I9+V86kwCPNRbqM09QeGeSVvccsgu7IlpD99lxPzwpwFgj3C5xVQC2j/pDtmLcFxWSx1R3pQNtQtFOQv22586LEoiTs81TsxC51YFkhxCwQGLcpn800Ox9xsuQ8Lp+YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721686; c=relaxed/simple;
	bh=fE+vZeSt6bldS9UtZkxfXCaEgvCLnrabSq8b9wxTLhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1+MZo1JtMs/m1O9nISLLrRbUtA2yzq96UBR3XKLK4Mv3+/YCy78xKVeLHQTnnW767rV/j9SN9Fzazfhl/GqMXRPlEmKOce20iT/iYaW7z+pxfQ8OjnLwRqjQm1DgdZ78gmFFiy9OUTvNf71qE3mDJ9WVtvIQYqhYeA7K6mLBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcRDw8Uy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82995242934so67438b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 06:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772721684; x=1773326484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FA8mu7UMK7lk8WkAY9QqV/IxQUyPyzGI/S0j94sfONc=;
        b=AcRDw8UyO6Tm2DDFJ4tWWMl15Bu1hMMytiO3dqouQ89qmz3nO6ZKssoSSdxEraol89
         EBWCRmLr8J8T4GMrfk/Pr8IQMs/wP7aFDoHMRtdaUGUlQJHUTs2jVhNOiKDkc8v/J05i
         9peNyHUgER7iWkBiqKdOiNxozn2kJv251SY9DmJKNl7uytE/pmYgpOwFyv7rUyFyRc0h
         LiSxwXEiZ2Sn1Pm90YcA5mO/8A6weORnYAi7Sy77HtgThcTPB8iCaDyo/kcbE8VFlbmj
         oD5oMMyNDejJ3MWAp8ZHkWFRTUJCT+vh062i09VSgrShHHPjG3FrgCI6MwHDqU13TUsA
         ijDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721684; x=1773326484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA8mu7UMK7lk8WkAY9QqV/IxQUyPyzGI/S0j94sfONc=;
        b=ArkyHLcR3Yr/QOdtj0h9DuvF4XOzqJhNelOf9qF4vmPwbkWC+J74qDB/blcC2Ctk/3
         wT/d/fG/r4S5Yrl0QvgzNHEpfHFLk1a+4A0SvsXAPDZryLGmZlnyvKW84FC5PLJ+PPp5
         zMsRVeiPc326/jWK+zUbRaOFeYQtZisBB/ReJa9VEz2JO3G8p4/FWsyB7zjBBcsfFOVk
         CILStkpXJkhf9uxrCh9CjAj2VRRjhy3PKxN83KESWdj1NX7yN0DQwlU0XZNEwJMT6tdg
         0kzL2wuCC8AMT8fa/s/uFkxfF37sL6z89j67psDe0rXaRmArDEK5WeeHWt5GhgxjzU4t
         qKkw==
X-Forwarded-Encrypted: i=1; AJvYcCUbwPW6FE6YPcrbjWT7awouHU8+6hBHlY8DDB1yRNCFvmpGRplq7+r67KtDoQDz1T8VxCJQTEQ2FhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzj/JcJFFQvEEwENl32hKJzk7/OtAIlx1hd/jBfmqyzq6kpzU+
	0SZV/vxN7YdiMsCjZEVbCNCtx21nHJi5Ko+CYU+6G1nIZAN3TYOBO7eY
X-Gm-Gg: ATEYQzxyBZy1vdJ1E6YAJ7HMF8d1m3hrovOzGGqogJ2j80nuNRyufAw2xerBo6h5v5r
	+Smav/SYVpWMPxl4Nij6gOOJ70PubQUYL7SIHCsDj1IoTJ9lCiEfNfs3NqJN8DqY5CGXqJJwmNE
	Q0r1zsThH2jdrn7jKhmrFYUMBNiQ/S78RksGCyynjaogHUOKrs51mWbhYg3RroiKwnLZM1lHOUy
	pKGas+p5eMHZ57spXqayPqTHsErgQp1kWiotjClW27pwpaG5+3yINvfbnld/k8sfPUzRhZcITN4
	XJdHSJN45GCrVnrus1HpevC5j1s4U2PcZlNBC6frgfbwyPUTSgUK12B08irf+OKncP9VzuWM6C2
	t21XYSHCmztRt6PEC0BTPneF1ZDMIy0Z+OfftZ0DLvFrogU4vumVLDWVim0dvn8ZtHUhYdWWbuf
	7BixjUHl086pMKJwHNB/mpFMVn8Vm2
X-Received: by 2002:a05:6a21:9983:b0:366:14b0:4afe with SMTP id adf61e73a8af0-398426017c8mr2476782637.37.1772721684447;
        Thu, 05 Mar 2026 06:41:24 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73818d94a4sm3801271a12.17.2026.03.05.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:41:24 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ucsi: huawei_gaokun: make gaokun_ucsi_ops static
Date: Thu,  5 Mar 2026 22:40:36 +0800
Message-ID: <20260305144054.27848-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8D97E213E92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34097-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The gaokun_ucsi_ops structure is only used within its translation unit
and is not referenced from any other file. Add the 'static' qualifier
to avoid unnecessary symbol export.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603050203.KD4RWA00-lkp@intel.com
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index c5965656b..ca749fde4 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -193,7 +193,7 @@ static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
 	gaokun_set_orientation(con, &uec->ports[idx]);
 }
 
-const struct ucsi_operations gaokun_ucsi_ops = {
+static const struct ucsi_operations gaokun_ucsi_ops = {
 	.read_version = gaokun_ucsi_read_version,
 	.read_cci = gaokun_ucsi_read_cci,
 	.poll_cci = gaokun_ucsi_read_cci,
-- 
2.53.0


