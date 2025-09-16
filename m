Return-Path: <linux-usb+bounces-28139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF1B5904A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F204858C2
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C924828850D;
	Tue, 16 Sep 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ybSYsLBp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38D20E6F3
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010898; cv=none; b=XT/tzaS5bnZnhtILMnJRzIOhhDzAN2zB/gy3B+pshxGstAGozyjciyNbzGkeSQKTnOnrzeUp4/ts2JUmQKpSGAbgFppLGzxrzLThAhMhjrqOXQG630SW+v3SJh+TdeCCaucSYFORR74N4ys4Sh0fizzjK1MisXp4cHY4wPfxZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010898; c=relaxed/simple;
	bh=igBowHbVySS8/xIED1bBfHp9jhT6D8Dlc5QYdnIxemI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=r9eFochjHp8oieMcYbsf1KP1RoGi0QOE1svH4ex3mXaZw/kC6uMOsxXGKHJLEGwBIJ9H/osw100gXmw/ZdAAAYicypmgVXbC7L3Wkde/eTpIollGQL+YxA/ENcuG+XNVzyBeuc1p866DsNoTKCy+N+9wPDtBiSA24/WfA6ypAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ybSYsLBp; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-248d9301475so76813625ad.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758010896; x=1758615696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qevWpjrmJDOUG49KKW+Rqwgbi0ZKsNjqTf6b+uw3m1Q=;
        b=ybSYsLBptwerSPqKbJ9QHAqWqLGYgozY2vDLlWNvufohJTDi2lpXChCveDoYt8OkZv
         8pSckC57oEaRF3V0SlmiYgmWaV510gNF+pTKBc+G/hJlpo6gJteg54atWo3A6NrKf3eo
         SHDL5veVIjyWQvx5E/7PIuR+HAtK6pr04RKRt6ruXgztGyRLfzLblxFP795//PVVXX45
         TPt7G8+IgDLQaqcjxd+ReVhYAg2Dv1ZC9jezgthCITx01yvwXn41NhGc6AoUKdFFMgGY
         Jvq/zW2cuCsPmmvU1ZI37o502EC+zsGPASo8YBT2/HCyoEBnEEk2ak4C+2nAPrVrBay0
         J/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010896; x=1758615696;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qevWpjrmJDOUG49KKW+Rqwgbi0ZKsNjqTf6b+uw3m1Q=;
        b=a1+ged1AaEm3EMw1bUzOPpUkt2wKP4mmE2KdX2YmX4pKVwhpW8sXEXuvlPqVC4anet
         hyR5tyH9F2HD896i2pvq4PA2l/cyAxOq+PAV0m1vy2i+A8gGrFnrNR3FLqXMR6Q4K/tj
         lxpfLznMku5OPzDOX2b93uH6fjEd+CBRF6BznMJQgAEW9ZIYlWqHgf5Z+JcWBEaoOK7y
         riekJ64pDodlz6Bb/2tJMmWdSLcgOi4G2nQxFhjnF7Xd+cRDZKIWv1MSeSH+5oTG5Fws
         t6TcQyN9+I9kyy98SxXx5Nc1mi4y5i8FQWspL5BjQlk/CG+5KvkVYVm+IsBlGEkRxowz
         +6eA==
X-Gm-Message-State: AOJu0Yy2IFsM/Gb37ULiF81fpxisF5vNa994UF48t1i2A28hALvShRAL
	Vm4gEWxef0ck9KAT7glXZjmS9ppRPJ45h1gZqFAM5QopV3S02zEukHmE/pp6b63QzQGI6rSNSgZ
	4TYLt9Q==
X-Google-Smtp-Source: AGHT+IFvel9CU31L53CIMc1qeSjIKTGiCmn37+ks78QucyUW/LpgCyEp4S/ag96tAm+tptFANGYbjjZgJXQ=
X-Received: from pfbbn4.prod.google.com ([2002:a05:6a00:3244:b0:775:fbfd:750d])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7343:b0:243:aca2:e500
 with SMTP id adf61e73a8af0-2602c04a56fmr19800408637.29.1758010895998; Tue, 16
 Sep 2025 01:21:35 -0700 (PDT)
Date: Tue, 16 Sep 2025 16:21:31 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAweyWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Mz3aLUxJRKXXODJMNkU9MUQ5MkMyWg2oKi1LTMCrA50bG1tQB+GXw 7VwAAAA==
X-Change-Id: 20250916-ready-70b1c55d14b6
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758010894; l=1966;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=igBowHbVySS8/xIED1bBfHp9jhT6D8Dlc5QYdnIxemI=; b=D2bIGxYuFI4YVWTH82zzAOTvL2P5Ov2Rp87f9DIUJS0oqek1LtMinJchyaC8D0FrOTJMK3CMS
 ZecamcoTUl8A5azavL6S3CAaSQGIbQx9ZK1XYD+Zrzu/lzOyyUSksag
X-Mailer: b4 0.14.2
Message-ID: <20250916-ready-v1-0-4997bf277548@google.com>
Subject: [PATCH 0/6] usb: gadget: Refactor function drivers to use __free() cleanup
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	David Brownell <dbrownell@users.sourceforge.net>, Nam Cao <namcao@linutronix.de>, 
	Zack Rusin <zack.rusin@broadcom.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, John Keeping <jkeeping@inmusicbrands.com>, 
	Roy Luo <royluo@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"

Hello,

This patch series refactors the error-handling paths in the bind()
function for f_ncm, f_acm, f_ecm, and f_rndis drivers. 

The current, unified goto logic in these drivers is vulnerable to a null
pointer dereference. This is caused by the cleanup logic incorrectly
handling the stale usb_request pointer after a bind/unbind cycle. This
series fixes this issue by converting the drivers to use the modern
__free() scope-based cleanup mechanism.

Patches 1-2 are preparatory, adding the endpoint pointer to struct
usb_request and defining helpers for the __free() cleanup. The remaining
four patches use this new plumbing to refactor each driver.

Future work
-----------

1. Refactor usb_ep_free_request(), usb_ep_queue(), and usb_ep_dequeue()
   functions as the ep parameter becomes redudant.
2. Convert the remaining gadget function drivers to use the new __free()
   cleanup mechanism.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Kuen-Han Tsai (6):
      usb: gadget: Store endpoint pointer in usb_request
      usb: gadget: Introduce free_usb_request helper
      usb: gadget: f_ncm: Refactor bind path to use __free()
      usb: gadget: f_acm: Refactor bind path to use __free()
      usb: gadget: f_ecm: Refactor bind path to use __free()
      usb: gadget: f_rndis: Refactor bind path to use __free()

 drivers/usb/gadget/function/f_acm.c   | 42 ++++++++---------
 drivers/usb/gadget/function/f_ecm.c   | 48 +++++++++-----------
 drivers/usb/gadget/function/f_ncm.c   | 78 ++++++++++++++------------------
 drivers/usb/gadget/function/f_rndis.c | 85 +++++++++++++++--------------------
 drivers/usb/gadget/udc/core.c         |  3 ++
 include/linux/usb/gadget.h            | 25 +++++++++++
 6 files changed, 135 insertions(+), 146 deletions(-)
---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250916-ready-70b1c55d14b6

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


