Return-Path: <linux-usb+bounces-22177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2AA71A37
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 16:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 783C87A515E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF2B1F416F;
	Wed, 26 Mar 2025 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="q9DYFxPv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D21F0E5D
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002905; cv=none; b=kW8ASVLKSK/u9l02jvh8ascAQRZ3/HWCY1rgurjDZoOmkRc6rO/oHGhoAJX8+HVSYcK2QETFUyHWkD9hA3iAiwo9bI+LVAOggvAjo1zklXxGU3XFTD6PBR5ORT4F24CTombStOznDvnl5MHGEdQ+JVha+HhUZLIpN6JZCO4gJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002905; c=relaxed/simple;
	bh=In8mradJdyTsnSMN/Zx5eut5oPE9f935FbSWzJQjo2c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lthffWyCdXaNdvf5oLlEVFhwVcIO7K8iOuz27i5w4uoPQINKuRf6/RC+QYUGUR1wvDmfOR6JMajsDqbE/EesJ3qtr5bixxI8a/q8n+uO8q+huejOU6dBfw9KZaCe6DJTFJCNd3D2JbteexhWHqWmsLzCNs+Q+olYoLgPiOLKum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=q9DYFxPv; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8efefec89so60520766d6.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743002902; x=1743607702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJkS3jBwTRqrbFKeqmQ5FYC+7YoE9yU80iE+FHpuAHI=;
        b=q9DYFxPv3ld2sh8neyVmUbZq3kLmMX+yaYLY7LWZ8n4n8fpHDPlcoyT9TS3vmWqnNx
         degK4/It7KNADfJ4bmGuywhNrb6EIz7cCCuirzqrp0B29Pt3PzNQKq4YxVkF8ad6EOAR
         Q1k1QdNtL2vZ9kMSpdeuW9ukEplrwSCvBGTl45v5bCjzTSMVm2NEZonq94pdxvXeEWMr
         gfdLeMGgQvbgg+VZ3rRKMYgjF6nbKOml1cz9Bds+XouiWY+1tB7we2PADDlW177uwJWa
         2812a3Fo3plJGCYYuKC6FkWCHiC72cHWEhMf4RBpcQtW+mgHuEu7WFtclcU6zhckmzsN
         UReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002902; x=1743607702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJkS3jBwTRqrbFKeqmQ5FYC+7YoE9yU80iE+FHpuAHI=;
        b=g0ReeGio7kL1k1tUMduKSV2EYrXdZjNSBBuXg7BTBf5I8kQFQXfD6AkTe5V3oI+lFo
         j22XWrIjVEL49YmuvXSIp344rt1TVsQuaRwefFl4SssxQYXJkn71iCXXFob88ICzI9p7
         Z8ki7GNU4kMYq67sL0GW8Na1323JVflanY65Ck+ZrzGEDIqjBkRzJsM5+yD0lbAZOGrf
         vUWoikzbMPF0TDYjQ8JbeVUatORmUgeUS+J/E2ePr2znnEl7yEsZ2QOGE6C8ib+wzycQ
         IK9KF+XGgjf0A0qGrsNpeBM48YKY4w82OJQ+JyCIUR6R9z+bcJRvb1mEF9agzUj6Mvob
         ARXA==
X-Forwarded-Encrypted: i=1; AJvYcCVu36dw33XN1KXYzMphK6OI/hcWv2zXZ4wLWmGf8yQUHo8kj4XINBC148q5Q+uCwFjnMwQrK3TNgAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFFiJRK2N6Vn7YlrE0L80TJ4IUmRDIOID2esa3uJi3ZI7Nd54
	Z/+R6cxWxSZ/s5rVRpunAV3dskwtptGuPaT208ftTEjzpYf/xxrZ6gZ9i/D/Yg==
X-Gm-Gg: ASbGncurRgmN2z6h/iXKzCdPaFKRdK/dFfTUsQ5NpfxYtKjkSnB7ELOHdlTvOmmBR92
	XwWyt5z7JMIUE3asIFT1EWSrm+OYAm0QtQRM+4kRlHb1ex0r6jDpo+db6J8kcgbvpuPdkPNB0CF
	JW082NT9lBL6r7YYTx31QS8Lb25Xp1qqaIOkKYp/r4uS7SR7443sPyMvvmltYFHiDxLhogzG+j5
	soViFQCjgmIaIk2SyHLNrp8bgCwWkl5QgXsdNg0N10D8ui9QFsOuBvxsZkWaEfnxWTqs8Clz3bo
	ro5nbWMgbxjA+z3/67dlAE5mN/K7snnpxWzxGRtlesvwJgo71MiFIFSkluRv0gC3dlFo0OR5dIG
	ndwJwyB8oO0Fyb+gjQtWfTvQ4QlwFW2YbseSBIw==
X-Google-Smtp-Source: AGHT+IGDdKxmHGc9gI357CBTixi7+PlBZCZDHIkgl+JsQcb4TNnysAcWbF5MH9GPPMx+dnQUp1PRmw==
X-Received: by 2002:a05:6214:224c:b0:6e8:ffb6:2f8e with SMTP id 6a1803df08f44-6eb3f332a55mr397418106d6.32.1743002902039;
        Wed, 26 Mar 2025 08:28:22 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc568csm68569916d6.92.2025.03.26.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 08:28:21 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:28:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-MrfICsY06DZV-2@shikoro>

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

v2: Move the static definition of the i2c_usb_quirks structure outside
the dvb_usb_i2c_init() function.

 drivers/media/usb/dvb-usb/dvb-usb-i2c.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -8,6 +8,10 @@
  */
 #include "dvb-usb-common.h"
 
+static const struct i2c_adapter_quirks i2c_usb_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
 	int ret = 0;
@@ -24,6 +28,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

