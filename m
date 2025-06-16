Return-Path: <linux-usb+bounces-24782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCDADB20D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE216188702C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6E52DBF73;
	Mon, 16 Jun 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="haZhNVVW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDAC2877FE
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080796; cv=none; b=OkIl15L+fnh9UnFoIM5IsgcFVIRcsWcIVswqs5GYsam4yjdBN6G9KRt2FPjZMQur+maV+UZC8YupvEM3ch5EC4A5fmEoVSznnZ+YV+nD1swGWA8ZTDP02B8DKqB6a4HfHcuqCb+MKunr4A+su/nTb7wwIvWccgW6LttrOpJig94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080796; c=relaxed/simple;
	bh=0xC0NBWhh+5FZ6EevG3lvJaPJC0xaC2CtQxodewDrnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuZMSLqRMoWjPBbGsPzS1H5mv22VBICnoXO8IzeVWeCPFU1Y7urMc556iR+8GD/dz0iggffymGtXQ8QCj44bZ8yX5KU6rVhgkF+dbXp8BAKFKMY93rxDYIjZdOuCSFmjxWzYxJrPTv7ak1hGa+AxFyK5eiwaV+/vxjoF9yzJltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=haZhNVVW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so8593553a12.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080793; x=1750685593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=haZhNVVWWvs2sRVX4sdjaQN8lQx96TpHZ7V715IZSr9SWp1cpVmPPKvOqsao9zLTJc
         ma4N01Caa4nG9jGh0QckyBkcJNPc/CN6Zq4n/1Qu0B7hwoNq4ApKdp1HL0GSfgsEWmzS
         9vbxeE2nOJabxahiqbDOuV/ED1YARdXrhjoJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080793; x=1750685593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=aX8+a102uRL9P2BfkkI4N1MivWbngZ9J5ScRtv3c+74zlcslrcb6ACRy9+n7zsS963
         NOEw2Z/BL4GCRzyHo5HoMB8TM51PWoG/Q3ST1QBL27ScrYO83kk+CIXUrfz2MgzaE5a9
         /YIGboLbbWM5hgedChWUUBIS+TJ0unSim0Q9ybkESCOudMqSQa+9xRZwSPOghBiDLBLQ
         g8B57JHwzXpKYds9r30gDDoBm6w/vlofkjD7k9LQTB8wb+kMo8WDHmnB70Ad1s0zqioK
         HorqQw3B8YF2BU1tkryXLOAkSJxTqeP37jkzXwwV0s2Lkyk7szjN7GKoGZf0VHovkLYL
         XeZg==
X-Forwarded-Encrypted: i=1; AJvYcCXaXI/6SNO8+c/IXTdlRQwvCY+q9iUcbfZETD1itUgMN/8xPxEaB3j01j+fwLKUECnrdjTUyo2alnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9J47f4SQ491WH3RcM84xExmFVap1MuBo2Tn/JSJgw9oK/sRvr
	Vlkqhxmyrpl/gfAiXOLDhQqByeUs5OOQufepqrFKm03NK3iF1KZBMgAwj8LLilTuDw==
X-Gm-Gg: ASbGncsiFFpbTyJDv4lxtsB90amiZD3TG7uKNer02kVlCzQvrGhPoWst6bgRT/l0Pb+
	9BPLf2XVQ8dLtLQZ41pirDN/LX5BSMeMJsCJPAzbpJNbk4cqmBTjDHyP8ZC3hOnSj1PACXUQpQ3
	57uRk/2XVpRjAlnF3y2i98I7j88gh65AAqIrIfGho0Y8rUuuJgdq13JbSm0pLjgs4hWDGjUB32+
	GFcTPYpoOJthI9HYzFD79rdBHu5RgOg/dFuSzsYLnZpE4vTvlZJEZR+Iomz28J/2IyIJ1CgekaB
	SJPHp0t5ya1RuXDX5Gp3OXCLEuTkf/kZ3Nw2VynNu8ZPkPTP7GTPWv7QHnwRxbWcgtyq0Gmi0SU
	hfrzV9A4wQGeaIwIrXpVI3HqbmrUohh+W1RxvLv4JaOET+gDzA6G94wc+7g==
X-Google-Smtp-Source: AGHT+IHEB1jBPDHClH0iincBHttzHTsFdApFe/gtRaP+clRmz4tP9oguLOHtjZhuypGZtB3dDT6wTQ==
X-Received: by 2002:a05:6402:51d1:b0:608:50ab:7e38 with SMTP id 4fb4d7f45d1cf-608d08f7932mr8236948a12.14.1750080793177;
        Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:12 -0700 (PDT)
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
Subject: [PATCH 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:40 +0000
Message-ID: <20250616133147.1835939-4-akuchynski@chromium.org>
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

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..1372becaec82 100644
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
2.50.0.rc1.591.g9c95f17f64-goog


