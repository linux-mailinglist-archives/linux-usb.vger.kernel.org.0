Return-Path: <linux-usb+bounces-22314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2118A756B2
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 15:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FCF0170CD4
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DD41D63F9;
	Sat, 29 Mar 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LiSogFoV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB91B424F
	for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258757; cv=none; b=g178cDHRWN/700sBitYptiOTyO3P+EUbJ3D4ZVZjAKELg25PLUkm4oxAT9RoD+uRlRN/hhKh5bNsCKTSEBjIwlizCOTlRQhryDgdQKvE2HNQg3hfQBwVQ85QfbdwjOb6dDWCM4FuDyq2JU5RPqznthfvMUObsOnefcRul5wO/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258757; c=relaxed/simple;
	bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BquufaW7G4jpkkzYnE5X1kZINkCMcewP3IQRwPGOpUgBZVD2V/MZ8W+PZ18PZ20/OZVfM1MRiWyhOUQmQFnrC8aiye5l4q0tZa/d9DPSoFg0DZV1lDcTL+RdpuPQ5o3rlzeR4mdzc4HZ2N/Davfw/pILrAbzB+DFF1xkU3B/3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LiSogFoV; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c592764e54so404953685a.3
        for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743258755; x=1743863555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
        b=LiSogFoVXFIl0+dfIjFBFpSHXHlPQFOIraqW/LNm9dhMhK6Ylh59+Pbvqgl+qWhbI4
         LqHFJHozYoaoX+ARyXD39qf/0mhY4lBwHIig9wBu/URxp1Y/oBFYNVVV5n7yQEsZ4VMm
         m6QmATA6fPyEKdSDk1vlRif2bCLx6kj6566aK7Ndq5bxxkZZqzs3DBcpsPX1u25gxKUo
         48cUzpYVLmu/VkveSZW0TGllESo3Ao7IUgE2j0/IfmWX55gmw9665V+7KBKs7gY/SAv6
         5Geepe4F2+wHyCvH42SXgtgQET9gzVFz8XJS534kICmNQGB7DyefzWUvBP7/MiXr6J8I
         eKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258755; x=1743863555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
        b=L0pltKVhQBg3xICKtoaXNMzXx41QSMr/q9C9NL5ulLy6LhtglABMNgxC7bbzUVEzs7
         RdInsWgqnVOITW9c84v8v4MYRmaFXrxEtcc9Skqgogpsk+PnjqX9BrRTOu24vf3KA6Ym
         j3z0HQKtPbVEUSLlW0RUUnBdi3bYwk3vS01pgj2IBb0jWqVZKS9v+1EdkAYEm4Ne6MB7
         vMJKYJqjD38l2+S3r4Plme0o1WhNozIdPnfrl+6/j+4fA81GLcwPCTapCZK0k+SARl8M
         Q9ECP6+tZkI7rpm9OwpL0xp1Aih7YswO3cg0qg3xwFlC9wyReWgfK1zHi4kBpqgjoAU7
         8n3w==
X-Forwarded-Encrypted: i=1; AJvYcCXefEBCIbetQpgcRCxzNE7+oNZgp/gyhwb0TV1VR0Jd6qaDXpVLxdSXhW7si/72t1r7isLb1pm4ifQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqxQU2gXjlM73ZRCk04b7hNK97TFHLwgOnNKn6UjvBnvxO8le
	+zWGYe2H7rJem9GzJR3YFfajK2E8zoeUzkUCp06JBsx7qSCiUJ9FG9ZZjtCMvw==
X-Gm-Gg: ASbGncvyMwsYuPqkcevFYmwGdsd/FB8tBrZoBErO47611hBifKc1nnXor2/b9vbYest
	JWgS+i+kARKqcbU07SWwms53BWF22H0lHj0BHL3fy0EistKFuj2n6sfiUmF0JZY2hDJ3kWFL4pF
	xfcrXesml+nDRcClu7VnxPLnzi6XVsZ44RYVmc22e84t55YDJtA6iucqBzwlJSaZUwzgFhDu6hq
	14EgRn/RAwMC043eO1vKHFmB/Vtn730sHLFE4xYo6pG9prCvW7stxFflpaHUFwjM+LusNogQiMo
	+FKHfqHYsq45HDTk3AvSkiHKyXuxxdz8ZIoDJHo2lKm33hUSaJZ0dio=
X-Google-Smtp-Source: AGHT+IF0cQy0jr4KMVVkh8U0F52O1lJsPAgFLz9t15YfkUtmvE3yApsTmKKf0mX9v2iGYZlTkuZukQ==
X-Received: by 2002:a05:620a:19aa:b0:7c5:5d32:2612 with SMTP id af79cd13be357-7c690890ef3mr378710685a.58.1743258754701;
        Sat, 29 Mar 2025 07:32:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7659ad8sm249276685a.22.2025.03.29.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:32:34 -0700 (PDT)
Date: Sat, 29 Mar 2025 10:32:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Mingcong Bai <baimingcong@loongson.cn>
Subject: Re: [PATCH V2] USB: OHCI: Add quirk for LS7A OHCI controller (rev
 0x02)
Message-ID: <4bbbf646-318d-4805-98df-67eecf040de9@rowland.harvard.edu>
References: <20250327044840.3179796-1-chenhuacai@loongson.cn>
 <208f5310-5932-402b-9980-0225e67f2d66@rowland.harvard.edu>
 <CAAhV-H4aitynD20EEWQhF_uv79+1nw7sKxzd7c_+009oY63tEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4aitynD20EEWQhF_uv79+1nw7sKxzd7c_+009oY63tEg@mail.gmail.com>

On Sat, Mar 29, 2025 at 04:40:59PM +0800, Huacai Chen wrote:
> Thanks, V3 is sent:
> https://lore.kernel.org/linux-usb/20250328040059.3672979-1-chenhuacai@loongson.cn/T/#u

Okay, it looks good.

Alan Stern

