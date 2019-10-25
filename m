Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5531E442B
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 09:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406597AbfJYHMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 03:12:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36716 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406483AbfJYHMC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Oct 2019 03:12:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id d17so1827361qto.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2019 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7vqZokkWR7+GS48fmUuYPLXAvMVfo/8O1D4NDWeFmk=;
        b=pUUaQH/DWoTBzQnNWB49dUdGsOItZ8Aw3Z1dpyC4yDjlb3YPs0Vlt1zYm7jMKzhU+1
         tD/wEqY6JXtuNzmgznccgw8Ws7Kza/6M00d6PL6nYmeDrSldcurPwryoWtCGOBmNUcy3
         LJ+klXQDEQQ0BE9k3X5GECDYO5L+VDT0uaX/zNJtm5SIDSqBoElQGlT6pIpJJlbDsXBw
         aYT4FYxp5z7ZU1qRBbQq4MKS56NMl0GiqMqat4OdwC+dNLOt3DdLmaZH1771NfKHCdbO
         PrxOC3oLuCzWLYipExuIFT+BqpWbB4kfm7yq1dc6NDBdyDWICDx+Qluy247SFdZAA6dn
         9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7vqZokkWR7+GS48fmUuYPLXAvMVfo/8O1D4NDWeFmk=;
        b=HxAsNryAt46qR9yzMGGiXZsxUUOAmcMEsSsIFfcbSnbRs6GrRhb57krbTj8q+6ww/t
         zym3wY+d4ld+xX3jRp0kDUwt/06tZRdIKmRG3z/L30BHDD2y9zMBrtiqRn51itWAKXi3
         yuMTtLEckutw+YNNYtpWvnwMjx85d2SFroUwtOMVWJG0FvYZlrF8cWoPim83lNfWh2fv
         /KZYEQASorZIMkEjg231JZTz8u1JSXVc4rDrJcJEse2oRJRozlEbiUAKdcZV0+6jD7XD
         DHbXj5+2LiL8adFPK9U7jejK8dpdVjIO0mhOIEUCZst1G55dIB6mrFTXC5zOxp/uA53X
         UFfg==
X-Gm-Message-State: APjAAAXEz6JFo9DJzFjBDDDfF8XoMP6SB0n5m95yRencNDIRvfca+L7Z
        f9QttE8mzAn9hz2Bq9WP/ftmML0trkO6fsA2GlZxLA==
X-Google-Smtp-Source: APXvYqxi0EwTymF9nPtPsY0B3bV61Maul6DeZgSQS9AcKD6MolLYaJRmKgrwOZcedSJQ5182NorU5pc7KvYAJ3TWejs=
X-Received: by 2002:ac8:4508:: with SMTP id q8mr1655147qtn.110.1571987520725;
 Fri, 25 Oct 2019 00:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8Lp46KZmTzxjYN6T7u1xH0AODr38hFcCgR-COtvduK9ZuANQ@mail.gmail.com>
 <20191024170023.GA135695@google.com>
In-Reply-To: <20191024170023.GA135695@google.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Fri, 25 Oct 2019 15:11:49 +0800
Message-ID: <CAD8Lp47HgAi-86ni5WHhZT1-sEd7oJEZUiG6KNU66qpmRCfaXw@mail.gmail.com>
Subject: Re: [PATCH] PCI: increase D3 delay for AMD Ryzen5/7 XHCI controllers
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 25, 2019 at 1:00 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> That's really strange.  Your original message showed:
>
>   xhci_hcd 0000:03:00.4: Refused to change power state, currently in D3
>   xhci_hcd 0000:03:00.4: enabling device (0000 -> 0002)
>
> The first line is from pci_raw_set_power_state() reading PCI_PM_CTRL,
> but we can't tell whether the read failed and we got ~0, or it
> succeeded and we got something with just the low two bits set.  Can
> you print out the whole value so we can see what happened?
>
> The second line is from pci_enable_resources() reading PCI_COMMAND,
> and it got *0*, not 0x0403 as you got from the CRS experiment.

Thanks for persisting here. In more detail:

pci_pm_resume_noirq
- pci_pm_default_resume_early
-- pci_raw_set_power_state(D0)

At this point, pci_dev_wait() reads PCI_COMMAND to be 0x100403 (32-bit
read) - so no wait.
pci_raw_set_power_state writes to PM_CTRL and then reads it back with value 0x3.
>   xhci_hcd 0000:03:00.4: Refused to change power state, currently in D3

At the point of return from pci_pm_resume_noirq, an extra check I
added shows that PCI_COMMAND has value 0x403 (16-bit read).
35ms later, pci_pm_resume is entered, and I checked that at this
point, PCI_COMMAND has value 0.
It then goes on to reach pci_enable_resources().
>   xhci_hcd 0000:03:00.4: enabling device (0000 -> 0002)

The change in PCI_COMMAND value is just down to timing.
At the end of pci_pm_resume_noirq(), if I log PCI_COMMAND, wait 10ms,
and log PCI_COMMAND again, I see it transition from 0x403 to 0.

Daniel
