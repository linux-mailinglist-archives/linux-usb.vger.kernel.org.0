Return-Path: <linux-usb+bounces-27790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7665B4AA7B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F7A17AB5FE
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68EE2D480E;
	Tue,  9 Sep 2025 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebLeMhPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B02C0F60
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413477; cv=none; b=YNjETe1aNulbcqIe/rrDdXtGhWyvsN0WcHnaeYpg8dpQ12+GRxx5f8+nBoe35N0fwBc0T07Xx+giQ3hrg60vaBXG+gXszbXsjatLsDJ5CxeUxfQne4QHWZz1tGnlu8BjKIuyeezvngS/O93El0953oZ/iLirde34tvq+wOX7glk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413477; c=relaxed/simple;
	bh=pA9O/1TEZiqVEmRFY+M+6nhqiYbJtoPI4Ud46NNOb3k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAIYlLbVjx6Qzu5hZKj9DEYiN+B/2iDLW3Sdk55lU5qEWOGkqp1uL4g/gqfq5qY43rnzTJolduXeCTVE7bkXDY7Aro59Rv1yd/bcyry0aEt+o8XQnOez6fReS8hePwtEugfUFAjQN9+NkLSW5Ot50m37CSQrcqmL1qt7l148sug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebLeMhPP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336c86796c0so43338791fa.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757413474; x=1758018274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA9O/1TEZiqVEmRFY+M+6nhqiYbJtoPI4Ud46NNOb3k=;
        b=ebLeMhPPb/U+8BF5pshIZdu7Tr+SIP5hP1LCw+Cf++HXMFRht6pKIzp8SJCHjX5vnt
         P+qgpzKqDEEX2EquaGdxipxJUjnk+nNbSLD9UBtnBLoxEXBGg48t1Zh6XhpdDr8S9+Ys
         hbDbrm7+ZVDPGSpG8zbezWcNjsbEqAl7UhRbVgdkXgEJtOJQnSCobgGslaujd0Bco0AN
         qsbSVGw5uDvwIgOgugDgiChy0jvrnWGYuga2Cip1WVZ2WoSokqVMqIAkNo2X2bVSiMxZ
         a8sSgRc16czRdzPwWO8BekNTtdntR9AySrsRjdNLaeGTswU4/mxilGF4dpKXqDNvYDzX
         /hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413474; x=1758018274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA9O/1TEZiqVEmRFY+M+6nhqiYbJtoPI4Ud46NNOb3k=;
        b=gxO2a46vDBBO+tvK0Ck4NY6u9VeHOie4wZAC6cOw5Q6CpdxYnBft2PUktbzXdsWI4G
         Tjy4MUAHveBBVL3XQ1VN9pOSsPhR6IaayWgwIqyYQUDxqpfXw0jIJoGUQ2bxbJc3pP6X
         nie4LWc36PdwBKQgEnHEWWBjwkaDULAyKV/gqV2+sOQY2GTL0aaCC8Wy0hIu2Ta3GS4F
         o5rz3q3a6tYaL9hNlDQVZw7Y4p1AeHg/GXo10MaMtcPVvMHRVbyx6GBWzBCp85Az9c5T
         +FUl81pZOeQ5A4pidvdJDpOWTSoRe3JlKprKenqEkQ56XSBe1X9RCPKl1Q0CRKxqtvcU
         0kgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU57P5SkZjx55nAY3vZfIF81spFI9rEYZ4OHISqCOjljaHIeKa5epaamXbu/Do1FRKM4jpjYFM+EAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5OzMqMfGFyNAbpisuq0Jrrw+1hqLXzFZFgjv6ZL/OVoGmgwG
	s8eLtZ+/WHt/ninl2SWJdaXqQU7n8tlaK/8oAG6XjxHasrFJqpRAPkjHjRORLA==
X-Gm-Gg: ASbGncvBodxrC99SGclvE/7jqS+yWTv5P/Vxo5jJ8AVfbaIDM+KHylXyHawz0+s1mcR
	RhYV5RAlhvYS/ziVUXLMsps+UontJKuJseXRlZF94a5XqiD2H4sNQjXp3fKhQ3C/+wMryAIBN+E
	P3kki3yGjdyampPMOayWze/QP2Vjezv6V2tJw3RKLX5PT7SShoeRUWUXwkDIpUeCsxLwFle7L3S
	PZG7GBqMYlvJydmfd87F9JG9jreRq+GPFcR6oPmY0AkvGkhYmptYqG+qCgbZp5ggpXrYTGQpijW
	PaakFOB/u9K5ZW5dzly3dgb+M7nzIB2oxcgRI1pQMRZAxYJiWuWshCTckvRmlnvzAkuAqBgAQZO
	oBCuPc/OKpVgOAo3YfCN2AM2UKAV4tmoE8NV3Z/ksnXLKyA==
X-Google-Smtp-Source: AGHT+IG9GlmdgCtiX96dDRsk45wtZ3upqN8TRcAiXoGZufx0Im1b5No2jIds18kFE6ZrOo/H/S8dbQ==
X-Received: by 2002:a05:651c:418c:b0:336:d2fa:b62 with SMTP id 38308e7fff4ca-33b564fda62mr27093861fa.36.1757413473785;
        Tue, 09 Sep 2025 03:24:33 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c503edsm39078681fa.10.2025.09.09.03.24.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 03:24:33 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:24:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/7] usb: xhci: improve Endpoint Context register
 debugging
Message-ID: <20250909122430.65e3d283.michal.pecio@gmail.com>
In-Reply-To: <20250909112017.707158a9.michal.pecio@gmail.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-5-niklas.neronin@linux.intel.com>
	<20250909112017.707158a9.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Sep 2025 11:20:17 +0200, Michal Pecio wrote:
> Also, I am highly confident that you haven't even tested this patch.
> Try it and see what happens ;)

And apologies for being rude, but this patch really is broken.

