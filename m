Return-Path: <linux-usb+bounces-25548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02350AFBA5E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 20:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E08718954AA
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 18:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4150A263C9F;
	Mon,  7 Jul 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="I4Hq4Rht"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067711C7009
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751911769; cv=none; b=uMs6RNBNsosx2qzVTwRysPtjMd/olrp6lwLgTYzD3drX0ncgqgYPEhct+L93I08291MeOrjPHX0iZc7lK8pdLuS1A82Vcehwus9r2pX+1m6mqAD/Yvi4LxMOw5X8/RSouODKRnfE2CanBwYl2M34iLip+JKy98NrVUakcDzeoo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751911769; c=relaxed/simple;
	bh=iI4TQiK5VbfL867pNGYed/ZYRYzgsTePoMjAGqHMscE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsMTsGXLzw48pdj7LMumL7dNxmZffcVV03tu/VFLOwEI+x30WPwI9FrOgEZs2WPcND1N64g210v2b/Z12ApRtTjZQMJJ3bBdKZ1QuhYslJPHNAre32wgUjJVaGJ5SRhh4478OHZS7wm/DEkII1gMQ3oc6CRZ0yKyGdODxjejZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=I4Hq4Rht; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a8244e897fso47203301cf.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751911767; x=1752516567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gExEEsqThCnmMqopEOTA98hdy6W5nAjnndkUOEja3dM=;
        b=I4Hq4RhtRb9Mm2+AnDiZDG1/lizsrn2YY2lehwQIKhb0cO+/pAZXWl7e9KAQOdbWJj
         ylJXzZAgphOlfUIAQfrSvWcVUueK7f1QdsTi+yd/VqNeVABbuvYT7Ojho32Xlk9QOctE
         WJ9gIFNRfHX/zmFd61RIC+cIfXb9Gb3L/zznaURX4k7iJ6/LXPGzNPAOYY6Ws9xIc0ah
         AC/52yP42RMQHV7WoyNHXn0I/lVj4Asdh0F3lVEngytqd2NaYluoyG84ASDeL2nUOkAj
         Jqm/LzqwTHaT0O08ylKaOXHmHsKJMnTKE9llprLCCvAU9KKDO9MlVSHaw0S7X3IZA+tO
         l9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751911767; x=1752516567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gExEEsqThCnmMqopEOTA98hdy6W5nAjnndkUOEja3dM=;
        b=hGwbgbkacgjuUnTW3YDS13U4buSeVhmn5Y1cLpniWZ9prtVdb/3Yad09aDW/G7eOfb
         4RRL/grlKUN4iH3j7JCTf2vqbj/8vj8yeDOfimPgPccxK5TNWp8scQBsRManNoP0IRBD
         zg2uK3Bb9Bt4mtNTPQoOXvDPg6w1KSFA0Oq/H2eUxyFz5k4JeHkCSkstqZ6PRF7WqXIi
         bWQ1xbL4Ur0ji7+ANiU+0BJxgDbXU534QzZJmOP6Z/626yfxf/vgGMnuKnxAia89SU8o
         w2e7COITRspADYknhJOC4L66tuJsokWt/ibHMJh/KHTHSarwGON1RJA82DbB5T3k7khR
         LFuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX80mQHUAVMAWQ/45eUZ+3aUkZzPXI/+Kf4GjuRQtfHgJx9YYdoAR1Vec72CLzsCv22qwLzFJ21vfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EGlTh41yt3SCP4UaBC+vGP5bG9xts6dsO3+T/xiHz0iO8t7b
	emzQup/P+x8JpFUmoWpNE9Kr+XhEt+8MRyHsK4PD3QkoiWqw2FH/QKiaWcIEp/kdJg==
X-Gm-Gg: ASbGnct4T1lUmrLat6xYXJ74iGN522SLol8TbQqOaOOpEWND0zgQSvMTq+NOqd+bnCK
	eExMcuHbBsfyy60LhQyo8letycwaR8jQdH73xk71MmmyeVxYR1hT8bDVLjdb9iu5MljpUo3u4Ia
	nt3DmFkeRmf60FyvV08BchPFO7pqRYGR5to7qqoXcoqnWvcYJM8mRHWkq88b74Nsz/MSzveeIkw
	E2FV1zAztDsLu/emtecB4a02IAQxJdCFUjWMBEPnwfXAowcd7k8JwmRVqOsd1EKRoLtNRRJFcCr
	voPbaQwrvNr/Upc79kyZj4sk9a8Ls8tnJgQOENj5QyvdsBZCOtIgPCpETeJmpSWoXT4+mVFEe75
	LD/g8E7Yf1bzGXaQA1iQr0BidreRmb1UadLIPh5f9LOC926beLJTLWHxcTZnDs8uyGA==
X-Google-Smtp-Source: AGHT+IFwoMAxOpRHrs+Ru3Bzln1fX22gQqhHYTr09YwzUWBcwSf3uHHHbnLqF9/7UfEmw9cDht6uWg==
X-Received: by 2002:a05:622a:5144:b0:4a9:9428:6f01 with SMTP id d75a77b69052e-4a9cc74f61amr4194111cf.51.1751911766771;
        Mon, 07 Jul 2025 11:09:26 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4d2asm67362201cf.14.2025.07.07.11.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:09:26 -0700 (PDT)
Date: Mon, 7 Jul 2025 14:09:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
Cc: Manas <manas18244@iiitd.ac.in>, Arnaud Lecomte <contact@arnaud-lcm.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 mon_copy_to_buff
Message-ID: <5de04492-01d3-4b2c-b3f4-8c2237dfed6a@rowland.harvard.edu>
References: <686bb229.a00a0220.c7b3.0081.GAE@google.com>
 <686be237.a70a0220.29fe6c.0b0c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686be237.a70a0220.29fe6c.0b0c.GAE@google.com>

On Mon, Jul 07, 2025 at 08:05:27AM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    d7b8f8e20813 Linux 6.16-rc5
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=17e89582580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f51185bd4f40ad44
> dashboard link: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b3cbd4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b19f70580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f933e0e4a6c5/disk-d7b8f8e2.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a82be954c91b/vmlinux-d7b8f8e2.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/66dbc3de1264/bzImage-d7b8f8e2.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
> 
> microsoft 0003:045E:07DA.0001: unknown main item tag 0x0
> microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc2/0x170 drivers/usb/mon/mon_bin.c:252
> Read of size 3904 at addr ffff8880216bc6e1 by task kworker/0:2/1204

Test my guess that the report length and ID are both 0, which would
cause the length to be decremented erroneously.

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ d7b8f8e20813

 drivers/hid/usbhid/hid-core.c |    1 +
 1 file changed, 1 insertion(+)

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -918,6 +918,7 @@ static int usbhid_set_raw_report(struct
 	else
 		buf[0] = reportnum;
 
+	dev_info(&intf->dev, "count %u reportnum %u buf[0] %u\n", count, reportnum, buf[0]);
 	if (buf[0] == 0x0) {
 		/* Don't send the Report ID */
 		buf++;

