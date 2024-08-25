Return-Path: <linux-usb+bounces-14063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDF95E41C
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 17:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B861F215B3
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9695F26289;
	Sun, 25 Aug 2024 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRdTOcwt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E94154BF8
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724598946; cv=none; b=ZVJJDbeEpKmTLk2xsxCNXJeC/numdaLL1G55s5SOX3/RQOgZc/zbKuiXXiHGbN4sC0q6XWlw5v46sI2ABI/dhCTdKvJ1o/DyyTO4bJPvamZ+qh6C6utdQEL1OfNMYdy5PDO5N4DPZ7ZyUNJcHSpbxUFqeCNH6acwdc4p35OHz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724598946; c=relaxed/simple;
	bh=qNxZ82lrgbEXTmgjGta3NFKMESPJkJsyHM47EhIqRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+4G6sLv790FsnX2o/nQqpOIy7uhi8d53Lcg9AXsrBI91VxBzvIKZK+n4Rukyq5a9O1zSdyk8eD0Cc0QbQ46z9wxlJux24ttbDLi5gvsQNVzJFPtO0vtK4x6ORy4KOqzDCnBPYbyOuQ/IjHLOJrwTlCnIpVEUL3fXSNZ80s+LNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRdTOcwt; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86abbd68ffso324187466b.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724598943; x=1725203743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNxZ82lrgbEXTmgjGta3NFKMESPJkJsyHM47EhIqRmA=;
        b=LRdTOcwtlDcyk5xR5uTCSLbJmq8gQnM1/Y/BfKyu0Q4YSGRhYGkbCoZLq5mCQkLxuv
         LmTEMxa1m63Ooi8eKtf4xL58sV4HZkVG5hZap0ZWZ0Z3NWKN+FkPAqTEgsKVWwW7Jb9g
         4Obg8tfusgcAdMbxM65dleoUsepw0zS0haQsi7qZ+NY7ikvdiBGzwPb3INlYAseLT8NI
         3OHXlSAOcRsDlWTkAKCVN5GHaFfXLoRO48jPIjczhcmUpRbHMulqbKVy2buuzEUJ01nd
         LcQPK4n47NFztH8OMrQZMAgnAGwnTqCJdCWkYfTry3AFA9TvV4wQDk7n+LendIy10kZ4
         qbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724598943; x=1725203743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNxZ82lrgbEXTmgjGta3NFKMESPJkJsyHM47EhIqRmA=;
        b=evOHdDu88zKMA/lNPV0FHToSLHUwWtprXdrtlRmo7TEEBcRPqoz/W1Z8+QehAcr8A+
         AyDpxVT6cPFOyopEnRlLKWIOkS51c0i3iqz8Ue4CUBUhHy6vpeEaIQt4IRd87kW/3Pms
         2k3bmoBO6kdYz0xlc9DYeNAFkF3ahJ9iuKPMygUX3QoegKp2gIRX1E+5uXQtLDixTK6x
         pA9Bmzl8ex9kxq2T1s0ssTzCUj7kcQ3IhEWTDGSkxY8PLdkeCVeYtqZvuHd+CU5Ezg+1
         EdoVY1fjFyscFjFyD3HfovxNdzBKJr31fHH6rdYc3LlpD4UGjEFAAlyhYMXlGHwFcpDl
         CGvw==
X-Forwarded-Encrypted: i=1; AJvYcCXzZSt3sTB8ySp1qRtHVxRTPpikU1wBPuPYNLYu5zCDOrWONCCbhxMTg+5YUct6hrlB5WAYyMMR5WI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyw+OZbMbtXX4MPYK4VS8Grs/PVx7VvfGFLQioeUdcMwgKgwUd
	jRYxFazZRpe9WHFtBH8X5SR5Y0AzO2R/c0rkERL9QkHmN0jYqDVo
X-Google-Smtp-Source: AGHT+IG2VgdGl8+xkMoC3ql7x/iF8ec75+54XCdwZFOKGvhXIC7CsvtzqbkxSWN916O8+MG8HSLyoQ==
X-Received: by 2002:a17:907:843:b0:a86:4322:eba7 with SMTP id a640c23a62f3a-a868a928891mr1325457066b.33.1724598942555;
        Sun, 25 Aug 2024 08:15:42 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f299e4bsm546111366b.57.2024.08.25.08.15.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Aug 2024 08:15:42 -0700 (PDT)
Date: Sun, 25 Aug 2024 17:15:37 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: fps <mista.tapas@gmx.net>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Message-ID: <20240825171537.33e49293@foxbook>
In-Reply-To: <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
References: <20240820130158.339b4d87@foxbook>
	<bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
	<20240821150233.4f8f66ef@foxbook>
	<e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
	<2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
	<ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
	<20240825065831.0eaba5b2@foxbook>
	<67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

What is the last digit of your HCSPARAMS2 register?
Here's my three hosts, guess which is the one with problems.

grep HCSPARAMS2 /sys/kernel/debug/usb/xhci/*/reg-cap
/sys/kernel/debug/usb/xhci/0000:02:00.0/reg-cap:HCSPARAMS2 = 0xfc0000fa
/sys/kernel/debug/usb/xhci/0000:03:00.0/reg-cap:HCSPARAMS2 = 0xfc000031
/sys/kernel/debug/usb/xhci/0000:04:00.0/reg-cap:HCSPARAMS2 = 0x00000011

See xHCI section 5.3.4. If IST is high, you are probably out of luck.

