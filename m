Return-Path: <linux-usb+bounces-37310-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEr4IQYAA2rTzQEAu9opvQ
	(envelope-from <linux-usb+bounces-37310-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:25:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A351E805
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18E543027FC7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 10:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE8A4C77A6;
	Tue, 12 May 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNGtVUl5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72686255F2C
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580907; cv=none; b=hv4w/ggJza3bj2cO9Jv7w/BtrFutyflOoxtaZ9YXX3eKxWHrcRx7MwYdgfzwmKtiKYJjkKofItAoZqz5r7EBE3pnuEYHBuh9/lsQduw6jqvaBoqyp3yiJtT02Dcs82vNszl7iobQfyza4uhFHK9tIgDUWZMrmQOKCNcs5LAtwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580907; c=relaxed/simple;
	bh=2QRlf8TtrGAzb92WjSJ/VIQrumsR9VRuS8WfIgv/fgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZvkyoCU/7oRz95TA9ag9uZ/aOxMmzlDU+Prv6RqKgHh41CJjwEhpVWyYNVzdi2hWbZsq+mqdbP+khTsQUKWNw3DXUo9eeUBkYLlENQQjYPIYr90axswQ5iPJxdd9JEJvU5TwI2O9Lu7q5t3DDByTCeL8U2u0vmXORrU9Qrhi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNGtVUl5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so52144315e9.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580904; x=1779185704; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97EuWmgETgjG9Q2E8S/+pdJDfeJXRUroPOhRTM16Bbw=;
        b=fNGtVUl5V0yQeAvjNKNksQMHdi27P/StUu2N5oKPw1hTwXb35bjF0awDVxtQLxAXmk
         6LohkrGJqZ8Vn7BpNY9eeRISpK9WQtrJoc9mhz5LWCla5pP+ukiAv6kUSdTQtLvuG3lF
         ukrpyzHRUESmtqb4zjuPmVCsxswCtDKFdNc8TAc+ECSu7w+76EWWuqB1g8BIREyTP+jx
         Gd5QN23qWZERUDuPXtVKafDlGEdVDvzXQUQSxUNUQeuaL2mfAq1YvxDR2dPYXzWzlPrH
         e+/HHzRDlFNNpKS3H/vvEnxLwnQXOXai9eUzJcFY/4FBgKdWjMkcjJqIy20g6HIEEHRh
         MBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580904; x=1779185704;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97EuWmgETgjG9Q2E8S/+pdJDfeJXRUroPOhRTM16Bbw=;
        b=TX83knWhTxwNHAMwUVsYfjT9Hj3q+rnFylY/3W0zkVZYNdUJlicPtGkhV4wjcPKblC
         DX5HUixstBwCPvWmibtZ1KFp6ccLojGKZe/2FwHXKY9NLRI2ownaPD35Tgnhc8h3A7aw
         xe64dWtiLRQqvxkotYp/v+dhNrSLsHPSUXLbJQOhMvGGtDYIgGWue+zD7cohMe7f+Hgb
         kwwY8jFO/AWzoSl2UeG6vjCSm3S8uMjw8FMvTSlqqKVlYn2nVAuupFqxOTM7vapbKL8W
         I5EmGU5d7Z9PidP7SakpZkeUG8J2F3mlu2BdB1OCVnW8tZKl6pIEpbZKmxDzRkad5RWO
         chqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YCtSNq3R5HHBPPhGiGBIemCucq+8mTQRo+kRS9gUjew8j2WQpEcL5QFlCajeqqoheFk5jxRkKx2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AHa84SO9SVAQtDO64lmpNMDlrLuaKH1InMnUa9e7zO2J98q6
	qT9mmsNexaDvphoBDlmA8ph4syFkNP901Wsghni2jPjBva4ghRuDhA7q
X-Gm-Gg: Acq92OGPog8zzwiouXd+VrpO8HY6jV9n2Qr8c0L5mSKTRhxJ3WiSNEs+k0ZtaHZc+Be
	Fk5nFOmmdPT6n6Dx//sVpQdb6LV8vfJkmbi94EoOALrgsS8ZEGjQw0pQmrxKUBXCA9x/E9+CKD5
	HYsXRpuR2MK1bJDYA/3m2kwZNYhfGmO8hR+hxdMfRsD80ra2hhuLP4epNStiVO5t5g0QFHsi3lI
	WV9GKpKIwZyyxlWWH4wd/S0nE7jKe+VfzWZeyJXA2w71m6bBaguUaT3F4WUsVbqfX5H9HHaL0k0
	2d10uxKjXGTo36NiPd+08Cp8jrLCYgZCw/HpQQW0OM+MW384aXum5e2sdy526wNitgXO4UTBCea
	USGnJug2XQyKWMuOY55uNlTXxA/oycCW3OHO5MWMMZ5v0zPnBHsyKOFndjzJmJ1s0P3npOeryMW
	40hSXxFBRP9sAOzXXxm4n/htr8rhvVaQ==
X-Received: by 2002:a05:600c:a11a:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48e8fe011a9mr27551855e9.0.1778580903550;
        Tue, 12 May 2026 03:15:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9052c7dcsm39585415e9.2.2026.05.12.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:15:02 -0700 (PDT)
Date: Tue, 12 May 2026 13:14:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: typec: tipd: Fix error code in tps6598x_probe()
Message-ID: <agL9o7wUK1dOVBTy@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Rspamd-Queue-Id: 8C9A351E805
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37310-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,kernel.org,gompa.dev,gmail.com,korsgaard.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Set the error code on these two error paths.  The existing code returns
success.

Fixes: 77ed2f4538da ("usb: typec: tipd: Use read_power_status function in probe")
Fixes: 04041fd7d6ec ("usb: typec: tipd: Read data status in probe and cache its value")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/typec/tipd/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 43faec794b95..d0b769333bd9 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1835,6 +1835,7 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_role_put;
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
+		ret = -EINVAL;
 		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
 		if (!tps->data->read_data_status(tps))
-- 
2.53.0


