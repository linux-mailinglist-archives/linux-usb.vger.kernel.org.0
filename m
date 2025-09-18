Return-Path: <linux-usb+bounces-28276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D4B83EA9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB663BD258
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8AA221DAE;
	Thu, 18 Sep 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jm7sbxHO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571371F09BF
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189101; cv=none; b=MywuQrcARUcUMiW2dNKi0sdK9Fv0D2aQwki9DNSPdS9CuozVz+hAnpIs63LscFyXxQjseIJGk0aXW280BbMZc5Oqv9iljhFCbhpg4YNq2Qyilx7D7mo7PLdKI4uxsMuE9e7mrmX0EsZNBV3NReaEtmN04vOBpWMYzP4ikqbSGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189101; c=relaxed/simple;
	bh=1pw0I36eQxAxUrjgD6UdetRAr39bS+DcJKKxvL2xMxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7zYn/+Vdf28lpXLQe6Y7OIiMUCennN1XBgtKlVV22RAh+LL19jklfTEPtODRwjNTb7ykoiY56b9LIkUbIAaCMPkZc8C6kV6Rnd6XFudiUajFxSeniaDei8qoFk0i+9VpTlLcoxEO2H8hi4Y44i4gVGUuyUYjCgZ+DKXTpiffeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jm7sbxHO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so4084685e9.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189098; x=1758793898; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5EBIhceIpR6OCim+S6gF9QeC6pK7idbgzZSfOAkxWg=;
        b=jm7sbxHOkpXk1IVa213lqXVpO1uv9PlzlmB/lQB8U9OKqnYBZX1m0aC+GYafKOZrQ+
         tWkMo4aS0NNvwsVGsGBlbBP78h+HefV0QRru4nLLRbRQ5iHYUQRGvrwAKDulaYVGuYy9
         qvyBDyh4CQBTBiGY1cCcWxqO8NnqMO45/gmr0K/PADUaqpPm571VczRdUOC3EvoTtE8B
         UM9i2CIKVnyh4QKpZ08k114n04b01TZ4WCfqrNRbRuo03/RD9QCHfJKVoCOyycc0OYAe
         GYXQXewovkrueKiiFbklfgEpFxjbFysw139D0XAu1OnKOw06IhC87QcU05nlb0+yEpC9
         H3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189098; x=1758793898;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5EBIhceIpR6OCim+S6gF9QeC6pK7idbgzZSfOAkxWg=;
        b=m3RlHGXNWADQ8iqceiUDQyK9L6C6oDgTXyER0CV/70UmDVvZ0A5DQluziXY9d7FAXB
         HtfgpsA0Z5LZeT+zk56/4a8NS74AUsmWLA8vup+WTBqtLYB1Qd3GxgfnV7IK2f0CjZCW
         72tmCwaul40ZCzFCnThbyw91h1JKRlhEbemkEM+ofYnfT5/G0R//2GqiCi9aw00Gos2C
         mOJxClPmvgM1XFp/1QbYaOLYYk6as8zRnOmP3NjGo74egmx2/javxf/RXNeB7xJLZmaf
         jklx3h08lCM3ZJ97AJ0Y3Z4l6j7UeJra4RJrNGLBjd5CiH9rtXV/omncpJgoSAMFQn2p
         d8AQ==
X-Gm-Message-State: AOJu0YzzlRK26wCKNoV4RH2eaOB/AcIEcRSKHL5mBn6c8WFuQ4TVMu5K
	jXhdKQkV+xPAOXC9c+0IQm1o9sYMnqeUeofb8u1TsXRnHob+kQRzRTBtrBOw7pbLpJkR58f+fSD
	xaWQ8
X-Gm-Gg: ASbGncuJWq13gmnPbQ5+hMumIqPB9TDfLoX0UUKNcQ/LMUqxXksPsEYyzkujq7z/Aa4
	wvSFn/HX0MXwQVmTx4BFWAGX4K4pNTMylNTv4AEReKMzCW0Sq/UpZAc7SirOFxmppjJkafRaXFn
	ezqRsdyLYNky/Ae+kCyAgHdiPSL5E69S2tgZGqorjmmZlXknPZcts0qBINapyVU1Qh+o/YR/SPy
	6Hf2UrqjwB6IExOz14Ex3H0w4CRXAm9M1UehtHPOtCpVwXNV0DDF3bp9zk1ePNoSaqz4UUJIvi+
	wFHQAdqNjPchZpudtdmPvM9m6XeW/FwCgWox4Ulhyrn/Ti8/deuHhIWGe1OkbUiycISP+MzRtkx
	ZfSjbHiG5MwP71LvRJENA5Rqvz9q5nCzHE8coMi4e+Sj7YQ==
X-Google-Smtp-Source: AGHT+IEu59E0axtWcEvqCs3v51EhorJY0Re58wnMKgyCIk08GJ2IOgPLSwUZaFiGTEXy7tqnGL3tvg==
X-Received: by 2002:a05:600c:3ba8:b0:45d:2ac9:4240 with SMTP id 5b1f17b1804b1-46206842af0mr56431125e9.17.1758189097568;
        Thu, 18 Sep 2025 02:51:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7478sm2990072f8f.38.2025.09.18.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:51:37 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:51:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: tipd: Read USB4, Thunderbolt and
 DisplayPort status for cd321x
Message-ID: <aMvWJo3IkClmFoAA@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Sven Peter,

Commit 0b31c978935f ("usb: typec: tipd: Read USB4, Thunderbolt and
DisplayPort status for cd321x") from Sep 14, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/usb/typec/tipd/core.c:580 cd321x_read_data_status()
	warn: bool is not less than zero.

drivers/usb/typec/tipd/core.c
    574 static bool cd321x_read_data_status(struct tps6598x *tps)
    575 {
    576         struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
    577         int ret;
    578 
    579         ret = tps6598x_read_data_status(tps);
--> 580         if (ret < 0)
    581                 return false;

The tps6598x_read_data_status() function returns true/false.

    582 
    583         if (tps->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
    584                 ret = tps6598x_block_read(tps, TPS_REG_DP_SID_STATUS,
    585                                 &cd321x->dp_sid_status, sizeof(cd321x->dp_sid_status));
    586                 if (ret)
    587                         dev_err(tps->dev, "Failed to read DP SID Status: %d\n",
    588                                 ret);
    589         }
    590 
    591         if (tps->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
    592                 ret = tps6598x_block_read(tps, TPS_REG_INTEL_VID_STATUS,
    593                                 &cd321x->intel_vid_status, sizeof(cd321x->intel_vid_status));
    594                 if (ret)
    595                         dev_err(tps->dev, "Failed to read Intel VID Status: %d\n", ret);
    596         }
    597 
    598         if (tps->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
    599                 ret = tps6598x_block_read(tps, TPS_REG_USB4_STATUS,
    600                                 &cd321x->usb4_status, sizeof(cd321x->usb4_status));
    601                 if (ret)
    602                         dev_err(tps->dev,
    603                                 "Failed to read USB4 Status: %d\n", ret);
    604         }
    605 
    606         return true;

Should this be if (err) return false?

    607 }

regards,
dan carpenter

