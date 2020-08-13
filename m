Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A59243AF9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 15:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMNsn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 09:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMNsm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 09:48:42 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F605C061757
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 06:48:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j21so2832046pgi.9
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pODXDvbEvJ9WMsyM7yaw65cZA4KtVSj0sW2+SAd28Ww=;
        b=hYg7Lic9ujbw11FPN/xR/lqp1I6kF972zHhSswnque7LmgtK3KIQubOmUG1PBRMN/k
         FXfgAUTtl9gAE2jMvZIAUXbbgu9V61j6ui2tYWwJxXyK8PRwn/roiV1RgsclXLvuW2DL
         LDCjep+gBkgg3BlB9aDQBixjx0iycp8QhRX0Or8gMCr6p5SRkbXsZz8Ln0IgDIIRMkOD
         sAo2Zhng7WP17zE23xF9wRVKAO59lcdBOxKz5WJLoP1pbXayZ5iPExIcBfEzWOZJB0kJ
         gZrZj+HG+Kn62b6DJWL2SP/C786iZSmejRXijfp4gtLYokHqKKWo2qMRRcqJcPC3u+tI
         7+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pODXDvbEvJ9WMsyM7yaw65cZA4KtVSj0sW2+SAd28Ww=;
        b=B55bwR92bO6Iumqnt07e23m7qePK14aHI6jDFqJ/j+fO4FJHj36KlEkeqCIKTHpQep
         Y2lIomULLJe0och8QXUmXUFj6MRpSeuD09VYE8o4Mh5JjkLfZar+SewowqBcnzn48iSQ
         8UQ3OdOPIVXxbJpqwGu8CWnOoMGlQRU1nvzOKwFiX3EmRYo0uf9lgO9Vd2+Q15PH9VY1
         bkzT0bU6HC1+YFr2O/GwYXBILZA4t7t2sU8Ljpl+PjCqQjdwkv1PzAVlijqgvaMIE7iE
         4gDNciQI+trLuMLlQWi4yZSjWYsGvxshKSL5DV8AJfe77MQBs7YjEk7RuSe9g+LO7mL0
         sQ+A==
X-Gm-Message-State: AOAM531iJvpSzSX/dn55AHgyTg1SYAbGL8vwA3lqXVg625lldpnJpPWS
        WJG/5G2GjPkwkgScM0zmXY0=
X-Google-Smtp-Source: ABdhPJyp0D4m+TIAhqe5CGJUAeGX9KOvN6escl9KVBAVhXUUJo3iowHA+2A7smhA2w6rCd0Om7w+eQ==
X-Received: by 2002:a63:1901:: with SMTP id z1mr3566911pgl.97.1597326521478;
        Thu, 13 Aug 2020 06:48:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d81sm6092900pfd.174.2020.08.13.06.48.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 06:48:40 -0700 (PDT)
Date:   Thu, 13 Aug 2020 06:48:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: typec: ucsi: Fix various locking issues
Message-ID: <20200813134839.GA136612@roeck-us.net>
References: <20200809141904.4317-1-hdegoede@redhat.com>
 <20200813110713.GG1169992@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813110713.GG1169992@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 13, 2020 at 02:07:13PM +0300, Heikki Krogerus wrote:
> On Sun, Aug 09, 2020 at 04:19:00PM +0200, Hans de Goede wrote:
> > Hi Heikki, et al.,
> > 
> > As discussed before here is my fix for the AB BA lock inversion issue
> > which lockdep found in the ucsi code.
> > 
> > While working on the AB BA fix I added a
> > WARN_ON(!mutex_is_locked(&ucsi->ppm_lock)) to ucsi_run_command() and
> > that found me some more unrelated issues of ucsi_run_command() getting
> > called without the ppm_lock held. This is fixed in the second patch.
> > This made me realize that the ppm_lock handling should probably just
> > be pushed down to inside ucsi_run_command() instead of letting the
> > callers worry about this.
> > 
> > In essence the first 3 patches are all related and all boil down to
> > push the ppm_lock handling down into ucsi_run_command(), removing the
> > difference between ucsi_run_command() and ucsi_send_command(). I have
> > been thinking that we may want to just squash these 3 together. I've
> > left them as separate patches now as thet document how I go to the
> > end result after the 3th patch and having them separate might be
> > easier for reviewing purposes. Let me know if you want a v2 of this
> > patchset with them squashed into a single "usb: typec: ucsi: Rework
> > ppm_lock handling" commit (with the commit messages merged).
> > 
> > The 4th patch makes the also already discussed change of holding
> > con->lock for the entire duration of ucsi_register_port().
> 
> I'm fine with having them in separate pathes like that. This all looks
> good to me. Thanks for fixing this. For the whole series:
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 

I for my part wasn't able to review patches 1-3 separately, so I
squashed them and reviewed the result, which looks good.

For the series:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
