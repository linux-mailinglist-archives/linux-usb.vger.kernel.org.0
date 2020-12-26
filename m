Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542622E2CC1
	for <lists+linux-usb@lfdr.de>; Sat, 26 Dec 2020 01:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgLZArM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Dec 2020 19:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgLZArM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Dec 2020 19:47:12 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9934C061757
        for <linux-usb@vger.kernel.org>; Fri, 25 Dec 2020 16:46:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id iq13so2884602pjb.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Dec 2020 16:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFR5sTckgEIc1wHx2QQjmBOJK85hU4naATh9H7iRMKA=;
        b=mzJzZYJ+VEm/Qw+99Jgtb/aksBWqQsv9IpZPPBEPJ29sUFrRwKw30b9GGhvmDx3DTc
         Hl88dt3qbu9Fhjo/RX7kV+Hhceml4qStIVbJGjAPAVSWnWnIIr3VINwPKc0zxwvPtsjq
         KqjTdA/ikY9QsWc0yqaRLnLsdWKoHF44rgXKwi+8qH276G/GIdc1YKk/1mHWUs431zit
         s3+OCYcHNfwrsUFA3k+68HV5Mq3DBSUJhi21G/0/xlN/UVYsdceJIl5nJlv8PysQVRpV
         ADfMYhKn9HfddwsAIZwm5KJR6WqFTzK+ogEC2HIulKOOzq2czY9sX5PF7SyNbkez88v9
         WyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFR5sTckgEIc1wHx2QQjmBOJK85hU4naATh9H7iRMKA=;
        b=FEvp+U4Z94oi8wxNUa9iYcfdcYXNI5gSlw7xa5ldqRTIIacZv6p3V1QZGIppRw5LZJ
         xSJALR3/3Be6J/6nSSTQ7MpPtCM/b8t/57qJXTJkX2e9+KjuJjNdBS/NJd4DtCEOHKkK
         G5fbNBLRVdp+QhYtl2WsRga3ACP3Egv65vMn/UyVO8R+98cVJGLa7zqRNy+9ILSFHqCl
         XDgRo7tAmc9t+kPG+bdpkKWlswK1ZjRnpV+s85CpSGKXdQsNoir+YH5Yv8XL0sTqa33O
         fDxIu/3mCoAujfCNOCdt27nJznddf7/FC2XYTemNjb6gfJq3HUmfET0Ph3zS7etQoNqi
         UMYg==
X-Gm-Message-State: AOAM533bXo3yF1MmLeyfeG1dF0nu9OgBv1MtSHYC1BqPIBhHF+AhThW+
        IQORsXZ7nXY9Akmn8VZga5/wH5a2xsIRlg==
X-Google-Smtp-Source: ABdhPJzgKNM4LpJhzVHp4smizZqW8YBDwztwWeJq4awpxASm/fLuqV99gVZy4K+gArv1MMpyF0VfUA==
X-Received: by 2002:a17:90b:3505:: with SMTP id ls5mr10559427pjb.55.1608943591375;
        Fri, 25 Dec 2020 16:46:31 -0800 (PST)
Received: from localhost.lan (p8006072-ipngn42301marunouchi.tokyo.ocn.ne.jp. [180.34.60.72])
        by smtp.gmail.com with ESMTPSA id p9sm30050178pfq.136.2020.12.25.16.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 16:46:30 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 19971901092;
        Sat, 26 Dec 2020 00:46:28 +0000 (GMT)
Date:   Sat, 26 Dec 2020 00:46:27 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Message-ID: <20201226004627.657ba339@gmail.com>
In-Reply-To: <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
References: <20201224125012.4df1d26c@gmail.com>
        <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Artur,

On Fri, 25 Dec 2020 10:56:02 +0000, Artur Petrosyan <Arthur.Petrosyan@synopsys.com> wrote:
> According your debug log core enters suspend on receiving an 
> GINTSTS_ErlySusp interrupt. It means that the driver goes to L2 state 
> (suspend). In suspend mode accepting and processing EP requests can lead 
> to unexpected behavior. That is why the driver rejects EP request with 
> -EAGAIN.
> 
> As core may use power saving modes which are initiated by the Suspend 
> interrupt, then in any suspend mode whether it is hibernation or partial 
> power down the core registers are not available. This is why we avoid to 
> get new EP requests.

This is my understanding from reading the commit history, yes.

But from userland's point of view this causes a weird situation:
- sequence 1:
  - userland submits buffer (ex: to receive the next host request)
  - UDC is suspended
  - UDC is awoken by host initiating a transfer
  Result: the AIO completes successfully, the suspension was completely
  invisible to userland, and I'm happy.
- sequence 2:
  - UDC is suspended
  - userland submits buffer (ex: to receive the next host request)
  Result: the AIO completes with an error, the suspension got in the
  way, and I'm confused about what I need to make my code do to
  recover: should I change my IO completion codepath so that it
  resubmits any EAGAIN completion, hoping to catch the UDC at a time it
  is awoken so the AIO finally sticks and everything can sleep until an
  actual transfer completion ?

I do not know if it makes sense from a kernel point of view, but would
it be possible for the dwc2 module to sit on the AIO requests while the
controller is suspended, and submit them when it wakes up rather than
failing them immediately and sending them back to userland ?
I expect that this code actually knows (without polling) when the
controller is awoken.

> The main question is why on usb bus seen ErlySusp interrupt. Is it 
> initiated by host? If yes, why?

My pre-USB-analyser guess is it would just be the normal USB-idle-to-
bus-suspend behaviour. Besides device enumeration, the host is not
accessing the device right after it is plugged in, so there should be
no reason to keep the bus ticking.

Unless there is something fundamentally wrong with the suspension
happening at all, my biggest issue is the poor userland-level usability
*if* suspension happens, and the race-condition this behaviour creates
(IO cannot be submitted before the UDC is bound to the gadget, and IO
cannot be submitted after either if it happens after an external event,
leaving only a short time window where it works).

If I am missing anything there which would allow userland to guarantee
keeping the UDC awoken so the transfers would stay in-queue, please do
tell me.

Regards,
-- 
Vincent Pelletier
