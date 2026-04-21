Return-Path: <linux-usb+bounces-36402-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM0KMxja52kBBwIAu9opvQ
	(envelope-from <linux-usb+bounces-36402-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 22:12:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389DF43F4ED
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 22:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BF9330CBD17
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 20:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130133DD52C;
	Tue, 21 Apr 2026 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfboG50J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D753DCDB6
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801957; cv=none; b=ubAJQbjldyRYiyYFXMKcQGA7yfxDjTz4X4Z5KysRClERBD5dsj6v6E8d9GAPaQHhZH6RE69lF+nRUSCsq8e5H7q0Bx0QP5ybfvg7+kh+m2gK7BBmSTeopDPW5HNmb2GeRAIECBIrrexaXLN2soYlBBSwcKcUTWHINrQkMibYw1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801957; c=relaxed/simple;
	bh=phULm1Ywed9W8M33T49Q6eS8se2Hvypqz3ZZdmbjhJM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw4vr254WS5vqspxi3PDSAevI0CpOz0bCi6hJZo0WCe8A+fQDB7HFEMzOcuf5YieWoFKqIVLcHwWHWyE5pwLqX2tbx1mkgCJ2pNcHG+Zaoq02OW7U5GHs7Xj0/pXAAfErl6cfass/9DqbVNA+72DNApLHtxsXheIgyt6fFmQ0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfboG50J; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so6975946e87.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776801954; x=1777406754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK4izauZRRt/B/VXYkiUQKoI5K7lJzjxQ+RWvCNLSKk=;
        b=LfboG50JLmVr+cFmySs7f1HhhIew/QilyA0gHA4pXVhSqqQq9W5Qtv0lEGdXZTRrCl
         J7G3U5HWvFalRlTiwCLWoA2zNVZ+6DvHuSYO6d8aASyd8zfOzUVM1ki4N5GmKOjWjhee
         5cgVNihXuWFoctzZ2ESS3+uLBPaZxqd4glk5C3Onm2qJgkRBnHRG/+Dyt3qR8sKXt9b2
         ZJsWNY/JmB3IbVP8PGNQ19w51sjFmN/Y/9FKMuvWllbAtBlbhEHRQejuxVbCcYNfy0Hc
         733uVBUofTxPifcjEpfYL3l/LbMP/9Fo10iz5YIv1vdHGdFCw9NC/9O8+K4ZmnhJtYSK
         0hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801954; x=1777406754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aK4izauZRRt/B/VXYkiUQKoI5K7lJzjxQ+RWvCNLSKk=;
        b=X8rNPqejo7bmhQEGXJWX9+Nq4wtxZ/dvBU6/uY3C8e0GLVLSNeR/KFAGbMzniRmD5c
         AkWRV66Duc5KL6VaZl/rI+zLgMZ7iowxrwrGkGy/+tqElVgNzTQvSKOhj74LoIkXYE9q
         RFxnTOqEoexT2m6I1ozRkCtEQDww2/sgnGpK4vh9p39JDVtGwRMg3P0xUChcIJl1Rwf8
         3+SWJ4U0dJNrpse0lPOpv5xtuBLFwg4Sg8k+I5fbQvIB5bgoSQMLSjHgCwCeBokUJxoG
         C7hjan1tatozC+/04MSTW1/VPOEMGE6y+dTJp+A3hCZ77V5JxbDhMlSs6eQFdYDcRmfB
         p3eg==
X-Forwarded-Encrypted: i=1; AFNElJ/UNzvzUatcmfe2z80AN9LpNtfObuPZBwzlLo2TsWsWD8MpgdOJg89N1aLgLXMWTYJsy/eBaL8JTag=@vger.kernel.org
X-Gm-Message-State: AOJu0YycTjWHS9BHlCKjw9QM+cDst8nj233fSkdMvjPZP4MjzAm+42EN
	CZnVwEiuVyWRXSEaVmyFimR0aUKqEmuC7iqjTiKd4eBR4BwkoBsPibRz
X-Gm-Gg: AeBDievJc84gr51ONOg3b/okM9AU5d3BkDj0XahhtlcbMrsQtubhkl/0IEtp2CibFO3
	8PhR8gOH2dUps95cMleDTeelSHPUEihnpC3ACDcDiWw75DcN/YlevYoExTp2XAUZx5tlYR6UFqn
	zYLNzMFxL3uywIojLthktmzlORBHKt53xZXbvJ+bD5kl5SxQi46t7/10uPVpXLtIZ8z2DfVzbL5
	nR4WMHuF2CjdtGHF3OLQ9359RkN9r7vf0lXnM6IqWgN+Tbazn929JuUfDiqDe4davX/yBhdI/E+
	ZDjvnsyIPMTXpMFXiszAOb86aSgVxM0b8tEnRx6e+aC2w7owLxdy8vFCws2RQ6tsTOlSmBqcuts
	9yoKjguwal2T9m0xEtI5Dmze9JgV/2Lp4pr03Xp0e5VvLFnYIN4Wlk3BoXte2ja8dpVxUqQpGTo
	uLmXfwn6AecEt0ACY3wZDOOqdkSCvbwAKY2JB1eNgDq9U=
X-Received: by 2002:a05:6512:3b12:b0:5a3:f3a4:1aff with SMTP id 2adb3069b0e04-5a4172e87afmr5498771e87.38.1776801954040;
        Tue, 21 Apr 2026 13:05:54 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e11ecsm3934256e87.47.2026.04.21.13.05.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 21 Apr 2026 13:05:52 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:05:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Morduan Zang <zhangdandan@uniontech.com>
Cc: petkan@nucleusys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, Zhan Jun
 <zhanjun@uniontech.com>,
 syzbot+3f46c095ac0ca048cb71@syzkaller.appspotmail.com
Subject: Re: [PATCH] net: usb: rtl8150: fix use-after-free in
 rtl8150_start_xmit()
Message-ID: <20260421220547.2f7f9d85.michal.pecio@gmail.com>
In-Reply-To: <73ACB7391A6DE033+20260421110412.14795-1-zhangdandan@uniontech.com>
References: <73ACB7391A6DE033+20260421110412.14795-1-zhangdandan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36402-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev,3f46c095ac0ca048cb71];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 389DF43F4ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 19:04:12 +0800, Morduan Zang wrote:
> From: Zhan Jun <zhanjun@uniontech.com>
> 
> syzbot reported a KASAN slab-use-after-free read in rtl8150_start_xmit()
> when accessing skb->len for tx statistics after usb_submit_urb() has
> been called:
> 
>   BUG: KASAN: slab-use-after-free in rtl8150_start_xmit+0x71f/0x760
>     drivers/net/usb/rtl8150.c:712
>   Read of size 4 at addr ffff88810eb7a930 by task kworker/0:4/5226
> 
> The URB completion handler write_bulk_callback() frees the skb via
> dev_kfree_skb_irq(dev->tx_skb). The URB may complete on another CPU
> in softirq context before usb_submit_urb() returns in the submitter,
> so by the time the submitter reads skb->len the skb has already been
> queued to the per-CPU completion_queue and freed by net_tx_action():
> 
>   CPU A (xmit)                      CPU B (USB completion softirq)
>   ------------                      ------------------------------
>   dev->tx_skb = skb;
>   usb_submit_urb()      --+
>                           |-------> write_bulk_callback()
>                           |           dev_kfree_skb_irq(dev->tx_skb)
>                           |         net_tx_action()
>                           |           napi_skb_cache_put()   <-- free
>   netdev->stats.tx_bytes  |
>     += skb->len;          <-- UAF read
> 
> Fix it by caching skb->len before submitting the URB and using the
> cached value when updating the tx_bytes counter.

Question:
Is it correct that ETH_ZLEN padding isn't counted in tx_bytes?

> This mirrors the fix pattern used by other USB network drivers.

Which ones? I looked at a few and they either:

- appear to have the same bug (kaweth)
- update stats on URB completion, right before freeing skb
- copy data out of skb, update stats, free skb before URB completion

Regards,
Michal

