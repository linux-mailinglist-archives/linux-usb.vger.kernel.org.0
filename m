Return-Path: <linux-usb+bounces-7696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E775087574F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 20:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F1B287F2E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 19:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC62137C3C;
	Thu,  7 Mar 2024 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e28jsTOA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2A137763
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840064; cv=none; b=M09IJQbaVAaiKgll6wvTBfFsxE+HIFcHPH8jSjJC7ezgIxjf+eMlY/ZJoXJL3DqpJjxtVxWEC/ceDz7LDtD9AzaIt5n4qYdczijJ7B8NCc8M1lnmLmbw5h0Szl/T44Kk67kznbv9KopCngsx7a/HhaMvJgRSUxWqh4VnG4l/x70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840064; c=relaxed/simple;
	bh=Kfej+LHgbQK/sCIhdJwBilxV00+UrdCsx4d2kwtAhzI=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxdiWPqv1ZeZfAhu67ZMEPtqCcV3DJYLke3lIIxctq9HazlPaQip0lUv9UaN9wNgqUI6WQiz9fKiuz8wPe40uN+H49LVeApZCr9F0NK1C53WGcdHkalZ90mxAfA6vBSMvUILL1uHWh5y3oJkf6K6a0p+10qgeY64OCnzqGnqVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e28jsTOA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so63577b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Mar 2024 11:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709840062; x=1710444862; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PVily7FU6GJy5Nkk5KN77VrVoGkvWQzL6/vzQKnhzA=;
        b=e28jsTOA8z8eleeZBjLe98kX/vXrI3/BL2Ut+ZpkaOR3xT3cBjHFCGU92TIPdhqmlh
         p4I57xCdRxLYN6GKMQmw2KA6wc0SKSY7LFn6yF7Q+wfoDLFC2gKtYkTG1zXUeAah9FnP
         2vuvLOQWh52Tw0fENyYyNnhf8gx18u+bqvU9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709840062; x=1710444862;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PVily7FU6GJy5Nkk5KN77VrVoGkvWQzL6/vzQKnhzA=;
        b=FMxKZk0kguovFvwggj5DktYWvun7htLw8bIG6CY5wkI2lbEyHyxCDkF83eMDQJadh8
         G52QM2nUok6FFectneg1KGY8YIOlezmOjssVXiVITmo3JN4XoTUPh3a1B8/NUT3a+Ydz
         u8zQELdR1T++BbOSNQVUkCITr2SzFxIU+2hERGLTUhaYJfInwH4L+Ae5CU8mS8nW1qwE
         FBUvLpBc0hZwIdNAqbRmUnb37g1+uFN/rw6sPlBeEFhHTMVt/bFvsnC1UdFRuj3STUhY
         vDXFR7BzqQZFsPRZGl7HFrMUYIbdiQ+d7VlPuOfTyKEFs4kiTb7y7EcIRSiQWLXVyzwo
         N7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz67nPR9+uqT9XDkjnD88HycJSAFTp/NVuWugrZlpBycJI8jw83bO1q6u3f6kLY0enpE6MhlIbFxxsREyD9FmxFFbGa+FE/WUN
X-Gm-Message-State: AOJu0Yz0wXifs09Hn7aD1jhOkbLCnVfzTJGxv+FlKj05StLpCFt3kvzR
	t2Npp3x9x9kcH3JnT8H6ajdAkRSKu7tfQGr/i93XIbFc5sb2gWiZIFwmuw69kQ==
X-Google-Smtp-Source: AGHT+IEjdEN4l+11c3hHPjNS0tI+JHVbAlNWjLu+uS0rLW05VOLz0gzCHzXvxynoZOoBJ/CXyuk7IA==
X-Received: by 2002:a05:6a00:2b44:b0:6e6:2af9:7553 with SMTP id du4-20020a056a002b4400b006e62af97553mr10534245pfb.5.1709840062303;
        Thu, 07 Mar 2024 11:34:22 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a056a0026c400b006e65255b9acsm2725907pfw.49.2024.03.07.11.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:34:21 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 7 Mar 2024 11:34:21 -0800
To: Jameson Thies <jthies@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: ucsi_check_cable(): Null pointer dereferences
Message-ID: <202403071134.7C7C077655@keescook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240307 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Mar 5 13:11:08 2024 +0000
    f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")

Coverity reported the following:

*** CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
drivers/usb/typec/ucsi/ucsi.c:1136 in ucsi_check_cable()
1130     	}
1131
1132     	ret = ucsi_register_cable(con);
1133     	if (ret < 0)
1134     		return ret;
1135
vvv     CID 1584245:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing "con" to "ucsi_get_cable_identity", which dereferences null "con->cable".
1136     	ret = ucsi_get_cable_identity(con);
1137     	if (ret < 0)
1138     		return ret;
1139
1140     	ret = ucsi_register_plug(con);
1141     	if (ret < 0)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1584245 ("Null pointer dereferences")
Fixes: f896d5e8726c ("usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses")

Thanks for your attention!

-- 
Coverity-bot

