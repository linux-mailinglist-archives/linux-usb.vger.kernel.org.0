Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBB4257694
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 11:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgHaJgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 05:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgHaJgE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 05:36:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01FBC061573
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 02:36:03 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g6so5824387ljn.11
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jkb7hvLBOWuc3HBdgjiysp9kEiIoP/e+0I+Dzttf7DY=;
        b=d4N9Ve/2ZBC+XL2W8Gu13e2gf6Aj9YEBWycNL++kwSH+LPqrC6TRIRka0uCz3kqIn7
         YLMY9orJQNjASw0zH9hAfHcqI0IMFtkiY+bSbIatCes7SGYoPuPcwhj66NyvyymJbZQ2
         8O2Q18VejFSjgtITZtab15U6WfdOCUsMBxKePS6ASo3k38nTcGYGhv9Wcy+K8H2184Pn
         mAP3r4N9/70gm3J1AG0f/M+rUkdlQld+t93OHJtqhR+iqVrZxcczpJ0VuxN08xwS00kd
         DGHf0OZL9vEhu+EIKt5SaxtmZ4SGqWoCPyAfR9LRenGWnk3PvXcgJ3JUTXDOP1a8oEXV
         a33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jkb7hvLBOWuc3HBdgjiysp9kEiIoP/e+0I+Dzttf7DY=;
        b=ogi0DKY8KGeRiZTUzfdLMDuKLNzJs7ScIUPg3TQjuejBIyKDeH8eQgHlOB1DIkS+Kx
         foNjVPh4Z0RJ6GRCsOzw+IKviSHrmE798m5rqVYSAkgZwFOAVFtDVUOBk1j08i9cU2M6
         P/QVwH5W9NdNTpWrNwrW3x8PHrMy/uAp39CklgskiBDlvULjN57B+RObS8oWeMI2DWAT
         djKdiyGIQgTDSC/Gv+SA4YKD6s0Pj/TKcIMGYklvFV7a+wBDQ29kla81nzQ3fCaZ4Qg5
         uSaVWBe6SrxujZACrLsqM5HOj7etOIarj43lXVBBVibsv8Y6x17yRaFg7cOeHxayjmJy
         8qnw==
X-Gm-Message-State: AOAM532DR2/SERjFeK7WdbHgP2woYj7VNNC6ipRQlNW87cOuQBstqgp0
        4JIOvYOJVXQTBXTPyXZ2WbATK+4F/bdE4IbpGh2OCiVOHgU=
X-Google-Smtp-Source: ABdhPJzo4bObyFWXRCJ/ivS3dZ6hDeQ9XAyL+LB1eq3dSmVzvKLiMjC1grdf4cOguRgaf0Jz/rRh2GZTFNszKpa3kGE=
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr248549ljm.441.1598866559937;
 Mon, 31 Aug 2020 02:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu> <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu> <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com> <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
 <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com> <CAL3BvCzKdRAVNMgG2do1D_QgKnR_x+P-uBuv3-kPMi7z6iabwQ@mail.gmail.com>
 <a8c8509b-6f45-c905-3860-d2b5dd5f9103@linux.intel.com> <f57b9d65-9553-17f7-090a-0272b013af36@linux.intel.com>
 <CAL3BvCyqATeb2cSE5ZcxrvkZWROfMn3U7YxcPMXHjQpEFDMAkA@mail.gmail.com> <8ae30689-aa69-0344-99a4-1425b9eaafec@linux.intel.com>
In-Reply-To: <8ae30689-aa69-0344-99a4-1425b9eaafec@linux.intel.com>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Mon, 31 Aug 2020 11:35:44 +0200
Message-ID: <CAL3BvCxrv=B51m3Jxc61RKZvFTW4og5a-vxjJKc1twfF_QXJ4A@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 31, 2020 at 8:37 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> Thanks for testing.
> Can I add a Tested-by: Martin Thierer <mthierer@gmail.com> tag to the patch?

Sure. But as I wrote, that was a pretty marginal "test"... :)

Martin
