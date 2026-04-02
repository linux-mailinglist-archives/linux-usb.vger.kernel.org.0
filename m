Return-Path: <linux-usb+bounces-35825-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFPSIWrYzWmliQYAu9opvQ
	(envelope-from <linux-usb+bounces-35825-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:46:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA5382CE4
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21ED23018AD8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 02:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C10D30E84B;
	Thu,  2 Apr 2026 02:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Co/rQSdz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6F296BB6
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097951; cv=none; b=F0vASVCSH/CiMTd3wOdnXRPeRbCkpEQcrsfRoPZIwwcxOtQcMTHhfTA0ReuzNDKAjyfvAIy8LeR+G5S3ngZyU6+HZLZS2SJfvEJW6Mfcv+osUryOc6XnAcgpBgZV9WxxYyYjaAqFFfQFcoA07kGT8xOqlhai6+SdhMeTRYMghow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097951; c=relaxed/simple;
	bh=SCt+gTM3qG3+Ugp1eOCLkJgQi5Fkd6vOClgfKnuzpfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBd0qhN+Bqy34MjgRxS3u8M7mn64xPskbdhuSJt3Srx8EcXDFTyPhwhxfhCg/MEiSMY+8P2SQaQ1ztwhjYXWxvHsgUTtHDJI1xV26UIKUNMxXN8LGTN3vqDHjv7gr0qeSW28Wm9Kdk3gk6vlvjS3TsHp/NysBaoZwRJBvITnEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Co/rQSdz; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89cc68655f8so3684496d6.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 19:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775097949; x=1775702749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ij3r0BY1hyVpdvgxB+A3Uh/CkRIWLQF2Z9GYDD1zyzI=;
        b=Co/rQSdzuT7YQt9AR4EOyVnmA9GZta0oStmazG9yzRT9AgpKsnr/i7SH+H8yrffXKm
         TJboDErLzmhjqx8d0yUJ0QcKeT4ISFxDGx+abZZvsdM/dJfvVtFW2VVb2KkzE6oj+gqz
         jNpZDpfrrnvxDEZ8UGsvFClmxAI3RtmBOX7SphF6hCZlfU9HlLI1zZxRUZ3L6qUZQgeh
         oWRi9vfNvNROc+IUA4YKdfno5lkbINUW3Zt0mcWDsXOc9wvtSk/LkYvIehr5/EifF6r2
         j29dOpriXwm7ki8O/D2AIKOntu+cuIZhVTy/L14H15VdEK5PEOGYxZaJ4Wby5YDJ0aYi
         O22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097949; x=1775702749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ij3r0BY1hyVpdvgxB+A3Uh/CkRIWLQF2Z9GYDD1zyzI=;
        b=oYAMb6w1C4gFAVi/I1AwOuduhJL0HF/a5eX9bjBAuevG3rlUvr0CaCL/ZFMD+rEQra
         fwK3B3jTR9rx31IVFvGE9RrZOb68kbhzWGz13eey+dTAjUU8F3DC5ljOvzZIk1X5KhrJ
         fxjr7fCdgU9ABqIM2sy0XpSKV66NMtbIEcVnsL8YyVViwzSqf2Gz+WenPdlpV2xJQEb6
         79+vDRJ+cG2cAXpjdQFNnNYEVvWb97SEUwiAa3e699cWd1r8m+3gIZCT0Ef/EIv4F5As
         qPoCis9OeQkk/4N4cDlzsnS3n6151cCwhvNiKhq/g4ThW/niXZbuL/Cy5t7vl8wzO4Bi
         Y5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVjYbF4oaLICUtTWnb8ZSU1QWJpMD6jkiK6gf7HGnBZjtpmv8dPdjVoefDk5kAzlvruianhioZNRwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXx/TpRYMT4aZMQZNx4s5uQzKEJptao9Al/z4joUzj/Zz6kEN
	Xsa+GbM4u1yrAgjPItWA7jeAkjSuUPRdtVKmKBMYrR/kPVkWcQvm+6HQI3tzU2/1Ow==
X-Gm-Gg: ATEYQzwFqNs7n3eVt4g31+f500l549nOD1POE0I78ufWWSmfCtWsSmyr9SnlJheQaXk
	1Z/cqzL4A34+VLd3/hh8dY1kX1bJI2aB178qJAW3cvLKkcQsxspksSk39unsYb0OguZFA1KfYZJ
	01QIUp/f2ox97/E4w5eyJExel4VJ0NnPEWLvXeuXQqsv6vwP2Etl1Ok6MibP4x4Iaqy6GIdUfme
	uxmSWebFGHyEvwiDZX1u2jOKACafXcroTdzxGJt9ZXTBaSw+4b0HFISEJQspE8zVTBK5jV3qqSP
	XSeMhbAJB1gF295DhwrxnT9oZ/CNf3d569WOiTpzU9uPEG4Eewbd3rkm4LlVEdIgMMfCsZa0DzP
	DrifkzNLzjp8OJGHpsNOdBXaCmRL3scAfwM7pjXGNZoz2ly95ab13l4GOvwQSzF8seH+0hlS7Qr
	GRS3K0kFE99K/DquqQsOeXcEjs
X-Received: by 2002:a05:6214:2603:b0:89c:c95b:e8c9 with SMTP id 6a1803df08f44-8a5eecd888amr10169846d6.36.1775097949471;
        Wed, 01 Apr 2026 19:45:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596e03febsm15464576d6.38.2026.04.01.19.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:45:48 -0700 (PDT)
Date: Wed, 1 Apr 2026 22:45:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tao Xue <xuetao09@huawei.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, caiyadong@huawei.com,
	stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <31026029-d7df-4e84-977b-2d6f74fcc80b@rowland.harvard.edu>
References: <20260402021400.28853-1-xuetao09@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402021400.28853-1-xuetao09@huawei.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35825-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: E3CA5382CE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 10:14:00AM +0800, Tao Xue wrote:
> As specified in Section 4.14.2 of the xHCI Specification, the xHC
> reserves bandwidth for periodic endpoints according to bInterval and
> wBytesPerInterval (Max ESIT Payload).
> 
> Some peripherals report an invalid wBytesPerInterval in their device
> descriptor, which is either 0 or smaller than the actual data length
> transmitted. This issue is observed on ASIX AX88179 series USB 3.0
> Ethernet adapters.

Do we log these invalid values when we parse the endpoint and their 
companion descriptors?  We should -- and we can fix up any errors then, 
just once.

Alan Stern

