Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2333151AEDF
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 22:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356868AbiEDUVK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 16:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351588AbiEDUVI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 16:21:08 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEDE4552B
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 13:17:31 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id e194so2683498iof.11
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=yH9SIsmoSPJcdsApaYK7CU/S0g+LBfnccoa+vx6Q1lk=;
        b=hmOf5bMBJhN+CBpfDrOvbYIPHC8P2lIYRKwijl0eqfJ/0zOYWfFPxSjwDimeQwBvS3
         ATtH1JA83UacGC6kGECQ1nDad2o3WqxHfuk15vNPkJgO1mXznzbS2srW7/yFl+ItYFuO
         /+GMW8utJiI0odMwX1M1y/iohoCPsWzfnIufA23OJ/btOvtuStGs/XHs4YwbSwLLrk3T
         XULRYDMn62u8c+yIpPkn4o5MreDDvEDUgOjrhJFeYlGidTWk7EqUzKYxNY97z6mRGF4N
         T46T454SgWrKHgHiflTnM7FpHjRn4gFCDw/6Ge4y/LDFPtOr7DtJPvJ4sD239V0Czari
         Mg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yH9SIsmoSPJcdsApaYK7CU/S0g+LBfnccoa+vx6Q1lk=;
        b=h/3iPshlGs2UAMVMFoS0Dr/+yATranx1Cq5TMWP/blHjZKz4QNtGXh1ndP03W6RtEp
         1LMh67oCCvpmzKOfsR2a5FL+ko9IfonGisgjr92z5h4QwdLBUAUyu8VVkeAUVRqL1Q2U
         eydyvPuARxf5sW8HbF/MtiaRXFpRBlVI+8bELYIG8ztyjmEHpgxHTQT1iak3+SQ5RfJL
         9bXX5SV4uxu3qnlhGZPJVae5DFJMXCRweyCyxda5yJYraq3D2DVd5YXwcGe4pwHXdl0H
         ZHn6sAvkxCFChFxNubuGwRCCuCY2Qe6HabWKgc4uXT8rGyvvDmMkZO9Uo6VMheND12jK
         X2dw==
X-Gm-Message-State: AOAM530vvZoOxFd0RCC20tXMqA32sOMJOc1yLSupZbfsF2mxRgXiq8Va
        jS7BIZAlyiqBmcFOwlAhFH2YsftjSF4NKmGq6GvdgEpI
X-Google-Smtp-Source: ABdhPJyWt40M5SRU5rfDnOMXx3Ry5ZJFXhh9ggAH0JH9V/ETWPRRmwW6ML5xtNfO7BUByEKiu0WbeZowEJmyp5OXooM=
X-Received: by 2002:a6b:18f:0:b0:65a:42e7:497a with SMTP id
 137-20020a6b018f000000b0065a42e7497amr8615326iob.218.1651695451143; Wed, 04
 May 2022 13:17:31 -0700 (PDT)
MIME-Version: 1.0
From:   James Dutton <james.dutton@gmail.com>
Date:   Wed, 4 May 2022 21:16:55 +0100
Message-ID: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
Subject: usb disk drive disconnect making readonly
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
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

Hi,

Use case:
Boot from a USB disk and run for a day.
Sometimes the USB link disconnects and reconnects.
When it reconnects, Linux cannot use it, and the Linux kernel has set
the device mount to read only.
Is there any way to allow a USB disk to disconnect and then reconnect
it, and Linux carry on using it, and not set it to a read-only mount,
provided of course, that it knows that the same disk was reconnected
without being changed.
For example, I have a usb disk device that goes into power save mode
if not accessed for more than 15 mins. When I come back to unlock the
screensaver, it does not wake up the disk, but instead places it in
read-only mode. This necessitates me to reboot the PC to get it
working again.

Any ideas?

Kind Regards

James
