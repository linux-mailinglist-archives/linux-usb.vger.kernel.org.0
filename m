Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDE3215945
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 16:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgGFOUz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 10:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgGFOUz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 10:20:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0191BC061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 07:20:55 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w3so29902581wmi.4
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/SQQ7AOqnp0abV0mTui8yYrs1UAgtqLR05qcleZcwQE=;
        b=Ed6JrprbDjk8AXD6SCOI9yh0CysVyAtZO2nt/f6l1uLVAF7tPqo9QHp4648VE6/P0J
         iJd3+qHMbx5g2R1VjGTps0BZqc1+nkfAtJ/DC0I/fty8HyNAXW3hQewEgWXpZQsoLOZd
         FNf6j1vFI9bDcSZ19YcgSjidaauF0qGEx+UPTOMQVosbA7mKScWrXlbSiIyC8j4b2kTz
         jQxjB+VuO/AByLPP+2/rnzTx6HTicNZY68TyLXs/k9slS+eZTpkmcJvLRvAKx+JyDmwI
         PdzTFhyFHuxZvHNiDL4SdAdv6hIll/6VmdF8GZqofG4QIjSUW5v789VNT8yUZRQAyw7i
         4C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/SQQ7AOqnp0abV0mTui8yYrs1UAgtqLR05qcleZcwQE=;
        b=U7WvQa54wyLT5cGryXtkVgjlQS0TSaCUz462QdbGUUu0zOU7urtrHW+2J9TdQPRw10
         yATeKdo82YMRZe8Ew+ZVdXu6IE72+hRnchSkFeg7IVwgahEeMJX9DN4iEUhtzn+59W+S
         jsFV4CBTJYhQllkADonAs+1xx/E6InIUTb5OFwF/4NzVbz6Rb3A+IBne6bxLBW4lo3mU
         mkEeAVK/VIA4JWJCL0xisATx8lW0C2H0VGxQYiUK7VWDlgA55nQtdNvR3D6TTDvFt1xT
         xunMrAgjw0+P0aLY4/lwuu1bSBpuuRBaR80QZ1FYgjliD82hBrr7g6zt6eu9DCjyf/yU
         9oZg==
X-Gm-Message-State: AOAM532n6v2rOqnXM/qKD+aAU+cDi48O8LXvUUSJ0WdW8cZvAiSMs5yj
        eIah1XCTFd2wH2Rtl6foqyOFxw==
X-Google-Smtp-Source: ABdhPJxttEL31vKF295CqiyvKNlNLZN2K0H1vn3bWACeSCGgEgewna0f80KeGgsIGvd6NVLZTGM+Fw==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr48281159wmf.162.1594045253749;
        Mon, 06 Jul 2020 07:20:53 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id x7sm24950797wrr.72.2020.07.06.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 07:20:53 -0700 (PDT)
Date:   Mon, 6 Jul 2020 15:20:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
Message-ID: <20200706142051.GA3500@dell>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
 <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 06 Jul 2020, Hans de Goede wrote:

> Hi,
> 
> On 7/6/20 3:33 PM, Lee Jones wrote:
> > Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
> > configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
> > last year.  No need to keep it around.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
> >   1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
> >   | ^~~~~~~~~~~~~~~~
> > 
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> This is necessary for adding Display port over Type-C support
> on devices using the tcpm code, rather then firmware, to do
> the Type-C alt-mode negotiation.
> 
> I have a local patch in my tree which adds support for this.
> 
> But Heikki did not like my approach, so that patch
> (which needs the bits you are removing) never landed
> upstream:
> 
> https://patchwork.kernel.org/patch/11199517/
> 
> Which is somewhat old now.

Yes, that's a just a little old now.

If it drags on for much longer, perhaps consider taking it out for the
time being and adding it back when you start to make use of it again?

> Heikki said he would look into an approach to this more to
> his liking. Heikki an progress on this area?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
