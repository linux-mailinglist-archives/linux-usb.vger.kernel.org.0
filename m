Return-Path: <linux-usb+bounces-22653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B517A7E5FA
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 18:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEADD188BA1A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 16:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77982066EA;
	Mon,  7 Apr 2025 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mYnDhU3D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982082063E1
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042297; cv=none; b=SopWyV3wBPnSQjGz5c10CifF2lHWkKaAfv3xJR7x4r88sAY2Vp1gQ8awY5macIT8IKDaZAEyj7U/I2PjCihhI7mds5dlfPqNjbvphBrrcywDF97Z42/dDsZD3AhDzGDDrlAA9ezF1X2vgDOYw8I4w201VmQUrMKZw/c/F4azuUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042297; c=relaxed/simple;
	bh=KsEVGnKj/ZyTEWL4B7MD7vW31lMYLs6SHQSHn99IlbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXeU3SuHaIdh8OhvWl2EfChLEVWEy4XfaXWfMzeAKVx357fviICBPIiB3qYRLC1dXuxATwHx01DVkUUjdQ47S7wkXSCIGrMEI5eiiIbrjzdQJ0Ggb4Oapf6EwbDSXmUu3Xbw0ZO5Q7cIveXOmP+VKh4khaNb9u00FL7Ypzb8ZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mYnDhU3D; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60288fd4169so2339836eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744042294; x=1744647094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXnl4aWwI+gQDZ+ekrtdQrNLGHmA4HgqPoIupV2xsTw=;
        b=mYnDhU3DWA8oM1S9IbIwiq172/sJD5Z7UBgxzomgiHngUsNQK6Pm/auV08yw7AqsBh
         xDRusZZnbIcGLSsiNYhov+V9cfDK6FkGvAYnYgg+lSUkRGHUHiNGuJcGScc0ZUVPaeIP
         x1YBj1E80XQJ2xrJd2Vi2ejBt53dn+TpzMsnEuldPX+8//l1K2e2eBoKFWmRMm3cETVg
         gYP2RzoGx5GcmkT8PLW6i4ZIcXJPZVTEHLvmKps9EHNP1v4Nf0KvXH0y5Pe8W4eIl/Tw
         hx1W6fzr0mO349cl4MCFcWRgJw8XeoA2+sWmQlhoBdvA/Ary55uOBmuj8ju0jlcGK2lK
         Cm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042294; x=1744647094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXnl4aWwI+gQDZ+ekrtdQrNLGHmA4HgqPoIupV2xsTw=;
        b=j/NmLFfuZhaGLoEjBbHEG7saB2X9XIUm4RiIsuG0qgYNGUrKUgSRo35kX/Xc/h6n7f
         LDjjk3lSIyDx6LslKdBDtJiek0PQEpUaQQuq+Z9xanLzgfkV7oGYRDxqXhZcQs1VJywA
         a2hUbnnOHu6KUIpTC2FSihYXam8daJxzNQhM0EvXBxDq2TUOJ+AJI7KxRqIiKoYbRPfE
         3uEyeKdW5AGmFpFHeDTLed3K+XsATYwNIurYxT3O+hBysNJ/w79zu0TfqQfntlhZfPo3
         htU6+6WMsW28sJCRAVcpIr0PZ6kTNwVWxfBtrIRqqjNjDDqPzSozkVrgTzkT2rbpmKLI
         OxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ7l2ocuOL+0qgn+50APS4wC7CtbH6n0m4TlyMQ20rgluNaSg+6tyWReiBWEoZEa6TvWEvDIBkM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0oRg+vK9JsrYdi6//hzXAEgdWaCVFrpdZ/OK4J8nldLxDBbTk
	e8A1KkUbl3nTEbeDcJpz4yS0eQNaUm1bLSUbr+u0+Ig5Sfj/XVNXAzgqbzy9UA==
X-Gm-Gg: ASbGncuWs/EW528tLGUZcSHYdZXBgT29r8y8scYd1xzvx8xmlkLx053HeDnP8Z/of3X
	1pL4gQhkgd7P1xN4afVppL5uwu/KmtIfPftMTasBgN4CIjr0xec5xspylSOydIai+h7G1EjvCUm
	f8bgOrSKVkKgEUrCJfL2um/zPcnrwehZvqtn2s2jgQXLNwwU5tgHZ9SANO0kXJ7POCEqGdWVGS+
	pCFQN2Q1Nrd0Mzby47xzgmPe552Yze34gyb6y46kvvE0x1S5Dw5lLuoV0+CdjCBSuEvJ+YtnLpt
	aL43aFGRybYeXZg/yslLdzHc8CSlPF8nk+vATqsQzRee3bLgklYJUzrJyS4s
X-Google-Smtp-Source: AGHT+IH0qPZB6EY8Bou7VhukIEhOImDstOm21SEVFOUQ2wnTC9y+fjZ2IdwbjWiLzgW3nK17LwAB4A==
X-Received: by 2002:a05:6808:3a0a:b0:3f6:684f:2f17 with SMTP id 5614622812f47-40045630365mr9869082b6e.30.1744042294576;
        Mon, 07 Apr 2025 09:11:34 -0700 (PDT)
Received: from rowland.harvard.edu ([12.111.7.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4003ff9adb6sm1770193b6e.27.2025.04.07.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:11:33 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:11:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
Message-ID: <3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
 <20250406095008.0dbfd586@foxbook>
 <20250406175032.12b7d284@foxbook>
 <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
 <20250407074905.2d236fb9@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407074905.2d236fb9@foxbook>

On Mon, Apr 07, 2025 at 07:49:05AM +0200, Michał Pecio wrote:
> On Sun, 6 Apr 2025 15:26:41 -0400, Alan Stern wrote:
> > I'd guess that you're seeing the result of the
> > 
> > 		usb_disable_interface(udev, intf, true);
> > 
> > call in usb_reset_and_verify_device().  This call is made following
> > the actual reset, as part of the procedure for putting everything
> > back to the way it was before the reset.
> 
> Your guess is right. I added dump_stack() to those calls.
> 
> The bug is triggered by this function calling usb_disable_interface()
> and usb_enable_interface() after usb_hcd_alloc_bandwidth().
> 
> These two issue endpoint_disable() and endpoint_reset() to the HCD and
> xhci_hcd appears to be confused about the intent of the former, because
> it clears host_ep->hcpriv, breaking all future endpoint_reset() calls.
> 
> Since 6.15, this call informs xhci_hcd that device endpoint has been
> cleared and pending URBs can be started, so this isn't working now.
> 
> 
> BTW, that's not a corner of the driver which I'm very familiar with,
> but AFAIU this disable/enable sequence is pointless for xHCI if done
> on freshly created endpoints. It would only wait for clearing TT to
> finish (there should be none) and issue some commands to clear the
> toggle/sequence state (which should be blank).

It looks like the purpose of the calls to usb_disable_interface() and 
usb_enable_interface() in usb_reset_device() is to update the data 
structures in the core and to notify HC drivers that ignore the 
reset_device callback.

The fact is, there are lots of operations carried out by the core which 
can affect the HC drivers, and I don't think anybody has audited the 
callbacks used to communicate between the two.  I don't even know offhand 
if any HC drivers besides xhci-hcd uses these callbacks.

It would be a good idea to check whether this stuff should be updated and 
improved.

Alan Stern

