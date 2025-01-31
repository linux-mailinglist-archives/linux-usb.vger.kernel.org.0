Return-Path: <linux-usb+bounces-19906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07FA23F86
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 16:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C40C3A2FAC
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 15:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AD51E3DFA;
	Fri, 31 Jan 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i1ed482P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE01DB37A
	for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336652; cv=none; b=NKqcmxGeQQ7sbImWb89NJbzV+a6hRYzDb3BvQIaONjnWYhNyazkEC6EQUNugx/daREcXzKq+NQ5s/yt+HzXUipwaet5mCb11ViXhIl23dWs+rEDpqbwNIQfIcDlgCZHeV/FJcMLhvndYlYZmjfWhq4JiQkazq7UgFKVZOHkK2iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336652; c=relaxed/simple;
	bh=uQ/9IEjaOOi9bt2Huyu7kFUZuFsn6ln8/341Mo7GpPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiyox4Ulhzy+Y5VTHvBZhc8DT/MSxQOys8ad+ldi7QMIrI6R3tzQXF1C2N2Mort/r8WxstcX0qywDRiQyRiu0tum2R2fzrHpFwbQJvPENwPaWKd8PwErKaoKNfRNA2mGE8/ASqa+bKus/J0Szs0bEXUwBGVQZbry/gOfXt2TugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i1ed482P; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7bcf32a6582so188166585a.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738336650; x=1738941450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcEEocSKT7Gd6kGv+VCs9uUhX/1xF75iIgl8liyYjE8=;
        b=i1ed482POyLBa4BrwxIf/YOJIj4YBDDSOafy1rT7Y2Sw5sgnB4C0+Q74JeDnPtO3gX
         I/Z6Fx7QinRA9KFwedJLwj0lwh575c6FBq3NQtjQvCZ9dvchod3GscX/v+zbIaHmL+wd
         kL0hGCZNxwg7+kV03OpA84qD38fXOFAI4tXRuYdGYWYr0HlvrF38KfbxF5c5UQGz6o0l
         4ok5g1gBv9C89BRl8PROThQ0uAhWi60yLupnCq00PFYigGxRMjCZACzBVBLaFzdEaEed
         QqhggT5Mpgci90rfhxVkur7BMa6Kc2MT3aFNEhrzk7MRPZKO4nplDEPI9sG+FGYpw6ND
         krmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336650; x=1738941450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcEEocSKT7Gd6kGv+VCs9uUhX/1xF75iIgl8liyYjE8=;
        b=Ys0rtevAqElytRRE6YAKmo0MDVSDHqTmVeVkFCrBeaIYQmEWfHhc0KosJ8LLg8LwXQ
         5P3haU8O8B6vdjnrUia9oepXmqeBFgYGeviXhZwy9c+XwKawIMbXuDrj8TR09hvDWLRg
         nu5RT4llmqCv1ykrvTFm7MCyujK0KRdfFa9MCD3wJwj5jMwe5uDORlEku03mtcpM3y/F
         fSuEjEzfkIOGGa5sB6jW0uAtVVdandPE9cVDmJvfwJSgEvKlfzseZFhQrZK2FJKfP3F5
         nIW7c6yPs6ixvg+Iy/P7f8IACiYF+E4dd9h9M7XMqJkoEtGROTAW3ZB7s4kJBnr/WS+I
         T6hA==
X-Forwarded-Encrypted: i=1; AJvYcCWcUjMJBoQiqOpPMVh3OfWADpa9aSp1I0EsBvPSj/lz/sIA7UgcFVHOoELpPg6i53/hc+fc2RwjTZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEvEXWrjSUHlX7x8r6YqeqJYtuychD0LY9xJVkr7cgHb9JIAs
	Qm+UamrSXAXiY+ic66EVuBgcL2rI0W3mwrHvZGRoalHIIDXJIeYxkpsV1wugMQ==
X-Gm-Gg: ASbGncsZ50fNiO+cYua0VWSXxRQ7oTwxtrComoGqdjZwqgOIYyss7LuEXho4rU/Xskm
	pOlINu7SDjOYYIG7pokUx3pKKlpILkET3hIcFfHjVlqfhCKpw2Foj6PS+SVGKEAr0tWNolI8k8J
	qDrFNaA9wPNhK1yX4H5Q0VeMtQy/qGUrzbpR8Xd7N5fme1CoQ1bxr6palf0r4FtSF2bE1XTrfjX
	6dV1Xj74ul7qpHrmeyEOB8tuG2OcMTf4QUa/xwlanIiMf+im45KCQ5pePztYFcLqPNZkEIIYrrS
	dKfCm+eomDJ0FLtu2kk98aBUIhc1Fb5BlIfcXPCwWVpT8swnjjxfdMGudMZ2kF76wGZOwbGkq4w
	dq0kdg4Fs
X-Google-Smtp-Source: AGHT+IHCqeXY+BV6FmNr1viS1b1OcZ/KZ49eMjdJC93WpkWiESpRQgu6Oeebv49ThIzoVKtVGiv4aA==
X-Received: by 2002:a05:620a:4399:b0:7b6:e510:1de8 with SMTP id af79cd13be357-7bffcd1470emr1764968385a.33.1738336649944;
        Fri, 31 Jan 2025 07:17:29 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d97c2sm203541685a.64.2025.01.31.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:17:29 -0800 (PST)
Date: Fri, 31 Jan 2025 10:17:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: core: Enable root_hub's remote wakeup for wakeup
 sources
Message-ID: <2f583e59-5322-4cac-aaaf-02163084c32c@rowland.harvard.edu>
References: <20250131100630.342995-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131100630.342995-1-chenhuacai@loongson.cn>

On Fri, Jan 31, 2025 at 06:06:30PM +0800, Huacai Chen wrote:
> Now we only enable the remote wakeup function for the USB wakeup source
> itself at usb_port_suspend(). But on pre-XHCI controllers this is not
> enough to enable the S3 wakeup function for USB keyboards,

Why do you say this?  It was enough on my system with an EHCI/UHCI 
controller when I wrote that code.  What hardware do you have that isn't 
working?

>  so we also
> enable the root_hub's remote wakeup (and disable it on error). Frankly
> this is unnecessary for XHCI, but enable it unconditionally make code
> simple and seems harmless.

This does not make sense.  For hubs (including root hubs), enabling 
remote wakeup means that the hub will generate a wakeup request when 
there is a connect, disconnect, or over-current change.  That's not what 
you want to do, is it?  And it has nothing to do with how the hub 
handles wakeup requests received from downstream devices.

You need to explain what's going on here in much more detail.  What 
exactly is going wrong, and why?  What is the hardware actually doing, 
as compared to what we expect it to do?

Alan Stern

