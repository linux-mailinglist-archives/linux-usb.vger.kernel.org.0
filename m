Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9080E217289
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 17:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgGGPfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 11:35:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33135 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbgGGPfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 11:35:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id e8so16153266ljb.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 08:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Pfu3DR2QYcxamu8DLZno12I2IojANRcy/l0LdMFFIQ=;
        b=BOoAe94HqJ7WsP/R5op3ePjZ1vCl2kV8iacw9HiNBM3YVt7fM8+DcKdI2EOwFN+y9V
         7WLuNT4XCc8bxd+4Cn0qgZYBM2TwLDpuGhHANzwQ6M1G5VdCk3O5vzAy4+8wtvtmsOXB
         7IujO9XnzNikfNlMaE0bbbesqRQn1/6c6rcwvOaxcV3kESjNjJfKPGL1pTNL9CRuFHOU
         ydANy6Q50PYMRLqRGutjGC5R29jI+ywuApZpZHW3zGVWXjHViGmgSIcWwadkevXM4npx
         fz3jQlgxh8whQaejnJv+k7ixSM0O/Q+/kKX1/nuDcTjA/mC2IdDsd5pJfKt1Xjdn04hg
         kA6g==
X-Gm-Message-State: AOAM533amA9gjocqZgh9p5LFqy4b4sqdznKiOPX97/Qhxr0s6VOw4Qln
        94LWfn3XKLYVfCWd/iWvR6GMtGfl3is=
X-Google-Smtp-Source: ABdhPJxm1AUjatXHB9nzyEMdLfCecZLm4rQMfq1Fr+KsgbCLDEAdaprNCrP815FTOXMnhR0xwyUWEg==
X-Received: by 2002:a2e:91da:: with SMTP id u26mr25502492ljg.311.1594136141307;
        Tue, 07 Jul 2020 08:35:41 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id h21sm233612ljk.31.2020.07.07.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 08:35:40 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jspdB-0000le-Ec; Tue, 07 Jul 2020 17:35:37 +0200
Date:   Tue, 7 Jul 2020 17:35:37 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: fix simulated-break comment
Message-ID: <20200707153537.GL3453@localhost>
References: <20200707061957.17425-1-johan@kernel.org>
 <9909b288-294d-16b9-9f14-51eb79c63b6c@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9909b288-294d-16b9-9f14-51eb79c63b6c@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 04:53:22PM +0200, Michael Hanselmann wrote:
> On devices which do not support break signalling a break condition is
> simulated by sending a NUL byte at the lowest possible speed. The break
> condition will be 9 bit periods long (start bit and eight data bits),
> but the transmission itself also includes the stop bit. The safety
> margin of one bit is kept to account for timing differences.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
> 
> Hi Johan
> 
> On 07.07.20 08:19, Johan Hovold wrote:
> > I reread the break-end comment and found it a bit confusing still. The
> > below seems more correct to me. I'm assuming you did not intend to add
> > an additional bit period as margin?
> 
> The additional bit was intentional, but I missed the start bit and was
> off by one. As such your fix indeed addresses the inconsistency between
> the comment and code. Considering the general quality of the ch341
> chips needing the simulation and to account for timing differences I'd
> instead prefer to increase the delay from 10 to 11 bits (1 start, 8 data,
> 1 stop, 1 margin).

Thanks for confirming. I've applied this patch with a slightly modified
commit message:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next

Johan
