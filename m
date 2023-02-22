Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CA269F020
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 09:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjBVIYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 03:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjBVIYv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 03:24:51 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28BD36091
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 00:24:49 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o14so5375424wms.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 00:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoDBXxIwGnPn/N+fAuw0IHoKInuCKDC40+BxEOCNzKM=;
        b=S8GpQ9SMjpVHb7SjMrgNZq3985Y0MJs9poKo3P9pAQE2F4FjFnVu4IetLFgXoLPoF3
         THL3edDL/riy/2K+G4hRJk6Hvd1O3eMXtxr0FBld9/5hQFAa0klY4XabotdrIextSBG7
         s+1QkNQo03OiqUZfMtZ+6ffxWxTkmrm1BfupSWgC2Eih4PyLVDkNfBGrxa053ZvuKllY
         Tt2EupyR6wrdA7V278U2LBOKrMR2a8Ik6K7/NTd6R9qnYaDroIqtLZvG7GMwj0f28FFu
         IuKRDS/2/ATe4Nvg6+y2jrK12cLCC6uupl/d01RsUUTcZVQvUfaP2qdd1w3xpBWirBhM
         Gdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoDBXxIwGnPn/N+fAuw0IHoKInuCKDC40+BxEOCNzKM=;
        b=5f/kvjlPoQNyLqIpcVr9aKOLuL+XqUVl4Xou/FOZbKHFF8TypmL//Gr/xSX+ZLEA0D
         8e3uy4tzczR3gNckEJOJWU+yTKRmYTJon5DRu8G/Gmu3Hw8so9cdYJVkGZtnYETyc28H
         jasYd/2I9/oThKiIEd/cnB84c2uCD0ydLaxOg4+rrY25RCT45pLC0RdPjxamrl+3QQWN
         Mi2Wq63TZCJEM6Apz5fN/PpoILeJGachSn8FW7KLF5HGTjVmpBmstTOjGV6H/XAe/2TZ
         H4Ts7MbsI44yOUJXqYihuWMPJDEh4iYH2JRHkLEp/hz3VAlw8UVp/+x/5UZH7xFc3Fe+
         Jhaw==
X-Gm-Message-State: AO0yUKVOQ0WGEphEjkoK5nGtwGfxHzMhsV/Z5YpZ80qwOWz0DYsVS3UG
        2H4eQWwiLA7y/BrKmETgMA==
X-Google-Smtp-Source: AK7set9YYggJ3NmhX3smk7SDqoRSenXUVkIbAX80+dhYmT0mdvrnoT1d9YxRXSJsoh/UYfUl+Fm1Tg==
X-Received: by 2002:a05:600c:755:b0:3da:fd06:a6f1 with SMTP id j21-20020a05600c075500b003dafd06a6f1mr399702wmn.31.1677054288344;
        Wed, 22 Feb 2023 00:24:48 -0800 (PST)
Received: from IAS-200827.ad.werk5.local ([195.226.175.106])
        by smtp.gmail.com with ESMTPSA id i18-20020adfe492000000b002c56287bd2csm6952281wrm.114.2023.02.22.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 00:24:48 -0800 (PST)
From:   Thilo Roerig <thilo.roerig@googlemail.com>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, thilo.roerig@googlemail.com
Subject: Re: Receiving report multiple times when changing cpu
Date:   Wed, 22 Feb 2023 09:24:44 +0100
Message-Id: <20230222082444.419-1-thilo.roerig@googlemail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y0lk+IiDmrkmAfRk@rowland.harvard.edu>
References: <Y0lk+IiDmrkmAfRk@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > > As Greg mentioned, usbmon is a better way to snoop the data transfers.
> >
> > I have continued to investigate the issue using usbmon, but unfortunately, I
> > could not find any other irregularity, but the jumps in the report id pattern.
> 
> Did you check the timestamps carefully?  In particular, did you
> examine the times when each transfer was submitted and completed?  If
> two adjacent transfers complete more than one or two microseconds
> apart, that indicates a problem.

It took some time, but thanks to your pointers I was finally able to narrow
down the possible causes of the problem and it turned out that there was a
problem in the firmware of the usb device.

More precisely, I took a closer look at the timestamps of my usbmon log, as you
suggested, and it showed a pattern that changed once the duplicate reports
started. With this knowledge I could analyze the details together with the
device provider. We ended up sniffing the data on the wire and fixed some of
the issues by an update of the device firmware that does not show the problem
anymore.

On the linux end, I have moved some of my python code to C to increase the
read speed. I was loosing some reports because I was not emptying the hid
report queue used in the libusb backend of the hidapi library fast enough.

Thank you again for your great help.

Best
Thilo Roerig
