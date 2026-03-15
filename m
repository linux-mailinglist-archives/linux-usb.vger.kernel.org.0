Return-Path: <linux-usb+bounces-34831-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJeVJyP5tmlfLAEAu9opvQ
	(envelope-from <linux-usb+bounces-34831-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:23:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057B291E7F
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 381E43012BD5
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 18:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E2037475D;
	Sun, 15 Mar 2026 18:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oehuw32J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75891D61BC
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 18:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773599006; cv=none; b=DoLsr0p3e2QCsLJ1AixJ8X/ocjVn7G1nM7vnIKYR4zZIlPAgRKH3JTaQI9/1wJsN8tiFw2bYWPZeP/8AB0N+6HuFGnHmgHnNWeqJGKX+tasINlIT2YQZlLDDkVAzcFhXn7snbYvnZpJ9STyX0mPMx3cKkvZw669nq4fawsQvKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773599006; c=relaxed/simple;
	bh=idV6RsFWhDB4zrtBCn/+Mg9I9B0iS/4yQVfmtw5u2og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joDLI6TsNHL8P7GvWgDD0zTBcmI4zNrUJBdtR5+TSDjS05Uy2tnuCSgKMTonr6g4A4/oY+9emXRUkzJ64fLqJakgm/FywCB9qzXqeTilNhtBGy+mvOwItYgbRPCgj7y+wfAhD3WbKN/WaOOZCD0dBhAK4Nz20TJ9C3H7LtDDRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oehuw32J; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cbc593a67aso413886885a.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773599004; x=1774203804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyUki97QUj2CAKp6NWN4IigkcB+q5rnnjujVR2PvUuc=;
        b=oehuw32JDtekbRknCNHknxiy9cXgKMSrLTJtiKQbrHZ1XYmbf6v/7ots0BUjVc4XJu
         t5GtOWPlcUjaJFXizHG15+Ik3zQweETGVGDm11WnWAq5KKMzLgItvIEHMq93npZ01Sib
         qjIMqBZp5L86mKJwkI6qtTAk12reWRWVPRL/92ZEM+QJ0/nMSNQj+TH5/RcJnAJzGsgS
         /rcZK78uShefxdeELypiebaCbS4IHwAf335EanXX8K2NtdtitmW4BUdX7mRbu/u9CX4C
         Gng9APjDIseneqizLCs7jkDUz8crJ4oPiQFeGwyQL+Z6VU2uwHf51nOgxUk5NxD0QKxt
         9M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773599004; x=1774203804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyUki97QUj2CAKp6NWN4IigkcB+q5rnnjujVR2PvUuc=;
        b=XsZmIddyljZ5A0LXEw77uymVokkjVjO1wBlHZ96gM05NsXoMNYDsVb79Pu/hBWCmmY
         HJzxjIBWhSc1CHnu0yNrPhWvCwoXZvXMk4s33hfDwLkXkaPZzLvYOWkw0FQZj2tWVaL5
         MV8EAdzzUBj0vakNOlRijVUANZjo+2ti/A+9EknijNz9pUe+MAq7FFAj4MCf6gu4cXik
         huKanzmbViq5q+xnABpL3t16GW6U9hZ564p3LjdDFnVHEGpWl0LYPgFqJanivaPOWU5b
         qt4ZqVgN1T8TQqjMgKFEdWYs/iSQaV5/KDDyqUFb+cK/+XZbxv1Y4QjOzpjlvfWht15z
         TRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2z6qU/XarBRA4GFNnJaZPj9d7aTh8wCE5caucfwzRUtw+datfuyj6Y+ffMkwW+VxGKPX/iWKw5x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCHC9YPqFKfIKcX7dwAgxfscpYwpymougWH6xYoSt+9zCi7Qn
	IOEGok/u3cuQH3VJb5Pkfg6sE3BaIeY3dVdTgBmTKdRV2vSpOCfb8g4RpFyzvMLfOpbY/1hSQJe
	ba2Q=
X-Gm-Gg: ATEYQzyEfgMEV2Zj3JqlhJnhW6WKkO840PP0ObBFlPE2WwHSDHii7LgNoLDr/KiTAIl
	GENSq7MRNw5FVOA6slfVH2ktaXN/M7DxSbvX8Lm9hvTpzz6mfw4hCYZLYd1S5k2Ah8LUp/TuBRb
	iv7IBRvxiP3PkEFl3dkHySORQ28rop6nNsOca3xLO2P8jE/G2Tjmohv0aaK0f24b+0whh8rWHnH
	Q6VwlLgKv7dcGPXw1g8gCzZENp49U3vD2DT/Wle6jzLeB8+2++oi4lOiucZ/nrFH8QJtHLK8tXH
	RNXxcUJHx+1x0BRILnOaKDdU9q3iIBiiGRAd8cL3MIGQGrLFnlY6IOrY8FoAHBMoKRrjmP8VNYF
	+JsD97E8SrmlX4c1whlptbNaznFxXHLm6BWfQxT+IQm2YKcAYlvP+UdLZ9rja35dxHuTfc+bCcQ
	HjXXMlsLsd3d1dJh9ObMwKhvnx
X-Received: by 2002:a05:620a:28c5:b0:8cd:8a8b:8d0c with SMTP id af79cd13be357-8cdb5a3ff3cmr1347112085a.1.1773599003645;
        Sun, 15 Mar 2026 11:23:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2166a79sm1025439685a.49.2026.03.15.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:23:22 -0700 (PDT)
Date: Sun, 15 Mar 2026 14:23:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Urban <surban@surban.net>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Message-ID: <c82c2d74-3c62-46ab-8d56-958aedb4663f@rowland.harvard.edu>
References: <20260315090307.304644-1-surban@surban.net>
 <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
 <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
 <68a2906f-0a3b-4543-9c56-795ae9d2ee98@rowland.harvard.edu>
 <c8cfe974-7158-4e51-964b-13c4b41e3df5@rowland.harvard.edu>
 <ad638a92-6951-49d7-a809-cedbfd303353@surban.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad638a92-6951-49d7-a809-cedbfd303353@surban.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34831-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3057B291E7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 03:55:03PM +0000, Sebastian Urban wrote:
> On 3/15/26 16:28, Alan Stern wrote:
> > Oh, I see now what you mean.  The whole thing uses
> > loop_for_each_entry(), so it always proceeds to the next request in the
> > queue even if the current request isn't finished.  Instead of doing
> > that, it should always handle the first request in the queue.
> > 
> > The loop should be rewritten; it should be more like
> > 
> > 	while (!list_empty(&ep->queue)) {
> > 		req = list_first_entry(&ep->queue);
> > 		...
> > 
> > Then it would behave as expected.
> > 
> I agree that the loop should only ever process the first matching entry. 
> The break I added at the end of the loop body achieves exactly that. 
>   
>   
> 
> 
> I kept list_for_each_entry rather than rewriting to while + 
> list_first_entry because the stream ID filtering at line 1421 uses 
> continue to skip non-matching requests:
> 
>        if (dummy_ep_stream_en(dum_hcd, urb)) {
>            if ((urb->stream_id != req->req.stream_id))
>                continue;
>        }

Ah, that's right.  I had forgotten about that case.

> This wouldn't work with list_first_entry. A structural rewrite would 
> need a separate scan to find the first matching request, which seems 
> risky for a bug fix. If you'd prefer that approach I'm happy to do it as 
> a follow-up patch.

All right, you've convinced me.

Alan Stern

