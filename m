Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE74F42CAF0
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 22:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhJMUa1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 16:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhJMUa0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 16:30:26 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F09C061570
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 13:28:23 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 75so3446587pga.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VjGXbhjoH4FUN8Q8SE4lGnGAMtyPIkF1JJC5Xep6mZU=;
        b=FQ2+09tjd62NgTHHvCtXKPp9Y/8A8aYmImJXgKlmWOIATYR6Gbk4iV7vs5ZiM1D6T4
         O4HI/82ml4IrylOByN0aeaRQ3bmt1/R1cE6n2Xon8qbAc1tuYsWUwRYdyQDLPdaIg7yw
         C74Y2xuCme8EkEP0kCmgjgxKR1tOywZVYy3RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VjGXbhjoH4FUN8Q8SE4lGnGAMtyPIkF1JJC5Xep6mZU=;
        b=vgOZxsYqIx+y/xwP5tvHoWxZTU9VQcMfrRH287EkmbgQswbdLkMkMTfYgRaFHWAw1S
         Pz11niI5s46Eue80+wlnN/XvC1crsXq1+qlwzHXX8Bk29lRPluVLKy5m7lKOrjpvrC3i
         x1X4bA7POZx6rll1PTfWHABlDQkxsyRPMnozYnM+/Q7yZ/4fl8LthcrAl0F+r6J2KPXv
         a2my9L1EayJGIcYHseNhtAj1sqBaCPybxjtJu2Pl+3W1UrpnmDJ08FGnGhjRtsA3aSNw
         NZKrK6Q+t78kFuLZfoiiHiPzZ1Hi5sHIhBb3C2KH7wWyQQ8/mTeHvDNVMV0bjvrXquix
         X5cQ==
X-Gm-Message-State: AOAM531ytfrCz/vLFrOiBKboYjvYyCS1sB+7OSoNeh7734ZQrLxjYFJj
        j5DKu01iByT/w6BVoOPY9zSwqA==
X-Google-Smtp-Source: ABdhPJxUOePTglJK0pNJ82L2ie2F+dSGMarAK2Vha6fRx1iaQPSy8DeXLcZnVaJkkop9FdsETSgzAg==
X-Received: by 2002:a63:b20c:: with SMTP id x12mr1129880pge.10.1634156902774;
        Wed, 13 Oct 2021 13:28:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:964:5493:ecc9:6991])
        by smtp.gmail.com with ESMTPSA id q35sm6913226pjk.41.2021.10.13.13.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 13:28:22 -0700 (PDT)
Date:   Wed, 13 Oct 2021 13:28:21 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: Link the ports to the connectors they are
 attached to
Message-ID: <YWdBZY7vSWO7DN54@google.com>
References: <20210407065555.88110-1-heikki.krogerus@linux.intel.com>
 <20210407065555.88110-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407065555.88110-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Apr 07, 2021 at 09:55:53AM +0300, Heikki Krogerus wrote:
> Creating link to the USB Type-C connector for every new port
> that is added when possible.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Did this patch eventually get merged?
I somehow don't see it in the "master" kernel branch [1], although I do
see the commit in that repo [2].

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/usb/core/port.c

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63cd78617350dae99cc5fbd8f643b83ee819fe33&head=master

Best regards,

-Prashant
