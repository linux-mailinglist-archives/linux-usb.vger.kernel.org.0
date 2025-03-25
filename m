Return-Path: <linux-usb+bounces-22134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C7A70A82
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 20:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C153F170AE0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 19:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C231EDA26;
	Tue, 25 Mar 2025 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZZMVw+kY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49391EDA32
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930937; cv=none; b=pF1UjB+iGsnNH5UmIsyqY3SFK9CkM2zC4GlJ+LLiyiLPnf5oDgcSeGvpsSjLXA3JvvXd+DAnc5YNi0nK0/Sbmt5cgPNnK+0Rsrbi+xg0bx0/RtPoJfIjhyzACvFSOOQxP/0K7KPKDjCPvPQaOe3QVM/dKF27ZsD+V3QvBNOfjuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930937; c=relaxed/simple;
	bh=+HZNGckBaFScGug7+JH9V5kfFzU8yyY55xQGFmkP4Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGfBq7Rl3aQJw6js1AJnS8rmITsxNBNHn6NVuno+PdbPyesSFbjIXX5Oxv42d4NwiT/RZQ0eX248TozfLVyhxgx9SIm0YsX1BTErTn3OXvs5suLU/Y5nMWK4CrnFdCZPIa4hhNxSzTIE+Bq+yTVryzD5oxGqXbEWafnYUmmWFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZZMVw+kY; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e41e18137bso39847086d6.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742930934; x=1743535734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjcGr9cvAtbGJkn9HvPelEA4m0gZiLDAqN98D6KbDUE=;
        b=ZZMVw+kYv2A1HlnyqG3Lr8l4n9MivkazfAlBB1hEGv8SUzFKpQs8wS4Vgw4sshazf8
         tvq967hJ7DsSdqBvHK6Vt+S3imwX3wLVpYEP+urwDrm9wYEL3h53xUpD+efizuS+34b8
         0LlrtercSECmUJ1bTPCxLh7B63HD8Ma42j/Zfkrnrp2G5Qn0AORK2SwY5WxcvDFgy1i4
         3oIbuTcX2eankW+YyWIg3CLkbwUX0hp8xr8hK4iKtenDpxhFwpUTJb/d9UJPW033456M
         8w9HGOXQd948FO+kgIphbSA73PkHTUA7de3NBbNeF/v426GANAQ5IOtLt4m7V4k9KByK
         3Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930934; x=1743535734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjcGr9cvAtbGJkn9HvPelEA4m0gZiLDAqN98D6KbDUE=;
        b=iV8NmQVEwn/QyxTWmFmWuMWeW+VP7IOtyCmDL3sQa8s942Yel0GAFtmsJPiANvZ058
         jx3v2+RbvsWzT64eVruDZBCmUzFzL+qTMvABdZyLG8K+PbcLbRQJ400+of1Lu9IC1pxD
         5zyHBV6nHQhTNhPKApd/UQ0nuaO2+PA6Bx4RMkCcNNnGNizXmQO3pHDBgC2685V8XrOm
         MztR4GU5LfAbH/v3adYkE/XZx1c0tjqzUxd/uSwpV+mfz7yoJpS7TwuTTlpadjaN0WoC
         irswc5seu7zmkI/osNV73z/lDeP1h9EDCNwA7otjOuGEUjFtB+XL7bxQX211W8SYlrRf
         DYww==
X-Forwarded-Encrypted: i=1; AJvYcCUWWv2MCd3YKnyulliw4Q+dFdu8K9uvvyN2C5CgX6g6RttQcVstXLoV67MBUQW2bRL5AF5XyRIokVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwciKmPRZF7WPU/7XWNh57vRyxZxm9SnxRtfJcheGvSCOCzjIbt
	KfNYeTVaTlYrvE6nfAYHz6JI8hGaN1HbGALo9EVUHMTJx4TlcknTwocK/jr19A==
X-Gm-Gg: ASbGncv2eLysvG3ZD3cfF6qCtaCfj3RbKH4OdOGpPLJmuC78KNLqA/3zkv6PwDJZF3M
	evfFnM/KUkfQYBvLODuJNozvJkvGgqvfIeC6Se4LbvMSOn9kASN0VOdYnxIvAngC2KxkRxc2Ux6
	llX2ObuKZrl2aCm29zdv2jrcJteQnkl2YC3GUc/eilk1KGGlBUTJq8CTzpEs/O8UoKmcjxPpD8U
	++iS/oMU1PPkjXGg/FcPSyXjqIvBFJITxiSsiPs5djGlV3+eIu3cOIgTpT7UB/TD9Fs+UpSKkye
	urT4ERwUd4qeSzkn194vwo+iGiw/6h+JL3LzEHBSggnvXf1zFomwAMAfBWMPd8XarEEE/kpRIWr
	+1nrIyt3+aeHaLm4NMl6OzmkxA4QwoYtA1J6oNA==
X-Google-Smtp-Source: AGHT+IHHyJceIKvCgPSBf5o7GHYuvt5+o72NR9FCbDxku//TLL2aFhOO4FYnzlW/RfNRtDnryQbUeg==
X-Received: by 2002:a05:6214:1d24:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6eb3f2c8664mr230571046d6.14.1742930934320;
        Tue, 25 Mar 2025 12:28:54 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efdbea3sm59157906d6.112.2025.03.25.12.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:28:53 -0700 (PDT)
Date: Tue, 25 Mar 2025 15:28:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>

The syzbot fuzzer reported a WARNING related to the dib0700 dvb-usb
driver:

usb 1-1: BOGUS control dir, pipe 80000f80 doesn't match bRequestType c0
WARNING: CPU: 1 PID: 5901 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11d9/0x18c0 drivers/usb/core/urb.c:411
...
Call Trace:
 <TASK>
 usb_start_wait_urb+0x113/0x520 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x2b1/0x4c0 drivers/usb/core/message.c:154
 dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95 [inline]
 dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [inline]
 dib0700_i2c_xfer+0xc53/0x1060 drivers/media/usb/dvb-usb/dib0700_core.c:361
 __i2c_transfer+0x866/0x2220
 i2c_transfer+0x271/0x3b0 drivers/i2c/i2c-core-base.c:2315
 i2cdev_ioctl_rdwr+0x452/0x710 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x759/0x9f0 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]

Evidently the fuzzer submitted an I2C transfer containing a length-0
read message.  The dib0700 driver translated this more or less
literally into a length-0 USB read request.  But the USB protocol does
not allow reads to have length 0; all length-0 transfers are
considered to be writes.  Hence the WARNING above.

Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
following Wolfram Sang's suggestion.  This tells the I2C core not to
allow length-0 read messages.

Reported-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Tested-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/67e1a1f5.050a0220.a7ebc.0029.GAE@google.com/

---

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -10,6 +10,9 @@
 
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
+	static const struct i2c_adapter_quirks i2c_usb_quirks = {
+		.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	};
 	int ret = 0;
 
 	if (!(d->props.caps & DVB_USB_IS_AN_I2C_ADAPTER))
@@ -24,6 +27,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

