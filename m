Return-Path: <linux-usb+bounces-32138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BED0DE4A
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 23:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF15230351CF
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 22:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE77B2C08B1;
	Sat, 10 Jan 2026 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qHLQC05H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4ED23182D
	for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768082903; cv=none; b=Iv81CVIpYUwUDxWAsM32w2yWWUc2VTBB6lcupXKTUCXfouYN7+8mGQhXEEftyrrILaTl/ltLbtTkPL35yYwPl/qxbRenH+f6RlBX7sStqczpPF9IJwRk1qc5xdnjmvpJwhUtF6gh9C/RvLnQci7cgwAXD19fOEIqAks2CAlmvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768082903; c=relaxed/simple;
	bh=UlEBhnexFjFzb/o4i9Ha6qArnPIt5KMe7oaFwP0zBSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYNjR0zimAGi/uBf0K5ClVPq/Gua6ALTcxMqoM8vMKwVAMCAMwu8h0RoXxTpS+Y4IEE+7sjVKmqQKqbdoqd7Ng6+ZcuDOmpW+ES9ZwpVIAqvwLux9OBaULZQuykV6azuJeuF1RPEJ9i7iGjGq1LCKTCj3O4Fv75+ouvJS5EGUEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qHLQC05H; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2d6df99c5so420204785a.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 14:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768082901; x=1768687701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI6c9T/mdeir5fCAL6DldkG98gaYOboaMDG8iZjdGV8=;
        b=qHLQC05HwFXAEZE5r+PJ/k9oDjxhcERWbl2jj5NdsvV0zT37rBbQZLSTQGixy6if7P
         X+adsyA6kWEoUgk/VXc0xSwkOD68r7xTaU5iGPlRnGKXOKt7S9Ifg3igFhAieV9MVa63
         tVZmXm/bY9LxpAGFHO6BdL8TbciqS7Rd+Mb7QrK6c0ltI6SthN9hKDwijCYeSHhqEGU5
         15uBJhcqVA1vPZ+Wn2ndD74Jn+gr8+iA1mZdlo8Gd1fLHPX2DngDnwotvQMwR8Bp4qpP
         jGGEdEomLXLn7j3GxVfIJaxiDdmZDzFbgMlJ20JLl3j8tsx1RtnGRifB1Gv4NwYmKATC
         NMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768082901; x=1768687701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI6c9T/mdeir5fCAL6DldkG98gaYOboaMDG8iZjdGV8=;
        b=pDGo39W68QwHe0k001Lfi9mi5fX0e73NpQaXgPDNO+k/JOzmpkdMGAMV8pBBQs5iiQ
         AfIVjg4E2igY4cVVdgaUNa3cei5b6cc9ik3A1SyLq4JkjYHAKMzlmLdamRCKLiE7R+dW
         dVLXVYJW3Cfes0Aeg1ppfdXS3o3MqPLKJxFNSUyQdfR59wauK3qK4gNsXlPuCZx8BkJ/
         azY7PBPEMs+OCZP+Q7pMGTVx/ySjpafjxVCYe+m1zcqQOz1EelNiwQU7yRV4yLTma2VD
         CpKiH0FA1+iCPxhMAVMlQKy14bTob5EJi+6i7ZS4PIzXj0Go919Myy9vsk69FaIPYS4X
         n7vg==
X-Forwarded-Encrypted: i=1; AJvYcCWw8ptvlXXd6i4iZ06BXn8EffD04+yqhG2MLsJzC2rrQAmEfBvTyROhlYuLACflbN20IBd9lENhxhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7OgEOHMdybcYeT+NWZ+Q5Xl58RavjzgExHJsDsIZsEh6S/IC
	U/mQ+npHuNOnob3RApZdMcg1HL/UJLwY5kA/+SV4Z45jjvas/SDIDhCcR3MU6iV8+Q==
X-Gm-Gg: AY/fxX4un7FNuQ7pyncfCgOMwCBK+kcnrNKIILepJdl+Ug97WTUV9rd6Xd4BbwAKU2i
	4qOxlIDZI7fqnTgTjyzbpC1XzdxIA3z0YQL0Uu40sLZqzyD8b/WhWHFIXqZnnNXzsU2tWl6dAPa
	momTH0N6qUKWuz0ngMqiC04d+8EB+uA8yEbu4usHFHMH5kHv5rhr79X9FNYwkV9EVmfxHf2T8/M
	JAWArdEyqGTxFY94ocsOfA3s/fLy25BqWaSts52XUd5TEZGVrligsR0yv2XwpOGmQBEZ/kKLFQ9
	eOLcLcjjsWIUp63HTLwV3KbCA1hJRi4RZrg1X7BEEdmoKGQ4ic5FL4o8V8vLbMVTCNhzceqwtfA
	QNijXaadYq9I0DgRzj/kgOQHwga4Up3DMx39RmDiKuiN5tdlnG84zRhicSk8usqpXk7ywpszOeg
	YoeBRZ3IgpOYPP
X-Google-Smtp-Source: AGHT+IFV5zQWSI3yb+/bOkUdJekUZXbpSUV0yZromOkM7tWWTq5yGK8h94tk0Nkd5d0e8mCnIzAxJA==
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c37f54ead9mr2498333785a.39.1768082900796;
        Sat, 10 Jan 2026 14:08:20 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53112csm1224492285a.37.2026.01.10.14.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 14:08:20 -0800 (PST)
Date: Sat, 10 Jan 2026 17:08:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Reyad Attiyat <reyad.attiyat@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: fix potential divide-by-zero in
 xhci_urb_enqueue()
Message-ID: <1d014d1c-66f1-42cd-8890-0cce7e3963c2@rowland.harvard.edu>
References: <20260110183421.23758-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110183421.23758-1-eeodqql09@gmail.com>

On Sat, Jan 10, 2026 at 01:34:21PM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `xhci_urb_enqueue()` validates Bulk OUT transfers by checking if the
> buffer length is a multiple of the packet size. However, it doesn't check
> whether the endpoint's `wMaxPacketSize` is zero before using it as a
> divisor in a modulo operation.
> 
> If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
> 0, it triggers a divide-by-zero exception (kernel panic). This allows an
> attacker with physical access to crash the system, leading to a Denial of
> Service.

How did you become aware of this problem?

> Fix this by adding a check to ensure `wMaxPacketSize` is greater than 0
> before performing the modulo operation.

Not necessary.  This can never happen, because transfers to or from 
endpoints with wMaxPacketSize set to 0 are rejected in usb_submit_urb() 
with error code -EMSGSIZE.

Alan Stern

