Return-Path: <linux-usb+bounces-37953-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCkuEeMqEWqciAYAu9opvQ
	(envelope-from <linux-usb+bounces-37953-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 06:19:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F55BD1A0
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 06:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE8FA3008FF7
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 04:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A618D2F690F;
	Sat, 23 May 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KQMIhpXd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A4946A;
	Sat, 23 May 2026 04:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779509978; cv=none; b=RgywP0Gn06m5gjWryF4xHNc6+nY+7fx2sAUr8UBrlnb4Yvr9xI8yLC7UPDghtrIOreuUFIPlLEam+HgQpaxhLH2tefF3eUa+oeSHsX+m0sDFo+2EDiY/7+gFN00dHVLfxGO64Ob/dkkC2cJM+6qMMftNK5yiEt1NWIf2xernqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779509978; c=relaxed/simple;
	bh=ipN9om6OgXFWCw4jOIHvkh8LbuppBiDlV5LGb5w0FZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/aomyvNg3algywUypZklngKL+UYaXmiX3pSto3m1QrTEPBxPYSwSm+z1gHH6JZqCQrtVCTbqFTZV93/4IqyGZWOQO9YNfkSlSi6pVU22XeR/dJB8/uUibQ6fWQJCGu6jcFlQbyIYYPqNw7qfAknTLb3oet7r9TY4sB7kCJr6s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KQMIhpXd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BB31F000E9;
	Sat, 23 May 2026 04:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779509976;
	bh=1UVz2N9vvG44DQp/dZAy9jlNU34ecZg6kpmRXXuuqjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQMIhpXdMx+sdZCmu48+edRf0/OHZfHwEzS/lL7mfv6gGT82iIDsQuzv5Dq1JZ4/1
	 mGc07xOsqDooRHiMVNAfBfRvDupV4n4hhyK0BYVlOZ9Rt2Rob2ube4KnGUjbBl9Skr
	 vKwUeKnmQJwIutRiB09cjlk5HzNGX9ZA65k/G2xw=
Date: Sat, 23 May 2026 06:19:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joseph Bursey <jbursey@uci.edu>
Cc: syzbot <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
Message-ID: <2026052320-deem-egging-4b84@gregkh>
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
 <32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37953-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxfoundation.org:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.855];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 3A2F55BD1A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:38:40PM -0700, Joseph Bursey wrote:
> Hello, I believe I have a reproducer for this bug using a combination
> of syz-execprog and eBPF programs. There are three artifacts used to
> reproduce the bug: prog.syz loader.c and func.bpf.c, which can be
> compiled as follows:
> 
> bpftool btf dump file linux/vmlinux format c > vmlinux.h
> gcc loader.c -o loader -lbpf -lelf -lz -static -lzstd
> clang -O2 -g -target bpf -c func.bpf.c -o func.bpf.o
> 
> And then run using syz-execprog:
> 
> ./loader & ./syz-execprog -executor=./syz-executor -enable=usb,close_fds
> -repeat=0 -procs=4 -threaded -collide -slowdown=1 ./prog.syz
> 
> The following configs were added to what Syzkaller used:
> CONFIG_KPROBES=y
> CONFIG_KPROBE_EVENTS=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_DEBUG_INFO_BTF=y
> CONFIG_DEBUG_INFO_BTF_MODULES=y
> CONFIG_FUNCTION_TRACER=y
> CONFIG_KPROBE_EVENTS_ON_NOTRACE=y
> 
> I am interested to know if eBPF based reproducers are helpful during
> the debugging process.

If you can use that to create a fix, great!  Otherwise there's not much
we can do here with this :)

thanks,

greg k-h

