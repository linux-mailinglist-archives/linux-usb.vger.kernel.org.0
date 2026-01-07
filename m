Return-Path: <linux-usb+bounces-31982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B945ECFD02C
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C7413006708
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F71330642;
	Wed,  7 Jan 2026 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzYtDwS2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691532F764
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779684; cv=none; b=OpnrDQfVhoaaYL1uxNkFeGpjPxb/zo8WoMTRvN8LRqBgZqkctgjGi4ory4Guh6Ba/MPwbpYTd+fjYz5/lHbIE2Ke9CcSwdJImSFpJyZ5X9FI/q6vdPd6WO2PNCE72jKBy/Hp4K3YTaAVh5EILuR1eT9hPLZaZJklQWCYZevnoOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779684; c=relaxed/simple;
	bh=ANYs6i6trLGcerht4yR1tZmU8onsevcVhIQsE+VbHQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aK4wajbWg95PrZCCzF5o/t1AJMWq7hrWgv925/DpsVY4AY95XHQwU1YiWFFC+6/kGo1Qv5kgTwTAMK04lC4vft0NMB1fJhgIXx8hEDSSlYn8a+V+kg9RtLVC2OFq8IspnwGe2JM6NQkU+bO2RtgfUNIx5uTtDg/jdw/2OOYexPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzYtDwS2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso1710222b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779682; x=1768384482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANYs6i6trLGcerht4yR1tZmU8onsevcVhIQsE+VbHQM=;
        b=gzYtDwS2mYC9RovpNcHgNQebi7B/n13yvzxBb01+nbvR0O9Ekau1MxVTry8SSYYc76
         5lK4MiydPKdpaHgyd5m+SJPNHl+RsdFVG+R+semjb3nR3GWatXikB0uoVDhydLJLeeV5
         i/nQ0ETtHM6nzFOontNVJMS4npVCgJfUAknms5BzqneulLzQ8YC1WaDdk1sryfVdN8Ni
         gRIgyPmYEHrnftIgcP3Jh20WEqArGezvvD3K5FHfeCon8OC/178dAqtI0Lg6V9T47lQD
         BXDeCvk1Gel8slQdqBGdY5ioxff8BsUcwvJBoI21LUBgAMvyuZ5P7EzHFCWW+ATvBrt0
         JK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779682; x=1768384482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANYs6i6trLGcerht4yR1tZmU8onsevcVhIQsE+VbHQM=;
        b=nHyFfXi46bitb+y7thxLPV97UW05F8tcpk+XgiISpGRyw0emd4d0M34M/gi7huSGgO
         Q3fUJXLGTAPm2a24PLGu5JpVHEDYhGxIsxzX3dktvcGxsbT3QmhmhaYGpXTS4zMJCQc+
         stVP76Ggwhh9Uiy5445L/H6QNsq/AUksekFaiTIyK8jBEqHjsNVSU1n5p8FuZUpcjD4T
         qo4JoL2PYsazNO8OD9srMwCLb9UWZv7cdMkee2mI+1D29ey7bDkJcB0J0uPttXdVcfvU
         2z/AkMOB06OcyiaVxoTjFS3xcVhoV9HhPMx7jWuQdmKoLRbgP+ZfBWNZ9jYS60cvT74j
         UFmg==
X-Forwarded-Encrypted: i=1; AJvYcCU7mAhVpeOYRSIl0EW3v/JamjHbexrBc40MQh2F6t66OB5XqRYp6+6vJytUE37O2RmwzIBEARoZmQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaG04NEpHnqrZ9x/zVNLDnWTILRyregOKkqrWtgwCyED99ZG1X
	Jy7+1yO5UZrG2J4FK5d04hlRC8OuMCYn8UIuhYivXg/tS6AE4VeWFMQ=
X-Gm-Gg: AY/fxX6pB848xr5irMwBKBq2gQqW1YEAQ3zK01SSxINvNrJIMYuxmzZR8V2kNf8Y5Tp
	ArfemuDXmj2HbNJw9EVMVb/Yy0DRkWky+AXJlc70DI6A7/cthLTpPl7l0Yli93uxMkLs0PurUGI
	NWOd95SFL9YU//lHZ3MncmDhw4Dj/vdlueTHupKV1y5u8iSyBGOg/oAYs7/0ZU/GTKE2bSd2elk
	H1/bIcWdAmbGt6QvnEaw8hi0zlvXklgc97cwaUzCKluIfTAzQZdLWb1oxXI1oLI9LDEEIonVgub
	DGBIjZZthL8/KWJZTKhnpp0B6/b2/NjyFOw5reJ7rH9mYKLxc70KI9PVoXk/2UelaLXnBWGY+7v
	DoMKF8D/RCTRVY5dgouo5S3VKFwe3qizRm4IZHnr6mY4oOW9C1oJjjku6B+BISpKwhBuUlrE9Zu
	AN8gL5PCSg1ciNgrE=
X-Google-Smtp-Source: AGHT+IGAXBAfvt9+HKGFTfnKpIlZhyLpeWAQmEI7acjOkyIBy2z200DLidZSG3Vic7Jdxr5MpccL5w==
X-Received: by 2002:a05:6a20:7287:b0:35d:d477:a7f1 with SMTP id adf61e73a8af0-3898f99146bmr1696314637.43.1767779682366;
        Wed, 07 Jan 2026 01:54:42 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c2666sm4557245a91.5.2026.01.07.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:54:42 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	dave.jiang@intel.com,
	feng.tang@linux.alibaba.com,
	helgaas@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	westeri@kernel.org
Subject: Re: [PATCH] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Wed,  7 Jan 2026 09:54:33 +0000
Message-ID: <20260107095435.1390-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107093021.GN2275908@black.igk.intel.com>
References: <20260107093021.GN2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I’ve been using the mainline kernel
(which I compiled about two weeks ago),
and the problem still isn’t fixed,
so PTM is most likely not the root cause.

