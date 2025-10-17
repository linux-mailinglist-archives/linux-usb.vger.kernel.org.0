Return-Path: <linux-usb+bounces-29389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D9BE5D78
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 01:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F283AA3AB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 23:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01A2E9EA4;
	Thu, 16 Oct 2025 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ccep93lD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BB2E889C
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659158; cv=none; b=XVxEIqtry6h8O2vzYAoYLevVbAB3jKYVEIAyNrRQ+NkjURvp3IIGUNZaH9Bngqc+IqC3G3CdzBnDcyghMLi7OQISJB+c1W4nPycRRmx8pzkxBSKQLFD7nMuVRr+kAmLbnMGDPBcPtkafeHtU0/fcIDOyYhFAMMSvT98cciS/1gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659158; c=relaxed/simple;
	bh=cVcXBVu0k1e2ZRGGGJ4RUhqAr8gGPi6p8pLo82SXQ14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GxHwZuvOXBfEBuTMRfdv1DyY/9uB5tFykGpcW1BNBBSeb21Lv8h93sGVEuTZITg3pWsyYpyFsKlkS0EMwNw0rdFMy2B1+7bM3uPCnIO1C66dhZWd8dXjOIhbvwN4pU5kd6ZVThnxlVhYmo/O7dGGaMumW8NihECA2FkcNR2ESxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ccep93lD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso3016559a91.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 16:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760659156; x=1761263956; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eqtzN3u7r+YLYm+sK/X2sT3wcYKU5XU4zGVHMnL2rk8=;
        b=Ccep93lDRJnQiFPpREkcH9twaXLS8KEc9q8O8s7cDLRqIFM78PXMo98tJISo/lqxwc
         M5+zGuMHgydwkEoqRQ2nKbfUC1C78Y/s4Le5YIxAixcrjkawsBKTsF2mK/f1kL6r5KOs
         4OYKCPK9cN6fCSt3wGhYZisXNAqmeIWCQMoB6GkVSt/Jl9Ibg1/y3TKYNIO27tDWVmOG
         fBA4pY8SM9kz6wO5it0tabg4vgVjDvCpOYtSymQxnMlkfemhWMrLrkUoKD/OF6Z+zuWL
         ShoG8V9r/2avnv7AANwOitqZkVNLNXOhMgrng73rqoaV40bTDdSJpIQ+5dHg2Ppl2TZA
         s/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659156; x=1761263956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqtzN3u7r+YLYm+sK/X2sT3wcYKU5XU4zGVHMnL2rk8=;
        b=d3E9nNLFtfpYEhck+NAMgHyfpOW+alqcyP18mIn/Ez02GAJ9zU0J6JNw+0MDfvu4mv
         yivXMAADllB/5XW7eXCW6BBwhWB5pB3TmXZL2R11AzecT+vrlFNYts5x6J49fPZasx0d
         PDwJZNE1hj1YV2g5HvtGoeEpg1vL9uyzRWAoVx3LVTeaDN1evK4YDaMU3f02SAh6Dwx5
         4xinTfGSsDFyhIfnEkdF2uHHJVivZ8DY4VWyWF7XVPrFED9q+B05BuKx6H3Awhp8rhQ6
         7zJkIb2dx7lEzzHQD0kmedmk1Jl8SKh6CqX79kqFPB8YpLoHwThkWGsmO+IAFmdXvnwv
         +VWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMB/TAIziYFEjEvzf9Fa2Wb6BcjcrXLu7N2JsmRT3OwYs4F20sXo6q7HiKUt0hzx2D/qSfT4HqmnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVsDLuj5607DXYxmCL8vTFsQQmTipZhUyB4rc+rLaTx8UDulZ
	XS3Kgl4RW7aP/0PwS/upN04g7o9vKlCJdlcvztZjjv1Nw4gpbvgrE3ur74/nzXGRJ3dJLSn42Bz
	GZUt8kQ==
X-Google-Smtp-Source: AGHT+IHtcbdwP9Wxf0JSNuqCWmvroXZg4RbHOg6ahPle404TYQoEdJxSL7fw+8XsYpRsjXT5w4FJSGoxoa4=
X-Received: from pjbsc12.prod.google.com ([2002:a17:90b:510c:b0:33b:9db7:e905])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cf:b0:329:d8d2:3602
 with SMTP id 98e67ed59e1d1-33bcf8f9c49mr2193375a91.17.1760659156328; Thu, 16
 Oct 2025 16:59:16 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:59:08 +0000
In-Reply-To: <20251016235909.2092917-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016235909.2092917-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016235909.2092917-3-jthies@google.com>
Subject: [PATCH v2 2/3] usb: typec: ucsi: Report power supply changes on power
 opmode changes
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, kenny@panix.com, 
	linux-pm@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Report opmode changes from the PPM to the power supply class by calling
ucsi_port_psy_changed(). If the current opmode is USB PD, do not call
ucsi_port_psy_changed(). The power supply class will be updated after
requesting partner source PDOs.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..7b718049d0d1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1022,14 +1022,17 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_1_5A);
+		ucsi_port_psy_changed(con);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_3_0A);
+		ucsi_port_psy_changed(con);
 		break;
 	default:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_USB);
+		ucsi_port_psy_changed(con);
 		break;
 	}
 }
-- 
2.51.0.858.gf9c4a03a3a-goog


