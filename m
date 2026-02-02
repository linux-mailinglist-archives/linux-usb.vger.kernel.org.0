Return-Path: <linux-usb+bounces-32984-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ABtIqxbgGlj7AIAu9opvQ
	(envelope-from <linux-usb+bounces-32984-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:09:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0368C9814
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA73C301297C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 08:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6147311979;
	Mon,  2 Feb 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbsqRm7v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7562318EF9
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019553; cv=none; b=F0U2QAZUNEgL4GMj3xVgsOa5mcko+912uX4fDRNr6Ridx0K6V/BD3K9hToxNbBAnaPsySZp45KsPWLRqY1YhwDKrnQdAx0vvdxM9nlBup168CQY8sVervFN386uJmaIa6fdhpEWkHI6Y36lDof9evEuSpTfVA8R1QkRR4ZaxrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019553; c=relaxed/simple;
	bh=Qvm9jC+cvRFEScvCUGEDNUwDx61WI6D32tWIQpczjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbFUT0pGaTLU0fvdqVJn31ikg40tr3A2jKPSiR16CkYEl2jkE09BRYAYujMGO5vqBrpQ/ovt8vxENKrZku8x0Jex5q8x1mZmWsv2MidpJGRboHZ8JeKNR4k87M7iU4KWQ+w8G1tM4/J5iOpCJdAFMP5Huv7VmuIOz3ocMIF/lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbsqRm7v; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so30299585e9.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019550; x=1770624350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlNdBeStLZycw2ZrW9yB0I2chWTonliioSXnljgFzrk=;
        b=dbsqRm7vfLK3wtFRv52aVpbzLXiQUZbmp71T/0jeM9mUUeVoL6FLOveKiwVyLGKBfO
         6baortBkusX3mlYsrzL+tSTTtsCvMPRg9WHJvZ2Fuji2gUG1Sa8o96vOFF2dtlQ/u4Hs
         DiDm58XXYqZm/sV+0CUNR8zUnuVaKrZkbG+BE15mPZ4Ru8qBHkCccoJUH8PUsNy7jnJw
         mZPjVcpda0eFDW4bRKBvVndGn4nQ7YzwQd2VH05UtSDZxRnIuBgracjwP08ibo1akAB1
         /5glly5X9qb967sOLWyzB5EKuYVKj7gVFYvGV/0PhgKABGBoAVh4IwuFOmgQeFvuOJbm
         wCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019550; x=1770624350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlNdBeStLZycw2ZrW9yB0I2chWTonliioSXnljgFzrk=;
        b=mzaMxyFTTdCedlaTpUTBH5QB+gcGP1HAiTkcpY4+0a3krzW2ldwqNJeUwmR9voaR0s
         vrXoIkxfKzfRdsb+YVb1rlDR8WFS9QIxzE9OIHuPj0vIf9OLPLdg+JyA9B872FtuuqAa
         SLCFGrQ3Hkuo2CzaQmYYfw4Uf/zriCaSHuORhoeOshOxFKM/DzqH/V20MHq97KjuP/lw
         PtAlPqFLI4IjRUJqglci47L+Y4sFyRLpIaD84RWiswBm1Y8DnjO77EBLbqfsd3E9uZUB
         IuMiJmdkH27ZDRajjW9/V81fmoFT8FCfYwa0NCzMLvEDh9R7g2IChRwTbNHzCXXTQHCA
         aEyg==
X-Gm-Message-State: AOJu0YwPWPA6WO/k3SOFiZaBEZKLcoc5kXSJ/V0rUpwbsjqsuEnT6IDD
	bdJ+fRU5fgXx+RseH8ysjhRks+8jttcEGdmyHpqEBT2iOnnhS+wjM42WHpe3Kw==
X-Gm-Gg: AZuq6aI1MBwTUM39n0WAsjSRRoMFRMfneUPsUIYfcU04R1P8lF4+0FYc7G+i2lNKvMG
	S5S0zQwCq08Pp2dfHqbpmzzwZMkdUoVpgAG60fdB3YvqCI9yGd5Q7vwJJXjLrwqWLHYY05S0j+D
	GOYI1T1LREmn9jVHHmHYU4sGgMHd/QXltxM0ALpDpf5iDhVoL0T75HQV9YLxA+LCVqd6+QEehKr
	toTHdp2mH1/QYXdHe8L+gMG8hlrm4VubABJMnNaXfX6rhbj1ndx0czBoyOyRtRR+lW+gE4kSFsG
	3Qcr5qfH8g1ioyCbp47bn+zahvj0mu3luwe+6MbiR8VqHVvKmRlO32GaJcabcAMfHEJorRM6w+4
	HrP52AWzjMy+d25nL/m9ERZQZHhgSgesYmwoxpMq+DVcEVh3pvw4XiTuNsP27oY533jl5lclojy
	+Q
X-Received: by 2002:a05:600c:1d1b:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-482db4973a8mr124237605e9.36.1770019549680;
        Mon, 02 Feb 2026 00:05:49 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] usb: phy: tegra: HSIC adjustments
Date: Mon,  2 Feb 2026 10:05:22 +0200
Message-ID: <20260202080526.23487-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-32984-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0368C9814
X-Rspamd-Action: no action

Followup to a recent HSIC bringup with a few small improvements.

Svyatoslav Ryhel (4):
  usb: phy: tegra: cosmetic fixes
  usb: phy: tegra: return error value from utmi_wait_register
  usb: phy: tegra: parametrize HSIC PTS value
  usb: phy: tegra: parametrize PORTSC1 register offset

 drivers/usb/phy/phy-tegra-usb.c   | 45 +++++++++++++++----------------
 include/linux/usb/tegra_usb_phy.h |  8 ++++--
 2 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.51.0


