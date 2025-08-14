Return-Path: <linux-usb+bounces-26884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA3B26F35
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 20:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DA6AA66A3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B3A29D28F;
	Thu, 14 Aug 2025 18:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h6aaJ7XJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493223D7F8
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197107; cv=none; b=qM1eJcTRaZepAuGcqnL/SPTnCDsdSEwipEgxwPIL3ZnUBgmpswrlfroJQPHR7RHr5geNXElGvzkONGDFS9UEVwXAUUK3joaNBY3WM6XTW3Jn5vGHosqxwYG3XnDAR0AGk/oPZPhV4+56LFSzO3zhdTPZhGiL5BhMoFWYurf+z+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197107; c=relaxed/simple;
	bh=IIWLTCm4iM4o2ycYzWp3RSfJLjwCX7bGklc9T/Y3Grk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfPQmKv+G2ITg5n4Q28ANLPvs6mM1ncuatT/iFDC1UFIYbZxvc9mIh+IXHYsWeOZF22BN/drtseTM/ATAQhY80kuXHue/0EFaA/W0+s77zVltYVIPFfj2Ysz2Kz1CFX4T/UdwAHm3gf9LmANgQM+JTICTuQj+gOMM7QT05ZboEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h6aaJ7XJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7aea37cso167254166b.3
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197104; x=1755801904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgWNu/lsijOtg6th5ui9qnvyOY7w+iUxq5UAg/411GA=;
        b=h6aaJ7XJ7TrWfcHWSnnAY5AATbQNWFemFGrQtm0S2+mP7jwJ5bJS+TMCaptdh1n2F4
         D95jO+uhwHsUoQheh7FYKnDEVNBWnmTL895CXDIgeo+fMoPk0ECJISXOqZpF8uilWrdD
         U9/P0LmHxAit1cqb59q6Ow1KP1jMt6v8dvOLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197104; x=1755801904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgWNu/lsijOtg6th5ui9qnvyOY7w+iUxq5UAg/411GA=;
        b=kjl/3Dh+GWP8CMt1oMeSeaaTGsrnncMvSXUYo5QfZg1Up2vjFeMVoIoJyz/bAGAtLd
         t20r6CB86AjtNgbeOXMuk8skXMqVZYdqVw1P3iTAvbj7EBhsIq+gvM5/XO+VOPevMs8z
         rFP5CV3N2piR+BzaLUy9h1Y9d22TjI+tlOxgfhEILYLHYDIneoxszcjN508ebQd2C6ZG
         8HnlfLDRE0zaGTtWxH9EVSHA9hTBi02fftedeZF47sqFNbMe2KcB2ViCTtENt0NdTsJz
         wLNqEKhBbOZjxi81d68sBqCoxTUV6eP8T2o7OCJPnkRgcZ/ZEIs/xf+AviJLFYJT8y39
         R+SA==
X-Forwarded-Encrypted: i=1; AJvYcCW6lxXrqESBhcu3mDBlbfpWv/BufLT3wgo2UPKBHbcXyFcWtGuXTYjbU4mIB+8RbjCOmrO000ZQuHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrpFgwqpYeAUfvvg2MIhpyyyhaFIwXuAKkgfk46qnrNBuyLnFq
	mx0ewBS0Jtrx2xs3ORrYhPtets/N/kXxtcq9uDRtgW0HXJlug+8xe1p+4YM1OKhylA==
X-Gm-Gg: ASbGncv3ptBeBNje+LXtCP8lRSoYdQhJoV3s2FYuNp5Cx8Au4Uu2oUjobRZqE0JBm9i
	rvvQ/lqLJztf9JsntU/3x/oC94/U8r+9VaQ2JFYJVR4c0JKpwt3yoOW/xLBdJLG5XzrRiDr0IJZ
	m7bCJSOJnw1UreHtm/wRXDdp8SenfMBaj+chZWdccAvQ89Kcj1tE3oXh1gAx+Qb27jTXqPoF4xk
	/3I4AeJgM/iuhY71VehkcuVOrmiDBc14RYIFZ7h5xDjCP2iUa468SV0NgUdMJvoegorgROJMLcm
	uXK1E2RHIgp923WOLrvQQ7yFPudxeXOvjCz83PDgVzNaaswhYfUyeMzbzdCVeQhDtFbPhi9KfYq
	wZrydWsvhWvyNJFZBnkRsPBEhFmNZL0+44PFocbd9RuNQlm3d5FB8oJIPr+AQNz4KBz8aHBU2Vn
	IGqW3jh5yu7AB0
X-Google-Smtp-Source: AGHT+IG7W1HQOHW0+HQd1j2RDcUydykQcA+021giU1BAHPPN8iXToIIj0I2at9PJj19MrWet4LHEkA==
X-Received: by 2002:a17:906:7308:b0:ad8:a935:b908 with SMTP id a640c23a62f3a-afcb996e8d9mr387128866b.30.1755197104266;
        Thu, 14 Aug 2025 11:45:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 3/5] usb: typec: ucsi: Set alt_mode_override flag
Date: Thu, 14 Aug 2025 18:44:53 +0000
Message-ID: <20250814184455.723170-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5739ea2abdd1..5ba8b1bc874b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.51.0.rc0.215.g125493bb4a-goog


