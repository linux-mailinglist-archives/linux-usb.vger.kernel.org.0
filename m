Return-Path: <linux-usb+bounces-21098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3BBA46790
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 18:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DEA4440B25
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 17:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7876F22371F;
	Wed, 26 Feb 2025 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ewGg9k3z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E021CA1B
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589330; cv=none; b=ZBwsGbZRzhjhs5t9g09GeLZueMkjbSm1fEXM4AwCfNocAJBI4Zo7Hqm3gPVwxDnoNrmgRVmX5pxq4R96gSFEuNoqFwOpeEMOEtttmOM1eyAnRLHqFUlkNbGOZUkN1ro3Qpd0WYFMIyJz49wYGrcwr1r8fb+Gu4OmIpjyYdfjXGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589330; c=relaxed/simple;
	bh=e5NiXp9FYAQo8RmgI6NQ6gPt2AVfMiz6r0xfJUYuKrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMQFF9Er8TlqFDiq0E5LGuJUWZMbXoULegZN3SDs08D5Eo9fC92yqdmM8Sml2FuMYZGhqiLDvzC7HDWUuvpexlWjiLta1FO5WLFqWGPjwR/y+DTo81kizZJzi1ZtY2ppWXt8a9OMFoVcR7lV1ew3UJqpzH0u5jYjvXLwTAxQZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ewGg9k3z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c0a3d6a6e4so631485a.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 09:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740589326; x=1741194126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gDpJWiIqmqRiAR05CBdJHy9M1E970vBLzOxyspapRA=;
        b=ewGg9k3z5si26WBJQSk2PhTrDtlkW4iM0Ye+lFWaKhfbAFyfQ+Nd0FdVkOOQP3QU0i
         36560fSkSvDlCZs9aLLAKiZkPCO95S7CLE45qui7e+LwnSXiaP9si7Ha2wWzbeUEqZv3
         4sDCec61zt9v9MUQT2N3hlmbbPJzJDblDCzl9V1xwv70zDHzDpgz58quD3+LC1aETmcU
         dY+bGCMAHCtPOl6krW3/0i8ni+pf4InMqjIbb9vTasQcFArOJLsKrYoS+eW3lawHrTRW
         TsQSN4GSE6F6tU2DxR4YV9MQdPgc4Jlblvp+W3NEb+A072KEckBEmEgfdsdYBfGbDO/d
         3E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740589326; x=1741194126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gDpJWiIqmqRiAR05CBdJHy9M1E970vBLzOxyspapRA=;
        b=ZkMPMGF3v9hhXaMepM1kXGQ2rvw3rU3deGn+JHSJutN0PCJlkwUAmqv+6VMic6G3hb
         JW2/C3hRCIE6TvTBPSINQvfHn0u2NTX60gXzXGF3OO3UiKVRDuB+b/XhpjyU8YPBbx9d
         7NIFottg3ffypNI25LER7ZivXlcEbQyfsrvZyK6/Y0hdzV7pPOt+FJBo6HReKU2LqUgC
         yRpWQeod33Nk2vUrFqg5WXY/8z5nLndYexIt02knKC0UQIvI8fvm5YRIGU6sL3SfWxPv
         hnFP7eqchiu7y0gmlDH408Wta3WqInMuawxSFo4+TRJzMAT+NL9syhniJPdMZzkLXtlh
         iyvg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDM9UTXeKzB/NaOPTMMNHOQZuY7LPSG8qOr68rGWwsjtuPJLz7RbOE1labWMos3WbNI+aTpBk1JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpTbwMcfhG4MXQ5svTkGn6w565F+TBB1w1FXiclHebUU14DP8G
	QaLlQ7shyeIvYEfq7/0IVVaDh0ZfFBXSLv56ZhiP4HtrjV+XQg1tvjEn4Kmoa7aNWCLVdsz13Nk
	=
X-Gm-Gg: ASbGnctLzbXR5NlpgN1WdiRWVLmY270lpOARqni33L6Nx+tPYX6JY8fBlF7aB+IM/Lt
	d/g0afG0woOXmn3M1wl8IMObl+3i/DKI0U//annQJBgZ1HP2ToeQKc53fUA75vep7u2UK6EW5nl
	xeM3G9ndXFaQvRkyCogxXp1mGh9A8grLfzKZb9SB4XJ3xdwKQg1SKje8F2bRbcksdWsmCLnV888
	8mJhqOWRes21yIWS6kWVG1VeFripkWHdoHl1e79DYUJ4NSTl65F3N3aI9S8JjTKHc9hsIRr/pwY
	hZIuG7FDQYRhzcnc3mn5JV+Kj1A4qQdSFGjqDzRrydNKcsNLeDnaDQXqaUGqk6z5wQFaGYcd1/G
	M2R5bSLq3UNuw4CKTTzM=
X-Google-Smtp-Source: AGHT+IGV/gWuJnQclFU8ZteMOSQCELX/mpo4Tyj2Sn/PZ7XKzflnRkNxcemJufnJWgcG73GfCcYYUQ==
X-Received: by 2002:a05:620a:1b8f:b0:7c0:b368:5d8b with SMTP id af79cd13be357-7c0ceee5f8fmr2639224985a.11.1740589326574;
        Wed, 26 Feb 2025 09:02:06 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c34f633sm269044585a.117.2025.02.26.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:02:05 -0800 (PST)
Date: Wed, 26 Feb 2025 12:02:02 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: j.ne@posteo.net
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] usb: storage: Mark various arrays as const
Message-ID: <ea5c2735-cfb3-4e5f-a7f9-40d4493bd05a@rowland.harvard.edu>
References: <20250226-misc-const-v2-0-ab655a4a29cc@posteo.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-misc-const-v2-0-ab655a4a29cc@posteo.net>

On Wed, Feb 26, 2025 at 03:17:22PM +0100, 'Jonathan Neuschäfer via B4 Relay' via USB Mass Storage on Linux wrote:
> While reading code, I noticed that some arrays in USB mass storage
> drivers are declared static but not const, even though they are not
> modified. This patchset marks them const.
> 
> All patches were compile-tested.
> 
> Signed-off-by: Jonathan Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Add new patches 2-9
> - Use consistent authorship information
> - Link to v1: https://lore.kernel.org/r/20250225-misc-const-v1-1-121ff3b86437@posteo.net

The patches themselves look good, but I still think you should explain 
in the patch descriptions why declaring these arrays const is worth 
doing.

Merely saying _what_ you are doing isn't good enough.  We can tell what 
a patch does just by reading it.  What we can't always tell is _why_ you 
would want to do it.  That is what needs to be explained.

The explanation doesn't have to be terribly long or detailed, but you 
should not omit it entirely.

Alan Stern

