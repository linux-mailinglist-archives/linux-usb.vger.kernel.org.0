Return-Path: <linux-usb+bounces-28668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07522B9D830
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 08:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BB0E1BC1041
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 06:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD02F2E7BBA;
	Thu, 25 Sep 2025 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyK1vMzp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD721D5B3
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780131; cv=none; b=UxMT4xs+3meDchuarI2EFBzTzSqte30zwFvIltKECwDoArW4MHnat8ESfNu/eM4ZjSpsZJ5tYP87oKOsrOk1MpEK1OJwmbRYmxP6uvFg7AX+YxoasQ5xyQuH90pyxxDJNap2B9+d9FTunXYJh+4YeGGJfB6Emy/d2J8P7eNf8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780131; c=relaxed/simple;
	bh=XlDTU9cabYuuxQxafZIKIPtRVQZSY1fOoKVSyjkTGGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=teJsEoCK0vG9Da0NT+mblFJC9SyNsoBZeWgsTkeGLCy1PllRI4gPOIi2ZMe/nmSSTfwYdvEzrD7OQFuzVdPh3AoC/gbbingPH/ButV5hc6ZkUNrDuj4xfPWY4eWQbtmA8JtlOl5rSjMBzC1TuACxMZ1TEhtMbOrd9Uwv76aamTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyK1vMzp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f5d497692so859876b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758780129; x=1759384929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw6r/w0TQoLUu4aRi3OyGDu4XdJg1UR/ogba8tN6Kc0=;
        b=kyK1vMzpR5+F4U74ZF03o705JskvwfuFqa2y0x8rqXMzmmd1tThI2eSxll/dQCoYSV
         ud54eHb978mu6sobRXFYgmRhvWkP0UnVB7zwSvI59LMvgl4Ai7FRL8UwGnSED3rbnkiq
         pzjIJV8MilwgKfbEfcbWJPYwbIs1W2qSP9vRqeS1IT+PBNgVPYauN/FtLMcGNPVtUzEm
         Wdo8PcxgeI9YBT2+uEYU9Qo7nozGHXtSIPpM1L+x5531dbnmPVsXcHMr5l75aVWmVUfK
         tx0k96+9esTm1aseA96l9IVeynJnPrGI8stIlJMT+V8jWijD4x85nZtSR2l7thxTgSQU
         bktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780129; x=1759384929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw6r/w0TQoLUu4aRi3OyGDu4XdJg1UR/ogba8tN6Kc0=;
        b=Jd716Xa8FMej1m7xIItksUIlPrR/iyaeEFRebIpoQIl8KZ+Uk7tSNq4pbU0oGSFXsN
         DT76helxbc3SgvOPeMeBcfsD8f7WaWl+4EOkTKnKa3g0Pd4ptGyxBl1DRRLB4bJd0mY8
         blS3E/TGYsNBl0+guf2JKKI5vgoNSF8EezoMa4/3JdxnVLz5hcKj/XOamNPl17nOgxnL
         AQU4WX3Oep9e0l7oKIGP09HlWeCNZy/NSC5MbHInEZWJbaDPgd4AKu84jeTYl5+mkqzA
         0cUhTRxQ7Krn/pAJ8p5t9UjI7m7nuo9Run8oRlRcXTv57LkXxMxXG5/29z5r25HoWj2U
         clvg==
X-Forwarded-Encrypted: i=1; AJvYcCXUEDoFrSAc1FUD3m90PElQUms8GzBEPV/foodkgtOV3aFDcAGw5NPApzUuawbh2+1tns+J9LCmOu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFgSttOziuY1hJkSPFyNzr+W5g7au5tUeC1umLevfOtsUc5ta
	DhuML/sFc6YAqTJ4/OHhmm1ndHQNWnvnk0JqlYbqjTaxM3JRk2gCOoox
X-Gm-Gg: ASbGncteSkQZ3a34Ai/QlXlTRcUvMxt49WlZ4fKTDkbCRFlQElEJJ3w7otOmPLVEtfy
	HvyvAykZyBljRDMNEotuQOTswrm62EEPskASxXp3AT3kYjK5KLNKFwxvq3WRqxDn4Ra8zifTC9m
	VnsGPga1Ap3wl0fXvbkMk7xdMKcfV0GsWdXBf8siF936RfaHkROZgy3CVa10RDEdjO3mfTy/GMp
	jg6JElgqDhKcwSAK5wvMMJbe8OMMslG3l7nuir9XcPzihaVBYIFym8XF9S90OkhVu3QUySZTa8j
	AVAbv4tshc5AwrUr+LrdFahvzc66557B0aYJuVXu6V6Cz/303w1BaFNqOcrGE95xE/XfVYjXJUP
	D9wfmpBXUdDm9dpWJWHxaQwV9wxdy8ZiEj3+qorc=
X-Google-Smtp-Source: AGHT+IGxtpO8fYqBJ4Up101RNQSuSSRj8mAjj4mT1f+xp6lmruNG+NZqgd7e02/Tdm7NWnRO27FsQg==
X-Received: by 2002:a05:6a20:7349:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-2e7d83ba73amr3173114637.42.1758780129245;
        Wed, 24 Sep 2025 23:02:09 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238b19dsm916334b3a.10.2025.09.24.23.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:02:08 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	david.hunter.linux@gmail.com,
	edumazet@google.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	petkan@nucleusys.com,
	skhan@linuxfoundation.org,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com,
	viswanathiyyappan@gmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Thu, 25 Sep 2025 11:29:46 +0530
Message-ID: <20250925055946.189027-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923163727.5e97abdb@kernel.org>
References: <20250923163727.5e97abdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub,

I found the topic very interesting. So I looked into the existing drivers and almost all of them seem to be using `usb_submit_urb`s except `lan78xx` and `smsc75xx`, which have a work item to do the configuration. But I see no synchronization between their work and the data that is used to do the configuration (which can involve multiple requests to the device). Is there any synchronization that I am missing here? 

Thanks,
Deepak Sharma

