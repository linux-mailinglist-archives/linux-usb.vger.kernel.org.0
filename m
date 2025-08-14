Return-Path: <linux-usb+bounces-26857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DFB26806
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F340E169C43
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67FF2FF669;
	Thu, 14 Aug 2025 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP/p1H2J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692C2FCBE1
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179175; cv=none; b=ZpLpN6yje3/2N3x07TpdIR6qKNrbliT2s36uVgnmHnU00G9PkWtbZuhH2UiJjiJNDdLAT+iEWYaB2Ohb9vYWwInw0oLrvFSV+l/MSZMhdOMhqUPduuMH/AHyd2+BPu9DLQNY+j4U8IsEFf7YKRfrsYQXXbS3WiknBuK0f+N77w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179175; c=relaxed/simple;
	bh=Ywfuuv9+ay7gVSNzIskmPosSNb+1TLTIRyceJCIAlQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h981BqOR66N/E4lYU8mbWw/2084g61I7Z9IjiqHgCDiJWRsWWCewBK+2fIokDpVlKekI4tDR11s5p+6O2+YSVYsGPruFZQOEqAq/FXIOxi9XR9iK45QkmIERLKUJjt7RjGxIRIyQxJYfL+a+Yh/Z3n4cwiPAoPPs9EoD6zBtzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP/p1H2J; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e87055e1b6so126117085a.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755179173; x=1755783973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pS0QSowuThOQGjemDW6PP6Dt8bNAm15PG0h0id2d4eA=;
        b=eP/p1H2JktLPHhABk2O4rojDShih736K+eozUuHlbGfI3+6rDVpgMnq0NTQSL6kBVU
         h5sUF+q+bs/pwznXV7x4k49wTxckCRbILGpHLu3Fb1rCFiLaUdBzOBhHt03m2Af/oNs4
         4OatdixlTwt1Q2UkDv0m1/qPWY17cHNMdumyf3QBXkPu3qqXQBV8tj3GhEXg8fC5aXGB
         Qz41lfXjwnqjqJ+KNHy0ZMNplCzHKhbviv73yn/YE0D9Fgis8KTRIRkzCRpIvfKoGkfj
         flMFLROXjWVQYeIuOneBRca/KpIEIK62W926d4QjaP/XCBXpY8xSYteM7NtsjwBEGtL9
         9e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179173; x=1755783973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS0QSowuThOQGjemDW6PP6Dt8bNAm15PG0h0id2d4eA=;
        b=xEls7hEU2wakJUBxK06/lZziTgBcL5oWcHMzT5BMic9mfmMv/YQwX2LGztUkpLAwXA
         oCtpIo8RFzii1C65VZHi8/a7zXQZ+PDWMfiwsnZHGtuoaMK/6GN5o/PUeXfuve8+jgAK
         q4loWh6vmfL0CIi8iC5sazlIJKMJzu35NsDEY5JpQ0LWXvyQFXiiEddwiQsbrko9J7i3
         TE/rCvsnLxlPWFKHgRx54eXleXiKBK0IvY6cmXBRP3wynGwmn1eOBTP6+Z8aobbAPqZ5
         IzGCx5LeBvLASW9/MAZRerzXuGq7el37MQQ3dWN//FyGjTpnSqYyAbrh9cfJG4ADtOA5
         vQgg==
X-Gm-Message-State: AOJu0YybzDOf2vTt8ERivHacO1N5ib7Dx9pN2JSnYcM63voAkqe2XNgk
	QVUCNhHipIpAnrx5AX96RyOehdcvFTmpsGi7wVdBByONzXIUsg5v5gcH
X-Gm-Gg: ASbGncuzoynuwJIRTdorx9i/HPIgb4aoO10CN2TCIkOPYm6Upzv+NcP0VdjcaZPuvGD
	7dx+xt/q/6oPhmaQxAGF1TiMSx3MwIl7YIrRoqve5S6SOx+M+FqRNGnN6koa8hW4jy1sJRKpsqd
	pNbdEFmibw/j9tqyRDtuz/FP2f0jGli/tajKCYVar4SMdmrlzXxoEwgv6hE2zuItLOc4YFOs4VQ
	4IEYPsY0c4nZ4NSpkVVwWT1Ay8MLwYiaJruOXbinWJD0pSEWJ8nnfxp0Lgw7bR9Zv6kC6D7vuZN
	3Sn7FiYmkoZ/T2ZNTx4IwqXQJ1hcldIlqETNTrM2ITJGd/z23bAC135Yu5moqnYx0GT5VmRPItC
	p2TIvjSvmaG/j2z/itdTlsuAXevfIMY7GMoheg9wLSaPhcHKDbI6hBFa5wSgnlGyRW9AIhGz/S/
	gHQtOHGfWDCCKhjPo=
X-Google-Smtp-Source: AGHT+IHf03eJVkj2g2I1QX8iDWvelEMuA0T9hjyNVGKXAXreWu2eHIXWl3P0MeGXUEyRFrQ7VRQ8Ig==
X-Received: by 2002:a05:620a:1791:b0:7e8:70b2:535a with SMTP id af79cd13be357-7e870b2a2f4mr467106485a.11.1755179172422;
        Thu, 14 Aug 2025 06:46:12 -0700 (PDT)
Received: from KAG-86297.KAGWERKS.LOCAL (static-108-44-230-106.clppva.fios.verizon.net. [108.44.230.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e8079cfcc9sm1596955585a.29.2025.08.14.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:46:11 -0700 (PDT)
From: raub camaioni <raubcameo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	raub camaioni <raubcameo@gmail.com>
Subject: [PATCH] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Date: Thu, 14 Aug 2025 09:46:09 -0400
Message-ID: <20250814134609.599023-1-raubcameo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fix is already present in f_ecm.c and was never propagated to f_ncm.c

When creating multiple NCM ethernet devices on a composite usb gadget device
each MAC address on the HOST side will be identical.
Having the same MAC on different network interfaces is bad.

This fix updates the MAC address inside the ncm_strings_defs global during the ncm_bind call.
This ensures each device has a unique MAC.
In f_ecm.c ecm_string_defs is updated in the same way.

The defunct MAC assignment in ncm_alloc has been removed.

Signed-off-by: raub camaioni <raubcameo@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af3..3164e75caa3b 100644
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


