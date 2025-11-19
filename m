Return-Path: <linux-usb+bounces-30691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44757C6EBFD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E9D412E188
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E18361DD0;
	Wed, 19 Nov 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEjhKnib"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3653612F9
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557733; cv=none; b=MxDiKby7I0wrznHJwJcQrQ5nT/JXbT45+xH0fQDIXA5jHn/g32sX+cQvhNpkAAsXb1wTaxSRjvEA/XXWyJf29bR+swzgZPGWInV1F1ms7tvzeDphIj2D+UubLi277zYua2qtOK+/y6Q3wPWQG9ZaLp06MTpKGDz+R+j/u3g48rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557733; c=relaxed/simple;
	bh=YsL0AYnXumUBQnc+9fO+VM0kAJ6xf20Eqs0DtXKmmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZgUc4yu3iEc78/DFQvk4tdrY0Uh00YpqF7CsKHHiQW1I0PSvBBk8W2Ea8kuAOb0vgKo9zVOHe7fX0YWCKQKfASKplzgQVsjRiQnMqikuJtnApoY2M7oeYTPw2pcoziB1KPFG0mXHsq9dIMJKgfNFXoKhUOaLAp3f+oblk/iTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEjhKnib; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso3651684b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557730; x=1764162530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pka5H9kFUv1dmO5g3fWy4qDHiQHPo4xC/Gd1txKK28=;
        b=lEjhKnibs1+X6Rv7Rb0vP65Ci2kjmDupfTWJQIlSu/ukY5zHEH+odxUtRDnX0a5B5W
         XXZD6fR6XP48e8JozId62Q9d9CMZpP8TFoGgdHRBynPSpp9jc9vbJfAB0OHY5X6xq//G
         13PIcoQIodjOaXKB0AAUEPxISxUDDaecopfw6LXJgPN6npWCKd5Vz/4bOMUSUU90U/dO
         86yVqz1zNasRn1/LSr8Jpu/xQrojQIfvzbJTCpA85UeQQ8H78kJI4Blide5DJmJ2/tQJ
         EJd+Hyn6qT7LzSYZ7GJuvP9+5rNtcMQopYyPh4E8+bhRdPTg9BMg5vQExctrYkJSdhp5
         BGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557730; x=1764162530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pka5H9kFUv1dmO5g3fWy4qDHiQHPo4xC/Gd1txKK28=;
        b=ZC5oqOhloyES3s08sA0JNKRJAEgVxGtpmG3KaaihtST3uWzDQNISwEbvLlRAFTZe8E
         iW9mazc4JWwlYipg2RJBSOOkU/Lcq8WrusUAJgMpf1PYsqTQ6Xz3gBtSa1Rjgpcx2MnE
         xTxItoZSE25YqTCA0WpAd22LH3xFRg4/+xOno/2CRbW1lvGJqac0Ty/NWzgxK8DUWofG
         lFbZkkZHJVP+kXubjlg8UN4A30lXz4DCk0ytACpJ4lchgutnlEFU1/dGAT8V3XsJpQza
         qhrN7R6lo0l1Q5ZTILc5Q+DlqEsMd6vzOtkjXitA65z3TIlBJIVNQC0yIliONtpw6WGa
         XVqg==
X-Gm-Message-State: AOJu0YylaSiYeyYxsJto+xmBLP6P30dAH7t9Nm+yM7LrVUDOlxKiWd5/
	mCeIFKhY4k7qQKjYkYVStUg7CPiTKAmp7+wg4UMWOZ/4vb32dvR7WMZx
X-Gm-Gg: ASbGncv532ypZDmdXtelFGiDLz0GesyPHeFxgnoExdDSWYqzpkeFpoCF8ZUBqODMM+f
	lXFvJMNS3wzsvLS+QUQGyIbTiRtylEj+C43WqEtLNquBc7z4ihgTiN+huaAjCt3jfweF2LCBBl7
	1AabawuuNtvqKUWWLbM/tynMtQJrkDCNV96cTu7WRXoLmRuq8kGYpfFNla8r9d24h9YZKtJTYyF
	9STsDMpQQ/5/8cTYNSZsqGS1hZKPXP2PNBBFgSTARPrR5Kwj1RHC2wdgErX7kH121FnEI0Ldla1
	iGoGQjdIKN3zj65+KHPSxxpPdAeDPfNV2l8+Jp4N7hiplxmgFRRpbb7NUxuFH12d2TDw/+7eiiR
	358td4Rl4m37hPV69LWh1U6TKyWUE/sed/Hf2yhGnYrf0Zg9znemerHU2gAKZHBpezcARPhHKkO
	r64ffQfK5G9HhioftFdmG7jH+AKPCZ0wzKmrM=
X-Google-Smtp-Source: AGHT+IFeiPPsgMwUrz+NVNeZBdU0F9V3EQoZEFmmpjgoxxwzD29n/Cn3DjmHZDOpsNrUlI+ZWWVVtw==
X-Received: by 2002:a05:6a21:7e08:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-35f84c74952mr12399522637.55.1763557730359;
        Wed, 19 Nov 2025 05:08:50 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:50 -0800 (PST)
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
Subject: [PATCH 0/8] usb: gadget: dummy_hcd: coding style improvements and error handling change
Date: Wed, 19 Nov 2025 18:38:32 +0530
Message-ID: <20251119130840.14309-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on addressing various coding style issues in
the dummy_hcd USB gadget driver. The changes include simplifying error
handling by preventing kernel-space crashes, improving readability, and
ensuring consistency with kernel coding conventions.

Clint George (8):
  usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()
  usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with
    octal (0444)
  usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
  usb: gadget: dummy_hcd: fix block comments, blank lines and function
    braces
  usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
  usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
  usb: gadget: dummy_hcd: remove unnecessary 'else' after return
  usb: gadget: dummy_hcd: fix miscellaneous coding style warnings

 drivers/usb/gadget/udc/dummy_hcd.c | 139 ++++++++++++++---------------
 1 file changed, 67 insertions(+), 72 deletions(-)

-- 

Testing:
-  Verified dummy_hcd module loading and behavior by checking dmesg logs
for expected output.
- Ran compiler testing with no new warnings detected.
- Ensured the module builds and inserts cleanly without issues.
- Used Static Analysis tools to confirm no new issues were introduced.

Please review the changes and let me know if any modifications
or further testing of the module is required. 

Thanks,
Clint

2.43.0


