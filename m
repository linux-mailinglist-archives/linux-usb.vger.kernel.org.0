Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD52F713A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 04:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732734AbhAODyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 22:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730909AbhAODx7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 22:53:59 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C9DC061757
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 19:53:18 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id b8so4033053plx.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 19:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tT3zw+wutKrNa8Co413hr/hHyBjSjgdHrOf4X5xNFhs=;
        b=DsrMMqg9F+1Px2sPDqZdUgGwP93ERhpL5bEOLzqwQy8U3POErAeeHWZu7CikvBwhJR
         Cx0ri7/pI94PjfOebvmx/C7JPMJRAYsxBuuD8wvb/IdSngwI98K0xFMYPl9jlFda9PnI
         hjCff6dzQ+/UXb7IygUuNKgFxMOpH+t0apt+2CQTMLHUvnD58BY9HA/YhOvvPj1+gBFg
         R5mOxC7kY8214qatQTNdiIKmAgTuzi8MpYY+csf0QcyzvdVreAFg3iii7CMH94I6cJ94
         yb12OmUSGHSiMpWZd80jM0Tvx+61Vw62cme8XldYkIgyJrltQix+cUhAbSyKbc3mdRlF
         p+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tT3zw+wutKrNa8Co413hr/hHyBjSjgdHrOf4X5xNFhs=;
        b=ZyB45tBeg629hjch8kMh/YMdY74QVhqd2DxlmbqQUUoAft/f75xSi5aIXEpCbIVxup
         IiztErmdh+hhUvZ6LarWHVIfvQYyD1UYWnJtblTH8Pi44iun5XsDnWpRxcf57r00k/r1
         uWGJLlokaI0D2+TMNnrfuuI8IDVQ3VvIKFEuW+pc+gagq8W7Px1Be0NoNPbbVtAmDXGO
         aIZ7XdTfm3CE2q7FAxUl6McI9Q31kxmPxtw++0hCdvQoWWjGd8YsiSG5aOiQvZDj8UNZ
         7sWU2PuLINJzdjsVlHTdz/mjYlaDXvyxa9TQHVVrhiNtW2cfDm9HSWnPzXya6NtlpywT
         ZERw==
X-Gm-Message-State: AOAM530jpP0l+j4cMLBodqMvJkWwmhjJH/t+y2XD4C1+pfBXkE5PFtUZ
        VJ2VwUYEVdCjhEuYyhh3iMN0sg==
X-Google-Smtp-Source: ABdhPJwG6noOUoe5F82IBgJp7PmJa7W32QezFHGNcdbgJ2XwxXWHk5wtLC2AMsmPWmqZcOqtg0MzvA==
X-Received: by 2002:a17:90a:ab8e:: with SMTP id n14mr8128600pjq.96.1610682798483;
        Thu, 14 Jan 2021 19:53:18 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c11sm5382736pfl.185.2021.01.14.19.53.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 19:53:17 -0800 (PST)
Date:   Fri, 15 Jan 2021 11:53:13 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: add URS Host support for sdm845 ACPI
 boot
Message-ID: <20210115035312.GC2479@dragon>
References: <20201230124925.19260-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230124925.19260-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 30, 2020 at 08:49:25PM +0800, Shawn Guo wrote:
> For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> holds the memory resource, while interrupt resources reside in the child
> nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> creating platform device for USB0 node, and then retrieve interrupt
> resources from USB0 platform device.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Just sent out v2 to search child using node name rather than assuming
it's always the first one.

Shawn
