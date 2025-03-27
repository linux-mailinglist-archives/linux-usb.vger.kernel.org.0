Return-Path: <linux-usb+bounces-22217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83EA72F20
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 12:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5CF3B836A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 11:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450E8212D67;
	Thu, 27 Mar 2025 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UiiYk61U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE84212B0A
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074818; cv=none; b=MzIMA/Znw+/aolFmVwjJnju3fsQSoit2Wq2t0Lrgd+Y2jgTPjAALcRC5yPM/lfbSedL95yMDo7CQhTWsgeWvxYX/OjBT+joxnCKqWHIm52I8iwXZy2Nj15k3Z6N126i1DOsKNsnVxJhgxpmdICM4UDGYuiGVAwY6nn6zeNnpD+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074818; c=relaxed/simple;
	bh=9D9SrZ9Guc5j80GHoyi1IN2HIWPHsXJ03NxTQavJE/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBvm7qCSqH+qio3/7a5lrh74/sD9y7VXhElLmxZ8p+BcRwNmdgrxt+ZA53/zFAXE/8+5+umWRXtjJ/70tnSeYhu7WkOHHeRN4KXpjJ1HCCqsGgbQ1sTKMXbif+2rTDHkc7r8zawmAKWia2bymNyBmLGoTndaZLWY1Nee9fPpwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UiiYk61U; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227b650504fso18441775ad.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743074816; x=1743679616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2AuT37xiWgeoyfofctKeQd4KeY4ttEG8ZN6lFf91h4=;
        b=UiiYk61U2HnGLh5UBm2apDyywdW2it10Hn+Vliiw/I9iC5VwX6gE7A3GM9JEDbnIfZ
         D5zWHb2DnqXfyL+bwtk2StxgchxL3u2WD7dYvNzKzET9rnmjSe8WCEoPy8zSIgpOORd2
         KW23afb9DQCxIfpjIBIBlsxINkhaMmGbDz5DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074816; x=1743679616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2AuT37xiWgeoyfofctKeQd4KeY4ttEG8ZN6lFf91h4=;
        b=bt6mOHbPG7CKiAr7bj/mLD07xdHAxKnjnQuXpyGJtpS2xMPXu2DQBmfO85GVrBqY7q
         TFedTawRc+5fQQQ74ASsKWrnjpE3i/AzxONenCcaTNJCrUHR2QFk9yvRkOThjxRL+tDm
         pK9k8lOQ2QaYSgXYa9w2NL/D4RUYK0IgxivT9QRZ2AtanQ+arq+XekcAX3g/CZfqj0iQ
         znMQZ80DxxMCHuND8gUP7JY49WE6eK2TdCoAbowOVozQVm3I/7gg35b+AZveujWqVMwX
         map9nxZ90ix4zmj8bsq6ED9bE6q77Dsv0bT4/Aq0PJgToGTqugWglkxIlAifMAvHSgRJ
         CxfA==
X-Forwarded-Encrypted: i=1; AJvYcCVgBKQmhnojRmK9jKtQFkSbtFFFgWBKbpE6qlkbjgv2O71w0llEimqo2S6Ly9/24FyOn4xC+k1HgSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUhN7CqlKferDUKVQNadOiWppPuL2FkqNokOR/hJE7cmWw9BI
	/b1dOcfa+WP6eHedgVU3hJrb9Xn7bRPinykPlrsdOEadHXrtxr9HC1/2+VXrkg==
X-Gm-Gg: ASbGnctfRLYCBuMcMXZt7jnZa+97iO+0PJOHAo3tWuz/8nqyiGe8CtVYpKWOrFKi911
	5/H3/lRbShNmLp4B6NPZd9Gerl5sf5mk+kkS2BdXxMjftb3p+JmdV69Pr+aN19ez8sxqP0KS6te
	HjNdr0Cmx1g3U/2EOWC2Cyt+HZeMa44sgPcox3e8PSkPaplE6BC7BU+JG8Pf4cHiHolV4fTH78Z
	xa4Y/W1IH70sv59o/EZrvInqVTlFX1tqFE8QcKxCmpmhSoeCWU2zIW1CoDCQFR5Zx0Fiw/kZYX2
	FlaNFEkzk2KEFG3jlFDa4iYfXKeF3P5QKcBrUs7YNBGxMIs=
X-Google-Smtp-Source: AGHT+IG/txRHAVX7g4/vCs1ZMOClZRM7KX6u4ApDYr7w7+zrGP7CNmqR2ckOYOkiHPDbG9f/t553bA==
X-Received: by 2002:a17:902:d4c5:b0:223:66bc:f1de with SMTP id d9443c01a7336-22804872e5fmr46886355ad.21.1743074816393;
        Thu, 27 Mar 2025 04:26:56 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b80e3sm125825505ad.136.2025.03.27.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:26:55 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:26:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] thunderbolt: do not double dequeue a request
Message-ID: <3x4clfg5ypbu2aoaewibncrq43o6f6xjyxgm2k2wv7dfosevb4@4sj7tbz7gfs5>
References: <20250327055314.8679-1-senozhatsky@chromium.org>
 <20250327111749.GW3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327111749.GW3713119@black.fi.intel.com>

On (25/03/27 13:17), Mika Westerberg wrote:
> On Thu, Mar 27, 2025 at 02:52:54PM +0900, Sergey Senozhatsky wrote:
> > Some of our devices crash in tb_cfg_request_dequeue():
> > 
> >  general protection fault, probably for non-canonical address 0xdead000000000122: 0000 [#1] PREEMPT SMP NOPTI
> > 
> >  CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65-06391-gbdec63d10750 #1 (HASH:cf42 1)
> >  RIP: 0010:tb_cfg_request_dequeue+0x2d/0xa0
> >  Call Trace:
> >  <TASK>
> >  ? tb_cfg_request_dequeue+0x2d/0xa0
> >  tb_cfg_request_work+0x33/0x80
> >  worker_thread+0x386/0x8f0
> >  kthread+0xed/0x110
> >  ret_from_fork+0x38/0x50
> >  ret_from_fork_asm+0x1b/0x30
> > 
> > The circumstances are unclear, however, the theory is that
> > tb_cfg_request_work() can be scheduled twice for a request:
> > first time via frame.callback from ring_work() and second
> > time from tb_cfg_request().  Both times kworkers will execute
> > tb_cfg_request_dequeue(), which results in double list_del()
> > from the ctl->request_queue (the list poison deference hints
> > at it: 0xdead000000000122).
> 
> I remember seeing similar but it was long time ago.

Another possibility probably can be tb_cfg_request_sync()

tb_cfg_request_sync()
	tb_cfg_request()
		schedule_work(&req->work) -> tb_cfg_request_dequeue()
	tb_cfg_request_cancel()
		schedule_work(&req->work) -> tb_cfg_request_dequeue()

[..]
> >  	mutex_lock(&ctl->request_queue_lock);
> > -	list_del(&req->list);
> > +	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
> > +		mutex_unlock(&ctl->request_queue_lock);
> > +		return;
> > +	}
> > +
> > +	list_del_init(&req->list);
> 
> Why this change? We are not putting the req back to the list anymore.

Purely just to be safe.  Do you want me to resend without that
line?

