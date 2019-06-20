Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BCF4D250
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfFTPkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 11:40:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45685 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTPkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 11:40:10 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so2730894lfm.12
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 08:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PEnYDiPCe5hNgftRCwApLmLOxme/UVt+pQ5xM/gSu88=;
        b=QfRXkY6QKOO+S9hCl+MWzWfOJCRJxqnumn4CqEsSTiabJe5G5VjslE0mdGIkrqJmha
         dQmJgxojHA7RzN650cr32Df1CBXtuOb+DAIC/9xEUWTpR6ofptv0CzseC3xag5MaiLVT
         pXqULytCPVZp7huwFTlKagvi/boTmy63AUdNGBiB+V4CaSBQb877iNe67Te8tuHju01+
         j1bUbD0cJhmEoGgZhZb+8HXwqOTTzjMKIAT6RvXf4Q6b/H0eK9hUlhy4jrYcqkoYqS4V
         9p3KSda0cr+8EgKkNKsMCALFfgd1k/zWz/+Xy3Q2wnp0bzzTp9dLRd/YgJ3lbWs87StJ
         gBkQ==
X-Gm-Message-State: APjAAAWHW7JETGRsH6mbapXWFKUbSRk+XC/nawl94pySCjzlCo3PBMpQ
        X/DVVoU8zbN21F9lfMKZ27oQ4fP1
X-Google-Smtp-Source: APXvYqwQ6ySyIQPS3w4uGxXExSUTVedHiBJpC2DrJFLiHTvvKXV0rzutxkDG8kkKJbdUrSZK3jk2vA==
X-Received: by 2002:a19:2d55:: with SMTP id t21mr1962518lft.94.1561045208539;
        Thu, 20 Jun 2019 08:40:08 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a29sm10088lfi.23.2019.06.20.08.40.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 08:40:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdzAU-0005v8-TB; Thu, 20 Jun 2019 17:40:06 +0200
Date:   Thu, 20 Jun 2019 17:40:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     dmg <dmg@turingmachine.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 46/46] drivers/usb//misc/adutux.c:375:4:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 5 has type 'size_t {aka unsigned int}'
Message-ID: <20190620154006.GM6241@localhost>
References: <201906202227.KeVsA81p%lkp@intel.com>
 <87wohgs3lh.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wohgs3lh.fsf@mn.cs.uvic.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 20, 2019 at 08:01:30AM -0700, dmg wrote:
> 
> kbuild test robot <lkp@intel.com> writes:
> 
> [...]
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/printk.h:332:0,
> >                     from include/linux/kernel.h:15,
> >                     from drivers/usb//misc/adutux.c:19:
> >    drivers/usb//misc/adutux.c: In function 'adu_read':
> >>> drivers/usb//misc/adutux.c:375:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t {aka unsigned int}' [-Wformat=]
> >        "%s : while, data_in_secondary=%lu, status=%d\n",
> 
> I am not sure what is the best way to address this warning.
> 
> size_t seems to be architecture dependent. On my computer (intel64)
> size_t is long unsigned int, but in this test it is int unsigned.
> 
> Are there any suggestions on what is the best way to deal with this?

You should use %zu.

Johan
