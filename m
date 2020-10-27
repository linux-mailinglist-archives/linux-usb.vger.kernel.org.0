Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D027429CB12
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 22:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373723AbgJ0VRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 17:17:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36379 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373720AbgJ0VQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 17:16:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id z24so1518835pgk.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2020 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgtvnqQhKI5zG9bVaAWjv8SQU7kaNOunmF3LNwyEvFA=;
        b=eOtg/aSx7YUM6gGzeYVIGFoz2SOgycYxy1oF9PAZQrfYz2o/ycKyS4MkaVRcpdk+3g
         1n+A3edE5hMZHETFFzMrCO1XxPfhxjbhmsJROlfVgo8zYZqH/+qx9hm7LSMQzANVBuHK
         0R3INOZKSIs4qYR4CbgrsokamBeiUCi0Bm1CeEf82TB+8Sl9rFP6JU5L6ttLkg6WP/Pz
         q2aW9PLPPjcvgjxuezYWFSnqo/PNqYYQuvKkJwkFw+xc165Q/oj+Xqc8zYOo+nOwj5ou
         +cUdD0Wkg7M+Ifs5GGiUfwi++mA9mKzGnrNQd06Yb0lRIhD2p7TQeYpELiyJTGXrPh6+
         /nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgtvnqQhKI5zG9bVaAWjv8SQU7kaNOunmF3LNwyEvFA=;
        b=S/M7v9UdEeUPR431WBuLNYGRs8ExlBS0Gy14cbhk1uLEYCm+eiFJBT8gvxSdLEKdW5
         lWyMEOz/BWpB6vVUuxo9yqkHst6wzF1uW0utqhi3XRP181lVUhq5eN0AcTa6c1c8BbGu
         Le2C04kCmtdY16kjUwwW2YOcitWn80nOEfI84uyXQGiU5DB/hqDYxDVcRguXDpWco1Bg
         PvrsMx2tD1J4iYkJn2RwQoBOdhogHu2MlWZcc0yKQaE/4fDgQOtoKOQh5dg27VdmRPs9
         vew93Z2jyGsAAoArf4/F4jKycGpONbe4FIPCOYNdv8RHlpDw/xIPSuoNLtOFSajhUjHz
         FvCg==
X-Gm-Message-State: AOAM532RW4MWXF3W9+OhZPuhVusJF6/YQjBQ3NxNaUjynf36LamesrVm
        d/Rn23/ya9kDTs7nVBWkQuVmFRKQNpTB1bd4g04=
X-Google-Smtp-Source: ABdhPJxv+A2UFalCRhD/2g7EGSkmQICoKJ4MwyoW+mIwuzcVzjB4g3fdQoDVg3k+rcrgYB+yGYQiCpqMazSmhjCnrv8=
X-Received: by 2002:a63:1e02:: with SMTP id e2mr3413244pge.74.1603833419194;
 Tue, 27 Oct 2020 14:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com> <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com> <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com> <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com> <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
In-Reply-To: <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 23:16:42 +0200
Message-ID: <CAHp75Vc0P746FhhohJ=wRccsQL4ewn+AECMw3yTD6cuGxHCG9Q@mail.gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Ferry Toth <fntoth@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
> > On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >> Ferry Toth wrote:

...

> >> There are some fixes to dwc3 in kernel mainline. Is it possible to test
> >> this against linux-next?
> > I think the best is to wait for v5.10-rc1 and retest.

Can you give a try of v5.10-rc1?

> I looks like there have been at least 3 problems:
>
> 1) dwc3 was not working in host mode, but not causing an oops. This may
> have been caused by platform changes. Andy has provided a fix for this,
> dwc3 now working in host mode on 5.9

Rafael took the above mentioned change(s) for v5.10-rcX.
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=bleeding-edge&id=99aed9227073fb34ce2880cbc7063e04185a65e1

> 2) dwc3 was causing the oops in gadget mode as referenced in this
> thread. The experimental patch from Jack Phan indeed fixes this.
>
> Code here: https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>
> 3) With the above 2 fixes gadgets work but seem to be powered down
> (after 15 sec. or so) and up (after 1 sec.) continuously. No oops, no
> errors in journal. The gadgets I enabled are a network, sound and mass
> storage. The latter stops working due to going up/down quickly. But my
> host shows network/sound appearing/disappearing. Journal of edison shows:
>
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
>
> Any ideas how to proceed are highly welcomed!

-- 
With Best Regards,
Andy Shevchenko
