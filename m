Return-Path: <linux-usb+bounces-12584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E693FE45
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 21:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ACF2B223C0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 19:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EB515FA6B;
	Mon, 29 Jul 2024 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wmWryF3F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5D43AAB
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281504; cv=none; b=Oj/9sZSIN7uyJkJNocbYRzqDwt3Ykq7DpQ6TFO9aOSrHTNGsvUuHGGEWyxcPO2/3HFNCHcjhtQ6eEaOmV2xY5se090EVzyLOx8i0MDXNmSAW5VjUTwcA0CfzI+7er/U/odfYAlxF928YGGH6/xvgdPxGXLeFpQ7TqXBh8iORLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281504; c=relaxed/simple;
	bh=8DvLD3KNC0DqFNTImhzjq0hN3fSBpCJ1567YwRbCNeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDEF4LpEvwhSL8xGcef+hGVo27sdy1+Psw9jCrG7Jq7s4HF34ZNarswBlGdcoEyWWdt6vwje6Qsg9MBARoo1XPhwe5sdA+zxRjD/K4ZuRbQlP790KOCX3ilsRh4EjJF6iUEVdfrgGCqgAV2lcjyjG5vbOWeg/GhgdYeMKYoAk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wmWryF3F; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1dd2004e1so233911985a.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722281502; x=1722886302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKpZ7eoB/ekqBlUQuyzYfj8JL7Mxd5CfjCI/+gU/Xwo=;
        b=wmWryF3FxXLf1MAQ08DJwT7XZ6yCoLrgxmX70kxKWV/wrLRAloq5LYc/NNZ2ONCSFc
         zm66mlxSMj3YAmhINK014JFAfcEIaGoo0kKDGnn5r4yNngi055iMI+xShcbWwhOOuwDK
         YfYeg+2B5ErOE616uZ761NKLCsi4yQBkU6o5i5O5ezrbM7WfldBTQNv220iYidFxK7Cb
         kk883Mc/R2/JPZrwaSbl2g9GkMQm/wk8zjrod5coCP23kUc5vc0GvR4vcuIklx/Ojio7
         2D/MkD7MXB9JE2uii4cfaoi1uFgbdc8r0GyyBKFBwRDuJCMIydrFL3iswqMN5DhLyFIR
         kEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281502; x=1722886302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKpZ7eoB/ekqBlUQuyzYfj8JL7Mxd5CfjCI/+gU/Xwo=;
        b=XPsLlKHQDaowI6Wm/+nP6qku2kGoVXs9PtWJTDrBySNp+UHiWYnyjql15MXu5vMLUJ
         wH6yTKCLaj02vcOPD1rwWp7uCH7/7z/EUGrXvwi9OzAStF+K5+YTr0LEmbhU6hH+/cpf
         /Tc12iF64fQdkcNoSDm1EuexpsUDJgzFRRSI3FHsDFhSA9qB9Z8p3/fjmn+H1McbW7Y0
         WN3n/pAiCsjkHSkYz648leGUzBs/wmVazg/Hgr4fH3vo6XSVsBD6FgtF16obyJVZHN1P
         H2sT7Yy3xQkm5lPt8kcOmC4f27NRebX5MqD91PhFGqb/llbISXp5aW0WimaASZ6u4hBe
         D5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXVLPKxLlty1U1zeNMH28ad9PqTh3vLJsMRMD98oemFZN2weR4x3lrqbiUWSP9/IEMcPsTt3CCWKWe/XhWCqeY1BIbzqd4IeR//
X-Gm-Message-State: AOJu0YyickPvbv5ihNnDiQyZTAzvdEjka0UDuatArJcmXzCOpb0lCcwk
	iUR4+MZP4+uH0VBUzTuJ5K8n7r3FSggF5SoHCL7rsjWkHl4YJ/OTJRGpb49/Ng==
X-Google-Smtp-Source: AGHT+IHKj69NMiL8iPsxcayl/FDa6E4pMMW32p3BOf6R+t+eMdwk5/XWNxzareH4deutnHZuOldRng==
X-Received: by 2002:a05:620a:394e:b0:7a1:e93c:ccee with SMTP id af79cd13be357-7a1e93cd124mr973596885a.11.1722281501916;
        Mon, 29 Jul 2024 12:31:41 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm564386985a.43.2024.07.29.12.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:31:41 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:31:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [usb?] WARNING in
 smsusb_init_device/usb_submit_urb
Message-ID: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
References: <000000000000e45551061e558c37@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e45551061e558c37@google.com>

On Sun, Jul 28, 2024 at 02:37:25PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    933069701c1b Merge tag '6.11-rc-smb3-server-fixes' of git:..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=10eb7dad980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8cdd6022e793d4ad
> dashboard link: https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10893645980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10885779980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/504e81a2120c/disk-93306970.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/320d2f3e66b3/vmlinux-93306970.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/65b8e1c28010/bzImage-93306970.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
> 
> smsusb:smsusb_probe: board id=15, interface number 6
> smsusb:siano_media_device_register: media controller created
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503

> Call Trace:
>  <TASK>
>  smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
>  smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
>  smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
>  smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 933069701c1b

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


