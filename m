Return-Path: <linux-usb+bounces-19481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C85A14DEF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 11:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A75318871DA
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214161FCCF8;
	Fri, 17 Jan 2025 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JIqU6EOU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF91FCFC6
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110988; cv=none; b=GCLra/eu1aCPjG3JJSmkC9rq1LQysfXKMAn+o+sB/1SU4PsaIdZqwfTfg+xqQpSoTEa+MpFsLQJPM3/uGFgYVfVVPEuMvTYtTNHYZtSsF9OEakcMOP8G0AqpEckkd2W1cEl5FlAMSUenCIEWNV++5YefFo+4LDWUaNU4DbMnVCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110988; c=relaxed/simple;
	bh=qjlIGTqDBykINB8OU7iguYXd8L55CCIEY1b5bRADeQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=thZkRQjFKrZYBe7ZFQ2e2T6TGBhwyCWNscbKVsYe0u7EI1R6uK8NLXXP8CmGie1BS7fYL7mtR6l2fZPZG0yBgIPelJ0S1KFQCPpIBc3mrKXxelsaUSZmLCObbTmJLUxriLcDenYVkPcsiO5nAKlXJJeHt4gwSmnIOvF8RIv5OAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JIqU6EOU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-304d760f12aso17493351fa.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 02:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737110985; x=1737715785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gof3B2QrsUQ6fSQMO8rzkU1YKLhayaXkWLb8+4pRTs=;
        b=JIqU6EOUJWrCvM75xtwYJ+VprvWb/z1WVbNvs3RitfgDoNjKE9E3lXnOvrSuZTdzow
         KGNCNRLzXYsrI3t6HBR25YhL2wWZugBAi7qqVZ9+Q+dnZetfkkSTdN/6kXo6/pSEpVCy
         90t/xn/7S/W65lsGyOCcw/RCItxelyjwipDMPZ50wjjIngD4EA//vqoiz5YENq0Fp/Cu
         EBR6yx6zXwHfhyopyyTC8uW6AWj594WDRAM6NIxK96jL4eYWOTafHcr6AP1CknDynswk
         3LGcYx9U0cmQpKn8G6PhnWqmqy0JAgNygXMExS3pJQUJ43mqHbhhbxT3gOeCxtQHTwGp
         RJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110985; x=1737715785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gof3B2QrsUQ6fSQMO8rzkU1YKLhayaXkWLb8+4pRTs=;
        b=QUQTd3PJpuhiVhpcBNCvL3rFM3oNlXTBupdjW3MiwHLfw125hLSHDzLaMw7okYPd1o
         q7YQCzkZqdngveW0HBKg1/abCPZssjEbdPHpgJJZp8cE1l7FkAJZVaTfSJDPcp2KS/qD
         eF96//61TfaqOBrWT9/1Y4zNdzBylxn+C5r9QKbF5VhWPeAWVlwpiXHccohitXguHmaT
         BejWsrnca4crfJv8pYRlD2cIhFnXPhxDZcAT7kT26cKWTsZ4pa0544UHxo0J1m/4hrld
         M2TpAAbuSM5Yij6LTvt7Kz5ujhMUBGFHBHg/nzpsj9fCCgtjSWzQGcweMvQxeOnIiCRA
         74dw==
X-Gm-Message-State: AOJu0YymmFewaNAPkU/m/PoEKdHEebirN1F36uVGLg+VbSgFwHPMr4cU
	hAx2Nc3IQPG354nvf6aZyoQsV8BSMwb+8jSJ17FVGOgw7rw2OnZhl5OLQlhoIiQ0OzFz4lvOQ6H
	fjcA=
X-Gm-Gg: ASbGncsdDm+U2MOyYJFI89oJBgfF195jcknWQ5ZkMyeTdhxBtG+FAit/QnM3LTDobmp
	xtKvdj+vJCUVDo4/lqafxY+rf9ZP//7AZzze5lOY4JAh+HFxSsw2J970rKFvHRqSJKofYasoopu
	CCBS4bmnZuB/FD0q2L9gbqciF/fZyF2JFZ5hTGS2R4Z8BweOGqcTtGc68aAF80dxGsjrdjE1ryL
	bY/BuA9p2OXw9WNRuZyZdAC3dLppBlH/ZViYGQsO2CMJpSUFR9DbLZTD4xj4bN+
X-Google-Smtp-Source: AGHT+IGRWj2eKLieNLG6aNNf0v1jIe2xyBjjOWnzSFf9I6JnKp3ZPMz1F1BFuOxSqid2OUuyOqhazg==
X-Received: by 2002:a2e:a26e:0:b0:306:12ad:8c7d with SMTP id 38308e7fff4ca-3072cb230demr5837651fa.31.1737110984738;
        Fri, 17 Jan 2025 02:49:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm3803321fa.27.2025.01.17.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:49:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] usb: typec: ucsi: continue rework of command interface
Date: Fri, 17 Jan 2025 12:49:40 +0200
Message-Id: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQ1imcC/x2MQQqAIBAAvyJ7Tkgrob4SHcTW2oMaLkUQ/b2l4
 zDMPMBYCRkm9UDFi5hKFjCNgrD7vKGmVRhsa4fWGKfPwKQTVjGhpOTzyjra6OIQxq53DqQ8Kka
 6/+u8vO8HcpfwemUAAAA=
X-Change-ID: 20250116-ucsi-merge-commands-f2f6f5c93466
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qjlIGTqDBykINB8OU7iguYXd8L55CCIEY1b5bRADeQk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnijXFpRAoOAdMFh4COojkV2u9JQMMDCW2wGfRn
 r7AJJy9JvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4o1xQAKCRCLPIo+Aiko
 1YNGB/44OxDk3QDnmx82I8BNz2c9YwhI9EIcYywwIX+S4gYV9gWvkYaa0rsUfwjSgjKo+z4xW2V
 hrxCfVJVRKlx4z7fPIT3fQLq+BAFLNNpJoW0xOYa+gu9+aaH16ERP96kOb4lEtqI9xzCxeKxP39
 3nBbss17cxvhU+MniI8/4o4YDo1nqebY4L0vC6HlGrM4eg6m33PEz2ndbqwt+qYDSnUT3qnb4q9
 D1DjmxPDhl6s5JWYy5Zecb/3OQUwCJSAWVPOQTjJGNOusAF7sm0AOp4Z6eaUtjV9s2ql4ysdlwP
 EDREp0Wx+u764PAnpZDvXkZUvnAzI+7UIajurV/nYmPyjE1/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There are cases when UCSI drivers either want to mangle UCSI commands or
its response or to completely emulate some of the commands in software.
Currently code to handle such situations is split between sync_control(),
read_cci() and read_message_in() callbacks.

Make sync_control() also return CCI and MESSAGE_IN data, simplifying
this kind of handling. This series reworks CCG driver and LG Gram
quirks. If the approach is considered to be acceptable, it will be used
to emulate AltMode support in the GLINK and Yoga C630 drivers: on these
platforms DisplayPort AltMode is handled via the non-UCSI messages,
however in the past reviewers suggested reusing UCSI displayport driver
and just emulate necessary commands (mostly GET_CURRENT_CAM).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      usb: typec: ucsi: return CCI and message from sync_control callback
      usb: typec: ucsi: ccg: move command quirks to ucsi_ccg_sync_control()
      usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()

 drivers/usb/typec/ucsi/ucsi.c      | 19 ++++++-----
 drivers/usb/typec/ucsi/ucsi.h      |  6 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c | 29 +++++------------
 drivers/usb/typec/ucsi/ucsi_ccg.c  | 67 ++++++++++++++++++--------------------
 4 files changed, 56 insertions(+), 65 deletions(-)
---
base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
change-id: 20250116-ucsi-merge-commands-f2f6f5c93466

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


