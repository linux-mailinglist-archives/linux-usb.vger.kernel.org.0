Return-Path: <linux-usb+bounces-5678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF684370A
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 07:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F7EAB22852
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 06:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C63C493;
	Wed, 31 Jan 2024 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xO0bXzRb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B04D584
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684390; cv=none; b=blDZhqa/tNZRVX7MGyuSQAHEaVjXkTwTDcgTJ6iRBOjXX+AgN1ct/APHKoGaKGlqxtQsOYfyZNHYL+wx66rvGWDHStYl7/7YqD2lNs6XdgtJtvA2FdCxbKiRj7t8hpYq0jLGXtHELKWmzeQD65AHwWwJ8YnZ1BEHSn/iJyP7NTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684390; c=relaxed/simple;
	bh=gKUqc3H6eRyu5jbdUQCbyfq4IMjhy8nn5eLvymQvny4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGW5JwuKjRewi8pS5MDXeqtK81C0eY/7pxrg1dK2cpq5E9xyn79Yi6zp1UipnnKwIWulVgQw9fYzq7KdEhS+YlZZ5sB7dvCV6YtYNiBP1n9b0Tcd42/odlWQXf3zyxbTzmEdek/3rakEIWKHKqIgKmBA/B0MhHiG8eWaZ197YTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xO0bXzRb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40f02b8d150so12320695e9.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 22:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684387; x=1707289187; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJTUY1U1mXBl4pnvYIckuUKAaa5ySEoRKOf/HYUvjmg=;
        b=xO0bXzRbr+Zc5CY8G7KipUCaDa+w+XSiuKV6PywwEXQQ/WD5oPgyloYfFuSNnj7VII
         R3jbrPwH4O/oRFAQCjB9iZSMZzEtROYhdwEM1Vt/7/AmNufAfRenbYwDGGy6Rf4d+qJF
         70QZpY/OY/KRhV6hLK4bG1N6lbcStsgKZoKwYTMPnfXITYAna6Ezyd4O8+AKXSVI7AE0
         5zY6l3dX7cuO4/cEmgZ3hEtzKp7YkwT2mbRULiO9io8oiE9DhVnFH60e0BLs+zz3J9AS
         O9lBRAdII2IFwC4nyTjICKA19sLJnP35LMv7LT1v/C83DR9xDqgxj9xMVcAT1wxl14m9
         8FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684387; x=1707289187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJTUY1U1mXBl4pnvYIckuUKAaa5ySEoRKOf/HYUvjmg=;
        b=XiQlJR0sbv0ED727vQRX65TtDav5doovoZtEmfCKC603i0qG7lo1NFndQAYnYJG9Q9
         KTsHIOT5v5jh4Q8jnihM2PaPxanyFXUL8PNkbAJ04VbNYHvnkMOXJLCeRu8DDW0f5LKe
         +a/MYM96Q0yjS4MwRm9R/zGEEbQh5QW1sqrsPaJqSU3YKTmbtgQm3pkvQ36EqJzddfS2
         0Rs+mS+6BkxFOJgSDmuheq9DN8XZASx8mOpkW60fEjwklA1w5fedC3vMX0bpq6l2E5hC
         ChprmdQNF+sxLQvdV6rk1tR+u3E+ccZg2SooIM68roVhEvjPKZxtp52zO4G4dann4n3Q
         Ajyw==
X-Gm-Message-State: AOJu0YxcVU5FHSbhind/5Rc+ylqUZPkTCUrIdcetDkNllu/t1Uy0ysZb
	ml5sFHOfWdPMboSvLDS96To0PqN3DHm1jak3E8JWY9iYdt69EdQGZfn7mIrbryU=
X-Google-Smtp-Source: AGHT+IG7c2cQRy+6Vu+p91JEfc3apkb8dlA77/2lzd9wb7YkcYF+5VKtRtStaccISQRScykmtHXgTg==
X-Received: by 2002:a05:600c:5010:b0:40f:b593:ab6f with SMTP id n16-20020a05600c501000b0040fb593ab6fmr254544wmr.40.1706684386851;
        Tue, 30 Jan 2024 22:59:46 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b0040ecdd672fasm617506wmd.13.2024.01.30.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 22:59:46 -0800 (PST)
Date: Wed, 31 Jan 2024 09:59:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lk@c--e.de
Cc: linux-usb@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [bug report] usb: ucsi_acpi: Quirk to ack a connector change ack cmd
Message-ID: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Christian A. Ehrhardt,

The patch f3be347ea42d: "usb: ucsi_acpi: Quirk to ack a connector
change ack cmd" from Jan 21, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/usb/typec/ucsi/ucsi_acpi.c:174 ucsi_dell_sync_write()
	warn: missing error code? 'ret'

drivers/usb/typec/ucsi/ucsi_acpi.c
    138 static int
    139 ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
    140                      const void *val, size_t val_len)
    141 {
    142         struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
    143         u64 cmd = *(u64 *)val, ack = 0;
    144         int ret;
    145 
    146         if (UCSI_COMMAND(cmd) == UCSI_ACK_CC_CI &&
    147             cmd & UCSI_ACK_CONNECTOR_CHANGE)
    148                 ack = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
    149 
    150         ret = ucsi_acpi_sync_write(ucsi, offset, val, val_len);
    151         if (ret != 0)
    152                 return ret;
    153         if (ack == 0)
    154                 return ret;

This would be better as "return 0;"

    155 
    156         if (!ua->dell_quirk_probed) {
    157                 ua->dell_quirk_probed = true;
    158 
    159                 cmd = UCSI_GET_CAPABILITY;
    160                 ret = ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &cmd,
    161                                            sizeof(cmd));
    162                 if (ret == 0)
    163                         return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL,
    164                                                     &ack, sizeof(ack));
    165                 if (ret != -ETIMEDOUT)
    166                         return ret;
    167 
    168                 ua->dell_quirk_active = true;

Here we set ->dell_quirk_active to true;

    169                 dev_err(ua->dev, "Firmware bug: Additional ACK required after ACKing a connector change.\n");
    170                 dev_err(ua->dev, "Firmware bug: Enabling workaround\n");
    171         }
    172 
    173         if (!ua->dell_quirk_active)
--> 174                 return ret;

So this is basically an else statement and ret is zero.  Smatch thinks
it should be an error code but I think it's intentional.  Why reverse
the if statement, return a literal, and pull the code in a tab.  You
could delete the ua->dell_quirk_active variable.  Or is the concern
here that we'll be probing two of these quirky things concurrently?
It's a bit strange and probably needs some cleanup or comments.

	if (ua->dell_quirk_probed)
		return 0;

	ua->dell_quirk_probed = true;

	cmd = UCSI_GET_CAPABILITY;
	ret = ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
	...

    175 
    176         return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &ack, sizeof(ack));
    177 }

regards,
dan carpenter

