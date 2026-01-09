Return-Path: <linux-usb+bounces-32101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D3D07BDC
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 09:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8C0300FF98
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF162FC881;
	Fri,  9 Jan 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irYKnfvh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5371A218E91
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946470; cv=none; b=UbfHMp+Tbs9ujsUDdGwcuKxqwKg66IkOSVi7owhNTC0KD52OE+nzA24K8AVAriALvx2W7HtNcXg7GZ5i5ygMxRRhNcEbRIYPzKwUP7ZpJGAUao1CsI0UIJ8+ZASimLpXbbYeMZ2Mlc3uyY6MR/vzCeZ4ETZl0G6X1yl28S/oPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946470; c=relaxed/simple;
	bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUmHxj6A5/HFNZViSU34O6ZgsUcct4alxXVf58YYMtBOqXICy+NSzRiK2o7Boe7yYd0UpF71/7IToCFoj8F1r62/UCKA2iwr5dkpsUHKk9YOhu8/oSUZKRHZ2AuLjF3wcUt/oiAd1PfQeJKHsqYZQWz7zmibBRgwoLlGHAHUNuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irYKnfvh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso4069769b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 00:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767946469; x=1768551269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
        b=irYKnfvhwjUcOBo3+HdcIIFkQABMpVWaJ+sja4XrqkA3C2aA1FpT+ugUS8NZrDM6Kt
         qj+2ENqE+6bq90mLEELeXhfjoG0FGi8Tiw6XKkEv0UkcTuiGmuf/CyAHKjin6XPO8DOD
         e2ZVoRBaz5AxbapL/20jUfy+jfBRfnYT9Izi8VdPMH1TrJW/RxoBINC8E3h/nQK2DY+w
         ZqXMApez40pYi1iSB+AYZZ70yuiG42J6y4Txu/R72+a/Gp1JbumZcwOyTdQBd3rLbBiR
         vekdTBhTLUxfErMUGrQjSE+lubCzbXN0Spn7OMb61hbBfdMPsngLEO+EkVGuqGuPQzU4
         mBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946469; x=1768551269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
        b=EtmUYArMMc6i3HMOQ5zSwVviWx39XkZD/c/nyK2AHQTeA7qGHmMRUbbjWeHEtuQBHv
         JvSzN1Co8xXEIlYkFj3uuC5Fv4r6XKP6B9MayELRxsX6MaHKFw3x72kqW/GhkOkx8nqw
         FyUxPscpc6S8WZWi/K+dIAtKimhv9pqV7ojSo1QQaRj2P/q+R8r13ETN+G2nhnU2/K59
         6H3fU1K2k6FcItFrCUhu4GKChQZ9C7z7ObUXmV0us2cOK4camAbDWaS6yItuq+pgHQze
         RSEYO9AJ41EHwBu/sDYeO7dCskYagtMRihtphLYU1LXvHTGACXNgJkBSM2gL2EGeuUol
         WDzA==
X-Forwarded-Encrypted: i=1; AJvYcCUBzZRQPpM2u9n7QsrjXCBOtQ15gy759gqMvNYsnxrvh78FPJI4MMJa+uXTZwGJNhGCMbqdNCVwoKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywatvqm290o/OIr455hIZ07dzB/x/qDtS3B4Hj5Q+2+6tA1z+ap
	Heu2wj84EC/c2jo+bnTpTQw93+oX9sKRo9EL1EQVuCc+/ZQ5bDcF6kA=
X-Gm-Gg: AY/fxX59YPrHv/+c1NfbNDRh8HC7Y7kS9ZXf1ti44ufsFtOYCRRZGIOeZ6csfZ+UYC7
	HIZxztSM7b6PouWwNESr8LYaC6gBax5BEhHlvBSvPCWzedfggRiT7xAItXViFDk7ThW5g/fjVEK
	SqrdXRCuIFedA+bHLRdxE7bCaWfVDE8rwFnSCYfJ/WYvsbSBWt2fSV3/8AmnWRsFp847TxoI1b+
	SKllyclLSwysPToGZY9KhoHaGlrEjvLBmojY5pzHxlzfOkoDVf41JS/1l0qcGiOY4elqPYbkG/f
	ZoSj2ZN7wv++n8ESdVD9sMEn/5qFG3sEahjAaWKHOiCnwLWK2dz9jL1jx5PXOVHfpwd5Adk+L3W
	7C9JQIpprAQpB+YV2Xf2y09NDlAeJrxNI5Ord0thzLxT2jQxJbvB3JBUtbrOaPEqZcL+iiOwb0t
	lVHZyTUZ/TtMRryL8=
X-Google-Smtp-Source: AGHT+IHp8AMqv9c4azrHD6Y6JJV04ILq12NFVTRqxBqD6sCbbov2HXVi14txeZNz5RHLy3TSD5xafA==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:450c:61a7 with SMTP id d2e1a72fcca58-81b7ffd1519mr7639426b3a.62.1767946468726;
        Fri, 09 Jan 2026 00:14:28 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8ff7sm9695717b3a.37.2026.01.09.00.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:14:28 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mingo@redhat.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	tglx@linutronix.de,
	westeri@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 08:14:19 +0000
Message-ID: <20260109081419.2746-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109065746.GT2275908@black.igk.intel.com>
References: <20260109065746.GT2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unfourtunatly the GRUB problem isint fixed, and the solution i see, is to
wipe the drive which i cant do currently, because of my data

