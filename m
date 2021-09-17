Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB2E40FE67
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhIQRNu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 13:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbhIQRNt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 13:13:49 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0978C061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 10:12:27 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id b7so9752883pfo.11
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pO0Yb3IpAcGP/Dt2jtIam9w3vyDIYJvDsQlZl6HHejM=;
        b=OPyh4O24J7DpGeijzAXNDm5Dy0jm/LvXe14A8C1eWVh8iggQZ3pPhrkqI79MpH4mm+
         5Qrb1b0RYgrBsFTH7+DjkZRy1XD9/g8nzwMguP9xcsks62OnjqWdz7NOsL/+zJyU5w1C
         DVDUfcotaxx5eYR0yPtTCWkPPoueOLxpLGYhv/GfI1orfEERYFjbxvAPLspN/pkcXUzZ
         gBMGwxmP/jCPkVsRED8vPMjf+AiRKWnMPAHZGGGUHS4yJSuBred9AlW6acOQa+A7N+NB
         I2V/8nxGAg7bYSzm81bSjZcXU/JKZVjB2dsTPnAF3yDSM6gqZyiRAtnC906nzKjQ3qgR
         SIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pO0Yb3IpAcGP/Dt2jtIam9w3vyDIYJvDsQlZl6HHejM=;
        b=zSnIkj7ZAsnF9t6qMKOPk/O2PQmS1W61msK0O1yJoIaZ93a/+CKPsreeY+QqGEmGiV
         TsEaUXDwu/BCVpGsq82LxP96CP2oWLbcsDVs/NZj+4gmnsf+ee7D1wruQB6YOFLMr0aV
         FJpuVVmSuvLflcm0nkbL2iCqNd1CMOXegrQAGnFfPMVFS7kC1U6zWeSrMDqQyuQw21nl
         PlwDwBFu4Qn2RLibjsV7XGBd/VhtuSu2+BbOPe+sdPdvbjMakMo12lPhbANoMNug/a9y
         IbtbT6lA6+L21QkcKUOpRiruVppVtJrkEYz6qsFN18HVMfFIezZ6IbuEYrV5AjGNjZUc
         j5rA==
X-Gm-Message-State: AOAM530zd5aoo+ERpGHpKwJC94kohF+W1KauVoK1lux9CGljfn/WO8bU
        rlTRoJKfioB9YXDUDByyPbDd5BRVS28iWZGY
X-Google-Smtp-Source: ABdhPJyx4vWWRSbdGGGBKJkVUGMPxin8gkPL9xsToYha8NcIgzBiUE3PCv1cB3nt60LhMK98lwvpmA==
X-Received: by 2002:a05:6a00:174a:b0:433:9589:bdb5 with SMTP id j10-20020a056a00174a00b004339589bdb5mr11800681pfc.5.1631898747121;
        Fri, 17 Sep 2021 10:12:27 -0700 (PDT)
Received: from ws2 ([185.65.135.245])
        by smtp.gmail.com with ESMTPSA id n22sm6654639pff.57.2021.09.17.10.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 10:12:26 -0700 (PDT)
From:   Andreas Bauer <andreas.bauer.nexus@gmail.com>
X-Google-Original-From: Andreas Bauer <Andreas.Bauer.Nexus@gmail.com>
Date:   Sat, 18 Sep 2021 00:12:15 +0700
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Message-ID: <YUTMbwQCgxPGsnN2@ws2>
References: <YUNbDyoTPa+5J9Od@ws2>
 <87pmt7ahtj.fsf@kernel.org>
 <YURAlSpAWT0s9dVr@ws2>
 <87lf3va9hr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf3va9hr.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Fri, Sep 17, 2021 at 11:29:02AM +0300 schrieb Felipe Balbi:

> that's okay. It's because of this sort of thing that we've switched to a
> configfs-based approach where we don't need to make assumptions about
> the application. That's also why the pre-composed gadgets have been
> moved to the "legacy" directory and we don't take changes to those
> anymore, unless it's a bugfix, which $subject doesn't appear to be :)

Ok... my intention was to fix something which is wrong, but as always
in life, things are complicated. I will not pursue this further.

Thanks for your input.

> We have configfs to cope with all of the possible variations, might want
> to give that a shot?
> 
> https://www.kernel.org/doc/html/latest/usb/gadget_configfs.html

Never change a ru....

I will eventually give it a shot ;-)

best regards,

Andreas
