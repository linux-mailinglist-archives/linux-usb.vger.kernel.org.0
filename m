Return-Path: <linux-usb+bounces-27602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE0B45A41
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3DEA484E7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1110D3705BB;
	Fri,  5 Sep 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UC9gy2e6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C20370591
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082142; cv=none; b=hKzs0MEAZXs8eQbvkphi/oEuK/IDcJj7RAwbUemiw52BB+kSOmX+YVwch111ikKi893ob5gNMo8VlcErAXRFBA+HCpazIlOrfarv0RiUOGr4hkXCUL1uPB4kFTfQyw32XDdDIEPLSaUXsaSSpS6ZYNlEnYnSk8Me9ssdm7XZphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082142; c=relaxed/simple;
	bh=RwkDpJ4JMiS1lt6rgk/ttWd7Imn2DX4N4/is1V6nzBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHTddo+VST92D/w0Oef8DzdkslfgGKw7WyOOXRBwD61aCVUpr250DzqYuTx49r1gwIHxnWigOnjKpSrqzOcZK3C+4DrhcWMnlC+M23EpyFRJXApWvllfR+pC5nkn0XbCvjikvkXWev/FE2ciGe/YWDCVVZLPvpa+M6kyff7E324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UC9gy2e6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b046fc9f359so407862666b.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082139; x=1757686939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87ag1FHHaswWtSbB90U8zWSxgzWenXvtVjHwVBb5b6g=;
        b=UC9gy2e68kBOj8z9txY31jbyA1LYZEcwZHPYxy+uuCTVpJlLr/h/xrihaYStH+1/AY
         OIyzvS6xwMwEpupl583SYYyMTDS1shtXE8z+Q26ZCUQ1YM46rRIFOPEFiiEWnNqQKwnF
         LwPtS+fB7oxhJv8PsQfiUySTTK7NkVCO2bbyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082139; x=1757686939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87ag1FHHaswWtSbB90U8zWSxgzWenXvtVjHwVBb5b6g=;
        b=EZP/9vyonuxOWJnjKPes7dIYSAE3mjcohw5dbQIl8e0B6h6EsSWASKMltnUKgbHJ41
         c39RqE744dCvL7TstguepIzG3057kVQYtXmlxqf+BW1YNE7Szum7erO+07SVYqRn0paY
         qIIyMMvRblBy1Cmbc8hx5DQhHZEFyBH/nCCYcgwSUY5E/zbemZCnWetGWrP/CBCwNrlE
         UoXaEr12rh+ziyS8IvLpvCXqEXZJgkrRoMK+Gqn/IXP8jq5cwl0PHQdKwS/amDBvT60r
         gBtQqr3x2RwxupygBUBweEMD2DdbOy7qUnIbE89z1rUEMaWmFXIO4DUfOWqGUbc+1W/F
         FwEA==
X-Forwarded-Encrypted: i=1; AJvYcCXwUumkaWO6L5XMsRNej6NsmqG7iRBFBhmKbJ2VNqpsymb882NlqXu+nt+49UgyUkLklR9mGhX3rWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JXkN7QicisJ4ewWzKEZxC/5iCSJ3j+MZVTDmwuge4Zo6q+IB
	wE3SSdaFELa6chhBGWlg2l1SEfNwdqrkwiJQ7EwjzOy9Dy7FtS6mUQVJRAdOXMlQ7g==
X-Gm-Gg: ASbGncsiAFmtdQA5vPBiNKYnQzQ4diTjETQqEGBy30XWxJHplaExOPYXVKwQlGJgEtg
	nzxRBrMJ4Tc6Rfh1njGdUUtUwf3WrqDzKwJxcFmZ9Prj8jPF4NX9L5iXZI7536TX+2Bc9yCmPBr
	gDoTwlWeAaP6mweAnz3EUyvN2kdAxfUmysSv94irM8eC90zqPIo8IEU0NpglWCu4GztZCu+M9tv
	+6rNz9dKlgvW1GNBuAyZFzfSCwTydBkJcCXrOEaNiwnlJUYnPwsM7MznQnU/yHtfUMUnGDg7HCc
	Z2TNlctIMxtdiEqFfmD8HmynbbZyjvN9hzQFlw332qiCMdhzrkhwZCFjfks0eOKs6Em0Pa8MNAS
	XbEoQjsNLw28bPQ2AnUA+gbWI/MSfVrRnGa5q5KnNPTMwBKUoW8qEzv89FcwF6vuJQiIcciF9Y1
	eo8YXC/cJyLWi7iZY=
X-Google-Smtp-Source: AGHT+IEtSMMMoUQkrS0etMzB3nxVu+EiElCLzWoEgWR+jsVPfiruWufQaw8VaX46EwAq7cMBxoT5ww==
X-Received: by 2002:a17:907:3d0b:b0:adb:428f:f748 with SMTP id a640c23a62f3a-b01d8a72fddmr2287245866b.21.1757082139041;
        Fri, 05 Sep 2025 07:22:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:18 -0700 (PDT)
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
Subject: [PATCH v3 3/5] usb: typec: ucsi: Set no_mode_control flag
Date: Fri,  5 Sep 2025 14:22:04 +0000
Message-ID: <20250905142206.4105351-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0d6b0cf5a7cd..9f754344a841 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.51.0.355.g5224444f11-goog


