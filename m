Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C919E720BA0
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jun 2023 00:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbjFBWBA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 18:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbjFBWA7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 18:00:59 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918841B5
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 15:00:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so3487290a12.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685743257; x=1688335257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0c9jC97KGUo6t2xu7Q7CAPz1B3NlMHnmNeStAhPtvo=;
        b=B/FzE16Y/d97COqfsYP4Gf+9f50rhp0JXBeyr0WLMKRrytwyZnttXH1AOPOZH3uNhe
         8PG71Otg1cI6bKjOceT9dQM5NRC2r9khaRdWmPziTLeSWoqTYDowTqXtpD3TJwyVZFy7
         LEhiEIj+Qd2RpmC2SRFaWkKdHNsbyAwr7f6h3qBbyOCg29DLKNdkQIxTegyeU82wKMiz
         hUNzyadcCa7WQD7dmG6YCmCe8KfAXHi4wDp8an5rmyn5u4lMZs7bYSWacTNWKLyUfHpQ
         Uoe96G2Uuc9yFuKMglFAqVEo5+RdKc5409iwq3c+wfwWfLopKKWW1xvwgQfnOe+8IWu5
         HSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685743257; x=1688335257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0c9jC97KGUo6t2xu7Q7CAPz1B3NlMHnmNeStAhPtvo=;
        b=aFks0ZfIx8N8UdCCPebT5Tvquodiue1fG3Dm+aRk1DikJzdM0x2efShtoGuSV8QKoQ
         6y4gXxVOEv/iO9Q0HPoCudCzMSij27zYnrv0BVnrqqaJq5vtBkDf+nYy0/TRu6de9cLt
         VZUSPSRYsfeI/w2MQ8Wc2uoaJ4DSIoNlcv3e8ClggySW/3XlDEZqSf5GMKFF1RBm7Yq4
         mtJoR5wLpYsAr7on7yvd1yD5qh+tzPvTQJMoZiDPJ976Z2DUsnkQV4MiH7QFjg5QavnA
         rHsxv/8ES3yehWexkxHNzZsGNynSV1w/sopXeHG24tjRzrNRKPuZEqjWgOaRtimfqtTf
         GAXg==
X-Gm-Message-State: AC+VfDwTG1CjrMYN9lErzQZPZT4EiXLiXi3FkRV4yd2DCp+h0N2XK6/0
        FUIRzwKMF2FtsJppk11PZfHC6LtmuZtT+EZGCV0gfA==
X-Google-Smtp-Source: ACHHUZ6APbng4RrVYWz+iiEOuhUyk2lS54PIgFE/nZYsHYhDmJNdhXg4FMQ9G2qfZy63fZxBgaDi3g+sk16zZtkUKTI=
X-Received: by 2002:a17:907:3e28:b0:96a:3811:f589 with SMTP id
 hp40-20020a1709073e2800b0096a3811f589mr14027824ejc.10.1685743256867; Fri, 02
 Jun 2023 15:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230602151916.GH26944@pendragon.ideasonboard.com>
 <20230602203746.288881-1-arakesh@google.com> <20230602211602.3b7rfa252wliiszp@synopsys.com>
In-Reply-To: <20230602211602.3b7rfa252wliiszp@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 2 Jun 2023 15:00:45 -0700
Message-ID: <CAMHf4W+yLY34yc4ZSHamXeghovcnVvQWPDuXk+mF=zx9miQt1A@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: uvc: queue empty isoc requests if no
 video buffer is available
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "etalvala@google.com" <etalvala@google.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jchowdhary@google.com" <jchowdhary@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 2, 2023 at 2:16=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
> > ---
> > Changelog:
> > v2:
> >   - Updated commit message to make it clear that userspace application =
is not
> >     required to match the ISOC rate.
> >   - Styling and comment revision based on review
> >
>
>
> BTW, your previous version is already in Greg's usb-next branch. Any new
> change should be rebased on his usb-next.

Oh shoot! I rebased on Linus' master and assumed the patch hadn't been
merged because I couldn't find it there. Uploading a new patch with
the changes in v2 rebased on greg's usb-next branch. Sorry about that,
and thanks for catching it!

- Avi.
