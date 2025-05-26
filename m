Return-Path: <linux-usb+bounces-24305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5BAC3E55
	for <lists+linux-usb@lfdr.de>; Mon, 26 May 2025 13:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E5D91896A85
	for <lists+linux-usb@lfdr.de>; Mon, 26 May 2025 11:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9B11F8755;
	Mon, 26 May 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2tHC8gs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B627454
	for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257971; cv=none; b=qsMvxIwG7rkGD6cMlCvsX8qMpbjFRW9T2ivgc+prROAHEDepFWrAFnQh4eZfKyipEmiQ37OyHy8ywTEQejC0JtWYqdNF7MSumkYzeUCxMQ06GmFqa4yqtUc23+1MmX2WJGJQD+lNWQs2k0lflNMnnJrtRnxp5OtQwrUx+T4obxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257971; c=relaxed/simple;
	bh=J/tQMVrB9sX4KEsOMt4Je2NnwttxyKRSBxPoMvmJfLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXHmlC00WlDuCkYhmXgWY4EeoDzWgvjS9s8H/xxp9YJrc6ITvJ45vx0SVDIwg8Thc5KRo+h7d1SSBBHJ4JzzIUT8MUMunXrYdB15VCYQM6vDtVBqYlFiy6ssfTz2qXesy3rcfk4xT5sRnBBGcwMHO2mr4xZqmGPRD5tr9zt59Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2tHC8gs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-443a787bd14so22798195e9.1
        for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748257967; x=1748862767; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGJHKdiDLwThZQUuKAkzwe3CjF+dHvbtX9tnDgm6bKY=;
        b=C2tHC8gsTOiVSJgspDdU/qy6MGUSEoAuTBIXQUcy0KVMSqE4UyQhY2XZDNW8u4clbI
         HqfgfVKI39ro9uaZpIhKesWZL7ghkcxl7ruHaF1mmWJjlcq6A3Wzbz3NJf5ihH2Oogxh
         7HACqi9viQIAtoQ0oaYZPO6ubejg1v9tODlc1KGyM6SUtmhvyITFQfJwKBPMu7UPnPgq
         +tymM/PnoSJITMKvTmK0TrIhFLp80JeYzPj2UOZtNQpBu7c8csJzZzJJ8ihdbbE/9Bxm
         ubXHa5EQX+S0kSYusUWiD/7wOjvrMo8/KpUAI4f8XUtZTNEdn1ldjJLgyvfXod3objHe
         Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257967; x=1748862767;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGJHKdiDLwThZQUuKAkzwe3CjF+dHvbtX9tnDgm6bKY=;
        b=leyS2Uyi/UfNvAppjuKk+GT7VF/ZXIfKRsYcnsAyrAgbDRVxCdMUbeeJZwVVhlBAwg
         xH+osdbZSzq5Kuw3EWjgwENYEkxXecPNgNw8ZjJ4J0Ivo6itXP2399VJyOP77bVZmPHG
         r5mY6otJSqAO+c3l3VwXvdIQ6O0+ixpg8V9oPRUCe+ykWH3YN+Q7Hb1w2jvZndAPt14b
         DqBITmMhU5qTDSSULFO2C0TAp7slhVDNnRsRpBy0GcPf35VAjslsl/qU/kVRYM0KjVqS
         MEgv/oqIzJHXEEBs6sQLFREVFn6QxIFdOmCMu2j6SmVLXt1I745KWkKHbaHdl6RlH3Lw
         /Kfw==
X-Gm-Message-State: AOJu0Yw63AKL3xRmz1QchEBRmZ6cpFPYfFEjplxVEhEaFdEqyWsFc/th
	KZM1WpoeZ8jChd0/vEkfBaxHQG/y0BJujYqWfgoxaCDVwobN4o9/kxSaHFviLil/awrTJTglNj3
	AQE8G
X-Gm-Gg: ASbGncuoq9Ma6NpS/s+UvxBQucmbPS+0CIBLSMDHQXNFYbAvXMnZztKU6jRq7BRcPK6
	EUvypcyu6Na1AQbviVqTov1v/H8ehlQh9IemKGsn6AdvDCIiq3VJsaZJtbmJobmEtKxM9UHO6yO
	QhO4UUWa7LFUyokMOjbemMj9L7hKG8nLPyLlwHpRFBcEAL+KLnrQ2xIA0AKYMGpj5DJf7TiOdQV
	KTT+lu5qxfpiaszOfSHR5adPYrSsE5o3/98BuAn6RQnlOugHqRQ+0xwmb+gfUTD6oCAshI621Xq
	ABYNclFhZHkxd9xiH5sd9KHexrv4Qh1h/bsK7XJfnfN98cWyIabULRK2
X-Google-Smtp-Source: AGHT+IH/tM0XQ45Fp4PxWeFw74cNGEpvOO5jCJ5dIl5meYurPTpDWb2TquWAwmNAXWUYTfw7Ua2QAA==
X-Received: by 2002:a05:600c:524c:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-44b51f4c57bmr118059305e9.7.1748257967225;
        Mon, 26 May 2025 04:12:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442ffaa75cfsm210651055e9.1.2025.05.26.04.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:12:46 -0700 (PDT)
Date: Mon, 26 May 2025 14:12:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: u_serial: Avoid double unlock of
 serial_port_lock
Message-ID: <aDRMq88_LjlnKIQe@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Prashanth K,

Commit 1c06aff9b82f ("usb: gadget: u_serial: Avoid double unlock of
serial_port_lock") from May 6, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend()
	warn: duplicate check 'port' (previous on line 1498)

drivers/usb/gadget/function/u_serial.c
  1490  void gserial_suspend(struct gserial *gser)
  1491  {
  1492          struct gs_port  *port;
  1493          unsigned long   flags;
  1494  
  1495          spin_lock_irqsave(&serial_port_lock, flags);
  1496          port = gser->ioport;
  1497  
  1498          if (!port) {
  1499                  spin_unlock_irqrestore(&serial_port_lock, flags);
  1500                  return;
  1501          }
  1502  
  1503          if (port->write_busy || port->write_started) {
  1504                  /* Wakeup to host if there are ongoing transfers */
  1505                  spin_unlock_irqrestore(&serial_port_lock, flags);
  1506                  if (!gserial_wakeup_host(gser))
  1507                          return;
  1508  
  1509                  /* Check if port is valid after acquiring lock back */

I should have caught this in review but this comment doesn't make sense.
"port" is a local variable so it's going to be non-NULL.

  1510                  spin_lock_irqsave(&serial_port_lock, flags);

Maybe we should re-assign it? "port = gser->ioport;" before the NULL
check?  Otherwise we could just delete the NULL check.

  1511                  if (!port) {
  1512                          spin_unlock_irqrestore(&serial_port_lock, flags);
  1513                          return;
  1514                  }
  1515          }
  1516  
  1517          spin_lock(&port->port_lock);
  1518          spin_unlock(&serial_port_lock);
  1519          port->suspended = true;
  1520          port->start_delayed = true;
  1521          spin_unlock_irqrestore(&port->port_lock, flags);
  1522  }

regards,
dan carpenter

