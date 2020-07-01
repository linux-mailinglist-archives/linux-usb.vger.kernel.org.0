Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A07210DDD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 16:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbgGAOhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 10:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgGAOhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 10:37:53 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02074C08C5C1
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 07:37:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f3so11830704pgr.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p5b1y2MCVOrf040MpW0TdG0kQXO6F6mzXFyW0gJdufc=;
        b=kkKcI0OVbYAJGemjVYNNL+0ckR5Q9wU/ipXVEdJtirMRmFBup7NRYDkBrgupNw7sf6
         UiOG2mxd5E/eNdFsG0hLQxh26dyfNc324KRcEXxz2w+KYmnrGXOH/umA09JNifLD/vlS
         JpgpL9MkibNa0fa6noEsSzAwWOnSVIwELavQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p5b1y2MCVOrf040MpW0TdG0kQXO6F6mzXFyW0gJdufc=;
        b=CHD4+SNXnCqHZnlYhJQa68l7aiXOMzQXUsulBSg/G23GVzlPg2iKRMbNx1QdFn5Pz0
         LlRojfuY2LcKp11kAGMcAR+uUXkFpAJHuLj+cnYJWpxVN6pYEJmRD+no9ckZb8602L+s
         u4PxIjzi578jFbTz6DiPaomkYwSsEF7amjLjDoNt02To7jhJFhVt0cvepazC+Ilvzi4D
         5WXdR8k+9SSQ7j2WxtlYqKI7pH3xn5AiiHBL1pqp3NKQH8Lt7rP7tqyNYWl2wBZFrlF5
         6qYV88oRaVA4toDC+Es7NRq6TtjkjJu+zvlddw8bbjKHXvNn5oWFFZ3Si/Hk5ENdVbJC
         f7Lw==
X-Gm-Message-State: AOAM5306pRA91IGZU1U9Zv+dMvcj0fTBU2WTMDN+9lQXvuWm+9axSIRg
        jOXhzMZOvceGvu8IVo4buVX9zg==
X-Google-Smtp-Source: ABdhPJx8zn6fZZDMbq1MfQBbaIy4J+r9PNkaiJ0W5gmaWGLyf++fPbP6nwy7sTxmK8I25fh+Xf3yDQ==
X-Received: by 2002:a05:6a00:2257:: with SMTP id i23mr18069722pfu.25.1593614272457;
        Wed, 01 Jul 2020 07:37:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id y80sm6221888pfb.165.2020.07.01.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:37:51 -0700 (PDT)
Date:   Wed, 1 Jul 2020 07:37:51 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: Add num_altmodes partner attribute
Message-ID: <20200701143751.GC235106@google.com>
References: <20200701003149.3101219-1-pmalani@chromium.org>
 <20200701120131.GC2184169@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701120131.GC2184169@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thanks a lot for looking at the patch.

(trimming text)
On Wed, Jul 01, 2020 at 02:01:31PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 30, 2020 at 05:31:48PM -0700, Prashant Malani wrote:
> > Add a user-visible attribute for the number of alt modes available in a
> > partner. This allows userspace to determine whether there are any
> > remaining alt modes left to be registered by the kernel driver. It can
> > begin implementing any policy state machine after all available alt
> > modes have been registered with the connector class framework.
> > 
> > This value is set to "-1" initially, which is an invalid value,
> > signifying that a valid number of alt modes haven't been set for the
> > partner.
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > Cc: Benson Leung <bleung@chromium.org>
> > + */
> > +int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes)
> > +{
> > +	if (num_altmodes < 0)
> > +		return -EINVAL;
> > +
> > +	partner->num_altmodes = num_altmodes;
> > +	sysfs_notify(&partner->dev.kobj, NULL, "num_altmodes");
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(typec_partner_set_num_altmodes);
> 
> Who is calling this?  We need a user before we can add a newly exported
> function.

cros-ec-typec (drivers/platform/chrome/cros_ec_typec.c), but the patch for that
isn't ready yet. I will submit v2 when that patch is ready for review.

My apologies for not considering this earlier.

Best regards,

> 
> thanks,
> 
> greg k-h
