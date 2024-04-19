Return-Path: <linux-usb+bounces-9492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D018AB658
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 23:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7C581C212AE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 21:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F4C1311A5;
	Fri, 19 Apr 2024 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sHjgkPNT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAB7FBDA
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561457; cv=none; b=uScRZN08AiCfIbHZFngUdY/WsYsxowh0yJSxaWEnNTyAZdyQ2zMe4Fn1ROHVaN8Du8bctdJGbb6uEfx6gLkmJXoSrJVv54j0JSVfF9g5AQbPhdcvcYVol+66jQ7su68H50Cs63G7SaSBnXzI/3yAdiQR3Fq4WMS8LJEkRQXR0Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561457; c=relaxed/simple;
	bh=P0P2LNQRmDYCC/aEgFub9LeFI6oVcHO/6OlaFAuYLpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qc6zIcnz2pIWrLFmarmIrzQT8W9QWtIQSu3e5e//rS3MurH5AyM0oG0SSeNKKfSTulByBFoLs5yh7kQ2q9tEFSM6pEiRdvUIJ0mssIK6h/85s4KL+gU0HyoYlMQtXpVACSIAAYqKNDl4T1T7Bk7poGXDFtWCFpHMz5YlrTqBPD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sHjgkPNT; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6167463c60cso28859197b3.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 14:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713561455; x=1714166255; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+Cg+N/7bN9qoM+g/2vlu/SplO5LfLDY99wfjzIBp0k=;
        b=sHjgkPNTFSThpZGRNlrZv7HSNMBZWV9nErVh3B/UFixB1yfiiXryY8EbpAPNgqM/uL
         HO6FDxRPrXufZQ727IkEB/zjIU+PdYcnagxuXrufZQsahfRex8cAqN69qCoQw1zbq/64
         kRIco2ZdCXtFrOgvoSI5UpHwJP7acKEIc+e9eoWY1ESp5Gm2CfSUEp4Lx/mVZH94m52/
         dkZ3on5QC3qxBpIZydiLR2aOndLUV0ls8hyysrQPG0v6sjKo9ADAme/xzF78gqKbIXmE
         QwKfP6oB1N3owMuju1v4Qe2Kxi/SqCsFN3GrYgNu4+8F+9S00n0c+uYReueCbLDIwTWV
         sHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713561455; x=1714166255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+Cg+N/7bN9qoM+g/2vlu/SplO5LfLDY99wfjzIBp0k=;
        b=ZD4xUq1MV0pR/EK0bCgKqPQdD8lvfRBn2pnGdB9eeRFXd3XWpY/Cgwjg9FkjylNP2f
         lOjmendSbQ4mWDuUk6SmJ34iD5NnJsIzNOSuICndQCJt0rHd4pJeE8c3qFlAiGRAEB+I
         SbPxqNK6SrXa2slWtHlvTVQPaTiHjjxdFptheYaigtTaQKXOzaxnmQlN30TcyYnEHNS5
         hPaN2Irvus3IihPkEHl1A7EPAgG346qY42JpNOb/3Urq42e271zUPT/Zy+HpPkE5pfnJ
         QGvCci0PmRzP8ArS5mHR1XH9CWoTl/wlq7Hsnm0UhDIWNe+NgWbr6lMS4eAEy5OpWJvZ
         hmyw==
X-Forwarded-Encrypted: i=1; AJvYcCXU0n+o4clg6RxqGTydoKKqt8fcq+Fd+/M9aF0d6fSj1mTR/j+M3lEPpTrJN1Gy+8kO2ub3DpkLWV+/O6wzCEeMWNhu28D/khQo
X-Gm-Message-State: AOJu0YxFifSR1RH8xR/9Rpw91NB23FVEuRA1zkvO2oOUzLRQ0k3jMCo8
	0PrSKFl1sGpcz/we8MeEYo1LRCi7Cz4XP5gBGnUX3MEC3hYGGGi83Jb7rrsozw3rcOAqzostC9c
	Piw==
X-Google-Smtp-Source: AGHT+IEvG80FpBSTMrUyNa+jaRsdc9P1PtKc0Ymjy1JxePfxLENwQ1kn1BBI/itnoi5SmdtePMi9pOy1jYo=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a81:6e57:0:b0:61a:d420:3b57 with SMTP id
 j84-20020a816e57000000b0061ad4203b57mr873351ywc.0.1713561454867; Fri, 19 Apr
 2024 14:17:34 -0700 (PDT)
Date: Fri, 19 Apr 2024 21:16:49 +0000
In-Reply-To: <20240419211650.2657096-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240419211650.2657096-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240419211650.2657096-4-jthies@google.com>
Subject: [PATCH v1 3/4] usb: typec: ucsi: Delay alternate mode discovery
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Delay the ucsi_check_altmodes task to be inline with surrounding partner
tasks. This allows partner, cable and identity discovery to complete
before alternate mode registration. With that order, alternate mode
discovery can be used to indicate the ucsi driver has completed
discovery.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b8d56a443531f..cd4c3b7a5d989 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -963,7 +963,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 		con->rdo = con->status.request_data_obj;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
-		ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+		ucsi_partner_task(con, ucsi_check_altmodes, 30, HZ);
 		ucsi_partner_task(con, ucsi_register_partner_pdos, 1, HZ);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
@@ -1247,7 +1247,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	}
 
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
-		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
+		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
 
 out_unlock:
 	mutex_unlock(&con->lock);
-- 
2.44.0.769.g3c40516874-goog


