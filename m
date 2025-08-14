Return-Path: <linux-usb+bounces-26872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75179B26BA5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 17:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7F251C82072
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E2723C503;
	Thu, 14 Aug 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S38PL8Sj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248F1C5486
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186698; cv=none; b=XVK6naaehHwLvAta7OI/+MUw2LJLMfSVkDEKg0lRdJYr/oIL6jmjsIu/mbeZCs0x9ZlaHii//uOoCK1y5qd9xfPbZwHaRxMkArWjFg6A+mQ9zP1qZgd4hESpfxdj2pkax7I/FrSVakh3Yvs9Nwaj/HgQBh+dqUjPjF7jybx9Uqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186698; c=relaxed/simple;
	bh=ccpaxkFbq+eq+BM6EEQpiCG61VpwCQw8W/UWs0/l4mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jR70uJp6UkTLlpFZYjgkN4C+SwEHLP+Uv3BHVZeqyySprkVqWY+70sIutMrgk7CNazEPDqj+Q5eSUd9vxexZ/gwwL4/j22oH/d0RWfxsQfWkv5UzAJ+vO9cyvlXOb2KaLyao3a6qxKSCHvXEd2E5SUG34qLdw22sbviLi4HmpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S38PL8Sj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b1098d1bbaso16227431cf.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755186695; x=1755791495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dJoj/sdB+jbBCR/HBtdwJDdNqkXNNMHd1PvG2Ogftc=;
        b=S38PL8SjdovUU+c/V/7/bmOwxUMkUG49g77l4noWmdPqEDC8jl9edleOa36tktUnY5
         ZBD7VuoS17/AA0CbXQGLxdg8Hi1kHBVdRQZtfllBSTFT9C0Q6imjaDSQhdhgrBGF0F8W
         nZtsEg2QBEaomYzHthC26CW4eQJsUnYRhUQwPh7uSVxfgvzKMG1qoNNVc2JNxc4cLkbY
         yfplDh01GyBvNp4tYDR/ANAyb7zl1FKcecmr/HYEnM7J+YyHBr1RA8Gs8XyUUUdlQQU2
         L+DqNnDPEjXmHmvLnuV2gkN383/K2kzWvkeAh6xaQoFYpc5ANGrUiXG+O9vdpgOW3UDP
         wJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186695; x=1755791495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dJoj/sdB+jbBCR/HBtdwJDdNqkXNNMHd1PvG2Ogftc=;
        b=v8PGJ8Vj6cJW4PJDI6neR6GxhNyIq7DMoEy0eUBuGsn+rPC7l7TrVkOlpgl1T89iFs
         d/nfWLQ6aguHCcAUTdO/FPfn1foE0QYqrNnlDSMIpPjYKZj7b9WAfjUxCNE2/sgMIU7Z
         hA7E3ttlGDAXgixzXoi4xZoDerpwlxWS8fkd9yBNdeT5LrcyS1rLFXD8Xv8sJe0Gdi3E
         3vWcDO5ZIPca0PIZy4tbeQ33RpWFYwdF+mYhXN5we+GXKT5pKFWwqoHfG18y3QjfRj+W
         UzITqULG6teodAurcYTR5xGCr3ew2fiBCLskkeAgjGzz31CtYKg5iYiZBsac5j9kmMJp
         XoEA==
X-Gm-Message-State: AOJu0YwTPMciRmni2rdY+t0rRJKXDxQViZzyBypCXZy3NyCiTu16JJK4
	hMNjRlnRsRv58YQ+TF2QY4dLFLWipPGSQY3ZMkcb2Ooi4Ya7JCXGG9rbhBSSKl7Rnp2sfj7uW50
	=
X-Gm-Gg: ASbGncsyPGf60bPxRAV+vY1zNill9MeVIXVLvnomvYozV2lyMaTIQ3k7lS99lgv9fEX
	+FZjix1rcRuyspPKVQb+5DhwiTS9nQc3MUySW01dqgT1se5FY/Qwtd15NZargVRm2wdhuKvWyEH
	2NpwmnarBU9QWQoP9+OW9COlWfsp6gYEVKKluH6msaZTxVWx4DM5Ns8fk+qWM0KO9/LpdKCGIkl
	z7g/CflVP9lEXyDppx5lzkjVvGnGfsFg0BR7sNufWUk0wPONMJ61HBcs+PKGgldxzsEsemAgCYf
	u37PlWiSqEVajOAT4HTrzDi759eb0BaYxLpY3zo4cjVKERTZUEV8Uo9J04rh9e4rBIcJXvALhYJ
	GF7ulPo9bcoa7Rc4khFcgWwCHq0Kw2hBMGRBohKSXijfK82aVz35k7b7i/R7qbh2Ju9IZW88GFa
	tGxMPsrU0la7gykcs=
X-Google-Smtp-Source: AGHT+IGAyuBErJ1H83GVdostMUk88Hftc4QJkbgpCux8YXL8b+E6zCseZ7E3wVCDl2p2OIPCywSuHw==
X-Received: by 2002:ac8:5a0d:0:b0:4b0:66a3:f13c with SMTP id d75a77b69052e-4b10bed5e59mr46842361cf.12.1755186694656;
        Thu, 14 Aug 2025 08:51:34 -0700 (PDT)
Received: from KAG-86297.KAGWERKS.LOCAL (static-108-44-230-106.clppva.fios.verizon.net. [108.44.230.106])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b09c11bf8bsm115981461cf.20.2025.08.14.08.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:51:34 -0700 (PDT)
From: raub camaioni <raubcameo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	raub camaioni <raubcameo@gmail.com>
Subject: [PATCH v3] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Date: Thu, 14 Aug 2025 11:50:51 -0400
Message-ID: <20250814155051.621614-1-raubcameo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fix is already present in f_ecm.c and was never
propagated to f_ncm.c

When creating multiple NCM ethernet devices
on a composite usb gadget device
each MAC address on the HOST side will be identical.
Having the same MAC on different network interfaces is bad.

This fix updates the MAC address inside the
ncm_strings_defs global during the ncm_bind call.
This ensures each device has a unique MAC.
In f_ecm.c ecm_string_defs is updated in the same way.

The defunct MAC assignment in ncm_alloc has been removed.

Signed-off-by: raub camaioni <raubcameo@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af3..186fbb9d0a3d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1463,6 +1463,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	ncm_opts->bound = true;
 
+	ncm_string_defs[1].s = ecm->ethaddr;
+
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
 	if (IS_ERR(us)) {
@@ -1771,7 +1773,6 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 		mutex_unlock(&opts->lock);
 		return ERR_PTR(-EINVAL);
 	}
-	ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
 
 	spin_lock_init(&ncm->lock);
 	ncm_reset_values(ncm);
-- 
2.34.1


