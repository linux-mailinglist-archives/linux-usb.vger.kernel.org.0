Return-Path: <linux-usb+bounces-30515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A3C5CE0C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 12:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5DA33BA495
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A3313E0E;
	Fri, 14 Nov 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG/B5ipj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88A3112BB
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119958; cv=none; b=EFXKG9SMKvrAasIGD+hKVaq8hArxMooTC6JPBpALD4vDLoFD+Rm0lnFSRu7xw5NhsGHIlt4CIKXneu9NRaMLtmXPEowBI+tWg9R2nYcFzAS3cGm+l7delvjHOLiq6r/iBw0wzluj4CsKbog4DIZYTeC/cP+q7gOa0PJpw0MHk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119958; c=relaxed/simple;
	bh=tw80XQS7gcuhFgq2e+0cR4mYBq9i/GPA8MIbGKKIyFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnM7s4gyq8zcQQIlKxP6EgRdhSm1vU9jLUgvYGvVIqCT3sy//pz9xpSw+VWq0pAK098AZaPVAF+ZHf84zq5IpdBkr1tEWupgFk6HjzIJQvhw2+x1rxHE5SEekZavyh9xyCqC5oIgGSKEKWV16tSuIMuLpqpuhi8xMCA/RxTLchQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG/B5ipj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7346565d7cso252268866b.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 03:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763119955; x=1763724755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwZ9IwziRvv511z74P1bPB0EzRXrY1p+mRsnhsQMPA0=;
        b=UG/B5ipjGtsz59MpTmyZ1H6SGVAiMwpgp4+QvcMr7G5M9RDdxiQWhFsvloC0B5gmex
         iFAFzMFZPPd+MZpf+tn1cnFPHE8P+pj8jaNRlCCiMs21Cn47uaxQFzpyNVn1C0v8H2MO
         unF15FdZV3i+VzLe3RCziSwQih3hPV8h1y7Vl+iE1+y7mGctT5D6ttWO51fAIL7qM83J
         7qbIR9EamtatGGMi/QxQDS6zvX/KrjWYLY7Ztk8n/l6tgyK+pEkp+WCYHAFDWvou60OE
         7YXdtRgJLmo8tV0cC1ZX3erk6cWUjvUUCJcpQ34jIyjefygAl4KpwHBfWWZJfb1C7vGb
         K5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119955; x=1763724755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwZ9IwziRvv511z74P1bPB0EzRXrY1p+mRsnhsQMPA0=;
        b=i4moo+ZqI4rEIdBp227bOkJHBL7yGzWy6KkK330X3q3Z1vJYuL0RI0vPi5w8iHGVaE
         8FPtYHFG4yt0hocI3VEB3Tyo8Ukc2ldzY1Og08/WAKmoQN3oO3XghkczZBkx2wx5n1Qw
         yC8Dti1g+X83iD4o3XEzoQqwQEO1xkGejr9VZPnqSp6TLGCWJ13Dsqr0bzVoWl50saQo
         X2jrNd0A5OgUaXtBa9YepmJl26HAj3w9SqU2M/MBN/V7Zr3mR7W7b4HQCLsCO7mJPf+I
         hwXtooLTlNu64yb7AHAMoMDaFz3LZDcdYf7MTAn5jjHyOY/gCPqgUpZvVUlirdwQ6Ru3
         J5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWHwtHvmICuhBodJ/GeUfanQpHNyGcYqfU5hGDT8rQv+hE5blimDkqJJMhJrje+BmyE10vw4ynxIPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAw9SaaeJ9W9tjynZ5YqviVNQkQb1GAWXIbnFUjLjhPP5BVKia
	0dyXUQ0soZ3q66Jr4M0sWYPSJZ+q5CzlEdtZFS5WBv7VUyvIxAZddq01
X-Gm-Gg: ASbGnctTi4cnpB1cdPD+O35rZnMOYClOw2i5Km82O/BGtyg9gaJukasVj4SQtXrGehj
	Tva4Mpj5Wyn2iuT2v8Zen/C+umoc+T7bixH9IoRpMa+IE9RmzMT0Z+meGLESoJ6xu++AKXWl7uY
	lu4fBemyVf1Lt3dDFao2mnEJKG8JiaQ/862D2MrIF7ce0FHApjdUWIvP8fOhZQQMtW6hsACP6i0
	vJ9rligZvG9eN7dndDl+J7zDPiFzBVnmQurVggswtVFCZP7GXtZUYBq5RIFrn4mPa/UMBygY9GO
	jePgsr7XpWWDm+jwcSmq4nnpW9uimcrWFMf4hFj3UwdUOIGRVRj+2Gn9LU5KMgB/cmjoctljGbi
	xQY4aJM//3a7vEuk8abHC/MQc4rLWFEPdoUK92RwBYXUi0nVg1te0wfzKigSgby3NW6/1r17YWK
	MjJ3MuHp6JXiLRsz+DldSy
X-Google-Smtp-Source: AGHT+IHebChlUiARMNvR6+Q9RxaISSKBoJQh35WzGk3JES1+Xu8Hf9v0oU0TQYODRELhd+YOSDmbRg==
X-Received: by 2002:a17:906:c153:b0:b73:5c12:3f8a with SMTP id a640c23a62f3a-b73678d2c5fmr307412666b.18.1763119955406;
        Fri, 14 Nov 2025 03:32:35 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41e5sm365888866b.19.2025.11.14.03.32.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Nov 2025 03:32:35 -0800 (PST)
Date: Fri, 14 Nov 2025 12:32:32 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Don't unchain link TRBs on quirky HCs
Message-ID: <20251114123232.0b96bfa5.michal.pecio@gmail.com>
In-Reply-To: <f1259e37-5671-43ca-85f5-a37b68d5507a@linux.intel.com>
References: <20251107110837.7b7d686b.michal.pecio@gmail.com>
	<f1259e37-5671-43ca-85f5-a37b68d5507a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 18:19:38 +0200, Mathias Nyman wrote:
> On 11/7/25 12:08, Michal Pecio wrote:
> > +static void td_to_noop(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> > +			struct xhci_td *td, bool flip_cycle)  
> 
> we could avoid passing xhci pointer to td_to_noop() and just grab it from
> the xhci_virt_ep structure instead. i.e. ep->xhci

I can do a v2 if you want.

But OTOH, I didn't expect such pointer to exist (though I'm sure I must
have seen it many times) because it doesn't seem strictly necessary.

Maybe do the reverse and get rid of ep->xhci, or stop adding new users
and clean up existing ones along the way?

Main users are invalidate_cancelled_tds()/giveback_invalidated_tds(),
their callers all have xhci and could easily supply it to them. And we
even discussed removing the latter completely, but I got sidetracked by
issues with URB_ZERO_PACKET.

Another user is xhci_handle_cmd_set_deq() which already has xhci.
I have a compile-tested patch which removes it completely right now,
it took five minutes and zero mental effort to prepare.

Regards,
Michal

