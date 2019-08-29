Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EEBA12AC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 09:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfH2HeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 03:34:05 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:37311 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfH2HeF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Aug 2019 03:34:05 -0400
Received: by mail-qt1-f181.google.com with SMTP id y26so2625691qto.4
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2019 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EpGvJ7EKGGEBGzwNMrB1KOMHeIIQeGtnYLRMPOtnsC8=;
        b=cY73HBTSZGqQxAnB2Ouc5f33JHph9ps8DodTiZiOiYI+7gI7+6MtRGqD8krrIbeOur
         sJRIocU+1w5GmpcIYRLzX4JQB6hEGH7zy3gQEiydOis0JBoMUfRL1tPu95TF+oSAQLuX
         ufbNq2G9tTvK3eIMSwfT8IW8wGaCDwSPW88dBAxZKalgEVHWJ1gVIIVtwY4CGtnlfWpi
         4OvbnUENKuf8kXbuUzNXmTrB2RgZ9sfnNXnfQtsox4eAU742HKaP45jTYHbrq70BLaVm
         QSok0eTw3ygxxyiKLflWNXsLftWdcQNgm4lvfe8ISJCTJK5/wCvNWHMLH99oE4KiTaae
         IwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EpGvJ7EKGGEBGzwNMrB1KOMHeIIQeGtnYLRMPOtnsC8=;
        b=S/A5RYVkQKbnBRDOTn729NVBWVeCxCzbQhlvJT+ZDoIc0Vby0mEtbxogkCZOIi/iV4
         cgMEnV2vrS018s5w8YsRfGCwpseauof2eWn+n+at5RuHigIoATVSwfS7tEYDildNjrO5
         AwKmkhoOsypoV7obM25BZfeUHKBfglVgSMAu+C4NauH0ew2mugMqGQsHc7dfjPHzybTJ
         KTM/oacLJGOwEVADvnOJ8w5ZWtbuxe+ZBh29faJcEqH8gMd6a4KYbeMxt5g8d8KiIiwL
         UvZSKH3JKOl6jCAxXWFJOsvJnWJ+2YD/q+ty+TkbPX8CqEUh2pl3+hdHoofOomVKP7o8
         cjjA==
X-Gm-Message-State: APjAAAUNzooBG7k9vxjYziH40GpdAwb+ZRmCTfgdHbTnjBwY8pm3DpCx
        2yDe55V60mSrPil0XzEY0pGOTbhjvZ808PUrNH59/A==
X-Google-Smtp-Source: APXvYqzcSsF5r5FNbgh7+MkKHql3jCyXn3Puk4CXzNt55mwJXBHGhHIuqsjpfMbP5qG91pTx34BRVrTSqErcSw9fIBw=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr8220626qtx.80.1567064044315;
 Thu, 29 Aug 2019 00:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8Lp47Vh69gQjROYG69=waJgL7hs1PwnLonL9+27S_TcRhixA@mail.gmail.com>
 <CAJZ5v0g4T_0VD_oYMF_BF1VM-d1bg-BD8h8=STDrhVBgouPOPg@mail.gmail.com>
 <01cf6be6-9175-87ca-f3ad-78c06b666893@linux.intel.com> <CAD8Lp4658-c=7KabiJ=xuNRCqPwF4BJauMHqh_8WSBfCFHWSSg@mail.gmail.com>
 <CAJZ5v0gouaztf7tcKXBr90gjrVjOvqH70regD=o2r_d+9Bwvqg@mail.gmail.com>
 <CAD8Lp47oNJb5N5i4oUQfN5b=xCtUc1Lt852pnXxhNq0vyWj=yg@mail.gmail.com> <CAJZ5v0j=x4HHOsJ6fCX-xOr29-4BMRzjR5H5UaoWW9v-Ci8ODQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0j=x4HHOsJ6fCX-xOr29-4BMRzjR5H5UaoWW9v-Ci8ODQ@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Thu, 29 Aug 2019 15:33:52 +0800
Message-ID: <CAD8Lp451B44QLqx2Zx+5Gm8pRP53JefYFjdEVdRz_DOmMP3CcQ@mail.gmail.com>
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

On Wed, Aug 28, 2019 at 4:43 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> With the git branch mentioned previously merged in, you can enable
> dynamic debug in device_pm.c, repeat the PM-runtime test and collect
> the log.  There should be some additional messages from the ACPI layer
> in it.

That's useful, thanks. Runtime suspend:

usb 1-4: USB disconnect, device number 2
    power-0419 __acpi_power_off      : Power resource [P0U0] turned off
device_pm-0278 device_set_power      : Device [XHC0] transitioned to D3hot

Runtime resume:
    power-0363 __acpi_power_on       : Power resource [P0U0] turned on
device_pm-0278 device_set_power      : Device [XHC0] transitioned to D0
xhci_hcd 0000:03:00.3: Refused to change power state, currently in D3
xhci_hcd 0000:03:00.3: enabling device (0000 -> 0002)
xhci_hcd 0000:03:00.3: WARN: xHC restore state timeout
xhci_hcd 0000:03:00.3: PCI post-resume error -110!
xhci_hcd 0000:03:00.3: HC died; cleaning up
