Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8F573B4BB
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jun 2023 12:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjFWKKT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jun 2023 06:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbjFWKKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 06:10:01 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9282D62
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 03:08:51 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-40079620a83so198351cf.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687514930; x=1690106930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lw8Po/WBsbkfMW1Mbn+sYa03mXKIdEv+J+xBQhue7Us=;
        b=WyW+OZTI+7CAQNH+UkkC5nBvtR8NR9X4ApFKhZ43Ddjj74FySCi15jooHRppULTS+z
         +1mVysC53XspzMm71w3fdktxAPWafHQ5UiCFugar1zkLFttEe3BrZDHafOKE/eVz+Kz6
         vH200WIF+Lkm+XatY9SjrdyfvnePwmMoufCi6PfmXfrbK2z7VvwVHC4VFqwbhVRDZPN2
         Q+KxQcwTM7Z82clm6XQtlfmJiBo2uF3hO9sB7ujzi2WFzO2/nVID2DMJcHw5ypTE55hT
         pX1BEyJSS62lfd5cPeOfnLCRdFWHztu5+3uQtqB/o9IUTn3NpkombSjw1IwE7XsuGtKI
         EF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514930; x=1690106930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lw8Po/WBsbkfMW1Mbn+sYa03mXKIdEv+J+xBQhue7Us=;
        b=GccYi/UBnX/dneSyDolJo/6bTx2VRZGak5waiRrk1IYwNT2JRasARaesn/DGIAuD2G
         AwZzW94AaJXP0GkRthBEw9IM1ARt9nz6HNIKXei2m6arpiMM3xcOWJ1r2wvaEJPpi8BL
         8ER9wwY6VmM5QbL76RgvnGmMCvjqPfHHm9gQFUemNGAloxNzUOOsthP631z2fZ3PDOdU
         dhz9/gIj62EH2embVIm09T1buVwkkYJ0qIjL1tsZmsTJrmf7bsf7TRWHQ184gPRYelFo
         NyqT8v0keKadvMA97h1K4RwzMudaWzjup7ic1GlrGtc/Dsh1Dc4xM+MA0qB+3Dp8FPeN
         00JA==
X-Gm-Message-State: AC+VfDwNnOWLo2vccrZ5CWv9obws6IwQeL3N6RDEIxQOPTaYrOX7bYlR
        Q57qyeDS8e+UtvigfZuEtwANNsutsODohv+V9yEqRHdj6WfK6vNPraQ=
X-Google-Smtp-Source: ACHHUZ5dy2wZgKU/cbCWzTKsvd5hiOasR6uB/VHFCOj4rQODLTsFwwDlYQlVK7AwbQXB/KgK8jk7z1R6ned6c/cIX+o=
X-Received: by 2002:ac8:5b53:0:b0:3ed:86f6:6eab with SMTP id
 n19-20020ac85b53000000b003ed86f66eabmr83471qtw.14.1687514930435; Fri, 23 Jun
 2023 03:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230622150423.3726894-1-kyletso@google.com> <20230622150423.3726894-2-kyletso@google.com>
 <2023062330-unwoven-sizable-e17a@gregkh>
In-Reply-To: <2023062330-unwoven-sizable-e17a@gregkh>
From:   Kyle Tso <kyletso@google.com>
Date:   Fri, 23 Jun 2023 18:08:34 +0800
Message-ID: <CAGZ6i=3Yq_TSRrjfrFy8946nE2JOwwjaWYHHoWxUrNWW+bTzNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: Set port->pd before adding device for typec_port
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     heikki.krogerus@linux.intel.com, badhri@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 23, 2023 at 3:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 22, 2023 at 11:04:21PM +0800, Kyle Tso wrote:
> > When calling device_add in the registration of typec_port, it will do
> > the NULL check on usb_power_delivery handle in typec_port for the
> > visibility of the device attributes. It is always NULL because port->pd
> > is set in typec_port_set_usb_power_delivery which is later than the
> > device_add call.
> >
> > Set port->pd before device_add and only link the device after that.
> >
> > Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports =
and partners")
> > Signed-off-by: Kyle Tso <kyletso@google.com>
>
> Shouldn't all of these also have a cc: stable@ line in them as well?
>
> thanks,
>
> greg k-h

Will do in v2

Kyle
