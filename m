Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112B51277F
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 08:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfECGI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 02:08:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45830 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfECGI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 02:08:59 -0400
Received: by mail-lf1-f66.google.com with SMTP id t11so3562388lfl.12
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 23:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PbLj7/MYB4ffyjWBFDcrh5vX+uBxm5QKj5D+y/GQtpM=;
        b=OE+cNj1WLQraNM3wYMeo3t6Is511oElziB1hVbllEopzMfDEIJ3W/qSJkE4nBx8oUA
         mL6iaTfvakOpTAjFvjOOIIVI0gk7CeTN/Bpx5nMiScsSkE9Nw+OGT0UlDvPDgL5lVeHv
         ojdtC4gy3sFOVAXEC6z+696rwlpWxtkZAo0nFupANpZgDowvxfr/3OGN88ak3KTcIqKX
         2OQlJPUJ8meMJCDqTP1pAz0o8DKw+dfE3XyADeMvzREo9kFpqWHXJ49x+wZvCPA/mm47
         6C6ujYCsfS5Bzi5XDurQ+Bn+x6QXB7Nouc2J6ixWwfr2NfaKXi9VjMDwtIXh4+SVB2Pe
         D6gA==
X-Gm-Message-State: APjAAAWwzgA1hA7iWt0xT/soaRwZc6BbQeUXB3PHvWWR8WHLEfc0O0p9
        XjvSlvAdUNvgb1vZd/qJX4xhwlL6
X-Google-Smtp-Source: APXvYqxWSvDj7/Oy3/9I3kBbMSnJAwcc5c9yeOtVsC8YZDtx6gsPl9+k2XeOxMBckhlgiDe8XZLSjg==
X-Received: by 2002:ac2:51da:: with SMTP id u26mr4069062lfm.32.1556863737618;
        Thu, 02 May 2019 23:08:57 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id p19sm236464lfc.48.2019.05.02.23.08.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 23:08:56 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMRNc-0001iA-Qx; Fri, 03 May 2019 08:09:08 +0200
Date:   Fri, 3 May 2019 08:09:08 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] USB: serial: io_edgeport: fix up switch fall-through
 comments
Message-ID: <20190503060908.GY26546@localhost>
References: <20190502173515.GA13801@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502173515.GA13801@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 02, 2019 at 07:35:15PM +0200, Greg Kroah-Hartman wrote:
> Gustavo has been working to fix up all of the switch statements that
> "fall through" such that we can eventually turn on
> -Wimplicit-fallthrough.  As part of that, the io_edgeport.c driver is a
> bit "messy" with the parsing logic of a data packet.  Clean that logic
> up a bit by unindenting one level of the logic, and properly label
> /* Fall through */ to make gcc happy.
> 
> Reported-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Now applied, thanks.

Gustavo, how many of these warnings are there left in the kernel now
that the last one in USB is gone? :)

Johan
