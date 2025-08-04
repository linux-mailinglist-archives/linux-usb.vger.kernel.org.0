Return-Path: <linux-usb+bounces-26458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D116B19E38
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AAEB7A8026
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0CF244681;
	Mon,  4 Aug 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jJyl4LcO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C6243964
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298269; cv=none; b=Sja0vg/t0FD4hIx6GsCXWoRdoV0mhA7W3lIvpGTzVOxukKLjT82LVKkkuR024PklKla1+pC91ZNHBbbQEmClJnTqsWKhG5yzYVMXGK0Zlbb8cEW/M7LQuhPXzqUyf5d7QHZyF6WSlQQpwl4BSx8hjKdgvFokODjwhgWrAGb8qKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298269; c=relaxed/simple;
	bh=6Bhn8TVLiVPA/DDpJF49VzDOxmDs4HWaQoUsOlq8plg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPr+CCvhnqmyuEx/5KaEmT8a00CRVo+aJgsn0pLbHg+l2C5DBALnPiMOUl351iUhFUjbfg/h4J6AC3rHK5n3Dea47ZMlvIQecANwYv8SL/4OyZvUqicUcEdwFXnR+y0LLv+rmpr+BZ50+lqubxLa6iIhw1LyK5Vq96sipy0MU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jJyl4LcO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso5476596a12.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298266; x=1754903066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3zkd9Jg/1IWWLetRvam/cO4b58x4mGvV5kNliFnOgc=;
        b=jJyl4LcOJBO5otJknHkRY/bMMfr5oiaGH7EBn8iOgq2AWsTwlWvVe800vlvTmO2fw0
         cf3+XBkXt3DJNV5KlgJupLvMIn6fQrz8f1VEuVCTtsOfD6HMDv5Z+V9kghIMi6kub8yy
         ozLsiXXSAOB2SDDo/oOs8EZaZQqQ8bSF5bc60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298266; x=1754903066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3zkd9Jg/1IWWLetRvam/cO4b58x4mGvV5kNliFnOgc=;
        b=MI9NT4zDquzhwJdPl2ktTJDfoVqi8CmXKiDFTxP8WrQATBc2FZVkl4RRz4igTm+xfd
         KLFZFdrvK8dN7kmQpz+TCc3fEgrxvxMJmgezCgS2XNmIEh0KEUAPzqrD7XyqLRqieayr
         ah9ryYR/Z0czZ0vzzsXBMnBtV+dyA5S933JKOmbFn/0qNMN0ZFi9RWW+hYl+TbCoa/1/
         SYNtvuX5GGzZds0v/bLq7OMFBLZoXIypLeu3TpVdGaWKcloZDHj2FClkas9PUKwtOyFp
         1DovpVS7otOs/F1Z4th0Qz6sPChE8613TK7hnU9y7HikKtMMD8FCTVHTV+y3wxuytt5w
         WhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa3C9rulbl6/tNxfmDtG65xzDPy3DcvikwFhcU0MvF6/iHB3qEb1iPZFOHZyvwgoUQKQhPyU909jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGo0ByDoe02NxNb+nIDcp3G/+bjx60pL2D/u0MLO+hecs4pGp
	Smx+am7V4+bo2LJklJ3LOBzzDOlcYZ51+vwFZuONQSr97hUdIFn/cYZX4woKdxD1OQ==
X-Gm-Gg: ASbGncu/FDxeBZIiCt+jnURYCgrXe8C7TbsWtJ5DElH0l0nC4VALEN8PKAeQBuSYEQf
	z53XWZX70joDjTIylJB4w/X5sFDUoylUXkrscg9VzewtAk/qzGW7B6pali2V29R0hPswpbdYgqd
	tCMb84JtmAwy++JRJryL20vAJKlz8ZtThe8OSGpWpuI9IcKLZHqSMwF2jfQoS2/RIRLrbiVWwCP
	DdLqkTE/lzeqau0Jg2ruh8rRK3L+djf/oPaHnCdYK8uhGZ2DuJVwR4hACCKTZC4YM65kEjW7Cj5
	wrdIBJNnzmFBRTz2ZNyUhpOFIA6VLfNQptGcQr8lde5lPh4qQLxJhWzWyibKbE/lQi/mX9vXjSc
	aNGx+cpXSSjx5iqPMtoia41Mo4y0zCbccEwtQgmZ0FhqbqWrR3r17z6fM3ZWT1Ymoe0Tchfik0K
	NhlDvz5e8Mgp4AlmY=
X-Google-Smtp-Source: AGHT+IGW/LCLdhCJc2+ufotVYylvigS+HVY0E50Z6NorO+AWbE3p7ae6GP/d5eD1odizSiqENv3SHw==
X-Received: by 2002:a05:6402:40c5:b0:615:a60a:38a7 with SMTP id 4fb4d7f45d1cf-615e6eb549dmr7470597a12.7.1754298265812;
        Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon,  4 Aug 2025 09:03:32 +0000
Message-ID: <20250804090340.3062182-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5739ea2abdd1..5ba8b1bc874b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.1.565.gc32cd1483b-goog


