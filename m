Return-Path: <linux-usb+bounces-17073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DB9BBB4B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 18:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17522B2282A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 17:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33ED1C75FA;
	Mon,  4 Nov 2024 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6Nnl+tx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC11BC07E
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740610; cv=none; b=A5wEIzhyUZSn58pFJTUiVADWhQaoLnel0cvn7hNRLg2sQywSyDKlFkYWZWdvR9DVKFOu8cYUXppz2dRVNYD9QD5srRmifV+A7+WmyL4mz3LbV61Q1j7QWZvaRNZY9HCId1jwSF2ZkhyJs7aKmcYtaxfgQpHYL9E2XJHVbl+Nj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740610; c=relaxed/simple;
	bh=dKw5DqDoe8MgxSnmUeCxVwAeG6L9UIQQ6Qj/HTMdC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKjWEutC8hGWySQZRkYUFnRYlGHVZVMBd9Q0/4zf/BoNoJ6DS2ttM6mohmO5jIk4VSFQlBnVRZhyz3gmyYrNBTqcpDUaAmY7V/fV12aMcE3fNi0WfCsfZcZCD0aUD7iJwQQmFZicW4+574dVycg5QkFf34E+vJMuZS6OceWqLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6Nnl+tx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37f52925fc8so2777931f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730740607; x=1731345407; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUsuOJD1CSVhGbrX3jOvDO5f9FE/bKS2dJ6VzFgkshY=;
        b=w6Nnl+tx+T/6veDegQJsyD7dKAKWv3+AEffzAoGmysFU73m8GTjH5Dxkc9Korr28X9
         s1LfY4+7Py9K6KM8AZ5Ih2MPA8vFVfps+0PYCivIJk9yK0yuA4vw7pNMk9ZIyLq0bBxY
         KpwIjDgExTkdel9Y2t513KY+YugLqCPGpXoIXVDNl05YrYI/EaX2aKMSm9wqA52Vlqy7
         68t8omnanjCZBRwc/3K0SPyGIrxb1/lBO4SmuehrY/+w6Z3yHf2Cjq3q6Y1+HIErehYQ
         TFHqEV3WQ8tdKI9QIt5djxETXGh8z0teMkfJHSOBdFwSOKEQy7cNmbLGhx06666edjBg
         TF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740607; x=1731345407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUsuOJD1CSVhGbrX3jOvDO5f9FE/bKS2dJ6VzFgkshY=;
        b=uysRFBMAKL20Kfznflv/y2QWtY+7sDMgmSRJSKS+QcvsBGoxrrbP3DMJLgEgm3iIdS
         uMCyYGdDjOicP+JE7iuZv184jnpvxBXxne4cvJBExtxNQZE84To3AofeW245VRzS62Eb
         MpLDeHAfjuqZ00waV0WpVCJH+hXmCC9W3vhvc1KOvDAkX8U7ZDgGnC44vwLtWrGe+1BM
         5zfDvbFfyvWz5EYFlZIzYU7yU6P3cb4UHGYPA6pvxc329qup+yViw+JKK4YGuLdqU7No
         3xdOkOxlmzncXZwFagehEBGsbvu1DfQz3XjSV4dH0RNpT5Jn/lVVAm8ZTgXCN8MjMZJk
         oxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3KAJ0fQ8W0mRPy1aqFNFJc12AZeen86StSFYQYvq1fmWeh4abdMlBxVGa+0rjD+3ce/YbpxQbNHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26D8D+jouV1yVtP5yR8JM4igbzW0Jdg56sMe6CRX90FXArIl6
	fihXyS2jPGAuew8jmwyOyjy+AIQ6uvPFlv+//JfyTJ3dFtHF38OO5j4xvOfV0UI=
X-Google-Smtp-Source: AGHT+IFfusRu5JqkdiEh/meS4hha6UDfm01Hyu41YH65fzgVfhWnjDRMyOquZQ2D0Ub9JXotfcs8pg==
X-Received: by 2002:a05:6000:4185:b0:381:cde6:4ced with SMTP id ffacd0b85a97d-381cde64d44mr7977658f8f.45.1730740606792;
        Mon, 04 Nov 2024 09:16:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13643154f8f.100.2024.11.04.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:16:46 -0800 (PST)
Date: Mon, 4 Nov 2024 20:16:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ajay Gupta <ajayg@nvidia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Haotien Hsu <haotienh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: fix potential out of bounds in
 ucsi_ccg_update_set_new_cam_cmd()
Message-ID: <325102b3-eaa8-4918-a947-22aca1146586@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "*cmd" variable can be controlled by the user via debugfs.  That means
"new_cam" can be as high as 255 while the size of the uc->updated[] array
is UCSI_MAX_ALTMODES (30).

The call tree is:
ucsi_cmd() // val comes from simple_attr_write_xsigned()
-> ucsi_send_command()
   -> ucsi_send_command_common()
      -> ucsi_run_command() // calls ucsi->ops->sync_control()
         -> ucsi_ccg_sync_control()

Fixes: 170a6726d0e2 ("usb: typec: ucsi: add support for separate DP altmode devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index ba58d11907bc..bccfc03b5986 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -482,6 +482,8 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
 
 	port = uc->orig;
 	new_cam = UCSI_SET_NEW_CAM_GET_AM(*cmd);
+	if (new_cam >= ARRAY_SIZE(uc->updated))
+		return;
 	new_port = &uc->updated[new_cam];
 	cam = new_port->linked_idx;
 	enter_new_mode = UCSI_SET_NEW_CAM_ENTER(*cmd);
-- 
2.45.2


