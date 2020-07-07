Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765B1216640
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 08:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgGGGM6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 02:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGGGM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 02:12:58 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44305C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 23:12:58 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id h16so11672058ilj.11
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 23:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYFmwzjGtjPy9ccomrEq7B4vYHNI1kYoI6eFNRVl1e0=;
        b=sUiiMxHsqXU/jItBWY79QsWScCEOTKW2Z5hf0QryYhLjjqXu5rRTel5WykX7hN1qSm
         /R0lOv1iT6hFSaGq3OpnsufkRnImF5Y7lGlsmMt5ghEO9iVR6SFD0A7DWvIhvExeRbPN
         G00r0Ik9P/Z1iAwEUrY07ay5cItV8kL2o1holLmX4a88Wg5NHtgLSBSpMs7j0Ud+ML33
         pm0EwHIv36AA2ftwk0/mL4xSDdFdZKFOjjBiJ7qdJ88CiTcdEMTf8zQUBalr4SHu6Jwd
         0JlTbhO6g2L5fhAjoTm/0FcVZ0OyLaH5jmHCAnUkXbiFL6bLZEp5gwWGVBfY92/80XyV
         /z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYFmwzjGtjPy9ccomrEq7B4vYHNI1kYoI6eFNRVl1e0=;
        b=hq2any5xubfI+k3Z2zxuMSV/YJMRAftWy5kkPRjTRGza/yZKFoBMUytoPctYshpUsG
         D6Fp7MP4f6j9NmgiGvL0zTgyCtofetD0tt/71Oif4VNAe/a/hqsiUF68e0LsVo7dl+Od
         wv6hL1AyhZcYbGLFlRKl6b+ar9eviZrq4/jipgT4wCq4ukqsnaIctP5blF5Ok+M4BTcp
         oDs3VDcDLn4Vt9cFPJ9qpDXr1/nXEl6Ok0KAL5Mk1jNC8FSBMNK59wW1j5OwAavFuqFH
         FdCVLLzCMMTcGBNCvwllrC8LVRhUMS0F4p6q29CkVh0FfQ7UDjRLig5FTMPnaqJHLShD
         gDBQ==
X-Gm-Message-State: AOAM533tqiojUfkm5e/4jiKbVoFmeahIq9f5fqJoNb4sHJj/f194RYd3
        OUXbFlWCCBVf8k36HeI9Ni2Bwl8EZ26oh0Sm86c=
X-Google-Smtp-Source: ABdhPJxt56DdxzXmkzSLgan9zfQ5FKnstS2fYAQ8J2J1JxOH4NWOpiri/Alvq2iWpdQhHK7sQLVIk2ySx4JrBOUeSFs=
X-Received: by 2002:a92:5a05:: with SMTP id o5mr28703054ilb.237.1594102377487;
 Mon, 06 Jul 2020 23:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200603065356.14124-1-peter.chen@nxp.com>
In-Reply-To: <20200603065356.14124-1-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 7 Jul 2020 14:12:45 +0800
Message-ID: <CAL411-qtYLWE_W2bZTGrho4PADEY+8WRjUWEHcMXCz0Ej6P0Nw@mail.gmail.com>
Subject: Re: [PATCH 0/3] usb: cdns3: fix some endian issues
To:     balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>, linux-imx@nxp.com,
        pawell@cadence.com, rogerq@ti.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 3, 2020 at 2:55 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> Reported by kbuild test robot.
>
> Peter Chen (3):
>   usb: cdns3: ep0: fix some endian issues
>   usb: cdns3: trace: fix some endian issues
>   usb: cdns3: gadget: fix some endian issues
>
>  drivers/usb/cdns3/ep0.c    | 30 +++++++-------
>  drivers/usb/cdns3/gadget.c | 80 +++++++++++++++++++-------------------
>  drivers/usb/cdns3/trace.h  |  6 +--
>  3 files changed, 58 insertions(+), 58 deletions(-)
>
> --
> 2.17.1
>

A gentle ping...

Peter
