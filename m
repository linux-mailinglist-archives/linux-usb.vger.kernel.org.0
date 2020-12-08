Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D342A2D30F1
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 18:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgLHRZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 12:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730448AbgLHRZY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 12:25:24 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B000CC061793
        for <linux-usb@vger.kernel.org>; Tue,  8 Dec 2020 09:24:44 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id n14so17607367iom.10
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VpStC0N1e6piRKYEdRBX6jEDzyHXKXfxuiBfsoSPSyE=;
        b=Cef7lcsrbXVmRHSRdSXAMM8FaCfqlh81hy7zvFXRthhVE2rOkyfUKtcv2UhVIVF61A
         wKqUN/PBlkW7d1ALnMgowQcPGk8L1AFz9JVdhyqQTcMN5+JSptBsXd2dY2IAsix2cnhJ
         NfL4mj9D9J+sEZtPbnjrm6fFjc8kYb/R77H2IZ7AayhRwMIQ95tmdwyjQWN2LmiH+KYm
         /B1n3Gmul786HxxL/SL0p1SyT8+KrX158Qq0Wdjmyhuk6EOUP+zBevIuF6Pgf5UTvPe4
         998NOoA7MYoaIR9qLToc/BL6gFOxqBWI4S82jW1Xlb0hbw/2jgLG11AOaih8IPp02xdJ
         tKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VpStC0N1e6piRKYEdRBX6jEDzyHXKXfxuiBfsoSPSyE=;
        b=tVNEJdA5dDOEve43aSY+k6DsGJ3hsoglmCc1PSZMkylBFZusYWy1CBlK3G9fM7Zknd
         4DKLBlyb7D/egVB69S6tuaLL4XLbfAWYbJjvZZJlk3gvxXk5/2GW+3I/8ez7u1ropT59
         1n5JfXF+52ytNuyWO+Zgr347HrqVyacNpxS/pFT3010wUCWGbvbD4FQrOtx7VJ8sy0uX
         hw8Cl30g1CgO+dZ3cLVWHIYxNb4AzTS41OrQDYTI8X4o+HjOtKvgwdVjzB+Ghp1IpsVh
         5TmAhAm4+7/KUTketYvlPedgIVbkfoqIN8VTH6Pm7xeBNfnv0J5Hu0umfYp6TfCMMX9/
         nhQw==
X-Gm-Message-State: AOAM533cNbTcDwGkuyxZA6g1KKWSiL80xujsV9T1Bu587T1wsmvDW4po
        9km6rZIBglYOEViuYODCYAIQzQ==
X-Google-Smtp-Source: ABdhPJypdhovVczqnBwFmHp0Hi7JoAtlv8TbKqZ5feeSsl3RHjfSSIDwFuKPupkPiPMb7t17ptDCCQ==
X-Received: by 2002:a02:b011:: with SMTP id p17mr24759483jah.114.1607448283555;
        Tue, 08 Dec 2020 09:24:43 -0800 (PST)
Received: from google.com ([2601:285:8380:9270::33b4])
        by smtp.gmail.com with ESMTPSA id a15sm3516260ilh.10.2020.12.08.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 09:24:42 -0800 (PST)
Date:   Tue, 8 Dec 2020 10:24:40 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <X8+22DeNDn1A7X+N@google.com>
References: <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
 <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
 <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
 <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
 <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
 <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 08:07:30PM +0200, Mathias Nyman wrote:
<>
> Ok, thanks.
> 
> Then the rootcause remains unknown.
> For some reason the endpoint context dequeue pointer field contains zero
> instead of the new dequeue pointer.
> The (output) endpoint context is supposed to be written only by the controller.
> 
> Time to change strategy and start to detect and treat the symptoms instead.
> 
> I wrote a patch that detects the 0-dequeue pointer and issues a
> new Set TR Deq pointer command. Hopefully that works.
> patch added to same branch, can you try it out?
> 
> 3f6326766abc xhci: retry setting new dequeue if xHC hardware failed to update it
> 
> I didn't set a retry limit yet so if it doesn't work it might retry forever.

Here are some logs when running with that commit:

https://gist.github.com/rzwisler/17923c9dedf2b914254eadd1cd294a4c

I think we only consistently get the clean failure case with the dequeue
pointer being 0 if CONFIG_INTEL_IOMMU_DEFAULT_ON=y.

If that option is set to 'n', we get the same failure where the xHCI
controller totally dies (log "CONFIG_INTEL_IOMMU_DEFAULT_ON=n" in the gist).

With CONFIG_INTEL_IOMMU_DEFAULT_ON=y we do seem to live through multiple
errors, but as soon as I try to use the device normally afterwards it seems to
spin forever with these messages:

xhci_hcd 0000:00:14.0: Looking for event-dma 00000000fff0a330 trb-start 00000000f8884000 trb-end 0000000000000000 seg-start 00000000f8884000 seg-end 00000000f8884ff0

Are you able to reproduce this with Andrzej's bulk-cancel script?  I think you
probably just need a device which accepts bulk transfer commands?  In my most
recent reproductions my servo hardware wasn't even attached to a device, so I
don't really think it's doing anything except sitting there and receiving
BULK_IN commands.   I'm doing this to two devices simultaneously.
