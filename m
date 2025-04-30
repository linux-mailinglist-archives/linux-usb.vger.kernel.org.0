Return-Path: <linux-usb+bounces-23568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C56AA44E6
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C016018938CF
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4B42147E8;
	Wed, 30 Apr 2025 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hq2WPwmh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97C217668
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000573; cv=none; b=sZeAYaLc3+DjhPOgGC8MHySHD0COLTTbNXBL5LljTPvjVac9mGkg0540uzEP3gPc0Lu15E2+xk6zyBsEq4sLbg+uBNAj/uz8pHYkUnzxHPzuhT7exhiGhf595/if39l6ebC2i6H6BPLDyjMM3zOG4MuC5boiKlCK7u3ZTQn1gIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000573; c=relaxed/simple;
	bh=CQ6pja6JpuvNj8GhJwYSxvn4/qg+p9sy9jTfIjn0auk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATRBfONl7/iZRCfL3/uTbG6nsNrKfQUuJhu+ZS61iI95zrhZzc7AW6arAiPkzIi7fcHHaJFjeVeQo/Gz9hshTgOU2gr9KMBABC9mfxmABYwh/AF24fdvPO+j6tM8JsEMysMmXHbieNv0rOOT6PDvtO1N3vmhl0wZnxlWCtua0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hq2WPwmh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so43149395e9.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000570; x=1746605370; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naN3jc8qLi0j+UmIr799lqpbzhqGsLtFH/xbwLxkdrQ=;
        b=Hq2WPwmhzz3n7ec90TgLrR4Rxv5q62vbfL2nPcAEdNUnn2VTy/+YADSfXM8vD7cAdU
         C+sKgKIFgV3GM0Mb7dLEeenIUgqvwkpoWuFvfM6ix7q7Jhsw0bPsO64o8OA1i+lfaDaJ
         juMD96MstZkEa1ZxZsVseK4F4+i4D2PY44WKcLlGK4No/ktdr4XQxPei3W/PnommMyni
         r82oV6hLVeJMYbxXm/JEGCS1o4xqNe6KbCAE6UGxN2I4AXmUbSfCN420NdDb4J7QhI+n
         1b/7b47ur05KHy7jh++eWxzVo+G/H5T5iWQG1KXU8OvtnH2JK7UseqOTb33NuQ8EpY9c
         bKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000570; x=1746605370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naN3jc8qLi0j+UmIr799lqpbzhqGsLtFH/xbwLxkdrQ=;
        b=WsKek/SeoThE1RTpAJg5h+otPdkuWyxnbAtFYtpMlfP2QTh5NrIxT65zayJHaX5I35
         RamV7u+1FNYoI03WbiB1hJIdswp3X2QMyHJE7hwbwnn2ThYN8U7YscWOSnmDBjZdpNgk
         04W+1+VDSzCvDlcK7gb9X/WU/OijFtvENEHSBw9C2YGmyoPhD4fqaUwnZdhdiOZ8d18T
         QFFBvMKF9o0O6dB+dHJFtpuythchIC3GweZuLoCs8lrE3QvJgljdH/Ij7XxbsxBFW+Jr
         nxAAJjhhioCyjsNTqArA7fqf8ySVQhhsv5uTnbwnPTOdOPVgXZWfdvS7aEwvD0ZMWtwr
         0J6g==
X-Gm-Message-State: AOJu0YxTFgMHk9I1czhxuOpnh9X0OhRMqgNXqzbKE2vqmD4w3+Ibrpv6
	dodcgnc8Ap6SdNyAQFN05S/Yq4dmidCONzi99jh2sifSK0plktYjqPTJ6YXJ34Bfp7sCC170J3V
	Z
X-Gm-Gg: ASbGncspDfLdvhKIKeopBmf7QBwHVWUKfvaW2JuEdOmHH18UX2HdreFXofc0S2irCZ4
	SGiDw0ApRFbitWswPE0738oqO4xFojWWAAaVVluimz8k7Og8Qhs5Ue4+whrt1ygEU7nUp0EZUrM
	4lL23G30mP7Z6dQO6DTrKhgyPVeJqhVBeHboZQGK94XqfEqDGnMUS4X6zIoPv6U7ISmnE1yjz8/
	3AeSwS3v5ad51OE3m17RcQl2XLg452MiMmOxUieZmfHzDXFfvu2/i8I8q+wA1xtUoQr0WI8gswm
	XK/NENEuSbMD+oiUWlWZrdwupbARhDDp47AYvZp5QmeN0w==
X-Google-Smtp-Source: AGHT+IEeTPUJ8FSljs1jKtAp9Rq/PuMSqKMONwqP3i2hIepkefVyLiyUmwiTSCaYiDTqDAuSrcV8EQ==
X-Received: by 2002:a05:600c:b8c:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-441b2695cf7mr9638035e9.28.1746000570190;
        Wed, 30 Apr 2025 01:09:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad781csm15821815e9.8.2025.04.30.01.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:09:29 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:09:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: u_serial: Implement remote wakeup
 capability
Message-ID: <aBHatifO5bjR1yPt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Prashanth K,

Commit 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup
capability") from Apr 24, 2025 (linux-next), leads to the following
Smatch static checker warning:

drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend() warn: double unlock 'global &serial_port_lock' (orig line 1505)
drivers/usb/gadget/function/u_serial.c:1514 gserial_suspend() warn: double unlock 'flags' (orig line 1505)

drivers/usb/gadget/function/u_serial.c
    1501         }
    1502 
    1503         if (port->write_busy || port->write_started) {
    1504                 /* Wakeup to host if there are ongoing transfers */
    1505                 spin_unlock_irqrestore(&serial_port_lock, flags);
                                                 ^^^^^^^^^^^^^^^^  ^^^^^
We unlock here.

    1506                 if (!gserial_wakeup_host(gser))

Assume gserial_wakeup_host() fails so we don't return on the next line.

    1507                         return;
    1508         }
    1509 
    1510         spin_lock(&port->port_lock);
--> 1511         spin_unlock(&serial_port_lock);
                             ^^^^^^^^^^^^^^^^^
Double unlock.

    1512         port->suspended = true;
    1513         port->start_delayed = true;
    1514         spin_unlock_irqrestore(&port->port_lock, flags);
                                                          ^^^^^
IRQs were already enabled.  Which is probably fine, I don't know.

    1515 }

regards,
dan carpenter

