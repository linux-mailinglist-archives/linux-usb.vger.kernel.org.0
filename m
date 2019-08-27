Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C519E99B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 15:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfH0Nhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 09:37:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55630 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbfH0Nhn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Aug 2019 09:37:43 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CB689C058CA4
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 13:37:42 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id q45so11686407eda.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 06:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tNDGs992ej0wPR1JuVPcZc7SvR56sXXGzDeCtpjfiZY=;
        b=nhOPkkTOdIVdTzCUDSp+B1nC2eySJabCHGCRRQAfhc00Y7VhzFTJ8z45mgNGGolpJB
         Vsa46lz2q8kmXO0iY6YVMqwk3cqtyR5amVzOxki+gaWNEhAJyo0KbcP4WAd03bxam3sP
         c+JWhr+JSuINLQ1y7q0k874HG5gRB5idab3C4TcqWBs/mok3+Qyp4NMNXleBztz5jIyR
         /yqjPCFo2GEtapg+yJciu7mPShKQo7zMC8ZpNi6Q8RBXbIWe2A7mJ4O++GI58C+FYUcr
         Cx7mptJD8ETNmJAd+njvFRVwFP0mqh+wVT/Bh8U06oHdv3EX1W9unBFdXyiw3zBvFyeY
         Av/A==
X-Gm-Message-State: APjAAAXAko1jnBPQrfrBy+vW9FurVZaKK7dOzInWMv17jE0/vsocFsNa
        A3aN8jsGRJzsDczqjIxl1pXZoOXd8KrVMf8/TetmyxsavEBOfotW6BjSYsGaJJMbNsmgiZMGeLX
        N4qnFKChrkqH/disPO48z
X-Received: by 2002:a17:906:a94d:: with SMTP id hh13mr21337390ejb.65.1566913061283;
        Tue, 27 Aug 2019 06:37:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy501PsxmD+OiADUfhRZ985kG5k2ZYuqOZxg1coKfAnvxudRNF7OmId7wIszj5LJf+uvS4xFQ==
X-Received: by 2002:a17:906:a94d:: with SMTP id hh13mr21337372ejb.65.1566913061083;
        Tue, 27 Aug 2019 06:37:41 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f22sm1955125edr.15.2019.08.27.06.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2019 06:37:40 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/2] usb: roles: intel: Use static mode by default
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
References: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
Message-ID: <1e76e83e-3bf0-f55a-41e1-fba717a073c1@redhat.com>
Date:   Tue, 27 Aug 2019 15:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 26-08-19 16:32, Heikki Krogerus wrote:
> Hi Hans,
> 
> These have been in my queue for a while now. For some reason I've been
> under the impression that there was still an issue with them, but that
> was a misunderstanding. Saranya and Balaji, I'm really sorry about
> that.
> 
> Hans, I don't know if you remember these, but they address an issue
> where the device mode does not work (I think on APL). I believe static
> mode is used always except on Cherrytrail. You had reported that using the
> static mode creates a conflict on some CHT boards that have ACPI tables that
> also write to the mux registers. To prevent the use of the static mode on
> Cherrytrail the property is used.

I've given this a test-run on a Cherry Trail device which used ACPI
_AEI handlers to do the mux switching as well as on 2 models (1 with
micro-usb id-pin, one with a Type-C fusb302 controller) where the
kernel does the switching.

I can confirm that with these patches applied things still work fine
on all 3 models.

With that said I do have some review remarks on the second patch
I will reply to that patch with my remarks.

Regards,

Hans



> Saranya Gopal (2):
>    usb: xhci: ext-caps: Add property to disable Intel SW switch
>    usb: roles: intel: Enable static DRD mode for role switch
> 
>   drivers/usb/host/xhci-ext-caps.c              | 18 +++++++++++++
>   .../usb/roles/intel-xhci-usb-role-switch.c    | 26 ++++++++++++++++++-
>   2 files changed, 43 insertions(+), 1 deletion(-)
> 
