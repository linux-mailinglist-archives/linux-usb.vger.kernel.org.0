Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DEF20F9FC
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 18:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgF3Q6G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 12:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgF3Q6G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 12:58:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62252C061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 09:58:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l12so21335550ejn.10
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KtUm5YVkEmBBAmBkh9C/2G471VRzBuBXKsvmWLc3CNw=;
        b=lh7ZGCS+C+61DDZesyDHL/VreuUPF6YW4JSk/glvE81Lf70PEhekUNotYb2qIJsTw7
         6KwUyOR1PGrK6iXz+tu+WJsmzzK4VCFjB6p8NWF82cgzYeLEXxZ33nl1bN6YGMasIfTS
         7f7P+TQj0FOqSvFJHkuZQ1RgRy9z9KCquokbueXzMCKvFNqGjXjOoUGAtlr8HCz27YbZ
         jZYofhbXfkXzkMvxjYR3seJB3TfI8luy2OtIj3LRetIwbRg6rn2WFg9kQBqKBYlcqpIG
         0knyc9uL/zUdQteXq+qKPxL5MJKIc435FAh+fDyTdkLwcz2Fv0wsdiG0a7ZRdL7XAjwW
         6G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KtUm5YVkEmBBAmBkh9C/2G471VRzBuBXKsvmWLc3CNw=;
        b=Jg6qjbLgJm+IOk0QdbwkSncb60rATVrHG0YAYQ2Ol6P95WAuqbcqV9HFZ0axcrIMRN
         L6MQZJLN9BKivnvDXLb1m2F2MAN1etucObHB+dBh9rsHtsRCS1M6VvSbGB8cuN+uw9ua
         JM/Q7Vfm+VaJNIwmXhy2tBreZXkCz7dqgjpo2HLBKQYFInSn/yRlCh/Romk9n+3vPR28
         otVqXOp1v2o4npqrYsqo9ApZjK16+D+XmpRdQQ8gy9Fu3C0OYiU9ezsNnNcYSkUGa1Gb
         3Y5mbpuVliGIqBzz6DHaVcpYFneZYaUODFFg12PjITvSrKSYHZmjZ8nRSlV2FdCu5m7B
         f5Sw==
X-Gm-Message-State: AOAM530aJPf76VA8JXhqFaL5XljHUvNnWvLbD8Yxa6he0TUh/TLEDpWI
        8i9PKQL4P62nSXSR604KNgM=
X-Google-Smtp-Source: ABdhPJz1Ve5DJ6bD/JjRraooa1Bs7IZ+LDV0oeqaqRe/KIM0fWMR8ed8kzWz9GTpvrRLGk2y5oYYyA==
X-Received: by 2002:a17:906:e299:: with SMTP id gg25mr18642709ejb.160.1593536285104;
        Tue, 30 Jun 2020 09:58:05 -0700 (PDT)
Received: from ping (x4db777b8.dyn.telefonica.de. [77.183.119.184])
        by smtp.gmail.com with ESMTPSA id e16sm2454292ejt.14.2020.06.30.09.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:58:04 -0700 (PDT)
Date:   Tue, 30 Jun 2020 18:58:03 +0200
From:   Fabian Melzow <fabian.melzow@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD
 ep_index 4 comp_code 1
Message-ID: <20200630185803.2a72c123@ping>
In-Reply-To: <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
References: <20200620211913.1535bac0@ping>
 <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

Am Mon, 29 Jun 2020 20:47:24 +0300
schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:

> First issue I see is that the attempt to recover from a transaction
> error with a soft retry isn't working. We expect the hardware to
> retry the transfer but nothing seems to happen. Soft retry is
> described in xhci specs 4.6.8.1 and is basically a reset endpoint
> command with TSP set, followed by ringing the endpoint doorbell.
> Traces indicate driver does this correctly but hardware isn't
> retrying. We get don't get any event, no error, success or stall.
>=20
> This could be hardware flaw.
> Any chance you could try this on a xHC from some other vendor?

There is no other xHC hardware available to me.

> Second issue is a driver flaw, when nothing happened for 20 seconds
> we see the URB is canceled. xhci driver needs to stop then endpoint
> to cancel the URB, but there is a hw race and endpoint ends up halted
> instead of stopped. The xhci driver can't handle a halted endpoint in
> its stop endpoint handler properly, and the URB is never actually
> removed from the ring.
>=20
> The reason you see the IO_PAGE_FAULT is probably because once the
> ring starts running the driver will handle the cancelled URB, and
> touch already freed memory: AMD-Vi: Event logged [IO_PAGE_FAULT
> domain=3D0x000d address=3D0xdc707028 flags=3D0x0020]
>=20
> I have a patch for this second case, I haven't upstreamed it as it
> got some conflicting feedback earlier. It won't solve the 20 second
> delay, but should solve the the IO_PAGE_FAULT and the "WARN Set TR
> Deq Ptr cmd failed due to incorrect slot or ep state" message
>=20
> Can you try it out?

I successful applied the patch against Linux 5.7.4, but get this error when
compiling drivers/usb/host/xhci-ring.c:

  CC [M]  drivers/usb/host/xhci-ring.o
drivers/usb/host/xhci-ring.c: In function =E2=80=98xhci_handle_cmd_stop_ep=
=E2=80=99:
drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of function=
 =E2=80=98xhci_reset_halted_ep=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
  857 |   xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
      |   ^~~~~~~~~~~~~~~~~~~~


Fabian
