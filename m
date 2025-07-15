Return-Path: <linux-usb+bounces-25852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6FFB066D9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 21:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC6B4E3D46
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 19:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51092BEC41;
	Tue, 15 Jul 2025 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hkHAjOSR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F315E5BB
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607771; cv=none; b=CcvyaOLxGrY1d7FZ4nCnMdyVI5qdeUw7vOCC3NhyET4N+2Jybk7ddUKduOTM3LlPuDX1y9nbwepRwIpSgdz4bdQYU05GOV9+LLBoSSD4Sjdo2hJor2Gr4eYJwnaxlYN2wvciMEnhUfnZyXQh2ZPw67dGHDRP+TP7RI79I/rWe/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607771; c=relaxed/simple;
	bh=9zJeKzTRHVevMm7kxy2lCgzqahHeXAdAbMwfEa6E2Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp2DYJ8fiq/WNuQ4OW8t9HVxLZ+XPE6t6ttWcALH296/smLgaqk5UEN+i3n6TQt+R6Ow7e7RQOc/FvW3I2WFYqalnfHNfxKQOLsFUiaf5HDLiRTXen7yq3gRX4M/R8aDtFHPyQ6RfaPJrnaFPDeQvrJ1uuqwaSaKVjiVtb5k5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hkHAjOSR; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so48357866d6.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752607768; x=1753212568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Loh5GQDiloUiD9GZ7ScpbDnX416undeoJbETPhllnVQ=;
        b=hkHAjOSRcZ5amyt9EeqvdvP2dlirbnWOboJWGuuBZ5OudENo9fDcf5kAmoGk3cA+fL
         wG5Xah1NgPMfZApRAaANZ5qEj4s5YgLbqsrEnmZE3nvVZ4EVVdvAN0vJ6i/PN4oClh1l
         dRpdhNdHds0Xr85KehMk81w7IPMqj8VEeStOvdQuNPnQjY1VmQsKQfHv/JJzZvBqhGCW
         HvGJwTLRFGgojRC3crjrjTfewBYdSt29G1Y9LMxq9iCjy/osT/Tc+j3vIe7wx6AIeSIR
         ciHjPbeXb2FDHPJq+OipnuXJhy93yKBYbmGHjeJEfAMr/dhlOMveWhBxPKD22qRlmrPP
         lMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752607768; x=1753212568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Loh5GQDiloUiD9GZ7ScpbDnX416undeoJbETPhllnVQ=;
        b=vvS5v0xwSdJU4KOpY6H9Z57XAXFOBWTFxbGz0c1OrfHU67Lov5pE0/nansB/io4mAD
         u5BNGov8hl7CzVGk7tYqFCWmNlyvDJ599B1U/0xOyVxR3cxfgxflUeulf9dgYhefPyYM
         RlOfkC0uCh0e1/fCgZBykhPnG4LvKk0iCEk7ExEq5vrQDub/b+AclyZd8w7rgaEJ7XYC
         HAytqU5B38iP/e8k/aT8vZoFJaq5smP2oZBak63ITq+mNL3bLzyxyvbdLuEuE4dcDlRs
         4So1AxqYxPRLdPnnZvk6MasbJBXxdYqq37q+1ZozttiZPxkLsaZ30ucCinfUXgesEnL5
         RDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5S0KrydFz9uiG3DW/+iqgTA1WA3VOLjpLfrVh3sgLv9JGsDuvI0nuTyXsQBh481d4Yacx+djfih0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQi45ShlaT31pDYdARyPRFlU+hfdsclwiw2gIkUpoyGoBH/k1
	Dts1GN6QZDY9W6YqrCGxapzbWbSRfy8xwqKoc/vICIfaJscDgkk2rIwZA6TX7OZOWQ==
X-Gm-Gg: ASbGncvKgz+BvU0uJDDFKyLzD00Np3Ud15QURXfxLKE0LO07T4JYTwXBjyNRpfxRo1r
	pZg1mSSMbcmGGwr2+NL3hMf7/WsjjvlH/XPsMgrzYduleH/7sULBmvDg+ogIQq++7XsGtftWWZ3
	YI1JBweWfkX4ViBEsnbRm6Mj3zySoxGlJJBnAjGI3LRfFuAJ5hPpPCEYMFNNQvFPIV/8CCbUoD1
	sEpwvMK1aw/IUx9iU7ubn/HNe+VP1pcUBqUEIungWJ27h8/RpVcHHu38RxbkHPKYrCJtWkicjAK
	suu1jTQ8678eGNIZ7h+dAbK40pFb5gFVpK3DWvYxaAfRwpEVtQIXfOQfdYU7zHedF0Xqz6+nj5z
	lgt52CcUK1zapSr4iW4d8oPTEc+A0ax8gI2Dguw+vDSGiFnE+64m7t1aNmn1WtqMGMYBG9T46Yh
	tIddT2eD9xl73ON6tVNNCs3OXSaA==
X-Google-Smtp-Source: AGHT+IEr4XuG9GG+SVei+ldy19H8Vs3K7iAwtvPWvgTFHm6dk2vWEZOQi4+KzKEj69mM/Ew7hW373A==
X-Received: by 2002:ad4:5ca4:0:b0:704:8524:ca2d with SMTP id 6a1803df08f44-704f4809538mr8785246d6.1.1752607768419;
        Tue, 15 Jul 2025 12:29:28 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d396e6sm60941816d6.57.2025.07.15.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 12:29:27 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:29:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
References: <68753a08.050a0220.33d347.0008.GAE@google.com>
 <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
 <ea7f1f42-273b-4c07-8bf2-769992dd9ced@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea7f1f42-273b-4c07-8bf2-769992dd9ced@rowland.harvard.edu>

On Mon, Jul 14, 2025 at 10:10:32AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b4b4dbfa96de media: stk1160: use usb_alloc_noncoherent/usb..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=15a830f0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
> dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614418c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1257dd82580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/7301552ad828/disk-b4b4dbfa.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c559b38fa1b6/vmlinux-b4b4dbfa.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9c1da8b2a83f/bzImage-b4b4dbfa.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> 
> usb 4-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
> usb 4-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
> usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 4-1: config 0 descriptor??
> microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> shift exponent 4294967295 is too large for 32-bit type 'int'
> CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc4-syzkaller-00314-gb4b4dbfa96de #0 PREEMPT(voluntary) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
>  ubsan_epilogue lib/ubsan.c:233 [inline]
>  __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
>  s32ton.cold+0x37/0x9c drivers/hid/hid-core.c:69
>  hid_output_field drivers/hid/hid-core.c:1841 [inline]
>  hid_output_report+0x36f/0x4a0 drivers/hid/hid-core.c:1874
>  __hid_request+0x1e0/0x3c0 drivers/hid/hid-core.c:1987
>  hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
>  hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f190b6

 drivers/hid/hid-core.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1838,9 +1838,12 @@ static void hid_output_field(const struc
 
 	for (n = 0; n < count; n++) {
 		if (field->logical_minimum < 0)	/* signed values */
+		{
+			pr_info("s32ton: n %u val %d size 0x%x\n",
+					n, field->value[n], size);
 			implement(hid, data, offset + n * size, size,
 				  s32ton(field->value[n], size));
-		else				/* unsigned values */
+		} else				/* unsigned values */
 			implement(hid, data, offset + n * size, size,
 				  field->value[n]);
 	}

