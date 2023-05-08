Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C827B6FBB62
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 01:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjEHXWi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 19:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjEHXWg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 19:22:36 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4696D93D6
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 16:22:34 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7575ff76964so134057585a.2
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1683588153; x=1686180153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J20KJD8UUGIZf35RzyX4QJCStx2hC/zK71qAj+ED4BU=;
        b=TNMGn3m6WEBl4N8JuGwvWyR7WctTWHrVftC5hiZc+tYMbbctCLn9sos4hh8iEGyDm5
         5110E/Ts3cuwWgtVQzy6GgZQvFIuUQmm5K7wnEGtbGLk6sT8A1VO8cg1Im+govrADMOV
         Cy3Q+TEYXLHygksHb/uhHTtC/wyU5d4TaivEarWakk+ul7Rnm1CztBxTQhPcqPm7c15k
         NmY7elOhiRuBr5r94CHdVN1p+F/ne2xVcpGTtVJdluQqWcjPcftUAajG1zyCm6iqVxV7
         nI+lYGjD842cyiWHZcP+QWXu19HTR2CEZIUESzAJTGZKgwxs62NdbD+juBhTQ29gzj3t
         uKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683588153; x=1686180153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J20KJD8UUGIZf35RzyX4QJCStx2hC/zK71qAj+ED4BU=;
        b=dxf1bddKrvYsNKXu303XwNxaKauTKyOm4jzw4MFCtjR7KHI8eqEnf0vNmPMXIs9PXm
         Ux/ouCJ63MAQU/GcbirsKCUEeRk+ROza3XATesGp5rhOdCshRNOIsj9UT2ke9yDj0Hiu
         kFXko3kR7C3fpLiVIPc0Co3S/E87pm/qjT9wEUoQ1XQDlCYGn7m3z6C9o3UaGfEH7fbq
         OsDCoES+9yG7/ttLExnswuIjWqyQ1gTtWUMfUjE2WtzQ+IhzyofaGUIlWCUeXYXaoHZG
         oAbE0Uq5tKlu2uGO5SY+nrNB+JOcYto0bsJP3erWSpnSlnPAuCG0WvH1AARUYhH30t99
         i7Kg==
X-Gm-Message-State: AC+VfDxvMJ5MGCVIKNje4kQTH8eQh84D5mYgHwHWVVs6veDGhFf+kVtZ
        XzFhDP09KJP54T8ovu5oigxx7DSZg8oJKJwpDywE8PM68XG2dJsBBLxTGQ==
X-Google-Smtp-Source: ACHHUZ4DeQtgBYpWTCa9YUWXWDlEycg+YX2NYUxENmkf0GpGHlt+us2Dpq7iHJUuTDYh8Df6ApBq8rf1ewCUs5TI9Fo=
X-Received: by 2002:a05:6214:2427:b0:61a:c2bf:9f0b with SMTP id
 gy7-20020a056214242700b0061ac2bf9f0bmr20819167qvb.6.1683588153435; Mon, 08
 May 2023 16:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000258e5e05fae79fc1@google.com> <20230507135844.1231056-1-lrh2000@pku.edu.cn>
 <CA+CK2bBe2YKYM3rUTCnZ0RF=NFUR9VqO-QYn3ygPsFJWLY1MUA@mail.gmail.com>
 <ZFlrbDft1QfMyIDc@casper.infradead.org> <CA+CK2bDVjovwB9v-Zv4Fn7EUfp5FV2XK36iJKYKY7pYNOFfOGA@mail.gmail.com>
 <ZFlvJEfs1ufh1UUD@casper.infradead.org> <CA+CK2bDC-FVv1tZg9MDn-N735Ak3OAtdZPf+LEYM-JHsO90YcQ@mail.gmail.com>
 <fa1dac7a-406e-30ea-6aba-ded2e0e871fa@redhat.com> <CA+CK2bAHbHHwLUoGJkz8n6mrM5dy7oMojeNksdVOMYn+qFYngA@mail.gmail.com>
In-Reply-To: <CA+CK2bAHbHHwLUoGJkz8n6mrM5dy7oMojeNksdVOMYn+qFYngA@mail.gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 8 May 2023 16:21:57 -0700
Message-ID: <CA+CK2bD=bv1vPGZaNcxDy-uUFj2ZAKkdPmAtJaweXhgTe91oEw@mail.gmail.com>
Subject: Re: usbdev_mmap causes type confusion in page_table_check
To:     David Hildenbrand <david@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Ruihan Li <lrh2000@pku.edu.cn>,
        syzbot+fcf1a817ceb50935ce99@syzkaller.appspotmail.com,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> For normal Kernel-MM operations, vm_normal_page() should be used to
> get "struct page" based on vma+addr+pte combination, but
> page_table_check does not use vma for its operation in order to
> strengthen the verification of no invalid page sharing. But, even
> vm_normal_page() can cause access to the "struct page" for VM_PFNMAP
> if pfn_valid(pfn) is true. So, vm_normal_page() can return a struct
> page for a user mapped slab page.

Only for !ARCH_HAS_PTE_SPECIAL case, otherwise NULL is returned.

Pasha
