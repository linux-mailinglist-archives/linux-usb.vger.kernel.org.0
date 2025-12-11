Return-Path: <linux-usb+bounces-31392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F3CB6475
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 16:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7895A3034A15
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE32C2D4806;
	Thu, 11 Dec 2025 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CKABnsK5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E05661
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765465609; cv=none; b=WofYqfXNtPuucwpSWmVoEHPydfOugikAXqwXGbW1YbEDuvS0W/SstGJZrKaxeMcjl2hsQwEbMXA3e2Qeq/QN27SZ7tP3wVKz8jGZHBJJr9BmrTKVnJTIw7Tak4yIMmHo1BoCuJI8u9pthl18Pz+T7Eb4w6uQuQe/jpq5lkP62Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765465609; c=relaxed/simple;
	bh=qW+dfojklo87IwT5LaulZuPp7ro1SvukJ6EYdTEWKMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5/eNjvHOtn/MNSDTNBlIUE4JBitzu7hZXwwyc6wLIqG/mVQXhzecEHr3t6OKINtfCNKZhxTWC3TjYJoBvp20EnDMJ2gQE+FHtHPx5WG1H6NVLrAJvswByHqkBp+jjeWrRbqnnizXoUX3Cz8friYPBWavN7NL6GQ8Aw8g+Jtxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CKABnsK5; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee2293e6a2so1572931cf.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 07:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1765465605; x=1766070405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBflxgkEAHd+rF/cyf6AoCMkw3p/8vVQ4rb6Su5Ly4I=;
        b=CKABnsK51Yn4Bh2HAfTnwEVRbD3udJav4SFAXTq6pt484fIKLneBYBB0IdDUlnId5J
         3VnK7GfqtPRH//GrNLOtQLw3+eW0C4+zNdbYu4Z1ESQ/N4Wsjfmd1HsPROGZpebjiRPh
         dbmWct1C1GKqUToYJSJzG5TOY3agq7h4AbtmJOJ28ZN49XD8LuMEps2vdJJW6g1rPy6G
         x12rLexlCUGdbDeX7STOayuEDSqjJL4O+mf2Oay+Kgjp4stS45cGA5e7ZMo/0GMOhJ8S
         kSNuIPQkjP425vsU6BNxb5+RATEvcFvZm7lYxBZXWOWBSuCePp8UMIhq1bpw+VVhvnEJ
         3EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465605; x=1766070405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBflxgkEAHd+rF/cyf6AoCMkw3p/8vVQ4rb6Su5Ly4I=;
        b=roFfyDiP/OdnTCa8A9DI40bPrhvmrqr036+xEz5OpsteW/JCtsszllOYcI9sZKwj99
         h/tidKLaGhut7du26S7lH+ROEjFTApSwpRNNvg2K8u/5DBH8RIXKN22nxFI6WEx/huWF
         6VB4VP5PaEH3xdDEf0/Hfa1+HxvkVeWFmOIg26AJ+/ELk5hTys0yvlBILuqN0Xc8Z3qv
         TnBevNB1G/r1Apje1WQHrp4PoL8//HCN/QY4lRpW727PaxdetccUJI5q+FNG4D3oCPsn
         RsMVLKvk8Kp9gfF15a/uIy0GZ/5oZsWRv5l4ceL2PSzY1ErmsbmYVaIhKnKr8cdkUJmY
         ZFnQ==
X-Gm-Message-State: AOJu0YyMwfwkI+SbGb+j/REK0RlwP7bv/PCgDndEQJpkCX3uk6CS9FjM
	+nQUuXP14ItmmqIX+AWR0/VsZlKDzMf+BpknsTUaKzdkmni7egZl2P5X/LP+7x9ZX4+3iMIBd6l
	HNecRpA==
X-Gm-Gg: AY/fxX5v3QCftG494aR5vbp+RSjSu9LK1dZUHs+wsT4i0Cseely7KI+WGatUwj+4Fcf
	I2xSssVndZu61CaDME1q5yeuEgLmK55TBrG0OZdgx5t6XlZZynQ72OWlOCsaiH+Nz/Jd2rz7v7d
	Fhs1wQL4SU7zyX3RGoxZbR8d0FHGo4rHgEQFfj7F6vgMUWGBIfla1VlQPknWC6Q7CMlkjuDLkVN
	z3DqW58xo+FhcGWLTZoJtOWPwNNqq388aw0EZsBKbGU4Arseodx8nVhSi8rFUmGtZztfTJalb1e
	kvYU74G+pGpOp51+gfdlQJZb9cXQ03NiHksG6Kr0ca3gS5BDEu5VYuFvhfVNu4Nb3/q1rlleJb+
	NiGXhsN43qIE3U8A4Z1jqyy82/qlit61hO+8SnQjVdCXVIo2mMJ0hnMSxLFr9Al5+gxN7yKbqAI
	lmURW6btDqSdcAVCfejmLrq14SqhPiNQ==
X-Google-Smtp-Source: AGHT+IFeEt+6YG3npXSf+KRGN4HKEszxcEJu8wHrO1ZP6jUuHpgoUak0Ppv5tsrOGNPhss11hfTqBw==
X-Received: by 2002:ac8:5805:0:b0:4ee:22d6:1cff with SMTP id d75a77b69052e-4f1b1a12aaamr79470861cf.36.1765465604988;
        Thu, 11 Dec 2025 07:06:44 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1cacb3900sm1470331cf.6.2025.12.11.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:44 -0800 (PST)
Date: Thu, 11 Dec 2025 10:06:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: storage: Ignore driver CD interface of SR9700 USB
 Ethernet adapters
Message-ID: <576ae551-0ed4-4363-b19a-8c4d1692e1ad@rowland.harvard.edu>
References: <20251211062144.138796-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211062144.138796-1-enelsonmoore@gmail.com>

On Wed, Dec 10, 2025 at 10:21:44PM -0800, Ethan Nelson-Moore wrote:
> Some SR9700 devices have an SPI flash chip containing a virtual driver
> CD, in which case they appear as a device with two interfaces and
> product ID 0x9702. Interface 0 is the driver CD and interface 1 is the
> Ethernet device. A separate patch to the sr9700 driver will add
> support for these devices.

This just a statement of fact; it doesn't explain anything.  For 
example, it doesn't explain what the patch does, and most importantly, 
it doesn't explain _why_ the patch does it.

In particular, is there any real reason for ignoring the CD interface?  
What's wrong with letting it bind to the usb-storage driver and be 
available to the user as a virtual CD?

Alan Stern

