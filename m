Return-Path: <linux-usb+bounces-31110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF3C9C2F6
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 17:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 492BF4E3583
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 16:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E613284684;
	Tue,  2 Dec 2025 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OQpXWE9k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B5279DC0
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692743; cv=none; b=OVR9EYUL+G9VWSS3Fdqj+l6omjISiF2ZM19ueJDOHnIpMqyz9kQiWCAiTw6eZRIhyORQvty8NIEhbFkLZA49sl7512+XeHHlPDjq4BMi1nf9yWuO92FdolEVaAtNxtSkv9FhPqfJGMFuD5G5iTr0N1jPjjO5Wa8i3811bFKwWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692743; c=relaxed/simple;
	bh=SsTcvI2ftfVEMiVeuXVd/UDaMG9+qaShNurQRWgp+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Orbp4ELLwnGGApafeKS6V5kYOlIWeb2f/B11oWiHWjlbsDnha0DdNNj+rFSMPhTzBl1kriNOyC6+QKUVMIxY/sle9jiWqguAHB++XL5fTERPiNstWgog+RAFc7/1CLJLgA6y+zF9VFkJq6MZEYIzBgIqkFVfxM4dsUlxefk0418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OQpXWE9k; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b25dd7ab33so354112985a.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764692741; x=1765297541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBj57ghe+PJFT6VjATTBMITvWtoAHsfjekQgLKphYjk=;
        b=OQpXWE9kLH1Bqfer7Mg8wwiDh9kvsd9k3gaww/XsnD2BjkIeErHAPJI/hu1eIMAWDV
         W+9s/MzHI2H2MrBGLEhquPv46skaqEn+sPhPpyo10Kp2jFKfWQXIAW4iBoFS1oJoBLbD
         39Q91g1aD8Jr7EnM3KGg2tkPpsQ7C/tFmqsRBj0GDkotNj4U4PYrEVL8ieBZlGIVSl/S
         0agFzi3nslAc4ncWci/WDub70B6lGDXyE+TN7TCrBnMMvZbM3cKzDeZmeXhV8HzZjOg8
         jatk4zHhW1BOJ5BjfUfVZZ5eqb5KjF87zB1ZE5hQ4EWZS9R1nTyNJmu4/lyD0KcLz9+S
         n/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692741; x=1765297541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBj57ghe+PJFT6VjATTBMITvWtoAHsfjekQgLKphYjk=;
        b=NV0wJRkpbXfx4j3g7M7juLTKFJPVpSF6j/bW8f9Wk4EHVsL0bWsokKo1NFmYq7Fv4h
         sHQPXT1lj2OjaBkEyHKL09Yc8zRZs2H3lOlHn8rAe7/S8NzN+Sw52h70q5Et0JFi8ZWL
         clOyvkGATozFA8zIHh5Of8aGNQSdRermqVkHzo9YCc83kTSMhIDXQXB3C8sRzd8sEyS+
         LSNUuY4WWXiLbwc/0R4BMRzUv88XUV6N+o1/6fxOllvHMqsDzEdtUbms/eGfNevQXBUu
         trSe+6lTWi1VRhk4qzOSxX5WCEyXX1qtBs3l224wn/W8wJ7HkZAE+vI1uikC219xnm9Y
         S/vA==
X-Forwarded-Encrypted: i=1; AJvYcCVRzakXPiLQAteYo3uu2l5MVlKj09GCXL/hEJrHBWS6jzMF/gj8gJItezQrZc2IZVRFlbZS+AEjrBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2ASVTmnWydeXYRPSBpkHNeLFpTKzx2PWKvdbWGmlAfZ0tdlr
	cLOuVMEqgDb9xB6YRqT5f5QyhahwravAUXIoLMR9RThPmRqoKmIZhAGdKgCZ/Cy7NcepOJgz1lG
	+cHlahA==
X-Gm-Gg: ASbGncsGTlKFioh3Hh26HiTPjR+wbPE6D1MuV5t8ETa9bEiDTfK2WsRdIXlSkhkHkCs
	lHsMSt20Gvjx/mkOz3bC0sX/eMY8fkof4AK5rmNGCEsCGiulTz+sXUGqxSyhmuZS6TETvPHLhfG
	e96V+SLyzQhVfRwYQT5qLkLb1GouaJbBRUe7ZuPkToW/YedMelFejVkWgD8nbUzvVX2GdJBT60S
	jcageTFgCEsMZFWBhCrGXj5iMWgTtru7cdQBBG8VjAt4yUugZ8DlfpBz21t8pg8w4jovWSHZHJ5
	5Qvghibyg9eOviBVqMcbuQm7jKtHT/N0m3i5xSeiwdgufR4nnDtZ1kEBaIsCIJfR3ee4+oJrBcT
	DJyRB49mSiX4sFSAQdTu0gjl3Gjeh1Igyy9qOu2C7sydTS4aWDXvScMdJRsnt8Ta9vr/U3bmVu9
	S5hZtIlvr6cue9
X-Google-Smtp-Source: AGHT+IE8uZcA/qmcSxztagR4ijnZh4IG3xwIGZM44aUyEvBDO5ipaQ2QJcVwhTCmJn97srBRWAshgg==
X-Received: by 2002:a05:620a:bc1:b0:8b2:e069:6912 with SMTP id af79cd13be357-8b4ebd9ebf7mr3932347485a.50.1764692740318;
        Tue, 02 Dec 2025 08:25:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1ddd36sm1094300685a.51.2025.12.02.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:25:39 -0800 (PST)
Date: Tue, 2 Dec 2025 11:25:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Angelo Dureghello <angelo@kernel-space.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <5daaa7f3-7c51-4f72-b6e9-cf4f015f758b@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
 <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
 <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>

On Tue, Dec 02, 2025 at 04:23:13AM +0000, Thinh Nguyen wrote:
> On Mon, Dec 01, 2025, Alan Stern wrote:
> > Are we talking about the same thing?  Clear-Feature is different from 
> > Get-Interface-Status.
> > 
> 
> Ah... I just saw the subject line testusb -EPIPE and assumed that it's
> related to ClearFeature(halt_ep)..
> 
> The Get-Interface-Status should be hand-off and handled by gzero right?
> The gadget driver knows about the status of the interface, not UDC
> driver.

For USB-2 devices, Get-Interface-Status is always supposed to return two 
bytes of 0.  For USB-3 devices, it returns information about Function 
Remote Wakeup and Function Remote Wakeup Capable, which is handled 
already by the composite core.

So for SuperSpeed and above, the request should be delegated.  For high 
speed and below, it could be done either way.  (dummy-hcd makes the 
opposite mistake; it always returns zeros for Get-Interface-Status and 
never delegates.)

If you think it's best always to delegate the request then composite.c 
needs to be changed; it should handle the reply for non-SuperSpeed 
connections.  A simple change; I can do it.  What do you prefer?

Alan Stern

