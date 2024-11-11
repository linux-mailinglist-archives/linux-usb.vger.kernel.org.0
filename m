Return-Path: <linux-usb+bounces-17429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5F9C3CAB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 12:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0262826F8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313801714C6;
	Mon, 11 Nov 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lsVs5Ns7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE818453C
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323293; cv=none; b=X0Rz0PhYBgqGrN4oMAHLpfQhWPVrZlrnFjWexP//TPEKxBDtFlKNMEO8dKOwE0H93JUPRMM5PlZYHF9flC4Hu4a1iTHQ+i4RQYIZjL/exJGdKzvjMFjBOXYmyYidvC9LYsxYhH3oobauKHPu8z2WgWP6iD4xuADjIeZUxUzUHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323293; c=relaxed/simple;
	bh=KrzJzC5LjIibjn2LH2QxndnXkbjvaFOu7KX1OY6Y2S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLexZsX7oKrySAfKyHR6Y57UAEEFtos8cxr97DlgvU5CSF90eQtnJQCUuvickviQrp/8wvZURKkcZelDeFOCbJVhQuwa9O/pIjP8u0jbP8fl/xF6EWig8fgdn1pI0U0ARo9IMt2e0tQiWjACNxgH9ONASKrhFCTcXJU6EovwhVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lsVs5Ns7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso6680954a12.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323290; x=1731928090; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaOpQCnb58xwQNpZJwrt/dM577zB1AHFFgREUTf53Ns=;
        b=lsVs5Ns7v6s2hgGqNxi4GsbiwNcoUmoIQP60jsFv3r11zjG8IIXMXj481uoCNReRBK
         VAYa0LHFURO/l7Ip8fHRNsf1YSSiGUG3RrmhHCmfkY/GBIDJ1Xv/UwijxZFNMVUmsxFo
         93ZctszrjbbKfYKblkvcJNAf82w3MVB9dk67sdPHrvNGXIgbP0vfEgKmv77MgWfZeWjL
         uQ5MDLDQ1XoMGMMJwKpBpocZ63ar3rFTlMSzLjkzTpyseQwF7KzerFTUSES9T9MNnAmL
         YgnYcMptPu6dtMmJrm5YEv1u83Nbowu3DeHAAsXNYL7VERbNNoVRW4eVtXHfCRD6PK1a
         DedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323290; x=1731928090;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaOpQCnb58xwQNpZJwrt/dM577zB1AHFFgREUTf53Ns=;
        b=lPekl5HHw6fUKHGXxFHjcVHLkY4o5K/i5WjDMCAOy2X/Ukg0ufVKnGCjFSbBpEVvTM
         KO83v8E2qFk6eU1PRjZ+1wGDXo5JzhiOCFjuIVWdM5nckooTq4LanX6PUdQ3OwnEs2R6
         n4x0yZTwUe9cXzDDfRMzJolBecLb9Wq/FMbJWycfMkbypF3y5K4VYqUXGTUto7s6c9hg
         Ltyr0SBbx9A2/S9NsQvhxHqKK7sZHj9Iyj0fTItsd+1iO33gwkqhL1/zzShAkjp4kdXp
         zbQ40V1ICZ6KSmFibzPOSznMU4rh4nPtSWcqIj4FGvSojQqZqg51JAqgtZfxVL1Urb4N
         WavA==
X-Forwarded-Encrypted: i=1; AJvYcCXg6reDBU6a5UQlNbwaSwTLMt5nXDNVOQwJZp5KCALRaQXPgJ0OQ5Gq6OGIxLwuYntXTXkMW2xoEAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwPCL1sbL4JUy7SasCV6uqTNV54A2ayiShcuR83aB6W1MyzEq
	PebfhOTW4zWqeh86XEqqaWGuKLOYNl3Nm4xFaTXhvOf5tETSWLlvdq49F3NCBN8=
X-Google-Smtp-Source: AGHT+IE8zTmpxJbeHHX6TsTo02EB6CL9dlS72DZFJARMZpcutHBxnoMI2RjnZgYXTYNZ3xGbE2kN8Q==
X-Received: by 2002:a17:907:3fa2:b0:a99:5f16:3539 with SMTP id a640c23a62f3a-a9eefcebbd5mr1287269866b.0.1731323289768;
        Mon, 11 Nov 2024 03:08:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deef4bsm576319966b.138.2024.11.11.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:08:09 -0800 (PST)
Date: Mon, 11 Nov 2024 14:08:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ajay Gupta <ajayg@nvidia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Haotien Hsu <haotienh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: fix potential array underflow in
 ucsi_ccg_sync_control()
Message-ID: <c69ef0b3-61b0-4dde-98dd-97b97f81d912@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "command" variable can be controlled by the user via debugfs.  The
worry is that if con_index is zero then "&uc->ucsi->connector[con_index
- 1]" would be an array underflow.

Fixes: 170a6726d0e2 ("usb: typec: ucsi: add support for separate DP altmode devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index bccfc03b5986..fcb8e61136cf 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -644,6 +644,10 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 	    uc->has_multiple_dp) {
 		con_index = (uc->last_cmd_sent >> 16) &
 			UCSI_CMD_CONNECTOR_MASK;
+		if (con_index == 0) {
+			ret = -EINVAL;
+			goto unlock;
+		}
 		con = &uc->ucsi->connector[con_index - 1];
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
@@ -651,6 +655,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 	ret = ucsi_sync_control_common(ucsi, command);
 
 	pm_runtime_put_sync(uc->dev);
+unlock:
 	mutex_unlock(&uc->lock);
 
 	return ret;
-- 
2.45.2


