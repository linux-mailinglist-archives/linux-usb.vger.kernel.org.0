Return-Path: <linux-usb+bounces-24781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FCEADB21E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD10E3AE7AD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042F62DBF46;
	Mon, 16 Jun 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VfoyGgc1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996432877DC
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080795; cv=none; b=qONKTCT12BS1LZONxvMjJcYvcVOGeNwTktVvMsuN4sDppmbTKIW7XnaBZO6WEtpimil+ahw0yryRYAVg3x/JtD4PL1GuURjTSbuyL1TkhpwQSalXeyS0j7ftsM0JjK/n/CkEerQ94e7LGnQEEouYCcU03i/ZokbcZUIEiKM5Qo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080795; c=relaxed/simple;
	bh=Zr0by00gzuLqU/8noVtlHXiuZTGL3C9qQp8UPrlTVhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTIODMMfOIPZhN62f/D580GIZrj3YqEfkfVOfmaLTOjuS9Z7pn3ji2VcdFJAOQfRfVpy6wBhUdUaElHUL5VlWyhd3rzdT+EdUwlBW5Suqe8DrKOspNdVIcFKiV5oYDlVNifOnofPHQMV676Qa6T1cq3NZ6Ufg55iWxYxmynkCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VfoyGgc1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso8094859a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080792; x=1750685592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=VfoyGgc1ag2hNEN0A+rWuPryMy2nRVOtm0KMNFSApU9jD38nzEfw+mSDyIkBIKsUjm
         Sz12FpO9L8M51ntJ//H3Te1TBps1xtc3U2pgKWcBcTM/Ci0wwsI8iEYbYqv8lQJYlJZz
         kZkB/vOThTJaK4BprrnKADL70eoVgYWqPThx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080792; x=1750685592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=GZYQxdJmLQcOJuyrRg8dI00jpxAqxdWFWQNIv2moYDjFrdZZY04FOYrPFxFYQpQ8xN
         smkt9QYhRpqZRnexdle5V9yYAtC4bmTskF+ovKoyMRu412ZAdLwfjtJpNLF97BuwwoHt
         goIp1qmw3OrBNc5oQoaIoFw4pj2+Qbv3Yp2X/65r95xnNSERf7+fCIL3Qcg5J8qdYM46
         zRzFRhFl8Qbo9Tsz3UP+xla9D4zFHMaz0O0+41O9oAGu9nBUfjvaT/FWmhoYcnG/d9SI
         /vTyFlEU3qhRkJ3WF4kr1DO7ZSsUg1ODfiBnmAmyfm0uh9vItqIEJ037suVD2jxVrKet
         DboA==
X-Forwarded-Encrypted: i=1; AJvYcCXvqWVQhdxvhbEDAhrTMX5KNaCHhyC0h2Z3waZ5zy15hI7WMrVTp5uEEj8/f0ggvNsgzcjRqjDfX7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkk5UVJt4+Nob08Z9P2pi4y0SaF7UsuFI2bdRptLnfQ7gsSWz
	UyGaYnSySySK4o2+Z4rXiaU8+VtKHiH/FdKnGSTtGInSd71lt8ZLFvV0iJVYACAsKQ==
X-Gm-Gg: ASbGncv/lAGgvTcpmLgh9Iv2p1qHw+Vh7zUfMGvzo0FuEkZH7PEUPqM0/Im2AUzXlIO
	uupKbsefwzWvoAIh9hZfD79n3UsufxIn7f+81046yplsuMKTDA0YybwGb03VcVoIyAWF5RTKS/7
	CzewqCB2TSN048niPTeRG7w/rILZZ+bYcd6/LKWb1/1Izz7NoKREDK4KZQNQnHLHn5e/WlpgW1P
	pBvXh0Q449QV5K7D2a4J+/sNyhk2WU1cWvNpd0AcG5yUN5P62BnJZCYshWTbZvX8I4HzUAvlKdA
	FnwiKozqKbdn/JNVs/TSy8SysonohAZ77oXol8SeAuah76Pm0pmmLXlKKJfpd9Z1/D/9POHRKnf
	vjM8CvXKE3rq20uJeTAghSg8QL4tubBZH18JlNh2TTtdXYr7OoQlFLw1EhfPBaQtW+Ibr
X-Google-Smtp-Source: AGHT+IHjZH5bwhZ1Xd6IbpKopcl9AXhlpygAbGOG0etGiJyiXrgesebapu3fw6k5UbnpFpkYC/Jj0w==
X-Received: by 2002:a05:6402:5113:b0:607:ea4e:251c with SMTP id 4fb4d7f45d1cf-608ce4c0fccmr8482617a12.8.1750080791872;
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:39 +0000
Message-ID: <20250616133147.1835939-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


