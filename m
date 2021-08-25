Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AD63F6C68
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 02:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhHYABM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 20:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbhHYABM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 20:01:12 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F083C061764
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 17:00:27 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id x10-20020a056830408a00b004f26cead745so50836648ott.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 17:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FI8NiXnuGqDVseyiJbu1jXqT5J4NBI4KNPS74JgzbAo=;
        b=Of/8gJWHaTSU6OQkxgFl1tgl1ZgAotxyWHt/y2PijzEqwCyJnFltRUn76qcTI9l0TW
         da9YiTDWKBt0OquUc1UdMWvYkCgoxNxeml2UP5a5gjK4lHy7gUYOM3ClHjHepNxHEVkg
         qmjJwnm33j5fdv6JhYrgbUUWNQ34c451xz2VOetHG6edo4Ve58/17/1l/PYBTvg1CYhT
         /vt9A68mxMj7Cd7GFpVDLGw3adSFoI3zx52c5uYawVztxvqGKijUZJovUBLV642nPnxJ
         m0s9D28ZvnYK05UGuJ6TQ7mWs47KzPDFyfTHc3UygdzGOD9zi0xkBrQDZM90DukRuzoh
         vHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FI8NiXnuGqDVseyiJbu1jXqT5J4NBI4KNPS74JgzbAo=;
        b=A3eiGrnaKvfWh8YptNbDfgDJ29fukwzT3YvRya+HkB0XGCScJvDTm5ao7xslfwsyJl
         OtcPhkltwkmDXiNxozkEbNE4kVOv/JbLK1FN+3KWLQ6hkSF4/pWnNDERfUxZo2mV8Yiz
         PpXd24ZwBVi7Z/0tjwSIugFlz9uDPugAiCrAUZjGt407wMVF6M0c/jOWBBKV7lXnXQNN
         5KR2VphlNht8aGRWu2cLjq/xHGAx6BaOQ2JYQgvlzdZK1HnlRqv0ao1KjZnY4UATNUor
         a12nbmeVumC5RJWPqnMbRCrMIBvvzfSY+l+/rlqXHqsRcSv4SMxmlcvZKvwm0DQLFMc1
         uptA==
X-Gm-Message-State: AOAM533PaT+78rycUb2+uqwFaeW4WLmrtqyRxHIJtMiQ4rEEDbimQnTz
        5w6cXYq67qWA6On3pSUiIypRqA==
X-Google-Smtp-Source: ABdhPJwZjsW0SoWUogdTPaGK9LKAJ6I8nEJ2K6kDpad5UMff3+9ZOaqf+Ke+7G1IDUei2wkkvUjm6A==
X-Received: by 2002:a05:6830:411f:: with SMTP id w31mr35123188ott.338.1629849626769;
        Tue, 24 Aug 2021 17:00:26 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g16sm4884932otr.20.2021.08.24.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 17:00:26 -0700 (PDT)
Date:   Tue, 24 Aug 2021 17:01:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSWIZ/BNoAaHPByK@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YOZ3CBNTXFTa+fNx@yoga>
 <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org>
 <YSWGRcla0/dPLDpU@ripper>
 <593dc3f5-268d-580f-76fa-0be00505ac37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <593dc3f5-268d-580f-76fa-0be00505ac37@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 24 Aug 16:58 PDT 2021, Bryan O'Donoghue wrote:

> On 25/08/2021 00:52, Bjorn Andersson wrote:
> > But isn't this role switching interaction (both B and C) already part of
> > the core/drd, so if we can just get the drd to invoke
> > dwc3_qcom_vbus_overrride_enable() we're done (and can remove all the
> > extcon code from the qcom glue as well)?
> 
> Provided we have an acceptable way of triggering when a role-switch happens
> - then USB role switching itself is a NOP here, its really just a
> convenience to invoke the callback.
> 

Thanks for confirming. Then let's come up with an acceptable way, rather
than duplicating yet another feature already implemented in the core.

Regards,
Bjorn
