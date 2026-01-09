Return-Path: <linux-usb+bounces-32106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A71D088B1
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 11:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B03B302CF44
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 10:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E983382E4;
	Fri,  9 Jan 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oexwprhn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6EE335BCC
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954353; cv=none; b=MWlQOKcFxdDmbBQDLVqMsVu/13dxR513pCN4n/nqnpcCtGIOEyFuenb7+tvpN18jba2IBreVO2alu8QzukYx0mlht4pLUX0A30NfBKin0AHDEYmb0BJSIec8FXAOnt91HlvubquzDbRMzbl+lmtWw3J7ij7dGW3fUTBIYyLCPvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954353; c=relaxed/simple;
	bh=KT2GLDDyg167DaZVifyDhp7xoisKy4gGhAbIcQbNLeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bhc6SeSaplRawRT+Lw1elwM11xm5Fr2N/j6Wk1fO+hDT+JzxF+DSNA8Pi6zpsTTm8Msy0r9k1vjT2pk6Ql3zSmqL2Ql/NCFyiB0qbtpsDkcXFFPBu/ZNsg1yXHikkED9oIIkNhtGtQxrS5DFiDsjmj6Dzrf3putwHHUeuaaWRbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oexwprhn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2228842f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 02:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767954350; x=1768559150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh/CNzH+BY3nn9nQjVmqxLLVylpWqSRv8nq2jkZouxY=;
        b=OexwprhnmY+xRFY8e61cTnBIx+IqneNNax0LQE64EtbQj3v8M5w/3oB9Cz/Sm/Apqp
         oMPUVpG4lv/tmtMxG7ygl2EF/DOcgONkkzdFvBm5m4XokH/DwhA7llWbQ/79CaPmidy7
         n2tGpWm5wyF/0pBOLP2Pvc9gs48s/YQxXXZ5+Ks21OrzUGerYkHlcqPklW2dR4FcEkHF
         oTOvOXkPHAIVZRss9/QlI0vL1g1FtGyKZyZU4Augx5svgSZADr/irA48gsig/qTBEAVJ
         GvQ6k5KYkBieeXTPmoFFH/yq/cZjpDb6CSqEdCHak6u4eBUQd/EbrmqmIbHmCWaFuggb
         8RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954350; x=1768559150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh/CNzH+BY3nn9nQjVmqxLLVylpWqSRv8nq2jkZouxY=;
        b=bv1wF7T3tnqWpMDjmGbF+j7nXWHOR71x9HMJKvWfCjj964omfJIcRebSO9iWTYza1A
         LXPqF7Mi5wL4snkakNnImuEGTP/L4opmJhOBivSZDWpKcOQgYTaHtosTDNc0NhYYlSUl
         Amh1r06Ys9y+I16QtMKDrVtXU+4X+PWDo+gUhX0x39gN2CSCbo1TGPcdxztHyAO4lcEu
         H7h67OgIUtgiVkKBQhojI6duXhVNT6ZRURglkvjqXQ4SnDYNv6tL1PsT8xDxFmO6y3lg
         xpDA18O3nuJVhlx+UCNuzBPBzV0wM3l17DMspUYaqLWmm1EKH5XOa0V03AaW2nBHK/If
         oxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+DYgWgBdEmDycISK92qeYbJ+4Tl87vYe1uqoZ1u/hWmALUAMNtVW6JF/JYHaaApXSRLTTGKMhgkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLmtANHWUqPVFUetWmzfaAUv5+KHmBUPbcpE3Ef/GteZqU7VM
	CyRp/N+EsrzPfhPKJL1jOdl8VxSE2jOhCl9uwuFwb6ZGnhHnCSByLq6d
X-Gm-Gg: AY/fxX4mKdjOK4Y7p8fLI8NpuWrq+MLsVMtmc2s7oCEIG1f+4cZWQ1j8KbBPlBFsU0y
	U9NrnvZBCPrlEV1+CrWxAzc0ZNN05S69YZVFKZqC/5xGNXDTPuMzIr4Esx65a+/+fhj7Ja92W7D
	7wfWs6RhBkk5GAHTof2pDJDnk19tcewcrxBMzAg4rgB9Mc5j1SHk+R/4WRY3OQJx4Ni1CAw8tmn
	giX5JK3oSyx9djvDHJP/SreXBxlaCHcCpeGcu8lgxBwFvfC0y8HSJd2Bxbd2XVMctzy5BB/VrlW
	plMHt3dRonYH4pf1lO8K60CePIJ05PW6A7FQYWU/c4qoT84aaek2ShZzJ3kzcD+OcD2h7yLpun1
	FQEjQuZrr0TpofG4CSbsdbVSEwkbbTDEkbCKJ+kktenw6dqOQ+7MejX9AGtpLM1lcV7DCYUESJV
	BL4BtkWvlEE8tHmQKDRppIVkxfSQO3YKJIuD2jxICz39ZMW1QtM8CzcqBqVCH8eZ6i6Tp/cpVo/
	p7mbBwhpFy7Gw==
X-Google-Smtp-Source: AGHT+IGrC1El39PZ7oXtpxmiYe1IRGze8vOJElC+6t6cZaNyFb4zuAzTIvYYroxDo4htbszVXN7K8w==
X-Received: by 2002:a05:6000:2483:b0:42f:b0ab:7b48 with SMTP id ffacd0b85a97d-432c3627fbamr10452852f8f.1.1767954349892;
        Fri, 09 Jan 2026 02:25:49 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff1e9sm22667040f8f.41.2026.01.09.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:25:49 -0800 (PST)
Date: Fri, 9 Jan 2026 11:25:48 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Felipe Balbi <balbi@ti.com>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with
 bind/unbind
Message-ID: <52usixapyb5hqtek4qlmiuzwvoz6xgzh3sxspn2ueetd5orfz2@qdoqxnuydbwb>
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>

On Tue, Dec 30, 2025 at 06:13:16PM +0800, Kuen-Han Tsai wrote:
> Currently, the net_device is allocated in ncm_alloc_inst() and freed in
> ncm_free_inst(). This ties the network interface's lifetime to the
> configuration instance rather than the USB connection (bind/unbind).
> 
> This decoupling causes issues when the USB gadget is disconnected where
> the underlying gadget device is removed. The net_device can outlive its
> parent, leading to dangling sysfs links and NULL pointer dereferences
> when accessing the freed gadget device.
> 
> Problem 1: NULL pointer dereference on disconnect
>  Unable to handle kernel NULL pointer dereference at virtual address
>  0000000000000000
>  Call trace:
>    __pi_strlen+0x14/0x150
>    rtnl_fill_ifinfo+0x6b4/0x708
>    rtmsg_ifinfo_build_skb+0xd8/0x13c
>    rtmsg_ifinfo+0x50/0xa0
>    __dev_notify_flags+0x4c/0x1f0
>    dev_change_flags+0x54/0x70
>    do_setlink+0x390/0xebc
>    rtnl_newlink+0x7d0/0xac8
>    rtnetlink_rcv_msg+0x27c/0x410
>    netlink_rcv_skb+0x134/0x150
>    rtnetlink_rcv+0x18/0x28
>    netlink_unicast+0x254/0x3f0
>    netlink_sendmsg+0x2e0/0x3d4
> 
> Problem 2: Dangling sysfs symlinks
>  console:/ # ls -l /sys/class/net/ncm0
>  lrwxrwxrwx ... /sys/class/net/ncm0 ->
>  /sys/devices/platform/.../gadget.0/net/ncm0
>  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
>  ls: .../gadget.0/net/ncm0: No such file or directory
> 
> Move the net_device allocation to ncm_bind() and deallocation to
> ncm_unbind(). This ensures the network interface exists only when the
> gadget function is actually bound to a configuration.
> 
> To support pre-bind configuration (e.g., setting interface name or MAC
> address via configfs), cache user-provided options in f_ncm_opts
> using the gether_opts structure. Apply these cached settings to the
> net_device upon creation in ncm_bind().
> 
> Preserve the use-after-free fix from commit 6334b8e4553c ("usb: gadget:
> f_ncm: Fix UAF ncm object at re-bind after usb ep transport error").
> Check opts->net in ncm_set_alt() and ncm_disable() to ensure
> gether_disconnect() runs only if a connection was established.
> 
> Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function interface with backward compatibility")
> Cc: stable@kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>

Hi Kuen-Han,

Thank you for all your work on this.

When using the DWC3 IP for USB OTG on an iMX95 with our Aquila iMX95
SoM, USB NCM does not function properly when booting the board with this
USB in host mode.

Your patch series completely solves this issue, I was debugging it
before and saw that there were indeed issues with the relation between
the net device and the gadget.

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com> # Aquila iMX95

Kind regards,
Ernest

