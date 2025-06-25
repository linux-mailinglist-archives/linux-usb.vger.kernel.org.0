Return-Path: <linux-usb+bounces-25104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F2AE87EC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 17:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE8C37AF4D8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 15:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4961272812;
	Wed, 25 Jun 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhAPABk8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BB42D8762
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864969; cv=none; b=Spm9ncOiQ6jNRmQrWd5aVneWxhzLmZVaWp7zJ73I55/Z1FD/GWDD+t8ES7LnLp+zaZUByuR1kNlobwQ3ap7SmTIs2b4DvRx1CUhCMTt1NQO7PUOzwt/Qk383uCvPZHwly6Vv8+nZA6k+Ta8uA3unrnGs4s+WtG4M14BRvIxTErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864969; c=relaxed/simple;
	bh=hhI3qts2bFYEC/+yafL8OvwpRKRLhNWWCIXRBUnvomI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcG2GhaYywudj871NSIJQRTBU+qBnhUfcvcU47YjEvSzWVInPlLqIAOOChLyz08sVrLCEQw1ANLqd9gMajQycpmywHVWU1MCRgUXL6xJcigEh3PJzso9UAYjSjJA5SWfyHuBn/FEmnJY4hGEgmD1nyxddkE1+LYy3DqDk7KLPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhAPABk8; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ea080f900cso8758fac.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864967; x=1751469767; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+9IRbJc1wyIMEORe+FVtfinFE0je30ltCdtdusyK4k=;
        b=ZhAPABk8PCDneGmBUNU7cs3VAhUSbqRjCE6mTSL8f+pi51Ww8n2Dhdp1aSHEIKdFyu
         65FbGl0gajDA+BgrwHvP24QYK2sLF725bAUnNmDGCav30/qQoh0gxnkB26Zlf/qLkQ9K
         /lxv3Y+Xl08Bf5N4CTBwd5SWudA38Y1IgvfCgMI5HvKMr09W5OzgxivB0oyuL6x+EAhH
         wxkOoA4Rnp2uOqxcUyOglS0akfd1smjzjkTkKDr7lV5ehRhtGO2+BhVdX0ZxlmD7PfTI
         uBT31RnJiOtYoqydjYfNgSZjvgYFQmPHfVhgC+OQmMnW9dsuXRDZ0cT3M56D6n0t7JQW
         5r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864967; x=1751469767;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+9IRbJc1wyIMEORe+FVtfinFE0je30ltCdtdusyK4k=;
        b=H5KXtUXMnCoTIXDdKiacGvsRHAw9Q6T3GEODxCGdvA4fG7qRegU28E67YrdoBCAgbx
         QA22MyoPT4+pKmP32ZidJpfJX+H1T5GwwFD36j/NbZJMcQlm34MOaOQOS+3RUxmbRSd7
         9JOIVsDbR/XAZu0/r3U7j/RJKqmQGi4vC10mX03L/T/6965dlzeluI1h3HcvCDy4h9bI
         Hwg3YrnIFF3Cq7k7jdZbsdtodHpgbMnPE6PJfzDDZwYtqCnlzmZzGj6LGrLaCEUJSvKd
         /nLo54qJ2K9Bu9ma7uWC7ho+sNDGftYY+0pqoACozcVvtookvYVzTKAW1neLJMrzHzAI
         HoKw==
X-Gm-Message-State: AOJu0YxTW1TOTDKuFi3arC307B7i8sMe65A9XjRq0TrPvXRToTm9v1yf
	PLAaNtiry1TY9OHcxkZZKQ8rjUNUmwXX5my8Nm9MwP2MSxY9UUXu8WTBZvQuY+KTo9oImSCRLCU
	y2e4D
X-Gm-Gg: ASbGncvyqwhnsM8j3xLnnpFyPZb3gQ4lcNixNmUxE8YvE9a98nJKmJpvzZL5tIZ/GPZ
	U7muLwDzjZynKHu5XL2Ei4amKv+g/4xqtRcudyMA5h0p4NIzwvmtz3fgIQhfywxbpdHEjDsbq4I
	eYaZzL1XJdLAUs1GFxAExxe6MncxUA0UlWVoZ0/iUo2M58a3PH4VxOqc9covaHJu/db/lXifmkh
	+xAZhdCHlIX3LhoLnzC8lG8WRG122Av64gzi4ezscY2K425UFwi8B9+JaurmQSLdBemUi9qHEXp
	FVSZBResmo23YQW5NUgfx9HG8oJhAk1olXdteTgLosix8OT98H4rT7Il1Cf5pd0sh5RGoQ==
X-Google-Smtp-Source: AGHT+IEpIK4RBr+8+6vH5d2D40qD6Z6N6OT0qKT740C1a35tGdyyzuWe+m4fDnBl7OYJTwvQBzXDDg==
X-Received: by 2002:a05:6871:e414:b0:296:aef8:fe9a with SMTP id 586e51a60fabf-2efb2656443mr2554841fac.7.1750864966783;
        Wed, 25 Jun 2025 08:22:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee8a8e3710sm2590192fac.27.2025.06.25.08.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:46 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:45 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: hulianqin@vivo.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: u_serial: Fix the issue that gs_start_io
 crashed due to accessing null pointer
Message-ID: <926a09f1-d0d9-4bc6-8cd0-996cda0af60d@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lianqin Hu,

The patch 4cfbca86f6a8: "usb: gadget: u_serial: Fix the issue that
gs_start_io crashed due to accessing null pointer" from Dec 3, 2024,
leads to the following static checker warning:

	drivers/usb/gadget/function/u_serial.c:580 gs_start_io()
	warn: variable dereferenced before check 'port->port_usb' (see line 547)

drivers/usb/gadget/function/u_serial.c
    544 static int gs_start_io(struct gs_port *port)
    545 {
    546 	struct list_head	*head = &port->read_pool;
    547 	struct usb_ep		*ep = port->port_usb->out;
                                              ^^^^^^^^^^^^^^^^^^^
port->port_usb dereferenced here

    548 	int			status;
    549 	unsigned		started;
    550 
    551 	/* Allocate RX and TX I/O buffers.  We can't easily do this much
    552 	 * earlier (with GFP_KERNEL) because the requests are coupled to
    553 	 * endpoints, as are the packet sizes we'll be using.  Different
    554 	 * configurations may use different endpoints with a given port;
    555 	 * and high speed vs full speed changes packet sizes too.
    556 	 */
    557 	status = gs_alloc_requests(ep, head, gs_read_complete,
    558 		&port->read_allocated);
    559 	if (status)
    560 		return status;
    561 
    562 	status = gs_alloc_requests(port->port_usb->in, &port->write_pool,
                                           ^^^^^^^^^^^^^^^^^^
and here

    563 			gs_write_complete, &port->write_allocated);
    564 	if (status) {
    565 		gs_free_requests(ep, head, &port->read_allocated);
    566 		return status;
    567 	}
    568 
    569 	/* queue read requests */
    570 	port->n_read = 0;
    571 	started = gs_start_rx(port);
    572 
    573 	if (started) {
    574 		gs_start_tx(port);
    575 		/* Unblock any pending writes into our circular buffer, in case
    576 		 * we didn't in gs_start_tx() */
    577 		tty_port_tty_wakeup(&port->port);
    578 	} else {
    579 		/* Free reqs only if we are still connected */
--> 580 		if (port->port_usb) {
                            ^^^^^^^^^^^^^^
Checked here.  The commit message says that this is to fix a race
condition where a different thread could set port->port_usb to NULL
after we call gs_start_rx().  However, the code is still racy
because we're not holding the spin_lock(&port->port_lock) so port->usb
could still be freed between lines 580 and 582.  The window for the
race is much smaller but it's still a potential issue.

    581 			gs_free_requests(ep, head, &port->read_allocated);
    582 			gs_free_requests(port->port_usb->in, &port->write_pool,
    583 				&port->write_allocated);
    584 		}
    585 		status = -EIO;
    586 	}
    587 
    588 	return status;
    589 }

regards,
dan carpenter

