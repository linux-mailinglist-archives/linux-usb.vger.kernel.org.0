Return-Path: <linux-usb+bounces-16468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2C9A56AC
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 22:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7EA41C20C91
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 20:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F0E198853;
	Sun, 20 Oct 2024 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PgrMi6DK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A12B9A5
	for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729456338; cv=none; b=WLit8Qyeb2ffsd2VljepxJCfjY1yiVwMBFTjF2YSTmWJbiddKLU7fa2fVMrGvOYQ9/KMAlxel5rMBHnnvIaQeO7R35A3rqlcj3Q+p9nSebHq65xHcddDptBGLHAC8CNSaqD6rMwKzwhu6mLHOl+Xqn910g+G0bWeJGQSXwFhh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729456338; c=relaxed/simple;
	bh=5KsaVPwSNkqnf2P7EKz+CUfRfxa0d6AyaHKLgaaVY+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkhiloLKlvSl0onAIcmlMlV0nP9mDwv8F5q6tJiGLPwLKgRqnOU/1hMri103KaWmtO+ApX4SKSJTAYB1SEQeQInJQtJ6tE1bcLlkN1d6/d2GUkcmfouBvVhdIPSIZfQwPN1C8xjbiD50Czcreu5s66KBpDyk7+Crvq4UQUH9IZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PgrMi6DK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so38212215e9.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729456334; x=1730061134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5lvT2MXCIdvwUG35lAosjgIyGiktDbNjMaRiV7eIfm8=;
        b=PgrMi6DKjTkqb5NweHBHqq1D6KteiFrfPc+kJhTd4yhT4RIGacZiLSE+bpNaP35mnO
         Mw4EC7AfnrP9bqWIC0i1EMzYs7A7yk0i12nEWsjnsxOmFAIB8b/s0wnyzex0HcQhQ7tA
         +/kcHM4YeJyncdzsceGjtTYuJynKjGybjRrLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729456334; x=1730061134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lvT2MXCIdvwUG35lAosjgIyGiktDbNjMaRiV7eIfm8=;
        b=HVmwWLaFttE+rWEhd2o9gnmhB1wKek6LcPQvOAAaKuPxg6L4LQemr+df3Pd6nIPsoz
         udHag9oJvepP+mjbB0mzQnwJiQlx5kLb1h5Y2LE9O0Fl/WRTeVehnvRSCpqsaa9Psykq
         vYXMRa0o4T69f6M0LM39wKFws/Bb7lUoP2gOqdK85j1iTQnNFTjnAnd6D0aX3lf1Nd6G
         70t38NTF31eMDsFyOoPZ3uKxv+4JtEE0CAlfxbYoJPW7CaSoylGIiDXRPBWxYVEgV+by
         O25IspMvZ2ixSWsIs4FJDyvjhZu4o3q9lWzKnl4mWE9BjMDHADjyLR7I/P+pnofVk2sC
         1lhg==
X-Forwarded-Encrypted: i=1; AJvYcCWVXgWy+aANthYpbKUz9LaYkwd3GZLp3IvMyvX0ZU00+sZyTXpbuQnrBIyn2CKIYaE5qZNnFEjrxSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDHFsX1BdHYAYgmynYZ4jVZEEp3Wvhxl5LgJ4xUF8V+cJplqV
	CG5ZhiHyRPkm5JcUKKcKy9ULxujeuZVJudIfwnN6cpb7yAlEjmLrGHWz73dbTUEA/+FIZaG48Nv
	h411DeA==
X-Google-Smtp-Source: AGHT+IEVGxwBFNnA3Bthrx5DHLcOE4QuFrXFgO+2DRgikMbcoG8/Rlsy+Vq096gRTno0He14yjmbWw==
X-Received: by 2002:a5d:5692:0:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-37eab6ef2b7mr5998902f8f.31.1729456334381;
        Sun, 20 Oct 2024 13:32:14 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a653d0sm1201588a12.24.2024.10.20.13.32.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 13:32:13 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso606498466b.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 13:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVClR0WjeSdQ2bPJs4eJvr0frDrm5gAt3Nn70xT4tEvVcwQ7k9tHaFoy1iYKbEYL70WtoYnqwvXrQ=@vger.kernel.org
X-Received: by 2002:a17:907:728c:b0:a9a:6855:1820 with SMTP id
 a640c23a62f3a-a9a69a7616cmr1110187966b.15.1729456332287; Sun, 20 Oct 2024
 13:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <000000000000ade4f305fc36868f@google.com> <671547f4.050a0220.1e4b4d.0049.GAE@google.com>
In-Reply-To: <671547f4.050a0220.1e4b4d.0049.GAE@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Oct 2024 13:31:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HM6Cj24+2mQBU-LmhR2-GBmtA=y80DhKwETsKxnrAQ@mail.gmail.com>
Message-ID: <CAHk-=wj0HM6Cj24+2mQBU-LmhR2-GBmtA=y80DhKwETsKxnrAQ@mail.gmail.com>
Subject: Re: [syzbot] [usb] kernel BUG in __page_table_check_zero
To: syzbot <syzbot+7a9bbb158a7a1071eb27@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, pasha.tatashin@soleen.com, 
	syzkaller-bugs@googlegroups.com, yuran.pereira@hotmail.com
Content-Type: text/plain; charset="UTF-8"

#syz fix: mm: avoid leaving partial pfn mappings around in error case

Because even if I wasn't aware of the syzbot report, it does look like
a match for what the commit was meant to fix (and may have been the
source of Jann's report).

             Linus

On Sun, 20 Oct 2024 at 11:12, syzbot
<syzbot+7a9bbb158a7a1071eb27@syzkaller.appspotmail.com> wrote:
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: mm: avoid leaving partial pfn mappings around in error case

