Return-Path: <linux-usb+bounces-33536-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H4vIu+LmWn9UwMAu9opvQ
	(envelope-from <linux-usb+bounces-33536-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 11:41:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282F16CAF9
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 11:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE7C0300FB67
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 10:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B8B3431EC;
	Sat, 21 Feb 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJeTfUhO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50232862B
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771670502; cv=none; b=pAF8hPUid0S7mzLEc2qIj62v92lkpPTUJi6QNyvWvh/+PXkwkTQvxGvKQfFvKBHkiU67tZGJC+HpncQA4Qwc9G+INrAPfOIqGyRBV3jhrWDSwpOGof4+sdy74ndVYtc+fYj1ZXssVcJuDa5EfGZ4IGGEEV0SepUF68A9CT0Ya6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771670502; c=relaxed/simple;
	bh=DSF2NhmQGDeFoSnzI+Mg1CGPDPklUr4KfPrHzH1V4WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xrqi4BeqJCk3btXC/bJDF0tGeRxWxqTHRXYMOY+ijyBrESz9Rv4myQ3v62RMDq5YPoySyIf8HUePcTVU8ZvISxegMgKRRtCXJpzrchm0XLbkMfi0fHLdbOsNvI0/1WvrCe8GhiIoD7hvlTdLUCfuHz2f3dWeoaat2csB7it9Q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJeTfUhO; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a7bced39cfso31222485ad.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771670501; x=1772275301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX6B3fZCA0dAwqSvjvOB2FTtcU0eRxeM2B9ioo4wtiw=;
        b=jJeTfUhOKQPnqSYz1ku84wG4mJGTQI2IHxzgG0dIb28ZwDHIckqOwZWaeqaozSBZmz
         ix9v/le4af3/d2eR6YFlBF+cXe2ElpcafJ+Zcoxp4DtfnPZt4ozNGSPx3dc+UM+QAc+S
         I/8CC9M7fLJ//IBxcs9ucg2qUq7SltKrREUF7OQuPGRD+P9aHN9KzugLGuX2Erq6Eydy
         7jaWClKKZH0kdZdKmvYf6TECTYhS/lH9VTp/Qi+zHUpgUI1LPFl6mTcvROW/KppxChQX
         +1qTz0bDsy3n6+vzNbv9qKpfq165iPZ1e7eCH3Pr0Pmn53BKHgT45XFFprPSTkliO7wU
         Tzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771670501; x=1772275301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YX6B3fZCA0dAwqSvjvOB2FTtcU0eRxeM2B9ioo4wtiw=;
        b=CNVLltUDHEnrd1naObJkKoKjbNLpDryyEGq70PbiQASksY3tI2eyNnpPnArIh1iNWJ
         p/uhRrC9E+FTkHMiZWXpNUHH/jYoCFXSB7POpnpedzrU2M+LJIPmrhH+h5nVXTBPL8T0
         q/U2IRJgKqwpwdw2cYzMfutitwe1ro1geJwBFCtOtW/AhLAwAyBTaoDn2e74+ASVbs//
         FGUS5alI3Ai85AvgCAI+3FQHlygeB1cGyOKXsHicx0SsJSOvjcD65MDg5+g6nhziV1+R
         DFYlFFedOx/q1f7tzeJoFlZhIR4eLHTsIWyHbah1fHTqq9q+OHbh0sGlMTa6kUSlzypL
         9UEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlJBlzCw0jI1zRd4kbEBTK2gtoSGw063IY7TJV1zZ2b7Gjoo2XBkVfR/eehfxfZaQqLA55aRZWSgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP84chJF2jx82Wj+FJNXwXeHcWKwgdRq7Y2vG+FBhJv5/hpAij
	zKErfo9nd5GSm3SPQ3tnnF4CbVYOt9OZwRyonv/t3K+c0Zz4M+RrF+jL
X-Gm-Gg: AZuq6aIo5PeoJ1QAIwTGBL/pvmDZaxMxzXYKK+BUS/ZPjyNDTqAjQy06oVT2Ktrh1Mr
	+0Nff13+14iR41PYZHqZi6iyttKw6GTdsrhRtTOR4DPEBA/tjnoNVMT5R7E9jSRK0EGDguMOzUV
	IDzd9zWkktWElSmbk/FCGrtZ4Qq9e6bxDdsppXI3MpC8KC6OqYlzdbo9lRdZpxmFZvuCMWBeUoW
	OPo8/uIFleZeFOtV6x6qL/FsnKXx+KAcg55O0ZPprKfvyXVqgC75QviEooLpOew48yAiDinuDQh
	CSsQG+ij6V+C7s4HkNXLbRM6NGKW7tqNISffO7aloBYg9+xTm86DiUcFnBBjIWWp/5FxnA0UhKg
	g9hzYn9CC2MccF+Pxtb6HNsd5ag5ZAwb0P5zGWpBnaUcWuXleuk2KGeiwse80z6y/AcX0/ZGQl/
	XrFW1EoUeqSiJeZ9zV3ep9rBrisBnA+lxM7BUMbxmPrsYp6WOKOMwUbwwDc504ptWUWsDk
X-Received: by 2002:a17:903:1248:b0:2a9:2a0b:4ef5 with SMTP id d9443c01a7336-2ad743fbbafmr25024305ad.7.1771670500635;
        Sat, 21 Feb 2026 02:41:40 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([103.73.101.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3507csm20656665ad.8.2026.02.21.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:41:40 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Sat, 21 Feb 2026 15:41:15 +0500
Message-ID: <20260221104115.4400-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZgYKin2nP19CZyL@stanley.mountain>
References: <aZgYKin2nP19CZyL@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33536-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0282F16CAF9
X-Rspamd-Action: no action

Hi Dan,

You are correct. I ran Smatch on dwc3-qcom-legacy.c and it did not produce 
a warning for these lines. I identified this issue through a manual grep 
search for the pattern 'platform_get_irq.* <= 0' across the drivers 
directory.

It appears there are several dozen instances of this pattern that Smatch 
currently misses because the '<= 0' check includes a valid negative 
error check alongside the redundant zero check.

Thank you for the technical background on why Smatch handles it this way.

Regards,
Zeeshan

