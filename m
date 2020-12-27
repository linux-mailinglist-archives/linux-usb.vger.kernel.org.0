Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C18D2E2FA4
	for <lists+linux-usb@lfdr.de>; Sun, 27 Dec 2020 02:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgL0Btp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Dec 2020 20:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgL0Bto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Dec 2020 20:49:44 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F179C0613CF
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 17:49:04 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id z12so4130619pjn.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 17:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rvoZwIIkGbNzMPEeuZedp4bprfT1khhUX1S+1EJV7Eo=;
        b=UrUm3t5bMEup8NqBWMUCwroxSb4f65zFj1RYJZhGcneTXJNOgJTu7e/ETtoKCXU2bj
         8f5Ic81pR1sNa5GhFdLSikkd4Xc34rTeNAGty9I5Lwasj+KeRG7VGQ326w+wJz9pshK1
         5wMoE3K7gU7XvgVwFGIqfw8b+MJuqltvDawSTiYTyiuKZEGk6G7xSGU7t7y4iU3tUUIO
         xLPM7OL2AT7Jbiu8BWX5n8rwnShuYTAyjxpeNBcs5EfEKzXSDsGkLNd8CrPE6nz9XobH
         wwiHO/2ysG6pZtefcrs8fRXGgb76RYSE+PPEpwhNWKiaZjXqomo0mUOgYzUU0lJGD8c9
         S7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rvoZwIIkGbNzMPEeuZedp4bprfT1khhUX1S+1EJV7Eo=;
        b=qs1gysY+do951vBW817GCccF+AN8OW3OMSEZgpU/7SVDtBoyrAaRvsWIvCKsQZ5KdS
         2G3PmexL5fD/ZMIyE2tZF4CHDmrd1mzVO+YoEkhEJU37Q6f+mAmNFVKkpKUA/yfR6Zui
         Z4bWTJhD1iDIUALQATWxPiKkIMLAsgWk7A8uBJpwCPEA/vJd+rt3saAPHiqtc3liTUIb
         lsLi0WG5XFPwnSZbUuB3nLNyg3d7FeBE4bRGuLIZNlNar1tI+VtAbR40HPZPQ8rT/gXr
         qMECwzoy+6USvlSbH1fcDAL8/XGF2wczV3xtvrfTRD/yzJWkSvURlfYTKIsUUuBryWi6
         AFqw==
X-Gm-Message-State: AOAM533aRjskNp2cO36FS0J25vJ2izH9uDk4S45CnT8J1Kt7KwSxTIWb
        r51EabQX9ul+PMk31dnteHh2LqYVMW2MlQ==
X-Google-Smtp-Source: ABdhPJyeRx6L7fA47FjNjK6BuWGRuDQMC1PoucA1mocp7SQPmZ7ly6Np1+OL9sskn0gRc1MDzj5OMA==
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr14987527pjy.19.1609033743895;
        Sat, 26 Dec 2020 17:49:03 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
        by smtp.gmail.com with ESMTPSA id z11sm32740159pfj.191.2020.12.26.17.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 17:49:03 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 5D19A900908;
        Sun, 27 Dec 2020 01:49:00 +0000 (GMT)
Date:   Sun, 27 Dec 2020 01:49:00 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Message-ID: <20201227014900.2ff91bab@gmail.com>
In-Reply-To: <20201226165230.GB606763@rowland.harvard.edu>
References: <20201224125012.4df1d26c@gmail.com>
        <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
        <20201226004627.657ba339@gmail.com>
        <20201226165230.GB606763@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Alan,

On Sat, 26 Dec 2020 11:52:30 -0500, Alan Stern <stern@rowland.harvard.edu> wrote:
> The kernel shouldn't have to sit on anything.  The requests should be 
> accepted immediately.

I must have used this sentence incorrectly: I meant what you described,
the kernel accepting the transfer and the module submitting it to
hardware whenever able.

Also, strictly speaking (and to avoid confusion if I failed further at
English expression in my previous emails) aio_submit itself does
succeed, so in a sense the kernel already accepts the transfer. The
issue is that the transfer completion happens immediately after, with
this EAGAIN status.

Regards,
-- 
Vincent Pelletier
