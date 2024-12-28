Return-Path: <linux-usb+bounces-18855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EF9FDC41
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 21:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21EBE7A137E
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 20:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37BE1990AF;
	Sat, 28 Dec 2024 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Am/PDj42"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDA197A6C
	for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419474; cv=none; b=PMLpQdBXHWV+5MUPimNIggbqKYiVCtRJV5PLlmt8JV1pdZb73JzIKpqU5WMDnJeEZRLPuu4CTN2L1YCpwwWOMM0zucQFsu4tcbbmqkneo0eKdZFNyKjm8FFnLyXz1e42PI3Ggcb74vYKqPqV18jyOdzX5sQCCrfp3mYavp4GPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419474; c=relaxed/simple;
	bh=e303w4tcLm5YyCF2TwZA3O59xcExz7hXhcGR8ejMpw8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uxvzYwN4fP4NuhN8PIdLcR62EhrZsYc3uGItR9vTD0Vrxe0JZS422Pk76OiW3zM8LmWBtyhHD5Fpcmxj6bkENkqHBFua3ny/3YcvIfxxVtKgoHh13aVUZ1loych/K+l9PnIYMCTnd9eUYAoP0s6hygOLiF9/jcujDm4AL7d0hSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Am/PDj42; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21619108a6bso95105675ad.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 12:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735419471; x=1736024271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2DOIcwAfGwnYzcdiIszZ+Rc+WkbTYCmxZzTdwLguZk=;
        b=Am/PDj42R5Q0k3picO6Gnd2arP9LIZaApLZXpktrTR3wuyGWhgyuzeuSA/6vYxxQ5h
         gjipy0vUTH9pVl6z5DS5cBWIC2h8H/rZ96FKxsywWcFqBUGB7QkvElMFh5g1XBMZ1qyO
         g8a0J/SMG3ImpyQ/n9IeSFtnFpxo57eBtMnll0IY/rfToxysckOy7x9+UlFrfbOi2+IN
         pCaWbnPDNwDKk7VhxLSzJeVxMyQlH+raCVHXzQ9z47YWpzg29NmVdrdTBgti1XSQ49+l
         Rud009lKFFxwbXjRZc5ZIoxJ+d07c7+pmdLfH48il4M3siBCk4m7qxOznUf6HkxDS+dN
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735419471; x=1736024271;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2DOIcwAfGwnYzcdiIszZ+Rc+WkbTYCmxZzTdwLguZk=;
        b=Tpuu6HjMNUvHwBeSu+nOBTOaoe6Dyo9sj/Y3XypaYuZ9QG4s6+7V46Tdxsu61F/d22
         Cda19b7gxs9MRR4Prq7FX7AUsof982HwbIPIx6SyBrN7S4nXcitdPy/7N6SHNyM30dEY
         FWWO6xGARgOoYhni4m0VvmDdU0ztRkERp4TzSDWpxzfCc/DeQCPP0GdcslzbBGHZjBzK
         VjJML+8bcbTBYPZ6k1aaCnC75G6F1kroM0qOmbhq0FlohZyxzfbiZHOuHjdkddzeBbEU
         DB0ntUB78B2XyQVrfEu1wHzVmNs9W0MfOjTvcgEECImgzclStTDzdnVJcPwwAaxvZKXL
         NLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIDy6BU2Yg8A5XhseZ+cvJsKmJpE9Q7I7Jne1Yxxe0lN/rvyCg/K6aamh0uflfRYpgy0CTwerR5AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxTU5Sphsj1gR6RY6VgjsBWwKDGsvHgq/uxXKCoDhHDUat+np
	WaSkHsxSu73pq/IzW8M3PLQ02sI/eGr9baLObSgkvyYLb7GDI1n7oyT8Uo7kI7Y=
X-Gm-Gg: ASbGncvGKhsExDdqAVqCqAOsPaoFLKaYJAZ41Rpfk8KYfO+u5ju3hZ2jkL9MT+XT2Rz
	yXQmKnWz7VXJPojB+NaQiqAB9zrIrF6D08+S1lixQ0A0WDk3OoDFinxM+VnYnr+S/MrFZEh7qzM
	B4yhJkNJ9sq7E0wVOQYFOMyxTJnmjW3PyoGX4l0zkTgJFwhk53ByvtRUl+YPjpJv6FbtI9CILH4
	DTXwTn4mA6sGpM/2bBLjYON3hovCQ/FBlBSvlnJDyKPn6NbQN2fhw==
X-Google-Smtp-Source: AGHT+IFTUgCxF6uzXRRagS1HIXJ5TfNGwvMPXQ5hx7BAQzX3/gQ1fZgofRedLgDih/Y7lwP8VC9cvA==
X-Received: by 2002:a17:902:d502:b0:216:4348:149d with SMTP id d9443c01a7336-219e6f25d60mr484722485ad.53.1735419471375;
        Sat, 28 Dec 2024 12:57:51 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51c2sm153174585ad.190.2024.12.28.12.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 12:57:50 -0800 (PST)
Message-ID: <0ffbbde1-b5d8-4a53-91e3-80e16da18e28@kernel.dk>
Date: Sat, 28 Dec 2024 13:57:49 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
To: syzbot <syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6728a3a7.050a0220.35b515.01b9.GAE@google.com>
Content-Language: en-US
In-Reply-To: <6728a3a7.050a0220.35b515.01b9.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Should be fixed in upstream for quite a while:

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

-- 
Jens Axboe

