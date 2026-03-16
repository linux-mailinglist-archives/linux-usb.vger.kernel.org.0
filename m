Return-Path: <linux-usb+bounces-34870-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJztLlsIuGkWYQEAu9opvQ
	(envelope-from <linux-usb+bounces-34870-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2729A9D5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D6A7301C8C4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 13:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35BD39B4AD;
	Mon, 16 Mar 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RIguvXTx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74E39A049
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668091; cv=none; b=qOKxGYgHvQp3NI0WB1y0AcGFZLbLPNWJyqmklmNRAj9HPHW3FpjyyqZelLrAi//ZcDWYm0c9895zLc9zbI3Gm2I33KG73G8icEndWR7GI6VDuyXT5M/AEzyYpws8a7RNglJD9I/jtPyt85PUHb6epjExohACs44KAKOvaRHkzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668091; c=relaxed/simple;
	bh=980emBb3/yN2Du8H038v0fkSEDBFS2aUJO1xAU2v8cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dErP0So3lPWIsYnLICyhW9r2cZz8fzQo8dmEICHpL+BCrP8mFB94nsXA46BaoddcQd7izkAlB6odC59UFwZ1jSZcWhSd2glAGpQxdCBR5MWYu1/pYWQt7yT9lApsJTysf6Sixz8/2yZgp+UBTmAIR4IRn+25QEva3GLrjlieruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RIguvXTx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12c19affeso6260729e87.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668088; x=1774272888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRxqb7jp+TCy3hg1xHflJENuVb/8wn/xUKsac5LhXZU=;
        b=RIguvXTxOrj/U4FQTfrn182eChPRoLxaOWkxfnPIaL810xw1CeniUSKBFvSb/syXqA
         Z1YPcwm0dGl6lRxqTpHuVYxoMJZlTa1sYa5a3thU9TyVXptIZXKipY61v/05KXqGNupp
         pw8Rs/hc+g0hLgDV9bl52VwjFKI4npAEu0NI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668088; x=1774272888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zRxqb7jp+TCy3hg1xHflJENuVb/8wn/xUKsac5LhXZU=;
        b=L58mKJvIq0WxS8Gj3JKXFz+fqimTwpD2xlHXEJMYXHKkhGF5qkm9jxgbzN/h6AXSBy
         B+L0KhJLAkcJrHWWeSyJsZlKVv74kMF4EzQbaDUweu22eLorXPk8zewKBxSXr++gSpgS
         JEWEJ9rlepWILd7hnRDRFid5+6J/KzvpaDmsHy98hWf8wKOAtrMzCTnei0OOZhfTVI67
         Sg3KmqZlHQZ0GnrRqOhFjRDXvAA3Q8zpEZRcn67+9lM82z87NafO1CgQZ1+zk9v60eNR
         miIJl+rjar8wOszss830BB3DbhZZPEZM66aswkcrdwQ8Is8yXiBqWuXwOKHbprDzezRK
         a3jA==
X-Forwarded-Encrypted: i=1; AJvYcCWSPszabDYGUP/tSw8/r+pnml6VGi6n2pNXA7ia9m5zRAUnuV+zrSjBo7+pEHaTQ1NykpUM9/8H3oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycuLjfKkediWq0CZnRfePdRawjU7oCQPPiOotOLKYJ3nE5rpdw
	VoZMnRzkDaWE1dlzTQMeaCsk3JMTv/a74XNtXsLhblMA/U+VDu2rWOdXz7M9zARhAA==
X-Gm-Gg: ATEYQzygYg4Nd9fE8GbS33G6gvM5bUwzo10wd4vFt5qOs/C6XV7hSBbOm8FtAB2QPwv
	Z37Y6OALhvLcp51up/IpfFt6sUw+77ccWF55dUYw6MBoPQVC4QKTs2KS1YM76p0Rhgp34QiiSFz
	0oGekRzW1A1ie7TsHBV6ICkih3mDe5/PQEoP59PCgBULD5BeZimSX9Sibnihsx7NIjYff5qs8pn
	ypA9ckiGx8bmt/dfzpg/9h+lepPbV6OhRIbxhF/3dqNICrqynZ2/GQBkoYovcN3VyNS1MnyxN2o
	8vWPlM1G3M4S19Qxe/Yt5aZnnlorQgBGl9iP9t7ed36jI7Fpv/7fJlvqBKN2JTyT+t/hbeBPnsC
	kgihTZEaXWw+t4BdErwuiG3TcA7K57JAqRmn/2FIJzTMhnR0KhGCRb1piYgJKOCzHKOYxq70ORi
	sGSOtcaGfnCmzJUgmn6p9+OFTtdWBWtgU6V9IB6UaEPnBlAFPG8RpXVQlZonjR1Abf+5FloyXAU
	Q==
X-Received: by 2002:a05:6512:3c87:b0:5a1:26c:7fb4 with SMTP id 2adb3069b0e04-5a15a4cda88mr6195149e87.21.1773668087880;
        Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:45 +0000
Subject: [PATCH v3 2/4] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-2-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
In-Reply-To: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34870-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 14B2729A9D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
control.

This mapping is usually created by the uvcdynctrl userspace utility. We
would like to get the mappings into the driver instead.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
 drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index dbb30ad389ae..b09d2f8ba66e 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -109,6 +109,8 @@ IOCTL reference
 UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+**This IOCTL is deprecated and will be eventually removed**
+
 Argument: struct uvc_xu_control_mapping
 
 **Description**:
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index d5860661c115..f9049e9c0d3a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1046,6 +1046,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
 	switch (cmd) {
 	/* Dynamic controls. */
 	case UVCIOC_CTRL_MAP:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
 		return uvc_ioctl_xu_ctrl_map(chain, arg);
 
 	case UVCIOC_CTRL_QUERY:
@@ -1160,6 +1162,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
 			break;

-- 
2.53.0.851.ga537e3e6e9-goog


