Return-Path: <linux-usb+bounces-26910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC7B2827B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 16:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB2B1C270CE
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 14:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917872264AA;
	Fri, 15 Aug 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pr6NTctz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508231987E
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269550; cv=none; b=JsZF22YRgA6oUW+DssNBRm+JyRXRtJuZIJ0v0gcmgOgi84r+FARExP2uFAONmJahJhcWSFLBEdhiYDmcm/0DyaOryfCm3svzIXejVrZLpL8c273p6x38+IlfvRSClZwddnb5T8QpIWjxuRlZrdJ79oNnLDmxP/hnbl7DXeWUggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269550; c=relaxed/simple;
	bh=DtT/Y5qKRn5Kz7DtR2n+dWf3v8V8GvXH6hZMDWjLDn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZfyRojNaXPij6DwJ6J+Z5XUE1MdXS0l1pNhGLDoBgCVydGFSPhRvpd8hboibHRQxsK1FSIOm7l8FQDEtjgLzIjJ6X2hchiWKEPJEMDZ+VZjRqdmDsDtF5Rw2rqlMAlbTnJ4N/xhr6t3hlvbvLumrCIxmZDgHDVSbxqXNst35wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pr6NTctz; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e8704da966so138010585a.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755269547; x=1755874347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mN9RVJ1kDostHM+lziHYnTFRFhOht60JSqMOopJ6OWw=;
        b=pr6NTctz/gQXOEYh/sZ2c3vakmGColEb8n2KslnsY6ubijNjeAEu7mgUdIK15HzGGs
         X1xVb1CXGqMA96tta0a/p+c+cP21MvyyaLxiY3ovsP0GYK4lgg0Oc8uXIFos/7kj5JY4
         aNUHMPLFlm1oHw/cQvueDv68PkA0cLMAscZJDgtJchmiRiNCzHHX7zt7SS5cRCQQUE1E
         szafnARNxsbQ/Wa9oTS2UKi0LqUqzjK1ipYeovep7XBKH8+Tki9njCwOZwvpmLmnjtHp
         9sFD3XiDiPg0LeB7iFlz3muunRDlmxeG3JilSwCMkvzvWdXBXoIuYIBqMYTQCr+cdqbg
         NzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755269547; x=1755874347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN9RVJ1kDostHM+lziHYnTFRFhOht60JSqMOopJ6OWw=;
        b=Hvyo+6LLYe4HLSAIWKKRS9t0jLMoMZwZgzg3AjT+POxUq75XfhYkB3Wk+R4tFIBG2s
         wfqJzE3MqAw3H2+g7Q8v6cKZrTnNrpY8GVVIR7eEIQ651w8Q4OKKezK7bpYLKVool8qK
         CCeMQ+FCK687ZtCW3od205oc2h27o6UISIpdTOzoDUhT2v0Xri/rN6N6Qp9B1kZzVw/C
         lIEW67NGu3vDE/U44soP29o7/+L13dvqx07zfKkOAmB2mAL7N2ql1+HFZA6L8owStPvr
         KpbLcQMjp3tShYAi8jAGItAmSdIkqBkOaXRyuxTxGkJ3vAUrA5JW1tg+hXAL0RBx7Cll
         06rg==
X-Gm-Message-State: AOJu0YxRhz56/Calw6N/hBwtFnDyVyuZF1SP4UTW9HV9hPD9zPiJJWZr
	oeFC7Eg6AP+Bs5ebytolBXsrpHCk9uH1/NeB81E5fvBSDTfBBoRzah+E3a8QEl3Bdyjgnj63ffV
	rQSM=
X-Gm-Gg: ASbGncus1ifuey0dWmcowEZy6YjYtbtQmoyDBxbiTuO6XNG2bV+M6Yh0jfLbAhII56i
	zRNpZMfeqbooNwL4S+PYbleLp6Aif8C7WBmy/R8+IXVTFOXlPbLONHW3Nl3CM4n59qSfN8/QWaZ
	SyVIL1ZGKyIrr9eeeblt7sY70cCZZBuzrE6G4TSoeMmqH3R5n+YVvU4A/rJi1yaEmnKXYAEjIX+
	uWot0aa96uV8SRf9J7Bkh6tJU6SVexk/LfR15lcefBhLEn9WeTOYykBk+1OpymDZv/RPzzW+jLI
	seXfCcCyvxirfAr/K4mCFSXdYqO99CdvhaoTvAMkmb6SecxfdcEo8GajNCigE2DmjerX8xCCJdf
	3l22C6uR15Kor1kLAUlp3x+tSW46C1mkt1BNY1GwBZUiZUOGr/RaypIE=
X-Google-Smtp-Source: AGHT+IHT4pSRUQXopEk6VzL5mqXo/Mdrl2/2LvJDgyTBKeF55XqOeD39Lp8oYL9BwOEmQNvJWqFtPw==
X-Received: by 2002:a05:620a:404f:b0:7e8:2038:7cdc with SMTP id af79cd13be357-7e87e05ffc3mr287257185a.38.1755269547290;
        Fri, 15 Aug 2025 07:52:27 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc1aa56sm10333851cf.7.2025.08.15.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:52:26 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:52:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>

On Fri, Aug 15, 2025 at 11:39:03AM +0300, ValdikSS wrote:
> On 14.08.2025 7:40 PM, Alan Stern wrote:
> > Either .pcap files or the usbmon text output for both of these tests
> > would be good.  But set the number of iterations to something very
> > small, like 10 or so.  No point posting a log containing thousands of
> > repetitions of the same information...
> 
> Here you are, check the attachment. It's a 30 times loop.
> 
> Also tried the speedtest.py on an old HP T510 thin client (x86, VIA chipset,
> UHCI), and the speeds are fine.
> 
> Avg delta: 0.990 ms
> Min: 0.870 ms
> Max: 1.984 ms
> 
> My guess it's OHCI to blame.

The OHCI pcap file shows that transfers take place at intervals of 2 ms, 
which is perhaps slower than expected.  (The EHCI transfers take place 
at intervals of 0.625 or 0.875 ms, which is reasonable.)

I think the reason the OHCI transfers need 2 ms rather than 1 ms is 
because of the way the driver unlinks empty Endpoint Descriptors.  Lines 
1165-1168 of drivers/usb/host/ohci-q.c do this:

	/* clean schedule:  unlink EDs that are no longer busy */
	if (list_empty(&ed->td_list)) {
		if (ed->state == ED_OPER)
			start_ed_unlink(ohci, ed);

As a result, each time a transfer finishes the ED is unlinked, and each 
time a new transfer starts the ED has to be linked again.  Presumably (I 
don't recall all the details about how OHCI works so this is just my 
guess) those steps each require 1 ms, accounting for the 2-ms time 
interval between transfers.

You could try deleting or commenting out the last two of those lines to 
see if it makes a difference.  (Note that this is not a permanent 
solution; without the call to start_ed_unlink(), the memory used by the 
ED will never be freed.  A better approach would be to unlink EDs after 
they have been idle for some minimum time rather than right away.)

Of course, what's going on when you try to print something may be 
different from this simple test.

Alan Stern

