Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B51F70FD24
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 19:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjEXRtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 13:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbjEXRtN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 13:49:13 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7F4B6
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 10:49:10 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6238b15d298so348446d6.0
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684950549; x=1687542549;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aNjYEyfiKsUmWEvKSDejhmYGJVl/ll0zEWjyhs/ooFo=;
        b=sLQm0jjAkwCgIsIHcCWCXHo55i8r4fDg7I7zjNHWZ2y5ZOUsgCaSi8CU7grNt5Fqsy
         4t172XFm3VuzqrbD3/e5u0PX3mfByOYz6fd5+YQjvYj167yK2woosOTnND+jsMOZroXV
         pYnJEGL4QxWk6YyW8bh4VMGHpP0JmXjgGcr8UoRzgSMwpHwsr5st9NjEAaGT4KaOih6M
         6rI8pc5BzZnivmUtwQhdBB+1u8ZmqDXFCGq7Zkn6+YkblaWUmzwWfDFIt7M4kzCj98kX
         wLhcAYyldV4KN2lQIL5tGld2P+J5dbR6in8EAZKgP95ew2Ep1UcDrL28onTN+O3UHxA+
         xF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950549; x=1687542549;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNjYEyfiKsUmWEvKSDejhmYGJVl/ll0zEWjyhs/ooFo=;
        b=YrV/+BR7LIVFs1yAsDPJTt8oar8oYmBYURxeA4oXoGaK/Voe+hEA5bsIuxJVZKp1qI
         10M4yhEfz105XQUqevBXcWVZGYUJTLoZzshIasVMDqG3M/4cl7N8mDoJxaoMZwwjOXHU
         MTaMmAivBYtaGbzkI3L6D9mfI0zgxlD951NIQCTE6ZCVQ1Bgl+KwGGcsF9Xcf9Wck48a
         bn9nM1sPJyW/2HJSIRgXyACmu322UKUjKAZ2ZFN8XhHMvXps3VPdYa6kuxPSTY33RVrm
         qwTdilLl+Us+WDzCRdKI3g6trizshkb1eI+S/LoY8SqkcNgFcd/CvtWHeBNIxqcc370f
         dclQ==
X-Gm-Message-State: AC+VfDyFMUtJ2cRGIAXY6gG6GJVQ0rZq7Xno3jApfwBuq3Ua/NFJUrqq
        x+OHqHIdzfGNSOEE5/X+Wvy8o720V/U4LzOietQ=
X-Google-Smtp-Source: ACHHUZ5e5brC5NmkWwjcHV+V8PU/EvkRJuV7iI9viikNCH7za9MhYfCzeSOCNL2JpzpF1ME8586dhGM2/eIWEwZiEvw=
X-Received: by 2002:ad4:5e8b:0:b0:625:aa49:ceb5 with SMTP id
 jl11-20020ad45e8b000000b00625aa49ceb5mr3010106qvb.62.1684950549539; Wed, 24
 May 2023 10:49:09 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Timofeev <alex42timofeev@gmail.com>
Date:   Wed, 24 May 2023 20:48:58 +0300
Message-ID: <CAM82uABnohNw1Rv8q7qJi-WT9wXCuHyYV5w3++A_EeaodZr46A@mail.gmail.com>
Subject: [BUG] Potential race condition in usbip attach
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        skhan@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

Sorry if you have received this email twice. My first email contained
html and was not accepted by the mailing list.

I think I have found a race condition which can be triggered for
example when calling two usbip attach commands in parallel on the same
host.

In file linux/tools/usb/usbip/src /usbip_attach.c:
In function static int import_device(int sockfd, struct usbip_usb_device *udev):

At first two processes may call usbip_vhci_driver_open() before
entering the do-while loop.
Next they both call usbip_vhci_get_free_port() and get the same free port.
Finally, they pass the same port number to usbip_vhci_attach_device().

Current recommendation to end users: run usbip attach commands only
sequentially.

Best,
Alexander Timofeev
