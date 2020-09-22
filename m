Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2310C273EFD
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 11:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgIVJ4G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 05:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIVJ4F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 05:56:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BD4C061755
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 02:56:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z4so16343642wrr.4
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=mbMaRPaRf3fawjRPAEw1Cpka4kfwr3UGu5HSBhGaCRo=;
        b=aBWF9DKvQYuRfxDNggtrKjN1TRs2eCCyz+cFGg1Sditbjw7mbRH7ygDqlrJj4A2FCo
         2GAfI5s/SYl/m+WFdzeMvQSohOETBRh6EDPgVwlpFxS3I2adfdab+Olg+WxWp96rvkug
         advhneKhUaC3/Q1X4E28a13vH0dFuJF4HzMal6fGugolfJIqx2j3wAhXpuXzHCRLRdk4
         smUloDcSV5/DcHS/1mfiTawLohBrhTZ1PWwWWVgP9Egmmm5ok4I8zW4rqIDxWv7dTMM7
         II8yFKl3RMI2X8zyPWsNWzNkK1MCyq+RMT5QjM9RjdkmSXsJq1ElRohza173tnqEnLN3
         8txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=mbMaRPaRf3fawjRPAEw1Cpka4kfwr3UGu5HSBhGaCRo=;
        b=AYBQwFRflpuProRc2CdAGuos9eCQ2VbvVU1HSBU6VeLoiYEQhzvP3LKbWU+vKRpyk/
         7z3Ktv1Vgw0ddN9/g9hCbDOoO1bdB3jECV5zjGRQpxPCECuEMqCnTzELlbCz++hAxRx4
         qcvykgy7lFDem3zG3JTbLXYXGt5TIXie4TvD1kHx5UP1J714F2ZFHM22rNtlwZIpXXIA
         m3sopyu1eOCWsG8tXJOtxGfd+d9jN3H60hAs0eJ6IHs7jv5dKd0GDeaLuKFnVSB2R3pF
         Bhn5IMHYI91wKgvOwdpEDpB2EJrFAZrqAVqEmEvULM2QuzQ8/4XkZgi4yuvD5o4PKVn2
         IbKA==
X-Gm-Message-State: AOAM530xmAqOQ1ZYVOme3nmfk/HHSID9pVjewE9aXQUCs9TzpzQ2jsfQ
        ezMI0nxkuRozrBHQhbJclplKJiGnnRGkhA==
X-Google-Smtp-Source: ABdhPJyxpg6nW13Xw+h3cM1xvHqa8uoNlYPiHBrq0+leK8Dl/gPGj0IWHQk+/NzLboS9PFTUk6edtw==
X-Received: by 2002:adf:dd44:: with SMTP id u4mr4236786wrm.22.1600768563831;
        Tue, 22 Sep 2020 02:56:03 -0700 (PDT)
Received: from daniel-ThinkPad-X230 ([2a01:e35:1387:1640:1853:cc4f:48fd:e3ca])
        by smtp.gmail.com with ESMTPSA id k12sm25569342wrn.39.2020.09.22.02.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:56:03 -0700 (PDT)
Message-ID: <5f69ca33.1c69fb81.f95dc.2c96@mx.google.com>
X-Google-Original-Message-ID: <87r1qup231.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     "\<Daniel Caujolle-Bert\>" <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
References: <20200921135951.24045-1-johan@kernel.org>
        <5f68d281.1c69fb81.86428.99fb@mx.google.com>
        <20200922070818.GA24441@localhost>
Date:   Tue, 22 Sep 2020 11:56:02 +0200
In-Reply-To: <20200922070818.GA24441@localhost> (Johan Hovold's message of
        "Tue, 22 Sep 2020 09:08:18 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

   Okay, I replied to the second patch, hope I didn't make any mistake.


Cheers.
---
Daniel
