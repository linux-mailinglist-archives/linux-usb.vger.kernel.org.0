Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B367032ED
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 18:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242703AbjEOQ3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 12:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242392AbjEOQ3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 12:29:33 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33A5D7
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 09:29:31 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f4fdf564d1so15557931cf.1
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 09:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1684168171; x=1686760171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHpcsyuraYipRh6JrDyCG/QY3q0OoJTJdMJOWndENCc=;
        b=BSYqYbQkwHL4mrBWnucRzTipj5Nu9rzJUkmYfi+7daXIWIVb/LdX/qjEnp1naOjMMg
         5VoOcDwTf+H/85Oc4oLDcHqMnjldw9Mx4KJye/cxPqhXGXlsf1dxpMyKBvW/0Gzv7+/7
         C9XISfbGDjX1oVb1GwYTJz8FX+k2FidtLt29FZwA00ody7cNcjGFsjXfnyYyiCVbSuv+
         KcXXJ0l52LOAFrGvr+9fRRFlnp4EPSl8jecoX/5wg+Cf1+bMkwIvR/v3YN+7xIl1+qCZ
         Zyo9u69TE+ROGOrxQ/GPHL84meiROlV1cvBx9MUC6UnMlO9igdszXzPnpEpXJwPdtWUr
         RVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684168171; x=1686760171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHpcsyuraYipRh6JrDyCG/QY3q0OoJTJdMJOWndENCc=;
        b=FW4nTumSUsTWd18K62/+hXMURX3b7bdyWmF91TCTEl49YYYG7gif8VsHP18w/A1YeR
         J+/VU1r40cktUfV/TbtmfPaPQzpgaL3iCrOPV9YZ9NjzF95/w+99XpBUgDfZ1VwxjoFd
         ZxJxAo7mfmFUmq0zqUa+YJz4yF01U/XAqhsJoZ2p9BW7iT9jLIuPUvmCwIuAW/M4/Nc+
         LFQ7JIC71RhTCoqegXGqXPdQdl5vg13j1TveWBWdcqqsJPiavv3XNRc3b5NPnsr9YBLu
         hwO2ZDTsgl6D1Ud/xWpcgpyTD/br9691wFEcnh4TMrKkuV8/6Qr/cptWApB3fsmP53iS
         ONtA==
X-Gm-Message-State: AC+VfDxPs4LFaIUEWzY31QSXOq6zlaExwCSMxItm1dPbECsEzrjb3sE7
        6JPf2y5w5ZYdshaABsaxtSie5lAMXpwmA6bVa776Vg==
X-Google-Smtp-Source: ACHHUZ7W3rDE8/W5o/GHcHMti08Uun/DjbpZZVO5xumzi9ao3DNvSLLrAkbDQfclVBIYTxSm5L12X2SFgGLLPBIsg3I=
X-Received: by 2002:a05:622a:492:b0:3f5:1de5:af48 with SMTP id
 p18-20020a05622a049200b003f51de5af48mr9837008qtx.5.1684168171050; Mon, 15 May
 2023 09:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230515130958.32471-1-lrh2000@pku.edu.cn> <20230515130958.32471-5-lrh2000@pku.edu.cn>
In-Reply-To: <20230515130958.32471-5-lrh2000@pku.edu.cn>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 15 May 2023 12:28:54 -0400
Message-ID: <CA+CK2bBD_fdmz1fFjB8MXBGMHf4jzRWeBRirH3HdWRLqY7cmtw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm: page_table_check: Ensure user pages are not
 slab pages
To:     Ruihan Li <lrh2000@pku.edu.cn>
Cc:     linux-mm@kvack.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot+fcf1a817ceb50935ce99@syzkaller.appspotmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 15, 2023 at 9:10=E2=80=AFAM Ruihan Li <lrh2000@pku.edu.cn> wrot=
e:
>
> The current uses of PageAnon in page table check functions can lead to
> type confusion bugs between struct page and slab [1], if slab pages are
> accidentally mapped into the user space. This is because slab reuses the
> bits in struct page to store its internal states, which renders PageAnon
> ineffective on slab pages.
>
> Since slab pages are not expected to be mapped into the user space, this
> patch adds BUG_ON(PageSlab(page)) checks to make sure that slab pages
> are not inadvertently mapped. Otherwise, there must be some bugs in the
> kernel.
>
> Reported-by: syzbot+fcf1a817ceb50935ce99@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/lkml/000000000000258e5e05fae79fc1@google.=
com/ [1]
> Fixes: df4e817b7108 ("mm: page table check")
> Cc: <stable@vger.kernel.org> # 5.17
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

I would also update order in mm/memory.c
static int validate_page_before_insert(struct page *page)
{
if (PageAnon(page) || PageSlab(page) || page_has_type(page))

It is not strictly a bug there, as it works by accident, but
PageSlab() should go before PageAnon(), because without checking if
this is PageSlab() we should not be testing for PageAnon().

Thanks you,
Pasha
