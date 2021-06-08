Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF9239EE35
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 07:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFHFiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 01:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhFHFix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 01:38:53 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18007C061574
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 22:37:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so1098781wms.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EZZAYmPaX6ffMTdg2DWwlYwk6s3aQeT7+ggFqu+llas=;
        b=XyS0379VQbNIpE9lKatovLmDfLTtt96o4eCkxsuvjdfahQdHG+7tghkNuwKAmC3WCc
         mEeR/HJ7bGJk6wKh72w718vpwDmZ2Q3GYZwgzE4yfSKe3Tl6ATB0+13f68KxA81bEctI
         PdKrX9B4nNn3zkMOaMnJBc15W9mBgfec5qacQVkfhTxf6QiMvoK2EyP2HMdpL3utzIa+
         Ep8T/BwZ+94KxFfWnUdUrHA6Xl99R04lM4uaCQEnYySZSqyni/j5Eetyu0vIKJjsI8Pp
         c1+t2VIA9Q2fLxNK5h1SlK0fSyHZF1eBjVshnWGibkFvnu/znWfvX2c8lgdI7+x6xZum
         SnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EZZAYmPaX6ffMTdg2DWwlYwk6s3aQeT7+ggFqu+llas=;
        b=BSnn3RxoC1UC5BJmoKP9KQ+9NVdvBrf5m59IDG1U8y4ZYrPtq1KO86dz67pTM7C9ca
         bZ7AKlacuCcMpNm7/c5C8V2ePJM4cG5FhqKvJgLXc0701MiwPJw3ClJz/h4yjYzDuY3Z
         pjOU+9FSz1u1TXtDhfqJeNjYzDhAjguBYCrQ7ULu1LxP5+YdM4sZ5QO/85OMlt3mXChE
         TtnskE4sYdDpnjUKKkD0BtmdGm6/xfgaMHkw4uRd1BOjVU/w0IQvCnsugd0ZGfLdiXFJ
         oZdVT8LdNchYHJ6tMyhPsuZczKhnY/kBDGzuutLVDiDdUp7IfJGzAtD1qtCQ+93ez9eZ
         FOhw==
X-Gm-Message-State: AOAM531hMopw9h/7PEMObW6X8ShsuvafxQnsl+Q57vD+sZwOjU2/0xxe
        OW0mV52iou9/DNocXdq73VzraUOiuSwQsP1EBN94mA==
X-Google-Smtp-Source: ABdhPJz9wX9V4lCtahfERvsnDhSrBNahFXKDiTJTHqp8OiWmr+Vlm7sqTJx6ttF2M1BJ9maF9iY3NnBJ8bLSQ99R06E=
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr18109486wmg.44.1623130619404;
 Mon, 07 Jun 2021 22:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210608044141.3898496-1-zenczykowski@gmail.com>
In-Reply-To: <20210608044141.3898496-1-zenczykowski@gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Tue, 8 Jun 2021 14:36:47 +0900
Message-ID: <CAKD1Yr3_aDiRNPAS-xX8AUnGso1pZBcxxoePbsM3yPfBQo1oPQ@mail.gmail.com>
Subject: Re: [PATCH] usb: fix various gadgets null ptr deref on 10gbps cabling.
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Michael R Sweet <msweet@msweet.org>,
        Mike Christie <michael.christie@oracle.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Peter Chen <peter.chen@nxp.com>,
        Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>,
        Wei Ming Chen <jj251510319013@gmail.com>,
        Will McVicker <willmcvicker@google.com>,
        Zqiang <qiang.zhang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 8, 2021 at 1:42 PM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
> This avoids a null pointer dereference in
> f_{ecm,eem,hid,loopback,printer,rndis,serial,sourcesink,subset,tcm}
> by simply reusing the 5gbps config for 10gbps.

Matches what was done, for example, for f_ncm in 7974ecd7d3c0.
usb_assign_descriptors calls usb_copy_descriptors, so it's safe to use
the superspeed descriptors for both superspeed and superspeed plus.

Reviewed-By: Lorenzo Colitti <lorenzo@google.com>
