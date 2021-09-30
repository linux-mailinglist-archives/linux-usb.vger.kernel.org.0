Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CBA41DCC8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352069AbhI3PAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50405 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352040AbhI3O77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 10:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633013896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zptMMX+xorScj8oCKZfu7vNyw+QcA+InPw6+3Zh+fcA=;
        b=Fjz7wLmVuSMhOsIxUnfrfflu45XsztypZO/pAIwkRLT0dGefysrO+uJqn0/zD5Zq3Q3AhS
        A9U58fAae8YQYw6rZKs0uIX3nlFxlYi7n66cj+nCyCmUnT7MOXI2Mz88aOCWP8fF85CyFa
        /zHWmNQUscUW2VHdEVlcee4ugDHS5ho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-zyxA5kzAOVaYekIvaoSzbQ-1; Thu, 30 Sep 2021 10:58:14 -0400
X-MC-Unique: zyxA5kzAOVaYekIvaoSzbQ-1
Received: by mail-wm1-f72.google.com with SMTP id d12-20020a1c730c000000b0030b4e0ecf5dso2059252wmb.9
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 07:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zptMMX+xorScj8oCKZfu7vNyw+QcA+InPw6+3Zh+fcA=;
        b=Ki/JpTxOYaRmk+Aos3OX1QvF8mklIhTBu00Q7pc5bZ1aXn2yGtnk336z7UnHobaFps
         p02OO7QZHzE2Or3JswhBDL8lkQoZfNX/yJJ2OZvwQAPgC4L/1rJ3+dI7u/KdWj3a7ZDJ
         jpc4pYoDfL61Q4OqcP0uvNW0JL0H2rAraek/8V5QTeVp/04IluQXvEfMpMwXf+HZwqog
         BRzxBWflVJ5hh5yFJN3dZLD6gds5vYQTeThpjWt4HnyX/4sNmdx2owNhougsIuSRtLXe
         PCmKhqXgMIE6wkmuLW2Z8LOFsjBZV39wTGnd+aReHecDArSIQ3S1NLYKdXD9dQpdcnle
         7j0w==
X-Gm-Message-State: AOAM532IblSKWWSHq+PP4PuVdOM/d0pw8AwM6fpmdi/6VTt3xaWEtgQu
        Bxo/wYmNXC3GFyw4szM94ptBX+HPqHUIoI6/rcxqwafGJOnZ9H3bzxBUTs1aIsLkO4PRwffoEQb
        9nnCoH/znEk4byAAgobzT
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr5645385wmc.75.1633013893049;
        Thu, 30 Sep 2021 07:58:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaSf6qIxOAUaDvu9F6CRNxVN7kuMkgxNG2gPYtmYIu+P3izWa6fLM0ccmLZ3hvWl8yaURe3A==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr5645358wmc.75.1633013892858;
        Thu, 30 Sep 2021 07:58:12 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
        by smtp.gmail.com with ESMTPSA id q18sm5031993wmc.7.2021.09.30.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:58:12 -0700 (PDT)
Date:   Thu, 30 Sep 2021 10:58:07 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
Message-ID: <20210930104924-mutt-send-email-mst@kernel.org>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org>
 <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930144305.GA464826@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930144305.GA464826@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 10:43:05AM -0400, Alan Stern wrote:
> I don't see any point in talking about "untrusted drivers".  If a 
> driver isn't trusted then it doesn't belong in your kernel.  Period.  
> When you load a driver into your kernel, you are implicitly trusting 
> it (aside from limitations imposed by security modules).

Trusting it to do what? Historically a ton of drivers did not
validate input from devices they drive. Most still don't.

> The code 
> it contains, the module_init code in particular, runs with full 
> superuser permissions.

-- 
MST

