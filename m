Return-Path: <linux-usb+bounces-31074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB4C990CC
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59B13A4655
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC04A2690EC;
	Mon,  1 Dec 2025 20:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0zPKTVj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAD26E6FB
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621447; cv=none; b=gKkI0q0Nfa3eiDcXKcrXPxyy73LLM/yqfdSpmLwRzRs/2PF8uLINVvRz3gaijdpcD7LCoWUYIdwqk2KmdB20pCAgb5iA8h21owEQnMBIYrjEEoS6NBMPVV2O3VOhQZWUHZl/N44Dx6Ok9fBYwHJT4xSRv4VGQK3+akO31wFWvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621447; c=relaxed/simple;
	bh=vVfNmKLReJIr6irlUJCgyzFE5CUHU9PZFq34vRHt61o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFgytaz0JxV02CdSyfdyzHlQAaf1ih2vqbVZm29cnzhh9ZR8+V4fUn2ZXJ483JPtk4MpsYHrDCKeCBOx4ZQdWQdTh7J50rPU/D3a8Y/KtaeQW6n7LFeOVOAmFXjQbnyoRv+CD1427eP/4AG611/okngaUgIjfEcS93WWO8zFTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0zPKTVj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so5035869b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621445; x=1765226245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YG0Pj+z2EKpXJyRhBzodicaoMUh26LjSMTkBpeRy1U=;
        b=L0zPKTVjhuzkpNKeLYw2eUUpSsF6J2SlCBhIjBLMDvqEtMszZme0B0dNbibvKZWaWn
         M2Xyw7yNW/y9ollBjpZgcisa+HX9dpme+1mh6ctEo8mYuJ1N2PZLXySvzWcuxZ9CrREQ
         +2nAfmzXzjOxqq7GT62gprVKJw0iR0TLSIv9dGqzwntnU1upE7Asv7sS5x/Re9/GoWse
         Ihm51PpC83JCH+RDETqfqCO7mb4BkanPDSQ3QBK7rT8Zoe8Zqki4RitMgLgpAVsq4pDS
         Z4MLmaBKYRrOXv3NpfsW5n8TZ9yWlUfBHh0wYrSFMmM+BtI5jPCmwbbh3G3CGwxcMi3K
         PMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621445; x=1765226245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YG0Pj+z2EKpXJyRhBzodicaoMUh26LjSMTkBpeRy1U=;
        b=CXafmVAKpsbYNnjbT34R7ZtVDPhDAdDOhLU5TlN60VipU3Gt57jIkkezVtgqii8MUm
         wWsgfnuA4X/TzbcPa0kb1Qae8124xyPQJGiQ2/A5amTjHZXVKk1IfuOZ8Ow1a8edhh8C
         ZOEdjzg8AO7YGcmp3868ECuCFPvlXfTIb0qCYuUaRm3zpkNn8HZ5liIXIacGNyy84BSG
         9W97/jY0l3XL8y84AYtZtb1bgjjf8qLWqICsgr02tm1t8ee48KohuxIPwxASc4AIB+Oy
         am3AUQhK0ZkvEtwkODJaB5Ab49Xl2rYeLo5IeINV+EGTGcYsNqnePxIxRcTH8kdZlePP
         XDYQ==
X-Gm-Message-State: AOJu0YzC9v8CCwAZqyih56ewBTbGFLuJgwqBgRRc72qwSXoyHh226FHX
	HVs8WegxBIpvifaLhF+FS7+/FgFH9kHePee4UgTyiUG6AIfu0EC64/ZG
X-Gm-Gg: ASbGncvnp9fwwqj0IU2yD3IShqhs1QtIw7OUwbi+g8qy+NnIyj55gHy2nSv1FwAyKnS
	ON35rqNu5dyyhB34MXBS4bR+r1Nimal1mkFndpUU1H8FMU15FZDt5/6w7WQhZ5Tn6loAFmy0FYT
	9lmHyiIJtFIA1YBv4f4g2Ge2ufaM8iHgZdiI8KAEMJYEE+qz2Trezf66F80A38O4AcAkU0kmysK
	i6KF5s4HLED13sBlwS6PMmiXwKlUTBJ3j/32P0RZAmO6bs0BkBvKV6968fmm9BkRN560C78xxJS
	oqXlmDl3GIj4xJU4nbkX7TNnZQ7VbEfwp4ioh8ZA4qYN3vVL/Z5MJoe7o6TWABT1wpo/rHyp1od
	z2NxwqEPuwpmxLOQtJ1h8haOQF8dgXCfxE7bVs36YgO8XVjdUrXgkPABt7ZgIAaRVaNBydiXPdN
	ccF3pHMITBbeTH90iYF5dEzhBhvs+LVmRAvoA=
X-Google-Smtp-Source: AGHT+IGAwif/XA27nFNIUswvTaFJ8lE0FRoQzMPjwLoR6UR1PITdFn89NrHKtlo6fdOYcbELASwJkg==
X-Received: by 2002:a05:6a20:a107:b0:350:ee00:3cc1 with SMTP id adf61e73a8af0-36150f05d99mr45878699637.30.1764621445196;
        Mon, 01 Dec 2025 12:37:25 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:24 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
Date: Tue,  2 Dec 2025 02:07:09 +0530
Message-ID: <20251201203715.17768-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on addressing various coding style issues in
the dummy_hcd USB gadget driver. The changes includes adding relevant
comments, improving readability, and ensuring consistency with kernel
coding conventions.

Clint George (6):
  usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
  usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
  usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
  usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
  usb: gadget: dummy_hcd: remove unnecessary parentheses
  usb: gadget: dummy_hcd: move function braces

 drivers/usb/gadget/udc/dummy_hcd.c | 52 ++++++++++++------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

---

Testing:
- Ran compiler testing with no new warnings detected.
- Ensured the module builds and inserts cleanly without issues.
- Used Static Analysis tools to confirm no new issues were introduced.

Please review the changes and let me know if any modifications
or further testing of the module is required.

As part of my LKMP mentorship i have to complete 5 patches as a criteria
for graduation and thus have focused on working on such
beginner-friendly patches so that not only do i get the required number
of patches but also get familiar with the process of kernel
developement. Thus, while this patch series doesn't address the max_stream value
exceeding problem that triggers the BUG() API, i will take some time to
dig deeper and truly understand the problem and fix it and not just
paper-over the problem.

Again, i am very grateful for your feedback greg and alan to guide a
beginner like me. 

Thanks,
Clint

-- 
2.43.0


