Return-Path: <linux-usb+bounces-27789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B5B4AA58
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465921C27362
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436A931A572;
	Tue,  9 Sep 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPCgMfvF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07A23F424
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413223; cv=none; b=RZwdkMIByn3V7fq3GAU7I85Nb+sSYw1J54Jbg4l/MmBsJDhBDPCkv1tjb98zjBx1gnLT1i/rfTAtOd7adlGD3NtBwCpG4ljUQhxD/4omBmeXpIv4KbCNGYTtFqdL9U51btwLRke7bIzVr/O/lov3mIk/nmFNjyQNU3Bp2c+uKqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413223; c=relaxed/simple;
	bh=M4Jet3bV0HN//3LbW02lPXkEx/XvkUCe9BcOzTPYDnA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyNkbB85feV4pObYMDaiVkAqAvmoSC0wkZmoYHw3z2XgUoG54pbaFELTAsaV7sP8CcCbgl5xrOukeAdyUsdtTiyHM28hAbRBpC8h/sLGWDrgBj08Xqxl1G+nu+mnCVB64AnqjTJ1a6/5DMp0mDwPIjmDBaUSUBWiz4k87urmmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPCgMfvF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso21506251fa.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757413219; x=1758018019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlfrQ/fCPkmpvPm5Cz1FVdkqiV3ANol/LFF+HBqsJm0=;
        b=QPCgMfvFHyKZ7hsE2gpr+9vtqSq4vaYMexpLBoWTUTKZiuHqO0qlQwDSn4J1kHUF50
         8P9BWpmeTyvX81vy74hpf47YxgTs37M/sog8nJSo4lCs0wQMAOBuXDPv7A2ZntIZMSiH
         o0agRhWGwOjMbdFkUpZ/COKwhVE2BID3se+U55C0cEPt/f1ihU5Vn72XWwmbSXEdhw1Y
         Kl2AIrwGi6KS1WxtPCGLKOYtj7i5dfOt1DRt7qTnO2lCCTkSw17K1YTWKqrYfoV5fg/5
         yiUMhwmpqWZnYNxJjYmBBqCQ8XN5eSD+otrN8vlw1hhOzucOnfP4OBYx9P3W8Q7CZ9oq
         5U6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413219; x=1758018019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlfrQ/fCPkmpvPm5Cz1FVdkqiV3ANol/LFF+HBqsJm0=;
        b=DN9otWDf/z1kuDgZux7f6wGrWzIq/m6Or0D7HUW5kE4EnW2RtJCyN/0h0hHqi1xDjB
         1dUevuBO7UHvTiHsIBhcjwtvbweS6T4yzxxJxWHcctTAXyWxhOl6tA50Zl0WWAiBOHrN
         kOaR8a6yQQVoSGmBCFRW9cqfILqqBoOy6RvqHs9YszI4eZptZtUgmFc6vmupg4nwi6pm
         w7Ef554Isp6evX/n5pl3CppLkP5uXCeQnZIR+8rWvB7BdxhwWVyWAK55eyiUiQiO12+x
         lr6WgqEINDUFr00R6JCQuh7t0srf58M+YHukiK4kpdQ+EGBeOvlUgFfe6GOtuvWBWCB/
         UeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPcfI+IqdXAAAkJYMYIn7vLIlVteYO6Ok8niJndH8EWFubUsQ/0cx1SjQwi9XOwWGYBCL6ek/XZMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLELs1/tbafSoLfOFsBEGx7rFZ9/yVrjWeEbqz/Oj1sfA+c2r
	ybDn0U23SxiIR5PHP12RaoQzNsXpBqKNMDuflfHwvaQTcZJ9CV+kCcuR
X-Gm-Gg: ASbGncu0m0zUvQsO7WYax95wBsU2Dsd5RS0rmDHaFPd2koNqlZplPnwpUcH3LdSVoKK
	Vs3UtTry51e9NIzWIS3jQbLY3cNs6Y4tl5xzRoCKa+NKVCJmmvGJlvixBhgYrxgjoy4q59zZ9T0
	bfMxVLZsiR+UKKVKXXmOatNINvxA0bNW7seWXiEEWfprQzxSnk0DEZmZobbADhodct883nKL4mN
	cv+c72FcHjHuCFCpCJNHc79PrN5F2CEuqErvh/kg7DomlJpX/+xleCof3UooPOfpre2JQ90Hrqd
	rNEZoJiW+vSkWQkV+GLXNqstJWfWgGNNKCdYVq8X0OaXyhTN0w6RZN5ph1dcYYUFpRiWeAf3zVL
	Pk43qRE0HMMs8tS0Z04MRothMYW9ajK4SIyozrVQ/BK9Xn0iLF/UHmLNC
X-Google-Smtp-Source: AGHT+IFE6vo9BUHinRUyH9fkhUKDMPmLEE5oMHu3802+S13URnQvPK1sTst4242dmFcpHKZxY5qDBA==
X-Received: by 2002:a05:651c:b2c:b0:337:e29c:b0dd with SMTP id 38308e7fff4ca-33b5ff2b3fcmr34960051fa.41.1757413218962;
        Tue, 09 Sep 2025 03:20:18 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c905d6sm41009601fa.20.2025.09.09.03.20.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 03:20:18 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:20:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/7] usb: xhci: improve Command Ring Control register
 debugging
Message-ID: <20250909122015.4a35f2a9.michal.pecio@gmail.com>
In-Reply-To: <20250909111753.2fcd686b.michal.pecio@gmail.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-6-niklas.neronin@linux.intel.com>
	<20250909111753.2fcd686b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Sep 2025 11:17:53 +0200, Michal Pecio wrote:
> This function should probably not be called on a running ring (the
> spec says: writes to most field are ignored in this state). If there
> is concern that it may happen, but not enough concern to justify some
> xhci_err(), then maybe
> 
>     "... (ring%s running)", ..., RUNNING ? "" : " not");

Or just "Setting command ring blah blah (ring running %d)". My point is
not about the exact format, but about adding a small remark to existing
message rather than rewriting it and making it unclear what's happening
and why is this message printed at all.

