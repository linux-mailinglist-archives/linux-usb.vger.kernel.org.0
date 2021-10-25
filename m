Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654CE439A61
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhJYP0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhJYP0X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 11:26:23 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30073C061745
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:24:01 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id s9so16048290oiw.6
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0OdGj1CVKHV0vPqrVwWPDBNu82C2YW2wGAwAPVeMFEQ=;
        b=dTyA2+vAIopbQdjhimqjOgp45K9EK1Is1wPVSjHKH+SXTbjTYt4wN2o8FYAn7opMxo
         204htv8rW+9WrzX8ZAq5f7LEr7bGrb2DDGXCqZeCCXPhWQFHw1qtxx5xUh4HZteDjjKv
         IzmQXa4Xk/vlhCxQxYnJbLT61YaPxf3sVDWrD8Ko8hYYjTiXsPfazpf1U8Z5VoDz3/+y
         Lib4DXrTeqwOjeINTLMxLaKc0TIasOX+dbxDy80MyMKmC6sHWtsy79Ob9nGCEAWNr2jl
         Fu/whdvvB0Qb6M2N2VwyT9K3kBeeKfB6gQCyFEDaT1OpnMdwIaXgbLtSgxH4kMjm9qeY
         auoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0OdGj1CVKHV0vPqrVwWPDBNu82C2YW2wGAwAPVeMFEQ=;
        b=z3nw9u0peKpbVT4Kul1L39bj03qJWabX4MeOEtmdwCrG3sSaRq3eik3KE5tH48de1f
         7sDw7iZKLOyXVngnbD2ypHGd4oy8u24L4q/EWYP3NVsupea+HaxMnqDgD1t0azs8Z0jF
         h1a+B+GCVTSGGQPS/Rt7mJkGwsFrij/H5aPLP4ShLcg6g1D0uaiVObs0D0BVUPp95NbV
         4OQKQTYiJ0A5N4DRUDsOco6a8s6g99cEbl0qFSydk97tk2JPezSz0BiGwBa/oZtmS+wa
         EfCj3jC4UCZpd8CQZSxMaM4QmIoVKoSQ9wpSaBjeHVnxMlQjks8I5uNUliQs9GPeYCcT
         yCzA==
X-Gm-Message-State: AOAM532SQS5H+22ZfEJgBQV7oX/Bravd9v5TjjJ8YYCH151KgjPRkRYq
        tCVD2DyVOoejUXwkeIU6kl+TeQMDVeceMNmq
X-Google-Smtp-Source: ABdhPJzYankBU1XCj61eu85oI4X985rX7LPIQefx9KvPF+6VXwSC9yfCoqSyaeUGyfswyywAvSuRRw==
X-Received: by 2002:a05:6808:1597:: with SMTP id t23mr13306372oiw.78.1635175440391;
        Mon, 25 Oct 2021 08:24:00 -0700 (PDT)
Received: from ?IPv6:2600:380:602d:d087:5bee:e9ee:c67d:4ccf? ([2600:380:602d:d087:5bee:e9ee:c67d:4ccf])
        by smtp.gmail.com with ESMTPSA id f14sm3629365otq.10.2021.10.25.08.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:23:59 -0700 (PDT)
To:     linux-usb@vger.kernel.org
Cc:     John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] usb: remove res2 argument from gadget code completions
Message-ID: <f026d10f-d659-b180-92fb-c5c087bcefd9@kernel.dk>
Date:   Mon, 25 Oct 2021 09:23:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB gadget code is the only code that every tried to utilize the
2nd argument of the aio completions, but there are strong suspicions
that it was never actually used by anything on the userspace side.

Out of the 3 cases that touch it, two of them just pass in the same
as res, and the last one passes in error/transfer in res like any
other normal use case.

Remove the 2nd argument, pass 0 like the rest of the in-kernel users
of kiocb based IO.

Link: https://lore.kernel.org/linux-block/20211021174021.273c82b1.john@metanate.com/
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

Greg/John - if you guys are fine with this patch, let me know. I've got
the ->ki_complete() argument removal sitting on top of this.

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8260f38025b7..7bd22398d52f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -831,7 +831,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 		kthread_unuse_mm(io_data->mm);
 	}
 
-	io_data->kiocb->ki_complete(io_data->kiocb, ret, ret);
+	io_data->kiocb->ki_complete(io_data->kiocb, ret, 0);
 
 	if (io_data->ffs->ffs_eventfd && !kiocb_has_eventfd)
 		eventfd_signal(io_data->ffs->ffs_eventfd, 1);
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 539220d7f5b6..28d3d4e71182 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -469,7 +469,7 @@ static void ep_user_copy_worker(struct work_struct *work)
 		ret = -EFAULT;
 
 	/* completing the iocb can drop the ctx and mm, don't touch mm after */
-	iocb->ki_complete(iocb, ret, ret);
+	iocb->ki_complete(iocb, ret, 0);
 
 	kfree(priv->buf);
 	kfree(priv->to_free);
@@ -496,11 +496,9 @@ static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
 		kfree(priv->to_free);
 		kfree(priv);
 		iocb->private = NULL;
-		/* aio_complete() reports bytes-transferred _and_ faults */
-
 		iocb->ki_complete(iocb,
 				req->actual ? req->actual : (long)req->status,
-				req->status);
+				0);
 	} else {
 		/* ep_copy_to_user() won't report both; we hide some faults */
 		if (unlikely(0 != req->status))
-- 
Jens Axboe

