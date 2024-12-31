Return-Path: <linux-usb+bounces-18926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D547A9FF094
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 17:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D443E1882F3E
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2441991A1;
	Tue, 31 Dec 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbWlbdTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0183F9D2;
	Tue, 31 Dec 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661752; cv=none; b=oJJBuNjILIEg2fOV3+iHuLs2g5dTx2HOwlOIhrMS7NJvuHo1WTcfDJ93CPauj/41YS7DZYP1LyaXHgPrpPgZtqRKWrn/TSjTtR4o8DU4ugxRKzrbstY8yFQcUzLMONcUXo1Zs94Osxzl5SjTjOixc3MJYaeuLQ7rOHCBeuZ3Hkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661752; c=relaxed/simple;
	bh=F2roWu3LQyMjlrnbo8uxzkFdTeeT/hfp/QkLdJerWwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=prUK0s0RlUACQIuM2hiVaF6sTQI8TF58UHuCg4nl2Q/5sVBoxeA/rfHNKKQZ8BiURrkF9WADQ4kFbtr4qy6KFO6Z/MBRm/Uia3CZho4jr08fb7+IH8hc07e5TLfqmN5k1g90ORpm4pZV52XaoShzjQMFw8bvEaG5VRHxj7HgfTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbWlbdTn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163b0c09afso132130475ad.0;
        Tue, 31 Dec 2024 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735661750; x=1736266550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsPu+N/CmWOe/b3bw4QasHMvJvrFsYF2ara739b4EgM=;
        b=IbWlbdTnqsMgm4AfOeZzqEqLhxXghLJI34kpaij8F1MjrU4SmNLoLRldVJeHr9O3Uk
         LT3ku/hdM2vJUHardaPH2khfFVBnc+HIuQA4MvL52kzHH3K8UxGWYvRuAlJg9y6PzeSq
         aQQLAFaHh5zzH6bcsQ/YzdfX2npGJkwdOKLXE+tAMOn+i1dsHu4+Z09oup2N0XKbq2y6
         pVbSlWlymACfbbj2Q3bVsNFj1Nt9TM8JJLt+AuIPb5XZM0AfDzxdAXGjsDiw0FEAb042
         m0UJVPF7NWVfsugUghrLsECrmodPyrSp8Kd56trmgjjOL9hS/nT8C3zKzazdqI4edLFo
         dmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735661750; x=1736266550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsPu+N/CmWOe/b3bw4QasHMvJvrFsYF2ara739b4EgM=;
        b=wFbFZOubmIUwOjRQzFdD6jEDrYMaKh4IxetRmhGMy5hwRAMVXbAWV3H5oqMwvYpNXR
         9kFEecSz84jrRi85HRa2wwTcpPnYtgKoxm7tUXDmziE/ipvSOwa8QYpkfy+avMvhVpBi
         pnKSoao2YJ7MjEXmlTxWoxNlls4emNAPOzLY26OkRtellRoOYza6RkDHZCYpQCLwljZV
         7dRO30JV3J0Rn5jYDBGUrcJR4ymVQB6ICjqPz++NP7U9nkUULoaZwad1sx9HpzEZyVKZ
         NJsnMN0qxET/BelpKmAnVBXYbPpnraQOPXxSTMWx2C2JDe69J1RfDo5EVwjHSYxMizcy
         F76A==
X-Forwarded-Encrypted: i=1; AJvYcCW9Mo52reHQkYc9zNQCbcjLnH6tkgSmaSQAxZZRqTkCwhHv/ymOIok2T8H+ot7lpqkTvpPlfnJr7a5jvTY=@vger.kernel.org, AJvYcCX+iNnVvkBT0WSQn/gFxOp54Ni6xwc4/BwkjoTBoWHLbFOd75W4Tit0X63gVwxbHtNG9Gq+5w4lRRBY@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5pqFjNsIZGnguW5A8pqEKHDZFMfMOiT0FMFY4UCQD078e8fe
	w/a6WsEm7w77sEFNUAiAQ7qY8kY+VkHup2UAJ5yQlHKyYGt6eVm9VoXQBw==
X-Gm-Gg: ASbGncsglszXw52r7Et9G11DHOOrx7xKaW8qEB3dD6O8KQgoDZJOLPY5oyJom7/f3VC
	bJtBKJcMaTFyBmZgZG8VEmQimrwKuwRE+u72bgbiGGoKxpdKcohlybwqEFjQOfg783xIPwgA4uH
	0qKA1zTB/mC+m+uMu3/GSQybxncpmBBeBGbgRIE61SFkN4KeuRmlUiEx517/CSmGjPeIA2LyrK/
	naHrVOWTWZi2VhsmcI8jl0/ri/QxRRotZFwMYajG0HLD+S9VGniKTnOT9qdHR/1ig==
X-Google-Smtp-Source: AGHT+IF56wi7UWJgG1vgPYX7E4aCHDdoBy7+46E6OSrBB/ZwiHteKJEtuhrwUCFg2HmWz320Eku40Q==
X-Received: by 2002:a05:6a20:431d:b0:1e1:bf3d:a190 with SMTP id adf61e73a8af0-1e5e080c83fmr60157119637.30.1735661750339;
        Tue, 31 Dec 2024 08:15:50 -0800 (PST)
Received: from localhost.localdomain ([221.218.161.56])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad90c2e9sm21791083b3a.180.2024.12.31.08.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 08:15:49 -0800 (PST)
From: Xiong Nandi <xndchn@gmail.com>
To: 
Cc: Xiong Nandi <xndchn@gmail.com>,
	Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB OVER IP DRIVER)
Subject: [PATCH 0/2] usbip: Fix seqnum sign extension and format specifier issues
Date: Wed,  1 Jan 2025 00:15:36 +0800
Message-Id: <20241231161539.20192-1-xndchn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiong Nandi (2):
  usbip: Fix seqnum sign extension issue in vhci_tx_urb
  usbip: Correct format specifier for seqnum from %d to %u

 drivers/usb/usbip/stub_rx.c  | 2 +-
 drivers/usb/usbip/stub_tx.c  | 2 +-
 drivers/usb/usbip/vhci_hcd.c | 2 +-
 drivers/usb/usbip/vhci_rx.c  | 6 +++---
 drivers/usb/usbip/vudc_tx.c  | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1


