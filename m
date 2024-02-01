Return-Path: <linux-usb+bounces-5724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7E845420
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 10:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E7A81F2AE9B
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B0D15DBB0;
	Thu,  1 Feb 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYUMW38Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210715D5C2
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706780018; cv=none; b=F36Jbv66EQrAhXAhM92Jp1uNyRoFuFq7pkMbGmYe7/0yQpjWl3ZNsiJ8d8nABcpdx6H54P+jOzWNzV04NIS2xHq9CZ7p5hmtx+bGBNpDla6yBL8ycy+6FLxIxQj0bG2FyyUnuDMsao9u9S8MVrzr6lx53UzWPqsO0X6BYgEYqn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706780018; c=relaxed/simple;
	bh=dzwr54Imo8KdIC2HTZKzuFkEvaNhFDLHKM29prLnxw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiv7KCP2+kMXq+Y8tbOC3NaQyZryVXlYreJWjC7cu8/dV36dV6fjDBMAUxqVb0QDBQ1MAlKVnTUSxT8oek18leqnn2GVQ6W7KqJxCSs7VmnWz8rk04TPDJfZhZv1lkSndiz1niAFqN7pPEFK7olgOfrQRnCNNkqHJMuZU2CfolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYUMW38Z; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so1189919a12.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 01:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706780015; x=1707384815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsF6drDKBiFvygmM6xKh0Ey6+0M0HGg4vhCX5aum/LU=;
        b=GYUMW38ZV8SEPzsf7eT88Z4kTn8Y+Zfjp6Q0pLLYidogieNO1M3IxZ0kar1EOTl0Br
         xeWijMlNKBO18KFB08QOhd1m2LVqzmr6+BJp3bw/fA8fmxmNiCso0i73N5kosT/QPyW7
         e4NAQf+RYAY7GfNrokHA7jqC8lZddnpVx2iUQTpTFmbrp+mziu3KFtIcoz5c2YKr3XRF
         GPRmx++ibvA8aE14NjFuUrSujyxKS1l76xkM8fpbxSObEQp43eqHx22JW/1XsorNDJ19
         7I/LkSa5HVuw4chA0hjJPr8kqfKfkR/NZx21/xxdCz1S5asrV1N0SGh1gOMHEzux6pMt
         EJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780015; x=1707384815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsF6drDKBiFvygmM6xKh0Ey6+0M0HGg4vhCX5aum/LU=;
        b=WvrEbHRgGWI3VNn4TyQqkibyu3rom+9ipu+4OpJo2jJ5yDWvzmoiviVyLUVqwztVpc
         vfl/xWcBGGWVTkrATtybitebAijkoW5kCOpYLLfWO7Icq9Xqk3LiCrDORFQT7NUVoObs
         Ix16dDXxRY8Fh10j/dctejXDevLyAkeERR3ZoOq799ewb9BL2Oh9BxPqpt6f6zDfX1mv
         f8JOtyAo6yGztHIYxZ2GXSBd23lLbPLw6BOe/GhsShgdGZu+LIjKcnLVPs0R832HZgpt
         keMFd/GhKiSW3QoPo+cBCrB0iRU6xNVzIM8l6oWdgC+ZVAduuqnZF4JANV47hZN4nRn4
         jgJA==
X-Gm-Message-State: AOJu0YwEYi+c+jlvetLIit3h1vF152e73FlLi4HNWPw5AH9+tjLAD/m1
	ajbuogDDN3a/Oe/RusGPNIvn0E01Vi3BW8Ta/7Vbr6+B8iF7OV3GXndawEMIaNLXIjxGS7DA2oi
	l
X-Google-Smtp-Source: AGHT+IEJitm27XUEd7aZMsJvcMXLkerKnnZ+EBv4HHRiw3++cHWQvk1eyADPdNPH/WXpvZvU6YrMZQ==
X-Received: by 2002:a50:9f43:0:b0:55f:ccb4:ec84 with SMTP id b61-20020a509f43000000b0055fccb4ec84mr65683edf.1.1706780015103;
        Thu, 01 Feb 2024 01:33:35 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v6-20020aa7d646000000b0055f129cea52sm3426846edr.49.2024.02.01.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:33:34 -0800 (PST)
Date: Thu, 1 Feb 2024 12:33:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: linux-usb@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [bug report] usb: ucsi_acpi: Quirk to ack a connector change ack
 cmd
Message-ID: <24758ac7-4be4-4312-9254-f7ea71a4ec8c@moroto.mountain>
References: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>
 <ZbtEmyHMBKnPU01A@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbtEmyHMBKnPU01A@cae.in-ulm.de>

Ah, thanks for the explanation.  I misread the code.  To be honest we
spent an embarrasing long time looking at this code.  At first that
Smatch was wrong and that ret could be -ETIMEDOUT and went down a whole
long rabbit hole trying to debug that.  :P  What about if we did this
instead?

I can send this as a proper patch if you're okay with it.

regards,
dan carpenter

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 928eacbeb21a..5251132cb35b 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -153,6 +153,9 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
 	if (ack == 0)
 		return ret;
 
+	if (ua->dell_quirk_probed && !ua->dell_quirk_active)
+		return 0;
+
 	if (!ua->dell_quirk_probed) {
 		ua->dell_quirk_probed = true;
 
@@ -170,9 +173,6 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
 		dev_err(ua->dev, "Firmware bug: Enabling workaround\n");
 	}
 
-	if (!ua->dell_quirk_active)
-		return ret;
-
 	return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &ack, sizeof(ack));
 }
 



