Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA50726BDD
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 22:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbjFGU3A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 16:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbjFGU27 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 16:28:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B33C2683
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 13:28:38 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso2220981a12.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686169715; x=1688761715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ayyxaoX4qIjtc/7/6qWWOoQptwj1p9/3ADMA+YnQM=;
        b=3oQErBME6yP3Xtcu63Wq6r7w76n8eocbCaBwX4w+PfqtkjGozjtsw43ZX9BudnuyVA
         d326IJZhfBojDzs2V/+Xhiw0IJq5gmSLD9xRvudm2OSNVEKWRgUmmsaNda8pMhPbdMwe
         Q7VoKNrNYuYLLwcHpdjr4FghuqToQlDoyZbC07cTeHkBBMIO0LBT4T7YWYTGWa7x+OAn
         8gUHyWtOxjjGeYvmXZf61GmuxQqxfAa3hLPN1PSfUmZlnkzk+e1DpKk27rB53R8BaYfS
         Cv2BseTYphiInYzKtZwdv5rXlFOMspm6yluf/Ducoc5LOg95DceooIayLVF+li2eXjdO
         1+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686169715; x=1688761715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9ayyxaoX4qIjtc/7/6qWWOoQptwj1p9/3ADMA+YnQM=;
        b=XNbBCF4t7RkimO0lDuDiAPf0MYm2UU0sPl/qLwj8pwAjQb4kpXABrRx521SuMftrw1
         lpvqGqmQfxkUHSgTQSoK2zVrH5Zi9YLl8dUp16SGz9L6c8l80d++GGUa0pysXvXTiKVg
         k5xXD6ewHK70raZK2Xp/9VjcXquFijiMlYieNKVqiEAjZ8Fb1bXurUaQpAQZKBBjPiMn
         3mLQPXIc3/gqpSuE4hjsA4qXudeT0KD2ISFAD9n7qVxfxxYNqjjrLXwgTEP/3k9B4at6
         YXnkmP0WuQmMoE8f1/popH81zGxarsYeKp7HpKyF8Rpz7akLHzel51gEV6UIJYd7N/vl
         ETXg==
X-Gm-Message-State: AC+VfDy8yKuuyzlPEZp0bXevEL1Vtf3aC/GkaLLMN8NUw6mQeJADs9Ex
        Szb2pNTR//Of17Umkg8eQKw/mj/AoOd/+xLIpX8YWw==
X-Google-Smtp-Source: ACHHUZ74WvSruuZwF9n+bJ5Hf6Py6tiEd9lvhuVVVansWoyYGtxB8g5egr2VYuQ+9+QI9JiLqA/PktQSQkgPct1HbOs=
X-Received: by 2002:a17:907:6d8a:b0:973:ae80:a145 with SMTP id
 sb10-20020a1709076d8a00b00973ae80a145mr9200814ejc.43.1686169714634; Wed, 07
 Jun 2023 13:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230602211602.3b7rfa252wliiszp@synopsys.com> <20230602220455.313801-1-arakesh@google.com>
 <2023060434-reveler-twice-d92e@gregkh> <20230604075504.GQ26944@pendragon.ideasonboard.com>
In-Reply-To: <20230604075504.GQ26944@pendragon.ideasonboard.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Wed, 7 Jun 2023 13:28:23 -0700
Message-ID: <CAMHf4WJe3z6EEASPjpHbwUA=CZJEkz5_jzB=f8tey6nw3KUZFA@mail.gmail.com>
Subject: Re: [PATCH v3] usb: gadget: uvc: clean up comments and styling in video_pump
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, dan.scally@ideasonboard.com,
        thinh.nguyen@synopsys.com, etalvala@google.com,
        jchowdhary@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
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

On Sun, Jun 4, 2023 at 12:55=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Greg,
>
> On Sun, Jun 04, 2023 at 09:43:40AM +0200, Greg KH wrote:
> > On Fri, Jun 02, 2023 at 03:04:55PM -0700, Avichal Rakesh wrote:
> > > This patch elaborates on some of the edge cases handled by
> > > video_pump around setting no_interrupt flag, and brings the
> > > code style in line with rest of the file.
> >
> > When you say "and" that usually means it should be a separate patch.
> >
> > But I really don't see what coding style changes you made here, what wa=
s
> > it?
> >
> > I can't see any logical changes made here, am I missing them?  Or is
> > this all just a style-cleanup patch?
>
> It's all style cleanup (variable declaration ordering), typo fixes, and
> naming and documentation improvement, yes. I reviewed Avichal's original
> patch when coming back from holidays, neither of us realizing that you
> had merged it already. He sent a v2 and got told to rebase it on top of
> your tree.  That's what v3 is, just handling the review comments.
>
> I generally ask for patches to be split with one change per patch, but
> given the small changes bundled here, and the fact that all of this just
> incorporates the review comments, I think it would be a bit overkill.
>
Apologies for the goof up. I hadn't realized that Linus' master wasn't
the very tip of the Linux tree, and assumed the v1 merge had fallen
behind. I am happy to split it up into smaller patches if you want,
but as Laurent already mentioned: this is just documentation and
styling cleanup from V1 with no logic fixes.

- Avi.
