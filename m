Return-Path: <linux-usb+bounces-33817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIx9BeVho2myBQUAu9opvQ
	(envelope-from <linux-usb+bounces-33817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 22:45:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C21C93A8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 22:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9225F300AB15
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 21:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CB931715A;
	Sat, 28 Feb 2026 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="sXV595Hi"
X-Original-To: linux-usb@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D382DECD3;
	Sat, 28 Feb 2026 21:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772315104; cv=none; b=V5SrXyeocZ5WMpWarehRfuiiRfmeRDu0VT7mobwRbK1X4/CQymdk+XeUvABPa89Z4LVXfnnGtXLopgtckeA8fBBCo2S+fKw/1JgWVZpqQ8VjUI7K5LEbO6V65nIiZ1fXQcaOOvHMq7vwKgVsTui7MAIBYn1xdEoacCs4KhtFE+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772315104; c=relaxed/simple;
	bh=VaID4i4o0NQpAGtHAlflHsSfixg3ee6S7yHjz8lphug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4t5goR/ywntAb1qNuGTbVo6LdQqgLFB6vzganDadXVqZjhTzSE4mH1BGJzbKBlBDvWpwrL9oCIn1bX0ziI0L8Y6C3Dednno3oHEvyL2n23x5FGY3PO6aYQmhG37Sfmn3/8Mu8t/Rzt+NOTFgs4qmw2o/SKY9N3T6E/kAlWXGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=sXV595Hi; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id DEFAD5340619;
	Sat, 28 Feb 2026 22:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1772315098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=thG17fqykzjbDyWkNHFawoRP9z41p6sKMvCZgjdLFUI=;
	b=sXV595HiGY/VBAwFWDa0woStTkbBx0QxkBAWiCgGZaIn1E8Bku22go9Dk2s+8Sq0uVIV5m
	LIRVYE/K+1Qq6t0j1jjJ4PkNgPJbIEMH5jnyXGGTzBxlpUhxzzW+TgjaruZC+xwiM4bJsd
	Q6QMXKUbkpLvWgArKqq5nL7hujD5Efo=
Message-ID: <795ea759-7eaf-4f78-81f4-01ffbf2d7961@ixit.cz>
Date: Sat, 28 Feb 2026 22:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with
 bind/unbind
To: Kuen-Han Tsai <khtsai@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@ti.com>, Prashanth K <prashanth.k@oss.qualcomm.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33817-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:mid,ixit.cz:dkim]
X-Rspamd-Queue-Id: 8F4C21C93A8
X-Rspamd-Action: no action

On 30/12/2025 11:13, Kuen-Han Tsai wrote:
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
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000000
>   Call trace:
>     __pi_strlen+0x14/0x150
>     rtnl_fill_ifinfo+0x6b4/0x708
>     rtmsg_ifinfo_build_skb+0xd8/0x13c
>     rtmsg_ifinfo+0x50/0xa0
>     __dev_notify_flags+0x4c/0x1f0
>     dev_change_flags+0x54/0x70
>     do_setlink+0x390/0xebc
>     rtnl_newlink+0x7d0/0xac8
>     rtnetlink_rcv_msg+0x27c/0x410
>     netlink_rcv_skb+0x134/0x150
>     rtnetlink_rcv+0x18/0x28
>     netlink_unicast+0x254/0x3f0
>     netlink_sendmsg+0x2e0/0x3d4
> 
> Problem 2: Dangling sysfs symlinks
>   console:/ # ls -l /sys/class/net/ncm0
>   lrwxrwxrwx ... /sys/class/net/ncm0 ->
>   /sys/devices/platform/.../gadget.0/net/ncm0
>   console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
>   ls: .../gadget.0/net/ncm0: No such file or directory
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
> ---
>   drivers/usb/gadget/function/f_ncm.c | 128 ++++++++++++++++++------------------
>   drivers/usb/gadget/function/u_ncm.h |   4 +-
>   2 files changed, 66 insertions(+), 66 deletions(-)
> 

Just for sure writing here too, this patch (even including fixes from 
next-20260227) breaks Snapdragon 845 USB, and also I seen someone from 
MSM8960, so likely it applies on bigger variety of Qualcomm generations.

Ref:
https://lore.kernel.org/all/70b558ea-a12e-4170-9b8e/c951131249af@ixit.cz/

David

-- 
David Heidelberg


