Return-Path: <linux-usb+bounces-26457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D458CB19E34
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A363BB12B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0552D2459DC;
	Mon,  4 Aug 2025 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ImkirbJN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE41244681
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298266; cv=none; b=swrH2M1rl5nNvKW+dm0zQk9rAWi9rRofX4En1x8zahmJ3R+i3dJDrVnpbnnu8f3A7l3uw4bd5J4dU7/0d7dd+fotB3ZquhBiy62Tsk3cVCgcNGV39NWkgEztfh5VTbWHZyqcZ86k+C1XN/GwjoOAxSz04TiVs9VlDmGmMXo9bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298266; c=relaxed/simple;
	bh=ud242vZvLJrH6xopdOSJSplgPyMO56QkORuiEVdjqaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3lLIeNoCaWBO5y0SRb6VQ6lI3AHkzkyqAWwBosTyDj7sfGwupQwByk2mcx0HGx+SVZhXgolErBC8sfQZonMo2pfbJorsme/Qq6X7y1l/FCiC3kha0EU1edQSUwCxY3G9xrCTfnySZ3PgrfhEg5WrrCatqkUJvfqv1onRCXrgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ImkirbJN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso5721861a12.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298263; x=1754903063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHnJVEZKYStNja74J0DOKbp6uiLWBK5/zflpDmAO16o=;
        b=ImkirbJN92IMT6tsK54LdlfJu4E6tts24A0lLR1npks2fTb6EQZjPy21ZZC1mg2igv
         qeUPlw8b3Q4X+5Z8+l9DkDzOxb91UkBuMNCx+2SYTEPLD1nD20udcDSoVnZgVd+Hkork
         dgwmEx9DzcMsZqByOwReefJD/K01Dey/FkhMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298263; x=1754903063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHnJVEZKYStNja74J0DOKbp6uiLWBK5/zflpDmAO16o=;
        b=aJ1/BCFbP+6ICHg3xYKV4gkRJnwKgGFEXN6zwnKvoyf5jeibITpZ/RpMoW18ku5kYZ
         IOLe6IAsoND/fVnZR9yy3u9tPNHmaTKqWAXGc38cLPg4pq2XNWLgAsHzzmZmRleHFibS
         hjzq6oY48qa4lSQCS49XVWd2dfE5xUmZi5Ki1rpF/R8V6vSH0U6xXwzaxsKYk1PrKIEU
         uknN9X37hVFFdI4zcC1WWqz5Zd2GE5x8Us9j45T5+ay/8IwDRaiOCp7eANx0oqilf6/I
         Tu8eALv/RVfndFhIItW41JgGGvGGvO1VJwN91Ho0sjaydPc6YYHOZ0+k3eFW1UA3ciuF
         pTXw==
X-Forwarded-Encrypted: i=1; AJvYcCUxSIEh7xpn51+YJ6seKSGSIdhzgnEIUR+IqacVrnE2kymgYmUZdMwjZiybCWltXVOYWggAy80jWyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFjDF5PdhQuCOhhKxT2gkD7ODXmDVsnWD5lVp7j39mTuBstEl
	QjNsRY0/ju9eqmsH5EiDWChxG+CrNf+TcgJoo7idl6Huq65h28qRgSYaTbx05WluXQ==
X-Gm-Gg: ASbGncu1KCXX0tsyZETdymThLE+q16ecZyVv57otLdLVmf+XApNBE+ZmGY5vLIdEbYt
	TWsA7iwyp0Sdj0CXU5vp6bGHqkK1mDdXuFRT110+Xpf6xVY+s6QoZKfU8PtmGUXVQSAove2r8UG
	6UDjm+FTD6yIUu+M1FU8rI5HIN63TAMGkenKci9oLP2HEneW9stMuf9T21BVFiL/o3xvNZ4ixCc
	FDZcmP/L5V/knVD0tnD74wYDyvV64+4tiE7g9A3u3Vbmiko9EC55B6ff1NrSBwawPvv3usWxV/3
	JL4cVkyS6HaPlsFYin1puqDKU0+2ZQy3xC5I8m+jsS5kvzZnfJ6eMHId1jIUXH0/MKWSlUBjafI
	zAuaL6CJcrkjf1LsCBV516dypAcl4PLlf0F4XSdC60oq/dDvdl7YVTCvASMfT6Dmz75O28buNS3
	k3EDT1CjC8t5knVxk2JvDefJkDag==
X-Google-Smtp-Source: AGHT+IGlP1mTwXR2PA9n8SopXtLR0QRbnOxjHuzCPP04R6m/RhGzUKKa90WwYf+waVhclx/pDtB5+A==
X-Received: by 2002:a05:6402:90c:b0:615:6fae:d766 with SMTP id 4fb4d7f45d1cf-615e73889a3mr7449193a12.26.1754298263208;
        Mon, 04 Aug 2025 02:04:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:22 -0700 (PDT)
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
Subject: [PATCH v3 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon,  4 Aug 2025 09:03:31 +0000
Message-ID: <20250804090340.3062182-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..99f549263c37 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.1.565.gc32cd1483b-goog


