Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD296C2A8D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 07:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCUGjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 02:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCUGjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 02:39:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32DA93D4
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 23:39:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so3932304wmq.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 23:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679380740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTI/3y6/4vOBgW+moLDlryPREyYZxhi4fK46WajlhGg=;
        b=mF0kT700tsbgh0fk38JkizGVjGSSm19x2CBzRZ8GJLcwuqR4Pn4Ran39/rRxeqtYPo
         saR0PBqeCFXvwmqmnJ4gBB2UvVNCPFecZ7HmWPeRV4JeRn/NrJ9YtmqYCHKpF2rRztCE
         Qy1fdyOZRotCUILfKT1MGWze0Z/vDpZ7QhBNIJ+diWo0Guf6te6eeBoX6GWZZPKWGcK/
         ENIbkASyg4EXymLvlf9Sy4VV7uWbKdK6bnd5fgKD7snCbN0rl6eT2fw9QZqM8BjkG1ry
         EONFNOuEw6CE5LttntCTLBy2Iu/vquci09qFkxlp5lrU9G/umFNSjKmaPXorki0anQLa
         I6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTI/3y6/4vOBgW+moLDlryPREyYZxhi4fK46WajlhGg=;
        b=EwEU7uSdWkisRqy+ZnhkHrkyBr2RqNkfoqRD8rRWcr/Dhvx+Zy1ndljF6xKwKiAOJu
         DYi/aL4+7SytdeqRDZm2ZHXG0R78DVG8v93E5pEVUQ9DivjVT89Y4ytS2L02N0YWcOKP
         sGtDBvIqvnDW09PcbfwiduOzhO3By1zmrA96tS5JnMhNfGj6s9J96V3NgcJjM1sN913U
         LFZrq0a59hoQMCxM2mZGeYqBs0u9p7xfrxvjLOJWdCqMuiQXiWfxAG/03KUrfRWkcuNB
         Vk0u6ytzdBoPbtN9R59nPDFXtWAWUMoKvmMFD0980ODs+ysXO23jn/aHnLbkk+6KJf9Y
         mNEw==
X-Gm-Message-State: AO0yUKWEoBucxE3FDzF/5VVViedXKgCMomPlv+ys3tiNCW1CGI9SSlxG
        s7cuAnJ/QYdC4sVBmJWk3qWoTWl7SmQ=
X-Google-Smtp-Source: AK7set/GNItA6RAf9Js9B3cV2yO7BSmbTEJBJlBA+QaWhoIhz1dreICllkSRdFv9p+v74gG4/R+XSw==
X-Received: by 2002:a1c:c901:0:b0:3e2:201a:5bcc with SMTP id f1-20020a1cc901000000b003e2201a5bccmr1492723wmb.33.1679380740105;
        Mon, 20 Mar 2023 23:39:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b003e7f1086660sm18757705wmb.15.2023.03.20.23.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:38:59 -0700 (PDT)
Date:   Tue, 21 Mar 2023 09:38:52 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     pawell@cadence.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdnsp: Fixes issue with redundant Status Stage
Message-ID: <23244476-3591-474f-a76a-5eb6e87dabf4@kili.mountain>
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

Hello Pawel Laszczak,

The patch 5bc38d33a5a1: "usb: cdnsp: Fixes issue with redundant
Status Stage" from Mar 7, 2023, leads to the following Smatch static
checker warning:

	drivers/usb/cdns3/cdnsp-ep0.c:470 cdnsp_setup_analyze()
	error: uninitialized symbol 'len'.

drivers/usb/cdns3/cdnsp-ep0.c
    414 void cdnsp_setup_analyze(struct cdnsp_device *pdev)
    415 {
    416         struct usb_ctrlrequest *ctrl = &pdev->setup;
    417         int ret = 0;
    418         u16 len;
    419 
    420         trace_cdnsp_ctrl_req(ctrl);
    421 
    422         if (!pdev->gadget_driver)
    423                 goto out;

ret is zero.  len is uninitialized.

    424 
    425         if (pdev->gadget.state == USB_STATE_NOTATTACHED) {
    426                 dev_err(pdev->dev, "ERR: Setup detected in unattached state\n");
    427                 ret = -EINVAL;
    428                 goto out;
    429         }
    430 
    431         /* Restore the ep0 to Stopped/Running state. */
    432         if (pdev->eps[0].ep_state & EP_HALTED) {
    433                 trace_cdnsp_ep0_halted("Restore to normal state");
    434                 cdnsp_halt_endpoint(pdev, &pdev->eps[0], 0);
    435         }
    436 
    437         /*
    438          * Finishing previous SETUP transfer by removing request from
    439          * list and informing upper layer
    440          */
    441         if (!list_empty(&pdev->eps[0].pending_list)) {
    442                 struct cdnsp_request        *req;
    443 
    444                 trace_cdnsp_ep0_request("Remove previous");
    445                 req = next_request(&pdev->eps[0].pending_list);
    446                 cdnsp_ep_dequeue(&pdev->eps[0], req);
    447         }
    448 
    449         len = le16_to_cpu(ctrl->wLength);
    450         if (!len) {
    451                 pdev->three_stage_setup = false;
    452                 pdev->ep0_expect_in = false;
    453         } else {
    454                 pdev->three_stage_setup = true;
    455                 pdev->ep0_expect_in = !!(ctrl->bRequestType & USB_DIR_IN);
    456         }
    457 
    458         if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD)
    459                 ret = cdnsp_ep0_std_request(pdev, ctrl);
    460         else
    461                 ret = cdnsp_ep0_delegate_req(pdev, ctrl);
    462 
    463         if (ret == USB_GADGET_DELAYED_STATUS) {
    464                 trace_cdnsp_ep0_status_stage("delayed");
    465                 return;
    466         }
    467 out:
    468         if (ret < 0)
    469                 cdnsp_ep0_stall(pdev);
--> 470         else if (!len && pdev->ep0_stage != CDNSP_STATUS_STAGE)
                         ^^^^
Uninitialized.

    471                 cdnsp_status_stage(pdev);
    472 }

regards,
dan carpenter
