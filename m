Return-Path: <linux-usb+bounces-16204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B799DBA9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 03:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9D82877F7
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 01:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D94171E6E;
	Tue, 15 Oct 2024 01:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wn3nw3yM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0E18A6B5
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728955927; cv=none; b=p+KPMeR1oLiFb71pD+/tAlytSIc3x6L8zm6tN8w2sQ/5NUNP7UYzx7FQfYPX7O0sI7dCNi3J3jg1eiehb60hxN+sxTf8Pb7OD7Ic+DhNFQv6E4k1VR0ap/irSnTnSassm9wUuR2c3sB3y359nj4whRpq0lXuTQy2KMDIsuJ9lyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728955927; c=relaxed/simple;
	bh=evtDFhlbO2SfYWbBEcGg1cg6KW2I8YqCcXT82SPzxcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA36YBijc7p+umIST0k5zQ94EyPVfJVrULTcfe05AaZKn3HBjlZDElB9DsIKzMrzFioxhUggAY7P7JKzIHvw70lPVIKx/9chHxdIOMUs4MW5Vl4XQf2i09pLVkO0UC8GEN0trt0T68rcVt2X13KsFBQzWoRZGs+UELWZS7sAgWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wn3nw3yM; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7afc5e480dbso361941885a.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 18:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728955923; x=1729560723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcrqeSJOTDI/cz8AM43HkiRMvxwegUULZjWirUjS4dU=;
        b=wn3nw3yMrQmYf0jnMy6rs/mkB8H0VREMt0z5LzZ+/KHjUsYNGiQnOgYFVQKIE0IuoD
         h4Sjv5LzVPCdepviNnrkAYdrvWDGS4kJBAa8BId5GtCh1Wb0+zv0877kPbDcDQMVYbN6
         z0o6f72yjNbmxoSS8v2W5wMQrqME0FMaACHIoazFbZxDdPK0ElTeRU3ctO84xOPYmWWx
         I0wuw/rKWBTIalv4f8i7XgcqfIEac1fvXRKCvks6TKHScPl7xd2VJ3JjVhCqEUEH3DHo
         xKY6JBNbnSkJiJnL5TV1GPWp6Ebmy2ZkzAhDTfWH4UREbKapNyT6CG7Lg94wQoVL/Vm/
         6jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728955923; x=1729560723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcrqeSJOTDI/cz8AM43HkiRMvxwegUULZjWirUjS4dU=;
        b=G2oBd+1/rwqHz6vR3K8IuCHl3ud2MJkGbTaJ/MDX4OIX7yCiWR7jaCy7o7E74FnGGk
         k6ZV00F3ysG0tYXyKtjQBDQya4T9FcNmXblLkCUGCFUREAnbg0EbU1svm3fdACKtba4z
         uRnEipDGs0lQLrfFB8gGYQL1vNeJ0RzNkRl1Z6yIkn0nMC1Ul3gRBJCntB82BTA54zjM
         a3zfg6RWO7/E84DCHf3KbtvRAGxKvn05BTzlgdZvuIgHxKCZL+EBm3KgGUAVRr40xYLE
         8ZUZkVGylMbweL0RCRXzITUXozZZUGup4QCLdDLgTr0tvB6S+IIghjnAgxrgOkxMf5LH
         aajA==
X-Forwarded-Encrypted: i=1; AJvYcCXErHDzTIlcGjaK7dAcDRVqQPnZJIRQNZCT4sWrGzB1r27woMD2iRoinSdttSq7nsENBFO/0I+qsf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTx2jbaAKbKekFG6UcLCcgMII6ThvpWsOUYT3kiDbmpX6rjLX
	BnHqGw8L/pr4R4DZdSnZvQdtkQAPfVBRu4azdn80DFyNXFM0oyCGbjkXQNywTg==
X-Google-Smtp-Source: AGHT+IFb3JuxX0Me0Jk5ytKkH2I02jiUABZ/eXCHy7K9rI0ylzmgsAhY46mtxElZewvi2+A35r4cAw==
X-Received: by 2002:a05:620a:468a:b0:7ae:d2d0:f86 with SMTP id af79cd13be357-7b11a396bfcmr1842929485a.38.1728955923241;
        Mon, 14 Oct 2024 18:32:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::7dde])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b378b1csm1254641cf.75.2024.10.14.18.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:32:02 -0700 (PDT)
Date: Mon, 14 Oct 2024 21:31:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzkaller-bugs@googlegroups.com
Cc: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <377d1fd2-054a-4ce2-a188-3db86675e5d9@rowland.harvard.edu>
References: <1336ee1b-cf5d-4081-b4f1-512e2b29dace@rowland.harvard.edu>
 <670dbb0e.050a0220.3798c8.0134.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670dbb0e.050a0220.3798c8.0134.GAE@google.com>

Syzkaller people:

What's going on here?  This was working earlier today...

Alan Stern

PS: Why doesn't syzkaller use a 12-digit SHA-1 code in the commit: line 
near the bottom below?  This has been the standard in the kernel 
community for years.

On Mon, Oct 14, 2024 at 05:45:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> kernel clean failed: failed to run ["make" "-j" "0" "ARCH=x86_64" "distclean"]: exit status 2
> make: the '-j' option requires a positive integer argument
> Usage: make [options] [target] ...
> Options:
>   -b, -m                      Ignored for compatibility.
>   -B, --always-make           Unconditionally make all targets.
>   -C DIRECTORY, --directory=DIRECTORY
>                               Change to DIRECTORY before doing anything.
>   -d                          Print lots of debugging information.
>   --debug[=FLAGS]             Print various types of debugging information.
>   -e, --environment-overrides
>                               Environment variables override makefiles.
>   -E STRING, --eval=STRING    Evaluate STRING as a makefile statement.
>   -f FILE, --file=FILE, --makefile=FILE
>                               Read FILE as a makefile.
>   -h, --help                  Print this message and exit.
>   -i, --ignore-errors         Ignore errors from recipes.
>   -I DIRECTORY, --include-dir=DIRECTORY
>                               Search DIRECTORY for included makefiles.
>   -j [N], --jobs[=N]          Allow N jobs at once; infinite jobs with no arg.
>   -k, --keep-going            Keep going when some targets can't be made.
>   -l [N], --load-average[=N], --max-load[=N]
>                               Don't start multiple jobs unless load is below N.
>   -L, --check-symlink-times   Use the latest mtime between symlinks and target.
>   -n, --just-print, --dry-run, --recon
>                               Don't actually run any recipe; just print them.
>   -o FILE, --old-file=FILE, --assume-old=FILE
>                               Consider FILE to be very old and don't remake it.
>   -O[TYPE], --output-sync[=TYPE]
>                               Synchronize output of parallel jobs by TYPE.
>   -p, --print-data-base       Print make's internal database.
>   -q, --question              Run no recipe; exit status says if up to date.
>   -r, --no-builtin-rules      Disable the built-in implicit rules.
>   -R, --no-builtin-variables  Disable the built-in variable settings.
>   -s, --silent, --quiet       Don't echo recipes.
>   --no-silent                 Echo recipes (disable --silent mode).
>   -S, --no-keep-going, --stop
>                               Turns off -k.
>   -t, --touch                 Touch targets instead of remaking them.
>   --trace                     Print tracing information.
>   -v, --version               Print the version number of make and exit.
>   -w, --print-directory       Print the current directory.
>   --no-print-directory        Turn off -w, even if it was turned on implicitly.
>   -W FILE, --what-if=FILE, --new-file=FILE, --assume-new=FILE
>                               Consider FILE to be infinitely new.
>   --warn-undefined-variables  Warn when an undefined variable is referenced.
> 
> This program built for x86_64-pc-linux-gnu
> Report bugs to <bug-make@gnu.org>
> 
> 
> 
> Tested on:
> 
> commit:         8e929cb5 Linux 6.12-rc3
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git v6.12-rc3
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
> compiler:       
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=162e785f980000
> 

