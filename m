Return-Path: <linux-usb+bounces-36988-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBekKi1P+mndMAMAu9opvQ
	(envelope-from <linux-usb+bounces-36988-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 22:12:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79C4D3811
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 22:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9C9730E8FF1
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 20:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B3B3CF683;
	Tue,  5 May 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0zz8Kky"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E23D5648
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011503; cv=none; b=DnIbIaQsq3U/Buh1N0nHV89KVrd4Ht74JkuTOFzp0/cf6QZheIuhHHfKbSxYgQuouU6MGKyIHmB77TwL9Z8hcGdk9KeyaXWBhtWrKInDb+xySqLcHyFY7+BcuGmaziyFIHM9m8YLQP3DnSmSDX8dM6/2pAStJnnku6Re+jD43Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011503; c=relaxed/simple;
	bh=HHvtoY5jW5dAPrHiQl1OyWaN9qY30BBJDVffTAyTbwE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cl/kbcocqaH7hwmohgkvvxSf5hFgvbNNV2zLP3mum95Ev/OsJdV8QpbqdcWroqcn9i4Jr0OH08/AC5zuw+jL99As6zlQPAVvYd+6b/ruOiBXYTnOi5pbg9ulCiC6cWpHM2Osk4idA6g9XRVZ+0Wv62CcBZfHFPOA45MU6Q5wEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0zz8Kky; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so81647845e9.0
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 13:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778011497; x=1778616297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj6rzIVcAlG5m5OPFy2pyvos/5GpWy0+8buHD+CQTvo=;
        b=N0zz8KkyUhqqizIB7bFJqGwOuncCXWba/gmwqWCVDpQcs5IX9TNs0CXaJkWKS4daeT
         o4CNiRvQU9yDAcucbGCvlHXww9SVKKTx9hnei0LNMmpzEadAv/emNKPfmsy8YwrFlBNw
         35I0gB75gb+blR9vDXnNMsV3iFq7VpjCRAcXJl8UF5uAE/dkEjPFyXEbhXBPeBaKvBZU
         2w5ms5Mbdheg/hvTJONsAmuSZfshm/Lx7nJyCjK8IKv+UCJpeIJNcOFPh9mWp+AvCWxT
         3zZpwVAV0iyTs/ySFRtknuj5A6Tpb/dJFrxEcRFpmpQNQDpgGUr/eK6C3ONA9e9lZ2M1
         fyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011497; x=1778616297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aj6rzIVcAlG5m5OPFy2pyvos/5GpWy0+8buHD+CQTvo=;
        b=mx3KVqtaVwwuOwqFuKh+bV1hwPK4HQ4nkyPpWpjyL7op4Ym7A7YnV+8hImDzNquFHi
         TlOgmB6x7e2XRFtMiltO4/+IjqvYInkB00r4hciAFImvCuVpuaVQD0QXRlHPDH70bSmb
         VHwKv8vPrkb+zRyBQ3/xYnqb4Q8ny4hKy7WYYr6j+aEAZoYBcs4NhlIysaR5eUEY8Bck
         NnKtQGSfFLCOs48yI2QAy23z26UNDIimRyBmDyZe7GuHTjP7oPVuPNMDeTGgmZAEMrzc
         7a/W/xV5wYxhloOKTzQTycd43RuCYHQQUL+xibbrz2l0c6SQmqK0MZxX+72jMHuhqGh1
         6HnA==
X-Forwarded-Encrypted: i=1; AFNElJ/8agQY747YdbPUHYlATUI5gONiRd0AyZeluuQ+7szqy/W7B6ObQrwukG+bxHmmxIuzPj2KPdfhaz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YXFX3YLDRT4kPFObXVa0JDxqc7cm6M/ncTdtQ1GYyr9ZOftt
	wCuHAks1quHIMzEyPdfUh5ZzTpri0mXcZsxEB6ziRhb13RtVx33gWusj
X-Gm-Gg: AeBDietBm/xn4WQ4pKZRHtdnL6X0mLw8EKWAqDjMk2snjrLyZolckntO98YvhhEiHXv
	zxTktVOg+s/XMYawc1BcqBHwgcod2/IrH0JPsLoopez1mztKAp7+Yweng0qW/ftHfQk6koD8XeO
	R90OwbEsP58nmHP/O/2Bm7qSxSdPEHj887fD0ZlpHxUiExsLlZPeWT9uQtOylqTo7DAJPSqOxZv
	TFEKwNV65Oo0cn69k0f4DR825ydC9c3eDMHK79NUrr/0h80fC0ZOXBFYvAFjT6Y9e8NXYr+APXv
	BaUMpfAxaSOEMPoOSPyLRAbazY8GLMouqzgEmZP5mBv2VT8ZQ7DlP6VDuw6sNzASLHVMGY0Ba8a
	JmVXQjwttO5+6KDP3en2qfkEESQG32Lbcve3qD2ltwgIThCapoBWSw3eQQ7NvgnRtJtUcA7t3ed
	5uDvtdgke5B+LKNXEA9CcU34p06G9MKfrjtnQxiOCVB58JHg==
X-Received: by 2002:a05:600c:8485:b0:489:1f3e:5f6f with SMTP id 5b1f17b1804b1-48e51f327f0mr10779025e9.12.1778011497382;
        Tue, 05 May 2026 13:04:57 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5288f6absm1049955e9.9.2026.05.05.13.04.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 05 May 2026 13:04:57 -0700 (PDT)
Date: Tue, 5 May 2026 22:04:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Heitor Alves de Siqueira <halves@igalia.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Penkler <dpenkler@gmail.com>, Johan
 Hovold <johan@kernel.org>, kernel-dev@igalia.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
Subject: Re: [PATCH v3 1/2] usb: usbtmc: check URB actual_length for
 interrupt-IN notifications
Message-ID: <20260505220452.214dec73.michal.pecio@gmail.com>
In-Reply-To: <fbbcf9c7-b1f6-45d9-bb69-6c9878d3f658@rowland.harvard.edu>
References: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
	<20260505-usbtmc-iin-size-v3-1-a36113f62db7@igalia.com>
	<fbbcf9c7-b1f6-45d9-bb69-6c9878d3f658@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4B79C4D3811
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[igalia.com,linuxfoundation.org,gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-36988-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[172.234.253.10:server fail,83.28.83.227:server fail,100.90.174.1:server fail,209.85.128.43:server fail];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, 5 May 2026 15:17:59 -0400, Alan Stern wrote:
> > Fix by checking if actual_data contains enough bytes for the headers,
> > otherwise resubmit URB to the interrupt endpoint.  
> 
> Would it be simpler to solve this by setting the two header bytes to 0 
> before submitting the URB?  Then if the device did not send enough data, 
> the header values would be 0, which should prevent any reads from being 
> out-of-bounds or getting stale data.

This amounts to saying that:
1. for 0 byte packets, the default notification type is zero
2. for 1 byte packets, the parameter byte defaults to zero

which would result in:
1. a warning (similar to this patch)
2. who knows what, why even worry about such things? ;)


If anything, I think the new warning isn't truly necessary and it
is misleading, if vendor specific notifications with zero-length
bNotify2 field are legal. It would suffice to check actual_length
before accepting the particular 2-byte long notification types,
and leave shorter packets unhandled, causing the default warning.

Another missing bit of pedantry is that these types should only be
interpreted this way on bInterfaceProtocol == 1 devices. But as
long as there are no other protocols defined (are there?), no valid
device is allowed to use them for anything else.

Regards,
Michal

