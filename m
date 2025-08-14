Return-Path: <linux-usb+bounces-26878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6BB26D4A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 19:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DA23A0115
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 17:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228221F869E;
	Thu, 14 Aug 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6MK01vg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB551E3DDB
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755191517; cv=none; b=XrqlZI0WY5at9LpspOgTqq0ORcDcHtYpgmbA0o11EoqaLTi5tOp+4tZW3QLhsTZaVPvX736ik6Jm14HrOIDnAkStHMYXNJzds+u2kxvnKTlsl4BcXtdkwmv/NDqBB+LLXGzDrKnKbojs8PFdenvAZ6YId0m6Gr9iKQZM3ea+6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755191517; c=relaxed/simple;
	bh=gr4TL1/b1EwVDkwJWACXu71TcqlU0190LABfPYRAE/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqbGvP/qTsPi0genqowd8aeEVj/YR/4PgklJlZbXdKGt1iqwB/qe9SWGqeyrPnUYBmMkY5Gi3U6Oc2LXoe1OPKRIFdR2AcCgZT0VBEZ+KYgC8fpwAM1aV6CcpERMeT+0Fz7aqGtY15lb+M4/t91a3wrb6th501cGNjbY+BiSpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6MK01vg; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b109a95dddso15802311cf.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755191515; x=1755796315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dJgAQgix5WC7CQxRz16uQIjrnIMfTS0V9XDzYp/tzk=;
        b=d6MK01vgsZ/3rmnw/ArWeZ7sxlQGTr3UPpdAbaDzm43e3H17r2xkYs0nozjLlC04iv
         5iu1F5cKzXpUH6XVPztguNnWxdJnhrUTuO/5PXP9uNAmIeT434BG/8W9NvbLQ1+Kdt5u
         3t7uE7WzYixSD1Ma6qdckPB2+kLxjcRi0JuSV7tvIRfiQe9N3IMFB1c3JBrpknisyW+W
         SLdG8ZJmNYxGtjsYBcyJZZMkvkxdFfCSCXkI37zWEBD5RmIafKWeqfpL/r3Ug5IlggTW
         z4ZCkmfEaiNrAmzvl8lepPCfwMLBeFsOvtQR4Wwtkxc3mvu8uusyhY9ROebQ3Ud9bFK3
         gwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755191515; x=1755796315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dJgAQgix5WC7CQxRz16uQIjrnIMfTS0V9XDzYp/tzk=;
        b=e7kzja2J2uiBDjyX59bmgkFrotWSH2UGAeiC/ywDr/mFoQD/jrD8QYc3myx9jmxXez
         PoLLupU3UZn/667xM5ofvt/v+YEEXT1ZMsmfrEywo0fSGh7CrQPTygb++aOuJaENzIpL
         pTvnqOUEkkYD+gFYpmPSzfPiUlhrKnzAX1zCegMdChitYRH4WQUa4oFz1r//fQWqYRjG
         N+8RaYuk229svXfAbG+ZmrTBzwaep9Zq3eCx2Cw79Byf+TbKpB9YCHJzkZVD/AHA6mc+
         Mtqp6IkMSlGlx0MJXv1FfZz8dtwfTmrLsetZx8dN8LCb2BI+QPaoCBRAE2HBmfi3a6Dl
         ZLcg==
X-Gm-Message-State: AOJu0YzWH433BZhmpddmr1TqtJM+YpldurftI4vVPgwD6ffcQZgIiuKB
	TRpFqRB2MmkW9zMQnY1nCAGHFgCmK/b5eZlTWxxKnMWR5tKZfaiL68PY
X-Gm-Gg: ASbGnctaBWi5ccbfNlH63M6tTjyS/TVELWT9/LLz/Vz8qRPXHUM4HuXGGeM5CUOLpv8
	upel8wn061oJu4q6lqSbivXIR/Ft9HwR9jpQpIcUEZbRKGB4Y5xmhrOjIYp5IGJpj83Td1c2bwf
	tLVEkc7J1M92zAlxBdCSEF1UTcM3wP3H1OKFSLwd30NLKHMm9bufs0eX93M63EEAPhxOOuGpUyb
	J7gBF89ak6DHFf6bDVMK1PysFtKG0WZC5PoFrZbtVWxn0EE0++/wHbauW0s087ZcGbvPR4f60to
	tR20XOLSSoIpSzeol3Ge/t3gOX9C5Cla2vWb3RxkKyOBUDkNXIfxsHTNZKiKLIfEYQyQ+TdhtCT
	2CrlJO1h4236zQwW2Aa5LYeYGpgmKJPGfvVt7Y5PmMYCvSCSKCuXF/LsgAtcTbL6Y5qR0Dso1QE
	67x14zs6aLzCePlDU=
X-Google-Smtp-Source: AGHT+IFKV+WLf4Qt0xkN1UFpdPmb5vd/loXkGkYM/y1QEOXI5gIKAHYi2Ld2NHHlaAhnb92TYEkLYQ==
X-Received: by 2002:ad4:5945:0:b0:709:6278:4f73 with SMTP id 6a1803df08f44-70ae6d3729amr54728736d6.9.1755191514874;
        Thu, 14 Aug 2025 10:11:54 -0700 (PDT)
Received: from KAG-86297.KAGWERKS.LOCAL (static-108-44-230-106.clppva.fios.verizon.net. [108.44.230.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6ce563csm15322596d6.33.2025.08.14.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 10:11:54 -0700 (PDT)
From: raub camaioni <raubcameo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	raub camaioni <raubcameo@gmail.com>
Subject: [PATCH v3] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Date: Thu, 14 Aug 2025 13:08:20 -0400
Message-ID: <20250814171125.635429-1-raubcameo@gmail.com>
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
V2 -> V3: Whitespace and line length style errors
V1 -> V2: From and Signed-off set to be identical

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


