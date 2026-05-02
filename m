Return-Path: <linux-usb+bounces-36849-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHyPDOxy9ml0VAIAu9opvQ
	(envelope-from <linux-usb+bounces-36849-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 23:55:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A173D4B38FC
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 23:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23F1E300D9D5
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2026 21:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F553914F5;
	Sat,  2 May 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOVGlMyC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7937F8CB
	for <linux-usb@vger.kernel.org>; Sat,  2 May 2026 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777758925; cv=none; b=BeFgpuOzYihrbwY/gexStl8HcJaFHmCRVXGpMB8A2VhnS+8EklA1f68tIlIZAsQYA7N5MviaCrTjPNZ1WXWuzev+cWlss+CinpejbGt3bIZ/HNTu1hXseCwXX0QShvJNMQbJhGA2gixWpuChzXNcpF695Mvo932VsnDtAbulMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777758925; c=relaxed/simple;
	bh=yrsqX7PWvFqc7WXIAaXKeO3CvketME8kxLMBs4Qgdsw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjHd2KPuDpDNKGi41366wl3McBr3Btzj4PWQy7jBM3vflaPyBREomwqKmlXWPVsPShEGmBl16WulPp0ln6Ug8GLZ8Pbx6MKjPbWqEOUA7LrDAcoVJW3ZpO7AWZpy7aHD5jfJXvY8jEHsSnnWKb5nnHOEX+JGSUt54t4DSXAnb1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOVGlMyC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so46933715e9.2
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777758922; x=1778363722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw2jZRLYzOlZ7sxfl/+h5eD7AhFBQmZQktoNUjcMaC8=;
        b=NOVGlMyCFyx+Ljn45IbOkjBYJjJHbJJjIma58szJsFWHJ6IEQc8YSHre5SirTWj7R6
         lviv9/zj4p3MwtGoMbCFyTHnnmAnLpetaF+zx/r5dOVMLv9V4Ofco9pZrR+wZUid0G0C
         e1LqHPJcDOQJDE85cjkfrI0ek596WRhRHu+Ms6RphqwvcrQaNhQSCjGu3g4hN/d/nsFw
         9sGs5XUEJON1HZp21+NMMxz/cSaxNmMGshmzQ6znrXiHCKXg36ewI/OZO3EDRDJoaAJB
         GwiqL0XjZ0iGIx+tg4ycOBGU2ud/0v7nT3XDf3tNVpvFWct/Y7CcPlG3Je8jwX93CfOO
         idhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777758922; x=1778363722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pw2jZRLYzOlZ7sxfl/+h5eD7AhFBQmZQktoNUjcMaC8=;
        b=EPOWi4BIuuDPEIZCMSJ0ce4fA8KLlmHLdnoOZw/gG0ezIhBteg/4Qn1dcJ9y6Vkrx1
         rJb0qy1TtR7pOGyrFpHo03DWNAL1dBPtqXMSks1eFzInzuwjkc7CqtSQHSJw3F2DkW3d
         J7MYHwOShT1Tcd3RuO7N9FRmB4b9XiCExYAycr4Pfz6x1O4JbODTw5YZPtc2tbeksJdp
         /yY3oUgRMaG0YIZqNGogGz+5e/20Rk6rglCWCTqgwdfAal1mBj+C8YDQqQ54MRzK1QHT
         UkTa3njW5CwBzPQef+uvUax9tm9RqZY7wLjh4AXUQJ40zcoD4U5xWw6gcD1TDBSg+2Dq
         RpRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2fwShujiWrg6fcsfaQTmodb+L4wH1P/j3CIuH6gr6sQJqTtXfIWBhLvIcZJTHr7CbIl9NH08Qyg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzifHMGeor/a3pqLSVG9N0R7ibNs6/A3y/+dfnGQ6n4KOn5z9pK
	UJV0mkcwyITcVh+UbOdWIdfDBVerrNmd9gc3ARz3GSxDQfnp6cQ2aDRE
X-Gm-Gg: AeBDietCOArVX6CE/OzZ4PGbwnCtnoQN+YtGYnHpex7zEoJ1ffH1309FbjBl7o81CbI
	mAG9H4+ehtLp1lrL9Gq3D42/BQbtcK7X3d/+aIoKAiNjQoA1D4lQ8p2SoAOgIR3wWOSaoeNAvug
	vmXhv0g0qC5ggy0oV4Jg4j6aUrAM7oNroIWY99cIxaPEbGgIKcJQu9q2zv4iePIGVQFoonbmBZz
	s3CE842J++YBe13KpUlf2w+ecZaDpwkRcR5nOCQgv6chkPNkWIPGTNnePWL6t8HTvEshoYm4eDO
	861pyXXT7Mm7XCHR7HRmFcyWmB+++nNbAOw8bacbHlvtOlvLf9T9yyspIGhpd+LvllVaZy2UKmg
	PYem73hi+4dLFKfqzPdpkYRb3pRbTBb8p1Ok2q0tmOjoSCd2NAx5gLyNAH0tOXnTTKh30ZWRxu4
	0FverarJktsOlRb9cY52k2rBj4uuYTSEkWx/CEmifolugsvQ==
X-Received: by 2002:a05:600c:c101:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-48a9852f492mr46167455e9.3.1777758922338;
        Sat, 02 May 2026 14:55:22 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm344248525e9.9.2026.05.02.14.55.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 02 May 2026 14:55:22 -0700 (PDT)
Date: Sat, 2 May 2026 23:55:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on
 command timeout
Message-ID: <20260502235517.089ba5bf.michal.pecio@gmail.com>
In-Reply-To: <CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<20260430104850.352bd946.michal.pecio@gmail.com>
	<CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
	<20260430235453.2288c973.michal.pecio@gmail.com>
	<CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
	<20260502114644.76e6b5a3.michal.pecio@gmail.com>
	<CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A173D4B38FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36849-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, 2 May 2026 08:38:34 -0300, Desnes Nunes wrote:
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index e5823650850a..3041deb67b57 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -1761,13 +1761,15 @@ void xhci_handle_command_timeout(struct work_struct *work)
> >         /* mark this command to be cancelled */
> >         xhci->current_cmd->status = COMP_COMMAND_ABORTED;
> >
> > -       /* Make sure command ring is running before aborting it */
> > +       /* check for crashed or disconnected chip */
> >         hw_ring_state = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
> > -       if (hw_ring_state == ~(u64)0) {
> > +       if (hw_ring_state == ~(u64)0 || usbsts & (STS_FATAL | STS_HCE)) {
> > +               xhci_info(xhci, "kill the damn thing\n");
> >                 xhci_hc_died(xhci);
> >                 goto time_out_completed;
> >         }
> >
> > +       /* Make sure command ring is running before aborting it */
> >         if ((xhci->cmd_ring_state & CMD_RING_STATE_RUNNING) &&
> >             (hw_ring_state & CMD_RING_RUNNING))  {
> >                 /* Prevent new doorbell, and start command abort */  
> 
> FYI, sorry to be the bearer of bad news, but this also panics the
> system as soon as I run `echo c > /proc/sysrq-trigger`.

Is this not what's supposed to happen?

Sorry, that complaint is so odd that I thought I'm seeing another case
of debugging being outsourced to an AI chatbot, which forgot that panic
is triggered intentionally here. Now I'm just confused.

> Kdump doesn't run and no vmcore is produced:

Is the kdump kernel not launched, or does it crash during boot?
The latter would make sense if there is some problem with the code.

But I don't understand how patching xhci-hcd could possibly have
any effect on the former. Does this new code execute at all? Does
"kill the damn thing" ever appear in dmesg?

Regards,
Michal

