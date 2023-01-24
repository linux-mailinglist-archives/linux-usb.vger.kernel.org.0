Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8237B678F8D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 05:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbjAXExy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 23:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjAXExx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 23:53:53 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E32137B4D
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 20:53:52 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id n7so12706323wrx.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 20:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jq9qGoqSfaWb66NYd3pNfvT2WfQAhCftwFesWZusp/k=;
        b=Vd0vR2bYAnuBo1V3KSrR0ZIZgxHTAmyz8JpqT45ii6NMEPgu3WQdM5SF7i12ZBl6GB
         Ltpe0h02SWCTdaBB97YXxeTPuVPPPkXadj4OO18Kk21Z30dWMK3uTucYH049ynxkieFS
         oWJqi700Rvibrdca20q7V+DjKt2DVY7eZ6lf+l8G+vF49OUEuYy8umR7m2szZX+30FEv
         UlUrGUfTqX3P1GJ0xvnHoXP4qLY25oGpCGIcil+MT9SOTygAzS9OKAXjYMs50KuXTrOx
         lhMZ9olLpaQ2WL5A9cJeh1fIneHGkki8s365E+JBf7xfFXjWHFWHC49y7A+fy5ta2XIt
         ujVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq9qGoqSfaWb66NYd3pNfvT2WfQAhCftwFesWZusp/k=;
        b=aPVS0m9F1gj9swuwcZRcFfRD1opaILRP5pxJuYevWLGk2/OgPU3o8fhEmh9dO0TewG
         6WjEjSG4HMfjqZ3o+E1yJoCVFkfvsE8IE4kSbLZ2RJStUDXnOChGFkS2m1ESbhMN746C
         oED0dGveXxYL9qO0cIL9nDFLA9+MF0TsPJynf7tkOhB+Pbvs7rKoVh4acdAzqIVceyc6
         2H+FtDmOMhEEx5GsipgdRnT2GTCkOqjHM66Ts1zZ7wUJ4rUhOQ3aMY4yUKrldA03U49P
         9rpckHUoUpSKG3kaMiMfFuzsqM9hGOWBp2J7uwp1uYjwkSQvqS8y/pMFmXFVTrBYe+od
         gikA==
X-Gm-Message-State: AFqh2krSA3Du0FqqsD7nP9XJnqjrrk/Q0umlAfDVJAd+u8Ee72BE/g7S
        TSCf/GRztin9Yf+qEoOG0GfX5uXuOEmqOg==
X-Google-Smtp-Source: AMrXdXsUErSreCPHiwLc/eNX9FYL0XY6+oc2DEPDi2SgpnKo/2wZx/DKGd4SglJ/Xx3fh6WvsLV03g==
X-Received: by 2002:adf:aa8f:0:b0:2bf:5dc0:56c8 with SMTP id h15-20020adfaa8f000000b002bf5dc056c8mr13214109wrc.51.1674536030761;
        Mon, 23 Jan 2023 20:53:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f5-20020adffcc5000000b002bfae3f6802sm773956wrs.58.2023.01.23.20.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 20:53:50 -0800 (PST)
Date:   Tue, 24 Jan 2023 07:53:42 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     quic_ugoswami@quicinc.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: f_fs: Prevent race during
 ffs_ep0_queue_wait
Message-ID: <Y89kVv5jaw7hF/fv@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Udipto Goswami,

The patch 6a19da111057: "usb: gadget: f_fs: Prevent race during
ffs_ep0_queue_wait" from Dec 15, 2022, leads to the following Smatch
static checker warning:

	drivers/usb/gadget/function/f_fs.c:313 __ffs_ep0_queue_wait()
	warn: inconsistent returns '&ffs->ev.waitq.lock'.

drivers/usb/gadget/function/f_fs.c
    276 static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
    277         __releases(&ffs->ev.waitq.lock)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    278 {
    279         struct usb_request *req = ffs->ep0req;
    280         int ret;
    281 
    282         if (!req)
    283                 return -EINVAL;
                        ^^^^^^^^^^^^^^^
Drop the lock before returning?

    284 
    285         req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
    286 
    287         spin_unlock_irq(&ffs->ev.waitq.lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    288 
    289         req->buf      = data;
    290         req->length   = len;
    291 
    292         /*
    293          * UDC layer requires to provide a buffer even for ZLP, but should
    294          * not use it at all. Let's provide some poisoned pointer to catch
    295          * possible bug in the driver.
    296          */
    297         if (req->buf == NULL)
    298                 req->buf = (void *)0xDEADBABE;
    299 
    300         reinit_completion(&ffs->ep0req_completion);
    301 
    302         ret = usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
    303         if (ret < 0)
    304                 return ret;
    305 
    306         ret = wait_for_completion_interruptible(&ffs->ep0req_completion);
    307         if (ret) {
    308                 usb_ep_dequeue(ffs->gadget->ep0, req);
    309                 return -EINTR;
    310         }
    311 
    312         ffs->setup_state = FFS_NO_SETUP;
--> 313         return req->status ? req->status : req->actual;
    314 }

regards,
dan carpenter
