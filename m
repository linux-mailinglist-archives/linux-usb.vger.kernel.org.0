Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5F1DF75
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 11:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfD2Jat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 05:30:49 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45497 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfD2Jas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 05:30:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id t11so7286144lfl.12
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 02:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U2nlqxL152YLC8xQ5ty7B2o8ABIvpmarGKYSJrerfTo=;
        b=sAxKMLc+lx3FYUAmSsiS1fBd5Xs1/bHqFbq0F2uIlhsPsl5FxcK2QBpB2wWsc+pX5S
         oMZC0XbiQq1FFedcBU5D6kTigkStFG4cHCd+AU9y3MJxsRlyw7frhMGxMctEjHKJe2BB
         hVvmBBTHy1RtOYb3k+RE4zqLTvhk9hb6QNvRwPE/qfc80G/BjAmwxnBQiS0BURUvNfab
         5aepfGkGH7IJCcPzhTKX1VYSprChg2duXZ2NWBj1mGRvhj2O6ad2QrBrfWyPju5hLy0L
         bHieE0qWX/468OZVJV1B22K1IB/giL0Fkq5nzk84zCdv3FnK0euQ9Z1ima0v1K0RXcmP
         AgeA==
X-Gm-Message-State: APjAAAXR3szlylWTKcy16ZqMOtv0fwGq6rKa9Fgvd5SYNPXZnaeWV6nZ
        iPkj/7lyamFAAhCMnA1gksM=
X-Google-Smtp-Source: APXvYqwezKoTo4PC9+FCnNOn+sdBge4JnquQhZ5US/qYRjHE1FejPm1/cxsoZXKkTNOofYIIlnCzdA==
X-Received: by 2002:ac2:538a:: with SMTP id g10mr23278229lfh.141.1556530247064;
        Mon, 29 Apr 2019 02:30:47 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id q78sm643054lje.93.2019.04.29.02.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 02:30:46 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hL2cZ-000326-AT; Mon, 29 Apr 2019 11:30:47 +0200
Date:   Mon, 29 Apr 2019 11:30:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/5] USB: fix tty unthrottle races
Message-ID: <20190429093047.GH26546@localhost>
References: <20190425160540.10036-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425160540.10036-1-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 25, 2019 at 06:05:35PM +0200, Johan Hovold wrote:
> This series fixes a couple of long-standing issues in USB serial and
> cdc-acm which essentially share the same implementation.
> 
> As noted by Oliver a few years back, read-urb completion can race with
> unthrottle() running on another CPU and this can potentially lead to
> memory corruption. This particular bug in cdc-acm was unfortunately
> reintroduced a year later.
> 
> There's also a second race due to missing memory barriers which could
> theoretically lead to the port staying throttled until reopened on
> weakly ordered systems. A second set of memory barriers should address
> that.

> Note that the cdc-acm patches have so far only been compile tested.

I've tested also the cdc-acm changes now.

So unless anyone complains, I'll apply the USB-serial ones in a few
days, and maybe Greg can pick up the cdc-acm patches.

Johan
