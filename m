Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B09659A1A
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 16:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiL3Pmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 10:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbiL3Pmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 10:42:42 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506B72E5
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 07:42:41 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id l8-20020a056830054800b006705fd35eceso13263337otb.12
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gkk73dnl0MxGFBM7aJ10JXvTu/cEvS027cmQyHjsNhU=;
        b=HYnVBgF9Rqb+4IYD8C0kubOsLcBB52NabigTnkyr99Uei0MgrhasIyaRO4EGjUf2e4
         MMJ/kLpSdQP/V3i3AnfKjqOpnzQu93JAikckJ1TS2XulxWXnK6VRChYE0KazKj+mPqPD
         sNdmNK+hr3PHReCIXgDrPezsY9V9zuDlSAuuDnD6fcF9pZxLgszwNr06mKAtN0gkDQZr
         nBQR6nutxQo7Dj9c6YX8cg3G164hYWPDgwG5YZeO2/Sqw1dsGFOysX6sTh9/2vsdSKZA
         QrGnP4mFc+t75yMJ7oPLPdgPOpoM2OA4IuGVIeFNPzhmeVJGVVARFQrR70DwF3lU1Aw1
         tYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkk73dnl0MxGFBM7aJ10JXvTu/cEvS027cmQyHjsNhU=;
        b=WjLEkef1Nc7PFDENzlWn5wfOb7Wz6nR0e5DksTi7xDEk1WgRJpM+A3HBSSr1N12VPn
         gMxI5jNB9DeMRdEWuYVj0zN4p+/BqNrTmXcYhsyzFI4eMxy7hbcmvG5gcEghJWuE4qK1
         wpQqWLa5viTSCCr/0OC+73b5mpc5GgyQSb/JjxWfeQ3gtRtmVFZXmz5QL3FUWyuVF3d3
         jVZxZTIaQwdPtqDf8A8bOG9+kPWufpjppnBrTUtynPVPfRZuNw8BAPaimtvXJBxl4yQI
         0XTQxtZs8OnW+fT3rd6RCruSY07i6BldcB/Y+aYuFMjdZ6eJTm4xkCxNIMoRfzmuz/X/
         ejUQ==
X-Gm-Message-State: AFqh2krHIvxt8otauaI1lBWYW6a5Oy46mfXxEA0obKh4u+YL1NLGPnf3
        kQDCie79KUEdRyyUUUHJIuVLAONqfeCN1C/xLyzDEKWdj/N+m0K5
X-Google-Smtp-Source: AMrXdXtgsr9IARSn9K6ufgeUU6dvpf1gyyAVfwtAz95vNAuzgYGveycp5MEOqkeBvUlsaJD0Cg58BBwERnH/2+t84wU=
X-Received: by 2002:a9d:750d:0:b0:66e:abbc:cfe4 with SMTP id
 r13-20020a9d750d000000b0066eabbccfe4mr2090756otk.102.1672414960615; Fri, 30
 Dec 2022 07:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20221230065427.944586-1-yangyingliang@huawei.com>
In-Reply-To: <20221230065427.944586-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Dec 2022 16:42:28 +0100
Message-ID: <CACRpkdZwR-07_wrsaY_CK+YO0h874u1HvgHrwA7=Mwe1h5D91Q@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210-udc: fix error return code in fotg210_udc_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Yang!

On Fri, Dec 30, 2022 at 7:57 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> After commit  5f217ccd520f ("fotg210-udc: Support optional external PHY"),
> the error code is re-assigned to 0 in fotg210_udc_probe(), if allocate or
> map memory fails after the assignment, it can't return an error code. Set
> the error code to -ENOMEM to fix this problem.
>
> Fixes: 5f217ccd520f ("fotg210-udc: Support optional external PHY")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
