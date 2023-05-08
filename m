Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A7C6FBA3C
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 23:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjEHVtk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 17:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbjEHVti (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 17:49:38 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334D34EC3
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 14:49:36 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7577ef2fa31so475789585a.0
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1683582575; x=1686174575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DypN5RvXqLksPcW5ZvZG8k610j2dukEwh9kpzephRg=;
        b=ETJ34Wf/9zLKeq59gMLCgQHLRI7YW6QtfbJup0HcbTCctOJQh8hMmvaYxxEVf/7l17
         7xmIplHvezxEj1B81WZebQIMesvgjhhApaWWrdmQAGBU6594T5+Nfak7JtcFkHcYFzqy
         iVM6adANYtGxwDBm7yFGxCL1Kit8d0aktIGUHd7Hg2gJR+cjssaUv0RH5UKzo1RYIwFE
         xBhQHCDO4UfGJdrS89Baus4y656qCIF1ORPYUU83HiN8lelvHvaRcid379ZFRHMSVavv
         UWaNdQ0dwLnNu6AJ1PT1C3wyW5+dyCrsqijoL3Ni94sFqV9z1q10sIQqfes9anRtOQCB
         tVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683582575; x=1686174575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DypN5RvXqLksPcW5ZvZG8k610j2dukEwh9kpzephRg=;
        b=Z3UMLKI32PZ+MhGehZWF55ACShumde3E/EfBtFNFsT0qnh4jK1sDiPKnWK37nOsUX4
         xQWje7/1EyeKAQLvhgPlD/1yEVPMEEfvs0xR0VYStBoWizHl5i6PBtnKEOU+SFNi+c/+
         3aS6O8leEpXV1g3bZY30fba46geju7ioNq33/fSOK4x8bQTYH/uaBgZahjLRonKchIlr
         HJy7Knt92jtY5F8W6ganadLtChiTPwoJOZ2aMPGr1r5k6DW/a4N81EyCEe4pEyJrnBDP
         RrkCrb/DH9RWAC0iiaQ5EF+/q/dUdomhpLENoPRp9bvjlP3noejKTtYQJao/IMgmIKd7
         l6sw==
X-Gm-Message-State: AC+VfDwy05TKLLuEF32MoIFda4uQ1OVmqFFUcvqi37kegVX1nhNdRkyL
        RaA1kePlKfVk0ZX+y1Gx+P5UIBs3mjUaCtrbM9+XxA==
X-Google-Smtp-Source: ACHHUZ7zyXFkqgEsccPWkZHFOJor+dQhIH8qZ6gWsgckZggtSV9wyrSoA3DX33fkwKpQlFPhlzUoJmhPPcN2ZkvOapA=
X-Received: by 2002:ac8:5c14:0:b0:3f2:1f63:2b24 with SMTP id
 i20-20020ac85c14000000b003f21f632b24mr18176160qti.2.1683582575351; Mon, 08
 May 2023 14:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000258e5e05fae79fc1@google.com> <20230507135844.1231056-1-lrh2000@pku.edu.cn>
 <CA+CK2bBe2YKYM3rUTCnZ0RF=NFUR9VqO-QYn3ygPsFJWLY1MUA@mail.gmail.com> <ZFlrbDft1QfMyIDc@casper.infradead.org>
In-Reply-To: <ZFlrbDft1QfMyIDc@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 8 May 2023 14:48:59 -0700
Message-ID: <CA+CK2bDVjovwB9v-Zv4Fn7EUfp5FV2XK36iJKYKY7pYNOFfOGA@mail.gmail.com>
Subject: Re: usbdev_mmap causes type confusion in page_table_check
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Ruihan Li <lrh2000@pku.edu.cn>,
        syzbot+fcf1a817ceb50935ce99@syzkaller.appspotmail.com,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
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

On Mon, May 8, 2023 at 2:36=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Mon, May 08, 2023 at 05:27:10PM -0400, Pasha Tatashin wrote:
> > > static void page_table_check_set(struct mm_struct *mm, unsigned long =
addr,
> > >                                  unsigned long pfn, unsigned long pgc=
nt,
> > >                                  bool rw)
> > > {
> > >         // ...
> > >         anon =3D PageAnon(page);
> > >         for (i =3D 0; i < pgcnt; i++) {
> > >                 // ...
> > >                 if (anon) {
> > >                         BUG_ON(atomic_read(&ptc->file_map_count));
> > >                         BUG_ON(atomic_inc_return(&ptc->anon_map_count=
) > 1 && rw);
> > >                 } else {
> > >                         BUG_ON(atomic_read(&ptc->anon_map_count));
> > >                         BUG_ON(atomic_inc_return(&ptc->file_map_count=
) < 0);
> > >                 }
> > >                 // ...
> > >         }
> > >         // ...
> > > }
> > >
> > > This call to PageAnon is invalid for slab pages because slab reuses t=
he bits
> > > in struct page/folio to store its internal states, and the anonymity =
bit only
> > > exists in struct page/folio. As a result, the counters are incorrectl=
y updated
> > > and checked in page_table_check_set and page_table_check_clear, leadi=
ng to the
> > > bug being raised.
> >
> > We should change anon boolean to be:
> >
> > anon =3D !PageSlab(page) && PageAnon(page);
>
> No.  Slab pages are not elegible for mapping into userspace.  That's

Sure, I can add BUG_ON(PageSlab(page)); to page_table_check_set.

> all.  There should be a BUG() for that.  And I do mean BUG(), not
> "return error to user".  Something has gone horribly wrong, and it's
> time to crash.

 It is just too easy to make slab available via remap_pfn_range(), but
I do not think we want to add BUG() into the remap function, otherwise
we will break devices such as /dev/mem.

Pasha
