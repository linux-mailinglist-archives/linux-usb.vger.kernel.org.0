Return-Path: <linux-usb+bounces-23849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7BAB2A81
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 21:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D39A11896C10
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 19:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48531C84D9;
	Sun, 11 May 2025 19:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q721tcvl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73417555
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746991489; cv=none; b=YrvMKLHaOycn9MCqDbXgwYeicCjCypakOo65r42BdsAFNDC4G+nHAAVAgg6l8T8NjdQ4xizC4scqNNAzh14n8nL/LRUV447H0K0p+jO1siYqEuM/Rfgmr6b2u4ydWldHUPHVlpIbwHzIe7JrVZ/W1t4AjXK5AwX+v3s01AQNOLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746991489; c=relaxed/simple;
	bh=UyfJqeZWsKqUyogeyz3n71C3h/4l9Ni94gr54KCBBrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kip3SKRMuOgFeN66TqItqX3E2Pu5f9XjqfBt5uZ/Wwhn9AMaZAMrOy3De1WAdQZxTW6vahTyK0SmZFf6q4IZRUZ6A4dHMlcD5YDb0sCOvfgheMK51BitBqdyBHZ5EC1FZpgr0j4JLVdsybzk+1R+9Z5jR4j32ZDEuX9Q+Gs2z9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q721tcvl; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f549550d96so49763266d6.3
        for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746991485; x=1747596285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qqPRUGi23ZkUyPrvM//jVXfh2P+xt76dTbRfF47xM4s=;
        b=Q721tcvlTb+krOliaOyLSz8dNyJGqR2VqZ6RirV46lvBUEBfj/zUbRvFMSP0ekCDHS
         j42Rlx9gdFp7Ctk9I084DrgxzHY5HId6qf4LBYpA4MKtb1z8ZR6oK5PCTpQnlLIiQqN0
         VX+oSjRchKXjWZ3MMkCs81zO/il9AEVKYKfrqmfDuGsS5qZgCN4gHfMJ0LeL9eq8krsF
         BFyMBaGszV26QcRWGkZq3ZnAHLaZj6PO2L9gTO65ephRjNufjt9OYXIDMWaBuYdaNClZ
         0zRhZbkU1LtEXM5OJiuAbn1zixnVhIJWcA21P8QCsUiJilO8INexdF1qn1yFX/7eR8sz
         bL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746991485; x=1747596285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqPRUGi23ZkUyPrvM//jVXfh2P+xt76dTbRfF47xM4s=;
        b=vUaaD2O3u0IkWIxwQLrkPG17wfDEiExImsBmseu9Z00ZfEyqPSgis+rfO6pwxPmGmS
         H/pbPh6+Jgq3QQc5GfhEBJRbEDul4bWaJ1ml4sQQ9JNvIeFFATyyYy4pfTg6amYhbWWe
         pF7eE5WrpFXPDPmK4AoY5tb0NBmn6vQYUf2n4u2bGX9bgkf/68a4UJx+5/Prh8MFzZgJ
         Ti7h55VgrgdssaXs/1B/3qyzYZXmijpBdpU9vG+GnYB+hejlX+dabFZ2emYYcns6gfmg
         QCRzKJaBmLzFWRctuKthHt0ScjkOoH8MlPWXDtF/r6qu3Y48HyzK2ld6rkw17rSrar+Z
         ShtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZE7yIgUuOSLxr19jXTc72YdMpx74R3d/Tz9jgneKwKyW7iO88+7RME9hEF4fQcMe2+NuSf47dySg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DEXCPOb8iqh8vrKEO4WHgrkcNiOQm+94ZSk+5luiERccIwcH
	bJX14DcRvq9dtVu+QcfRYXfU+TShC4I/QrQnp4qCYQX7SVLfgjhtFuJ4+MEN7g==
X-Gm-Gg: ASbGncueI1B3Gd2nUsf9I1HRabQzYXENiLcF7MAUVwWvVqKWZlpzL02xYrZhPUEB9B5
	JnKdUdWi9DZH07UZFP+rSxHTtmJqtZafhunl1nCIVBF0HRawZAzHL9ir7gw31GfuQPG5LlqTNrg
	KjbnS0xM/Mc6BFYKK9oCJCMPl/UL8l33hwvB8F5cNLMcMrkvbPJ5Dif6acOKNht1k8SDogFZqy8
	Nf6FleJs4Jn/gvfDS7angGH4IkvnlNaJ7rzVYnMdcGp+L6rLIGBFkr9ZKZ+TlpqoRTlTa9kqrPw
	Ws8XoCqIHVV0SB2O55Yeg1qwyG0obUJ2EQOGGMrdLf7WoWlzJiEq
X-Google-Smtp-Source: AGHT+IEOGfwVqeNLuDwV8DmN+YdOHoPeaQTtS5HoeLSgiGlSAxbh9Ko6SzQjL5sbwNO69KXC7RnSGA==
X-Received: by 2002:a05:6214:1bc8:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f6e47977b7mr173948206d6.5.1746991485340;
        Sun, 11 May 2025 12:24:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3baf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4689sm40912116d6.28.2025.05.11.12.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 12:24:44 -0700 (PDT)
Date: Sun, 11 May 2025 15:24:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <5f7a69d7-87fc-436b-a3c9-b9d4fc1a5c17@rowland.harvard.edu>
References: <20250509114138.7052dd3b@foxbook>
 <65ac6458-1f64-406a-8ccc-0e516dc0c14e@rowland.harvard.edu>
 <20250511160457.7c8586a6@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511160457.7c8586a6@foxbook>

On Sun, May 11, 2025 at 04:04:57PM +0200, Michał Pecio wrote:
> On Sat, 10 May 2025 11:52:49 -0400, Alan Stern wrote:
> > > The case of disabled endpoints is clear: no URBs are allowed, the
> > > core is broken. It would be more productive to sanity-check core:
> > > detect and nuke lingering URBs in places like endpoint_disable(),
> > > drop_endpoint(), reset_device(), free_dev(). If Set Deq is already
> > > pending at the time, give back the URB and let the command fail.  
> > 
> > The core already does this for endpoint_disable.  If the others have 
> > problems, could you provide a tracebacks so we can see the pathways 
> > where the problem occurs?
> 
> I'm not aware of problems, this paragraph was hypothetical: if someone
> thinks that problems exist or should be monitored for, there are better
> places to do it than handle_cmd_set_deq().
> 
> Today I patched those HCD methods locally to check for pending URBs.
> Nothing caught so far, but I will leave this code running long term.
> 
> This was discussed before and you said that device reset should be OK.
> Users of hub_free_dev() also appear to be OK (they call things which
> call disable_endpoint() on EP0 or all EPs).
> 
> Mathias fixed usb_set_interface() a few years ago. Not sure if similar
> use of usb_hcd_alloc_bandwidth() in usb_set_configuration() is safe?

One of the first things that usb_set_configuration() does is to call 
usb_disable_device(), which calls usb_disable_device_endpoints(), which 
calls usb_disable_endpoint() for all but ep0, which calls 
usb_hcd_flush_endpoint().  This all happens before 
usb_hcd_alloc_bandwidth() is called.

Alan Stern

