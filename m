Return-Path: <linux-usb+bounces-6181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10395850020
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 23:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420EF1C227DB
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 22:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C20653;
	Fri,  9 Feb 2024 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GByAOdzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0524A18
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518308; cv=none; b=o4OXejiyJbApJ4CfKCrMetISYMh3EE563JDbJIG7fZvn2FNmkN7kCROUhGbzPUGX7QAbycGy2n1YIFvEvGzhDNfWwiHZ/rcYcuNKfshqFwq75Mo4fyCd9sVP0Tjj0n4L7569m8RPszEmOKsrf+8ZSIdtRJBHMmhU2BCp4axDrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518308; c=relaxed/simple;
	bh=CneQkxAM2XFwm/rlwWTx78xUpKNPxGdJmojiYb4Db4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IhjiVMC0qhUxH0yjbFap9tH1Vnwdf5hGzDSw0aa1WrjFlJoGf6yaW8CDuYrN1M6wyx+/whzJZR+UVpxluA08a657LxRqKf9ZQs9UZ/z7G17lF4psi7jCKRvn2Ui8TX/dxRFtCtktiSdbuQd5aJoQa8E+YvcpAr3tUBKIWwZb9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GByAOdzw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7881b1843so13514535ad.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 14:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707518306; x=1708123106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BA088edQE9MyZoucoNS82KLHl0uttqfXtdVNBUsV2lw=;
        b=GByAOdzwmthaDqZUTnExg+oy8CofOA2jJJjgTazwDHYgPiFwALA1OZGs0/Ftr2VfdV
         88FgIKXL+JsDo2X1eIjhOJ1uyq00IosBYNnK1WKvCGuNj1eWl/X0TxsHOjeGSiFSVNQ0
         hAnuIOhhzFVAVHLDy5ySXZRgS7Poo/KZTaYsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518306; x=1708123106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA088edQE9MyZoucoNS82KLHl0uttqfXtdVNBUsV2lw=;
        b=WPG9PUPR8HM4WUILgTDTd7xZ/eO2eX1NgUOM/LGavv/vkPdJO+EXrYRs0oMOiwm1/N
         k3LqavCv9LMYCKAk5f77oGJl9+C1Jg3VDC4WxwsaqRZIfHJgEvdfOPoNpzjw0Za7N5M4
         hTYwY32R0UA19BWRZCf39I+QTCmM6AEl8gvLf4BngpNfBr491vGj1b6dBwbZk2Fp/Gh7
         N/zrGyUIZaWW7TmWpuQOOjT0wGEOWRGLiil6QfXAeZ7Rbkr5Hs1VQ+hvFQdortCYiQ9Z
         dH2h8E2tpAngrXr95rCVTEJuc/NLmSLubKoE9FJzt0xBZDo8EAwcf4bCW99cG7pkO0kZ
         BkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWHhqnnB1eoh1ty0rYXModY4i0Uv87qVYorDs+ZXM8/DqwhRy0Of8avxqh7frZ9lWW2/sPaBNzu7dMv/b9RlH768kOGPwY0yELR
X-Gm-Message-State: AOJu0YwDfU/k8e5yMevGJdQkuvPpzo7x26kkRve/eFVczN5ABj1IeTIR
	cBRza3vkFRJJ1hK/oVFqxlC2dHoU8inY6OaGl9lyGynP5nSOYgukgd8XtgpvEg==
X-Google-Smtp-Source: AGHT+IEA3550bJ+etF7eGHcMPiX34Guc3JFJMpIfWrFe4F00ei6dA1OBzcWR24+np1q6tAbPxeq/uA==
X-Received: by 2002:a17:902:e9c4:b0:1d9:c367:205d with SMTP id 4-20020a170902e9c400b001d9c367205dmr673735plk.53.1707518305843;
        Fri, 09 Feb 2024 14:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNwf5J35fIQTKYNTgsrUnV7uFWXD9RJWfJMZKiwwVifVxjnQQpf2B+juXGvKo8dQhfYRmHkq7P0oVE9Zg03BproOfY9UzECgRnn7cO4uHIpf9ZvjJFQ0nFbs9P38ArSbagR9XTYHkipPRprWto9ValfkEMoc58O49ZJJwJRwGgRtg6PIPviL7TCYs9+yIfabxavBugXRoVTKVzVxKubOtDXose1e7A4YjueEERXqS7XYFdrcYbSCGv35aMHDEVwzxS4tsnmyB1gND6dd9/CMBDIm2PNXDqQKFysgAY+QmbLxLmTiqtZ0eJAwooohkpTE+XEnjJL3TPOjzBd2T4x9RUFbVVhJFo9h0Pt8WUpi44S5FEemoHhwgT+STjIT6EpdasfwjzLtYT02VLRhTWOEn+YKn1K8n32eN/Jt1S+iuHky3uaXlcvyiIqmm/n1aPCrLrqZjLTTqhuSAeORFng5k=
Received: from localhost (209.148.168.34.bc.googleusercontent.com. [34.168.148.209])
        by smtp.gmail.com with UTF8SMTPSA id jc9-20020a17090325c900b001d9f4c562b2sm1990156plb.23.2024.02.09.14.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:38:25 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Cc: pmalani@chromium.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
Date: Fri,  9 Feb 2024 14:37:29 -0800
Message-ID: <20240209223824.622869-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Heikki,

This series starts the work adding UCSI 3.0 support to the UCSI driver.

There's a couple of pieces to start here:
* Add version checks and limit read size on 1.2.
* Update Connector Status and Connector Capability structures.
* Expose Partner PD revision from Capability data.

These were tested against on a 6.6 kernel running a usermode PPM against
a Realtek Evaluation board.

One additional note: there are a lot more unaligned fields in UCSI now
and the struct definitions are getting a bit out of hand. We can discuss
alternate mechanisms for defining these structs in the patch that
changes these structures.

Thanks,
Abhishek

Changes in v5:
  - Change min_t to clamp

Changes in v4:
  - Added missing Tested-By tags from v1 and reviewed-by tags.
  - Fix BCD translation of PD Major Rev
  - Replace IS_MIN_VERSION macro and just compare version directly.

Changes in v3:
  - Change include to asm/unaligned.h and reorder include.

Changes in v2:
  - Changed log message to DEBUG
  - Formatting changes and update macro to use brackets.
  - Fix incorrect guard condition when checking connector capability.

Abhishek Pandit-Subedi (3):
  usb: typec: ucsi: Limit read size on v1.2
  usb: typec: ucsi: Update connector cap and status
  usb: typec: ucsi: Get PD revision for partner

 drivers/usb/typec/ucsi/ucsi.c | 49 +++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 67 ++++++++++++++++++++++++++++++++---
 2 files changed, 110 insertions(+), 6 deletions(-)

-- 
2.43.0.687.g38aa6559b0-goog


