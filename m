Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 505961571DF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 10:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgBJJiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 04:38:25 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35189 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgBJJiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 04:38:24 -0500
Received: by mail-lf1-f66.google.com with SMTP id z18so3696580lfe.2;
        Mon, 10 Feb 2020 01:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qoaw8NzLMiikXus1s4fJbbBbRP2yQE8AW6SjyqH90ps=;
        b=f4D3UV2JuGrueMMJggPYX5BfJWDCO01IB7Aq01MfbvEBQcp/mrsVrspLD/5IB21KLD
         dg6Q9j0Qd4/CCBDzfmm4FW+p2QOsA+EY8kmGPlAd6f02JpFlCcaHtQN+9M8M8caUByeb
         lraPGYaZApH/AorkbFX8er8NgCcteaiTrR3hY5CyRv/TnZygvxK0MUfuKUcecyt29iy7
         SNhvQjVSPrbUL2nWyPGKP4WI7wFCrPBEGnjmag87fyahm/nRHwrEE/twwBdhjqV/imhD
         oaqDD4FNXC9bYsKl/lYeRZo30DkGCG/ffWDa6IxnLpTIHg9BfQ5YlRU3YgBSmrNpEnFN
         Mx4w==
X-Gm-Message-State: APjAAAX01xhJApEdQu+AA8PLtxWn45N4kWBHOYGWVw3hnZYE3MKo24un
        bgh6FN+gCO7FleHKwb4YGsr66tYh
X-Google-Smtp-Source: APXvYqybbaY6pGnafRU9pOH4x7Ja+2as0yf619wbxsIXdtLVt2aUCLBeA2xXu26dvQ6EhJ4WcQKfzQ==
X-Received: by 2002:a19:9d5:: with SMTP id 204mr309144lfj.120.1581327502045;
        Mon, 10 Feb 2020 01:38:22 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id u7sm4992771lfn.31.2020.02.10.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:38:21 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j15WF-0005ws-6W; Mon, 10 Feb 2020 10:38:19 +0100
Date:   Mon, 10 Feb 2020 10:38:19 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davidlohr Bueso <dave@stgolabs.net>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: relax unthrottle memory barrier
Message-ID: <20200210093819.GB3539@localhost>
References: <20200130100658.683-1-johan@kernel.org>
 <20200130153328.jt5stb4svajrbkf6@linux-p48b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130153328.jt5stb4svajrbkf6@linux-p48b>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 30, 2020 at 07:33:28AM -0800, Davidlohr Bueso wrote:
> On Thu, 30 Jan 2020, Johan Hovold wrote:
> 
> >Commit a8d78d9f3856 ("USB: serial: clean up throttle handling")
> >converted the throttle handling to use atomic bitops. This means that we
> >can relax the smp_mb() in unthrottle() to smp_mb__after_atomic(), which
> >for example is a no-op on architectures like x86 that provide fully
> >ordered atomics.
> >
> >Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Reviewed-by: Davidlohr Bueso <dbueso@suse.de>

Thanks for the review. Now applied.

Johan
