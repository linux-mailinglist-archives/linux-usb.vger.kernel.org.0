Return-Path: <linux-usb+bounces-32109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D12D08D01
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 12:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DC7A305E85B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 11:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0F333C192;
	Fri,  9 Jan 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQgfiRaM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FCC33B6FB
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956777; cv=none; b=CaQe0LcKU0ODoW2aFIUppvjIMJ9MRH6nXSHMPXZw7oBQclbWNtVEWKDF4CyRFpmDALjcw4KW0jtSK9zew2C2vUjHfd0J0b67BupwLjNv5Xq++6jy+ErRj3oYtz++QthooreYRa+M5IDh2nryb+pb5nvfgkt/i/sdHTa6PFrFbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956777; c=relaxed/simple;
	bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZWqXaP7B1czUKN9SocnJn14cqzrxyIPE3ZAzdYYfnlbm4qofFsJHy1+T/witLGiKOQS0h+9t98F4hSwWPVdIqGqqXG2Xy/9gkZZz8R/61XmmVI+tDP0Y+N3fyePQ/muFisisgtyiDdcIPklGopVvyenR/urSWsQXUoa+1AL4Eq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQgfiRaM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2563354b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956776; x=1768561576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
        b=UQgfiRaMGyDqRqVSKgi2xIUXEn7RhDxWTsOLLqmtT9VNknq/UZE+8YsnrbVUBHOEIv
         eWmSvkg34bHvTQwXWsONhdtbhYyhbqM97LAOfZGwYcKKitR40ZLsYQAqo6Vde68DDbp+
         YmfPj8HH0kiOoFx0MoWiBkBJuprgCmfBZF99DTPRKHa0eEdJ1EH/IXee0uk80oj3CFIK
         gxQKe/QBPwIyDCl+331Vov9/pFu2QPPJE1DJqr6MxKzq84mm0Zsgy5Avoy9Mgo8xud8B
         9R1n8JY0Ykv5G/e5YnvWYMv5aUIcBdreKXy6IT2viqhdvXN8qaBd8YgwCm9b7WQYH/X6
         9dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956776; x=1768561576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
        b=BlE//O01nSpOLGZH5EkfGj6J3QndZyoinwwJZ0U9xu8wewZkRPOR7sqHh3On6xKMqu
         5yt+4T8huQcJyBVTH7jFKpE20useU2UanqTR/1Fb1PPLxnqQbLCxOcXcTSbcImfmGYei
         jcivnEA9alfPRt1NNa+mamsz03RxwqjjmZU42OHlDB+PNiNcOkh5Wd9QjElyxcomMytv
         I8ZuBIw0dI9r6Cafmraf4NiW1TlQnml3HW9yUQL5nrm4sQuPCMC0H/e51MDaVyDRl41v
         BhOTQ5EseUxlq0FdQJaGdXO8MnWpOx7JHTD/67BJdLCD0Ob0BHA/WdEECRcLQhADdRvW
         VDGw==
X-Forwarded-Encrypted: i=1; AJvYcCWtAbvDlMdsLPf1A9xQyFgh256ZwwwYK28BPvn5+PG1o+ziAJjrOu45ethC4nRx/8a5ZjNLtG/kOYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybWaORxPNvXIsell06+pAqr2vqIIveOsZCYtQtuY/T15oaTyga
	VAuOXVm5AlyROv/7uumQrcVCuX+DMcasGY8JNDlKByhVWNzM/2zMOTg=
X-Gm-Gg: AY/fxX70PpMJmCq5XAtapowDL29/9fNEPfCV5+a91z/C+hLL2zLdLrZptMUyuwktqVT
	nP115AB4zDbtwyjCzZskCnW+SDw3s+VUzC6RRusQiP//BmM9zIPCN+KvgmXGenvRskIhj4ahMmu
	MhbIm3N3ID5Tksgvwd0+EDIVP67DinQEMSUp4eis2xUN2JAu6kD7XU9I+5mftfeeUvkj79kEpCF
	poE4jAP9+/Y1Ea8+kE+67mqZz3L8iWBv1w2n4R8vv1wjU0gBPPK6clmhQOlkrCsOGCPkbYq7rPl
	iJsDPlf1Deb5PKpofBxTClaFzne8B7VCY0/jHx76YiaIp4yqjEmqbESh5n5uOqlSk2HT4c9W+LX
	rUcou1ZZmSxyEvHr+e0ZBy/KQlwAf2DdX1f9krQOsim34NtVy0Umw13OhYvSnGi3GhedZLcDUoJ
	s5a0UxR/0BEfFoZvc=
X-Google-Smtp-Source: AGHT+IEcCIF5q4w23kqNSH0TmkW6lcxveVlDrJucdG2n+7nDKHsoEHF08l7LWzBlXmTgd5h9lZyYAA==
X-Received: by 2002:a05:6a20:a103:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-3898f9cd68emr8378899637.50.1767956775758;
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc02ecfccsm10334516a12.13.2026.01.09.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
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
Date: Fri,  9 Jan 2026 11:06:05 +0000
Message-ID: <20260109110607.2971-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109100840.GV2275908@black.igk.intel.com>
References: <20260109100840.GV2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I dont test it, but I do review the code and fix the issues.
For example:
Using DECLARE_PCI_FIXUP_FINAL instead of DECLARE_PCI_FIXUP_EARLY is wrong
because DECLARE_PCI_FIXUP_FINAL runs after PCIe is initialized.

If i cant install linux, I can’t test it—that’s why there are multiple
revisions, each fixing issues found by code review.

