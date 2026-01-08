Return-Path: <linux-usb+bounces-32053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22978D022E4
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5704305E3CC
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 10:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C3A40B6D8;
	Thu,  8 Jan 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JLAQlQBy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9C407566
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863499; cv=none; b=CLiPoPpHLK6cHXQBdamP2HMmfuQ85ktHsrfj930/Hg0/H2AeIkq2k5dKFaAg+InKgl/YNQngmq2jqFHCyaXhbAndC/ZTEhqCZTLRPyWcGVvxhG9M/f0w5/L0yadN+IMEE+mp66XwLlrDhulfPpmtdeilAd8Z+5Lc1yS+9Wezuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863499; c=relaxed/simple;
	bh=8fQdgmUzZT4hVKpr9jFPYQbv3E5T9OAys5UPv6T1pwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VGnExwlYXGmglb+3VeZB5GtjCeHTi9fkC8hzXDKRupe43sx0iDouvSL7REUJvDnPTD6noXVo5WdTZLOx9msmkzAXhzeQi22wGl+H2l7EbBJChABeJDOu3R6GtDyOY7CSLceq2C9G42yqr3kPjbgSm5J44/s3v++nBICtElSOkds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JLAQlQBy; arc=none smtp.client-ip=74.125.82.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-121bf277922so3051701c88.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863482; x=1768468282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWhuEUJvySClc1pNw5XM1BE2jKG4GXhmun5GIk0jrU8=;
        b=Ku4XjDuyoGh3yJPebQZ2EL7GLvt/wh2e58zTLorEkspWNOU5yCbnIacbNfgHiArtr4
         OwAYvC2gK2O6XGtS/fzHncXfPpdLegVyhtYr80PnhrKM7wDvzmLw9lVhkRQPxqb590y6
         6E1Ek6eJGmkR2MyJenbYsTX6mu/IabrTBsCUqzQTKdn+jZRF/PSe/bjmIZFZcn02qTwg
         PTvXeCnDnudq0SM4F1ZanfBeaH5fT1vXNdtIvi0aTu0kocRJUkIy8p5m4N1sm0dHcnFK
         Bc9HhwkLr/KZD6kcWTlYzUwgfoaODR+xMxmR06d9gCRZDJ6HXDIb6OHNBTB3QjGaCxgX
         DjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGLgM8w44tcu+gDsLB+uf1RnxPqnlGDyRcvY5cy4pbvBVdsvKTcq/yq6+HahDUrfJAKue4lWgCrpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQnZBDMOad7OXbYqIsHfrUM7BHiGDLdluyOwMrGLTUO+8KoMi
	nmudxw4Wb4RuZtsazeYUkAIQ61urFIiUgrfjhTe5DECZ44uvkAKhkMmuOpjk3AGP488o+MVDy3o
	iOB3N892+PXRRAzDik2jj7CvP9jjPbow5wm/PaV2qGPqe/AUH7c6ACrgVk3+DanYLG5HQuYzXgC
	Ql8PL08BcOddh55xRixxESzFQ1dYaIN67jajMH6lJ1KSy8pzou5YvVkn2jSKvlGnHMrb8Ou8tib
	NkCcglKuY6GKkMBeZ/ODg==
X-Gm-Gg: AY/fxX55MTmFaK4dfZ3nlNhWsrxpmcnyTL6JmVaPaZi6ExLyl2CW1f32hd5i1PNwbuA
	cEZbglmN/a6xdKfcTDargBl4MGemuG3hWl48hXuy7Y6jqhuTuiOVxeAzKOJFqjdMj4kcA6jNtLd
	UHKP+Pd3kz/3re2uQBQjUEGf3PFOvMEoaffsLdIbWeud/bXvU61EEAqWPLLOUoCfvkocLZ3Xl/E
	hbutpSk5oARH++o9lwxbuwURFe81GgVBuUmOE/CJdYNas3heCb5NehRp9zrDIMMah+9yMNk+fna
	QtgFNvoqK2dGIBAZDb6yerJD77zcfF3ZO8Jcd5MkVBcRMhkwDY97OscqFluArOp85CTySSRc1Eu
	RSi10N0ACUN9vDQYF/HbEH4YjL7MfEpFy8yEPxeYCc+MljWV/Fk2LVakX+LnHU5FrAF1milIUXz
	7/6+XLiTFWIRpUABldXjX+w0NNFuSvVuJ0YEIxhYzeMJYknA==
X-Google-Smtp-Source: AGHT+IHekOHAXT+Hy/2Rmz7c/zMJcGOJh0EJ2MoZBVpfyH9vCFBaqGUdrzEloAmK6HelBF2iatMvst6FbciK
X-Received: by 2002:a05:7022:459f:b0:11e:353:22bd with SMTP id a92af1059eb24-121f8b9cef0mr4172559c88.50.1767863481493;
        Thu, 08 Jan 2026 01:11:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-121f24a554dsm1606693c88.7.2026.01.08.01.11.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:11:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b1766192e6so2048247eec.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863480; x=1768468280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWhuEUJvySClc1pNw5XM1BE2jKG4GXhmun5GIk0jrU8=;
        b=JLAQlQByMejk6AFDPTgNcWd8E8n5BhztWVLiT1jj1qere92jyYTHTZXtWwTR4b9sSq
         uNvlzHng0ceA3wfGMwTqB/RLBM+LaOaxQIPEV0SaEJWgchhjgfiUgxH47H7bWQGNOETa
         Djtv633QEncK3SQkuhwypk6I02wxZpuHkIMjA=
X-Forwarded-Encrypted: i=1; AJvYcCV1JPRYwhMKuoqvpaPt558WchW3nwZBMFH/IanT4VnXLN8G4JbE+JjI48xDEpQMTV2WNkMn/yYUW/I=@vger.kernel.org
X-Received: by 2002:a05:7300:6916:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b17d2c9a9bmr6109031eec.36.1767863479591;
        Thu, 08 Jan 2026 01:11:19 -0800 (PST)
X-Received: by 2002:a05:7300:6916:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b17d2c9a9bmr6109011eec.36.1767863478946;
        Thu, 08 Jan 2026 01:11:18 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm10623374eec.15.2026.01.08.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:11:18 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH 0/2 v6.6] Fix CVE-2025-22022
Date: Thu,  8 Jan 2026 00:50:19 -0800
Message-Id: <20260108085021.671854-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

To fix CVE-2025-22022, commit bb0ba4cb1065 is required; however,
it depends on commit 7476a2215c07. Therefore, both patches
have been backported to v6.6.

Michal Pecio (1):
  usb: xhci: Apply the link chain quirk on NEC isoc endpoints

Niklas Neronin (1):
  usb: xhci: move link chain bit quirk checks into one helper function.

 drivers/usb/host/xhci-mem.c  | 10 ++--------
 drivers/usb/host/xhci-ring.c |  8 ++------
 drivers/usb/host/xhci.h      | 16 ++++++++++++++--
 3 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.43.7


