Return-Path: <linux-usb+bounces-23076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EBFA89AF0
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 324067A1235
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E1C28BA9E;
	Tue, 15 Apr 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/5p9Esg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9D28BAA2
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713941; cv=none; b=Mex7Ci3e0p/sOtuYwGKZs2nO7b5CgzSzdJeqCwRX4HPXADLm3Xxkq/ZBT3t+fBDshAxZGk9ebflfE4iGSmDcPGym9QvkIe8IN6H8kjZv2rZXnjsvfmhSrFDt+EfWZsfSblvOl+jjm+gyknFbt6Vhiju/VDi0aEkdltu/mr5cAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713941; c=relaxed/simple;
	bh=SrghygaguMvzw+VE1qBiRq0FeD0wMT9DVgP8a2PxfNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBBoVtwuFXPRmCzyEF2nXkHy2PbAEMthMi/elFCKTYIwCDtqnhoQqOyCKrH0aowFF5xEKjMMiFkKWa3ioQnv4kpDGyb2n649TL7Yxrta+lW1CvRDUEjXH2M/bCSMGPd4ggributyZW9PKoA5sPZNTxe1Bo2GVWh9pxoKTr84jCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/5p9Esg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso51668075e9.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713938; x=1745318738; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXENc3u4+bTJRR7tdrGXDukPFtSkxVJx0QvmZMAzJw0=;
        b=D/5p9EsgS7g7FSuDLQ8S1aew1bI/2qQcKxRHDy35t/YmAPsUygJ1jw/aaRKUZmTpHD
         QVLHgtuiG+ZRM8W/+NETyEsEKk6eMmkWKfqRjHKZ/ttUXgM6cpMPgTPl02Wz8c7rSFgN
         iEoyi8eET6dHi2fU4BzUPW8VZe5xWNonj8j7AMk1QCQxum3UrTPXviO1CBUDtxqmvRwg
         CV7PpmaRf+aRBu+eSf8SXoLHQfU/zBVNBKdT10tNFKRxEi6eKfanWlMucQWdxmuQP8C3
         KF7H5jYNp70lW8NlMwQeGIZo96NTKs2cXrrfqJEVsaacjAzGvLmCuBzgsgRf0RC/zHyg
         CE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713938; x=1745318738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXENc3u4+bTJRR7tdrGXDukPFtSkxVJx0QvmZMAzJw0=;
        b=NuMtefomdKeE8xu7BsnoDF6USE5xhQSR+PDH+5nH8/+AkzfMxt6XEmA8SAyErEM2rS
         z2N6EUA9XsfIwDYVdxnf/sdTtMYvW/viNQLmcXoXg038VgwWF52ubcMxIQyDJ1HuBfPo
         Gurb6+E99ceNmwXIqq6vgRulrBz5Xytb4iTKDBV4QYu3Cgm3NBvIRIoj0UhKtIPB4ICI
         L117g7XQUOIqzluxcFkixYUlYh5xZ4Tu3HAgOViPP6qiGbOmNYPxNDPi8/DeuNkX6ot2
         SpH8lyRUjtSUDKlbyO9FXytj9qrI/G1IfgQmG5ZU0MsYwBOTvbGJ8m2dxgz4K7gjlnDX
         BSZA==
X-Gm-Message-State: AOJu0YzHxWARYojzBOdQBkpxb/tQOsBFUjjg8UprVOe2fcwoe3ECwrcu
	MbmPuvhk/YmNTCqVK2y/v4Y/DhXVsgGjYIVT3gT6O5yBQnPW0ddkqWfr1pMe5tY=
X-Gm-Gg: ASbGncuq7LFt+3aUC4xC0DuQ0KVqT8fneO7eSzbsdkwshNETjmRXKIGZeTBo6H/Gjs6
	5wAdOG7hjIt6Qu60XSNGpmvy4mBuiJ5pCt+agAnJVMMqLmOPxpwSJXWtiZsZVuGkqNTVjQWcIfM
	7asMOBG7l6Q0gJ3yuUotn2v5MM83tUJQaN7EoEMUD/uogIup0U1OUirO5s3wvZoDP3TXxfDY893
	FcdhSdDs97TW5iksQEVKbuRpourn0kYDVP3lgvq1JQCwcOwMQD7c1ymPA6mB7K/Bs5LY6rzUhU6
	dAXzgF9Cub1SerUmuxXKIB+wjtrJuJqPPw0cYDpyCi0Mpg==
X-Google-Smtp-Source: AGHT+IEM6/twse3iuL4HRpkw1+9xBOXpHNlRgurSd4Dlh9+LCDWr6gIxmQdrI2k93jxpQDRd77Yq7A==
X-Received: by 2002:a05:600c:1e28:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-43f3a959b60mr157060365e9.17.1744713938200;
        Tue, 15 Apr 2025 03:45:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2075fc8esm210501915e9.30.2025.04.15.03.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:37 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
Message-ID: <Z_44zoTyLLdXNkKT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pengyu Luo,

Commit 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi
driver") from Mar 16, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c:372 gaokun_ucsi_notify()
	error: uninitialized symbol 'cci'.

drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
    358 static int gaokun_ucsi_notify(struct notifier_block *nb,
    359                               unsigned long action, void *data)
    360 {
    361         u32 cci;
    362         struct gaokun_ucsi *uec = container_of(nb, struct gaokun_ucsi, nb);
    363 
    364         switch (action) {
    365         case EC_EVENT_USB:
    366                 gaokun_ucsi_complete_usb_ack(uec);
    367                 gaokun_ucsi_altmode_notify_ind(uec);
    368                 return NOTIFY_OK;
    369 
    370         case EC_EVENT_UCSI:
    371                 gaokun_ucsi_read_cci(uec->ucsi, &cci);
                                                        ^^^^
No error checking.

--> 372                 ucsi_notify_common(uec->ucsi, cci);
    373                 if (UCSI_CCI_CONNECTOR(cci))
    374                         gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
    375 
    376                 return NOTIFY_OK;
    377 
    378         default:
    379                 return NOTIFY_DONE;
    380         }
    381 }

regards,
dan carpenter

