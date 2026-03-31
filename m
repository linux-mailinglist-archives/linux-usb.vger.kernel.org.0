Return-Path: <linux-usb+bounces-35737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NZ3Jj3ty2m5MgYAu9opvQ
	(envelope-from <linux-usb+bounces-35737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 17:50:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4636C1A0
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 17:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E61331612E8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A735241323C;
	Tue, 31 Mar 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VcqR4gI8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FC3F7887
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971577; cv=none; b=KnE3ssDO0Ph/OYcl/7nLEhCKfNz+uQw3fOyTO+lnIEgAIbXLx/SA3QBOgDXQgHULLFdBEhX56YbcVwSW4PooV+dshsgNUJ7C2s8stLjVcBRozPItXXV+cBHu0xRtxW7y9nqodY4GLUsgoL9256G12vkqMgFLkZ7n6t14JB6ILh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971577; c=relaxed/simple;
	bh=Ak+NhynVCRXSzXbW+6DY0flK80Vze8i5NJVQ5FIXQsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsbJ0q2sUg2X55BhTVX5nQwNCpX+xxQQNhM8QCcM4/sHtNrwGgKfLh6OOExBBDHxEGYCrgqwSizAla59LXnaxQUQE7ANijtyig+UH5/onwo3hbouKo49KjON3RynRAVEc97xIJwXJYSihy51kJwyrSmR0qO1sQOG+66aFttosK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VcqR4gI8; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfc5941028so1023834985a.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774971575; x=1775576375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UlWdTRSk0ScBk6MmGe1b2cX3yiTXuSV9L60anC+JFS0=;
        b=VcqR4gI82buYDAEboo08O7M2IVw0Dcmu8JLUfuGTOlGguJEsozD3OOlrMZoOfY3qbZ
         pYD1bm8s1cKNyMmzebDVOQo15jF1r/O29zVdwgcukhJ3HCD3iLlSaJSNKemjXut1rcX6
         9GoJuFr6XmeaRhyRcDnoaxkFJTADvk85NFcvuzeJ2Rbsq5osWr+DEeEaqu/8BZyhba6L
         N3pggKhv2I5aw/Rxm8pG/guOZSObtP/u1DGY+16pFg4SeRv1w1cazL1QLFLwuuLjxEQf
         7+JOA7VCFJCfu6Ij3CLt9HA3inn0QQGiHyJHmeoIBoBz+f2WpeOO5jPwmMmg8rpt8P62
         NUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971575; x=1775576375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlWdTRSk0ScBk6MmGe1b2cX3yiTXuSV9L60anC+JFS0=;
        b=f7Dchz7KoGno4d2Ow9b/gON0Gqi7zCIB7lCAWX5+I26utKGYlm7084DoCSZ3fo4uEX
         Tb46PnXPO6lH0TM+/PBYOi6kb6G7v6vWFaMVfTWD4cvQ0MALAfle6JPT93k2DvcK/CfG
         b4k+V9G6mYYkKVlG2qGWshQDrgaaDj5/M+eIROZX2tZbPIH+XUp2bCLKBrso8pU3a/k7
         aTRB9MXnIama/Np0j+NNQpcbgNe7Cq1RxWERBhLj0bcez2uL+BG4D9XoRfqDKrJgk6Iy
         05Ppx/0mCjDOvR4S4IDQXr3Pa2fGTibUbGoyFrLbWGeYMQOW/IXUEgGqHtA/m/xNwcfq
         i+gA==
X-Forwarded-Encrypted: i=1; AJvYcCW+iARVjP4gFbk04TaZsRZfkfoeid/swozoxUxRkrgphcX13lZvHbiC+y+fAaaGADwsByMcMSUAy6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3lkAyjJb4oZs/hxis079fFhMEugeQl//CUX5ABPv8n/eHb25
	D3BxpifVpAOEqJnCzAX03SQ3fiSpFZu12nIpO6cydL4RhhMTiQhFk1bOmWkmrwcUqA==
X-Gm-Gg: ATEYQzwYO6cBUZC0Y4vcxOixGXosI+JGYywFotMB2OwRa9ieZQSb+uuqBCztqAqezws
	WJs9DlTGkabr5VqpecTFTeaBvHSJYrczJggg1zMEBIDcbmUM/A5dgt/qX5N3wd71Yzrp65U0/T4
	kYt8PTE7ygA5UYCMTpXBDqEoeT2P7nUenqGZWlfNgLCvK/oRyxg6umh40MKz4GxbVeowvfV5WIn
	qZXBYyGQCQFhuGJ3GkQ0Sj/PmgI7bvbzSqlfBL3DT/UUQSNo7yxdhkxonBywFpadfSzPbuOSmq1
	RvMyIboxQhBhCPvqeFPV2t8LoIR0vSFrOaUQy6uT1j+22g0M0SHig2QQlkIF6ESfDa0vY2SvvEX
	BHjPwAUaGcn6zrkXU0P7ObKUsq34NUpD3ON7tO4OYU7M2WcnnMBX5G7QvRv8HkQ09OuhxHN3RrP
	9U6U5VRkosdou++wBugrGnqI3KiUrHljUPBmE=
X-Received: by 2002:a05:620a:f0b:b0:8cd:b315:6af6 with SMTP id af79cd13be357-8d1b5aa79d9mr17484985a.8.1774971574767;
        Tue, 31 Mar 2026 08:39:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028086d25sm870272785a.43.2026.03.31.08.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:39:34 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:39:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Message-ID: <04f515ee-2213-4489-9734-d871e0d3d682@rowland.harvard.edu>
References: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35737-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aumovio.com:email]
X-Rspamd-Queue-Id: F0C4636C1A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:21:45PM +0000, Andreea.Popescu@aumovio.com wrote:
> When Linux runtime PM autosuspends a ChipIdea UDC that is still
> enumerated by the host, the driver gates the PHY clocks and marks
> the controller as suspended (ci->in_lpm = 1) but deliberately leaves
> gadget.speed unchanged so upper-layer gadget drivers do not see a
> spurious disconnect.
> 
> The problem is that those same drivers may continue to call
> usb_ep_queue() during the autosuspend window.  _hardware_enqueue()
> silently adds the request to the endpoint queue and returns 0, but
> hw_ep_prime() cannot succeed with gated clocks, so the completion
> interrupt never fires.  The request — and its backing buffer — is
> permanently lost.  The caller sees a successful return and never
> frees the buffer.

Won't the request complete normally after the gadget is resumed, or 
abnormally after a reset, disconnect, or shutdown?  Either way, it 
wouldn't be lost permanently.

Alan Stern

