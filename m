Return-Path: <linux-usb+bounces-36482-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMxZHBt77GlaZAAAu9opvQ
	(envelope-from <linux-usb+bounces-36482-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 10:28:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DE465883
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 10:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40FC4300FECE
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 08:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618CD34677F;
	Sat, 25 Apr 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZO7a2sc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB5D1D61BC
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 08:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777105685; cv=none; b=RwZ4TXDcdmwa4LHsodnHdRNzddmM+YJuENTcp3tjeISfyp1O+q7OLdl79dqL3/3AiKn6PGeYK2HiTMEvxfsqLRHCoUKP3q/4hvt0Q05AtGp7vTUR4Z4a5Jo2H3WKmFLtjqVdtLhBJuwGaNVmDfI3OzkrwIcoaXlSth3QRt9Hn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777105685; c=relaxed/simple;
	bh=VP4UMktKUW9zoZTUrhxtdB9XC6wMYH34C/FQqzejLbY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qB2RZ55YSC1n9/huhuWH0y6OX6loFXlaDkr2a/sV711xUl4avVyS0R7H149y1ufyA7sd2VzlnKrfzwueyzlW/SukCMvalB3pxs46YgOUUFRYAxVyhLCM8723V0xaWiuCZLRCe4uNMamryWEEGVTs9T2oxypY90g8fPrzHT7+HZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZO7a2sc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4989dacdso9356805e87.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777105682; x=1777710482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps7ahP/53TtoD5P7O/97SJpyoJwoMyCbAkkLuGTEiVo=;
        b=TZO7a2sc+2wgoT0SMLjFyoXuXNHJpQ5o5grFkqubrgPYvlaWrLI9c7qDcDRwPuv3kl
         dwpSpYNS9+Mx0mO1lFe7rBCBrRFyrKyL9wPtBGpshKqEbNaIsU3YkNWDZ7WUsSvdVH1n
         4xcYUtecQc5RD4t0SFOXfiJiKJU0QoLiRAgy6NrxUh2NK/lyhMnoduHOJYgxGGNS2ySw
         y9FKspRxJ+jQoah7aUfbV4iV0FXxy+BTzMDFyKm33N2wMFjt5qoZwdKZWVTgs6L5E57D
         lZ3mmR4g9uwqccRjimdE1KrU8HnlshgM/puQ2uZ1NWVEUurGVzBljLM8iJ1njU4ltXD5
         vFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777105682; x=1777710482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ps7ahP/53TtoD5P7O/97SJpyoJwoMyCbAkkLuGTEiVo=;
        b=O9EBTPkqxCiQvbnWNpe2ubH2dwevdGEMubiJ9l+ulDbprfG40qQdmZQzp8XBZ4br7z
         vVUbvrVZ3ZYHwxqYWdX2Nn4knP3Bxtk/iFYreT9Jc+26wNNvGQbhUq13CGxp1Qv0zDqr
         s+AkAgFnpGdDzAlKGZdxkLHwENxlXyxdAlMu9ePPZ4HBhWOp3y3xrh591ESorRGe4o1t
         r/4sHJFl0NOOd1VRDCtaWc8va7H0I4e82Z6G6J3bsJwbFTDHcnoMrhNSObk9n22pfnz3
         hfbb93rGS4PritDmmcMXEBqYJmosqQfRYm63IpMwQNkMiErmlLhpncoiSQAuE9lHGIcg
         XSGw==
X-Forwarded-Encrypted: i=1; AFNElJ870DeCHY/oAAt6a2fL3PhsQWyOdIOJN74+lpUuk5RPntGucSwaRo7hQINN/3i4wDoTIj8qfh70uGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzafOmrLfAEAvE+U9YFsAw0kfofoZji9zS14UMHfhKvGN/BRaVO
	hKhdzhTkdu6DCFzbDFmHVzxG7l6rKBxPhKRCKud+0b6w46Jzawahq3kX
X-Gm-Gg: AeBDievPgJ0kKjqSZojAHieVqSuMST1a2+cGtwllq8aAV8+Pjl9Wj6c2Ras5wi0VEpt
	bD8u7VRdqAOiO/EEU2w8zDNU7h+l2wjn4XGJPh7vqIGnsQNj/JGcyOzFnD3cVuYMKVyZ6ajjFYY
	szTstcfHKR60c2S7O6NjyodA/qAN8r5KsnWhj3M9SzD3/7cXT1Q6VnliCcrkcOXoHibgYwN0Ml2
	VMizAcYg8Yuf46zowABqllQdYpxTnfRAyumcTscdvMdo4R6tGLxqmdJ+Djjgj7utWnsGULQPv2M
	6r0gnBK0W08j7BjeIHfNPzzvzBqdynEVPLSkUr+jLjbMgPJrzcaB3ObxpGTCPM6NC3TMZgXX5H3
	awO84gPC3K9eDSaa/3YraUtUVjBoBz03Ap/UvsULFaH6t+se7Ruo5h/K0WqjoM/NhxPtj6Potw1
	mHfoygnsQLIehrqs6h73cBrakpelpCGVUG0Q1UY4pLi0M=
X-Received: by 2002:a05:6512:1dc:b0:5a4:19f3:f2b8 with SMTP id 2adb3069b0e04-5a419f3f3a2mr7261126e87.10.1777105681544;
        Sat, 25 Apr 2026 01:28:01 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ca0sm6537143e87.65.2026.04.25.01.27.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 25 Apr 2026 01:28:00 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:27:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: b-liu@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [bug report] Potential deadlock bug in
 'drivers/usb/musb/musb_core.c', between 'musb_g_giveback()' and
 'musb_stage0_irq()'
Message-ID: <20260425102756.3340851e.michal.pecio@gmail.com>
In-Reply-To: <CAGp+u1YAUsw=qCMky=mM__mchVEP=e=S3WgVk_A87FLXwpm9vQ@mail.gmail.com>
References: <CAGp+u1YAUsw=qCMky=mM__mchVEP=e=S3WgVk_A87FLXwpm9vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C47DE465883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36482-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 24 Apr 2026 12:50:43 +0800, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential deadlock bug
> within the 'drivers/usb/musb' subsystem, more specifically, in
> 'drivers/usb/musb/musb_core.c'.
> This deadlock potentially occurs with the involvement of hard irq.
> 
> Kernel version: long-term kernel v6.18.9
> 
> Potential concurrent triggering executions:
> T0:
> musb_stage0_irq [t1]
>      --> musb_handle_intr_resume
>          --> musb_g_resume
>              --> spin_lock(&musb->lock); [t2]  
> 
> T1:
> musb_g_giveback
>     --> spin_lock(&musb->lock); [t0]  
> 
> If T0 (i.e., the hard irq) occurs after T1 acquires the lock and both
> happen within the same CPU, then T0 will not proceed because it cannot
> hold the spin lock that has already been possessed by T1, yet T1
> cannot proceed because the hard irq runs disables preempts.
> Simply speaking, t0 -> t1 -> t2 can lead to a deadlock.

Hi,

You may want to consider earlier operations on the same lock and their
implications. This function releases musb->lock before acquiring it.

If called with the lock unlocked, that's a different kind of bug.
If called with IRQs enabled, the caller created this problem.
If called with IRQs disabled, it won't enable IRQs and won't deadlock.

Regards,
Michal

