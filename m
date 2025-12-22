Return-Path: <linux-usb+bounces-31672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ADCD62AF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 14:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24A3C300BEEB
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40852DEA75;
	Mon, 22 Dec 2025 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PptBvVsQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6429B793
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410460; cv=none; b=FA20xuja+p3F4Ax3AgWSx5O7ZGVRhWtlPF/XXKRkH+a8wfAiAYuXn/esOHaxA3Ko1ptXGPgOWb7FSXK6iBPQSuWVzubdzM7Mg9RrhiI+Tdid5AS8uiAw7yI4i2vR5G3XNfyzvVErpjF4rkoLRSDfbIWS759Y8mU/TxgAOUEJEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410460; c=relaxed/simple;
	bh=VHuUzx72lPsrkWeQjnRC+FJARfSfPW1UJja67kTa7VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6Kg4C1YVopW/btEG136furO+rh7CZetUDxF9zD8f10aH2oAOXpmrqP6fvvIYmSfoovcFWo+1mEdB6Rdyir5JmflUmhn9Ml2mIRDvDbLOj/gFScJkXnfqDoY74fzowEIGQz0fY6clrgRu5U3+niDr/MWQ7vjZVNaePbXJNFGcxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PptBvVsQ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b5c81bd953so472786285a.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766410458; x=1767015258; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7au/c+JJEMe33DDY5UTa6iZx/L9q0E0b80rsee0tRWU=;
        b=PptBvVsQBzipEdGc/Zstt/26Ob2CxnFfbB0eDoV4cCaj2ym+MzH/pWHtLk+Sncwadz
         mRax8FuBgTJAEgc328vVVoJLYGboa/2dp6Fb3N8PfW8HDDphjnZ05AxLbXmhtdeHsaRj
         pDQwMVSeB2qEsGjYsEVy3hNPzV7oI/slYK6S5PxUWp/rghpDFBTnExsF0USWvYQEz4ii
         MmZmo1COVUO8ZVpCGrd8Z9hcnp2y+w2gI64bQU2Z3njjwM79i/12P/oBO3rV4jba5h6d
         mUmgMoew5Dl6byYId23wTuSuvRnhG/iPtxc1kBBLb6dwY9WFSJfDq91YkM6vox8IANTy
         TQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410458; x=1767015258;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7au/c+JJEMe33DDY5UTa6iZx/L9q0E0b80rsee0tRWU=;
        b=i8kH+swg5bLVw7zvphP8hIhCcTmqy95q0Zflvk2as3LJYVgnDc7CJfkX21Zx//VgvZ
         cjxyvn5Kl6vpqHwXXRPBq409Ik0d/k6+fxHyWGK5RejxSm1zbrRLXsTLFJnDmoBzxNxc
         fgE5nKMGlkotcBHFUePqw8pEvmv7ysgJoZFFe/3e8gsJ5nkgCPaVqFYjQ/gnMEGZPEm9
         pVC8b1Ly7e6Ysfcy+E5lzpzLy1M7xZXPqWhYVv74bW85OKXQUBCJUYxRip3IUVBem9ln
         vCOyI3enfYaw0ovOJmaUtybcnudsJRnBLvWvW71qa7Y3pfzY3C9qg4xkfUWMDcKdxqUH
         YLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+IRRDi6MbmQMF65aLYUYS1F5DV1mEs4z7ksFqnRoaPt8O5POv0kP4b4TfYuOZjRJF0c+zsK0sTIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJ/KGiwHDcB8/lvNGM0sUeoImEIwsSNzmrDLH2/NtoZfNVaia
	psSQwEo/WeW5v4i9orLPJNAJWdYiUdWVFUxV3BWBLFrRLwlyLu+4SLt7asIlyM4eVw==
X-Gm-Gg: AY/fxX62YWCLZwY+mVJk6eI0RxU91iSlhI6CF6Z7XU9HLEF88HY002Sjr9mfel1DcVs
	0DHUPEMH7/82iRKUf61JPDffz2oy85oSUktIEchn/s/uoNjWCfc1iPWz3NoSPxYNJaruGacbFH+
	S+h8SLMjqKvtxs7qvoPK0PqTz8S8IdIyVY+sbTqdYZbo0EoGZ9+p/SjwE/cWv0QG+t4ZyEQpgFj
	c1w/JpIU0PlgO4L7GY3L+0HL/51fkYfdkl8tyz2Nu2EnH3AiJ1aJFFcUpQHUJn1vbTRCMUh6qRP
	f6XH+yMVkFZn4SqKX6H7pkQrCt4foBEazkR9hlL1PGbbVq6slUYSjCzcDQZNFwaTMrqBger3aJv
	XekjYiyA8WZr6/Iy+7nByNGyorbAo/3Jp0Phxl/YTs0R2D5KVOYav/m4oSQYUKTQ8vqlRdb1AM0
	6BdDypojEdsshE
X-Google-Smtp-Source: AGHT+IHFclJGfbJdfG1NAYIlLmJbRsjRa+O8X2PMUG3cjDCDW6qpBR78l3EMXgmmttJzHWqzt085Vw==
X-Received: by 2002:a05:620a:46ab:b0:8be:92e3:3203 with SMTP id af79cd13be357-8c08fd32ea7mr1680703585a.68.1766410457849;
        Mon, 22 Dec 2025 05:34:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm828734585a.9.2025.12.22.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:34:17 -0800 (PST)
Date: Mon, 22 Dec 2025 08:34:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSN?= =?utf-8?Q?=3A?= [PATCH] usb: xhci: check
 Null pointer in segment alloc
Message-ID: <eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com>
 <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>

On Mon, Dec 22, 2025 at 12:21:09PM +0000, 胡连勤 wrote:
> Hi Michal:
> 
> > On Mon, 22 Dec 2025 08:13:21 +0100, Greg Kroah-Hartman wrote:
> > > > An API that insists on its users exercising care, knowledge and
> > > > cognisance sounds fragile and vulnerable.
> > >
> > > Fragile yes, vulnerable no.  Let's fix the fragility then, but as has
> > > been pointed out in this thread, we don't know the root cause, and I
> > > don't even think this "fix" would do the right thing anyway.
> > 
> > The patch looks wrong. I suspect this happens when add_endpoint() is called
> > concurrently with resume(), which makes little sense. And it means the same
> > code can probably call add_endpoint() before resume(), which makes no
> > sense either. We can't do that with suspended HW.
> > 
> > Chances are that this crash isn't even the only thing that could go wrong
> > when such calls are attempted. For one, xhci_resume() drops the spinlock
> > after reporting usb_root_hub_lost_power(), so your guess elsewhere was
> > correct - this code isn't even locked properly.
> > 
> > It seems no operations on USB devices during resume() are expected.

Let's be more precise.  No extraneous operations are expected on a USB 
device while that device is being resumed (i.e., no operations other 
than those directly involved with the resume itself).  However, 
operations on a USB hub or controller are expected and allowed while a 
downstream device is being resumed.

> Currently, after checking the logic of our KO section, 
> we found that there might be two places simultaneously calling snd_usb_autoresume to wake up the headset device.

That should not make any difference, because the PM core serializes 
runtime resume calls.  If concurrent autoresume calls can cause a crash 
then there is a bug somewhere.  Maybe in a sound driver, maybe in a USB 
driver, and maybe in the PM core.

To track down the bug, it would help to log the start and end of the 
resume call, as well as the add_endpoint() call that gets into trouble.

Alan Stern

