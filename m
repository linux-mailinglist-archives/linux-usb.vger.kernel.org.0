Return-Path: <linux-usb+bounces-12742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C0943508
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 19:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430111F237A9
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3721BE227;
	Wed, 31 Jul 2024 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SoPRarwM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653341BD50B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722447000; cv=none; b=JPw/qmJQCc6vc7i2R1rAzvssinzErz2Ko9+lUBx547jbt1hAcSAma2HJ7luCaH0E1cXMnP4VESHSPn65FVhMbvdm7bO9X1ot+dA1QfH88ThSDBnZZaALKaSFgmT/RNn/CEQPLEXmUDzdQUHw/AxhLokNskZwRxusSn+/CwFNNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722447000; c=relaxed/simple;
	bh=+WdOgppIBKd/amkMUnID1lOCik4HxEEkZwGvDDT4SBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xgv8RgPybF8VkpiLIwCo1MXOzhc5JWIVjKGXzSq2DWEPmxPjkx8GjWg3Ax9zo9ME8zYYMTD6oggK6IziGrElnRnGcDFrYnnLxhRj8ZkqNsd9qyYvOmr8lJoWFWdT3TsuA79mN7RA/2vE6m50+mjJXjFnjYcQwCHKQ6JyggmAMPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SoPRarwM; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44ff7cc5432so41220261cf.3
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722446997; x=1723051797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4KY8JEtInRy5xm4RIX3PTL4BAr3AAklSLy+uBqX6QE=;
        b=SoPRarwMMxZgi7l3FVWylgo9zRI5oLCS7VRAbcQD3kuThwXVX/M02UUXBsLSGFdJXo
         /r60f54al+3JcnfRj6XV59v3BfHAt4qkMR/gL8aDx1N6Pg2W/L5C9yRBkWi2Tp5RuVY3
         uEPVTmKQCNC4sKTIJ0f/7be8dWJoHoen4y5sSyPmM0PXd/dZ9GrsvQSjWolLkb4C5HGV
         Rbx8N6Me0J6bHm0bsD7TX8hAg69hi9n4bgZzqQKws6IxywfNluj+838Ycbd+M/ZzIUAd
         NjMKoY9hCP6okkKA8Pim5pROLfja0kWA9sL6Y5LJKhXEykqjoXfVLJy62E5+rkfzWLZw
         sOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446997; x=1723051797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4KY8JEtInRy5xm4RIX3PTL4BAr3AAklSLy+uBqX6QE=;
        b=dG4iSWhiU00RnkHHq82ikyhcESTWf9g5WtvtcNQIvz65KPwkOwEKYYP+JRMeqvM4ZS
         OJk95l9EbfHp1BBEw/9QEaNIVA1Z136UeZRarxiE5dZr9uMgrtvg6W2Be2o/KE69exUs
         xbChpct5W8RCbjr8zUequ0IZH8DrDs3RKmZyMBmn7b/Si8B5F6w7MJgc7BQPPOi/YIrN
         VNYISc4pvMUMAMmRcLXkcRmWNTzC1BulNB02H9NDoADEanO4E1hzgXstSm1jWRsKQ1Pn
         nCyu1C4e7YzMXiVo7zqVjFX6taFap1gkUwT15IIrfHUBdETXDGl883+/s4lgIvQQY4k7
         1JLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPUlq64USHJufV8JSiU9iU3sijNtNtEVjrEBmL68kzLoQUjLlXW8WA2FqviktNvjPkoDnXjnczl4GuCG+RQuNFnGVEDuEuvLAD
X-Gm-Message-State: AOJu0YxoC7yDKKBe+qd4fCfoxZjz5qfOZ4n7eH8WymnMX2n0M3G/90Nn
	exfwJXFaAI/xluK4GTmZBRwqHO1iF8ix7REiQtbbi8B41L3PhSWKiJ5uTuljxA==
X-Google-Smtp-Source: AGHT+IFaLcLGhecfBpoLsXZxMwB3zjexCVb6+nQ4dHeejbB6qTpegfp5KXyGkHY31WGe4ABCodgceQ==
X-Received: by 2002:a05:622a:19a0:b0:446:5787:875f with SMTP id d75a77b69052e-45004f1995amr192443891cf.38.1722446997206;
        Wed, 31 Jul 2024 10:29:57 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe812350bsm61884421cf.9.2024.07.31.10.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:29:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:29:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000009f6f85061e684e92@google.com>

The syzbot fuzzer reports that the smsusb driver doesn't check whether
the endpoints it uses are actually Bulk:

smsusb:smsusb_probe: board id=15, interface number 6
smsusb:siano_media_device_register: media controller created
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
...
Call Trace:
 <TASK>
 smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
 smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
 smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
 smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575

The problem can be fixed by checking the endpoints' types along with
their directions.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
Tested-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/000000000000e45551061e558c37@google.com/
Fixes: 31e0456de5be ("media: usb: siano: Fix general protection fault in smsusb")
Cc: <stable@vger.kernel.org>

---

 drivers/media/usb/siano/smsusb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/media/usb/siano/smsusb.c
===================================================================
--- usb-devel.orig/drivers/media/usb/siano/smsusb.c
+++ usb-devel/drivers/media/usb/siano/smsusb.c
@@ -410,10 +410,10 @@ static int smsusb_init_device(struct usb
 		struct usb_endpoint_descriptor *desc =
 				&intf->cur_altsetting->endpoint[i].desc;
 
-		if (desc->bEndpointAddress & USB_DIR_IN) {
+		if (usb_endpoint_is_bulk_in(desc)) {
 			dev->in_ep = desc->bEndpointAddress;
 			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
-		} else {
+		} else if (usb_endpoint_is_bulk_out(desc)) {
 			dev->out_ep = desc->bEndpointAddress;
 		}
 	}

