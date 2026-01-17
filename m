Return-Path: <linux-usb+bounces-32453-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E195ED38E66
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 13:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D59D03015E26
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 12:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAD5313523;
	Sat, 17 Jan 2026 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzlzJA/X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B0281341
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651601; cv=none; b=ITcSdBkKC/Ay14uCnH/dQOowpgnye97YfsNug45p4+E6wSfEtSihsKvolhcrPr9scFBaE1RCYJFC22oGhgo7hrHPULKoVQoZ1FgIj8DRndiwy4yFDT3MSK7nGuG84YLt6O+t1NpAqqtR4PW77L7b2GyZjlfy7/Z3D7JMoByXP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651601; c=relaxed/simple;
	bh=Xuc98TObcn38gZY7CMrM88f1rNXWeDYWgmRVNN20vTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hi3rXX2WpFhCXP43D8dgy8/awDgUirXdjHbW7qdgnLHgBFS5DTcETnd8r+vXdisRfUAtw/EPAobxeto36zMWuF0OWimkmOYvm2wO3S6OvipHfNT4i1gq71hIUG3daGfaX3e4wprtUQMMV4xJtzhapxXKFWY7T8j3hpXt06vuiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzlzJA/X; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1525301f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 04:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768651598; x=1769256398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgzz2g9xI3B7sKWHIbum1LJH2UJJWU63NtgcfullTeY=;
        b=IzlzJA/XnWZNQGYLxGdx5GX57judtiJOYIyo2FBZHzQ5zpgt5VxNWe1HfGz3T/5FqM
         cGtcP1BD/eEbCtWJCd9GxrlewMonBcnXXNr+zX9m79zwLgw/tVW7XvvqIFjwvzJwWKfI
         SwA8L2B29AMsjX4ZuMNNtKiBWda2RtyT9WqdQLrdKUEdFjyugByE+5AU4lecwmFMiHUt
         5bldbxRvcFKBr7PrXqtMAY1tcnbGBzKPSDDwkDXHaXVi6em0Fd1NMyy+bux7TO9TodQu
         0dWjIKV4XUYw93WjdqTi3qlQb6meOYWFGmx82sHPJMxobqc/wDbdQ23Op1P+TNZRYgVN
         7+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768651598; x=1769256398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hgzz2g9xI3B7sKWHIbum1LJH2UJJWU63NtgcfullTeY=;
        b=PwkKJq5oubw8wGOchY6v2SBC1XY7CmWKTnxVzApY93ULXqVnmjmng3QYZHgOH5sMp9
         raW/23z2G9NNgXlfp6iHOUXBF3erPVXmnzDgf7xMO7/eRqbM6lWqcJghRvjNaNIuScUo
         vV3guRXNCM7MAwMZMTt4g8mEPfyaKV9D8ulbzNKmpEsNZQotKo8OPVBHwCiMJZ8GibQ1
         uPdkY076CKB3aM5+kwLb4SPMghA9MY560aiOJnDD0TK4oHcSheB4InBWPchsHDKlAsbb
         MeWPn3/gakPWvIK8d0yhKjy1MxQuiUt6xXQV6pMp9yOP+0avP7KitSClI80FD+1PM752
         ed0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXzOpkAaE0fqwVzm8ONrCc0GARVy8tk2c1snFkgVRZKHCkN0mlu5TJ4M00b0+UJzdZ3uuJsSxGGU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMg1Y/4C6jJbT1oPt8kgXL8p6ZCwpPWvCRJUxwTe0ueYFg4tGB
	MM6QlrS9s44ehXSmxXLAY0RIz1dU21sEJVhk+5AuudWJ3rUDguoKUv8o
X-Gm-Gg: AY/fxX4yrY+vO2iJC14Wlh5cE+QGb+mPmJ4uSt4AlIKrnx8v6oETKk039IxLbjr1guO
	yozCvnvpuGXhT9EGsHfeWglcqWlkgVCr6hrH1ckfz1tmwKF/ME6aXNufSuBESdNlKR++V8HHZXJ
	CG6Yq9i5QniPkwB5A5FVHb0JvUzPmiNpkWDHK9cE7TitQIL6W2xPQHUa50jciWV8wzji3KvBFg9
	8x7DNX64CIaduMPvViOTdgDzNpSOLMIw6E5UATymPU1/7ERYTcbFid6Rgyy0WUnAJrIf/ThdyeD
	tAIOWEPOcVPkvDfuSaTXlk27/IwdtlMjJ3SUyeHi1frXfOKcg1ozty8PAWi1n8oomHGvmCa9+wT
	UhZUTmNICuzgmtabwrWag532EZ0kZG6Ja79zp84SwX/jmdbchAESFBzZW+VoxziKJY8Xqysow5u
	8cN08if0BYb7ng5o8IfXjmUCWxdCQnmO1bGaul7Kfu4/VTXDB5WnnI
X-Received: by 2002:a5d:64e5:0:b0:432:dc1f:6982 with SMTP id ffacd0b85a97d-435699928ebmr6938489f8f.16.1768651597711;
        Sat, 17 Jan 2026 04:06:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699982aasm11193342f8f.42.2026.01.17.04.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:06:37 -0800 (PST)
Date: Sat, 17 Jan 2026 12:06:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Weigang He <geoffreyhe2@gmail.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: fix missing null termination after
 copy_from_user()
Message-ID: <20260117120632.75e3c394@pumpkin>
In-Reply-To: <2026011725-ecosystem-proved-a6ba@gregkh>
References: <20260117094631.504232-1-geoffreyhe2@gmail.com>
	<2026011725-ecosystem-proved-a6ba@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Jan 2026 10:58:41 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sat, Jan 17, 2026 at 09:46:31AM +0000, Weigang He wrote:
> > The buffer 'buf' is filled by copy_from_user() but is not properly
> > null-terminated before being used with strncmp(). If userspace provides
> > fewer than 10 bytes, strncmp() may read beyond the copied data into
> > uninitialized stack memory.  
> 
> But that's fine, it will not match the check, and so it will stop when
> told, so no overflow happens anywhere.

That's not entirely true.
If the user passes "complianc" (without a '\0') and the on-stack buf[9]
happens to be 'e' then the test will succeed rather than fail.

But the only thing that will get upset is KASAN.

More 'interestingly':
- why is it min_t() not min(), everything is size_t.
- why sizeof(buf) - 1, reading into the last byte won't matter.
- why buf[32] not buf[10], even [16] would be plenty for 'future expansion'.

	David


