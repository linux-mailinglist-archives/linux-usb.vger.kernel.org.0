Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBD821F31B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 15:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgGNNzC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 09:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgGNNzB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 09:55:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02012C061794
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 06:55:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so21757089wrp.10
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NBl6qTXtY70y2AbXcuTUZ62FPRexxmOk23eaRBsntgA=;
        b=AqOLcnvw3OiqvcM4Zn8Gj7MsWpqfygrPWiSuIpNhmQ3HEnpVRCyuWIRjrhEF6yK54s
         uJbvDHTZ9DTvRD0GE/W/oJY3yP1KdOO706UKdbmhoJvTYszJ5MtsU8nMjzx/yHt3iYda
         AQ4hnTtC3xXstiduFRxNmUnHv6ypu+oGd3sDtyeRAbL4xgc61rQKEOSvNrX8axJ6tdZz
         KPk8VhfNS7FLCrPWVb2dZnmCWbkGJnNkyBucMLPfihDXeKI1VrxCAJnsI4Q/e2snIOzP
         cQC0xrRkaioXHK9t/DxZW9RtBf3yeuRFIclbU8gPmKSxgx+W3CDMvZIpkP9HQsct6QCl
         T6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NBl6qTXtY70y2AbXcuTUZ62FPRexxmOk23eaRBsntgA=;
        b=DHt7gl7xoszWeBH8DhreyQCFMGOthP1Dma/796qW+Gn/DurXmmGC/C8Y8EFd5TkIa+
         x67bzf3SAh8mfhtErdMSAlHDgTClgRSauS6B5X7GldKfwrP5KHeH3Zew0SL5elcPgbdq
         FwMnnV4U1/sgLjubmQgAKbhgCMaLWfUeQvuIdjlizWnJ4ykJpWM8hQadgOmg0/ryxLwc
         kw7+uByZM6ag0/EM6kNMcSZifSk7SjB+X6tUEAF10zBKlnhFfB6SvNcbf07W7LggT/us
         prZJHkGirHpa3rk3/kYWHd4SI9f9MH3Wu+xo8uudt8R14DS2XIoRz65hORVPWnxmcWIb
         FuXA==
X-Gm-Message-State: AOAM5310CkalztQDWsZz+bwfPAIqnF6giACu7Ed9hkPTrTBR6yVAAd4I
        2WvK5e0D9dPghAfu+NWuIu1yig==
X-Google-Smtp-Source: ABdhPJxCS6QuKrXyXdOkP6wM0S8ieLrJvySK5vovEEs/0nduckyaFy8F3h1Y1MLlt0oQsqL0NW/XWA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr5941520wrn.143.1594734898874;
        Tue, 14 Jul 2020 06:54:58 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id k126sm4968334wme.17.2020.07.14.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:54:58 -0700 (PDT)
Date:   Tue, 14 Jul 2020 14:54:56 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
Message-ID: <20200714135456.GB1398296@dell>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
 <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
 <20200706142051.GA3500@dell>
 <65f27abc-69c8-3877-be5b-e5e478153af9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65f27abc-69c8-3877-be5b-e5e478153af9@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 Jul 2020, Hans de Goede wrote:

> Hi,
> 
> On 7/6/20 4:20 PM, Lee Jones wrote:
> > On Mon, 06 Jul 2020, Hans de Goede wrote:
> > 
> > > Hi,
> > > 
> > > On 7/6/20 3:33 PM, Lee Jones wrote:
> > > > Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
> > > > configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
> > > > last year.  No need to keep it around.
> > > > 
> > > > Fixes the following W=1 kernel build warning(s):
> > > > 
> > > >    drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
> > > >    1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
> > > >    | ^~~~~~~~~~~~~~~~
> > > > 
> > > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > 
> > > This is necessary for adding Display port over Type-C support
> > > on devices using the tcpm code, rather then firmware, to do
> > > the Type-C alt-mode negotiation.
> > > 
> > > I have a local patch in my tree which adds support for this.
> > > 
> > > But Heikki did not like my approach, so that patch
> > > (which needs the bits you are removing) never landed
> > > upstream:
> > > 
> > > https://patchwork.kernel.org/patch/11199517/
> > > 
> > > Which is somewhat old now.
> > 
> > Yes, that's a just a little old now.
> > 
> > If it drags on for much longer, perhaps consider taking it out for the
> > time being and adding it back when you start to make use of it again?
> 
> Ok, I've just submitted a reworked patch-series upstream which
> actually uses this code. So please drop this patch from your
> patch-set.

No problem.

Thanks Hans.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
