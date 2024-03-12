Return-Path: <linux-usb+bounces-7846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC6878E4D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448F4283943
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C27D36135;
	Tue, 12 Mar 2024 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhf0KhAA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C610A12
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222976; cv=none; b=S1T7GHwD70+o7zea4mt65ldmQwiuXn7jysvHHkQqepKDgxHd7ChAsZFxyYjA2lI2KJ+IMDUxinRC0JZOjYL+WxtDKZ9eWNQL/Feb1kZvPyZ7Ictol/NhotaLFCeX5uvO6zFI9OUYryp/bKmm/CUNGBCKTguSdBnzyTKGJ9APVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222976; c=relaxed/simple;
	bh=Qmd829tBEpAWVSKXwD/N3AiyesDW51QaiorU9m2nPpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2OEBbQiFTcDPjQz/FfqqLkvt+RO2279CQHBN3ZA7+TKMl7dUM67IFO/ydFwxjkNYT5Uuhjc+4AJis1WYAf/PmkYWWoyU8fQcmVWaMKYiPw7aoGdn/iH9IQx88J+5UgbX3IIfYTyaLBWU/7ek1kyYwU4bNaORLu/YUkosb/UX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhf0KhAA; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a207059927so677480eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222973; x=1710827773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtEhjSgd58gdyLY2mZzSMHyzfy6VzyXbW9WqggfSxOM=;
        b=Nhf0KhAAYWg0XNdsyWslUFwWG/jK8OCI14HApr699Od2YlvJUpkspaa3mbeVwKP46V
         1DgCw3S5dd0y6zet2F0PJNd7YOCSM22UpviJ7KCrnu7UpH1SZr6180p0YDssNr3bvtFF
         VA68VsWy95vosnw4AwxeO4oGyGwQdb6HsDdMcGT/rSMkRH5nOTuvcwFWIzpTtChc2nk6
         2xWXIEQU7qfaNKRJ+sDD6/QEYBAVfm/ZkY5RLHu5jjMHgDofbLm63HzL2hEoRJeS4uNp
         /HdFsOET0AI+F9bVOHLAA0M6NjzTwaLqdlUZEOpiY46VfoJQAiw3wajbI4uVBfdFc3mf
         851w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222973; x=1710827773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtEhjSgd58gdyLY2mZzSMHyzfy6VzyXbW9WqggfSxOM=;
        b=aeFi1X6M81c3PV4nxhYfaW9wxeoC1Rw1ONSocf0nPpUYM3dK6O6CW+noTAEJZZuhs/
         xhLA0qyLcLPL86zKZxs8a9D6Y9B7vK5qo1OXBTm5MS+5bbA45hCmq01Zlrqqi0EoLtt3
         crKAbrNnhymxlZsPRB7jmDg+xzUocXUItimieXwnasIBLOavlTn28Lyj3Wj9UdYLAOzw
         +tlaSieFsjrJOeFZmK9Lis4npwHNUG8vm8r0BcPaPvbQqH9uVGXoVu/C1CV6iibnxi0I
         uFqLwDmTF6vyhtsnjIB4dRbW1gkJ4qOKJ0gTnjRm+aTmIcn6abjPDQBnWLrhnc2U415b
         wYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlSYawnC21SlU+n0Jwiaa/ZnIlXnR+iJ9OBiPAec5GgOIzUSjTDKSbhIxZNYycb4N3bez7Ucc+E4TsfDYLRYRVwft0D3PL9Lz+
X-Gm-Message-State: AOJu0YwBL85uDjYNDXE5T6DyhZUdCCz+E0+mZ7tFSFFBNGIc3btkN6yU
	YRxd/dCHOPud04epQWbqdzHTfIDPgVB0DtDpIssPvCoGl+M6/GQf
X-Google-Smtp-Source: AGHT+IEUmwiSrEXAm/3lCpf1rRd8/7HcVvqa18ri3GCjgdoXgpuI+GA3zK7AdrtxbwoZlK4opyxv5g==
X-Received: by 2002:a05:6871:520a:b0:21e:6669:c3b4 with SMTP id ht10-20020a056871520a00b0021e6669c3b4mr9917783oac.35.1710222973482;
        Mon, 11 Mar 2024 22:56:13 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:13 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 3/7] usb: misc: uss720: don't advertise PARPORT_MODE_PCSPP
Date: Mon, 11 Mar 2024 23:50:28 -0600
Message-ID: <20240312055350.205878-3-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index b00d92db5dfd..fadceb7ab34d 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -719,7 +719,7 @@ static int uss720_probe(struct usb_interface *intf,
 
 	priv->pp = pp;
 	pp->private_data = priv;
-	pp->modes = PARPORT_MODE_PCSPP | PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
+	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
 
 	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
 	set_1284_register(pp, 7, 0x00, GFP_KERNEL);
-- 
2.44.0


