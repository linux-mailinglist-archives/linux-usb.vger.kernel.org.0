Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34F0703368
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 18:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242790AbjEOQgj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 12:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbjEOQgi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 12:36:38 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92D43C22
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 09:36:37 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-3f4eb166122so26981411cf.3
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1684168597; x=1686760597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaWs609h278hxFtHrMxQjhQdyGWOwBk4bpNIGwrfmdg=;
        b=cq9cTG3qyLQFvczSvJoUBw6AY3gAFHjaTW0KAzeml6qS0sd8nd4pDZ4JJtAfL8JlDw
         mDWuujb/eLtEToJsmgkuXqNWPr2HCnn3oLQn1oub1ctbPMSmfJMCAtSk9mqZJFt2vubd
         iMDL93B6bECyWjC9QgrOriWkYIIEVeUnKyG8qNwt8alajFy360nFXrHhmns5GLzJPkCC
         eynKnsQ3C35PwTGlrWyO2ZUgF7a/MMACBlMWErQA6Mi5B+Yc0VrleVV6HRYWsrbZM3PU
         YjqaxKBwux6gFVH1IcpGscqIqy0mu0GetnkqdTRtEPWm0W5HptZhkcxfVH4K2iUvz6MG
         6b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684168597; x=1686760597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaWs609h278hxFtHrMxQjhQdyGWOwBk4bpNIGwrfmdg=;
        b=iYIwhbVmRE05HbSr/Z8D4AgzF1UOWQon7m4PPLNSdWcaNzDq8m/10FoBmCV8jU0PJC
         fPETyp8wbtcic6PArfsepPrQg1CAGod5JnerQWxlrQUBWAU8eswyCCQ+X+ptle1teJlD
         QUQU2HRDM8Ia/gb0Iy+UzEAFiHoLD9LQK2PNQViJbGq8HjmJj+29w8F4nk3gWVrF2uSX
         2ujowet7L1VuTh/c7KAI0Jgbv647L41u15tbXKi4zJO5x4U7W6DQAfU33CqFNYpgfJar
         /DDldzOixzQim1aKQVHhdqTlkTwhV/01Fp/AMTy2qRqd6Gt/z55q+yB8THDWYLpWvJHC
         g/dw==
X-Gm-Message-State: AC+VfDxwR5LyPaHHVdmbZLpdolQcIGBI9PF5Q3XFqUelAw6H4lkzQFU7
        kHJQ5OwGsbcy0WgZqOc6xETmb75+SSKDlp4WJdU7sQ==
X-Google-Smtp-Source: ACHHUZ73aTS7DD+7SikId1FQqfx11mLr5Cl6ZQGecy1x2/k3sl+BocACmnJrZ3gvB7JW68/QoP/OA6pO7ouozzgG3Ys=
X-Received: by 2002:a05:622a:15c4:b0:3f2:34e:4ccf with SMTP id
 d4-20020a05622a15c400b003f2034e4ccfmr54604057qty.15.1684168596782; Mon, 15
 May 2023 09:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230515130958.32471-1-lrh2000@pku.edu.cn> <20230515130958.32471-4-lrh2000@pku.edu.cn>
In-Reply-To: <20230515130958.32471-4-lrh2000@pku.edu.cn>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 15 May 2023 12:36:00 -0400
Message-ID: <CA+CK2bAWg0JejRjzn4e2K7+PgGPE3rXP0qjFwuKOEC-PNPrEPg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm: page_table_check: Make it dependent on EXCLUSIVE_SYSTEM_RAM
To:     Ruihan Li <lrh2000@pku.edu.cn>
Cc:     linux-mm@kvack.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 15, 2023 at 9:10=E2=80=AFAM Ruihan Li <lrh2000@pku.edu.cn> wrot=
e:
>
> Without EXCLUSIVE_SYSTEM_RAM, users are allowed to map arbitrary
> physical memory regions into the userspace via /dev/mem. At the same
> time, pages may change their properties (e.g., from anonymous pages to
> named pages) while they are still being mapped in the userspace, leading
> to "corruption" detected by the page table check.
>
> To avoid these false positives, this patch makes PAGE_TABLE_CHECK
> depends on EXCLUSIVE_SYSTEM_RAM. This dependency is understandable
> because PAGE_TABLE_CHECK is a hardening technique but /dev/mem without
> STRICT_DEVMEM (i.e., !EXCLUSIVE_SYSTEM_RAM) is itself a security
> problem.
>
> Even with EXCLUSIVE_SYSTEM_RAM, I/O pages may be still allowed to be
> mapped via /dev/mem. However, these pages are always considered as named
> pages, so they won't break the logic used in the page table check.
>
> Cc: <stable@vger.kernel.org> # 5.17
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you,
Pasha
