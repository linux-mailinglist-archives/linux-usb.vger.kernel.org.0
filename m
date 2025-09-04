Return-Path: <linux-usb+bounces-27531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52201B42FC1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 04:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 049A75E53C8
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 02:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02181C5F13;
	Thu,  4 Sep 2025 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M5KeDl8O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505C17BA6
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756953126; cv=none; b=Z5Qw4rMQd0zaCr1QcMk6gcXg5eVq9ejV66/wQzMQHGwWmEU6faRVVB2YOoZejYI6nFfAY6s1urvFT3U2VsX5HvNssyoO/QPoigFbeg8zAfNKxgJSXgoyczVsygT2/CkzfleqIH1qywk9zhymXZVjcNkYf9tKFHIVbbprLjQ2sAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756953126; c=relaxed/simple;
	bh=htuU5+NuVKChl4GPxDbo2Lo92+SW/HaQGQcpZ9akDME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3y9cCI+4WIgJh6xvcSrgAe1y4InmjVsRYBDdywWlUcuGvfrbXxMhfOrEUZ3r2J5m4WzRWYyqAy6bq/cKsIcOVLX8fJWYF6GfqZ6t2H2k3PVyb2MTqSinSPg6C9Ug0ZhnC6b8dC0zmhg9pbt0P2P8hH7THVyMbI2Sz6UtY/wlBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M5KeDl8O; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b2fa418ef3so5940061cf.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756953123; x=1757557923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbjTpMAPEbAf1Br5ZNIXzpEOFgMILtG/nyvDoq5Mcl0=;
        b=M5KeDl8OLSYrsrlRreE87GIiAf5YqSY04ApPZGRxtqBP7uWbKvjgjOFa1Na9KyjqQ/
         cJkMo31UltsjMor+Hs9Kn4ZSJ4WnqKKDWBeILloQZigM2+cjsLHv8YtQxik6VquAdnv+
         LcOrTLfn0tZxK/AKNPEFXVyVIWatho4nEFidhco5CHZPh3YgJagwHlIUB5RJ4jHikhbh
         2KvKHup95pekAZ6abgN6m7OjL+b/bljehW3O8CsUCM+wX6Leqjv8rhDQ4momoTQ9imiy
         nk9GH/U3tjJWpZGsHtY2Qe4Q2ggZVP+rcN2VCOjGncizLcPr43tsyJzIUO6M54LL0r0f
         OZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756953123; x=1757557923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbjTpMAPEbAf1Br5ZNIXzpEOFgMILtG/nyvDoq5Mcl0=;
        b=i2mOxlFH+K5vEv4dVxbduprHlJt9O0dwjSRAoM/oxdLK0jQGHOPXMTCLZjqCbHGKxL
         fL4VUKBq/sD113QEeBdrhwgSkZqXJb1heENGNuckUX9WcT7wdYE4ZD7SUyWp+q4VTjfs
         5d/eHtXcPARo3XgXVifNmheXmmfzWVATcfkFAZqNMsfn6fvtMqTWUzIJyRAMxUnC/lFb
         A7JmCTFeaXz7YfK/5q/0yVuL5iwHmlUnMma44ZDHH58hHbMLUA4yS4mbjU3D+1eQH3WK
         BCMqyhmPrr2b0ty0veHrJ9tKnFHGX20iHUxmmELI+Kz7n3kHiTet2X/yenf1v1g1U4zB
         PNQw==
X-Gm-Message-State: AOJu0YyXOKduwsJgBm00X+tAWFHBKSG7MScw73GiJMkdeNHvp8e9s6gg
	aSLG3e3KiwgTR5j56IUCefgTrVTmJzT1RGwIjcJVIS4dEvdmIPvHdhB/2jS6sLOYNje055KAf/D
	KWpM=
X-Gm-Gg: ASbGncsM2hBKx6y7k6KRLfp9xQtfJWmd7zVGOU9oAxHPklgCUpa5D11lyIK4M1Si06p
	K2UCZBUyn4gE9FZZ75pH3BCpGnQoZmkjZKLdLsg0oa1GwaLfDIhbVoTnDLgw8S+7Dk24ldVlFTN
	Wof04/rPTpVBzYhc/v0yWaF9e+khZiYY8GeqlRiJ7MsIz/yu1zR+6GzFxPoi9r82Sl7hZE60uAO
	reHnCfy+fh9vrN8DZ/Je6HqCdMOZdnuI/v/v0j5y/uMZoIKE4P5DzHUZV4DqUceDulkH9h3Q8Ii
	IxywrNK6XT5S+EEdWo5lO9D6nRd7ukBGGkpNk6zOvmL+q+keEYrlFns6zKi+PprA+2zI1NzVS9j
	fssDSmMATyNn+zfyRtg/ZqE0QM1Zlew==
X-Google-Smtp-Source: AGHT+IFtc5bgn+GQjA10tdlWpfgMBnhLlP9rJYAxMlAQwxgNI5Mi8xR5DfiPObsf1clwzGJcTzFjjw==
X-Received: by 2002:a05:622a:1214:b0:4b3:10f0:15cb with SMTP id d75a77b69052e-4b31da3fe45mr217168511cf.38.1756953123571;
        Wed, 03 Sep 2025 19:32:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f799b83sm21558631cf.45.2025.09.03.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:32:02 -0700 (PDT)
Date: Wed, 3 Sep 2025 22:31:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: Reasonable limits on transfer length for usb_ep_queue
Message-ID: <08127d96-5d17-491e-93b1-42aef891ab11@rowland.harvard.edu>
References: <CA+fCnZfnyjTCByBB7nsW0kb7CTABaq_-u5-qtv9UWV3Rrg_khw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZfnyjTCByBB7nsW0kb7CTABaq_-u5-qtv9UWV3Rrg_khw@mail.gmail.com>

On Thu, Sep 04, 2025 at 12:56:47AM +0200, Andrey Konovalov wrote:
> Hi Alan,
> 
> I have a question about enforcing limits on the length of USB
> transfers on the Raw Gadget side.
> 
> Currently, Raw Gadget limits the transfer length (usb_request->len) to
> PAGE_SIZE for both control and non-control transfers.
> 
> This proves to be not enough, at least for control transfers: the full
> configuration descriptors for some USB devices are larger, and thus
> sending them as a response to a USB_REQ_GET_DESCRIPTOR/USB_DT_CONFIG
> request is impossible. And I assume there might be need to support
> larger non-control transfers as well.
> 
> I see that GadgetFS limits the total size of USB descriptors to 4 *
> PAGE_SIZE. And there appears to be no limit on the non-control
> transfer length.
> 
> Is 4 * PAGE_SIZE a reasonable limit that makes sense to replicate in
> Raw Gadget for control transfers?
> 
> And for non-control transfers, does it make sense to enforce any limit
> at all in Raw Gadget?
> 
> Assuming that we want to allow Raw Gadget to be as flexible as
> possible but without breaking/crashing the gadget subsystem.

As far as I'm aware, there's no theoretical reason to limit the length 
of any USB transfers, other than the fact that wLength is 16 bits.

There is a practical reason, however: Some host controller drivers 
(ohci-hcd for example) can't handle control transfers that are longer 
than 8 KB or possibly 4 KB.  On the other hand, I'm not aware of any 
such limits for the high-speed or SuperSpeed host controller drivers.

Alan Stern

