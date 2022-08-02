Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C404587DA1
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 15:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237078AbiHBNyw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 09:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237065AbiHBNyc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 09:54:32 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFC631395
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 06:54:03 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id b81so7125255vkf.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Aug 2022 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Xy7orwXJ5fXtQs/TJmbcrHAO7BE1JVxTvodtnVVywPnS/v8QsaKvmqg+J5kHz65eT/
         VPpzZixz5YdDwDHGKRUuR9H4+IjmhRP+9KW2RonOGCi5aPOzyFM1+pI6yiitvK+jR7cH
         d+sOdzJkieuxfyB3F40gO+Ic8vUvRBqKpROEGHZLfp8F1X6PDMtpXTyss/WDbtnYltAM
         kNmWW2yMVfLq2KG1hGY5QCFDZNSrsR+e+fK9eoo/QCcit0S7IQhrzFQupNWyWJqU8ivH
         sRM9+KzjE3/tBSb9VC2W8NC/j8Bmrpg9sfJB6p0VNK1sjfqwwhov1/CkGIYkEmLvjTr9
         XAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=f+Y67a7lA9EaTBG5dt5H5Im4gNcMcMuCdFVNxwzax7YCssHWfwydOUzEigsauiOL8S
         mm/YhSA32cnzi+T6tAxon6BnI+HJJ8CGqpX+T/qdM941yoiw6R9KBKjjnnhHnkPpSJVI
         dBMNZaexcFeNzwgYPqXmr9j6YwUWXtyohASAMn83YCqmqncQdb4/Gx7PIrChjYMd57C4
         arFHxOEbTqWAsQePmEt/tNHvemGtltE7Ogd/d+DmXbvKy/uB0oQ8OjgZJ9QOFkErdRZD
         f9OuVPx8/b6E7kUS5Lo5vgPtnCk6yyvI6xS0Fo9RvMRZSesH1zbgji5rhPVdMOYE3YqP
         R6uA==
X-Gm-Message-State: AJIora9mmTzZnPY4gFipfbOo8xfxalJLR60mJ1EDQ1/C/20fiYjAxCLB
        ocMiWCk++doxy5q3SqGdxASg9oqItNuoKjTMXac=
X-Google-Smtp-Source: AGRyM1vKIXKHWM8YG9PKQ1FuIUVj/pgFTIUIHKgbUYu4u96foiBR1kgQNOB1cv9i5YkMg3FaWVGgJ2EpXAgQ4jkbdgk=
X-Received: by 2002:ac5:c38b:0:b0:374:e94e:5454 with SMTP id
 s11-20020ac5c38b000000b00374e94e5454mr7796310vkk.39.1659448441506; Tue, 02
 Aug 2022 06:54:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:cdb0:0:b0:2d7:4033:2c5e with HTTP; Tue, 2 Aug 2022
 06:54:01 -0700 (PDT)
Reply-To: lken58124@gmail.com
From:   Ken Lawson <engrmorganwalter@gmail.com>
Date:   Tue, 2 Aug 2022 13:54:01 +0000
Message-ID: <CAM5a-p_o-hvgwyMZZPTRuBBGLVgCG1NFPQGSYfLKn0GWdQ2xQQ@mail.gmail.com>
Subject: Did you receive the email I sent for you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


