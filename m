Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2C6CF239
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 07:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfJHFm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 01:42:58 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:37698 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729682AbfJHFm5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 01:42:57 -0400
Received: by mail-qt1-f178.google.com with SMTP id e15so8472568qtr.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+CDYFXeY8COANxngIpyZUuLPxeUjxubC3YzxlOq4hA=;
        b=HwJQmrHZnwDwbvQW5cOsEwA8kDDLaS2fHVYsAKK4+DO8YMEpX5GM0xKrmX0K9q1ESm
         MNk57i1SB8NGmyDArSM/AVvrwtP8imRHbB1O9vNCc/DxsHXquqYf5b16XAUyQIAEmVCD
         5JwqDLBIFZ442SpkjVeDFPCNUhYGp/O+eysa+XlVGaxIcHG0YoOmoCFdZxLIZRirDbEh
         PGDiMdvKqioOsUIeMwDJQjhAfUTpK0RMqLMx6d98CD2Rwaja5rsm5+lmoGeMzJWFmrxO
         GTula4pKvoh5eYUszHGvXkGn7ALKjzNwdn6B+iz7Z8LCX3yCgbvrRYn4GtocGpbOM5Vk
         0JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+CDYFXeY8COANxngIpyZUuLPxeUjxubC3YzxlOq4hA=;
        b=QVhUKjSygVlenfr35sh7r/gR+3kFs8dnc2SEl39V9ScV+6s1xN0X3/HEHZWeLCKPVN
         SL3e1hDit/yJYeRCpU4YNnyePxqbdNGs0qsd7ciCRTHUTmAB5ruCAF8do+1qK6z0NEvW
         jiT4ETU4ZfDtUXOgmgAYF8EdsJQwlY+E9i//5bQpPIOQkGXerdRTEzcnUxG9mqZ5QH5g
         f2fmTXBqXkF9tXa3fP7ih8n9y0WuHbOaVNymfvvvBBWDwfyl4etG7UrBrVE6xd2j44Sa
         ama7/pvWwRonwRTV656M8M39wHXbVXSGWO4NZf/0M3Od6RN0m9AQAJTPb17qw+tWEOCD
         QJ0A==
X-Gm-Message-State: APjAAAVqsL974Vh3Qg101s5zeccBgjElok6h2EesZ+zg393ezDPB7+J4
        uBFLYY1dFdY1FpxktWtyQ13jRCrXEf1KTkz8x0MP0w==
X-Google-Smtp-Source: APXvYqxKq3iTI67sSxmmo/PfXUhlaw1Zfom2GHQ0wVOLFdlZmLVUZglcO40s5xIjuqmoXra48C6Po8vH+dyd21iOlWk=
X-Received: by 2002:ac8:76ce:: with SMTP id q14mr33249174qtr.239.1570513375418;
 Mon, 07 Oct 2019 22:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8Lp47Vh69gQjROYG69=waJgL7hs1PwnLonL9+27S_TcRhixA@mail.gmail.com>
 <CAJZ5v0g4T_0VD_oYMF_BF1VM-d1bg-BD8h8=STDrhVBgouPOPg@mail.gmail.com>
 <01cf6be6-9175-87ca-f3ad-78c06b666893@linux.intel.com> <CAD8Lp4658-c=7KabiJ=xuNRCqPwF4BJauMHqh_8WSBfCFHWSSg@mail.gmail.com>
 <CAJZ5v0gouaztf7tcKXBr90gjrVjOvqH70regD=o2r_d+9Bwvqg@mail.gmail.com>
 <CAD8Lp47oNJb5N5i4oUQfN5b=xCtUc1Lt852pnXxhNq0vyWj=yg@mail.gmail.com>
 <CAJZ5v0j=x4HHOsJ6fCX-xOr29-4BMRzjR5H5UaoWW9v-Ci8ODQ@mail.gmail.com>
 <CAD8Lp47qSte0C6sUFBkXVAHa755R5PnNUSvjRYD=JehYJ2R0pQ@mail.gmail.com> <CAD8Lp4574C4QCA3mBb9iC_3hBj7pZ3kJi-fkg7dONQPjWcF8bQ@mail.gmail.com>
In-Reply-To: <CAD8Lp4574C4QCA3mBb9iC_3hBj7pZ3kJi-fkg7dONQPjWcF8bQ@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Tue, 8 Oct 2019 13:42:44 +0800
Message-ID: <CAD8Lp47hVxFfr17Ni22w5FJu0e7Fjux_B1DMJCTz1JqeAfUH_A@mail.gmail.com>
Subject: Re: Ryzen7 3700U xhci fails on resume from sleep
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Endless Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rafael,

On Wed, Sep 25, 2019 at 1:36 PM Daniel Drake <drake@endlessm.com> wrote:
> Should the s2idle resume path be modified to call into
> pci_update_current_state() to change the current_state to D3hot based
> on pmcsr (like the runtime resume path does)?
> Or should pci_raw_set_power_state() be modified to also apply the
> d3_delay when transitioning from D3cold to D0?

Any thoughts here?
I also sent a patch implementing the 2nd point above:
https://patchwork.kernel.org/patch/11164089/
but no response yet.

Thanks
Daniel
