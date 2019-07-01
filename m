Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E0AEB50
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 22:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfD2UFs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 16:05:48 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45400 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbfD2UFr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 16:05:47 -0400
Received: by mail-io1-f66.google.com with SMTP id e8so10096000ioe.12
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 13:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tC2ii7OkMypP9Br4uPDYWWFU7NBDDS8QRme9Wy6zm/8=;
        b=VPQPK6m9aXVfE7U+nfP2sHm8K/C8Uc7J9cmPfFadccMVRpv9vhuNhkwrTXEk9i1zp5
         AW45C/NCwsI7EnxiZwVTH34VaDp4t2IGm7wve+YFEck0ZXNsNqCshsYFKnpvgUJrIm92
         62fzrz8Zw58pA5fJayV70fhGGqOkY4QlZ8gaIAmngFAKLEuKt0iyOvWPozz4+BAa7+bS
         Ks+xQUuG8JbAnSIfAtl4zQ1IlmFrZQaIuEPgojeGwqA0a4gClLLzk/Q2K0OZY1zpHUSl
         fbtFq9OtT9F3YVEoib7pkO2FX/BE5CU/xooSfULjIqF2DnSQU+mCTLcfeHTO7AqiBIST
         k4tQ==
X-Gm-Message-State: APjAAAXyLzYuTodP+GS2Vu5IYxgIMCUoGUXpUuraeVwAPcJNfBkjSqZt
        OJU1qZX+eehOIge/e+bbPxjWLA==
X-Google-Smtp-Source: APXvYqxivxOcXaQhwX8xCEpSH/9z5tK+xILufw0tv9Y5/ccJdVJ6UOC1csH3kacmPD5O/YpVwnzcUg==
X-Received: by 2002:a5d:8245:: with SMTP id n5mr12201452ioo.41.1556568346959;
        Mon, 29 Apr 2019 13:05:46 -0700 (PDT)
Received: from google.com ([2620:15c:183:0:20b8:dee7:5447:d05])
        by smtp.gmail.com with ESMTPSA id b72sm255077itc.30.2019.04.29.13.05.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 13:05:46 -0700 (PDT)
Date:   Mon, 29 Apr 2019 14:05:41 -0600
From:   Raul Rangel <rrangel@chromium.org>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xhci: Convert xhci_handshake() to use
 readl_poll_timeout_atomic()
Message-ID: <20190429200541.GA116440@google.com>
References: <20190208014816.21869-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190208014816.21869-1-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 07, 2019 at 05:48:16PM -0800, Andrey Smirnov wrote:
> Xhci_handshake() implements the algorithm already captured by
> readl_poll_timeout_atomic(). Convert the former to use the latter to
> avoid repetition.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Tested-by: Raul E Rangel <rrangel@chromium.org>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>

This fixes a bug on the AMD Stoneyridge platform. usleep(1) sometimes
takes over 10ms. This means a 5 second timeout can easily take over 15
seconds which will trigger the watchdog and reboot the system.

Thanks for the patch.
