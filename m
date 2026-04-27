Return-Path: <linux-usb+bounces-36542-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMv9Ofll72kIBAEAu9opvQ
	(envelope-from <linux-usb+bounces-36542-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 15:34:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796B47382E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 15:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C46C3043D16
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C828C3CBE91;
	Mon, 27 Apr 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kctUcvnO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80B3C7E1E
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296685; cv=none; b=cftNrM2AEep5SOP9Vg9I6W9bHx4Xv6T3I0Qp5L6xDT4shX95QFy4oNhvRdNRdfPnlEBNt0AQfER96IhS7bLclYIlVzeuuodj0wDCbaSKoC7XQK9lGIZoakI3o6ysrB8Gf9XjylQZw68vJ1bxia3fti4Zvr4i35SDqI/uacmsHSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296685; c=relaxed/simple;
	bh=iC4+ZkY03M5gg8goq8d1wfEoqcLzW2wBz06MOjrRHdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxRo51mIC7L0tUSFh69KC0FUrQ0cj+FQLk9yLo0gSkTMCKpch15KsrUmZ1ndOXSoWgbDyPWsKvFjEfuLsI0kYFGzs3xgYg80f+jl5l+mR7b2bkGDo+eIRm521yAcuu0WTXsRhqi+6MbYdTrPBEI/VOrhpTPJC2CdLPqGBH5zaH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kctUcvnO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so8473924a91.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296683; x=1777901483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItUvJaUZi7auBuoRsMIotXuMOJtpxcTrtyLZSnWiKzo=;
        b=kctUcvnOCPZp7aI++oF2ayXJIbptkk0TShr/fWoxPBdXHKZn79HVtY8/dG3h44IiMH
         Yjp29r0sI9CgguawegfLkwUTy1OxPz1kUmW3p0ys22bauTWU3vxrNAGWmW/WpnykR39n
         Ld0BgG35N7rkiwpSAamcQre+zPhD2CBrNooTGJ0TdSw7iRbynpDM8Sy6biBI6a7pnNeC
         55aeo+rRbCTQfns/Ht1Ir4ktxHYg9HXirJYZQ/iryn0tLIApLmsO0s4npShetSNIs6+n
         5Rgd1v5RuAA+GliCwf9TPu9pl2vlXq7NsUvZU2a+ywJnBJd8R/QhKfYqf3WLeaAX4Lpj
         8rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296683; x=1777901483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItUvJaUZi7auBuoRsMIotXuMOJtpxcTrtyLZSnWiKzo=;
        b=HB9kn935ftJAU7+pKR5Z3K6iUkuCcOtORuIOPAPHa9x5zXApf/knjBm135Q5/vqUOM
         WB2tnRu0G7SrVg53zMuadB07KHVRzhL8u5HHbBS83PHCDk+Do4b9XaUtXNzE1C9py8p5
         RWcurTAVMXoiSSGoOnHFvml1R02yNH1224SFOpzOXjEh7Bc9J1vij3Amkq1L3xyHKKyT
         NRpNfKJwg4FB5x7mWt4j7y8lMRxV6dUYOV9/BmmDvU18xIQXkWbYsBHKhI4LnQvT7qmv
         3bxOlN/N/Dtr+YVvb/QmDSnLpHTV+GzjcCCnIkgDfW4BcqX5+ph/wYtUgIjUcVCvJ+6u
         TCIg==
X-Forwarded-Encrypted: i=1; AFNElJ8umPobsHJMq349/ESkQHuDpzqIQuFIBxFnDI17QvFtD87QwZ91euUcFCESfWYpugKKcHf/vqcwED0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztZ7IdwWOkhuuvC/dZMJgM3aSK0tfPXAmm3Lxn3IENs+z/SoCZ
	MI/hg3Ib2JaGtqWmUnAnpwSeVJksYrYmt2keqxyLSvGEX3SdHcXVth3k
X-Gm-Gg: AeBDieuyn0PxetGW7Ae3q65kRK1zNH+WRpyxvdWDKmfC45ZcMe1v9SrE6K+0cZpk8P6
	zTgkWAx4vEWlFRA0UrP8O46Xww0zcQ9XfHmZVN0IBw5oQtF5ewHAZ7n3SaHcmUM52Rx8eIjU4Sj
	tZKZ09zka1udHY0tcLuRqbB5igCoHQoDO+aHKjVXmHqiJVdgb1Zhgy8c18s8x02GR3VuOhe7//x
	lEEmIzJb3L9RiDEiXxsHOx5bj2kK2idzRliC3TVVQSO28yX4G4rqmuS11mt8vcBMLBT22MUl5j8
	vj0SV/7/xio0499tP4CEjbDlv1QRU/yqIRlnLx+S1XgT3PUINAnJdR7LEpwVb084sYm1oZMI2cE
	kgMxpV5lkeLrY9KJq0exJurm2q/c08AVCILBvxeH1vC50UyYfwCewKA0Q2VqJ3GZko34Bw0J/e1
	yW3rnF1O0RK726aKCtGGnAcJuoLyM1jk9zcBk=
X-Received: by 2002:a17:90b:3f4d:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-36140468b12mr45769609a91.13.1777296683517;
        Mon, 27 Apr 2026 06:31:23 -0700 (PDT)
Received: from lgs.. ([2408:8418:1110:2369:396b:2f7b:1535:e7cf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1bc9sm11812298a91.10.2026.04.27.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:31:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Evgeny Novikov <novikov@ispras.ru>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] usb: gadget: net2280: Fix double free in probe error path
Date: Mon, 27 Apr 2026 21:31:07 +0800
Message-ID: <20260427133107.334429-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6796B47382E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36542-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,iscas.ac.cn,ispras.ru,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

usb_initialize_gadget() installs gadget_release() as the release
callback for the embedded gadget device.  The struct net2280 instance is
therefore released through gadget_release() when the gadget device's last
reference is dropped.

The probe error path calls net2280_remove(), which tears down the
partially initialized device and drops the gadget reference with
usb_put_gadget().  Calling kfree(dev) afterwards can free the same object
again.

Drop the explicit kfree() and let the gadget device release callback
handle the final free. This issue was found by a static analysis tool
I am developing.

Fixes: 2468c877da42 ("usb: gadget: net2280: fix memory leak on probe error handling paths")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/gadget/udc/net2280.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index d02765bd49ce..90d678e6714f 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3792,7 +3792,6 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 done:
 	if (dev) {
 		net2280_remove(pdev);
-		kfree(dev);
 	}
 	return retval;
 }
-- 
2.43.0


