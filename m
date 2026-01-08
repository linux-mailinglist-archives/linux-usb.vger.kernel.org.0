Return-Path: <linux-usb+bounces-32063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97FD02A17
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 13:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5ED6D3019E04
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC43F0770;
	Thu,  8 Jan 2026 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKgpf5LT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67D3D603A
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868673; cv=none; b=dd3FgPpW3G8lONhWHSxh1HTDPDBsx/GVt3NF07k2BLFcoDhy4n5LoQXEySa3loc0+k87ybEWhKipxeHIIyplvKcRmP1rzjwNlRedjBGL8Fyibc1c32ewPtfXyHI3mYWlG/ZAOqv+R29mE8A0Im3wJhNudD+lG1uMiNY5KWOkalc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868673; c=relaxed/simple;
	bh=8XgrIXfTIHEeqcAXLdtftIJs4zNxs/4EHKGLYJ7O0pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgpzWeIEqASSn7TIGGZodTVmVYGtwKE9q6E4+5LYBbKDL8Vo/cRLoseBKdWLanXpmbxKqZU5qmBupEd/aW2gIhP+q63JnXeR7kH2kJQhXw1roZFczQ+JRteOdlqlgc/rdIcq1ztaG14f122oHqOK+f6b6mx7L4KG0IWZ+v+sS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKgpf5LT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a2ea96930cso23668035ad.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868665; x=1768473465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XgrIXfTIHEeqcAXLdtftIJs4zNxs/4EHKGLYJ7O0pY=;
        b=fKgpf5LTgRChkCQD+bmtAWGtBS0B1WidIjV25cgiZ8Lyu70BPvc5RC4QYllUh+/uiZ
         zziMq1O8lmHuYHpKbBWk0o2flZ7R1IaERGVTzj1+aZxSk5dG5wCEA6x/tlon7ocVuO6b
         wCimaYQdICxPcSVpBeNdwQRB9s67jbboLFiNDRvvIznmLIqSDHGmWeb97d9X6MbNiSv6
         h39Nzx/s1bq0A6egxLx/no63AC1NzagzOZn2qP0o0FIf9sez5RoUJcCXwXRXjwMDWjq+
         zCb3xOYwa5i8PT1TG8zQmZ3oVxeanoV5Uw5/jM3M9t3rgbRnkjWZgoSxyHgeWXQB3Q9+
         psQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868665; x=1768473465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8XgrIXfTIHEeqcAXLdtftIJs4zNxs/4EHKGLYJ7O0pY=;
        b=QXpBKDz9/R+uWFwcc2DrepWcgsnQYHOpufas1lZR7fNs5D4XYxOYdZFrZNWHu1KxCk
         1CEm+Kz7AzX6dtwzB3UX42Ew9q+n7UI7N8s4wuDo+1b1E21qa0lOF565PMObmTsxX5OT
         N9miGy6XcVKAeiA2MVODHlSdNcOK4Tg7PgOfVT8wd90dwc++5/QOH/R80gVqkDc272j7
         S+pMY1XL0A/B35iNLAcCaFYK4gsbmmHKbbF0sWeQal1FOlE+W3+1OXXdF97ARZVN+l8Z
         E0FYSVkFxsHOrs/1TfNN2o2fjXzHxJZxWBByC0vE++snec7MCqu3PJSyewiNSN6c2kfa
         85Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWzHgAFxeqlDol6CnJhD+iRUjvSDrtNnQVe47ByiXp/itwS5z74xUzhaU5ka36ZBF5HZu1vw1kZLhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0nVPCawCbxW+LmpVEnQ+vCTH8++7EuP5/yUgTnjwLjV33KrVe
	fCBO3XyexzPbObnXoExB2cqFXPsbteru6NRxmz8Cva5OKVbppI0Zm1Y=
X-Gm-Gg: AY/fxX4s+W3D/NYqVR9Vk93n1t68bmVtgjBkBoDfXdeb/k8qqjuh8l2lBs0JIHPKghx
	MGYiQjxHG2LIj7At154E/gJwxFXhYKdrAHReXYyZMB3ziO+4fmhZ06JMd6x2+3yxhVmhw9TjME2
	vfws4cP/+MFlofaLYo1few3iBrOcLfUusAUbVpkBgXGOHZObJkaVr5IgAQTHVZA6nXjScKfa/m2
	qWH2E20GIVoLhikkMEU1XETgQQ7GR28eRQoihcRlqZ/+VUffDxWaiD8wQV49bGSUIxfe/poRco+
	JPAsolo3kab7Vw8UsxHvzEkvKnmL6ZH7OjbkWv7DMP1ky6/85GHGucR6+hihzj4KrZXYVYTfGAb
	RJVI134TSfpePUYJKPkZ8kGedvcioKKkC8gU0Um0KaKZ5nShj0jYnFzKPbqUFxW5YV/obZ9Xf1Z
	iOhzsQa4kYvinh2KTLBykPONQC4A==
X-Google-Smtp-Source: AGHT+IGBiNiGrFGtYU8HT43NWGc2t0TFwfrtWF8Wa/A1LiAqZWj9WgccZwKFE3lQHdocchAraz0Tow==
X-Received: by 2002:a17:903:3806:b0:2a1:3dae:8f22 with SMTP id d9443c01a7336-2a3ee5211demr49620495ad.61.1767868665505;
        Thu, 08 Jan 2026 02:37:45 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492esm76742965ad.98.2026.01.08.02.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:37:45 -0800 (PST)
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
Date: Thu,  8 Jan 2026 10:37:36 +0000
Message-ID: <20260108103736.3433-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108095303.GQ2275908@black.igk.intel.com>
References: <20260108095303.GQ2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I Cloned and compiled the kernel yesterday
(which unfourtunatly did not fix anything),
and after testing i did the macOS update which bricked the linux install

