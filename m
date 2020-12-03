Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163452CD230
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 10:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387774AbgLCJLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 04:11:07 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36757 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729995AbgLCJLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 04:11:07 -0500
Received: by mail-lf1-f65.google.com with SMTP id v14so1662591lfo.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Dec 2020 01:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7EIvZTsLFbO7wjVbli/WXjIaal7oDAe9qebzh4DNzbk=;
        b=iDmK931add1e8upz3hnUQKDQqFTGUhDxF6cE/MmLSThsZ851jcHNry9DQ6BeXSxpp0
         xfyDWg+f/tAD58YZ0x3u8mwgNQkubnAch1wKj0M24Sdg7UU3NefKvRuN+le4QxsmVjDR
         9+NysdIzeLRpLFkZV/0OJjKrojWOKdddkpNiEv3GBsXPezzFij+s02PCeBuaz5vCHA8R
         eGhu7zMXTOquayOOZNfnqW6Iqx0okvSQpVXwfehN717GFoAnTJ5zd5J0VzLWeDNSjIhY
         KILmTGj21ppMrWxFDRk9fTsFmePSEe2RuNixoJ0mFbBWDI6udUqwkWdaZssr+USMQtu8
         Dw3Q==
X-Gm-Message-State: AOAM5331pv/glMyLM9IfXg+ZSJpx9LYRk/uu7IUOF9CdnIynJiAi7Z4e
        5cziiIcV5jGSzkbn2Py6VWI=
X-Google-Smtp-Source: ABdhPJxvDkXRmng3rUABp/6joDZ6DZwZTpDWSjadomEdw+NgT67JG7LiNyB3gHIv1MaB/SVGtF9dJw==
X-Received: by 2002:a19:e21b:: with SMTP id z27mr908235lfg.409.1606986625380;
        Thu, 03 Dec 2020 01:10:25 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id q13sm296844lfk.147.2020.12.03.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 01:10:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kkkde-0003Le-BX; Thu, 03 Dec 2020 10:10:58 +0100
Date:   Thu, 3 Dec 2020 10:10:58 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: add new Product ID for CH341A
Message-ID: <X8irohNWFSJzHpeo@localhost>
References: <20201203030359.52583-1-kernel@aiyionpri.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203030359.52583-1-kernel@aiyionpri.me>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 03, 2020 at 04:03:59AM +0100, Jan-Niklas Burfeind wrote:
> Add PID for CH340 that's found on a ch341 based Programmer made by keeyees.
> The specific device that contains the serial converter is described
> here: http://www.keeyees.com/a/Products/ej/36.html
> 
> The driver works flawlessly as soon as the new PID (0x5512) is added to
> it.
> 
> Signed-off-by: Jan-Niklas Burfeind <kernel@aiyionpri.me>

Thanks for the patch. Now applied.

Johan
