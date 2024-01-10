Return-Path: <linux-usb+bounces-4914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EA82991A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 12:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD08287510
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 11:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C347A5F;
	Wed, 10 Jan 2024 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYhJXYR2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADB47A60
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e80d40a41so5041988e87.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704886263; x=1705491063; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRh+nUKMpdLNue0MHuy6m8etS3vu8V684tgPuioOlKw=;
        b=eYhJXYR2QSJXxVL6jtKkX6CQJ6u+HCYxZaPjavG0m3dzYc+IdHdj6BnVq2fkbFLkKO
         FZBHX4tzkv38uiBYkb0X9uU/e41+62j3bDuBb/VtkH3XhoLqn5+oN0ya90Gq+eRrqCND
         MkspXX3sD6q9XPq/rKJdNAIrhfUwCuRezgiB8VICYF/frLO6Mo2EDREqDHYKJItd8hwv
         EiCYcSQ59/n3C0v/IhnU7VFCVYbcAy7/AF+cfO5Xm0Hi9SS/kp1zZy5fDu1xBBRb14ca
         sP2zKQyRSWyd/JJe4JD9+sF5vLT4Bj5UllPRsfFjKXrF9NhAqimKETVGWcEqqrmfJuKO
         aTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886263; x=1705491063;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRh+nUKMpdLNue0MHuy6m8etS3vu8V684tgPuioOlKw=;
        b=FEMTTyHq/thxdw3LsPd7dQtUsL8qsvt7r64lGj8go4AIMapwH5ofVgWTi9e61AlRvt
         loI5QBW2H6p7CjoLx83ZnSihOT3WcVfNNQ0pgksS8ejU6Iew6CvVUG7Ps2zcc7aYZkBn
         erYQ5Zwulxfl3zZSH9xhf8FlYHM63Uy/MVVpoSupxHk/Ai+G7VnHApLmpVpo00t7L2my
         XipZ166rTxTjUiQqvQnxgKI2jzxRybjGaulb1vYKlpzt7hDDha5TZ2tVUP6KLAoGx7LM
         cAZwo7It21ayyGlluKa9SHjXBy+Y1XuWQrb1YwpacidiyywszkhSL2gFghfFIdYGi5h4
         haoQ==
X-Gm-Message-State: AOJu0Yw/Q55r+kzj1CXR8aQLzuCqaQWQ3gNL+UBePjW4x/ZVNjJPYYtL
	LNq0ZMczwoshcCQGJeYBSEoja2jOJb77vJvfALJMGAeYrXM=
X-Google-Smtp-Source: AGHT+IHVz4bPR6c2UQ/fwk2lHWrRKg1f6D7FFOpxc73UQlktR9YGkKJk8NeYvpAjCVGEU8v6b2lExA==
X-Received: by 2002:ac2:5309:0:b0:50e:bc9b:154 with SMTP id c9-20020ac25309000000b0050ebc9b0154mr299490lfh.35.1704886263274;
        Wed, 10 Jan 2024 03:31:03 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm1846379wmo.28.2024.01.10.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:31:03 -0800 (PST)
Date: Wed, 10 Jan 2024 14:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] xhci: add support to allocate several interrupters
Message-ID: <ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mathias Nyman,

The patch c99b38c41234: "xhci: add support to allocate several
interrupters" from Jan 2, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/usb/host/xhci-mem.c:1873 xhci_remove_secondary_interrupter()
	error: we previously assumed 'ir' could be null (see line 1865)

drivers/usb/host/xhci-mem.c
    1863 
    1864         /* interrupter 0 is primary interrupter, don't touch it */
    1865         if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
    1866                 xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");

This debug message is kind of pointless...  The Oops will have the stack
trace already.

    1867 
    1868         /* fixme, should we check xhci->interrupter[intr_num] == ir */
    1869         /* fixme locking */
    1870 
    1871         spin_lock_irq(&xhci->lock);
    1872 
--> 1873         intr_num = ir->intr_num;
                            ^^^^^^^^^^^^
Unchecked dereference

    1874 
    1875         xhci_remove_interrupter(xhci, ir);
    1876         xhci->interrupters[intr_num] = NULL;
    1877 
    1878         spin_unlock_irq(&xhci->lock);
    1879 
    1880         xhci_free_interrupter(xhci, ir);
    1881 }

regards,
dan carpenter

