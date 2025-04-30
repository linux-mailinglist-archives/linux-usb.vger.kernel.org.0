Return-Path: <linux-usb+bounces-23575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EFAA492E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FF65A6482
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA4D23507A;
	Wed, 30 Apr 2025 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npk0pNpF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812C189BAC
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009818; cv=none; b=QB6IT+X54+zw5jbOAG0QlwAZ/KFtDOrIXReI9Lwl1X6dgqWnJHBdeniDeTqDZ8MGaXwypnx7ckW4PHaQlFDdOblId11Is2v0Gm31O/uiqaG7fjc0NeOD5AmnDZr+5In0aucTnEqQ1NqWyrZhj3fFZ2lK6RAx4w8fsTbf5CHJhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009818; c=relaxed/simple;
	bh=ZFUG2BWGk5ZGO/uRDrOyyRTram40KiP4YjpRAFqkcow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiMsRX8uS076RhJi973fEmGJ5ozL+ke9rWDkKu976cwIu6XJhAGq3J30uVayYaS6ZIuvhE8UHjW+MIHT1l8c2FLXEMITlIJrl4rTZPXHJPTz9+AZKhn01E1SllnXwyNeDx7Jl28JY4CgYSVX36qxYPqylBoDv6RCqZCksV5seaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npk0pNpF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso34450125e9.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746009814; x=1746614614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEP85w6tNcMMMSxqeLD45O0Tg9kx0EBAjGJIKvCdwYI=;
        b=npk0pNpFKatVFfaNkYQfNZlsCgtD4caDTpSxJO9QHS83TdxTdcsDUJBaUKRrg7G7ri
         eaX3J80Icx1Wlf/w9tSVtXtZK/1nOkl8lQmrccwD196taxChhA6GY+gUNOZZp9SJ8bXA
         L33TBMWcQGuT+u6dCOnZeWmET3bNl+rPHZejuRpwFL6SYnBouMrMeXrLWLH1/GDZPVy3
         KAQB54ZCfjgWUbyApROobRfJU1/ogkQuTtoMJO7VpmTVwXMgLdGEPiXfNkgWK8xsb3v9
         1WDroDBpFLvdOe9qYuwxBcUnwNjFa5jZkgX71fqfcLj8CJc/+XINF1+e6o69dom7zaWD
         xL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009814; x=1746614614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEP85w6tNcMMMSxqeLD45O0Tg9kx0EBAjGJIKvCdwYI=;
        b=pMsg+WqB289+r6f8o0cRSHNm/wfyvu+A9kD1smYH72mrk+XpJwiH3U/wPDrRK0nDYC
         eanM2d/0YFt4UGPI2YVIQ+P3+96BUVyccu4P9yL4VTF6X6ziuAb5ZVPj7Ps7jVyt/y3S
         HeKv8lgT65XGgOitGqUIB4RTzwxKnM47zzCXvigKYxYWqk12Hx5xdvMUGJn8qZjYkCeW
         fK/4l4CkljB6MJLsi2W9PA0W9g1J8PgZ+ti6Di8BO0SBwWbllIAsUraUN8izKQwFAVvh
         boKdW7ccJDmfA5O3yZrVSfdxk7f0s+ewCHwg1MtagZ8ncDEtO11f2H3mwXOJZTliiI7F
         w1wQ==
X-Gm-Message-State: AOJu0YxrGZ4RGqriWJy1jEvPGnw0Hkm8OvFeQAomVHbjLiQrJYpdpWIg
	9x8+CrhvlTFZgESTofCaeG9RVHIS94vr7XCMcExXwn2b74xVYcXvJ3K3zYL/PDY=
X-Gm-Gg: ASbGnctOFJaRNydPACL8diB2USmw/xo79Xw7yHEoy/fdGEkpJJmHsLPVNJMeW+4HzWG
	Q6bsxhZf3y6ZkU+/SEiz2FD+aCaWOC8vk59T2I1wRBGvIFS6wQCMnv8w5kMZH1MRPVRQNXzkDZ0
	b6ZqjSq3rbK32vNHGOHo+X1a/GMMFjXOlF/nzb6A2T6jILr5PMHZnoAVAfb2EW4kfrF4HaNQjrB
	M2QL+6Rmp05bz7EhZEZhPt67g+sfj+l4zZlgiq4a2jr4L4X3BM/relMfF3joNKQKxeqCJ4kXI+N
	keIgWFAyrnVQUaHdgJxrhk7lP7C9aU0JCCwe/rnbJBE3NQ==
X-Google-Smtp-Source: AGHT+IGj6PtIn8VTSLaG4xVnVhXA0wswVpvV7vx2+qEh8DQdb/C+FGrhbiSdWWCQ+an3xRMGnWVxbg==
X-Received: by 2002:a05:600c:1e20:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-441b1f35c86mr29581065e9.10.1746009813905;
        Wed, 30 Apr 2025 03:43:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad784asm20555225e9.7.2025.04.30.03.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:43:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:43:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: gadget: u_serial: Implement remote wakeup
 capability
Message-ID: <c1b5e666-290a-4d72-8db0-c4e1d3ea97a2@stanley.mountain>
References: <aBHatifO5bjR1yPt@stanley.mountain>
 <f8c4ce3f-7770-42ba-ba1d-af927f769343@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8c4ce3f-7770-42ba-ba1d-af927f769343@oss.qualcomm.com>

On Wed, Apr 30, 2025 at 04:06:00PM +0530, Prashanth K wrote:
> 
> 
> On 30-04-25 01:39 pm, Dan Carpenter wrote:
> > Hello Prashanth K,
> > 
> > Commit 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup
> > capability") from Apr 24, 2025 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend() warn: double unlock 'global &serial_port_lock' (orig line 1505)
> > drivers/usb/gadget/function/u_serial.c:1514 gserial_suspend() warn: double unlock 'flags' (orig line 1505)
> > 
> > drivers/usb/gadget/function/u_serial.c
> >     1501         }
> >     1502 
> >     1503         if (port->write_busy || port->write_started) {
> >     1504                 /* Wakeup to host if there are ongoing transfers */
> >     1505                 spin_unlock_irqrestore(&serial_port_lock, flags);
> >                                                  ^^^^^^^^^^^^^^^^  ^^^^^
> > We unlock here.
> > 
> >     1506                 if (!gserial_wakeup_host(gser))
> > 
> > Assume gserial_wakeup_host() fails so we don't return on the next line.
> > 
> >     1507                         return;
> >     1508         }
> >     1509 
> >     1510         spin_lock(&port->port_lock);
> > --> 1511         spin_unlock(&serial_port_lock);
> >                              ^^^^^^^^^^^^^^^^^
> > Double unlock.
> > 
> >     1512         port->suspended = true;
> >     1513         port->start_delayed = true;
> >     1514         spin_unlock_irqrestore(&port->port_lock, flags);
> >                                                           ^^^^^
> > IRQs were already enabled.  Which is probably fine, I don't know.
> > 
> >     1515 }
> > 
> > regards,
> > dan carpenter
> 
> Can you send a patch, or should i fix it? Let me know.

Could you could send the patch?  Thanks!

regards,
dan carpenter


