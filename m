Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C48C912FFD5
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 01:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgADA6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 19:58:40 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44889 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbgADA6h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 19:58:37 -0500
Received: by mail-qk1-f196.google.com with SMTP id w127so35154779qkb.11
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 16:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZRdWoFnLcGhdSNkzPjq96WZNa9VKZ4N6myQKP167eEs=;
        b=nl7/txdEUJxXi8ORcJkafYP6hgnLlTYmtsjh23ngJtNS23Bov6v+T4rd4LfaM8SjLo
         dGgZ8U545CN8FDRfXbysuYeNmZuYazSQUV430FhU0xPkbTnzRt4UcvKCjPimcT4ygqWf
         4fJ89NgN+fSMxvFDcweTY7ud6aEX/TtNYyMv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZRdWoFnLcGhdSNkzPjq96WZNa9VKZ4N6myQKP167eEs=;
        b=RNlqDanPbZrQMf+SCYGp2fb26Yxf+/+Ur0bKwh5r5VVGQXkK3cpUEF52kdfPGolFpI
         2zDNuSEbNyEhWWU3oC53NcFnNzzU8Jfc0yH5oTVX5HBNHxZNw3iKHnjJUvUwI+8Gtzll
         3fxVrWuh+EiAOuv6sITa/k6DwegMnBPHvT6DMhrGnHCzyIAimN3dz7QPfX0MBToFOQuP
         brxq5NB95vu9uJddPKuHVqRKId8IrF20OKc/PpmLSphStBH2zACkmTW8EadJm72pKkWH
         pw6yb1tQIIol/risQZn49IgneQrtinaKPqzZHjC0upX+pcUE2O3g3MFykJg0IawtDNYI
         CqeA==
X-Gm-Message-State: APjAAAXSzkOyj1EL5M845MVAJcHacRqLAz1RVwIgdEn17ZvwTWzZmEYm
        gs9O8A+JRAkP6WSBQJuyfe5ynr+JxEkjw4TfBNCp3Q==
X-Google-Smtp-Source: APXvYqxv/R1AKmGaIvVzszdSZ5I/Pw3nR5j+296CXLuFg4+F3ZatRztWZsxCBRIMO/6OO/xXNCPhHrw1zMdbEaGmfY4=
X-Received: by 2002:ae9:e910:: with SMTP id x16mr72476969qkf.90.1578099516166;
 Fri, 03 Jan 2020 16:58:36 -0800 (PST)
MIME-Version: 1.0
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at> <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at> <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
 <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com> <06beef2f-e1e1-a95e-87d2-597566d1edd3@linux.intel.com>
In-Reply-To: <06beef2f-e1e1-a95e-87d2-597566d1edd3@linux.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 3 Jan 2020 16:58:25 -0800
Message-ID: <CACeCKaeoPER7wmE7uj-R0a=8eRC64TpRcP0=bg=mvtx7h72DfQ@mail.gmail.com>
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel versions
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias

On Mon, Dec 16, 2019 at 5:27 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi Prashant
>
> On 5.12.2019 22.34, Prashant Malani wrote:
> > Hi Mathias and Bernhard,
> >
> > I was interested in knowing if this issue was resolved (sounded like
> > this was deemed to be a hardware error, but I'm not sure).
> > The reason I ask is that we've recently noticed a similar error
> > popping up while using Realtek rtl8153a-based ethernet USB dongles
> > (these use the r8152 driver) on kernel 4.19 :
> > " hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to
> > incorrect slot or ep state."
> > This is generally followed by the dongle getting reset, and the
> > process repeats itself continuously.
>
> Sorry about the delay, your traces show a transaction error, and the port link
> going to inactive error state.
>
> xhci driver tries to recover from the transaction error with a soft retry
> (endpoint reset), while hub thread will need to reset the whole device to recover
> from the inactive link error state.
>
> Can you try reverting commit:
> "f8f80be501aa xhci: Use soft retry to recover faster from transaction errors"
>
> If you still see "Transfer error for slot x ep y on endpoint" in dmesg,
> but device is not reset and works normally, then it's possible that the soft retry
> makes things worse.

Thanks for your analysis, and sorry for the delayed response. I
reverted the aforementioned commit. While the transfer error no longer
appears, I still see the repeated resets, so there is likely an issue
either on the Host Controller, or the device firmware itself.
I'll continue digging, but seems safe to rule out soft retry as a culprit.

Best regards,
>
> If not, then the transaction error and the link inactive error are most likely symptoms
> of some other cause.
>
> The hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
> is as in Bernhard's case due to xhci driver trying to issue a command for a slot in context error
> state, this part needs to be fixed in the driver, but should not matter much. Device must be reset
> anyway to recover from the link inactive error state.
>
> -Mathias
>
