Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1383F7B1A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 19:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242131AbhHYREV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 13:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240947AbhHYRET (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 13:04:19 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5914C061757
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 10:03:33 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w19so249088oik.10
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OxZWJOQjSVgdZik3q4X7bWzZ7ItlK9AMrSJQNfZd0ho=;
        b=IdAwgREPvQa+HVeBJeCHs9z0U9N4bNK61d3xQngQHNlQUG+/oZm+/iDTUeaDsec8zG
         /TpMrsav+Wn7Ts6Ibz3ER+6QdkGgzPCx1MmC++bHf5h9gOI2EmoAljQ0WSvprjfC6fXo
         al9cbBFCpJw6PQaLVv/5b8udIcz9weay/dkNYb78UvIFLxjFoPfECcw65YlZOim7sEvL
         ihFn/dRD97J+qR6/cDuC5//s6XyFTbFlKbDrs2+WZNt0U4CHc7N4zOkRiT2+CScc7FrH
         6ohznaOzDe7REUC2W2+H0lJn5W0+RPX1PoTRnsjcCZxfTcZ1knvpTs46fHf3OisLbyRW
         M+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OxZWJOQjSVgdZik3q4X7bWzZ7ItlK9AMrSJQNfZd0ho=;
        b=e74pwZ7KIAUIHnyMd7OuAk0RILCRlW/94TblJzzBMzkiK5GPOl59sj0L/4nYoZvVNy
         2LIusWkC2yCSsyxsy2ak7PJzyHPYWyXZNxonbs7QqcTEhv2RcrHX6foLNS/f27G9c3eu
         LSuI9LR91sIvFza7cELaPVpZM7C+SU3O9R1JvIi2G5DBzEIHpTOLUmf241pM2vOq/bVK
         FjG7zKgZjopb0ZZlIvCASuLZMkMN0n9szq12YPbe0y2a2f+eejs8FZJ38so7mWufrYaN
         lOWXeO5o5046KrUCfA636O/pOju/0NBjsptw+6igp+AOtzLKbexE/Mr+aAlJBweWSeVU
         TDNQ==
X-Gm-Message-State: AOAM531/O7AvLpQU+hHzItEsKDfgzIPJQ9szk3e992yDUGC2wJ4pSviW
        4gqvlQtdIcwYIq26SFY7T0hEmw==
X-Google-Smtp-Source: ABdhPJyhVDZXAOjj/S4f8SbIH/S2qCOI4BAM4FZwJg+HzaU+tPdduv3y5x9IW68zB/0u5ai2dQ+GAQ==
X-Received: by 2002:a05:6808:220c:: with SMTP id bd12mr8007639oib.13.1629911013162;
        Wed, 25 Aug 2021 10:03:33 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u19sm80376oof.30.2021.08.25.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:03:32 -0700 (PDT)
Date:   Wed, 25 Aug 2021 10:04:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSZ4MCy8HiSJPNTH@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
 <YSZzQXzrry+DFU6X@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSZzQXzrry+DFU6X@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 25 Aug 09:43 PDT 2021, Heikki Krogerus wrote:

> On Wed, Aug 25, 2021 at 08:53:29AM -0700, Bjorn Andersson wrote:
> > On Wed 25 Aug 01:18 PDT 2021, Bryan O'Donoghue wrote:
> > 
> > > On 25/08/2021 06:51, Felipe Balbi wrote:
> > > > > Hi Peter, I took a proper look at this again, hoping to find a way to
> > > > > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> > > > > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> > > > > changes.
> > > > I would rather keep the strict separation between glue and core.
> > > 
> > > # 1 __dwc3_set_mode
> > > Felipe wants to keep a strict separation between core and glue
> > > 
> > > # notifier
> > > Requires the core probe() to complete before the glue probe to work
> > > reliably. This then would lead us to remaking the dwc3-qcom::probe() to
> > > facilitate probe deferral.
> > > 
> > > We can be sure bugs would be introduced in this process.
> > > 
> > > AFAIK Felipe is not opposed to this, Bjorn likes it
> 
> Notifiers were proposed for the USB role switches already some time
> ago [1], and I don't think anybody was against them, but in the end I
> don't think there were any users for those notifier, so they were
> never added.
> 
> If something needs to only react to the role changes like I think in
> this case, then I would just add those notifiers to the USB role
> switches.
> 
> [1] https://lore.kernel.org/linux-usb/20191002231617.3670-3-john.stultz@linaro.org/
> 

Afaict this would end up pretty much identical to the notification chain
that Bryan proposed earlier; the dwc3 drd code registers a
usb_role_switch and the glue code somehow needs to get hold of that
resource to register the notification.

But the glue code has no way to know when the core/drd code is done
registering, so it has no way to know when there is a notification chain
to register with.

Regards,
Bjorn
