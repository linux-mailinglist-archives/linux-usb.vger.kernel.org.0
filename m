Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCE824FE95
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 15:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgHXNLW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgHXNLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 09:11:19 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147EDC061573
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 06:11:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u23so2049314lfl.10
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwmMd+hzAlVhonBKOrRx/mfbKnMhY0KgBZkqe1549R0=;
        b=GgpmTp2FC79QIEuNvbW6UUczYgUgrVgB4YNEIp0gglTVdjJQlg2zsn8/92V0pdZ8WP
         xyPtxQ1Gjj6pZBJNob2PSH3815Tty9IuU3eauDvRS7VnecJUe3tvPufZvSmhougzFbYq
         pVsupo8oV7xhZ6/2B9LdIIhUJbakc1Yu+t0qHWtFE0bIBt8Imd1igDrXtHVDuFVjcVNx
         eY0xQMXkMhQUOm0gP9uO+yHjRwCU5LG1moIdeEnfvbznU0l6VWO9GHBcAzYD/xINHcMu
         c+vGEopB157k8DvwNLZ1gD9yLErtxY4aVJ72+vJkxQcI1ULrOy6JBO3lzUQGNdjLiH0X
         ZzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwmMd+hzAlVhonBKOrRx/mfbKnMhY0KgBZkqe1549R0=;
        b=J62DWngeIrGMF6jlGM4jGmexdTkh3eFU/VLQ1y/VNV1A7/k3rsGQGuVvrxjYtpt979
         GAO3P4EbiSVWnqrLswDVxR9nfbaxe+fQmaKFYp5qN4o9dyoFu0e3Etj9yTLA5JJS4ZAm
         roQ6vNZivCJP6EARgWlYHsIQBvrxE0J6F5FkZ/qMBThNIY9BYGmYd3byLYfWsvPuQ7G+
         /CPoPZ6SPY6J38KK8IlfxSV2UquA//V2vIVmkEVoh7ObgvcPaKP9GYtA4ulTfapFDVxC
         Wd84u2J1tSwrGAgYObcRAMaDsRjvnrhkyI1l+C9KlzYBEcZs0U3RJnntEpBXlH/rDfPr
         vU/Q==
X-Gm-Message-State: AOAM531YoVUVq7mFpjA6+WUjWzuJAIpdvUEdBW2nCrJM5F8sgjSjQgs0
        22X4MBd78vkOzzGKGgU8mbhkKZgAjdVBLwzyBDiUmTKOt+SRBQ==
X-Google-Smtp-Source: ABdhPJx+8DhOdzIWwam2ORL3xWe6SljvpKzCuu6brSeIFU84tF3LSjFYKjMIYPLEHUocJzw6MPrPPhiorKyuHGEcy90=
X-Received: by 2002:a19:6b18:: with SMTP id d24mr2675641lfa.40.1598274673743;
 Mon, 24 Aug 2020 06:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu> <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu> <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
In-Reply-To: <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Mon, 24 Aug 2020 15:10:57 +0200
Message-ID: <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> True, xHCI doesn't reset the toggle in this case.
> xHC only keeps track of added or dropped endpoints, it doesn't track
> which configuration or interface is set.

I'm not sure if it's relevant, but I found that calling libusb's
set_interface() *does* seem to reset the data toggles also on xhci
ports, even if it does not actually change the interface.

Martin
