Return-Path: <linux-usb+bounces-18733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C779FABD2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 10:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B227516353A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 09:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD53191F6A;
	Mon, 23 Dec 2024 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3a3SqpL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854818D620;
	Mon, 23 Dec 2024 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734944695; cv=none; b=WnCQjJjFi9UTVbRJ3F0aFT82cLGGOFTB7VrPdzjhq+tEk0TjKTSSrUHEVmAorqREcACyt7ekJmikwK0oJDL/KUFBATkQL1ZPtY0MLxlrlDIfK3u7xJ9+oIOZt+9g7udaSN2QE6ECm+7WxJrtEA85r59jyLfEAbe7BC5Q4Nj4cso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734944695; c=relaxed/simple;
	bh=rqCguLHss6z3km760Mwy9WvEzWssbaVxd/GOjg/eQXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KVsrIJSi3m/P/ajKISOvjTvDamaXtGzthCj41cHPEa+SJIS3ooL4UqPt4m0nFR3J7emj4etYQ1Kl5lS4c1qOWPkgckykIIFewW4sRzenoDmnF5Fow1Cdzie7eIn7zJF2j1rr05YynBNfol5YklVQIqtjWvoegnKKKInxnzh3oaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3a3SqpL; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-216634dd574so25802585ad.2;
        Mon, 23 Dec 2024 01:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734944693; x=1735549493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+tw2iOy9UAZe9na+B1fFPkSpJZjdlsl4KZzc6TY2ks=;
        b=J3a3SqpLEXXMUjzFdyMU0x50pg+znJsGdv+o82yLLdyI9/o/C017tMnex7Zju8R/Pd
         vg+kA4M74udDEUmCnUI0xV92IDlzl33MgQwh4qjgffcmdXaGyTMvDfYY+fvExUrbijmR
         fPvmConlcLxiX4u+peC8bNLtBxTjo7A3YJEjVOkxKXv8AwlpgO6t5f5v6Yis1PBEQ2az
         rZzIYJZaK9x3zaRadUJ7tIkxMx0Z39AeySoi1py0GjHE6rIC7LZKgQwNgVrbLXJagAYF
         K88ChbdnsNHyeWkcLPAuE2kmpNDARAUZNglWXKBQgLj3UOg4Qr7UTfQ1f8l7TDMn5cIB
         Z5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734944693; x=1735549493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+tw2iOy9UAZe9na+B1fFPkSpJZjdlsl4KZzc6TY2ks=;
        b=SnGtaBzsO4OMVwnRAgHqTjSNTF4x3eVwwBOi1SDs1G8tW3S0vWZP3DWr1frUUroEtH
         EMZPOb2nG8WwmRdzrXzMmVgtOkLwDVG6knm56eE6z4WTam6ZQwHMHQ4KNQAeZ/VvcmMm
         DrKQzE0g9F2z4T2TCmg5+WL/WQI3kRrtf9vHE48LHwzG/MJefOEHUQ6DvcJ0+62nfXfP
         TbxpgT/OnMXx/0h6dDufQfPOhqCHzFqU9NYGXOzCsE566iQBFQXOCLmpsBThEpnzRrK4
         hKcARcQNdtSklHG04pppPz6rBQ6WwXsbDrhgdh9Zpehd99FU5KXzoKeUohdTO8Gaw6jc
         Mo5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV28d6ELlrY9eMvcoK8SGGZ4LhFPd+3WusKZ9lidn3WiExxeHYhiVjOjJK6KPhoSSH8sQUV3c8mj+8=@vger.kernel.org, AJvYcCVa0jY2deDWT9hGc6298xiOrAx34SdjSNqJViJqaOVK0+hWGpLRogneHl3osQzPu9ksjUYNZa0nokn4Kzaq@vger.kernel.org, AJvYcCWzu6R4vRvj5m429VQUlkod1VMjA98QY/BUThrbKYcAWHeaS6TPO/vIkUB5R1EM6aoJ5Pz2FqpFELvK@vger.kernel.org
X-Gm-Message-State: AOJu0YwHq5Z9ddsPzmPjOhn4zeqhguEC+4ddJzrODHv9vwW1wfs8dqL+
	0z1Hudw0uZIKZaxSbc2KFcgfgE8Owhaep+hlY9RlziBfBIhDt4U9
X-Gm-Gg: ASbGncsLXYw8lpXQhecnaSBw7soTzb1DmmdiMHeTujxdzaBGaVbyw86G8ZRttGJ6VAw
	WnRlDHWe7NcvGfTfXkZXbxbbaTlzm1lpCFap548UzfnyC+CbMwLHcaim8tbCEZl59jtxV5+n/UA
	dOI/fPl/EIXABwoRJDWCa3JTGiy1+3ajovhNqCpoIEL6q1sd5pMkoGFwXTgGY8XeJ+6xXc2VUHL
	zgVDol+fUQe6b5Nesh3Ndx9L1bu+SpZ/5XnEOiktso3HgquWPUbppMCZ5VM4kBXn8q3Yg==
X-Google-Smtp-Source: AGHT+IGoPgCWVtgU82RTsNZB8YYJFXMbnERjFwCHVlZnef3IHUPOb+y4aV8SPRo3zSNa2wVAATLihw==
X-Received: by 2002:a17:90b:538e:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2f452eed77emr18358863a91.33.1734944693267;
        Mon, 23 Dec 2024 01:04:53 -0800 (PST)
Received: from localhost.localdomain ([39.109.141.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477ec9dcsm7937251a91.31.2024.12.23.01.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:04:52 -0800 (PST)
From: Gordon Ou <gordon.xwj@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Gordon Ou <gordon.xwj@gmail.com>
Subject: [PATCH] Update USB/IP OP_REP_IMPORT documentation.
Date: Mon, 23 Dec 2024 17:04:17 +0800
Message-Id: <20241223090417.12614-1-gordon.xwj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects byte offsets for OP_REP_IMPORT.

Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
---
 Documentation/usb/usbip_protocol.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index adc158967cc6..3da1df3d94f5 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -285,17 +285,17 @@ OP_REP_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | 0x138     | 2      |            | bcdDevice                                         |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x139     | 1      |            | bDeviceClass                                      |
+| 0x13A     | 1      |            | bDeviceClass                                      |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13A     | 1      |            | bDeviceSubClass                                   |
+| 0x13B     | 1      |            | bDeviceSubClass                                   |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13B     | 1      |            | bDeviceProtocol                                   |
+| 0x13C     | 1      |            | bDeviceProtocol                                   |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13C     | 1      |            | bConfigurationValue                               |
+| 0x13D     | 1      |            | bConfigurationValue                               |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13D     | 1      |            | bNumConfigurations                                |
+| 0x13E     | 1      |            | bNumConfigurations                                |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13E     | 1      |            | bNumInterfaces                                    |
+| 0x13F     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 
 The following four commands have a common basic header called
-- 
2.34.1


