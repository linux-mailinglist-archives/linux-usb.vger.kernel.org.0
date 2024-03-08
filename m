Return-Path: <linux-usb+bounces-7720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F3876153
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 10:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 073531F21AED
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E17537F5;
	Fri,  8 Mar 2024 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ytV3gF8E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBBC535BA
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891656; cv=none; b=GEL6Q0xVTdNQfcNWgDp3WVWd5KueyU9+fIqTkHrj7BPC6hwY9GmLikVt6Z95bti8TsoyGSGexsLGTHTUcNv5v6H79j0PyJZ5Ww5A+HEjeJQO5BHGSGZEezDAve96MKOhsDiJeeHIh2aLi1kd16RIp0XZkaA8CH2qTg68DwOc91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891656; c=relaxed/simple;
	bh=PSSmdFEKXbQoDoLCkYh9gWPYZ30jQDOHJ1WglWyUdcI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Gz7FyUZJ+Ek+r/kno5tqMwJLWfm5uh52/B7LyqC3qdc7EfxWXoGjL6GZg28t0sbifXN07sm+TZDhTeQSMwpBcuJRYO8JBXunXvyRv15pe4bAQ1YUkVQILtLW0Yv3wuhbRqUp8R3/Qku0MmuBa4k/bi6rd0kSiq3vX6AUQ+jMV00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ytV3gF8E; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5cf35636346so1499300a12.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Mar 2024 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709891654; x=1710496454; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kd9b+xnVrsV0VnvP5BBobh+7armz3SPZmewGeAELg2w=;
        b=ytV3gF8EP34hyIMMZ2QJseL3LPVTrc2NDBdolJoM4xGO7CB8WcamB2r4NoVeAzmEYx
         Qz5UfThOrbqpQitYDhQ5VtwVcaDZFcIhShDnTgrBFxvvqzyf+LGvd8XsA3dEut77EOi4
         ZX3iVd0yYLeHSk1kigdvZfQYJ3ImxU1bH6aK1yqaU/17kosDWPtgIQd4filUi4zIzVrr
         ixVjafFgRONl5mrgwtIg47RlX9g3waUeFMZGMQ76NFY2tUuCIImG6JHCYrk5JGrn57qD
         SR8mm9LB7PqRfjWmBbS4trJ9PMNhmcrQOnOA4QtTU8sHQW0JPR+XA+fuuZvHwSC5Wtwj
         EFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891654; x=1710496454;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kd9b+xnVrsV0VnvP5BBobh+7armz3SPZmewGeAELg2w=;
        b=DP5YOhDRSN2HKZChSnBZKbpK8RKL4td8a7gyxNRlOXXlwTP5bWS9IhYQjAJNdIl/uF
         UTSSmf2LYe1Sic7zprgGzRWUAtyVj9NpbIS/wD9avUyGhOtOSaJfOp1oas129MWgwfxU
         lOjGd7OQLJcQuJwbyAJoDOkq8T26sPJsHkzI+GwlWCMkxLe0sfxXIcJsGnudFirPHeEs
         uzkggPk30JBC5iU72yyDjm/p6pBBsilxq9m5Bi82e7M51Weq7OOdFqEzPW1N0PKpTaYP
         0cUJ6wjs7HoSEMp/WV4NW7wGlHAwOhx7q1m83AIMQE9SHV6MMj+di+gDpqy1ZuWq9xYP
         J7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUfpcNQrh9BiVIWQuSiI2EGdacOoIvC7TRwWI5QiYMNyPlgypvu06H798rbAKAZ8tT/jS5n7sFyCnqlnnNunKjJby0/BhDQGyzN
X-Gm-Message-State: AOJu0YxRs51wqQIa76v5NZaG0MwRkjtcOK/DSRdA+Urfu/dBOKlOcnxU
	zbDYtlP+IipXZATPGdNog1jJosUa45JEwBUt1+MYRbEjX9TzZmUe7IF5XNsERjLdIWVeuQ5+vsZ
	vEfmTf4q+VV8gqQ==
X-Google-Smtp-Source: AGHT+IG7o+dh/76ogl6dMQx3yfx+ZlS2Tc2RH7CYeArGIpPrqv+Lt8uzvSvNDTz8wBfiHvp5wM9In7J0dxXtBnY=
X-Received: from howardyen2.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:16f7])
 (user=howardyen job=sendgmr) by 2002:a17:903:22ce:b0:1db:f7e5:afd2 with SMTP
 id y14-20020a17090322ce00b001dbf7e5afd2mr717431plg.12.1709891654099; Fri, 08
 Mar 2024 01:54:14 -0800 (PST)
Date: Fri,  8 Mar 2024 09:53:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240308095320.1961469-1-howardyen@google.com>
Subject: [PATCH v4 0/2] Add support for multiple coherent memory regions
From: Howard Yen <howardyen@google.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, mathias.nyman@intel.com, 
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	andriy.shevchenko@linux.intel.com, petr.tesarik.ext@huawei.com, 
	broonie@kernel.org, james@equiv.tech, james.clark@arm.com, 
	masahiroy@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	iommu@lists.linux.dev, Howard Yen <howardyen@google.com>
Content-Type: text/plain; charset="UTF-8"

In the system I'm working on, there is an always-on subsystem which
includes a small size memory, and several functions need to run and
occupy the memory from the small memory if they need to run on the
always-on subsystem. These functions must allocate the memory from the
small memory region, so that they can get benefit from the always-on
subsystem. So the small memory is split for multiple functions which are
satisfied with their generic use cases. But in specific use cases, like
USB3 devices which support the stream trasnsfer or multiple devices
connect to the host, they required more memory than their pre-allocated
memory region. I tried to implement it in a generic way and propose this
patch to give it the ability to get the memory from the other larger
memory to solve the issue.


Changelog
--------------------------------------------
Changes in v4:
- Add the driver where uses the multiple coherent memory regions

Changes in v3:
- Re-org the members of struct dma_coherent_mem to avoid additional
  pointer arithmetics and the holes inside the structure.
- Use consistent naming of return value.
- Re-write the dev checking statement to be more clear.

Changes in v2:
- Replace the pointer(dma_mem) to a list_head(dma_mems) in the device
  structure and initialize the list_head in device_initialize().
- Modify the required changes in coherent.c.


Howard Yen (2):
  dma-coherent: add support for multi coherent rmems per dev
  usb: host: xhci-plat: add support for multi memory regions

 drivers/base/core.c          |  3 ++
 drivers/usb/host/xhci-plat.c | 19 +++++++-
 include/linux/device.h       |  5 +-
 kernel/dma/coherent.c        | 92 +++++++++++++++++++++++-------------
 4 files changed, 82 insertions(+), 37 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog


