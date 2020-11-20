Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B009D2BA665
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 10:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgKTJll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 04:41:41 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41643 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbgKTJll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 04:41:41 -0500
Received: by mail-lf1-f65.google.com with SMTP id w142so12534457lff.8
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 01:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zbkkgyc0qIFpwelhg/lviXiCJzFmERI5eN6eyBAkzkw=;
        b=NWI1xUcxNo0LBQAKtmgcDskIaNfS3QDzjtBzgieyj9XHmTngYUpIgAwKYbw0IN4/Nu
         cqgInMAIo2H0EJVBH18JpmXcu0f41D+NINxV1fDSjtk4EMl13Hb8+zub2ECPQgswhzKe
         8Tx8M89JC6nFqufgwVMQrZWDUsYHwXWausXI9yTQOTZZ+xACXLLJ/oK9Y9W+uREdIfQq
         flbr6cLq1hN1tQ6Zv5dWAq2mj+oPackq5tggB4Q0q32EkHez/iGVjLtclGPSuM+6rSd/
         Am/qB+NkFwSzj5UV2krBetAHNIp1uio6yK21bdiNTqnM49fHNStJmvl1Z0ETaAqE5uWe
         6Fdw==
X-Gm-Message-State: AOAM532D4GpLVO+VEDCysNEiNX7m+2cvMIp6qyU5RDULLG14ti7eme36
        EcgUhE3f+nk9Vj6IhRsN9+s=
X-Google-Smtp-Source: ABdhPJyC4ZnuNpAy0el8cfjQXhVINsHTc5Bh/062Owr9+OgtlkcTemQ74ZZUYWEF7lShHVpG0/p5iA==
X-Received: by 2002:a19:4050:: with SMTP id n77mr7608759lfa.460.1605865299349;
        Fri, 20 Nov 2020 01:41:39 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id j27sm285791lfm.33.2020.11.20.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 01:41:38 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kg2vG-00059F-RV; Fri, 20 Nov 2020 10:41:42 +0100
Date:   Fri, 20 Nov 2020 10:41:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Giacinto Cifelli <gciofono@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] option: added support for Thales Cinterion MV31 option
 port.
Message-ID: <X7ePVj4C/wVWb5GL@localhost>
References: <20201119115931.19050-1-gciofono@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119115931.19050-1-gciofono@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 12:59:31PM +0100, Giacinto Cifelli wrote:
> There is a single option port in this modem, and it is used as debug port
> 
> Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>

Can you post the output of "lsusb -v" for this device?

Johan
